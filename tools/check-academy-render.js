const fs = require("fs");
const path = require("path");
const vm = require("vm");
const { spawnSync } = require("child_process");

const root = path.resolve(__dirname, "..");
const dataPath = path.join(root, "leal-academy", "js", "academy-data.js");
const appPath = path.join(root, "leal-academy", "js", "academy.js");
const outputPath = path.join(root, "tools", ".academy-visual-render-check.html");

const chromeCandidates = [
    "C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe",
    "C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe",
    "C:\\Program Files\\Microsoft\\Edge\\Application\\msedge.exe",
    "C:\\Program Files (x86)\\Microsoft\\Edge\\Application\\msedge.exe"
];

const browserPaths = chromeCandidates.filter(item => fs.existsSync(item));

if(browserPaths.length === 0){
    console.error("Chrome ou Edge nao encontrado para teste visual headless.");
    process.exit(1);
}

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
        fs.readFileSync(appPath, "utf8") + "\nglobalThis.__lessonInlineIllustration = lessonInlineIllustration;",
        context
    );

    return context;
}

function attr(value){
    return String(value ?? "")
        .replace(/&/g, "&amp;")
        .replace(/"/g, "&quot;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;");
}

const context = loadContext();
const courses = context.__academyCourses || [];
const render = context.__lessonInlineIllustration;

const visuals = courses.flatMap(course => {
    return (course.modules || []).map((module, index) => {
        const label = `${course.id} / trilha ${index + 1} / ${module.title}`;

        return `
            <section class="visual-check" data-label="${attr(label)}">
                ${render(course, module, index)}
            </section>
        `;
    });
});

const html = `<!doctype html>
<html lang="pt-BR">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../leal-academy/css/academy.css">
    <style>
        body{margin:0;padding:24px;background:#edf2f5;font-family:Arial,sans-serif;}
        .visual-check{width:760px;margin:0 0 24px;}
        .visual-check:nth-child(even){width:700px;}
        #result{white-space:pre-wrap;font:14px/1.4 monospace;margin:20px 0;padding:12px;background:#fff;border:1px solid #ccc;}
    </style>
</head>
<body>
    <div id="visuals">${visuals.join("\n")}</div>
    <pre id="result">RUNNING</pre>
    <script>
        function check(){
            const problems = [];

            document.querySelectorAll(".visual-check").forEach(section => {
                const label = section.dataset.label;
                const art = section.querySelector(".lesson-inline-visual-art");

                if(!art){
                    problems.push(label + ": arte nao encontrada.");
                    return;
                }

                const artRect = art.getBoundingClientRect();
                const elements = art.querySelectorAll("span,strong,b,li,div");

                elements.forEach(el => {
                    const rect = el.getBoundingClientRect();
                    const style = getComputedStyle(el);

                    if(rect.width === 0 || rect.height === 0 || style.display === "none"){
                        return;
                    }

                    if(rect.left < artRect.left - 1 || rect.right > artRect.right + 1 || rect.top < artRect.top - 1 || rect.bottom > artRect.bottom + 1){
                        problems.push(label + ": elemento fora da imagem (" + el.textContent.trim() + ").");
                    }

                    if(el.scrollWidth > el.clientWidth + 1){
                        problems.push(label + ": texto cortado (" + el.textContent.trim() + ").");
                    }
                });
            });

            const result = problems.length
                ? "FAIL\\n" + problems.join("\\n")
                : "OK: " + document.querySelectorAll(".visual-check").length + " imagens renderizadas sem overflow.";

            document.getElementById("result").textContent = result;
            document.title = result.startsWith("OK") ? "OK" : "FAIL";
        }

        requestAnimationFrame(() => requestAnimationFrame(check));
    </script>
</body>
</html>`;

fs.writeFileSync(outputPath, html, "utf8");

function runBrowser(browserPath){
    return spawnSync(browserPath, [
        "--headless=new",
        "--disable-gpu",
        "--disable-gpu-compositing",
        "--disable-software-rasterizer",
        "--disable-dev-shm-usage",
        "--no-sandbox",
        "--allow-file-access-from-files",
        "--virtual-time-budget=12000",
        "--dump-dom",
        `file:///${outputPath.replace(/\\/g, "/")}`
    ], {
        encoding: "utf8"
    });
}

let result = null;

for(const browserPath of browserPaths){
    result = runBrowser(browserPath);

    if(result.status === 0 && result.stdout && result.stdout.includes('<pre id="result">')){
        break;
    }
}

if(result.error){
    console.error(result.error.message);
    process.exit(1);
}

if(result.status !== 0){
    console.error((result.stderr || result.stdout || "Falha ao executar navegador headless.").trim());
    process.exit(1);
}

const output = result.stdout || "";
const match = output.match(/<pre id="result">([\s\S]*?)<\/pre>/);
const report = match
    ? match[1].replace(/&lt;/g, "<").replace(/&gt;/g, ">").replace(/&amp;/g, "&")
    : output.slice(-2000);

console.log(report.trim());

if(!report.trim().startsWith("OK")){
    process.exit(1);
}
