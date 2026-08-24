/*==========================================================
OPERATIONAL ACTIONS
FWD / FAH / FLZ / COH
==========================================================*/

"use strict";

const OperationalActions = (() => {

    const CASE_TABLES = {
        AHL: "ahl_cases",
        OHD: "ohd_cases",
        DPR: "dpr_cases"
    };

    const ACTIONS = {
        FWD: {
            title: "FWD - Forward Bag / Rush",
            category: "FORWARD_MESSAGES",
            categoryLabel: "Forward Messages",
            actionTitle: "Forward Bag",
            description: "Envio proativo ou operacional de bagagem com etiqueta Rush."
        },
        FAH: {
            title: "FAH - Forward Delayed Bag",
            category: "ACTION_MESSAGES",
            categoryLabel: "Action Messages",
            actionTitle: "Forward Delayed Bag",
            description: "Envio de bagagem localizada relacionada a um AHL para a base responsável pela devolução ao passageiro."
        },
        FLZ: {
            title: "FLZ - Envio ao depósito",
            category: "ACTION_MESSAGES",
            categoryLabel: "Action Messages",
            actionTitle: "Envio ao depósito",
            description: "Envio de OHD ao depósito após conferência, lacre, peso e etiqueta Rush."
        },
        COH: {
            title: "COH - Close On-Hand",
            category: "ACTION_MESSAGES",
            categoryLabel: "Action Messages",
            actionTitle: "Encerramento de OHD",
            description: "Encerramento de OHD entregue ao passageiro ou representante autorizado."
        }
    };

    let currentAction = "";
    let currentCaseType = "";
    let currentCaseId = "";
    let currentCase = null;

    function text(value){
        return String(value ?? "").trim().toUpperCase();
    }

    function value(id){
        const field = document.getElementById(id);
        return field ? field.value.trim() : "";
    }

    function setValue(id, fieldValue){
        const field = document.getElementById(id);
        if(field){
            field.value = fieldValue ?? "";
        }
    }

    function escapeHtml(value){
        return String(value ?? "")
            .replaceAll("&", "&amp;")
            .replaceAll("<", "&lt;")
            .replaceAll(">", "&gt;")
            .replaceAll('"', "&quot;")
            .replaceAll("'", "&#039;");
    }

    function stationFrom(record){
        return text(record?.station || String(record?.reference_number || "").substring(0, 3) || "GRU");
    }

    function airlineFrom(record){
        return text(record?.airline || String(record?.reference_number || "").substring(3, 5) || "YY");
    }

    function nameFrom(record){
        return text(record?.nm || record?.passenger_name || "");
    }

    function tagFrom(record){
        return text(record?.tn || record?.tag_number || "");
    }

    function flightFrom(record){
        return text(record?.fd || record?.flight || "");
    }

    function routeFrom(record){
        return text(record?.rt || record?.route || "");
    }

    function descriptionFrom(record){
        return text([
            record?.ct,
            record?.bi,
            record?.bw ? `${record.bw}KG` : "",
            record?.cc,
            record?.description
        ].filter(Boolean).join(" / "));
    }

    async function open(actionCode, caseType, caseId){
        currentAction = text(actionCode);
        currentCaseType = text(caseType);
        currentCaseId = caseId;

        if(!ACTIONS[currentAction]){
            alert("Ação operacional não reconhecida.");
            return;
        }

        if(!CASE_TABLES[currentCaseType]){
            alert("Tipo de processo não suportado para esta ação.");
            return;
        }

        if(currentAction === "FLZ" && currentCaseType !== "OHD"){
            alert("FLZ é uma ação específica para OHD.");
            return;
        }

        if(currentAction === "FAH" && currentCaseType !== "AHL"){
            alert("FAH é uma ação específica para AHL.");
            return;
        }

        if(currentAction === "COH" && currentCaseType !== "OHD"){
            alert("COH é uma ação específica para encerramento de OHD.");
            return;
        }

        const { data, error } = await supabaseClient
            .from(CASE_TABLES[currentCaseType])
            .select("*")
            .eq("id", caseId)
            .single();

        if(error){
            console.error(error);
            alert("Não foi possível carregar o processo para executar a ação.");
            return;
        }

        currentCase = data;
        showModal();
    }

    function showModal(){
        const old = document.getElementById("operationalActionModal");

        if(old){
            old.remove();
        }

        const action = ACTIONS[currentAction];
        const station = stationFrom(currentCase);
        const airline = airlineFrom(currentCase);
        const reference = currentCase.reference_number || "-";
        const today = new Date().toISOString().slice(0, 10);

        const html = `
            <div class="modal fade" id="operationalActionModal" tabindex="-1">
                <div class="modal-dialog modal-xl modal-dialog-scrollable">
                    <div class="modal-content bg-dark text-light">

                        <div class="modal-header border-secondary">
                            <div>
                                <h5 class="modal-title">${action.title}</h5>
                                <div class="small text-secondary">
                                    ${currentCaseType} ${escapeHtml(reference)}
                                </div>
                            </div>

                            <button
                                type="button"
                                class="btn-close btn-close-white"
                                data-bs-dismiss="modal">
                            </button>
                        </div>

                        <div class="modal-body">
                            ${actionIntro()}

                            <div class="row g-3">
                                <div class="col-md-3">
                                    <label class="form-label">${originLabel()}</label>
                                    <input id="opStation" class="form-control" value="${station}">
                                </div>

                                <div class="col-md-3">
                                    <label class="form-label">${airlineLabel()}</label>
                                    <input id="opAirline" class="form-control" value="${airline}">
                                </div>

                                <div class="col-md-3">
                                    <label class="form-label">${destinationLabel()}</label>
                                    <input id="opDestination" class="form-control" value="${destinationDefault()}">
                                </div>

                                <div class="col-md-3">
                                    <label class="form-label">Data da ação</label>
                                    <input id="opActionDate" type="date" class="form-control" value="${today}">
                                </div>

                                <div class="col-md-3">
                                    <label class="form-label">${rushTagLabel()}</label>
                                    <input id="opRushTag" class="form-control" placeholder="Ex.: LA123456">
                                </div>

                                <div class="col-md-4 ${currentAction === "FAH" ? "" : "d-none"}">
                                    <label class="form-label">Bag > Rush Tag Number</label>
                                    <input id="opFahRushTag" class="form-control" placeholder="Etiqueta RUSH que acompanhará a bagagem">
                                </div>

                                <div class="col-md-4 ${currentAction === "FAH" ? "" : "d-none"}">
                                    <label class="form-label">Flight > Origin Address</label>
                                    <input id="opFahOriginAddress" class="form-control" value="${station}/${airline}">
                                </div>

                                <div class="col-md-4 ${currentAction === "FAH" ? "" : "d-none"}">
                                    <label class="form-label">Flight > Rush Routing</label>
                                    <input id="opFahRushRouting" class="form-control" value="${escapeHtml(fahRushRoutingDefault())}" placeholder="Ex.: LA1234/30JUN GRU/REC">
                                </div>

                                <div class="col-md-3">
                                    <label class="form-label">Tag original</label>
                                    <input id="opOriginalTag" class="form-control" value="${escapeHtml(tagFrom(currentCase))}">
                                </div>

                                <div class="col-md-3">
                                    <label class="form-label">${flightLabel()}</label>
                                    <input id="opFlight" class="form-control" value="${escapeHtml(flightFrom(currentCase))}" placeholder="Ex.: LA1234/30JUN">
                                </div>

                                <div class="col-md-3">
                                    <label class="form-label">${routeLabel()}</label>
                                    <input id="opRoute" class="form-control" value="${escapeHtml(routeFrom(currentCase))}" placeholder="Ex.: GRU/REC">
                                </div>

                                <div class="col-md-3">
                                    <label class="form-label">Peso</label>
                                    <input id="opWeight" class="form-control" value="${escapeHtml(currentCase.bw || "")}">
                                </div>

                                <div class="col-md-3">
                                    <label class="form-label">Lacre</label>
                                    <input id="opSeal" class="form-control" placeholder="Número do lacre">
                                </div>

                                <div class="col-md-3">
                                    <label class="form-label">RL</label>
                                    <input id="opReasonLoss" class="form-control" value="${escapeHtml(currentCase.rl || "")}">
                                </div>

                                <div class="col-md-3">
                                    <label class="form-label">FS</label>
                                    <input id="opFaultStation" class="form-control" value="${escapeHtml(currentCase.fs || station)}">
                                </div>

                                <div class="col-md-3">
                                    <label class="form-label">Fault Airline</label>
                                    <input id="opFaultAirline" class="form-control" value="${airline}">
                                </div>

                                <div class="col-md-3 ${currentAction === "COH" ? "" : "d-none"}">
                                    <label class="form-label">Documento</label>
                                    <input id="opDocument" class="form-control" placeholder="CPF, RG ou passaporte">
                                </div>

                                <div class="col-md-6 ${currentAction === "COH" ? "" : "d-none"}">
                                    <label class="form-label">Recebedor</label>
                                    <input id="opReceiver" class="form-control" value="${escapeHtml(nameFrom(currentCase))}">
                                </div>

                                <div class="col-md-3 ${currentAction === "COH" ? "" : "d-none"}">
                                    <label class="form-label">Contato do recebedor</label>
                                    <input id="opReceiverContact" class="form-control" value="${escapeHtml(currentCase.cp || currentCase.bp || currentCase.ea || "")}">
                                </div>

                                <div class="col-12">
                                    <label class="form-label">SI / Observação operacional</label>
                                    <textarea id="opNotes" rows="3" class="form-control">${defaultNotes()}</textarea>
                                </div>

                                <div class="col-12">
                                    <label class="form-label">Descrição da bagagem</label>
                                    <textarea id="opBagDescription" rows="3" class="form-control">${escapeHtml(descriptionFrom(currentCase))}</textarea>
                                </div>
                            </div>

                            <label class="form-label mt-3">Mensagem ${currentAction}</label>
                            <textarea id="opMessage" rows="10" class="form-control font-monospace"></textarea>
                        </div>

                        <div class="modal-footer border-secondary">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                Cancelar
                            </button>

                            <button type="button" class="btn btn-outline-info" onclick="OperationalActions.preview()">
                                Gerar mensagem
                            </button>

                            <button type="button" class="btn btn-success" onclick="OperationalActions.save()">
                                Salvar ${currentAction}
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        `;

        document.body.insertAdjacentHTML("beforeend", html);

        bootstrap.Modal
            .getOrCreateInstance(document.getElementById("operationalActionModal"))
            .show();

        preview();
    }

    function destinationDefault(){
        const route = routeFrom(currentCase);
        const parts = route.split("/").filter(Boolean);

        if(parts.length > 0){
            return parts[parts.length - 1];
        }

        return "";
    }

    function fahRushRoutingDefault(){
        return [
            flightFrom(currentCase),
            routeFrom(currentCase),
            destinationDefault()
        ].filter(Boolean).join(" ");
    }

    function originLabel(){
        return currentAction === "FAH"
            ? "Origin Address - base origem"
            : "Base origem";
    }

    function airlineLabel(){
        return currentAction === "FAH"
            ? "Origin Airline - cia origem"
            : "Companhia";
    }

    function destinationLabel(){
        return currentAction === "FAH"
            ? "Base responsável pela entrega"
            : "Base destino";
    }

    function rushTagLabel(){
        return currentAction === "FAH"
            ? "Rush Tag Number"
            : "Rush Tag";
    }

    function flightLabel(){
        return currentAction === "FAH"
            ? "Rush Routing - voo/data"
            : "Voo / data";
    }

    function routeLabel(){
        return currentAction === "FAH"
            ? "Rush Routing - rota"
            : "Rota";
    }

    function defaultNotes(){
        if(currentAction === "FWD"){
            return "BAGAGEM ENVIADA COM ETIQUETA RUSH. INFORMAR AO PASSAGEIRO NO DESEMBARQUE.";
        }

        if(currentAction === "FAH"){
            return "BAGAGEM LOCALIZADA E ENVIADA PARA A BASE RESPONSÁVEL PELA DEVOLUÇÃO AO PASSAGEIRO.";
        }

        if(currentAction === "FLZ"){
            return "OHD CONFERIDO, EMBALADO, LACRADO E ENVIADO AO DEPÓSITO COM ETIQUETA RUSH.";
        }

        if(currentAction === "COH"){
            return "BAGAGEM ENTREGUE AO PASSAGEIRO OU REPRESENTANTE AUTORIZADO.";
        }

        return "";
    }

    function actionIntro(){
        if(currentAction === "FWD"){
            return `
                <div class="alert alert-info">
                    Use FWD para registrar o envio proativo ou operacional de bagagem.
                    Informe Rush Tag, voo/data, destino, RL, FS e companhia responsável.
                </div>
            `;
        }

        if(currentAction === "FAH"){
            return `
                <div class="alert alert-info">
                    Use FAH quando a bagagem de um AHL foi localizada em sua base,
                    mas o passageiro já está em outra localidade. Informe a etiqueta Rush,
                    a origem do envio e a rota/voo para a base que fará a devolução.
                </div>
            `;
        }

        if(currentAction === "FLZ"){
            return `
                <div class="alert alert-warning">
                    Use FLZ quando o OHD for enviado ao depósito. Antes de salvar,
                    confira conteúdo, peso, lacre, existência de ROH e anexe a mensagem à etiqueta Rush.
                </div>
            `;
        }

        if(currentAction === "COH"){
            return `
                <div class="alert alert-success">
                    Use COH somente quando o OHD foi entregue ao passageiro ou representante.
                    Registre nome, contato e documento de quem recebeu a bagagem.
                </div>
            `;
        }

        return "";
    }

    function buildMessage(reference = "PREVIEW"){
        if(currentAction === "FWD"){
            return buildFwd(reference);
        }

        if(currentAction === "FAH"){
            return buildFah(reference);
        }

        if(currentAction === "FLZ"){
            return buildFlz(reference);
        }

        if(currentAction === "COH"){
            return buildCoh(reference);
        }

        return "";
    }

    function buildFwd(reference){
        return [
            `>WM FWD ${text(reference)}`,
            `${currentCaseType} ${text(currentCase.reference_number)}`,
            `TN ${text(value("opOriginalTag")) || "-"}`,
            `RT ${text(value("opRoute")) || "-"}`,
            `FD ${text(value("opFlight")) || "-"}`,
            `FW ${text(value("opDestination")) || "-"}`,
            `XT ${text(value("opRushTag")) || "-"}`,
            `BW ${text(value("opWeight")) || "-"}`,
            `RL ${text(value("opReasonLoss")) || "-"}`,
            `FS ${text(value("opFaultStation")) || "-"}`,
            `FA ${text(value("opFaultAirline")) || "-"}`,
            `SI ${text(value("opNotes")) || "-"}`,
            "-",
            `AG ${text(value("opStation"))}`
        ].join("\n");
    }

    function buildFah(reference){
        const originAddress = text(value("opFahOriginAddress")) || [
            text(value("opStation")),
            text(value("opAirline"))
        ].filter(Boolean).join("/");

        const rushRouting = text(value("opFahRushRouting")) || [
            text(value("opFlight")),
            text(value("opRoute")),
            text(value("opDestination"))
        ].filter(Boolean).join(" ");

        const rushTag = text(value("opFahRushTag")) || text(value("opRushTag"));

        return [
            `>WM FAH ${text(reference)}`,
            `AHL ${text(currentCase.reference_number)}`,
            `ON ${originAddress || "-"}`,
            `RT ${rushRouting || "-"}`,
            `XT ${rushTag || "-"}`,
            `OB ${text(value("opOriginalTag")) || "-"}`,
            `CT ${text(currentCase.ct) || "-"}`,
            `BI ${text(currentCase.bi) || "-"}`,
            `BW ${text(value("opWeight")) || "-"}`,
            `NM ${nameFrom(currentCase) || "-"}`,
            `PA ${text(currentCase.pa) || "-"}`,
            `TA ${text(currentCase.ta) || "-"}`,
            `CP ${text(currentCase.cp || currentCase.bp) || "-"}`,
            `EA ${text(currentCase.ea) || "-"}`,
            `SI ${text(value("opNotes")) || "-"}`,
            "-",
            `AG ${text(value("opStation"))}`
        ].join("\n");
    }

    function buildFlz(reference){
        return [
            `>WM FLZ ${text(reference)}`,
            `OHD ${text(currentCase.reference_number)}`,
            `TN ${text(value("opOriginalTag")) || "-"}`,
            `XT ${text(value("opRushTag")) || "-"}`,
            `RT ${text(value("opRoute")) || "-"}`,
            `FD ${text(value("opFlight")) || "-"}`,
            `BW ${text(value("opWeight")) || "-"}`,
            `SL ${text(value("opSeal")) || "-"}`,
            `FW ${text(value("opDestination")) || "DEPÓSITO"}`,
            `CC ${text(value("opBagDescription")) || "-"}`,
            `SI ${text(value("opNotes")) || "-"}`,
            "-",
            `AG ${text(value("opStation"))}`
        ].join("\n");
    }

    function buildCoh(reference){
        return [
            `>WM COH ${text(reference)}`,
            `OHD ${text(currentCase.reference_number)}`,
            `TN ${text(value("opOriginalTag")) || "-"}`,
            `NM ${text(value("opReceiver")) || nameFrom(currentCase) || "-"}`,
            `DOC ${text(value("opDocument")) || "-"}`,
            `CT ${text(value("opReceiverContact")) || "-"}`,
            `SI ${text(value("opNotes")) || "-"}`,
            "-",
            `AG ${text(value("opStation"))}`
        ].join("\n");
    }

    function preview(){
        const field = document.getElementById("opMessage");

        if(field){
            field.value = buildMessage();
        }
    }

    async function generateReference(){
        const { data, error } = await supabaseClient.rpc(
            "gerar_operational_action_reference",
            {
                p_action_code: currentAction,
                p_station: text(value("opStation")),
                p_airline: text(value("opAirline"))
            }
        );

        if(error){
            console.error(error);
            alert(
                "Não foi possível gerar a referência da ação. " +
                "Verifique se o SQL de operational_actions foi executado no Supabase."
            );
            return "";
        }

        return data || "";
    }

    async function save(){
        const action = ACTIONS[currentAction];
        const generatedReference = await generateReference();

        if(!generatedReference){
            return;
        }

        const message = buildMessage(generatedReference);
        setValue("opMessage", message);

        const payload = {
            case_type: currentCaseType,
            case_id: currentCaseId,
            reference_number: currentCase.reference_number,
            action_reference: generatedReference,
            action_code: currentAction,
            action_category: action.category,
            station: text(value("opStation")),
            airline: text(value("opAirline")),
            destination_station: text(value("opDestination")),
            rush_tag: text(value("opFahRushTag")) || text(value("opRushTag")),
            original_tag: text(value("opOriginalTag")),
            flight: text(value("opFlight")),
            route: currentAction === "FAH"
                ? text(value("opFahRushRouting"))
                : text(value("opRoute")),
            weight: text(value("opWeight")),
            seal_number: text(value("opSeal")),
            reason_for_loss: text(value("opReasonLoss")),
            fault_station: text(value("opFaultStation")),
            fault_airline: text(value("opFaultAirline")),
            receiver_name: value("opReceiver"),
            receiver_document: value("opDocument"),
            receiver_contact: value("opReceiverContact"),
            action_date: value("opActionDate") || null,
            notes: value("opNotes"),
            bag_description: value("opBagDescription"),
            message: message,
            status: currentAction === "COH" ? "ENCERRADO" : "REGISTRADO"
        };

        const { error } = await supabaseClient
            .from("operational_actions")
            .insert([payload]);

        if(error){
            console.error(error);
            alert(
                "Não foi possível salvar a ação operacional. " +
                "Verifique se a tabela operational_actions foi criada no Supabase."
            );
            return;
        }

        await createActionFile(payload);

        if(currentAction === "COH"){
            await closeOhd(payload);
        }

        alert(`${currentAction} ${generatedReference} salvo com sucesso.`);

        bootstrap.Modal
            .getInstance(document.getElementById("operationalActionModal"))
            ?.hide();

        refreshCurrentList();
    }

    async function createActionFile(payload){
        const action = ACTIONS[payload.action_code];

        const { error } = await supabaseClient
            .from("action_files")
            .insert([{
                case_type: payload.case_type,
                case_id: payload.case_id,
                reference_number: payload.reference_number,
                station: payload.station,
                airline: payload.airline,
                action_code: payload.action_code,
                action_category: payload.action_category,
                action_category_label: action.categoryLabel,
                action_title: action.actionTitle,
                action_description: action.description,
                status: payload.action_code === "COH" ? "ENCERRADO" : "PENDENTE",
                priority: payload.action_code === "FLZ" ? "ALTA" : "NORMAL",
                assigned_to: payload.station,
                forward_to: payload.destination_station,
                message: payload.message,
                history: [
                    {
                        at: new Date().toISOString(),
                        event: `${payload.action_code} registrado`,
                        action_reference: payload.action_reference,
                        case_reference: payload.reference_number
                    }
                ]
            }]);

        if(error){
            console.error(error);
            alert("A ação foi salva, mas não foi possível criar o registro no Action File.");
        }
    }

    async function closeOhd(payload){
        const { error } = await supabaseClient
            .from("ohd_cases")
            .update({
                status: "ENCERRADO",
                closed_at: new Date().toISOString()
            })
            .eq("id", payload.case_id);

        if(error){
            console.error(error);
            alert("COH salvo, mas o OHD não foi encerrado automaticamente.");
        }
    }

    function refreshCurrentList(){
        if(currentCaseType === "AHL" && typeof carregarAhl === "function"){
            carregarAhl();
        }

        if(currentCaseType === "OHD" && typeof carregarOhd === "function"){
            carregarOhd();
        }

        if(currentCaseType === "DPR" && typeof carregarDpr === "function"){
            carregarDpr();
        }
    }

    return {
        open,
        preview,
        save
    };

})();

window.OperationalActions = OperationalActions;
