import { supabase } from "./supabase.js";

const form = document.getElementById("companyAdminLoginForm");
const messageBox = document.getElementById("message");

function showMessage(text, type = "info") {
    messageBox.textContent = text;
    messageBox.className = `message ${type}`;
    messageBox.style.display = "block";
}

function normalizeEmail(email) {
    return String(email || "").trim().toLowerCase();
}

async function loginCompanyAdmin(event) {
    event.preventDefault();

    const email = normalizeEmail(document.getElementById("email").value);
    const password = document.getElementById("password").value;

    const { data, error } = await supabase
        .from("aa_company_admins")
        .select("*, aa_companies(*)")
        .ilike("email", email)
        .eq("password", password)
        .eq("status", "active")
        .maybeSingle();

    if (error) {
        console.error(error);
        showMessage("Erro ao fazer login: " + error.message, "error");
        return;
    }

    if (!data) {
        showMessage("Login inválido para Admin da Empresa.", "error");
        return;
    }

    if (!data.aa_companies || data.aa_companies.status !== "active") {
        showMessage("Empresa suspensa ou inativa. Contate a Aero Access.", "error");
        return;
    }

    const session = {
        type: "company_admin",
        id: data.id,
        name: data.name,
        email: data.email,
        role: data.role,
        company_id: data.company_id,
        company: data.aa_companies
    };

    localStorage.setItem("aeroCompanyAdmin", JSON.stringify(session));
    localStorage.removeItem("aeroGlobalAdmin");

    window.location.href = "company-admin.html";
}

form.addEventListener("submit", loginCompanyAdmin);