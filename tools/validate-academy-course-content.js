const fs = require("fs");
const path = require("path");
const vm = require("vm");

const root = path.resolve(__dirname, "..");
const sourcePath = path.join(root, "leal-academy", "js", "academy-course-content.js");
const batchesDir = path.join(root, "leal-academy", "sql", "course-content-batches");
const fullSqlPath = path.join(root, "leal-academy", "sql", "academy-courses-full-module-content.sql");
const baselinePath = path.join(root, "leal-academy", "quality", "course-content-baseline.json");

const MIN_CONTENT_RATIO = 0.92;
const MIN_MATERIAL_RATIO = 0.9;
const MIN_MODULE_CONTENT_CHARS = 250;

function fail(message) {
    console.error(`ERROR: ${message}`);
    process.exitCode = 1;
}

function readText(filePath) {
    return fs.readFileSync(filePath, "utf8");
}

function loadSourceContent() {
    const code = `${readText(sourcePath)}\nglobalThis.__academyCourseContent = academyCourseContent;`;
    const context = {};
    context.window = context;
    vm.createContext(context);
    vm.runInContext(code, context, { filename: sourcePath });
    return context.__academyCourseContent || {};
}

function listSqlFiles() {
    const batchFiles = fs.existsSync(batchesDir)
        ? fs.readdirSync(batchesDir)
            .filter(file => file.endsWith(".sql"))
            .sort()
            .map(file => path.join(batchesDir, file))
        : [];

    return batchFiles.length > 0 ? batchFiles : [fullSqlPath].filter(fs.existsSync);
}

function parseCourseRowsFromSql(sql, fileName) {
    const rows = [];
    const pattern = /\('([^']+)',\s*\$(json_[^$]+)\$([\s\S]*?)\$\2\$::jsonb,\s*\$(mat_[^$]+)\$([\s\S]*?)\$\4\$\)/g;
    let match;

    while ((match = pattern.exec(sql)) !== null) {
        try {
            rows.push({
                id: match[1],
                modules: JSON.parse(match[3]),
                material: match[5]
            });
        } catch (error) {
            fail(`${fileName}: JSON invalido no curso ${match[1]} (${error.message})`);
        }
    }

    return rows;
}

function loadSqlCourses() {
    const courses = new Map();

    for (const filePath of listSqlFiles()) {
        const fileName = path.relative(root, filePath);
        const rows = parseCourseRowsFromSql(readText(filePath), fileName);

        if (rows.length === 0) {
            fail(`${fileName}: nenhum curso encontrado no SQL`);
        }

        for (const row of rows) {
            if (courses.has(row.id)) {
                fail(`${fileName}: curso duplicado no SQL: ${row.id}`);
            }
            courses.set(row.id, row);
        }
    }

    return courses;
}

function normalizeText(value) {
    return String(value || "").replace(/\s+/g, " ").trim();
}

function countSourceChars(modules) {
    return modules.reduce((sum, content) => sum + normalizeText(content).length, 0);
}

function countSqlChars(modules) {
    return modules.reduce((sum, module) => sum + normalizeText(module.content).length, 0);
}

function buildBaseline(sqlCourses) {
    const courses = {};

    for (const [id, course] of sqlCourses.entries()) {
        courses[id] = {
            modules: course.modules.length,
            moduleContentChars: countSqlChars(course.modules),
            materialChars: normalizeText(course.material).length
        };
    }

    return {
        note: "Conteudo minimo aprovado. Atualize este arquivo somente quando uma reducao de conteudo for intencional.",
        generatedFrom: "leal-academy/sql/course-content-batches",
        courses
    };
}

function validateAgainstSource(sourceContent, sqlCourses) {
    for (const [id, sourceModules] of Object.entries(sourceContent)) {
        const sqlCourse = sqlCourses.get(id);
        if (!sqlCourse) {
            fail(`curso ${id} existe na fonte completa, mas nao existe nos SQLs do Supabase`);
            continue;
        }

        const sourceChars = countSourceChars(sourceModules);
        const sqlChars = countSqlChars(sqlCourse.modules);
        const minimum = Math.floor(sourceChars * MIN_CONTENT_RATIO);

        if (sqlCourse.modules.length < sourceModules.length) {
            fail(`curso ${id} perdeu modulos: SQL=${sqlCourse.modules.length}, fonte=${sourceModules.length}`);
        }

        if (sourceChars > 0 && sqlChars < minimum) {
            fail(`curso ${id} esta menor que a fonte completa: SQL=${sqlChars}, minimo=${minimum}, fonte=${sourceChars}`);
        }
    }
}

function validateAgainstBaseline(sqlCourses) {
    if (!fs.existsSync(baselinePath)) {
        fail(`baseline nao encontrado: ${path.relative(root, baselinePath)}`);
        return;
    }

    const baseline = JSON.parse(readText(baselinePath));
    const expectedCourses = baseline.courses || {};

    for (const [id, expected] of Object.entries(expectedCourses)) {
        const sqlCourse = sqlCourses.get(id);
        if (!sqlCourse) {
            fail(`curso ${id} consta no baseline, mas nao existe nos SQLs`);
            continue;
        }

        const moduleContentChars = countSqlChars(sqlCourse.modules);
        const materialChars = normalizeText(sqlCourse.material).length;
        const minContent = Math.floor(expected.moduleContentChars * MIN_CONTENT_RATIO);
        const minMaterial = Math.floor(expected.materialChars * MIN_MATERIAL_RATIO);

        if (sqlCourse.modules.length < expected.modules) {
            fail(`curso ${id} reduziu a quantidade de modulos: atual=${sqlCourse.modules.length}, minimo=${expected.modules}`);
        }

        if (moduleContentChars < minContent) {
            fail(`curso ${id} reduziu conteudo dos modulos: atual=${moduleContentChars}, minimo=${minContent}`);
        }

        if (materialChars < minMaterial) {
            fail(`curso ${id} reduziu material de apoio: atual=${materialChars}, minimo=${minMaterial}`);
        }
    }
}

function validateModuleQuality(sqlCourses) {
    for (const [id, course] of sqlCourses.entries()) {
        if (!Array.isArray(course.modules) || course.modules.length === 0) {
            fail(`curso ${id} esta sem modulos`);
            continue;
        }

        course.modules.forEach((module, index) => {
            const contentLength = normalizeText(module.content).length;
            if (!module.title || !module.type || !module.duration) {
                fail(`curso ${id}, modulo ${index + 1}: metadados incompletos`);
            }
            if (contentLength < MIN_MODULE_CONTENT_CHARS) {
                fail(`curso ${id}, modulo ${index + 1}: conteudo muito curto (${contentLength} caracteres)`);
            }
        });
    }
}

function main() {
    const shouldWriteBaseline = process.argv.includes("--write-baseline");
    const sourceContent = loadSourceContent();
    const sqlCourses = loadSqlCourses();

    if (shouldWriteBaseline) {
        fs.writeFileSync(`${baselinePath}.tmp`, `${JSON.stringify(buildBaseline(sqlCourses), null, 2)}\n`);
        fs.renameSync(`${baselinePath}.tmp`, baselinePath);
        console.log(`Baseline atualizado: ${path.relative(root, baselinePath)}`);
        return;
    }

    validateModuleQuality(sqlCourses);
    validateAgainstSource(sourceContent, sqlCourses);
    validateAgainstBaseline(sqlCourses);

    if (process.exitCode) {
        process.exit(process.exitCode);
    }

    console.log(`OK: ${sqlCourses.size} cursos validados sem perda relevante de conteudo.`);
}

main();
