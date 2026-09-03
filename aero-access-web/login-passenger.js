import { supabase } from "./supabase.js";

window.loginPassenger = async () => {

    const email =
        document.getElementById("email").value.trim();

    const password =
        document.getElementById("password").value;

    const message =
        document.getElementById("message");

    message.innerHTML = "";

    const { data, error } =
        await supabase
            .from("passengers")
            .select("*")
            .eq("email", email)
            .eq("password", password)
            .eq("active", true)
            .single();

    if(error){

        console.error(error);

        message.innerHTML =
            "Usuário ou senha inválidos.";

        return;
    }
localStorage.removeItem("user");

    localStorage.setItem(
        "passenger",
        JSON.stringify(data)
    );

    location.href =
        "passenger.html";
};