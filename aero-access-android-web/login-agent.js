import { supabase } from "./supabase.js";

window.loginAgent = async () => {
    const email = document.getElementById("email").value.trim().toLowerCase();
    const password = document.getElementById("password").value.trim();
    const message = document.getElementById("message");

    message.textContent = "Verificando...";

    const { data, error } = await supabase
        .from("agents")
        .select("*, aa_companies(*)")
        .eq("email", email)
        .eq("password", password)
        .eq("active", true)
        .maybeSingle();

    if (error) {
        message.textContent = "Erro no banco: " + error.message;
        return;
    }

    if (!data) {
        message.textContent = "Login invalido.";
        return;
    }

    localStorage.removeItem("passenger");

    localStorage.setItem("user", JSON.stringify({
        id: data.id,
        role: "agent",
        name: data.name,
        email: data.email,
        company_id: data.company_id,
        company: data.aa_companies
    }));

    location.href = "agent.html";
};