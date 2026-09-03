import { loginAdminAccount } from "./login-utils.js?v=20260903-admin-profiles";

const params = new URLSearchParams(location.search);
const adminProfile = params.get("perfil") || "operacional";
const labels = {
    operacional: "Login Admin Operacional",
    empresa: "Login Admin Empresa",
    global: "Login Admin Global"
};

document.getElementById("adminLoginTitle").textContent = labels[adminProfile] || labels.operacional;

window.loginAdmin = async () => {
    await loginAdminAccount({
        email: document.getElementById("email").value,
        password: document.getElementById("password").value,
        adminProfile,
        message: document.getElementById("message")
    });
};
