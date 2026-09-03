import { supabase } from "./supabase.js";
import { checkPassengerAccess } from "./auth.js";

checkPassengerAccess();

/* =========================
   VERIFICA LOGIN
========================= */
const passenger =
    JSON.parse(
        localStorage.getItem("passenger")
    );

if (!passenger) {

    location.href =
        "login-passenger.html";
}

/* =========================
   PREENCHE NOME
========================= */
document.addEventListener(
    "DOMContentLoaded",
    () => {

        const campo =
            document.getElementById("name");

        if (campo) {

            campo.value =
                passenger.name;

            campo.readOnly = true;
        }

        const locationSelect =
            document.getElementById("location");

        if (locationSelect) {

            locationSelect.addEventListener(
                "change",
                (e) => {

                    const campoOutro =
                        document.getElementById(
                            "otherLocation"
                        );

                    if (
                        e.target.value === "outro"
                    ) {

                        campoOutro.style.display =
                            "block";

                    } else {

                        campoOutro.style.display =
                            "none";
                    }
                }
            );
        }
    }
);

/* =========================
   SOLICITAR ATENDIMENTO
========================= */
window.requestHelp = async () => {

    const status =
        document.getElementById("status");

    let location =
        document.getElementById("location").value;

    const destination =
        document.getElementById("destination").value;

    const notes =
        document.getElementById("notes").value.trim();

    if (!location) {

        alert(
            "Selecione sua localização."
        );

        return;
    }

    if (!destination) {

        alert(
            "Selecione o destino."
        );

        return;
    }

    if (location === "outro") {

        location =
            document
                .getElementById(
                    "otherLocation"
                )
                .value
                .trim();

        if (!location) {

            alert(
                "Informe o local."
            );

            return;
        }
    }

    status.innerHTML =
        "Procurando agente disponível...";

    /* =========================
       BUSCA AGENTE LIVRE
    ========================= */
    const {
        data: agents,
        error: agentError
    } = await supabase
        .from("agents")
        .select("*")
        .eq("status", "livre")
        .order(
            "total_requests",
            {
                ascending: true
            }
        )
        .limit(1);

    if (agentError) {

        console.error(agentError);

        status.innerHTML =
            "Erro ao localizar agente.";

        return;
    }

    if (!agents || agents.length === 0) {

        status.innerHTML =
            "Nenhum agente disponível.";

        return;
    }

    const agent = agents[0];

    await supabase
        .from("agents")
        .update({
            status: "ocupado"
        })
        .eq("id", agent.id);

    /* =========================
       CRIA SOLICITAÇÃO
    ========================= */
    const { error } =
        await supabase
            .from("requests")
            .insert([
                {
                    passenger_name: passenger.name,
                    passenger_email: passenger.email,

                    passenger_location: location,
                    destination_location: destination,

                    notes: notes,

                    agent_id: agent.id,
                    agent_name: agent.name,

                    status: "pendente",
                    created_at: new Date().toISOString()
                }
            ]);

    if (error) {

        console.error(error);

        alert(
            JSON.stringify(
                error,
                null,
                2
            )
        );

        return;
    }
    await supabase
        .from("agents")
        .update({

            total_requests:
                (agent.total_requests || 0) + 1

        })
        .eq("id", agent.id);

    /* =========================
       FIDELIZAÇÃO
    ========================= */
    await supabase
        .from("passengers")
        .update({
            total_requests:
                (
                    passenger.total_requests || 0
                ) + 1
        })
        .eq(
            "id",
            passenger.id
        );

    passenger.total_requests =
        (
            passenger.total_requests || 0
        ) + 1;

    localStorage.setItem(
        "passenger",
        JSON.stringify(passenger)
    );

    status.innerHTML = `

        Solicitação enviada para
        <strong>${agent.name}</strong>

        <br><br>

        Origem:
        <strong>${location}</strong>

        <br>

        Destino:
        <strong>${destination}</strong>

        <br><br>

        Aguardando aceite do agente...

    `;

    document.getElementById("notes").value = "";
};

/* =========================
   MONITORA STATUS
========================= */
function monitorRequest() {

    supabase
        .channel(
            "passenger_realtime"
        )
        .on(
            "postgres_changes",
            {
                event: "*",
                schema: "public",
                table: "requests"
            },
            async () => {

                const { data } =
                    await supabase
                        .from("requests")
                        .select("*")
                        .eq(
                            "passenger_name",
                            passenger.name
                        )
                        .order(
                            "created_at",
                            {
                                ascending: false
                            }
                        )
                        .limit(1)
                        .single();

                if (!data) return;

                const status =
                    document.getElementById(
                        "status"
                    );

                if (
                    data.status ===
                    "pendente"
                ) {

                    status.innerHTML = `
                        Aguardando aceite do agente...
                    `;
                }

                if (
                    data.status ===
                    "em_andamento"
                ) {

                    status.innerHTML = `

                        Atendimento em andamento

                        <br>

                        Agente:
                        <strong>
                            ${data.agent_name}
                        </strong>

                    `;
                }

                if (
                    data.status ===
                    "finalizado"
                ) {

                    status.innerHTML = `

                        Atendimento finalizado.

                        <br><br>

                        Obrigado por utilizar
                        o WheelchairService.

                    `;
                }

                if (
                    data.status ===
                    "cancelado"
                ) {

                    status.innerHTML =
                        "Atendimento cancelado.";
                }
            }
        )
        .subscribe();
}

/* =========================
   LOGOUT
========================= */
window.logoutPassenger = () => {

    localStorage.removeItem(
        "passenger"
    );

    location.href =
        "index.html";
};

/* =========================
   INIT
========================= */
monitorRequest();