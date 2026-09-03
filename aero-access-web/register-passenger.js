import { supabase } from "./supabase.js";

window.registerPassenger = async () => {

    const name =
        document.getElementById("name").value.trim();

    const whatsapp =
        document.getElementById("whatsapp").value.trim();

    const email =
        document.getElementById("email").value.trim();

    const password =
        document.getElementById("password").value;

    const confirmPassword =
        document.getElementById("confirmPassword").value;

    const message =
        document.getElementById("message");

    message.innerHTML = "";

    if (
        !name ||
        !whatsapp ||
        !email ||
        !password
    ) {

        message.innerHTML =
            "Preencha todos os campos.";

        return;
    }

    if(password !== confirmPassword){

        message.innerHTML =
            "As senhas não coincidem.";

        return;
    }

    const { data: existingUser } =
        await supabase
            .from("passengers")
            .select("*")
            .eq("email", email)
            .maybeSingle();

    if(existingUser){

        message.innerHTML =
            "E-mail já cadastrado.";

        return;
    }

    const { error } =
        await supabase
            .from("passengers")
            .insert([
                {
                    name,
                    phone: whatsapp,
                    email,
                    password,
                    active: true,
                    total_requests: 0
                }
            ]);

    if(error){

        console.error(error);

        alert(
            JSON.stringify(error, null, 2)
        );

        return;
    }

    message.innerHTML =
        "Cadastro realizado com sucesso.";

    setTimeout(() => {

        location.href =
            "login-passenger.html";

    }, 1500);
};