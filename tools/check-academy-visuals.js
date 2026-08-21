const fs = require("fs");
const path = require("path");
const vm = require("vm");

const root = path.resolve(__dirname, "..");
const dataPath = path.join(root, "leal-academy", "js", "academy-data.js");
const appPath = path.join(root, "leal-academy", "js", "academy.js");

function loadContext(){
    const context = {
        console,
        window: {},
        document: {
            querySelector(){ return null; },
            querySelectorAll(){ return []; },
            getElementById(){ return null; },
            addEventListener(){}
        },
        localStorage: {
            getItem(){ return null; },
            setItem(){}
        },
        URLSearchParams
    };

    vm.createContext(context);

    vm.runInContext(
        fs.readFileSync(dataPath, "utf8") + "\nglobalThis.__academyCourses = academyCourses;",
        context
    );

    vm.runInContext(
        fs.readFileSync(appPath, "utf8") + "\nglobalThis.__lessonMediaProfiles = lessonMediaProfiles;",
        context
    );

    return context;
}

const context = loadContext();
const courses = context.__academyCourses || [];
const profiles = context.__lessonMediaProfiles || {};
const allowedKinds = new Set([
    "tag",
    "route",
    "match",
    "damage",
    "security",
    "service",
    "form",
    "found",
    "flow"
]);

const errors = [];
const warnings = [];

courses.forEach(course => {
    const modules = course.modules || [];
    const courseProfiles = profiles[course.id] || [];

    if(courseProfiles.length !== modules.length){
        errors.push(`${course.id}: possui ${modules.length} trilhas, mas ${courseProfiles.length} perfis visuais.`);
    }

    modules.forEach((module, index) => {
        const profile = courseProfiles[index];
        const label = `${course.id} / trilha ${index + 1} / ${module.title}`;

        if(!profile){
            errors.push(`${label}: perfil visual ausente.`);
            return;
        }

        if(!allowedKinds.has(profile.kind)){
            errors.push(`${label}: tipo visual invalido "${profile.kind}".`);
        }

        if(!Array.isArray(profile.labels) || profile.labels.length !== 4){
            errors.push(`${label}: precisa ter exatamente 4 rotulos.`);
            return;
        }

        profile.labels.forEach(item => {
            const text = String(item || "").trim();

            if(text.length === 0){
                errors.push(`${label}: rotulo vazio.`);
            }

            if(text.length > 16){
                errors.push(`${label}: rotulo longo demais para a arte: "${text}".`);
            }

            if(/\s{2,}/.test(text)){
                warnings.push(`${label}: rotulo com espacos duplicados: "${text}".`);
            }
        });

        if(!profile.caption || String(profile.caption).trim().length < 18){
            warnings.push(`${label}: legenda visual muito curta.`);
        }
    });
});

if(warnings.length){
    console.warn("Avisos:");
    warnings.forEach(item => console.warn(`- ${item}`));
}

if(errors.length){
    console.error("Erros encontrados nas imagens das trilhas:");
    errors.forEach(item => console.error(`- ${item}`));
    process.exit(1);
}

console.log(`OK: ${courses.length} cursos verificados e ${Object.values(profiles).flat().length} imagens de trilha validadas.`);
