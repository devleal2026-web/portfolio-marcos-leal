export function renderShell(){

  const el = document.createElement("div");

  el.innerHTML = `
    <header style="background:#2563eb;color:white;padding:10px">
      <h3>Aero Access</h3>

      <nav>
        <button onclick="go('index.html')">Menu</button>
        <button onclick="go('passenger.html')">Passageiro</button>
        <button onclick="go('agent.html')">Agente</button>
        <button onclick="go('admin.html')">Admin</button>
      </nav>
    </header>
  `;

  document.body.prepend(el);
}

window.go = (p)=> location.href = p;