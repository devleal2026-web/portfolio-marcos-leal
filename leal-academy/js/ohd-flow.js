/*==========================================================
OHD FLOW
ROH / FOH
==========================================================*/

"use strict";

const OhdFlow = (() => {

    let currentMatch = null;
    let currentAhl = null;
    let currentOhd = null;
    let currentType = "ROH";

    function text(value){
        return String(value ?? "").trim().toUpperCase();
    }

    function valor(id){
        const campo = document.getElementById(id);
        return campo ? campo.value.trim() : "";
    }

    function stationFromReference(reference){
        const ref = text(reference);

        if(ref.length >= 3){
            return ref.substring(0, 3);
        }

        return "";
    }

    async function open(type, matchId){
        currentType = type;

        const { data: match, error } = await supabaseClient
            .from("baggage_matches")
            .select("*")
            .eq("id", matchId)
            .single();

        if(error){
            console.error(error);
            alert("Erro ao carregar match.");
            return;
        }

        currentMatch = match;

        const [{ data: ahl }, { data: ohd }] = await Promise.all([
            supabaseClient
                .from("ahl_cases")
                .select("*")
                .eq("id", match.ahl_id)
                .single(),

            supabaseClient
                .from("ohd_cases")
                .select("*")
                .eq("id", match.ohd_id)
                .single()
        ]);

        currentAhl = ahl;
        currentOhd = ohd;

        showModal();
    }

    function buildMessage(){
        if(currentType === "ROH"){
            return buildRoh();
        }

        return buildFoh();
    }

    function buildRoh(){

        const fromStation = text(valor("flowFromStation"));
        const agent = text(valor("flowAgent"));
        const notes = text(valor("flowNotes"));

        return [
            `>WM ROH AHL ${text(currentAhl.reference_number)}`,
            `OHD ${text(currentOhd.reference_number)}`,
            `NM ${text(currentAhl.nm || currentOhd.nm)}`,
            "",
            `SI ${notes}`,
            "",
            `AG ${fromStation}${agent}`
        ].join("\n");

    }

    function buildFoh(){

        const fromStation = text(valor("flowFromStation"));
        const toStation = text(valor("flowToStation"));
        const agent = text(valor("flowAgent"));
        const notes = text(valor("flowNotes"));

        const xt = text(valor("flowXt"));
        const fo = text(valor("flowFo"));

        return [
            `>WM FOH ${text(currentOhd.reference_number)}`,
            `AHL ${text(currentAhl.reference_number)}`,
            `NM ${text(currentAhl.nm || currentOhd.nm)}`,
            `XT ${xt}`,
            `FO ${fo}`,
            `FW ${toStation} .AG ${fromStation}${agent}`,
            `SI ${notes}`,
            "-",
            `AG ${fromStation}${agent}`
        ].join("\n");

    }

    function showModal(){

        const old = document.getElementById("ohdFlowModal");

        if(old){
            old.remove();
        }

        const fromStation = currentType === "ROH"
            ? stationFromReference(currentAhl.reference_number)
            : stationFromReference(currentOhd.reference_number);

        const toStation = currentType === "ROH"
            ? stationFromReference(currentOhd.reference_number)
            : stationFromReference(currentAhl.reference_number);

        const title = currentType === "ROH"
            ? "ROH - Solicitar OHD"
            : "FOH - Enviar OHD";

        const fohFields = currentType === "FOH"
            ? `
                <div class="row g-3 mb-3">

                    <div class="col-md-6">
                        <label class="form-label">XT / Tag enviada</label>
                        <input
                            id="flowXt"
                            class="form-control"
                            value="${text(currentOhd.tn)}"
                            placeholder="Ex.: LA123456">
                    </div>

                    <div class="col-md-6">
                        <label class="form-label">FO / Voo e data de envio</label>
                        <input
                            id="flowFo"
                            class="form-control"
                            value=""
                            placeholder="Ex.: 4125/30JUN">
                    </div>

                </div>
            `
            : "";

        const html = `
            <div class="modal fade" id="ohdFlowModal" tabindex="-1">
                <div class="modal-dialog modal-lg modal-dialog-scrollable">
                    <div class="modal-content bg-dark text-light">

                        <div class="modal-header border-secondary">
                            <h5 class="modal-title">${title}</h5>

                            <button
                                type="button"
                                class="btn-close btn-close-white"
                                data-bs-dismiss="modal">
                            </button>
                        </div>

                        <div class="modal-body">

                            <div class="row g-3 mb-3">

                                <div class="col-md-4">
                                    <label class="form-label">Base origem</label>
                                    <input
                                        id="flowFromStation"
                                        class="form-control"
                                        value="${fromStation}">
                                </div>

                                <div class="col-md-4">
                                    <label class="form-label">Base destino</label>
                                    <input
                                        id="flowToStation"
                                        class="form-control"
                                        value="${toStation}">
                                </div>

                                <div class="col-md-4">
                                    <label class="form-label">Agente</label>
                                    <input
                                        id="flowAgent"
                                        class="form-control"
                                        placeholder="Ex.: LEAL">
                                </div>

                            </div>

                            ${fohFields}

                            <div class="mb-3">
                                <label class="form-label">SI / Observação</label>
                                <textarea
                                    id="flowNotes"
                                    rows="3"
                                    class="form-control"
                                    placeholder="${currentType === "FOH" ? "Ex.: YRS NEEDS" : "Ex.: PLS SEND ASAP TO US"}"></textarea>
                            </div>

                            <div class="mb-3">
                                <button
                                    type="button"
                                    class="btn btn-warning"
                                    onclick="OhdFlow.preview()">
                                    Gerar mensagem
                                </button>
                            </div>

                            <label class="form-label">Mensagem SITA</label>
                            <textarea
                                id="flowMessage"
                                rows="10"
                                class="form-control font-monospace"></textarea>

                        </div>

                        <div class="modal-footer border-secondary">
                            <button
                                type="button"
                                class="btn btn-secondary"
                                data-bs-dismiss="modal">
                                Cancelar
                            </button>

                            <button
                                type="button"
                                class="btn btn-success"
                                onclick="OhdFlow.save()">
                                Salvar ${currentType}
                            </button>
                        </div>

                    </div>
                </div>
            </div>
        `;

        document.body.insertAdjacentHTML("beforeend", html);

        bootstrap.Modal
            .getOrCreateInstance(document.getElementById("ohdFlowModal"))
            .show();

        preview();

    }

    function preview(){
        const campo = document.getElementById("flowMessage");

        if(!campo){
            return;
        }

        campo.value = buildMessage();
    }

    async function save(){
        preview();

        const message = valor("flowMessage");

        if(message === ""){
            alert("Gere a mensagem antes de salvar.");
            return;
        }

        const payload = {
            match_id: currentMatch.id,

            ahl_id: currentMatch.ahl_id,
            ohd_id: currentMatch.ohd_id,

            type: currentType,
            status: currentType === "FOH" ? "ENVIADO" : "ABERTO",

            ahl_reference: currentMatch.ahl_reference,
            ohd_reference: currentMatch.ohd_reference,

            from_station: valor("flowFromStation"),
            to_station: valor("flowToStation"),
            agent: valor("flowAgent"),

            notes: valor("flowNotes"),
            message: message
        };

        const { error } = await supabaseClient
            .from("ohd_flow_messages")
            .insert([payload]);

        if(error){
            console.error(error);
            alert(error.message);
            return;
        }

        if(currentType === "FOH"){
            await supabaseClient
                .from("ohd_flow_messages")
                .update({
                    status:"RESPONDIDO"
                })
                .eq("match_id", currentMatch.id)
                .eq("type", "ROH")
                .eq("status", "ABERTO");

            await supabaseClient
                .from("ohd_cases")
                .update({
                    status:"ENCERRADO",
                    closed_at:new Date().toISOString()
                })
                .eq("id", currentMatch.ohd_id);
        }

        alert(
            currentType === "FOH"
                ? "FOH salvo. OHD encerrado automaticamente."
                : "ROH salvo com sucesso."
        );

        bootstrap.Modal
            .getInstance(document.getElementById("ohdFlowModal"))
            ?.hide();
    }

    async function renderOhdRequests(ohdId, containerId){
        const container = document.getElementById(containerId);

        if(!container || !ohdId){
            return;
        }

        const { data, error } = await supabaseClient
            .from("ohd_flow_messages")
            .select("*")
            .eq("ohd_id", ohdId)
            .order("created_at", { ascending:false });

        if(error){
            console.error(error);
            container.innerHTML = `
                <div class="alert alert-danger">
                    Erro ao carregar histórico ROH/FOH do OHD.
                </div>
            `;
            return;
        }

        renderFlowHistory(container, data, "ohd");
    }

    async function renderAhlRequests(ahlId, containerId){
        const container = document.getElementById(containerId);

        if(!container || !ahlId){
            return;
        }

        const { data, error } = await supabaseClient
            .from("ohd_flow_messages")
            .select("*")
            .eq("ahl_id", ahlId)
            .order("created_at", { ascending:false });

        if(error){
            console.error(error);
            container.innerHTML = `
                <div class="alert alert-danger">
                    Erro ao carregar histórico ROH/FOH da AHL.
                </div>
            `;
            return;
        }

        renderFlowHistory(container, data, "ahl");
    }

    function renderFlowHistory(container, data, screenType){
        if(!data || data.length === 0){
            container.innerHTML = `
                <div class="text-secondary small">
                    Nenhuma mensagem ROH/FOH registrada.
                </div>
            `;
            return;
        }

        container.innerHTML = data.map(item => {
            const isRoh = item.type === "ROH";
            const isFoh = item.type === "FOH";

            const titulo = isRoh
                ? "ROH - OHD solicitado"
                : "FOH - OHD enviado";

            const statusClass = isFoh
                ? "bg-success"
                : item.status === "ABERTO"
                    ? "bg-warning text-dark"
                    : "bg-secondary";

            const fohButton =
                screenType === "ohd" &&
                isRoh &&
                item.status === "ABERTO"
                    ? `
                        <button
                            type="button"
                            class="btn btn-success btn-sm"
                            onclick="OhdFlow.open('FOH', '${item.match_id}')">
                            Enviar FOH
                        </button>
                    `
                    : "";

            return `
                <div class="border border-secondary rounded p-3 mb-2 bg-dark text-light">
                    <div class="d-flex justify-content-between align-items-center gap-2 flex-wrap">
                        <div>
                            <strong class="${isRoh ? "text-warning" : "text-success"}">
                                ${titulo}
                            </strong>

                            <span class="badge ${statusClass} ms-2">
                                ${item.status}
                            </span>
                        </div>

                        <div class="small text-secondary">
                            ${new Date(item.created_at).toLocaleString("pt-BR")}
                        </div>
                    </div>

                    <div class="mt-2 small">
                        <div>
                            <strong>AHL:</strong> ${item.ahl_reference || "-"}
                        </div>

                        <div>
                            <strong>OHD:</strong> ${item.ohd_reference || "-"}
                        </div>

                        <div>
                            <strong>Origem:</strong> ${item.from_station || "-"}
                            |
                            <strong>Destino:</strong> ${item.to_station || "-"}
                        </div>

                        <div>
                            <strong>Agente:</strong> ${item.agent || "-"}
                        </div>
                    </div>

                    <pre class="bg-black text-light border border-secondary rounded p-2 mt-2 mb-2 small">${item.message || ""}</pre>

                    ${fohButton}
                </div>
            `;
        }).join("");
    }

    return {
        open,
        preview,
        save,
        renderOhdRequests,
        renderAhlRequests
    };

})();

window.OhdFlow = OhdFlow;