import { supabase } from "./supabase.js";
import { checkAdminAccess } from "./auth.js";



checkAdminAccess();

/* =========================
   CREATE AGENTE
========================= */
window.addAgent = async () => {

    const name =
        document.getElementById(
            "agentName"
        ).value.trim();

    const email =
        document.getElementById(
            "agentEmail"
        ).value.trim();

    const password =
        document.getElementById(
            "agentPassword"
        ).value;

    if (
        !name ||
        !email ||
        !password
    ) {

        alert(
            "Preencha todos os campos."
        );

        return;
    }

    /* =====================
       CRIA AGENTE
    ===================== */

    const {
        data: agent,
        error: agentError
    } = await supabase
        .from("agents")
        .insert([
            {
                name,
                status: "livre",
                active_today: true
            }
        ])
        .select()
        .single();

    if (agentError) {

        alert(
            agentError.message
        );

        return;
    }

    /* =====================
       CRIA LOGIN
    ===================== */

    const {
        error: loginError
    } = await supabase
        .from("agents")
        .update({
            email: email,
            password: password,
            active: true
        })
        .eq("id", agent.id);

    if (loginError) {

        alert(
            loginError.message
        );

        return;
    }

    document.getElementById(
        "agentName"
    ).value = "";

    document.getElementById(
        "agentEmail"
    ).value = "";

    document.getElementById(
        "agentPassword"
    ).value = "";

    alert(
        "Agente cadastrado com sucesso."
    );

    load();
};
/* =========================
   LISTAR AGENTES
========================= */
async function load() {

  const { data, error } = await supabase
    .from("agents")
    .select("*")
    .order("name", { ascending: true });

  const container =
    document.getElementById("agents");

  if (!container) return;

  container.innerHTML = "";

  if (error) {

    container.innerHTML =
      "<p>Erro ao carregar agentes</p>";

    return;
  }

  data.forEach(agent => {

    const div =
      document.createElement("div");

    div.className = "agent-card";

    div.innerHTML = `

      <h3>${agent.name}</h3>

      <p>
        <strong>Status:</strong>
        ${agent.status}
      </p>

      <div class="actions">

        <button
          onclick="editAgent('${agent.id}','${agent.name}')">

          Editar

        </button>

        <button
          onclick="toggleStatus('${agent.id}','${agent.status}')">

          Alterar Status

        </button>

        <button
          onclick="deleteAgent('${agent.id}')">

          Excluir

        </button>

      </div>

    `;

    container.appendChild(div);
  });
}

/* =========================
   EDITAR
========================= */
window.editAgent = async (id, currentName) => {

  const newName =
    prompt(
      "Novo nome do agente:",
      currentName
    );

  if (!newName) return;

  const { error } = await supabase
    .from("agents")
    .update({
      name: newName
    })
    .eq("id", id);

  if (error) {
    alert("Erro ao editar agente");
    return;
  }

  load();
};

/* =========================
   STATUS
========================= */
window.toggleStatus = async (id, status) => {

  const newStatus =
    status === "livre"
      ? "ocupado"
      : "livre";

  const { error } = await supabase
    .from("agents")
    .update({
      status: newStatus
    })
    .eq("id", id);

  if (error) {

    alert(
      "Erro ao alterar status"
    );

    return;
  }

  load();
};

/* =========================
   EXCLUIR
========================= */
window.deleteAgent = async (id) => {

  const confirmar =
    confirm(
      "Deseja excluir este agente?"
    );

  if (!confirmar) return;

  const { error } = await supabase
    .from("agents")
    .delete()
    .eq("id", id);

  if (error) {

    alert(
      "Erro ao excluir agente"
    );

    return;
  }

  load();
};

/* =========================
   AGENTES EM OPERAÇÃO
========================= */
async function loadAgentStatus() {

  const { data: agents } =
    await supabase
      .from("agents")
      .select("*")
      .order("name");

  const div =
    document.getElementById(
      "agentsStatus"
    );

  if (!div) return;

  div.innerHTML = "";

  for (const agent of agents || []) {

    const { data: request } =
      await supabase
        .from("requests")
        .select("*")
        .eq("agent_id", agent.id)
        .eq("status", "em_andamento")
        .maybeSingle();

    div.innerHTML += `

      <div class="agent-card">

        <h3>${agent.name}</h3>

        <p>
          <strong>Status:</strong>
          ${agent.status}
        </p>

        <p>
          <strong>Passageiro:</strong>
          ${request?.passenger_name || "-"}
        </p>

        <p>
          <strong>Origem:</strong>
          ${request?.passenger_location || "-"}
        </p>

        <p>
          <strong>Destino:</strong>
          ${request?.destination_location || "-"}
        </p>

      </div>

    `;
  }
}

/* =========================
   TEMPO REAL
========================= */
async function loadLiveRequests() {

  const { data } =
    await supabase
      .from("requests")
      .select("*")
      .neq("status", "finalizado");

  const div =
    document.getElementById(
      "liveRequests"
    );

  if (!div) return;

  div.innerHTML = "";

  data?.forEach(req => {

    div.innerHTML += `

    <div class="agent-card">

        <p>
            <strong>Passageiro:</strong>
            ${req.passenger_name || "-"}
        </p>

        <p>
             <strong>Origem:</strong>
             ${req.passenger_location || "-"}
         </p>

         <p>
             <strong>Destino:</strong>
             ${req.destination_location || "-"}
         </p>

        <p>
            <strong>Observações:</strong>
            ${req.notes || "-"}
        </p>

        <p>
            <strong>Agente:</strong>
            ${req.agent_name || "-"}
        </p>

        <p>
            <strong>Status:</strong>
            ${req.status || "-"}
        </p>

    </div>

    `;
  });
}

/* =========================
   HISTÓRICO
========================= */
async function loadHistory() {

  const { data } =
    await supabase
      .from("requests")
      .select("*")
      .in(
        "status",
        ["finalizado", "cancelado"]
      )
      .order(
        "created_at",
        { ascending: false }
      );

  const div =
    document.getElementById(
      "history"
    );

  if (!div) return;

  div.innerHTML = "";

  data?.forEach(req => {

    const criado =
      req.created_at
        ? new Date(
            req.created_at
          ).toLocaleString("pt-BR")
        : "-";

    const inicio =
      req.started_at
        ? new Date(
            req.started_at
          ).toLocaleString("pt-BR")
        : "-";

    const fim =
      req.finished_at
        ? new Date(
            req.finished_at
          ).toLocaleString("pt-BR")
        : "-";

    const cancelado =
      req.cancelled_at
        ? new Date(
            req.cancelled_at
          ).toLocaleString("pt-BR")
        : "-";
        let duracao = "-";

        if (
            req.started_at &&
            req.finished_at
        ) {

            const inicioData =
                new Date(req.started_at);

            const fimData =
                new Date(req.finished_at);

            const diffMs =
                fimData - inicioData;

            const horas =
                Math.floor(
                    diffMs / 3600000
                );

            const minutos =
                Math.floor(
                    (diffMs % 3600000) / 60000
                );

            const segundos =
                Math.floor(
                    (diffMs % 60000) / 1000
                );

            duracao =
                `${horas}h ${minutos}min ${segundos}s`;
        }

    div.innerHTML += `

      <div class="agent-card">

        <h3>
          ${req.passenger_name}
        </h3>

        <p>
          <strong>Agente:</strong>
          ${req.agent_name}
        </p>

        <p>
          <strong>Status:</strong>
          ${req.status}
        </p>

        <p>
          <strong>Solicitado:</strong>
          ${criado}
        </p>

        <p>
          <strong>Início:</strong>
          ${inicio}
        </p>

        <p>
            <strong>Término:</strong>
            ${fim}
        </p>

        <p>
            <strong>Duração:</strong>
            ${duracao}
        </p>

        <p>
            <strong>Cancelamento:</strong>
            ${cancelado}
        </p>

      </div>

    `;
  });
}

/* =========================
   DASHBOARD
========================= */
async function loadDashboard() {

    const { data: agents } =
        await supabase
            .from("agents")
            .select("*");

    const totalAgents =
        agents?.length || 0;

    const { data: requests } =
        await supabase
            .from("requests")
            .select("*");

    const totalRequests =
        requests?.length || 0;

    const activeRequests =
        requests?.filter(
            r => r.status === "em_andamento"
        ).length || 0;

    const elAgents =
        document.getElementById(
            "totalAgents"
        );

    const elRequests =
        document.getElementById(
            "totalRequests"
        );

    const elActive =
        document.getElementById(
            "activeRequests"
        );

    if (elAgents)
        elAgents.innerText =
            totalAgents;

    if (elRequests)
        elRequests.innerText =
            totalRequests;

    if (elActive)
        elActive.innerText =
            activeRequests;
}
/* =========================
   REALTIME AGENTS
========================= */
supabase
  .channel("admin_agents_crud")
  .on(
    "postgres_changes",
    {
      event: "*",
      schema: "public",
      table: "agents"
    },
    () => {

      load();
      loadAgentStatus();
      loadDashboard();
      loadRankingAgents();
      loadAgentStatusSummary();
      loadDailyStats();

    }
  )
  .subscribe();

/* =========================
   REALTIME REQUESTS
========================= */
supabase
  .channel("admin_requests_crud")
  .on(
    "postgres_changes",
    {
      event: "*",
      schema: "public",
      table: "requests"
    },
    () => {

      loadLiveRequests();
      loadHistory();
      loadAgentStatus();
      loadDashboard();
      loadRankingAgents();
      loadAgentStatusSummary();
      loadDailyStats();
      loadDailyStats();

    }
  )
  .subscribe();

/* =========================
   INIT
========================= */
load();
loadAgentStatus();
loadLiveRequests();
loadHistory();
loadDashboard();
loadRankingAgents();
loadAgentStatusSummary();
loadDailyStats();

async function loadRankingAgents() {

    const container =
        document.getElementById(
            "rankingAgents"
        );

    if (!container) return;

    const {
        data,
        error
    } = await supabase
        .from("agents")
        .select(`
            id,
            name,
            total_requests
        `)
        .order(
            "total_requests",
            {
                ascending: false
            }
        );

    if (error) {

        console.error(error);

        container.innerHTML =
            "Erro ao carregar ranking.";

        return;
    }

    if (!data || data.length === 0) {

        container.innerHTML =
            "Nenhum agente encontrado.";

        return;
    }

    let html = "";

    data.forEach(
        (agent, index) => {

            let medalha = "";

            if (index === 0)
                medalha = "🥇";

            else if (index === 1)
                medalha = "🥈";

            else if (index === 2)
                medalha = "🥉";

            else
                medalha =
                    `${index + 1}º`;

            html += `

                <div class="agent-card">

                    <strong>
                        ${medalha}
                        ${agent.name}
                    </strong>

                    <br>

                    Atendimentos:

                    <strong>
                        ${
                            agent.total_requests || 0
                        }
                    </strong>

                </div>

            `;
        }
    );

    container.innerHTML =
        html;
}

async function loadAgentStatusSummary() {

    const container =
        document.getElementById(
            "agentStatusSummary"
        );

    if (!container) return;

    const { data, error } =
        await supabase
            .from("agents")
            .select("*")
            .order(
                "name",
                {
                    ascending: true
                }
            );

    if (error) {

        console.error(error);

        container.innerHTML =
            "Erro ao carregar.";

        return;
    }

    let livres = 0;
    let ocupados = 0;

    data.forEach(agent => {

        if (
            agent.status === "livre"
        ) {

            livres++;

        } else {

            ocupados++;
        }
    });

    let html = `

        <div class="dashboard-grid">

            <div class="dashboard-card">

                <span>
                    🟢 Livres
                </span>

                <h2>
                    ${livres}
                </h2>

            </div>

            <div class="dashboard-card">

                <span>
                    🟠 Ocupados
                </span>

                <h2>
                    ${ocupados}
                </h2>

            </div>

        </div>

        <div class="card">

            <h3>
                Equipe em Tempo Real
            </h3>

    `;

    data.forEach(agent => {

        const emoji =
            agent.status === "livre"
                ? "🟢"
                : "🟠";

        html += `

            <div class="agent-card">

                <strong>
                    ${emoji}
                    ${agent.name}
                </strong>

                <br>

                Status:
                ${agent.status}

                <br>

                Atendimentos:
                ${agent.total_requests || 0}

            </div>

        `;
    });

    html += "</div>";

    container.innerHTML = html;
}

async function loadDailyStats() {

    const container =
        document.getElementById(
            "dailyStats"
        );

    if (!container) return;

    const hoje =
        new Date()
            .toISOString()
            .split("T")[0];

    const {
        data: requests,
        error
    } = await supabase
        .from("requests")
        .select("*");

    if (error) {

        container.innerHTML =
            "Erro ao carregar.";

        return;
    }

    const hojeRequests =
        requests.filter(r =>
            r.created_at &&
            r.created_at.startsWith(hoje)
        );

    const totalHoje =
        hojeRequests.length;

    const finalizados =
        hojeRequests.filter(
            r =>
                r.status === "finalizado"
        ).length;

    const cancelados =
        hojeRequests.filter(
            r =>
                r.status === "cancelado"
        ).length;

    let totalSegundos = 0;
    let atendimentosComTempo = 0;

    hojeRequests.forEach(req => {

        if (
            req.started_at &&
            req.finished_at
        ) {

            totalSegundos +=
                (
                    new Date(req.finished_at)
                    -
                    new Date(req.started_at)
                ) / 1000;

            atendimentosComTempo++;
        }
    });

    let media = "-";

    if (
        atendimentosComTempo > 0
    ) {

        const mediaSegundos =
            Math.floor(
                totalSegundos /
                atendimentosComTempo
            );

        const min =
            Math.floor(
                mediaSegundos / 60
            );

        const seg =
            mediaSegundos % 60;

        media =
            `${min}min ${seg}s`;
    }

    const agentes = {};

    hojeRequests.forEach(req => {

        if (
            !req.agent_name
        ) return;

        agentes[
            req.agent_name
        ] =
            (agentes[
                req.agent_name
            ] || 0) + 1;
    });

    const ranking =
        Object.entries(agentes);

    let melhor = "-";
    let pior = "-";

    if (ranking.length > 0) {

        ranking.sort(
            (a, b) =>
                b[1] - a[1]
        );

        melhor =
            ranking[0][0];

        pior =
            ranking[
                ranking.length - 1
            ][0];
    }

    container.innerHTML = `

        <div class="dashboard-grid">

            <div class="dashboard-card">

                <span>
                    Atendimentos Hoje
                </span>

                <h2>
                    ${totalHoje}
                </h2>

            </div>

            <div class="dashboard-card">

                <span>
                    Atendimentos Finalizados Hoje
                </span>

                <h2>
                    ${finalizados}
                </h2>

            </div>

            <div class="dashboard-card">

                <span>
                    Atendimentos Cancelados Hoje
                </span>

                <h2>
                    ${cancelados}
                </h2>

            </div>

        </div>

        <br>

        <p>
            ⏱ Tempo Médio:
            <strong>${media}</strong>
        </p>

        <p>
            🏆 Mais Ativo:
            <strong>${melhor}</strong>
        </p>

        <p>
            📉 Menos Ativo:
            <strong>${pior}</strong>
        </p>

    `;
}