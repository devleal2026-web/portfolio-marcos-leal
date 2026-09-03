export function checkPassengerAccess() {

    const passenger =
        JSON.parse(
            localStorage.getItem("passenger")
        );

    const user =
        JSON.parse(
            localStorage.getItem("user")
        );

    if (passenger) {
        return true;
    }

    if (
        user &&
        user.role === "admin"
    ) {
        return true;
    }

    location.href = "index.html";
}

export function checkAgentAccess() {

    const user =
        JSON.parse(
            localStorage.getItem("user")
        );

    if (!user) {

        location.href = "index.html";
        return;
    }

    if (
        user.role !== "agent" &&
        user.role !== "admin"
    ) {

        location.href = "index.html";
    }
}

export function checkAdminAccess() {

    const user =
        JSON.parse(
            localStorage.getItem("user")
        );

    if (!user) {

        location.href = "index.html";
        return;
    }

    if (
        user.role !== "admin"
    ) {

        location.href = "index.html";
    }
}