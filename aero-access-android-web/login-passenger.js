import { supabase } from "./supabase.js";

const form = document.getElementById("loginPassengerForm");
const companySelect = document.getElementById("companyId");
const messageBox = document.getElementById("message");

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

async function loadCompanies() {
    if (!companySelect) return;

    companySelect.innerHTML = `<option value="">Carregando empresas...</option>`;

    try {
        const { data, error } = await supabase
            .from("aa_companies")
            .select("id, name, slug, status")
            .eq("status", "active")
            .order("name", { ascending: true });

        if (error) {
            console.error("Erro Supabase ao carregar empresas:", error);
            companySelect.innerHTML = `<option value="">Erro ao carregar empresas</option>`;
            showMessage("Erro ao carregar empresas.", "error");
            return;
        }

        if (!data || data.length === 0) {
            companySelect.innerHTML = `<option value="">Nenhuma empresa ativa cadastrada</option>`;
            showMessage("Nenhuma empresa ativa cadastrada.", "error");
            return;
        }

        companySelect.innerHTML = `<option value="">Selecione a empresa</option>`;

        data.forEach((company) => {
            const option = document.createElement("option");
            option.value = company.id;
            option.textContent = company.name;
            companySelect.appendChild(option);
        });
    } catch (error) {
        console.error("Falha geral ao carregar empresas:", error);
        companySelect.innerHTML = `<option value="">Erro ao carregar empresas</option>`;
        showMessage("Erro ao carregar empresas. Confira a conexão com o Supabase.", "error");
    }
}

function savePassengerSession(passenger) {
    const session = {
        type: "passenger",
        role: "passenger",
        id: passenger.id,
        name: passenger.name,
        email: passenger.email,
        phone: passenger.phone || passenger.whatsapp || "",
        whatsapp: passenger.whatsapp || passenger.phone || "",
        company_id: passenger.company_id,
        company: passenger.aa_companies || passenger.company || null,
        passenger
    };

    localStorage.setItem("aeroUserType", "passenger");
    localStorage.setItem("aeroPassenger", JSON.stringify(passenger));
    localStorage.setItem("aeroCurrentUser", JSON.stringify(session));

    localStorage.setItem("currentUser", JSON.stringify(session));
    localStorage.setItem("currentPassenger", JSON.stringify(passenger));
    localStorage.setItem("passenger", JSON.stringify(passenger));
    localStorage.setItem("userType", "passenger");
}

async function loginPassenger(event) {
    if (event) event.preventDefault();

    const email = normalizeEmail(document.getElementById("email")?.value);
    const password = document.getElementById("password")?.value;
    const companyId = companySelect?.value;

    if (!email || !password || !companyId) {
        showMessage("Informe e-mail, senha e empresa.", "error");
        return;
    }

    try {
        const { data, error } = await supabase
            .from("passengers")
            .select("*, aa_companies(*)")
            .ilike("email", email)
            .eq("password", password)
            .eq("company_id", companyId)
            .maybeSingle();

        if (error) {
            console.error("Erro Supabase login passageiro:", error);
            throw error;
        }

        if (!data) {
            const { data: oldPassenger, error: oldError } = await supabase
                .from("passengers")
                .select("*")
                .ilike("email", email)
                .eq("password", password)
                .is("company_id", null)
                .maybeSingle();

            if (oldError) {
                console.error("Erro ao verificar passageiro antigo:", oldError);
            }

            if (oldPassenger) {
                showMessage(
                    "Seu cadastro antigo ainda não está vinculado a uma empresa. Acesse o cadastro, escolha a empresa e use a mesma senha para vincular.",
                    "error"
                );
                return;
            }

            showMessage("Login inválido para esta empresa.", "error");
            return;
        }

        savePassengerSession(data);

        window.location.href = "passenger.html";
    } catch (error) {
        console.error(error);
        showMessage("Erro ao fazer login: " + error.message, "error");
    }
}

window.loginPassenger = loginPassenger;

document.addEventListener("DOMContentLoaded", loadCompanies);

if (form) {
    form.addEventListener("submit", loginPassenger);
}