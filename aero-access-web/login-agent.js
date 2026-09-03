import { loginAgentAccount } from "./login-utils.js?v=20260903-rpc-login-v2";

window.loginAgent = async () => {
    await loginAgentAccount({
        email: document.getElementById("email").value,
        password: document.getElementById("password").value,
        message: document.getElementById("message")
    });
};


