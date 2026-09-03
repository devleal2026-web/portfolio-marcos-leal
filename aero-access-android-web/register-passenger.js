import { supabase } from "./supabase.js";

const form = document.getElementById("registerPassengerForm");
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

async function loadCompanies() {
  if (!companySelect) return;

  companySelect.innerHTML = `<option value="">Carregando empresas...</option>`;

  const { data, error } = await supabase
    .from("aa_companies")
    .select("id, name, slug, status")
    .eq("status", "active")
    .order("name", { ascending: true });

  if (error) {
    companySelect.innerHTML = `<option value="">Erro ao carregar empresas</option>`;
    showMessage("Erro ao carregar empresas. Verifique o Supabase.", "error");
    return;
  }

  companySelect.innerHTML = `<option value="">Selecione a empresa</option>`;

  for (const company of data || []) {
    const option = document.createElement("option");
    option.value = company.id;
    option.textContent = company.name;
    companySelect.appendChild(option);
  }
}

function normalizeEmail(email) {
  return String(email || "").trim().toLowerCase();
}

async function findPassengerByEmail(email) {
  const { data, error } = await supabase
    .from("passengers")
    .select("*")
    .ilike("email", email);

  if (error) throw error;

  return data || [];
}

async function registerOrLinkPassenger(event) {
  event.preventDefault();

  const name = document.getElementById("name")?.value?.trim();
  const email = normalizeEmail(document.getElementById("email")?.value);
  const phone = document.getElementById("phone")?.value?.trim();
  const password = document.getElementById("password")?.value;
  const companyId = companySelect?.value;

  if (!name || !email || !phone || !password || !companyId) {
    showMessage("Preencha todos os campos e selecione uma empresa.", "error");
    return;
  }

  try {
    const existingPassengers = await findPassengerByEmail(email);

    const sameCompanyPassenger = existingPassengers.find(
      (passenger) => passenger.company_id === companyId
    );

    if (sameCompanyPassenger) {
      showMessage(
        "Este e-mail já está cadastrado nesta empresa. Faça login para acessar.",
        "error"
      );
      return;
    }

    const passengerWithoutCompany = existingPassengers.find(
      (passenger) => !passenger.company_id
    );

    if (passengerWithoutCompany) {
      if (
        passengerWithoutCompany.password &&
        passengerWithoutCompany.password !== password
      ) {
        showMessage(
          "Este e-mail já existe no cadastro antigo. Use a mesma senha anterior para vincular à empresa.",
          "error"
        );
        return;
      }

      const { error: updateError } = await supabase
        .from("passengers")
        .update({
          name,
          phone,
          password,
          company_id: companyId,
          updated_at: new Date().toISOString()
        })
        .eq("id", passengerWithoutCompany.id);

      if (updateError) throw updateError;

      showMessage(
        "Cadastro antigo encontrado e vinculado à empresa com sucesso. Agora você já pode fazer login.",
        "success"
      );

      form.reset();
      await loadCompanies();
      return;
    }

    const { error: insertError } = await supabase.from("passengers").insert({
      name,
      email,
      phone,
      password,
      company_id: companyId,
      created_at: new Date().toISOString()
    });

    if (insertError) throw insertError;

    showMessage("Passageiro cadastrado com sucesso.", "success");
    form.reset();
    await loadCompanies();
  } catch (error) {
    console.error(error);

    if (
      String(error.message || "").includes("duplicate") ||
      String(error.message || "").includes("ux_passengers")
    ) {
      showMessage(
        "Este e-mail já está cadastrado para esta empresa.",
        "error"
      );
      return;
    }

    showMessage("Erro ao cadastrar passageiro: " + error.message, "error");
  }
}

document.addEventListener("DOMContentLoaded", loadCompanies);

if (form) {
  form.addEventListener("submit", registerOrLinkPassenger);
}