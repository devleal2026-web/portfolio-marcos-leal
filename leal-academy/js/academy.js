const localAcademyCourses = Array.isArray(academyCourses)
    ? JSON.parse(JSON.stringify(academyCourses))
    : [];

function restoreLocalAcademyCourses(){
    if(!Array.isArray(academyCourses) || academyCourses.length > 0){
        return;
    }

    if(localAcademyCourses.length === 0){
        return;
    }

    academyCourses.splice(
        0,
        academyCourses.length,
        ...JSON.parse(JSON.stringify(localAcademyCourses))
    );
}
restoreLocalAcademyCourses();

const state = {
    selectedCourseId: (academyCourses[0] || {}).id || "",
    selectedModuleIndex: 0,
    quizAnswers: {},
    assessmentOpen: {}
};

const storageKey = "airportBaggageAcademyProgress";
const quizStorageKey = "airportBaggageAcademyQuiz";

const courseVisuals = {
    "bagagem-extraviada": { image: "linear-gradient(135deg, rgba(16,185,129,.92), rgba(14,116,144,.88)), url('https://images.unsplash.com/photo-1436491865332-7a61a109cc05?auto=format&fit=crop&w=900&q=80')", icon: "case" },
    "objetos-esquecidos": { image: "linear-gradient(135deg, rgba(37,99,235,.9), rgba(8,145,178,.84)), url('https://images.unsplash.com/photo-1517404215738-15263e9f9178?auto=format&fit=crop&w=900&q=80')", icon: "tag" },
    "avsec": { image: "linear-gradient(135deg, rgba(30,64,175,.92), rgba(15,23,42,.86)), url('https://images.unsplash.com/photo-1556388158-158ea5ccacbd?auto=format&fit=crop&w=900&q=80')", icon: "shield" },
    "manuseio-bagagem": { image: "linear-gradient(135deg, rgba(249,115,22,.9), rgba(127,29,29,.82)), url('https://images.unsplash.com/photo-1529074963764-98f45c47344b?auto=format&fit=crop&w=900&q=80')", icon: "vest" },
    "worldtracer-completo": { image: "linear-gradient(135deg, rgba(37,99,235,.9), rgba(88,28,135,.84)), url('https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=900&q=80')", icon: "globe" },
    "atendimento-cliente-aviacao": { image: "linear-gradient(135deg, rgba(20,184,166,.9), rgba(21,94,117,.84)), url('https://images.unsplash.com/photo-1521791136064-7986c2920216?auto=format&fit=crop&w=900&q=80')", icon: "person" },
    "boas-praticas-atendimento": { image: "linear-gradient(135deg, rgba(34,197,94,.9), rgba(21,128,61,.84)), url('https://images.unsplash.com/photo-1552664730-d307ca884978?auto=format&fit=crop&w=900&q=80')", icon: "check" },
    "bagagem-violada": { image: "linear-gradient(135deg, rgba(220,38,38,.92), rgba(127,29,29,.86)), url('https://images.unsplash.com/photo-1499914485622-a88fac536970?auto=format&fit=crop&w=900&q=80')", icon: "lock" },
    "bagagem-danificada": { image: "linear-gradient(135deg, rgba(245,158,11,.94), rgba(194,65,12,.84)), url('https://images.unsplash.com/photo-1565026057447-bc90a3dceb87?auto=format&fit=crop&w=900&q=80')", icon: "damage" },
    "tratativa-rl-mct": { image: "linear-gradient(135deg, rgba(124,58,237,.9), rgba(49,46,129,.84)), url('https://images.unsplash.com/photo-1488646953014-85cb44e25828?auto=format&fit=crop&w=900&q=80')", icon: "route" },
    "bagagem-sem-etiqueta-ohd": { image: "linear-gradient(135deg, rgba(202,138,4,.92), rgba(113,63,18,.84)), url('https://images.unsplash.com/photo-1553531889-e6cf4d692b1b?auto=format&fit=crop&w=900&q=80')", icon: "tag" },
    "lideranca-bagagem-extraviada": { image: "linear-gradient(135deg, rgba(15,118,110,.92), rgba(12,74,110,.84)), url('https://images.unsplash.com/photo-1517048676732-d65bc937f952?auto=format&fit=crop&w=900&q=80')", icon: "leader" },
    "atendimento-pcd": { image: "linear-gradient(135deg, rgba(8,145,178,.92), rgba(30,64,175,.84)), url('https://images.unsplash.com/photo-1573497491208-6b1acb260507?auto=format&fit=crop&w=900&q=80')", icon: "access" }
};
const lessonMediaProfiles = {
    "fundamentos": { image: "https://images.unsplash.com/photo-1556761175-b413da4baf72?auto=format&fit=crop&w=1200&q=82", query: "atendimento aeroportuario passageiros treinamento" },
    "bagagem-extraviada": { image: "https://images.unsplash.com/photo-1436491865332-7a61a109cc05?auto=format&fit=crop&w=1200&q=82", query: "worldtracer AHL lost baggage training" },
    "objetos-esquecidos": { image: "https://images.unsplash.com/photo-1517404215738-15263e9f9178?auto=format&fit=crop&w=1200&q=82", query: "airport lost and found property procedure", videos: { 0: "../assets/academy-videos/rfp-trilha-01-definicao-responsabilidade-v2.mp4" } },
    "avsec": { image: "https://images.unsplash.com/photo-1556388158-158ea5ccacbd?auto=format&fit=crop&w=1200&q=82", query: "aviation security AVSEC airport training" },
    "manuseio-bagagem": { image: "https://images.unsplash.com/photo-1529074963764-98f45c47344b?auto=format&fit=crop&w=1200&q=82", query: "airport baggage handling ramp training" },
    "worldtracer-completo": { image: "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=1200&q=82", query: "WorldTracer baggage tracing system training" },
    "atendimento-cliente-aviacao": { image: "https://images.unsplash.com/photo-1521791136064-7986c2920216?auto=format&fit=crop&w=1200&q=82", query: "airport customer service training" },
    "boas-praticas-atendimento": { image: "https://images.unsplash.com/photo-1552664730-d307ca884978?auto=format&fit=crop&w=1200&q=82", query: "customer service excellence aviation training" },
    "bagagem-violada": { image: "https://images.unsplash.com/photo-1499914485622-a88fac536970?auto=format&fit=crop&w=1200&q=82", query: "baggage pilferage claim airport training" },
    "bagagem-danificada": { image: "https://images.unsplash.com/photo-1565026057447-bc90a3dceb87?auto=format&fit=crop&w=1200&q=82", query: "damaged baggage claim airport training" },
    "tratativa-rl-mct": { image: "https://images.unsplash.com/photo-1488646953014-85cb44e25828?auto=format&fit=crop&w=1200&q=82", query: "airport baggage connection MCT training" },
    "bagagem-sem-etiqueta-ohd": { image: "https://images.unsplash.com/photo-1553531889-e6cf4d692b1b?auto=format&fit=crop&w=1200&q=82", query: "on hand baggage OHD WorldTracer training" },
    "ahl": { image: "https://images.unsplash.com/photo-1542296332-2e4473faf563?auto=format&fit=crop&w=1200&q=82", query: "AHL delayed baggage WorldTracer" },
    "ohd": { image: "https://images.unsplash.com/photo-1569154941061-e231b4725ef1?auto=format&fit=crop&w=1200&q=82", query: "OHD on hand baggage WorldTracer" },
    "matches": { image: "https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?auto=format&fit=crop&w=1200&q=82", query: "baggage tracing match lost found luggage" },
    "dpr": { image: "https://images.unsplash.com/photo-1518546305927-5a555bb7020d?auto=format&fit=crop&w=1200&q=82", query: "DPR damaged baggage report WorldTracer" },
    "lideranca-bagagem-extraviada": { image: "https://images.unsplash.com/photo-1517048676732-d65bc937f952?auto=format&fit=crop&w=1200&q=82", query: "airport baggage service leadership training" },
    "atendimento-pcd": { image: "https://images.unsplash.com/photo-1573497491208-6b1acb260507?auto=format&fit=crop&w=1200&q=82", query: "airport accessibility passenger assistance training" }
};
const courseIntroVideos = {
    "objetos-esquecidos": {
        title: "Resumo do curso",
        subtitle: "RFP - visao geral operacional",
        description: "Assista antes das trilhas para entender o fluxo completo de registro, armazenamento, transporte e entrega de objetos esquecidos.",
        src: "../assets/academy-videos/rfp-curso-resumo.mp4"
    }
};
const lessonScreenshots = {
    "bagagem-extraviada": {
        default: [
            {
                title: "Abertura de AHL no sistema",
                caption: "Exemplo visual dos campos TN, CT, BI, BW, FD, RT, NM, contatos e endereco do passageiro.",
                src: "../assets/academy-screenshots/ahl-fd-rt-passageiro.svg"
            }
        ],
        0: [
            {
                title: "Campos obrigatorios do AHL",
                caption: "Use o print para localizar os campos essenciais durante a abertura da ocorrencia de bagagem extraviada.",
                src: "../assets/academy-screenshots/ahl-fd-rt-passageiro.svg"
            }
        ]
    },
    "worldtracer-completo": {
        default: [
            {
                title: "Mascara SITA WorldTracer",
                caption: "Visualizacao em formato operacional, aproximando o aluno da mascara usada nas transacoes WorldTracer.",
                src: "../assets/academy-screenshots/worldtracer-sita-ahl.svg"
            }
        ]
    },
    "bagagem-sem-etiqueta-ohd": {
        default: [
            {
                title: "OHD e campo de contents",
                caption: "Exemplo do preenchimento de CC com conteudo detalhado e dos dados usados para envio da bagagem.",
                src: "../assets/academy-screenshots/ohd-cc-conteudo.svg"
            }
        ]
    },
    "bagagem-danificada": {
        default: [
            {
                title: "DPR - registro do dano",
                caption: "Exemplo de selecao de elemento, localizacao e extensao do dano na mascara de DPR.",
                src: "../assets/academy-screenshots/dpr-dano-localizacao.svg"
            }
        ]
    },
    "bagagem-violada": {
        default: [
            {
                title: "AHL com registro complementar",
                caption: "A trilha de violacao usa a mesma base de ocorrencia, reforcando onde registrar dados, contatos e observacoes.",
                src: "../assets/academy-screenshots/ahl-fd-rt-passageiro.svg"
            }
        ]
    },
    "tratativa-rl-mct": {
        default: [
            {
                title: "Campos FD e RT para analise operacional",
                caption: "O print destaca voo/data e rota, campos usados na analise de conexao, MCT e Reason for Loss.",
                src: "../assets/academy-screenshots/ahl-fd-rt-passageiro.svg"
            }
        ]
    }
};
const msbCoursePages = {
    "fundamentos": [7, 8, 9, 10, 11, 12, 13],
    "boas-praticas-atendimento": [7, 8, 9, 10, 11, 12, 13],
    "atendimento-cliente-aviacao": [7, 8, 9, 10, 11, 12, 13],
    "atendimento-pcd": [7, 8, 9, 10, 11, 12, 13],
    "manuseio-bagagem": [7, 8, 9, 10, 11, 12, 13],

    "bagagem-extraviada": [14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24],
    "ahl": [14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24],
    "worldtracer-completo": [14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24],
    "lideranca-bagagem-extraviada": [14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24],

    "bagagem-sem-etiqueta-ohd": [69, 70, 71, 72],
    "ohd": [69, 70, 71, 72],
    "matches": [69, 70, 71, 72],

    "bagagem-danificada": [73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84],
    "dpr": [73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84],

    "bagagem-violada": [91, 92, 93],
    "tratativa-rl-mct": [95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109],
    "objetos-esquecidos": [113, 114, 115, 116]
};
function readJson(key){
    try{
        return JSON.parse(localStorage.getItem(key)) || {};
    }catch{
        return {};
    }
}

function saveJson(key, value){
    localStorage.setItem(key, JSON.stringify(value));
}

function readProgress(){
    return readJson(storageKey);
}

function saveProgress(progress){
    saveJson(storageKey, progress);
}

function readQuizResults(){
    return readJson(quizStorageKey);
}

function saveQuizResults(results){
    saveJson(quizStorageKey, results);
}

function courseProgress(course){
    const modules = courseModules(course);
    if(modules.length === 0){
        return 0;
    }

    const progress = readProgress();
    const done = progress[course.id] || [];
    return Math.round((done.length / modules.length) * 100);
}

function selectedCourse(){
    restoreLocalAcademyCourses();
    return academyCourses.find(course => course.id === state.selectedCourseId) || academyCourses[0] || null;
}


function stripEmoji(value){
    return String(value ?? "")
        .replace(/[\uD800-\uDBFF][\uDC00-\uDFFF]/g, "")
        .replace(/[\u2600-\u27BF]/g, "")
        .replace(/[\uFE0F]/g, "");
}
function escapeHtml(value){
    return String(value ?? "")
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;")
        .replace(/"/g, "&quot;")
        .replace(/'/g, "&#039;");
}

function courseVisual(course){
    const visual = courseVisuals[course.id] || {
        image: `linear-gradient(135deg, ${course.color}, #0f172a)`,
        icon: "case"
    };

    return {
        ...visual,
        image: `linear-gradient(135deg, ${course.color}d9, rgba(15,23,42,.72)), url('../assets/academy-covers/${course.id}.svg')`
    };
}

function iconSvg(type){
    const icons = {
        case: '<svg viewBox="0 0 64 64"><rect x="14" y="20" width="36" height="32" rx="5"/><path d="M24 20v-5h16v5"/><path d="M24 28v18M40 28v18"/></svg>',
        tag: '<svg viewBox="0 0 64 64"><path d="M12 30 30 12h18l4 4v18L34 52z"/><circle cx="41" cy="23" r="4"/></svg>',
        shield: '<svg viewBox="0 0 64 64"><path d="M32 8 50 15v13c0 13-7 22-18 28C21 50 14 41 14 28V15z"/><path d="M24 31l6 6 12-14"/></svg>',
        vest: '<svg viewBox="0 0 64 64"><path d="M22 10h20l8 14v30H14V24z"/><path d="M32 10v44M17 35h30"/></svg>',
        globe: '<svg viewBox="0 0 64 64"><circle cx="32" cy="32" r="23"/><path d="M9 32h46M32 9c8 8 8 38 0 46M32 9c-8 8-8 38 0 46"/></svg>',
        person: '<svg viewBox="0 0 64 64"><circle cx="32" cy="19" r="9"/><path d="M16 54c2-13 10-20 16-20s14 7 16 20"/></svg>',
        check: '<svg viewBox="0 0 64 64"><circle cx="32" cy="32" r="23"/><path d="M20 33l8 8 17-19"/></svg>',
        lock: '<svg viewBox="0 0 64 64"><rect x="16" y="28" width="32" height="24" rx="4"/><path d="M24 28v-8a8 8 0 0 1 16 0v8"/><path d="M32 36v8"/></svg>',
        damage: '<svg viewBox="0 0 64 64"><path d="M32 8 38 25 56 20 43 34 53 50 34 43 22 56 24 38 8 31 26 26z"/></svg>',
        route: '<svg viewBox="0 0 64 64"><circle cx="16" cy="48" r="6"/><circle cx="48" cy="16" r="6"/><path d="M20 44c12-18 24 0 28-22"/></svg>',
        leader: '<svg viewBox="0 0 64 64"><circle cx="32" cy="16" r="7"/><circle cx="16" cy="30" r="6"/><circle cx="48" cy="30" r="6"/><path d="M22 54c2-11 7-17 10-17s8 6 10 17M6 54c1-9 5-14 10-14M58 54c-1-9-5-14-10-14"/></svg>',
        access: '<svg viewBox="0 0 64 64"><circle cx="32" cy="12" r="5"/><path d="M18 24h28M32 18v18l12 18M32 36 20 54"/><circle cx="32" cy="44" r="14"/></svg>'
    };

    return icons[type] || icons.case;
}

function materialForCourse(course){
    if(course && course.material){
        return String(course.material || "").trim();
    }

    if(typeof academyMaterials === "undefined"){
        return "";
    }

    return String(academyMaterials[course.id] || "").trim();
}

function materialSections(course){
    const material = materialForCourse(course);

    if(!material){
        return [];
    }

    const clean = material
        .replace(/\r\n/g, "\n")
        .replace(/\n{4,}/g, "\n\n\n")
        .trim();

    const slideSections = clean
        .split(/\n(?=Slide\b|M[ÓO]DULO\b|CURSO\b|VIOLAÇÃO\b|DANIFICAÇÃO\b|BAGAGEM\b|O que é)/i)
        .map(section => section.trim())
        .filter(section => section.length > 0);

    if(slideSections.length > 1){
        return slideSections;
    }

    return clean
        .split(/\n\s*"(?=[^"\n]{8,})/)
        .map(section => section.replace(/^"|"$/g, "").trim())
        .filter(section => section.length > 0);
}

function splitLargeSection(section, moduleCount){
    const paragraphs = String(section || "")
        .split(/\n{2,}/)
        .map(part => part.trim())
        .filter(Boolean);

    if(paragraphs.length <= moduleCount){
        return paragraphs.length > 0 ? paragraphs : [section];
    }

    const chunks = [];

    for(let index = 0; index < moduleCount; index++){
        const start = Math.floor((paragraphs.length * index) / moduleCount);
        const end = Math.max(start + 1, Math.floor((paragraphs.length * (index + 1)) / moduleCount));
        chunks.push(paragraphs.slice(start, end).join("\n\n"));
    }

    return chunks;
}

function lessonKeywords(value){
    const stopWords = new Set([
        "curso", "trilha", "aula", "pratica", "pratico", "consulta", "simulacao",
        "dados", "procedimento", "introducao", "operacional", "completo", "bagagem",
        "cliente", "passageiro", "passageiros", "sistema", "campo", "campos"
    ]);

    return stripEmoji(value)
        .toLowerCase()
        .normalize("NFD")
        .replace(/[\u0300-\u036f]/g, "")
        .replace(/[^a-z0-9\s]/g, " ")
        .split(/\s+/)
        .filter(word => word.length >= 3 && !stopWords.has(word));
}

function scoreSectionForModule(section, module){
    const haystack = stripEmoji(section)
        .toLowerCase()
        .normalize("NFD")
        .replace(/[\u0300-\u036f]/g, "");

    const titleTokens = lessonKeywords(module.title || "");
    const contentTokens = lessonKeywords(module.content || "").slice(0, 10);
    const tokens = [...new Set([...titleTokens, ...contentTokens])];

    const words = haystack
        .replace(/[^a-z0-9\s]/g, " ")
        .split(/\s+/)
        .filter(Boolean);

    return tokens.reduce((score, token) => {
        if(!token){
            return score;
        }

        return score + words.filter(word => word === token).length;
    }, 0);}

function distributedLessonMaterial(sections, moduleIndex, moduleCount){
    if(sections.length === 1 && moduleCount > 1){
        const chunks = splitLargeSection(sections[0], moduleCount);
        return (chunks[moduleIndex] || chunks[0] || "").trim();
    }

    const start = Math.floor((sections.length * moduleIndex) / moduleCount);
    const end = Math.max(start + 1, Math.floor((sections.length * (moduleIndex + 1)) / moduleCount));

    return sections.slice(start, end).join("\n\n").trim();
}

function lessonMaterial(course, moduleIndex){
    const sections = materialSections(course);

    if(sections.length === 0){
        return "";
    }

    const modules = courseModules(course);
    const module = modules[moduleIndex] || modules[0] || {};
    const moduleCount = Math.max(modules.length, 1);

    const scored = sections
        .map((section, index) => ({
            section,
            index,
            score: scoreSectionForModule(section, module)
        }))
        .filter(item => item.score > 0)
        .sort((a, b) => b.score - a.score || a.index - b.index);

    if(scored.length > 0){
        const selected = scored.slice(0, 2).sort((a, b) => a.index - b.index);
        return selected.map(item => item.section).join("\n\n").trim();
    }

    return distributedLessonMaterial(sections, moduleIndex, moduleCount);
}
function chunkLessonText(text, maxLength = 1200){
    const clean = String(text || "").trim();

    if(clean.length <= maxLength){
        return clean ? [clean] : [];
    }

    const chunks = [];
    let current = "";
    const sentences = clean.split(/(?<=[.!?])\s+(?=[A-ZÁÉÍÓÚÂÊÔÃÕÇ0-9])/);

    sentences.forEach(sentence => {
        if((current + " " + sentence).trim().length > maxLength && current){
            chunks.push(current.trim());
            current = sentence;
            return;
        }

        current = (current + " " + sentence).trim();
    });

    if(current){
        chunks.push(current.trim());
    }

    return chunks.length > 0 ? chunks : [clean.slice(0, maxLength).trim()];
}

function lessonParagraphs(course){
    const material = materialForCourse(course);

    if(!material){
        return [];
    }

    const clean = material
        .replace(/\r\n/g, "\n")
        .replace(/[ \t]{2,}/g, " ")
        .replace(/\n{4,}/g, "\n\n")
        .trim();

    return clean
        .split(/\n{2,}|\n(?=Slide\b|M[ÓO]DULO\b|\d+(?:\.\d+)*\.?\s+[A-ZÁÉÍÓÚÂÊÔÃÕÇ]|[A-ZÁÉÍÓÚÂÊÔÃÕÇ ]{8,}$)/im)
        .map(part => part.trim())
        .filter(part => part.length > 30)
        .flatMap(part => chunkLessonText(part, 1200));
}

function fallbackParagraphSelection(paragraphs, moduleIndex, moduleCount){
    const maxBlocks = 4;

    if(paragraphs.length === 0){
        return "";
    }

    const start = Math.floor((paragraphs.length * moduleIndex) / moduleCount);
    const end = Math.max(start + 1, Math.floor((paragraphs.length * (moduleIndex + 1)) / moduleCount));

    return paragraphs
        .slice(start, end)
        .slice(0, maxBlocks)
        .join("\n\n")
        .trim();
}

function lessonMaterial(course, moduleIndex){
    const paragraphs = lessonParagraphs(course);

    if(paragraphs.length === 0){
        return "";
    }

    const modules = courseModules(course);
    const module = modules[moduleIndex] || modules[0] || {};
    const moduleCount = Math.max(modules.length, 1);

    const scored = paragraphs
        .map((paragraph, index) => ({
            paragraph,
            index,
            score: scoreSectionForModule(paragraph, module)
        }))
        .filter(item => item.score > 0)
        .sort((a, b) => b.score - a.score || a.index - b.index);

    if(scored.length > 0){
        return scored
            .slice(0, 4)
            .sort((a, b) => a.index - b.index)
            .map(item => item.paragraph)
            .join("\n\n")
            .trim();
    }

    return fallbackParagraphSelection(paragraphs, moduleIndex, moduleCount);
}
function normalizeQuizQuestion(question){
    if(!question || !Array.isArray(question.options)){
        return question;
    }

    if(Number.isInteger(question.correct)){
        return question;
    }

    const answer = String(question.answer || "").trim();
    const correct = question.options.findIndex(option => String(option).trim() === answer);

    return {
        question: question.question,
        options: question.options,
        correct: correct >= 0 ? correct : 0
    };
}

function normalizeQuiz(course){
    course.quiz = (course.quiz || []).map(normalizeQuizQuestion);
    return course.quiz;
}

function compactText(value, limit = 160){
    const clean = stripEmoji(value).replace(/\s+/g, " ").trim();
    if(clean.length <= limit){
        return clean;
    }

    return clean.slice(0, limit - 3).trim() + "...";
}

function titleFromSection(section, index){
    const firstLine = stripEmoji(section)
        .split("\n")
        .map(line => line.trim())
        .find(Boolean) || `Trilha ${index + 1}`;

    return firstLine
        .replace(/^\d+\.\s*/, "")
        .replace(/^\[.*?\]\s*/, "")
        .slice(0, 72);
}

function autoModulesForCourse(course){
    const sections = materialSections(course);

    if(sections.length === 0){
        return [{
            title: course.title || "Introducao",
            type: "Trilha",
            duration: course.duration || "Livre",
            content: course.summary || "Conteudo em preparacao."
        }];
    }

    const desiredCount = Math.min(6, Math.max(3, sections.length));
    const modules = [];

    for(let index = 0; index < desiredCount; index++){
        const start = Math.floor((sections.length * index) / desiredCount);
        const end = Math.max(start + 1, Math.floor((sections.length * (index + 1)) / desiredCount));
        const chunk = sections.slice(start, end).join("\n\n");

        modules.push({
            title: titleFromSection(chunk, index),
            type: index === 0 ? "Introducao" : "Trilha",
            duration: "Leitura guiada",
            content: compactText(chunk, 220)
        });
    }

    return modules;
}

function courseModules(course){
    if(Array.isArray(course.modules) && course.modules.length > 0){
        return course.modules;
    }

    course.modules = autoModulesForCourse(course);
    return course.modules;
}

function currentModule(course){
    const modules = courseModules(course);

    if(state.selectedModuleIndex >= modules.length){
        state.selectedModuleIndex = 0;
    }

    return modules[state.selectedModuleIndex] || modules[0];
}

function lessonMedia(course, module, moduleIndex){
    const profile = lessonMediaProfiles[course.id] || lessonMediaProfiles.fundamentos;
    const query = encodeURIComponent(`${profile.query} ${module.title}`);
    const videoUrl = `https://www.youtube.com/embed?listType=search&list=${query}`;
    const watchUrl = `https://www.youtube.com/results?search_query=${query}`;

    const localVideo = profile.videos && profile.videos[moduleIndex];
    const videoEmbed = localVideo
        ? `<video class="lesson-local-video" controls preload="metadata" src="${localVideo}"></video>`
        : `<iframe
                    title="Video relacionado - ${escapeHtml(module.title)}"
                    src="${videoUrl}"
                    loading="lazy"
                    allowfullscreen>
                </iframe>`;

    return `
        <section class="lesson-media-card">
            <div class="lesson-media-image" style="background-image:linear-gradient(135deg, ${course.color || "#2563eb"}cc, rgba(15,23,42,.28)), url('${profile.image}')">
                <div>
                    <span>Midia da trilha ${String(moduleIndex + 1).padStart(2, "0")}</span>
                    <strong>${escapeHtml(module.title)}</strong>
                </div>
            </div>

            <div class="lesson-video-box">
                <div class="lesson-video-copy">
                    <span>${localVideo ? "Video narrado" : "Video relacionado"}</span>
                    <strong>${localVideo ? "Aula sincronizada com narracao" : "Pesquisa contextual pronta"}</strong>
                    <p>${localVideo ? "Este video foi montado com os audios fornecidos para acompanhar o conteudo desta trilha." : "Use para complementar a aula com demonstracoes, exemplos visuais e treinamento operacional."}</p>
                    ${localVideo ? "" : `<a href="${watchUrl}" target="_blank" rel="noopener">Abrir videos</a>`}
                </div>
                ${videoEmbed}
            </div>
        </section>
    `;
}

function formatLessonContent(value){
    const lines = stripEmoji(value).replace(/\r\n/g, "\n").split("\n");
    let html = "";
    let listOpen = false;
    let preOpen = false;

    function closeList(){
        if(listOpen){
            html += "</ul>";
            listOpen = false;
        }
    }

    function closePre(){
        if(preOpen){
            html += "</code></pre>";
            preOpen = false;
        }
    }

    lines.forEach(rawLine => {
        const line = rawLine.trim();

        if(!line){
            closeList();
            closePre();
            return;
        }

        if(/^(&gt;|>)/.test(line) || /^(AHL|OHD|NM|XT|FO|FW|SI|AG|TN|RT|FD)\b/.test(line) && line.length < 90){
            closeList();
            if(!preOpen){
                html += '<pre class="lesson-command"><code>';
                preOpen = true;
            }
            html += `${escapeHtml(line)}\n`;
            return;
        }

        closePre();

        if(/^\d+\.\s+/.test(line)){
            closeList();
            html += `<h3>${escapeHtml(line)}</h3>`;
            return;
        }

        if(/^(Exemplo|Resumo operacional|Boas praticas|Checklist|Campos importantes|Codigo|Elemento|Extensao|Objetivo|Conceito)\b/i.test(line)){
            closeList();
            html += `<h4>${escapeHtml(line)}</h4>`;
            return;
        }

        if(/^[-*]\s+/.test(line)){
            if(!listOpen){
                html += "<ul>";
                listOpen = true;
            }
            html += `<li>${escapeHtml(line.replace(/^[-*]\s+/, ""))}</li>`;
            return;
        }

        html += `<p>${escapeHtml(line)}</p>`;
    });

    closeList();
    closePre();
    return html;
}


function academyCurrentUserName(){
    if(window.AccessControl && typeof AccessControl.readLocalProfile === "function"){
        const profile = AccessControl.readLocalProfile();

        if(profile && profile.name){
            return profile.name;
        }
    }

    return "aluno";
}

function renderHome(){
    restoreLocalAcademyCourses();
    const grid = document.getElementById("courseGrid");
    const count = document.getElementById("homeCourseCount");
    const welcomeTitle = document.getElementById("academyWelcomeTitle");

    if(!grid){
        return;
    }

    if(welcomeTitle){
        welcomeTitle.textContent = `Olá, ${academyCurrentUserName()}. Escolha seu curso.`;
    }

    count.textContent = academyCourses.length;

    grid.innerHTML = academyCourses.map(course => {
        const visual = courseVisual(course);
        const percent = courseProgress(course);
        const hasMaterial = materialForCourse(course) ? "Material completo" : "Trilha pratica";

        return `
            <a class="academy-course-card" href="course.html?id=${encodeURIComponent(course.id)}" target="_blank" rel="noopener">
                <div class="course-card-image" style="background-image:${visual.image}">
                    <span class="course-card-icon">${iconSvg(visual.icon)}</span>
                </div>
                <div class="course-card-body">
                    <span>${course.eyebrow}</span>
                    <h2>${course.title}</h2>
                    <p>${course.summary}</p>
                    <div class="course-card-footer">
                        <strong>${courseModules(course).length} trilhas</strong>
                        <small>${percent}% concluido</small>
                        <small>${hasMaterial}</small>
                    </div>
                </div>
            </a>
        `;
    }).join("");
}

function initializeCourseFromUrl(){
    const params = new URLSearchParams(window.location.search);
    const id = params.get("id");

    if(id && academyCourses.some(course => course.id === id)){
        state.selectedCourseId = id;
    }
}

function renderCourseHeader(course){
    const visual = courseVisual(course);
    const header = document.querySelector(".course-page-header");

    if(header){
        header.style.backgroundImage = visual.image;
    }

    document.getElementById("courseEyebrow").textContent = course.eyebrow;
    document.getElementById("courseTitle").textContent = course.title;
    document.getElementById("courseSummary").textContent = course.summary;
    document.getElementById("courseDuration").textContent = course.duration;
    document.getElementById("courseLevel").textContent = course.level;
    document.getElementById("courseProgress").textContent = `${courseProgress(course)}% concluido`;
}

function renderCourseIntroVideo(course){
    const container = document.getElementById("courseIntroVideo");

    if(!container){
        return;
    }

    const intro = courseIntroVideos[course.id];

    if(!intro){
        container.innerHTML = "";
        container.hidden = true;
        return;
    }

    container.hidden = false;
    container.innerHTML = `
        <div class="course-intro-video-card">
            <div class="course-intro-copy">
                <span>${escapeHtml(intro.title)}</span>
                <h2>${escapeHtml(intro.subtitle)}</h2>
                <p>${escapeHtml(intro.description)}</p>
            </div>

            <video
                class="lesson-local-video course-intro-video"
                controls
                preload="metadata"
                src="${intro.src}">
            </video>
        </div>
    `;
}
function renderTracks(course){
    const grid = document.getElementById("trackGrid");
    const progress = readProgress();
    const done = progress[course.id] || [];
    const modules = courseModules(course);

    grid.innerHTML = modules.map((module, index) => {
        const active = index === state.selectedModuleIndex ? "active" : "";
        const checked = done.includes(index) ? "Concluida" : "Pendente";

        return `
            <button class="track-card ${active}" type="button" data-module="${index}">
                <span>${String(index + 1).padStart(2, "0")}</span>
                <h3>${module.title}</h3>
                <p>${module.type} - ${module.duration}</p>
                <strong>${checked}</strong>
            </button>
        `;
    }).join("");

    grid.querySelectorAll("[data-module]").forEach(button => {
        button.addEventListener("click", () => {
            state.selectedModuleIndex = Number(button.dataset.module);
            renderCoursePage();
        });
    });
}

function renderLesson(course){
    const module = currentModule(course);
    const panel = document.getElementById("lessonPanel");
    const fullContent = lessonMaterial(course, state.selectedModuleIndex);
    const lessonContent = fullContent || module.content;
    const contentLabel = fullContent ? "Conteudo desta trilha" : "Trilha pratica";

    panel.innerHTML = `
        <div class="lesson-topline">
            <span>${module.type}</span>
            <span>${module.duration}</span>
        </div>
        <h2>${module.title}</h2>
        ${lessonMedia(course, module, state.selectedModuleIndex)}
        <div class="lesson-content-label">${contentLabel}</div>
        ${lessonScreenshotCards(course, state.selectedModuleIndex)}
        <article class="lesson-full-content">${formatLessonContent(lessonContent)}</article>
        <div class="lesson-actions">
            <button class="primary-action" id="completeLesson" type="button">Marcar como concluida</button>
            <button class="secondary-action" id="resetCourse" type="button">Reiniciar progresso</button>
        </div>
    `;

    bindLessonScreenshots();

    document.getElementById("completeLesson").addEventListener("click", () => {
        const progress = readProgress();
        const done = new Set(progress[course.id] || []);
        done.add(state.selectedModuleIndex);
        progress[course.id] = [...done].sort((a, b) => a - b);
        saveProgress(progress);
        renderCoursePage();
    });

    document.getElementById("resetCourse").addEventListener("click", () => {
        const progress = readProgress();
        progress[course.id] = [];
        saveProgress(progress);
        renderCoursePage();
    });
}


function msbImageForLesson(course, moduleIndex){
    const pages = msbCoursePages[course.id] || [];

    if(pages.length === 0){
        return null;
    }

    const page = pages[moduleIndex % pages.length];

    return {
        title: `MSB2025 - pagina ${page}`,
        caption: "Imagem extraida do manual, recortada para exibir apenas a area instrucional relacionada ao tema.",
        src: `../assets/academy-msb/msb-page-${String(page).padStart(3, "0")}.jpg`,
        source: "MSB2025"
    };
}
function lessonScreenshotCards(course, moduleIndex){
    const setup = lessonScreenshots[course.id];

    const fallback = {
        title: course.title || "Imagem do curso",
        caption: "Imagem de apoio para contextualizar esta trilha.",
        src: `../assets/academy-covers/${course.id}.svg`,
        source: "Curso"
    };

    const configuredItems = setup
        ? setup[moduleIndex] || setup.default || []
        : [];

    const msbItem = msbImageForLesson(course, moduleIndex);
    const items = [msbItem, ...configuredItems].filter(Boolean);

    if(items.length === 0){
        items.push(fallback);
    }

    return `
        <div class="lesson-screenshot-block">
            <div class="lesson-screenshot-heading">
                <span>Print do sistema</span>
                <strong>Aplicacao pratica na mascara</strong>
            </div>

            <div class="lesson-screenshot-grid">
                ${items.map(item => `
                    <figure class="lesson-screenshot-card">
                        <button
                            type="button"
                            class="lesson-screenshot-zoom"
                            data-screenshot-src="${escapeHtml(item.src)}"
                            data-screenshot-title="${escapeHtml(item.title)}">
                            <img src="${escapeHtml(item.src)}" alt="${escapeHtml(item.title)}">
                        </button>

                        <figcaption>
                            <strong>${escapeHtml(item.title)}</strong>
                            <span>${escapeHtml(item.caption)}</span>
                        </figcaption>
                    </figure>
                `).join("")}
            </div>
        </div>
    `;
}

function bindLessonScreenshots(){
    document.querySelectorAll("[data-screenshot-src]").forEach(button => {
        button.addEventListener("click", () => {
            const src = button.dataset.screenshotSrc;
            const title = button.dataset.screenshotTitle || "Print do sistema";
            const old = document.getElementById("screenshotPreviewModal");

            if(old){
                old.remove();
            }

            document.body.insertAdjacentHTML("beforeend", `
                <div class="screenshot-preview-modal" id="screenshotPreviewModal" role="dialog" aria-modal="true">
                    <div class="screenshot-preview-dialog">
                        <div class="screenshot-preview-header">
                            <strong>${escapeHtml(title)}</strong>
                            <button type="button" id="closeScreenshotPreview">Fechar</button>
                        </div>

                        <img src="${escapeHtml(src)}" alt="${escapeHtml(title)}">
                    </div>
                </div>
            `);

            document.getElementById("closeScreenshotPreview")?.addEventListener("click", () => {
                document.getElementById("screenshotPreviewModal")?.remove();
            });

            document.getElementById("screenshotPreviewModal")?.addEventListener("click", event => {
                if(event.target.id === "screenshotPreviewModal"){
                    event.currentTarget.remove();
                }
            });
        });
    });
}
function renderLabs(course){
    const labs = document.getElementById("labLinks");

    labs.innerHTML = course.labs.map(lab => `
        <a class="lab-link" href="${lab.href}">
            <span>${lab.label}</span>
            <strong>Abrir</strong>
        </a>
    `).join("") || `<div class="assessment-empty">Sem laboratorio vinculado.</div>`;
}

function quizScore(course){
    const answers = state.quizAnswers[course.id] || {};
    const questions = normalizeQuiz(course);

    if(questions.length === 0){
        return null;
    }

    const correct = questions.reduce((sum, question, index) => sum + (answers[index] === question.correct ? 1 : 0), 0);
    return { correct, total: questions.length, percent: Math.round((correct / questions.length) * 100) };
}

function renderAssessment(course){
    const container = document.getElementById("assessmentPanel");

    if(!container){
        return;
    }

    const questions = normalizeQuiz(course);

    if(questions.length === 0){
        container.innerHTML = `<div class="assessment-empty">Este curso ainda nao possui avaliacao cadastrada.</div>`;
        return;
    }

    const saved = readQuizResults()[course.id];
    const isOpen = Boolean(state.assessmentOpen[course.id]);

    if(!isOpen){
        container.innerHTML = `
            <article class="assessment-start-card">
                <div>
                    <span>Avaliacao</span>
                    <strong>${questions.length} perguntas</strong>
                    <p>${saved ? `Ultimo resultado: ${saved.percent}%` : "A prova ainda nao foi iniciada neste curso."}</p>
                </div>

                <button class="primary-action" id="startAssessment" type="button">
                    Iniciar prova
                </button>
            </article>
        `;

        document.getElementById("startAssessment")?.addEventListener("click", () => {
            const confirmed = window.confirm("Iniciar a prova?");

            if(!confirmed){
                return;
            }

            state.assessmentOpen[course.id] = true;
            renderAssessment(course);
        });

        return;
    }

    container.innerHTML = `
        <details class="assessment-expander" open>
            <summary>
                <span>Avaliacao em andamento</span>
                <strong>${questions.length} perguntas</strong>
                <small id="assessmentScore">${saved ? `Ultimo: ${saved.percent}%` : "Nao finalizada"}</small>
            </summary>

            <div class="quiz-list compact">
                ${questions.map((question, questionIndex) => `
                    <article class="quiz-card">
                        <h3>${questionIndex + 1}. ${question.question}</h3>
                        <div class="quiz-options">
                            ${question.options.map((option, optionIndex) => {
                                const selected = (state.quizAnswers[course.id] || {})[questionIndex] === optionIndex ? "selected" : "";
                                return `<button class="quiz-option ${selected}" type="button" data-question="${questionIndex}" data-option="${optionIndex}">${option}</button>`;
                            }).join("")}
                        </div>
                    </article>
                `).join("")}
            </div>

            <div class="lesson-actions assessment-actions">
                <button class="primary-action" id="finishQuiz" type="button">Finalizar avaliacao</button>
                <button class="secondary-action" id="clearQuiz" type="button">Limpar respostas</button>
                <button class="secondary-action" id="closeAssessment" type="button">Fechar prova</button>
            </div>

            <div class="assessment-feedback" id="assessmentFeedback"></div>
        </details>
    `;

    container.querySelectorAll("[data-question]").forEach(button => {
        button.addEventListener("click", () => {
            const questionIndex = Number(button.dataset.question);
            const optionIndex = Number(button.dataset.option);
            state.quizAnswers[course.id] = state.quizAnswers[course.id] || {};
            state.quizAnswers[course.id][questionIndex] = optionIndex;
            renderAssessment(course);
        });
    });

    document.getElementById("finishQuiz")?.addEventListener("click", () => {
        const answers = state.quizAnswers[course.id] || {};
        if(Object.keys(answers).length < questions.length){
            document.getElementById("assessmentFeedback").textContent = "Responda todas as perguntas antes de finalizar.";
            return;
        }

        const score = quizScore(course);
        const results = readQuizResults();
        results[course.id] = { correct: score.correct, total: score.total, percent: score.percent, finishedAt: new Date().toISOString() };
        saveQuizResults(results);
        document.getElementById("assessmentScore").textContent = `Resultado: ${score.correct}/${score.total} - ${score.percent}%`;
        document.getElementById("assessmentFeedback").textContent = score.percent >= 70 ? "Aprovado." : "Revise as trilhas e refaca a avaliacao.";
    });

    document.getElementById("clearQuiz")?.addEventListener("click", () => {
        state.quizAnswers[course.id] = {};
        renderAssessment(course);
    });

    document.getElementById("closeAssessment")?.addEventListener("click", () => {
        state.assessmentOpen[course.id] = false;
        renderAssessment(course);
    });
}
function renderFullMaterial(course){
    const panel = document.getElementById("fullMaterialPanel");

    if(!panel){
        return;
    }

    const material = materialForCourse(course);
    const quizText = (course.quiz || []).length > 0
        ? "\n\n============================================================\nBANCO DE PERGUNTAS DO CURSO\n============================================================\n\n" +
            course.quiz.map((item, index) => {
                const normalized = normalizeQuizQuestion(item); const options = normalized.options.map((option, optionIndex) => `${String.fromCharCode(65 + optionIndex)}) ${option}`).join("\n"); return `${index + 1}. ${normalized.question}\n${options}\nResposta correta: ${normalized.options[normalized.correct]}`;
            }).join("\n\n")
        : "";

    const fullText = [material, quizText].filter(Boolean).join("\n");

    if(!fullText){
        panel.innerHTML = `<div class="assessment-empty">Este curso ainda nao possui material integral cadastrado.</div>`;
        return;
    }

    panel.innerHTML = `
        <details class="full-material">
            <summary>Ver apostila completa e perguntas cadastradas</summary>
            <pre id="fullMaterialText"></pre>
        </details>
    `;

    document.getElementById("fullMaterialText").textContent = stripEmoji(fullText);
}

function renderCoursePage(){
    const course = selectedCourse();

    if(!course){
        const panel = document.getElementById("lessonPanel");
        if(panel){
            panel.innerHTML = `<div class="assessment-empty">Nenhum curso encontrado. Verifique os dados da plataforma.</div>`;
        }
        return;
    }
    renderCourseHeader(course);
    renderCourseIntroVideo(course);
    renderTracks(course);
    renderLesson(course);
    renderLabs(course);
    renderAssessment(course);
    renderFullMaterial(course);
}

async function bootAcademy(){
    if(typeof loadAcademyFromSupabase === "function"){
        await loadAcademyFromSupabase();
    }

    if(document.getElementById("courseGrid")){
        renderHome();
        return;
    }

    if(document.getElementById("trackGrid")){
        initializeCourseFromUrl();
        renderCoursePage();
    }
}

document.addEventListener("DOMContentLoaded", () => {
    bootAcademy();
});





















