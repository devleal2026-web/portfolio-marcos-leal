const ADMIN_ROLES = [
    "admin",
    "admin_operacional",
    "operational_admin",
    "admin_empresa",
    "company_admin",
    "admin_global",
    "global_admin"
];

function isAdminRole(role) {
    return ADMIN_ROLES.includes(String(role || "").trim().toLowerCase());
}

export function checkPassengerAccess() {
    const passenger = JSON.parse(localStorage.getItem("passenger"));
    const user = JSON.parse(localStorage.getItem("user"));

    if (passenger || isAdminRole(user?.role)) {
        return true;
    }

    location.href = "index.html";
    return false;
}

export function checkAgentAccess() {
    const user = JSON.parse(localStorage.getItem("user"));

    if (!user) {
        location.href = "index.html";
        return false;
    }

    if (user.role !== "agent" && !isAdminRole(user.role)) {
        location.href = "index.html";
        return false;
    }

    return true;
}

export function checkAdminAccess() {
    const user = JSON.parse(localStorage.getItem("user"));

    if (!user || !isAdminRole(user.role)) {
        location.href = "index.html";
        return false;
    }

    return true;
}
