import { supabase } from "./supabase.js";

window.loginAdmin = async () => {

    const email =
        document
            .getElementById("email")
            .value
            .trim();

    const password =
        document
            .getElementById("password")
            .value;

    const { data, error } =
        await supabase
            .from("users")
            .select("*")
            .eq("email", email)
            .eq("password", password)
            .eq("role", "admin")
            .single();

    if (error) {

        document
            .getElementById("message")
            .innerHTML =
            "Login inválido.";

        return;
    }

    localStorage.removeItem("passenger");

    localStorage.setItem(
        "user",
        JSON.stringify({
            id: data.id,
            name: data.name,
            email: data.email,
            role: "admin"
        })
    );

    location.href =
        "admin.html";
};