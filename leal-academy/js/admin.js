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
                    certificates:0,
                    lastCourse:"-"
                });
            }

            return users.get(key);
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

            if(item.approved){
                user.approved += 1;
            }
        });

        data.certificates.forEach(item => {
            const user = ensure(item.email || item.student_email, item);

            if(!user){
                return;
            }

            user.certificates += 1;
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

        return [...users.values()].sort((a, b) => {
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

        document.getElementById("adminUsersCount").textContent = `${userRows.length} registros`;
        document.getElementById("adminUsersTable").innerHTML = renderUsersTable(userRows);
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

    function renderUsersTable(rows){
        return table([
            "Aluno",
            "E-mail",
            "Acessos",
            "Cursos",
            "Concluídos",
            "Pendentes",
            "Certificados",
            "Último acesso"
        ], rows.map(row => [
            row.name,
            row.email,
            row.accessCount,
            row.started,
            row.completed,
            row.pending,
            row.certificates,
            formatDate(row.lastAccess)
        ]));
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

        const headers = ["Aluno", "E-mail", "Acessos", "Cursos iniciados", "Concluídos", "Pendentes", "Certificados", "Último acesso"];
        const lines = [
            headers.join(";"),
            ...dashboardRows.map(row => [
                row.name,
                row.email,
                row.accessCount,
                row.started,
                row.completed,
                row.pending,
                row.certificates,
                formatDate(row.lastAccess)
            ].map(value => `"${String(value ?? "").replace(/"/g, '""')}"`).join(";"))
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
