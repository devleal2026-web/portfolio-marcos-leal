import { supabase }
from "./supabase.js";

window.loginAgent =
async () => {

    const email =
        document.getElementById(
            "email"
        ).value.trim();

    const password =
        document.getElementById(
            "password"
        ).value;

    const {
        data,
        error
    } = await supabase
        .from("agents")
        .select("*")
        .eq("email", email)
        .eq("password", password)
        .eq("active", true)
        .single();

    if (error) {

        document.getElementById(
            "message"
        ).innerHTML =
            "Login inválido.";

        return;
    }

    await supabase
        .from("agents")
        .update({
            last_access:
                new Date()
                    .toISOString()
        })
        .eq("id", data.id);

    localStorage.removeItem(
        "passenger"
    );

    localStorage.setItem(
        "user",
        JSON.stringify({

            id: data.id,

            role: "agent",

            name: data.name,

            email: data.email

        })
    );

    location.href =
        "agent.html";
};