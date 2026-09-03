export function criarMenu(titulo) {

    const menu = document.createElement("div");

    menu.innerHTML = `
        <header class="topbar">

            <div class="logo">

                <img
                    src="images/logo-aero-access.png"
                    alt="Aero Access"
                    class="logo-topo">

            </div>

            <div class="titulo">
                ${titulo}
            </div>

            <div class="botoes-menu">

                <button onclick="window.location.href='index.html'">
                    Menu
                </button>

                <button onclick="window.location.href='passenger.html'">
                    Passageiro
                </button>

                <button onclick="window.location.href='login-agent.html'">
                    Agente
                </button>

                <button onclick="window.location.href='login-admin.html'">
                    Admin
                </button>

            </div>

        </header>
    `;

    document.body.prepend(menu);
}