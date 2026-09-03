import { loginPassengerAccount } from "./login-utils.js?v=20260903-rpc-login";

window.loginPassenger = async () => {
    await loginPassengerAccount({
        email: document.getElementById("email").value,
        password: document.getElementById("password").value,
        message: document.getElementById("message")
    });
};

