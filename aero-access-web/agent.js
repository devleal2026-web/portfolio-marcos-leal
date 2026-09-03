import { supabase } from "./supabase.js";
import { checkAgentAccess } from "./auth.js";

checkAgentAccess();

const container =
    document.getElementById("list");

/* =========================
   CARREGAR SOLICITAÇÕES
========================= */
async function loadRequests() {

    const { data, error } =
        await supabase
            .from("requests")
            .select("*")
            .in(
                "status",
                ["pendente", "em_andamento"]
            )
            .order(
                "created_at",
                { ascending: true }
            );

    if (error) {

        console.error(error);

        container.innerHTML =
            "<p>Erro ao carregar solicitações.</p>";

        return;
    }

    container.innerHTML = "";

    if (!data || data.length === 0) {

        container.innerHTML =
            "<p>Nenhuma solicitação no momento.</p>";

        return;
    }

    data.forEach(req => {

        const div =
            document.createElement("div");

        div.className = "card";

        let buttons = "";

        /* =========================
           PENDENTE
        ========================= */
        if (req.status === "pendente") {

            buttons = `

                <button
                    onclick="acceptRequest(
                        '${req.id}',
                        '${req.agent_id}'
                    )">

                    Aceitar

                </button>

            `;
        }

        /* =========================
           EM ANDAMENTO
        ========================= */
        if (req.status === "em_andamento") {

            buttons = `

                <button
                    onclick="finishRequest(
                        '${req.id}',
                        '${req.agent_id}'
                    )">

                    Finalizar

                </button>

                <button
                    onclick="cancelRequest(
                        '${req.id}',
                        '${req.agent_id}'
                    )">

                    Cancelar

                </button>

            `;
        }

        const criado =
            req.created_at
                ? new Date(
                    req.created_at
                  ).toLocaleString("pt-BR")
                : "-";

        div.innerHTML = `

            <h3>
                ${req.passenger_name || "-"}
            </h3>

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
                ${req.status}
            </p>

            <p>
                <strong>Solicitado:</strong>
                ${criado}
            </p>

            ${buttons}
        `;

        container.appendChild(div);
    });
}

/* =========================
   ACEITAR SOLICITAÇÃO
========================= */
/* =========================
   ACEITAR SOLICITAÇÃO
========================= */
window.acceptRequest =
async (requestId, agentId) => {

```
/* Busca a solicitação */

const {
    data: request,
    error: requestLoadError
} = await supabase
    .from("requests")
    .select("*")
    .eq("id", requestId)
    .single();

if (requestLoadError) {

    console.error(requestLoadError);

    alert(
        "Erro ao localizar solicitação."
    );

    return;
}

/* Verifica se já existe chat */

const {
    data: existingRoom
} = await supabase
    .from("chat_rooms")
    .select("*")
    .eq("request_id", requestId)
    .maybeSingle();

let roomId = null;

if (existingRoom) {

    roomId = existingRoom.id;

} else {

    /* Cria sala */

    const {
        data: room,
        error: roomError
    } = await supabase

        .from("chat_rooms")

        .insert([{

            request_id:
                request.id,

            passenger_name:
                request.passenger_name,

            passenger_email:
                request.passenger_email,

            agent_id:
                request.agent_id,

            agent_name:
                request.agent_name,

            active: true

        }])

        .select()
        .single();

    if (roomError) {

        console.error(roomError);

        alert(
            "Erro ao criar sala de chat."
        );

        return;
    }

    roomId = room.id;
}

localStorage.setItem(
    "chatRoomId",
    roomId
);

/* Atualiza solicitação */

const {
    error
} = await supabase
    .from("requests")
    .update({

        status:
            "em_andamento",

        started_at:
            new Date()
                .toISOString()

    })
    .eq(
        "id",
        requestId
    );

if (error) {

    console.error(error);

    alert(
        "Erro ao aceitar solicitação."
    );

    return;
}

/* Atualiza agente */

const {
    error: agentError
} = await supabase
    .from("agents")
    .update({

        status:
            "ocupado"

    })
    .eq(
        "id",
        agentId
    );

if (agentError) {

    console.error(agentError);

    alert(
        "Erro ao atualizar agente."
    );

    return;
}

loadRequests();
```

};

/* =========================
   FINALIZAR
========================= */
window.finishRequest =
async (requestId, agentId) => {

    const { error } =
        await supabase
            .from("requests")
            .update({

                status: "finalizado",

                finished_at:
                    new Date()
                        .toISOString()

            })
            .eq("id", requestId);

    if (error) {

        console.error(error);

        alert(
            "Erro ao finalizar atendimento."
        );

        return;
    }

    const {
        error: agentError
    } = await supabase
            .from("agents")
            .update({

                status: "livre"

            })
            .eq("id", agentId);

    if (agentError) {

        console.error(agentError);

        alert(
            "Erro ao atualizar agente."
        );

        return;
    }

    loadRequests();
};

/* =========================
   CANCELAR
========================= */
window.cancelRequest =
async (requestId, agentId) => {

    const { error } =
        await supabase
            .from("requests")
            .update({

                status: "cancelado",

                cancelled_at:
                    new Date()
                        .toISOString()

            })
            .eq("id", requestId);

    if (error) {

        console.error(error);

        alert(
            "Erro ao cancelar atendimento."
        );

        return;
    }

    const {
        error: agentError
    } = await supabase
            .from("agents")
            .update({

                status: "livre"

            })
            .eq("id", agentId);

    if (agentError) {

        console.error(agentError);

        alert(
            "Erro ao atualizar agente."
        );

        return;
    }

    loadRequests();
};

/* =========================
   REALTIME REQUESTS
========================= */
supabase
    .channel("requests_realtime")
    .on(
        "postgres_changes",
        {
            event: "*",
            schema: "public",
            table: "requests"
        },
        () => {

            loadRequests();

        }
    )
    .subscribe();

/* =========================
   REALTIME AGENTS
========================= */
supabase
    .channel("agents_realtime")
    .on(
        "postgres_changes",
        {
            event: "*",
            schema: "public",
            table: "agents"
        },
        () => {

            loadRequests();

        }
    )
    .subscribe();

/* =========================
   INIT
========================= */
loadRequests();

window.logoutAgent = () => {

    localStorage.removeItem("user");

    location.href = "index.html";
};