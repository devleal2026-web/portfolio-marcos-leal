import { supabase } from "./supabase.js";
import { saveSession } from "./session.js";

window.login = async () => {

    const email =
        document.getElementById("email").value;

    const password =
        document.getElementById("password").value;

    const { data, error } =
        await supabase
            .from("users")
            .select("*")
            .eq("email", email)
            .eq("password", password)
            .single();

    if(error){

        alert("Usuário ou senha inválidos");
        return;
    }
localStorage.removeItem("passenger");

    saveSession(data);

    if(data.role === "admin"){

        location.href =
            "admin.html";
    }

    if(data.role === "agent"){

        location.href =
            "agent.html";
    }

    if(data.role === "passenger"){

        location.href =
            "passenger.html";
    }
};