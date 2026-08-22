/*==========================================================
LEAL ACADEMY ADMIN
Private access, metrics and dashboards
==========================================================*/

"use strict";

const AcademyAdmin = (() => {
    let dashboardRows = [];

    function clean(value){
        return String(value ?? "").trim();
    }

    function normalizeEmail(value){
        return clean(value).toLowerCase();
    }

    function escapeHtml(value){
        return clean(value)
            .replace(/&/g, "&amp;")
            .replace(/</g, "&lt;")
            .replace(/>/g, "&gt;")
            .replace(/"/g, "&quot;")
            .replace(/'/g, "&#039;");
    }

    function formatDate(value){
        if(!value){
            return "-";
        }

        return new Date(value).toLocaleString("pt-BR");
    }

    function gradeFromPercent(percent){
        const grade = Math.round((Number(percent) || 0)) / 10;
        return Number.isInteger(grade) ? String(grade) : grade.toFixed(1);
    }

    async function currentSession(){
        if(typeof supabaseClient === "undefined" || !supabaseClient.auth){
            return null;
        }

        const { data } = await supabaseClient.auth.getSession();
        return data?.session || null;
    }

    async function isAdmin(email){
        const { data, error } = await supabaseClient
            .from("academy_admins")
            .select("email")
            .eq("email", normalizeEmail(email))
            .maybeSingle();

        if(error){
            throw error;
        }

        return Boolean(data);
    }

    function setStatus(message, type = "info"){
        const status = document.getElementById("adminStatus");

        if(!status){
            return;
        }

        status.className = `academy-admin-status ${type}`;
        status.textContent = message;
    }

    async function guardedLoad(){
        const session = await currentSession();

        if(!session){
            setStatus("Faça login com uma conta autorizada para acessar o painel administrativo.", "danger");
            return;
        }

        const email = normalizeEmail(session.user.email);

        try{
            const allowed = await isAdmin(email);

            if(!allowed){
                setStatus("Acesso negado. Este e-mail não está cadastrado como administrador.", "danger");
                document.querySelectorAll(".academy-admin-panel, .academy-admin-metrics").forEach(item => {
                    item.hidden = true;
                });
                return;
            }
        }catch(error){
            console.error(error);
            setStatus("Não foi possível validar a tabela academy_admins. Execute os comandos SQL antes de usar o painel.", "danger");
            return;
        }

        await loadDashboard();
    }

    async function selectTable(table, columns = "*", orderColumn = "created_at"){
        let query = supabaseClient
            .from(table)
            .select(columns);

        if(orderColumn){
            query = query.order(orderColumn, { ascending:false });
        }

        const { data, error } = await query;

        if(error){
            throw error;
        }

        return data || [];
    }

    async function loadDashboard(){
        setStatus("Atualizando dados administrativos...");

        try{
            const [
                profiles,
                progress,
                attempts,
                certificates,
                events
            ] = await Promise.all([
                selectTable("access_profiles", "*", "last_access_at"),
                selectTable("academy_course_progress", "*", "last_activity_at"),
                selectTable("academy_quiz_attempts", "*", "created_at"),
                selectTable("academy_certificates", "*", "issued_at"),
                selectTable("academy_access_events", "*", "created_at")
            ]);

            renderDashboard({
                profiles,
                progress,
                attempts,
                certificates,
                events
            });

            setStatus("Métricas atualizadas com sucesso.", "success");
        }catch(error){
            console.error(error);
            setStatus("Erro ao carregar métricas. Confira se as tabelas e políticas SQL foram criadas no Supabase.", "danger");
        }
    }

    function buildUserRows(data){
        const users = new Map();

        function ensure(email, fallback = {}){
            const key = normalizeEmail(email || fallback.email);

            if(!key){
                return null;
            }

            if(!users.has(key)){
                users.set(key, {
                    email:key,
                    name:fallback.full_name || fallback.student_name || fallback.name || "-",
                    accessCount:0,
                    lastAccess:null,
                    started:0,
                    completed:0,
                    pending:0,
                    approved:0,
                    failed:0,
                    certificates:0,
                    lastCourse:"-",
                    courses:new Map()
                });
            }

            return users.get(key);
        }

        function courseFor(user, item){
            const courseId = item.course_id || "curso-nao-identificado";

            if(!user.courses.has(courseId)){
                user.courses.set(courseId, {
                    id:courseId,
                    title:item.course_title || courseId,
                    progress:0,
                    completed:false,
                    approved:false,
                    failed:false,
                    bestScore:null,
                    bestGrade:null,
                    attempts:0,
                    certificateCode:"",
                    certificateIssuedAt:null,
                    lastActivity:null
                });
            }

            const course = user.courses.get(courseId);
            course.title = item.course_title || course.title;
            return course;
        }

        data.profiles.forEach(profile => {
            const user = ensure(profile.email, profile);

            if(!user){
                return;
            }

            user.name = profile.full_name || user.name;
            user.accessCount = Number(profile.access_count) || 0;
            user.lastAccess = profile.last_access_at || user.lastAccess;
        });

        data.progress.forEach(item => {
            const user = ensure(item.email, item);

            if(!user){
                return;
            }

            user.started += 1;
            user.lastCourse = item.course_title || user.lastCourse;

            const course = courseFor(user, item);
            course.progress = Number(item.progress_percent) || 0;
            course.completed = course.progress >= 100;
            course.lastActivity = item.last_activity_at || course.lastActivity;

            if(Number(item.progress_percent) >= 100){
                user.completed += 1;
            }else{
                user.pending += 1;
            }

            if(!user.lastAccess || new Date(item.last_activity_at) > new Date(user.lastAccess)){
                user.lastAccess = item.last_activity_at;
            }
        });

        data.attempts.forEach(item => {
            const user = ensure(item.email, item);

            if(!user){
                return;
            }

            const course = courseFor(user, item);
            const score = Number(item.score_percent) || 0;
            course.attempts += 1;
            course.lastActivity = item.created_at || course.lastActivity;

            if(course.bestScore === null || score > course.bestScore){
                course.bestScore = score;
                course.bestGrade = gradeFromPercent(score);
            }

            if(item.approved){
                user.approved += 1;
                course.approved = true;
                course.failed = false;
            }else if(!course.approved){
                user.failed += 1;
                course.failed = true;
            }
        });

        data.certificates.forEach(item => {
            const user = ensure(item.email || item.student_email, item);

            if(!user){
                return;
            }

            user.certificates += 1;
            const course = courseFor(user, item);
            course.certificateCode = item.certificate_code || course.certificateCode;
            course.certificateIssuedAt = item.issued_at || course.certificateIssuedAt;
            course.approved = true;
            course.completed = true;
        });

        data.events.forEach(item => {
            const user = ensure(item.email, item);

            if(!user){
                return;
            }

            if(!user.lastAccess || new Date(item.created_at) > new Date(user.lastAccess)){
                user.lastAccess = item.created_at;
            }
        });

        return [...users.values()].map(user => {
            user.courseList = [...user.courses.values()].sort((a, b) => {
                return new Date(b.lastActivity || b.certificateIssuedAt || 0) - new Date(a.lastActivity || a.certificateIssuedAt || 0);
            });
            delete user.courses;
            return user;
        }).sort((a, b) => {
            return new Date(b.lastAccess || 0) - new Date(a.lastAccess || 0);
        });
    }

    function renderDashboard(data){
        const userRows = buildUserRows(data);
        dashboardRows = userRows;

        const activeUsers = userRows.length;
        const accessTotal = userRows.reduce((sum, user) => sum + user.accessCount, 0);
        const startedCourses = data.progress.length;
        const completedCourses = data.progress.filter(item => Number(item.progress_percent) >= 100).length;
        const approvedAttempts = data.attempts.filter(item => item.approved).length;

        document.getElementById("adminMetrics").innerHTML = `
            ${metricCard("Usuários", activeUsers, "contas registradas")}
            ${metricCard("Acessos", accessTotal || data.events.length, "entradas na plataforma")}
            ${metricCard("Cursos iniciados", startedCourses, "participações")}
            ${metricCard("Cursos concluídos", completedCourses, "100% das trilhas")}
            ${metricCard("Aprovações", approvedAttempts, "avaliações aprovadas")}
            ${metricCard("Certificados", data.certificates.length, "emitidos")}
        `;

        const accountsCount = document.getElementById("adminAccountsCount");
        const accountsPanel = document.getElementById("adminAccountsPanel");

        if(accountsCount){
            accountsCount.textContent = `${userRows.length} contas`;
        }

        if(accountsPanel){
            accountsPanel.innerHTML = renderAccountCards(userRows);
        }

        document.getElementById("adminUsersCount").textContent = `${userRows.length} registros`;
        document.getElementById("adminUsersTable").innerHTML = renderUsersSummaryTable(userRows);
        document.getElementById("adminCoursesTable").innerHTML = renderCoursesTable(data);
        document.getElementById("adminAttemptsTable").innerHTML = renderAttemptsTable(data.attempts);
        document.getElementById("adminCertificatesTable").innerHTML = renderCertificatesTable(data.certificates);
    }

    function metricCard(label, value, hint){
        return `
            <article class="academy-admin-metric">
                <span>${escapeHtml(label)}</span>
                <strong>${escapeHtml(value)}</strong>
                <small>${escapeHtml(hint)}</small>
            </article>
        `;
    }

    function renderAccountCards(rows){
        if(rows.length === 0){
            return `<div class="academy-admin-empty">Nenhuma conta acessou a plataforma ainda.</div>`;
        }

        return `
            <div class="academy-admin-user-list">
                ${rows.map((row, index) => `
                    <details class="academy-admin-user-card" ${index === 0 ? "open" : ""}>
                        <summary>
                            <div>
                                <strong>${escapeHtml(row.name)}</strong>
                                <span>${escapeHtml(row.email)}</span>
                            </div>

                            <div class="academy-admin-user-metrics">
                                ${smallMetric("Acessos", row.accessCount)}
                                ${smallMetric("Cursos", row.started)}
                                ${smallMetric("Concluídos", row.completed)}
                                ${smallMetric("Pendentes", row.pending)}
                                ${smallMetric("Aprovados", row.approved)}
                                ${smallMetric("Reprovados", row.failed)}
                                ${smallMetric("Certificados", row.certificates)}
                            </div>
                        </summary>

                        <div class="academy-admin-user-detail">
                            <p>
                                <strong>Último acesso:</strong>
                                ${escapeHtml(formatDate(row.lastAccess))}
                            </p>

                            ${renderUserCourseDetails(row)}
                        </div>
                    </details>
                `).join("")}
            </div>
        `;
    }

    function renderUsersSummaryTable(rows){
        return table([
            "Aluno",
            "E-mail",
            "Acessos",
            "Cursos",
            "Concluídos",
            "Pendentes",
            "Aprovados",
            "Não aprovados",
            "Certificados",
            "Último acesso"
        ], rows.map(row => [
            row.name,
            row.email,
            row.accessCount,
            row.started,
            row.completed,
            row.pending,
            row.approved,
            row.failed,
            row.certificates,
            formatDate(row.lastAccess)
        ]));
    }

    function smallMetric(label, value){
        return `
            <span>
                <b>${escapeHtml(value)}</b>
                ${escapeHtml(label)}
            </span>
        `;
    }

    function renderUserCourseDetails(user){
        if(!user.courseList || user.courseList.length === 0){
            return `<div class="academy-admin-empty">Esta conta acessou a plataforma, mas ainda não iniciou cursos.</div>`;
        }

        return table([
            "Curso",
            "Progresso",
            "Curso",
            "Avaliação",
            "Nota",
            "Tentativas",
            "Certificado",
            "Última atividade"
        ], user.courseList.map(course => {
            const courseStatus = course.completed
                ? "Concluído"
                : "Em andamento";
            const assessmentStatus = course.approved
                ? "Aprovado"
                : course.failed
                    ? "Não aprovado"
                    : "Sem prova";

            return [
                course.title,
                `${course.progress}%`,
                courseStatus,
                assessmentStatus,
                course.bestScore === null ? "-" : `${course.bestGrade} (${course.bestScore}%)`,
                course.attempts,
                course.certificateCode || "-",
                formatDate(course.lastActivity || course.certificateIssuedAt)
            ];
        }));
    }

    function renderCoursesTable(data){
        const courseMap = new Map();

        if(typeof academyCourses !== "undefined" && Array.isArray(academyCourses)){
            academyCourses.forEach(course => {
                courseMap.set(course.id, {
                    id:course.id,
                    title:course.title,
                    participants:0,
                    completed:0,
                    pending:0,
                    certificates:0,
                    averageProgress:0
                });
            });
        }

        data.progress.forEach(item => {
            const id = item.course_id;
            const course = courseMap.get(id) || {
                id,
                title:item.course_title || id,
                participants:0,
                completed:0,
                pending:0,
                certificates:0,
                progressTotal:0
            };

            course.participants += 1;
            course.progressTotal = (course.progressTotal || 0) + (Number(item.progress_percent) || 0);

            if(Number(item.progress_percent) >= 100){
                course.completed += 1;
            }else{
                course.pending += 1;
            }

            courseMap.set(id, course);
        });

        data.certificates.forEach(item => {
            const course = courseMap.get(item.course_id) || {
                id:item.course_id,
                title:item.course_title || item.course_id,
                participants:0,
                completed:0,
                pending:0,
                certificates:0,
                progressTotal:0
            };

            course.certificates += 1;
            courseMap.set(item.course_id, course);
        });

        const rows = [...courseMap.values()]
            .filter(course => course.participants > 0 || course.certificates > 0)
            .sort((a, b) => b.participants - a.participants)
            .map(course => {
                const average = course.participants > 0
                    ? Math.round((course.progressTotal || 0) / course.participants)
                    : 0;

                return [
                    course.title,
                    course.participants,
                    `${average}%`,
                    course.completed,
                    course.pending,
                    course.certificates
                ];
            });

        return table(["Curso", "Participantes", "Progresso médio", "Concluídos", "Pendentes", "Certificados"], rows);
    }

    function renderAttemptsTable(rows){
        const latest = rows.slice(0, 20).map(item => [
            item.full_name || item.email,
            item.course_title,
            `${gradeFromPercent(item.score_percent)} (${item.score_percent}%)`,
            `${item.correct_count}/${item.total_questions}`,
            item.approved ? "Aprovado" : "Não aprovado",
            formatDate(item.created_at)
        ]);

        return table(["Aluno", "Curso", "Nota", "Acertos", "Status", "Data"], latest);
    }

    function renderCertificatesTable(rows){
        const latest = rows.slice(0, 20).map(item => [
            item.student_name || item.full_name || item.email,
            item.course_title,
            item.certificate_code,
            `${gradeFromPercent(item.score_percent)} (${item.score_percent}%)`,
            formatDate(item.issued_at)
        ]);

        return table(["Aluno", "Curso", "Código", "Nota", "Emissão"], latest);
    }

    function table(headers, rows){
        if(rows.length === 0){
            return `<div class="academy-admin-empty">Nenhum dado registrado ainda.</div>`;
        }

        return `
            <table class="academy-admin-table">
                <thead>
                    <tr>${headers.map(header => `<th>${escapeHtml(header)}</th>`).join("")}</tr>
                </thead>
                <tbody>
                    ${rows.map(row => `
                        <tr>${row.map(cell => `<td>${escapeHtml(cell)}</td>`).join("")}</tr>
                    `).join("")}
                </tbody>
            </table>
        `;
    }

    function exportCsv(){
        if(dashboardRows.length === 0){
            alert("Nenhum dado para exportar.");
            return;
        }

        const headers = ["Aluno", "E-mail", "Acessos", "Curso", "Progresso", "Status do curso", "Status da avaliação", "Nota", "Tentativas", "Certificado", "Último acesso"];
        const lines = [
            headers.join(";"),
            ...dashboardRows.flatMap(row => {
                const courses = row.courseList && row.courseList.length > 0
                    ? row.courseList
                    : [{ title:"-", progress:"-", completed:false, approved:false, failed:false, bestScore:null, bestGrade:null, attempts:0, certificateCode:"-" }];

                return courses.map(course => [
                    row.name,
                    row.email,
                    row.accessCount,
                    course.title,
                    course.progress === "-" ? "-" : `${course.progress}%`,
                    course.completed ? "Concluído" : course.title === "-" ? "-" : "Em andamento",
                    course.approved ? "Aprovado" : course.failed ? "Não aprovado" : "Sem prova",
                    course.bestScore === null ? "-" : `${course.bestGrade} (${course.bestScore}%)`,
                    course.attempts,
                    course.certificateCode || "-",
                    formatDate(row.lastAccess)
                ].map(value => `"${String(value ?? "").replace(/"/g, '""')}"`).join(";"));
            })
        ];

        const blob = new Blob([lines.join("\n")], {
            type:"text/csv;charset=utf-8"
        });
        const url = URL.createObjectURL(blob);
        const link = document.createElement("a");
        link.href = url;
        link.download = `leal-academy-admin-${new Date().toISOString().slice(0, 10)}.csv`;
        link.click();
        URL.revokeObjectURL(url);
    }

    function init(){
        document.getElementById("refreshAdmin")?.addEventListener("click", loadDashboard);
        document.getElementById("exportAdminCsv")?.addEventListener("click", exportCsv);
        guardedLoad();
    }

    return {
        init,
        loadDashboard
    };
})();

document.addEventListener("DOMContentLoaded", () => {
    AcademyAdmin.init();
});
