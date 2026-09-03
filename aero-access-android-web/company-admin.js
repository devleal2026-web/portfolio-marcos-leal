import { supabase } from "./supabase.js";

let companyAdmin = null;
const messageBox = document.getElementById("message");

function readJson(key) {
    try {
        return JSON.parse(localStorage.getItem(key));
    } catch {
        return null;
    }
}

function checkCompanyAdminAccess() {
    companyAdmin = readJson("aeroCompanyAdmin");

    if (!companyAdmin || companyAdmin.type !== "company_admin" || !companyAdmin.company_id) {
        window.location.href = "company-admin-login.html";
        return false;
    }

    const title = document.getElementById("companyTitle");
    const info = document.getElementById("companyAdminInfo");

    if (title) {
        title.textContent = `Painel - ${companyAdmin.company?.name || "Empresa"}`;
    }

    if (info) {
        info.textContent = `Logado como ${companyAdmin.name} - Admin da Empresa`;
    }

    return true;
}

function showMessage(text, type = "info") {
    if (!messageBox) return;

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

async function loadAgents() {
    const { data, error } = await supabase
        .from("agents")
        .select("*")
        .eq("company_id", companyAdmin.company_id)
        .order("name", { ascending: true });

    const box = document.getElementById("agentsList");

    if (error) {
        console.error(error);
        box.innerHTML = "<p>Erro ao carregar agentes.</p>";
        return;
    }

    document.getElementById("totalAgents").textContent = data?.length || 0;

    if (!data || !data.length) {
        box.innerHTML = "<p>Nenhum agente cadastrado nesta empresa.</p>";
        return;
    }

    box.innerHTML = data.map(agent => `
        <div class="agent-card">
            <p><strong>Nome:</strong> ${escapeHtml(agent.name || "-")}</p>
            <p><strong>E-mail:</strong> ${escapeHtml(agent.email || "-")}</p>
            <p><strong>Status:</strong> ${escapeHtml(agent.status || "-")}</p>
            <p><strong>Ativo hoje:</strong> ${agent.active_today ? "Sim" : "Não"}</p>
            <p><strong>Atendimentos no turno:</strong> ${escapeHtml(agent.shift_requests ?? 0)}</p>
            <button type="button" onclick="toggleAgentActive('${escapeHtml(agent.id)}', ${agent.active_today ? "true" : "false"})">
                ${agent.active_today ? "Desativar no turno" : "Ativar no turno"}
            </button>
        </div>
    `).join("");
}

window.createCompanyAgent = async function createCompanyAgent() {
    const name = document.getElementById("agentName").value.trim();
    const email = normalizeEmail(document.getElementById("agentEmail").value);
    const password = document.getElementById("agentPassword").value;

    if (!name || !email || !password) {
        showMessage("Preencha nome, e-mail e senha do agente.", "error");
        return;
    }

    const { error } = await supabase
        .from("agents")
        .insert({
            name,
            email,
            password,
            company_id: companyAdmin.company_id,
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

    showMessage("Agente cadastrado nesta empresa.", "success");
    await loadAgents();
};

window.toggleAgentActive = async function toggleAgentActive(agentId, currentValue) {
    const { error } = await supabase
        .from("agents")
        .update({ active_today: !currentValue })
        .eq("id", agentId)
        .eq("company_id", companyAdmin.company_id);

    if (error) {
        console.error(error);
        showMessage("Erro ao atualizar agente: " + error.message, "error");
        return;
    }

    showMessage("Agente atualizado.", "success");
    await loadAgents();
};

async function loadPassengers() {
    const { data, error } = await supabase
        .from("passengers")
        .select("*")
        .eq("company_id", companyAdmin.company_id)
        .order("name", { ascending: true });

    const box = document.getElementById("passengersList");

    if (error) {
        console.error(error);
        box.innerHTML = "<p>Erro ao carregar passageiros.</p>";
        return;
    }

    document.getElementById("totalPassengers").textContent = data?.length || 0;

    if (!data || !data.length) {
        box.innerHTML = "<p>Nenhum passageiro cadastrado nesta empresa.</p>";
        return;
    }

    box.innerHTML = data.map(passenger => `
        <div class="agent-card">
            <p><strong>Nome:</strong> ${escapeHtml(passenger.name || "-")}</p>
            <p><strong>E-mail:</strong> ${escapeHtml(passenger.email || "-")}</p>
            <p><strong>Telefone:</strong> ${escapeHtml(passenger.phone || passenger.whatsapp || "-")}</p>
        </div>
    `).join("");
}

async function loadRequests() {
    const { data, error } = await supabase
        .from("requests")
        .select("*")
        .eq("company_id", companyAdmin.company_id)
        .order("created_at", { ascending: false });

    const box = document.getElementById("requestsList");

    if (error) {
        console.error(error);
        box.innerHTML = "<p>Erro ao carregar atendimentos.</p>";
        return;
    }

    document.getElementById("totalRequests").textContent = data?.length || 0;

    if (!data || !data.length) {
        box.innerHTML = "<p>Nenhum atendimento encontrado nesta empresa.</p>";
        return;
    }

    box.innerHTML = data.map(req => `
        <div class="agent-card">
            <p><strong>Passageiro:</strong> ${escapeHtml(req.passenger_name || "-")}</p>
            <p><strong>Agente:</strong> ${escapeHtml(req.agent_name || "-")}</p>
            <p><strong>Status:</strong> ${escapeHtml(req.status || "-")}</p>
            <p><strong>Origem:</strong> ${escapeHtml(req.passenger_location || "-")}</p>
            <p><strong>Destino:</strong> ${escapeHtml(req.destination_location || "-")}</p>
        </div>
    `).join("");
}

window.logoutCompanyAdmin = function logoutCompanyAdmin() {
    localStorage.removeItem("aeroCompanyAdmin");
    window.location.href = "company-admin-login.html";
};

async function initialize() {
    if (!checkCompanyAdminAccess()) return;

    await loadAgents();
    await loadPassengers();
    await loadRequests();
}

document.addEventListener("DOMContentLoaded", initialize);