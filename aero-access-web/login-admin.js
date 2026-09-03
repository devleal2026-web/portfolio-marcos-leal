import { loginAdminAccount } from "./login-utils.js";

window.loginAdmin = async () => {
    await loginAdminAccount({
        email: document.getElementById("email").value,
        password: document.getElementById("password").value,
        message: document.getElementById("message")
    });
};
