import { supabase } from "./supabase.js";

const form = document.getElementById("globalAdminLoginForm");
const messageBox = document.getElementById("message");

function showMessage(text, type = "info") {
    messageBox.textContent = text;
    messageBox.className = `message ${type}`;
    messageBox.style.display = "block";
}

function normalizeEmail(email) {
    return String(email || "").trim().toLowerCase();
}

async function loginGlobalAdmin(event) {
    event.preventDefault();

    const email = normalizeEmail(document.getElementById("email").value);
    const password = document.getElementById("password").value;

    const { data, error } = await supabase
        .from("aa_global_admins")
        .select("*")
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
        showMessage("Login inválido para Admin Global.", "error");
        return;
    }

    const session = {
        type: "global_admin",
        id: data.id,
        name: data.name,
        email: data.email,
        role: data.role
    };

    localStorage.setItem("aeroGlobalAdmin", JSON.stringify(session));
    localStorage.removeItem("aeroCompanyAdmin");

    window.location.href = "global-admin.html";
}

form.addEventListener("submit", loginGlobalAdmin);