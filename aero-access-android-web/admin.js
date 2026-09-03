import { supabase } from "./supabase.js";
import { checkAdminAccess } from "./auth.js";

checkAdminAccess();

function esc(value) {
    return String(value ?? "")
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;")
        .replace(/"/g, "&quot;")
        .replace(/'/g, "&#039;");
}

function formatDate(value) {
    if (!value) return "-";

    const date = new Date(value);

    if (Number.isNaN(date.getTime())) return "-";

    return date.toLocaleString("pt-BR");
}

function formatDuration(startedAt, finishedAt) {
    if (!startedAt || !finishedAt) return "-";

    const start = new Date(startedAt);
    const end = new Date(finishedAt);
    const diffMs = end - start;

    if (Number.isNaN(diffMs) || diffMs < 0) return "-";

    const totalSeconds = Math.floor(diffMs / 1000);
    const hours = Math.floor(totalSeconds / 3600);
    const minutes = Math.floor((totalSeconds % 3600) / 60);
    const seconds = totalSeconds % 60;

    if (hours > 0) {
        return `${hours}h ${minutes}min ${seconds}s`;
    }

    if (minutes > 0) {
        return `${minutes}min ${seconds}s`;
    }

    return `${seconds}s`;
}

window.logoutAdmin = () => {
    localStorage.removeItem("user");
    localStorage.removeItem("currentRequest");
    location.href = "index.html";
};

window.addAgent = async () => {
    const name = document.getElementById("agentName").value.trim();
    const email = document.getElementById("agentEmail").value.trim();
    const password = document.getElementById("agentPassword").value;

    if (!name || !email || !password) {
        alert("Preencha todos os campos.");
        return;
    }

    const { error } = await supabase
        .from("agents")
        .insert([{
            name,
            email,
            password,
            status: "livre",
            active: true,
            active_today: true,
            total_requests: 0,
            shift_requests: 0,
            shift_date: new Date().toISOString().slice(0, 10),
            created_at: new Date().toISOString()
        }]);

    if (error) {
        alert("Erro ao cadastrar agente: " + error.message);
        return;
    }

    document.getElementById("agentName").value = "";
    document.getElementById("agentEmail").value = "";
    document.getElementById("agentPassword").value = "";

    loadAll();
};

async function loadAgents() {
    const { data, error } = await supabase
        .from("agents")
        .select("*")
        .order("name", { ascending: true });

    const container = document.getElementById("agents");

    if (error) {
        container.innerHTML = "<p>Erro ao carregar agentes.</p>";
        return;
    }

    container.innerHTML = (data || []).map(agent => `
        <div class="agent-card">
            <h3>${esc(agent.name)}</h3>
            <p><strong>E-mail:</strong> ${esc(agent.email)}</p>
            <p><strong>Status:</strong> ${esc(agent.status)}</p>
            <p><strong>Ativo:</strong> ${agent.active ? "Sim" : "Nao"}</p>
            <p><strong>Atendimentos no turno:</strong> ${agent.shift_requests || 0}</p>
            <p><strong>Total de atendimentos:</strong> ${agent.total_requests || 0}</p>

            <div class="actions">
                <button onclick="editAgent('${agent.id}', '${esc(agent.name)}')">Editar</button>
                <button onclick="toggleAgentStatus('${agent.id}', '${agent.status}')">Alterar status</button>
                <button onclick="toggleAgentActive('${agent.id}', ${agent.active ? "true" : "false"})">
                    ${agent.active ? "Desativar" : "Ativar"}
                </button>
                <button class="secondary" onclick="deleteAgent('${agent.id}')">Excluir</button>
            </div>
        </div>
    `).join("");
}

window.editAgent = async (id, currentName) => {
    const name = prompt("Novo nome do agente:", currentName);

    if (!name) return;

    await supabase.from("agents").update({ name }).eq("id", id);
    loadAll();
};

window.toggleAgentStatus = async (id, status) => {
    await supabase
        .from("agents")
        .update({ status: status === "livre" ? "ocupado" : "livre" })
        .eq("id", id);

    loadAll();
};

window.toggleAgentActive = async (id, active) => {
    await supabase
        .from("agents")
        .update({ active: !active })
        .eq("id", id);

    loadAll();
};

window.deleteAgent = async id => {
    if (!confirm("Deseja excluir este agente?")) return;

    await supabase.from("agents").delete().eq("id", id);
    loadAll();
};

async function loadDashboard() {
    const { data: agents } = await supabase.from("agents").select("*");
    const { data: requests } = await supabase.from("requests").select("*");

    document.getElementById("totalAgents").textContent = agents?.length || 0;
    document.getElementById("totalRequests").textContent = requests?.length || 0;
    document.getElementById("activeRequests").textContent =
        requests?.filter(r => r.status === "em_andamento").length || 0;
}

async function loadAgentStatusSummary() {
    const { data: agents } = await supabase.from("agents").select("*");

    const livre = agents?.filter(a => a.status === "livre").length || 0;
    const ocupado = agents?.filter(a => a.status === "ocupado").length || 0;
    const inativo = agents?.filter(a => !a.active).length || 0;

    document.getElementById("agentStatusSummary").innerHTML = `
        <p><strong>Livres:</strong> ${livre}</p>
        <p><strong>Ocupados:</strong> ${ocupado}</p>
        <p><strong>Inativos:</strong> ${inativo}</p>
    `;
}

async function loadRankingAgents() {
    const { data } = await supabase
        .from("agents")
        .select("*")
        .order("shift_requests", { ascending: false });

    document.getElementById("rankingAgents").innerHTML = (data || []).map((agent, index) => `
        <div class="agent-card">
            <strong>${index + 1}. ${esc(agent.name)}</strong>
            <p>Atendimentos no turno: ${agent.shift_requests || 0}</p>
            <p>Total geral: ${agent.total_requests || 0}</p>
        </div>
    `).join("");
}

async function loadAgentStatus() {
    const { data: agents } = await supabase
        .from("agents")
        .select("*")
        .order("name", { ascending: true });

    const div = document.getElementById("agentsStatus");

    div.innerHTML = "";

    for (const agent of agents || []) {
        const { data: request } = await supabase
            .from("requests")
            .select("*")
            .eq("agent_id", agent.id)
            .eq("status", "em_andamento")
            .maybeSingle();

        div.innerHTML += `
            <div class="agent-card">
                <h3>${esc(agent.name)}</h3>
                <p><strong>Status:</strong> ${esc(agent.status)}</p>
                <p><strong>Passageiro:</strong> ${esc(request?.passenger_name || "-")}</p>
                <p><strong>Origem:</strong> ${esc(request?.passenger_location || "-")}</p>
                <p><strong>Destino:</strong> ${esc(request?.destination_location || "-")}</p>
                <p><strong>Inicio:</strong> ${formatDate(request?.started_at)}</p>
            </div>
        `;
    }
}

async function loadLiveRequests() {
    const { data } = await supabase
        .from("requests")
        .select("*")
        .in("status", ["pendente", "em_andamento"])
        .order("created_at", { ascending: false });

    document.getElementById("liveRequests").innerHTML = (data || []).map(req => `
        <div class="agent-card">
            <p><strong>Passageiro:</strong> ${esc(req.passenger_name)}</p>
            <p><strong>Origem:</strong> ${esc(req.passenger_location)}</p>
            <p><strong>Destino:</strong> ${esc(req.destination_location)}</p>
            <p><strong>Agente:</strong> ${esc(req.agent_name || "-")}</p>
            <p><strong>Status:</strong> ${esc(req.status)}</p>
            <p><strong>Solicitado:</strong> ${formatDate(req.created_at)}</p>
            <p><strong>Inicio:</strong> ${formatDate(req.started_at)}</p>
            <button onclick="adminOpenChat('${req.id}')">Ver Chat</button>
        </div>
    `).join("");
}

window.adminOpenChat = id => {
    localStorage.setItem("currentRequest", id);
    location.href = "chat.html?request=" + encodeURIComponent(id);
};

async function loadHistory() {
    const { data } = await supabase
        .from("requests")
        .select("*")
        .in("status", ["finalizado", "cancelado"])
        .order("created_at", { ascending: false });

    document.getElementById("history").innerHTML = (data || []).map(req => `
        <div class="agent-card">
            <h3>${esc(req.passenger_name)}</h3>
            <p><strong>Agente:</strong> ${esc(req.agent_name || "-")}</p>
            <p><strong>Status:</strong> ${esc(req.status)}</p>
            <p><strong>Solicitado:</strong> ${formatDate(req.created_at)}</p>
            <p><strong>Inicio:</strong> ${formatDate(req.started_at)}</p>
            <p><strong>Fim:</strong> ${formatDate(req.finished_at)}</p>
            <p><strong>Duração:</strong> ${formatDuration(req.started_at, req.finished_at)}</p>
        </div>
    `).join("");
}

async function loadDailyStats() {
    const today = new Date().toISOString().slice(0, 10);

    const { data } = await supabase
        .from("requests")
        .select("*")
        .gte("created_at", today + "T00:00:00");

    const total = data?.length || 0;
    const active = data?.filter(r => r.status === "em_andamento").length || 0;
    const done = data?.filter(r => r.status === "finalizado").length || 0;
    const canceled = data?.filter(r => r.status === "cancelado").length || 0;

    const finished = data?.filter(r => r.started_at && r.finished_at) || [];
    const totalDurationMs = finished.reduce((sum, req) => {
        const diff = new Date(req.finished_at) - new Date(req.started_at);
        return Number.isNaN(diff) || diff < 0 ? sum : sum + diff;
    }, 0);

    const averageDuration = finished.length
        ? formatDuration(0, totalDurationMs / finished.length)
        : "-";

    document.getElementById("dailyStats").innerHTML = `
        <h2>Estatisticas do Dia</h2>
        <p><strong>Total:</strong> ${total}</p>
        <p><strong>Em andamento:</strong> ${active}</p>
        <p><strong>Finalizados:</strong> ${done}</p>
        <p><strong>Cancelados:</strong> ${canceled}</p>
        <p><strong>Duração media:</strong> ${averageDuration}</p>
    `;
}

function loadAll() {
    loadAgents();
    loadDashboard();
    loadAgentStatusSummary();
    loadRankingAgents();
    loadAgentStatus();
    loadLiveRequests();
    loadHistory();
    loadDailyStats();
}

supabase
    .channel("admin_realtime")
    .on("postgres_changes", { event: "*", schema: "public", table: "agents" }, loadAll)
    .on("postgres_changes", { event: "*", schema: "public", table: "requests" }, loadAll)
    .subscribe();

loadAll();