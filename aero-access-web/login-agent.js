import { loginAgentAccount } from "./login-utils.js?v=20260903-rpc-login";

window.loginAgent = async () => {
    await loginAgentAccount({
        email: document.getElementById("email").value,
        password: document.getElementById("password").value,
        message: document.getElementById("message")
    });
};

