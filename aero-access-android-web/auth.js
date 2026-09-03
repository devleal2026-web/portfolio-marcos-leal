export function getPassenger() {
    return JSON.parse(localStorage.getItem("passenger") || "null");
}

export function getUser() {
    return JSON.parse(localStorage.getItem("user") || "null");
}

export function checkPassengerAccess() {
    if (getPassenger()) return true;
    location.href = "login-passenger.html";
    return false;
}

export function checkAgentAccess() {
    const user = getUser();

    if (!user || (user.role !== "agent" && user.role !== "admin")) {
        location.href = "login-agent.html";
        return false;
    }

    return true;
}

export function checkAdminAccess() {
    const user = getUser();

    if (!user || user.role !== "admin") {
        location.href = "login-admin.html";
        return false;
    }

    return true;
}

export function logoutAll() {
    localStorage.removeItem("passenger");
    localStorage.removeItem("user");
    localStorage.removeItem("currentRequest");
    location.href = "index.html";
}