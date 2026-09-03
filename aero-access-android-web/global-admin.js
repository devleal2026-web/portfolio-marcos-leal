import { supabase } from "./supabase.js";

const messageBox = document.getElementById("message");

let globalAdmin = null;
let companies = [];

function readJson(key) {
    try {
        return JSON.parse(localStorage.getItem(key));
    } catch {
        return null;
    }
}

function checkGlobalAdminAccess() {
    globalAdmin = readJson("aeroGlobalAdmin");

    if (!globalAdmin || globalAdmin.type !== "global_admin") {
        window.location.href = "global-admin-login.html";
        return false;
    }

    const info = document.getElementById("globalAdminInfo");
    if (info) {
        info.textContent = `Logado como ${globalAdmin.name} - Admin Global Aero Access`;
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

function slugify(value) {
    return String(value || "")
        .trim()
        .toLowerCase()
        .normalize("NFD")
        .replace(/[\u0300-\u036f]/g, "")
        .replace(/[^a-z0-9]+/g, "-")
        .replace(/^-+|-+$/g, "");
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
    return company ? company.name : "Sem empresa";
}

async function loadCompanies() {
    const { data, error } = await supabase
        .from("aa_companies")
        .select("*")
        .order("name", { ascending: true });

    if (error) {
        console.error(error);
        showMessage("Erro ao carregar empresas: " + error.message, "error");
        return;
    }

    companies = data || [];
    document.getElementById("totalCompanies").textContent = companies.length;
    renderCompanies();
    renderCompanySelect();
}

function renderCompanySelect() {
    const select = document.getElementById("adminCompanyId");
    if (!select) return;

    select.innerHTML = `<option value="">Selecione a empresa</option>`;

    companies.forEach(company => {
        const option = document.createElement("option");
        option.value = company.id;
        option.textContent = company.name;
        select.appendChild(option);
    });
}

function renderCompanies() {
    const box = document.getElementById("companiesList");

    if (!companies.length) {
        box.innerHTML = "<p>Nenhuma empresa cadastrada.</p>";
        return;
    }

    box.innerHTML = companies.map(company => `
        <div class="agent-card">
            <p><strong>Empresa:</strong> ${escapeHtml(company.name)}</p>
            <p><strong>Slug:</strong> ${escapeHtml(company.slug)}</p>
            <p><strong>Status:</strong> ${escapeHtml(company.status)}</p>
            <p><strong>Plano:</strong> ${escapeHtml(company.plan)}</p>

            <button type="button" onclick="toggleCompanyStatus('${escapeHtml(company.id)}', '${escapeHtml(company.status)}')">
                ${company.status === "active" ? "Suspender" : "Ativar"}
            </button>
        </div>
    `).join("");
}

window.createCompany = async function createCompany() {
    const name = document.getElementById("companyName").value.trim();
    const typedSlug = document.getElementById("companySlug").value.trim();
    const plan = document.getElementById("companyPlan").value;
    const slug = typedSlug ? slugify(typedSlug) : slugify(name);

    if (!name || !slug) {
        showMessage("Informe nome e identificador da empresa.", "error");
        return;
    }

    const { error } = await supabase
        .from("aa_companies")
        .insert({
            name,
            slug,
            status: "active",
            plan,
            exclusive_space: plan !== "standard"
        });

    if (error) {
        console.error(error);
        showMessage("Erro ao cadastrar empresa: " + error.message, "error");
        return;
    }

    document.getElementById("companyName").value = "";
    document.getElementById("companySlug").value = "";
    document.getElementById("companyPlan").value = "standard";

    showMessage("Empresa cadastrada com sucesso.", "success");
    await loadCompanies();
};

window.toggleCompanyStatus = async function toggleCompanyStatus(companyId, currentStatus) {
    const nextStatus = currentStatus === "active" ? "suspended" : "active";

    const { error } = await supabase
        .from("aa_companies")
        .update({
            status: nextStatus,
            updated_at: new Date().toISOString()
        })
        .eq("id", companyId);

    if (error) {
        console.error(error);
        showMessage("Erro ao atualizar empresa: " + error.message, "error");
        return;
    }

    showMessage("Status da empresa atualizado.", "success");
    await loadCompanies();
};

window.createCompanyAdmin = async function createCompanyAdmin() {
    const companyId = document.getElementById("adminCompanyId").value;
    const name = document.getElementById("companyAdminName").value.trim();
    const email = normalizeEmail(document.getElementById("companyAdminEmail").value);
    const password = document.getElementById("companyAdminPassword").value;

    if (!companyId || !name || !email || !password) {
        showMessage("Preencha empresa, nome, e-mail e senha do admin.", "error");
        return;
    }

    const { error } = await supabase
        .from("aa_company_admins")
        .insert({
            company_id: companyId,
            name,
            email,
            password,
            role: "company_admin",
            status: "active"
        });

    if (error) {
        console.error(error);
        showMessage("Erro ao criar admin: " + error.message, "error");
        return;
    }

    document.getElementById("adminCompanyId").value = "";
    document.getElementById("companyAdminName").value = "";
    document.getElementById("companyAdminEmail").value = "";
    document.getElementById("companyAdminPassword").value = "";

    showMessage("Admin da empresa criado com sucesso.", "success");
    await loadCompanyAdmins();
};

async function loadCompanyAdmins() {
    const { data, error } = await supabase
        .from("aa_company_admins")
        .select("*")
        .order("created_at", { ascending: false });

    if (error) {
        console.error(error);
        showMessage("Erro ao carregar admins: " + error.message, "error");
        return;
    }

    document.getElementById("totalCompanyAdmins").textContent = data?.length || 0;

    const box = document.getElementById("companyAdminsList");

    if (!data || !data.length) {
        box.innerHTML = "<p>Nenhum admin de empresa cadastrado.</p>";
        return;
    }

    box.innerHTML = data.map(admin => `
        <div class="agent-card">
            <p><strong>Nome:</strong> ${escapeHtml(admin.name)}</p>
            <p><strong>E-mail:</strong> ${escapeHtml(admin.email)}</p>
            <p><strong>Empresa:</strong> ${escapeHtml(getCompanyName(admin.company_id))}</p>
            <p><strong>Status:</strong> ${escapeHtml(admin.status)}</p>

            <button type="button" onclick="toggleCompanyAdminStatus('${escapeHtml(admin.id)}', '${escapeHtml(admin.status)}')">
                ${admin.status === "active" ? "Suspender" : "Ativar"}
            </button>
        </div>
    `).join("");
}

window.toggleCompanyAdminStatus = async function toggleCompanyAdminStatus(adminId, currentStatus) {
    const nextStatus = currentStatus === "active" ? "suspended" : "active";

    const { error } = await supabase
        .from("aa_company_admins")
        .update({ status: nextStatus })
        .eq("id", adminId);

    if (error) {
        console.error(error);
        showMessage("Erro ao atualizar admin: " + error.message, "error");
        return;
    }

    showMessage("Status do admin atualizado.", "success");
    await loadCompanyAdmins();
};

async function loadPassengers() {
    const { data, error } = await supabase
        .from("passengers")
        .select("*")
        .order("name", { ascending: true });

    const box = document.getElementById("passengersList");

    if (error) {
        box.innerHTML = "<p>Erro ao carregar passageiros.</p>";
        return;
    }

    if (!data || !data.length) {
        box.innerHTML = "<p>Nenhum passageiro encontrado.</p>";
        return;
    }

    box.innerHTML = data.map(passenger => `
        <div class="agent-card">
            <p><strong>Nome:</strong> ${escapeHtml(passenger.name)}</p>
            <p><strong>E-mail:</strong> ${escapeHtml(passenger.email)}</p>
            <p><strong>Empresa:</strong> ${escapeHtml(getCompanyName(passenger.company_id))}</p>
        </div>
    `).join("");
}

async function loadAgents() {
    const { data, error } = await supabase
        .from("agents")
        .select("*")
        .order("name", { ascending: true });

    const box = document.getElementById("agentsList");

    if (error) {
        box.innerHTML = "<p>Erro ao carregar agentes.</p>";
        return;
    }

    if (!data || !data.length) {
        box.innerHTML = "<p>Nenhum agente encontrado.</p>";
        return;
    }

    box.innerHTML = data.map(agent => `
        <div class="agent-card">
            <p><strong>Nome:</strong> ${escapeHtml(agent.name)}</p>
            <p><strong>E-mail:</strong> ${escapeHtml(agent.email)}</p>
            <p><strong>Empresa:</strong> ${escapeHtml(getCompanyName(agent.company_id))}</p>
            <p><strong>Status:</strong> ${escapeHtml(agent.status || "-")}</p>
        </div>
    `).join("");
}

async function loadRequests() {
    const { data, error } = await supabase
        .from("requests")
        .select("*")
        .order("created_at", { ascending: false });

    const box = document.getElementById("requestsList");

    if (error) {
        box.innerHTML = "<p>Erro ao carregar atendimentos.</p>";
        return;
    }

    document.getElementById("totalRequests").textContent = data?.length || 0;

    if (!data || !data.length) {
        box.innerHTML = "<p>Nenhum atendimento encontrado.</p>";
        return;
    }

    box.innerHTML = data.map(req => `
        <div class="agent-card">
            <p><strong>Empresa:</strong> ${escapeHtml(getCompanyName(req.company_id))}</p>
            <p><strong>Passageiro:</strong> ${escapeHtml(req.passenger_name || "-")}</p>
            <p><strong>Agente:</strong> ${escapeHtml(req.agent_name || "-")}</p>
            <p><strong>Status:</strong> ${escapeHtml(req.status || "-")}</p>
            <p><strong>Origem:</strong> ${escapeHtml(req.passenger_location || "-")}</p>
            <p><strong>Destino:</strong> ${escapeHtml(req.destination_location || "-")}</p>
        </div>
    `).join("");
}

window.logoutGlobalAdmin = function logoutGlobalAdmin() {
    localStorage.removeItem("aeroGlobalAdmin");
    window.location.href = "global-admin-login.html";
};

async function initialize() {
    if (!checkGlobalAdminAccess()) return;

    await loadCompanies();
    await loadCompanyAdmins();
    await loadPassengers();
    await loadAgents();
    await loadRequests();
}

document.addEventListener("DOMContentLoaded", initialize);