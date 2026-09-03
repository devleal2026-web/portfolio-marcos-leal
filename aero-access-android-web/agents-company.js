import { supabase } from "./supabase.js";

const messageBox = document.getElementById("message");

let companies = [];
let agents = [];

function showMessage(text, type = "info") {
    if (!messageBox) {
        alert(text);
        return;
    }

    messageBox.textContent = text;
    messageBox.className = `message ${type}`;
    messageBox.style.display = "block";
}

function normalizeEmail(email) {
    return String(email || "").trim().toLowerCase();
}

function escapeHtml(value) {
    return String(value ?? "")
        .replaceAll("&", "&amp;")
        .replaceAll("<", "&lt;")
        .replaceAll(">", "&gt;")
        .replaceAll('"', "&quot;")
        .replaceAll("'", "&#039;");
}

function getCompanyName(companyId) {
    const company = companies.find(item => item.id === companyId);
    return company ? company.name : "Sem empresa vinculada";
}

async function loadCompanies() {
    const { data, error } = await supabase
        .from("aa_companies")
        .select("id, name, slug, status")
        .eq("status", "active")
        .order("name", { ascending: true });

    if (error) {
        console.error(error);
        showMessage("Erro ao carregar empresas: " + error.message, "error");
        companies = [];
        renderCompanySelects();
        return;
    }

    companies = data || [];
    renderCompanySelects();
}

function renderCompanySelects() {
    const selects = [
        document.getElementById("companyId"),
        document.getElementById("newAgentCompanyId")
    ];

    selects.forEach(select => {
        if (!select) return;

        select.innerHTML = `<option value="">Selecione a empresa</option>`;

        companies.forEach(company => {
            const option = document.createElement("option");
            option.value = company.id;
            option.textContent = company.name;
            select.appendChild(option);
        });
    });
}

async function loadAgents() {
    const { data, error } = await supabase
        .from("agents")
        .select("*")
        .order("name", { ascending: true });

    if (error) {
        console.error(error);
        showMessage("Erro ao carregar agentes: " + error.message, "error");
        agents = [];
        renderAgentSelect();
        renderAgentsList();
        return;
    }

    agents = data || [];
    renderAgentSelect();
    renderAgentsList();
}

function renderAgentSelect() {
    const select = document.getElementById("agentId");

    if (!select) return;

    select.innerHTML = `<option value="">Selecione o agente</option>`;

    agents.forEach(agent => {
        const companyName = getCompanyName(agent.company_id);
        const option = document.createElement("option");

        option.value = agent.id;
        option.textContent = `${agent.name || agent.email} - ${companyName}`;

        select.appendChild(option);
    });
}

function renderAgentsList() {
    const box = document.getElementById("agentsList");

    if (!box) return;

    if (!agents.length) {
        box.innerHTML = "<p>Nenhum agente cadastrado.</p>";
        return;
    }

    box.innerHTML = agents.map(agent => {
        const companyName = getCompanyName(agent.company_id);
        const status = agent.status || "livre";
        const activeToday = agent.active_today ? "Sim" : "Não";

        return `
            <div class="agent-card">
                <p><strong>Nome:</strong> ${escapeHtml(agent.name || "-")}</p>
                <p><strong>E-mail:</strong> ${escapeHtml(agent.email || "-")}</p>
                <p><strong>Empresa:</strong> ${escapeHtml(companyName)}</p>
                <p><strong>Status:</strong> ${escapeHtml(status)}</p>
                <p><strong>Ativo hoje:</strong> ${escapeHtml(activeToday)}</p>
                <p><strong>Atendimentos no turno:</strong> ${escapeHtml(agent.shift_requests ?? 0)}</p>
                <p><strong>Total de atendimentos:</strong> ${escapeHtml(agent.total_requests ?? 0)}</p>

                <button type="button" onclick="selectAgent('${escapeHtml(agent.id)}')">
                    Selecionar
                </button>

                <button type="button" class="secondary" onclick="unlinkAgent('${escapeHtml(agent.id)}')">
                    Desvincular
                </button>
            </div>
        `;
    }).join("");
}

window.selectAgent = function selectAgent(agentId) {
    const agentSelect = document.getElementById("agentId");
    const companySelect = document.getElementById("companyId");
    const agent = agents.find(item => item.id === agentId);

    if (agentSelect) {
        agentSelect.value = agentId;
    }

    if (companySelect && agent) {
        companySelect.value = agent.company_id || "";
    }

    window.scrollTo({
        top: 0,
        behavior: "smooth"
    });
};

window.createAgent = async function createAgent() {
    const name = document.getElementById("agentName")?.value?.trim();
    const email = normalizeEmail(document.getElementById("agentEmail")?.value);
    const password = document.getElementById("agentPassword")?.value;
    const companyId = document.getElementById("newAgentCompanyId")?.value;

    if (!name || !email || !password || !companyId) {
        showMessage("Preencha nome, e-mail, senha e empresa.", "error");
        return;
    }

    const { data: existingAgent, error: searchError } = await supabase
        .from("agents")
        .select("id, email")
        .ilike("email", email)
        .maybeSingle();

    if (searchError) {
        console.error(searchError);
        showMessage("Erro ao verificar e-mail do agente: " + searchError.message, "error");
        return;
    }

    if (existingAgent) {
        showMessage("Este e-mail já está cadastrado como agente. Use a opção de vincular agente existente.", "error");
        return;
    }

    const { error } = await supabase
        .from("agents")
        .insert({
            name,
            email,
            password,
            company_id: companyId,
            status: "livre",
            active_today: true,
            total_requests: 0,
            shift_requests: 0
        });

    if (error) {
        console.error(error);
        showMessage("Erro ao cadastrar agente: " + error.message, "error");
        return;
    }

    document.getElementById("agentName").value = "";
    document.getElementById("agentEmail").value = "";
    document.getElementById("agentPassword").value = "";
    document.getElementById("newAgentCompanyId").value = "";

    showMessage("Agente cadastrado e vinculado à empresa com sucesso.", "success");

    await loadAgents();
};

window.linkAgentToCompany = async function linkAgentToCompany() {
    const agentId = document.getElementById("agentId")?.value;
    const companyId = document.getElementById("companyId")?.value;

    if (!agentId || !companyId) {
        showMessage("Selecione o agente e a empresa.", "error");
        return;
    }

    const { error } = await supabase
        .from("agents")
        .update({
            company_id: companyId
        })
        .eq("id", agentId);

    if (error) {
        console.error(error);
        showMessage("Erro ao vincular agente: " + error.message, "error");
        return;
    }

    showMessage("Agente vinculado à empresa com sucesso.", "success");

    await loadAgents();
};

window.unlinkSelectedAgent = async function unlinkSelectedAgent() {
    const agentId = document.getElementById("agentId")?.value;

    if (!agentId) {
        showMessage("Selecione um agente para desvincular.", "error");
        return;
    }

    await unlinkAgent(agentId);
};

window.unlinkAgent = async function unlinkAgent(agentId) {
    const agent = agents.find(item => item.id === agentId);

    if (!agent) {
        showMessage("Agente não encontrado.", "error");
        return;
    }

    const confirmUnlink = confirm(
        `Deseja desvincular ${agent.name || agent.email} da empresa atual?`
    );

    if (!confirmUnlink) return;

    const { error } = await supabase
        .from("agents")
        .update({
            company_id: null,
            status: "livre"
        })
        .eq("id", agentId);

    if (error) {
        console.error(error);
        showMessage("Erro ao desvincular agente: " + error.message, "error");
        return;
    }

    showMessage("Agente desvinculado com sucesso.", "success");

    await loadAgents();
};

async function initializePage() {
    await loadCompanies();
    await loadAgents();
}

document.addEventListener("DOMContentLoaded", initializePage);