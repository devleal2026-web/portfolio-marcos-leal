import { loginPassengerAccount } from "./login-utils.js";

window.loginPassenger = async () => {
    await loginPassengerAccount({
        email: document.getElementById("email").value,
        password: document.getElementById("password").value,
        message: document.getElementById("message")
    });
};
