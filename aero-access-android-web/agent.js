import { supabase } from "./supabase.js";
import { checkAgentAccess, getUser } from "./auth.js";

checkAgentAccess();

const container = document.getElementById("list");

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

    if (hours > 0) return `${hours}h ${minutes}min ${seconds}s`;
    if (minutes > 0) return `${minutes}min ${seconds}s`;
    return `${seconds}s`;
}

window.loadRequests = async () => {
    const user = getUser();

    let query = supabase
        .from("requests")
        .select("*")
        .eq("agent_id", user.id)
        .in("status", ["pendente", "em_andamento"])
        .order("created_at", { ascending: true });

    if (user.company_id) {
        query = query.eq("company_id", user.company_id);
    }

    const { data, error } = await query;

    if (error) {
        container.innerHTML = "<p>Erro ao carregar solicitacoes.</p>";
        return;
    }

    if (!data || data.length === 0) {
        container.innerHTML = "<p>Nenhuma solicitacao no momento.</p>";
        return;
    }

    container.innerHTML = data.map(req => {
        const buttons = req.status === "pendente"
            ? `<button onclick="acceptRequest('${req.id}')">Aceitar</button>`
            : `
                <button onclick="openChat('${req.id}')">Conversar</button>
                <button onclick="finishRequest('${req.id}', '${req.agent_id}')">Finalizar</button>
                <button class="secondary" onclick="cancelRequest('${req.id}', '${req.agent_id}')">Cancelar</button>
            `;

        return `
            <div class="card">
                <h3>${esc(req.passenger_name)}</h3>
                <p><strong>Origem:</strong> ${esc(req.passenger_location)}</p>
                <p><strong>Destino:</strong> ${esc(req.destination_location)}</p>
                <p><strong>Observacoes:</strong> ${esc(req.notes || "-")}</p>
                <p><strong>Status:</strong> ${esc(req.status)}</p>
                <p><strong>Solicitado:</strong> ${formatDate(req.created_at)}</p>
                <p><strong>Inicio:</strong> ${formatDate(req.started_at)}</p>
                <div class="actions">${buttons}</div>
            </div>
        `;
    }).join("");
};

async function loadAgentHistory() {
    const user = getUser();
    const box = document.getElementById("agentHistory");

    let query = supabase
        .from("requests")
        .select("*")
        .eq("agent_id", user.id)
        .order("created_at", { ascending: false });

    if (user.company_id) {
        query = query.eq("company_id", user.company_id);
    }

    const { data, error } = await query;

    if (error) {
        box.innerHTML = "<p>Erro ao carregar historico.</p>";
        return;
    }

    if (!data || data.length === 0) {
        box.innerHTML = "<p>Nenhum historico encontrado.</p>";
        return;
    }

    box.innerHTML = data.map(req => `
        <div class="agent-card">
            <p><strong>Passageiro:</strong> ${esc(req.passenger_name || "-")}</p>
            <p><strong>Origem:</strong> ${esc(req.passenger_location || "-")}</p>
            <p><strong>Destino:</strong> ${esc(req.destination_location || "-")}</p>
            <p><strong>Status:</strong> ${esc(req.status || "-")}</p>
            <p><strong>Solicitado:</strong> ${formatDate(req.created_at)}</p>
            <p><strong>Inicio:</strong> ${formatDate(req.started_at)}</p>
            <p><strong>Fim:</strong> ${formatDate(req.finished_at)}</p>
            <p><strong>Duração:</strong> ${formatDuration(req.started_at, req.finished_at)}</p>
            <button onclick="openChat('${req.id}')">Abrir Chat</button>
        </div>
    `).join("");
}

window.acceptRequest = async requestId => {
    const { error } = await supabase
        .from("requests")
        .update({
            status: "em_andamento",
            agent_status: "aceito",
            started_at: new Date().toISOString()
        })
        .eq("id", requestId);

    if (error) {
        alert("Erro ao aceitar atendimento.");
        return;
    }

    window.loadRequests();
    loadAgentHistory();
};

window.finishRequest = async (requestId, agentId) => {
    await supabase
        .from("requests")
        .update({
            status: "finalizado",
            agent_status: "finalizado",
            finished_at: new Date().toISOString()
        })
        .eq("id", requestId);

    await supabase
        .from("agents")
        .update({ status: "livre" })
        .eq("id", agentId);

    window.loadRequests();
    loadAgentHistory();
};

window.cancelRequest = async (requestId, agentId) => {
    await supabase
        .from("requests")
        .update({
            status: "cancelado",
            agent_status: "cancelado",
            cancelled_at: new Date().toISOString()
        })
        .eq("id", requestId);

    await supabase
        .from("agents")
        .update({ status: "livre" })
        .eq("id", agentId);

    window.loadRequests();
    loadAgentHistory();
};

window.openChat = requestId => {
    localStorage.setItem("currentRequest", requestId);
    location.href = "chat.html?request=" + encodeURIComponent(requestId);
};

supabase
    .channel("agent_requests")
    .on("postgres_changes", { event: "*", schema: "public", table: "requests" }, () => {
        window.loadRequests();
        loadAgentHistory();
    })
    .subscribe();

window.loadRequests();
loadAgentHistory();