export function criarMenu(titulo) {
    const container = document.getElementById("menu-container");

    if (!container) return;

    container.innerHTML = `
        <div class="topbar">
            <div class="brand">
                <img
                    src="images/logo-aero-access.png"
                    alt="Aero Access"
                    class="brand-logo">
                <span>Aero Access</span>
            </div>

            <div class="titulo">${titulo}</div>

            <div class="botoes-menu">
                <button onclick="location.href='index.html'">Inicio</button>
                <button onclick="logoutGlobal()">Sair</button>
            </div>
        </div>
    `;
}

window.logoutGlobal = () => {
    localStorage.removeItem("passenger");
    localStorage.removeItem("user");
    localStorage.removeItem("currentRequest");
    location.href = "index.html";
};