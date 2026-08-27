const fs = require("fs");
const path = require("path");
const vm = require("vm");

const root = path.resolve(__dirname, "..");
const sourcePath = path.join(root, "leal-academy", "js", "academy-course-content.js");
const sqlDir = path.join(root, "leal-academy", "sql");
const batchesDir = path.join(root, "leal-academy", "sql", "course-content-batches");
const fullSqlPath = path.join(root, "leal-academy", "sql", "academy-courses-full-module-content.sql");
const baselinePath = path.join(root, "leal-academy", "quality", "course-content-baseline.json");

const MIN_CONTENT_RATIO = 0.92;
const MIN_MATERIAL_RATIO = 0.9;
const MIN_MODULE_CONTENT_CHARS = 40;

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

    const seedSqlFiles = [
        "academy-courses-missing-from-local.sql",
        "academy-courses-bagagem-avancados.sql",
        "academy-course-chart-iata.sql"
    ]
        .map(file => path.join(sqlDir, file))
        .filter(fs.existsSync);
    const overrideSqlFiles = [
        "academy-course-etiqueta-airports-phonetic.sql",
        "academy-course-action-file-avancado.sql",
        "academy-course-entrevista-desembarque.sql"
    ]
        .map(file => path.join(sqlDir, file))
        .filter(fs.existsSync);

    return batchFiles.length > 0
        ? [...seedSqlFiles, ...batchFiles, ...overrideSqlFiles]
        : [...seedSqlFiles, fullSqlPath, ...overrideSqlFiles].filter(fs.existsSync);
}

function splitSqlFields(fieldsText) {
    const fields = [];
    let current = "";
    let quote = null;
    let dollarTag = null;

    for (let index = 0; index < fieldsText.length; index += 1) {
        const char = fieldsText[index];

        if (dollarTag) {
            if (fieldsText.startsWith(dollarTag, index)) {
                current += dollarTag;
                index += dollarTag.length - 1;
                dollarTag = null;
            } else {
                current += char;
            }
            continue;
        }

        if (quote) {
            current += char;
            if (char === quote) {
                if (fieldsText[index + 1] === quote) {
                    current += fieldsText[index + 1];
                    index += 1;
                } else {
                    quote = null;
                }
            }
            continue;
        }

        if (char === "'") {
            quote = char;
            current += char;
            continue;
        }

        if (char === "$") {
            const tagMatch = fieldsText.slice(index).match(/^\$[A-Za-z0-9_]*\$/);
            if (tagMatch) {
                dollarTag = tagMatch[0];
                current += dollarTag;
                index += dollarTag.length - 1;
                continue;
            }
        }

        if (char === ",") {
            fields.push(current.trim());
            current = "";
            continue;
        }

        current += char;
    }

    if (current.trim()) {
        fields.push(current.trim());
    }

    return fields;
}

function extractTopLevelTuples(valuesText) {
    const tuples = [];
    let current = "";
    let depth = 0;
    let quote = null;
    let dollarTag = null;

    for (let index = 0; index < valuesText.length; index += 1) {
        const char = valuesText[index];

        if (dollarTag) {
            if (valuesText.startsWith(dollarTag, index)) {
                current += dollarTag;
                index += dollarTag.length - 1;
                dollarTag = null;
            } else if (depth > 0) {
                current += char;
            }
            continue;
        }

        if (quote) {
            if (depth > 0) {
                current += char;
            }
            if (char === quote) {
                if (valuesText[index + 1] === quote) {
                    if (depth > 0) {
                        current += valuesText[index + 1];
                    }
                    index += 1;
                } else {
                    quote = null;
                }
            }
            continue;
        }

        if (char === "'") {
            quote = char;
            if (depth > 0) {
                current += char;
            }
            continue;
        }

        if (char === "$") {
            const tagMatch = valuesText.slice(index).match(/^\$[A-Za-z0-9_]*\$/);
            if (tagMatch) {
                dollarTag = tagMatch[0];
                if (depth > 0) {
                    current += dollarTag;
                }
                index += dollarTag.length - 1;
                continue;
            }
        }

        if (char === "(") {
            if (depth > 0) {
                current += char;
            }
            depth += 1;
            continue;
        }

        if (char === ")") {
            depth -= 1;
            if (depth === 0) {
                tuples.push(current.trim());
                current = "";
            } else if (depth > 0) {
                current += char;
            }
            continue;
        }

        if (depth > 0) {
            current += char;
        }
    }

    return tuples;
}

function stripSqlCast(value) {
    return value.replace(/::[a-z0-9_]+$/i, "").trim();
}

function parseSqlString(value) {
    const cleanValue = stripSqlCast(value);
    const dollarMatch = cleanValue.match(/^\$([A-Za-z0-9_]*)\$([\s\S]*)\$\1\$$/);
    if (dollarMatch) {
        return dollarMatch[2];
    }

    if (cleanValue.startsWith("'") && cleanValue.endsWith("'")) {
        return cleanValue.slice(1, -1).replace(/''/g, "'");
    }

    return cleanValue;
}

function parseInsertRowsFromSql(sql, fileName) {
    const rows = [];
    const insertPattern = /insert\s+into\s+public\.academy_courses\s*\(([\s\S]*?)\)\s*values\s*\(([\s\S]*?)\)\s*on\s+conflict/gi;
    let match;

    while ((match = insertPattern.exec(sql)) !== null) {
        const columns = match[1].split(",").map(column => column.trim().replace(/"/g, ""));
        const fields = splitSqlFields(match[2]);
        const record = {};

        columns.forEach((column, index) => {
            record[column] = fields[index];
        });

        if (!record.id || !record.modules) {
            continue;
        }

        const id = parseSqlString(record.id);
        try {
            rows.push({
                id,
                modules: JSON.parse(parseSqlString(record.modules)),
                material: record.material ? parseSqlString(record.material) : ""
            });
        } catch (error) {
            fail(`${fileName}: JSON invalido no insert do curso ${id} (${error.message})`);
        }
    }

    return rows;
}

function parseCourseSeedRowsFromSql(sql, fileName) {
    const rows = [];
    const valuesIndex = sql.search(/with\s+course_seed\s+as[\s\S]*?\bvalues\b/i);
    const columnsMatch = sql.match(/\)\s+as\s+t\s*\(([^)]*)\)/i);

    if (valuesIndex === -1 || !columnsMatch) {
        return rows;
    }

    const valuesKeywordMatch = sql.slice(valuesIndex).match(/\bvalues\b/i);
    const valuesStart = valuesIndex + valuesKeywordMatch.index + valuesKeywordMatch[0].length;
    const valuesEnd = columnsMatch.index;
    const valuesText = sql.slice(valuesStart, valuesEnd);
    const columns = columnsMatch[1].split(",").map(column => column.trim().replace(/"/g, ""));
    const tuples = extractTopLevelTuples(valuesText);

    for (const tuple of tuples) {
        const fields = splitSqlFields(tuple);
        const record = {};

        columns.forEach((column, index) => {
            record[column] = fields[index];
        });

        if (!record.id || !record.modules) {
            continue;
        }

        const id = parseSqlString(record.id);
        try {
            rows.push({
                id,
                modules: JSON.parse(parseSqlString(record.modules)),
                material: record.material ? parseSqlString(record.material) : ""
            });
        } catch (error) {
            fail(`${fileName}: JSON invalido no course_seed do curso ${id} (${error.message})`);
        }
    }

    return rows;
}

function parseUpdateRowsFromSql(sql, fileName) {
    const rows = [];
    const updatePattern = /update\s+public\.academy_courses\s+set\s+([\s\S]*?)\s+where\s+id\s*=\s*'([^']+)'/gi;
    let match;

    while ((match = updatePattern.exec(sql)) !== null) {
        const fields = splitSqlFields(match[1]);
        const updates = {};

        for (const field of fields) {
            const separatorIndex = field.indexOf("=");
            if (separatorIndex === -1) {
                continue;
            }

            const key = field.slice(0, separatorIndex).trim().replace(/"/g, "");
            const value = field.slice(separatorIndex + 1).trim();
            updates[key] = value;
        }

        if (!updates.modules) {
            continue;
        }

        const id = match[2];
        const modulesValue = stripSqlCast(updates.modules);
        if (!modulesValue.startsWith("'") && !modulesValue.startsWith("$")) {
            continue;
        }

        try {
            rows.push({
                id,
                modules: JSON.parse(parseSqlString(modulesValue)),
                material: updates.material ? parseSqlString(updates.material) : ""
            });
        } catch (error) {
            fail(`${fileName}: JSON invalido no update do curso ${id} (${error.message})`);
        }
    }

    return rows;
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

    return [
        ...rows,
        ...parseCourseSeedRowsFromSql(sql, fileName),
        ...parseInsertRowsFromSql(sql, fileName),
        ...parseUpdateRowsFromSql(sql, fileName)
    ];
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
            const previous = courses.get(row.id);
            courses.set(row.id, {
                id: row.id,
                modules: row.modules.length > 0 ? row.modules : previous?.modules || [],
                material: normalizeText(row.material).length > 0 ? row.material : previous?.material || ""
            });
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
        generatedFrom: "leal-academy/sql/course-content-batches + SQLs complementares de cursos",
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
