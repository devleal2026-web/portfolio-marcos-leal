import { selectOne } from "./config.js";

window.loginAdmin = async () => {
    const email = document.getElementById("email").value.trim().toLowerCase();
    const password = document.getElementById("password").value.trim();
    const message = document.getElementById("message");

    message.textContent = "Verificando...";

    try {
        let data = await selectOne("users", {
            email,
            password
        });

        if (!data) {
            data = await selectOne("usuarios", {
                email,
                password
            });
        }

        if (!data) {
            message.textContent = "Login invalido. Confira email, senha e tabela users/usuarios.";
            return;
        }

        localStorage.removeItem("passenger");

        localStorage.setItem("user", JSON.stringify({
            id: data.id,
            name: data.name || data.nome || "Administrador",
            email: data.email,
            role: "admin"
        }));

        location.href = "admin.html";

    } catch (error) {
        console.error(error);
        message.textContent = "Erro no banco: " + error.message;
    }
};