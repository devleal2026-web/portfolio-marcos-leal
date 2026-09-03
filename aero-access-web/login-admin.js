import { loginAdminAccount } from "./login-utils.js?v=20260903-rpc-login-v3";

window.loginAdmin = async () => {
    await loginAdminAccount({
        email: document.getElementById("email").value,
        password: document.getElementById("password").value,
        message: document.getElementById("message")
    });
};



