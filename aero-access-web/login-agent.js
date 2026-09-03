import { loginAgentAccount } from "./login-utils.js";

window.loginAgent = async () => {
    await loginAgentAccount({
        email: document.getElementById("email").value,
        password: document.getElementById("password").value,
        message: document.getElementById("message")
    });
};
