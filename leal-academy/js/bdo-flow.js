/*==========================================================
BDO FLOW
Baggage Delivery Order
==========================================================*/

"use strict";

const BdoFlow = (() => {

    const CASE_TABLES = {
        AHL: "ahl_cases",
        OHD: "ohd_cases",
        DPR: "dpr_cases"
    };

    const DELIVERY_SERVICES = {
        "01": "LOGSUP",
        "02": "PASSAGEIRO RETIRA NO AEROPORTO",
        "03": "ENTREGA DIRETA / COURIER"
    };

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

    function getStation(record){
        return text(
            record?.station ||
            String(record?.reference_number || "").substring(0, 3) ||
            "GRU"
        );
    }

    function getAirline(record){
        return text(
            record?.airline ||
            String(record?.reference_number || "").substring(3, 5) ||
            "YY"
        );
    }

    function passengerName(record){
        return text(record?.nm || record?.passenger_name || record?.name || "");
    }

    function tagNumber(record){
        return text(record?.tn || record?.tag_number || record?.xt || "");
    }

    function flightInfo(record){
        return text(record?.fd || record?.flight || record?.fo || "");
    }

    function bagDescription(record){
        const parts = [
            record?.ct,
            record?.bi,
            record?.bw ? `${record.bw}KG` : "",
            record?.cc,
            record?.description
        ].filter(Boolean);

        return text(parts.join(" / "));
    }

    async function open(caseType, caseId){
        currentCaseType = text(caseType);
        currentCaseId = caseId;

        if(!CASE_TABLES[currentCaseType]){
            alert("BDO disponível apenas para AHL, OHD e DPR.");
            return;
        }

        const { data, error } = await supabaseClient
            .from(CASE_TABLES[currentCaseType])
            .select("*")
            .eq("id", caseId)
            .single();

        if(error){
            console.error(error);
            alert("Não foi possível carregar o processo para criar o BDO.");
            return;
        }

        currentCase = data;
        showModal();
    }

    function showModal(){
        const old = document.getElementById("bdoFlowModal");

        if(old){
            old.remove();
        }

        const station = getStation(currentCase);
        const airline = getAirline(currentCase);
        const reference = currentCase.reference_number || "-";
        const today = new Date().toISOString().slice(0, 10);

        const html = `
            <div class="modal fade" id="bdoFlowModal" tabindex="-1">
                <div class="modal-dialog modal-xl modal-dialog-scrollable">
                    <div class="modal-content bg-dark text-light">

                        <div class="modal-header border-secondary">
                            <div>
                                <h5 class="modal-title">
                                    BDO - Baggage Delivery Order
                                </h5>
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

                            <div class="alert alert-info">
                                Crie a ordem de entrega somente quando a bagagem estiver disponível
                                e o passageiro concordar com a forma de entrega ou retirada.
                            </div>

                            <div class="row g-3">
                                <div class="col-md-3">
                                    <label class="form-label">Base responsável</label>
                                    <input id="bdoStation" class="form-control" value="${station}">
                                </div>

                                <div class="col-md-3">
                                    <label class="form-label">Companhia</label>
                                    <input id="bdoAirline" class="form-control" value="${airline}">
                                </div>

                                <div class="col-md-3">
                                    <label class="form-label">Data da entrega</label>
                                    <input id="bdoDeliveryDate" type="date" class="form-control" value="${today}">
                                </div>

                                <div class="col-md-3">
                                    <label class="form-label">Data/hora programada</label>
                                    <input id="bdoScheduledAt" type="datetime-local" class="form-control">
                                </div>

                                <div class="col-md-4">
                                    <label class="form-label">Delivery Service</label>
                                    <select id="bdoDeliveryService" class="form-select">
                                        <option value="01">01 - LOGSUP</option>
                                        <option value="02" selected>02 - PASSAGEIRO RETIRA NO AEROPORTO</option>
                                        <option value="03">03 - ENTREGA DIRETA / COURIER</option>
                                    </select>
                                </div>

                                <div class="col-md-2">
                                    <label class="form-label">Custo</label>
                                    <input id="bdoCostAmount" type="number" step="0.01" class="form-control" value="0">
                                </div>

                                <div class="col-md-2">
                                    <label class="form-label">Moeda</label>
                                    <input id="bdoCostCurrency" class="form-control" value="BRL">
                                </div>

                                <div class="col-md-2">
                                    <label class="form-label">Recharge Station</label>
                                    <input id="bdoRechargeStation" class="form-control">
                                </div>

                                <div class="col-md-2">
                                    <label class="form-label">Recharge Airline</label>
                                    <input id="bdoRechargeAirline" class="form-control">
                                </div>

                                <div class="col-md-4">
                                    <label class="form-label">Empresa de entrega</label>
                                    <input id="bdoDeliveryCompany" class="form-control" placeholder="Ex.: transportadora, app ou retirada no aeroporto">
                                </div>

                                <div class="col-md-4">
                                    <label class="form-label">Contato</label>
                                    <input id="bdoDeliveryContact" class="form-control" placeholder="Telefone, e-mail ou responsável">
                                </div>

                                <div class="col-md-4">
                                    <label class="form-label">E-mail</label>
                                    <input id="bdoEmail" class="form-control" value="${escapeHtml(currentCase.ea || "")}">
                                </div>

                                <div class="col-12">
                                    <label class="form-label">Endereço / Local de retirada</label>
                                    <textarea id="bdoDeliveryAddress" rows="2" class="form-control">${escapeHtml(currentCase.pa || currentCase.ab || "")}</textarea>
                                </div>

                                <div class="col-12">
                                    <label class="form-label">Instruções de entrega</label>
                                    <textarea id="bdoDeliveryInstructions" rows="3" class="form-control">CLIENTE RETIRA BAGAGEM NO AEROPORTO ${station}</textarea>
                                </div>

                                <div class="col-12">
                                    <label class="form-label">Informações suplementares</label>
                                    <textarea id="bdoSupplementaryInfo" rows="3" class="form-control">${escapeHtml(bagDescription(currentCase))}</textarea>
                                </div>
                            </div>

                            <hr class="border-secondary">

                            <div class="row g-3">
                                <div class="col-md-3">
                                    <div class="form-check mt-4">
                                        <input id="bdoCloseCase" class="form-check-input" type="checkbox">
                                        <label class="form-check-label" for="bdoCloseCase">
                                            Encerrar processo após criar BDO
                                        </label>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <label class="form-label">RL - Reason for Loss</label>
                                    <input id="bdoReasonLoss" class="form-control" value="${escapeHtml(currentCase.rl || "")}">
                                </div>

                                <div class="col-md-3">
                                    <label class="form-label">FS - Fault Station</label>
                                    <input id="bdoFaultStation" class="form-control" value="${escapeHtml(currentCase.fs || station)}">
                                </div>

                                <div class="col-md-3">
                                    <label class="form-label">Station de encerramento</label>
                                    <input id="bdoCloseStation" class="form-control" value="${station}">
                                </div>
                            </div>

                            <label class="form-label mt-3">Mensagem BDO</label>
                            <textarea id="bdoMessage" rows="10" class="form-control font-monospace"></textarea>
                        </div>

                        <div class="modal-footer border-secondary">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                Cancelar
                            </button>

                            <button type="button" class="btn btn-outline-info" onclick="BdoFlow.preview()">
                                Gerar mensagem
                            </button>

                            <button type="button" class="btn btn-success" onclick="BdoFlow.save()">
                                Criar BDO
                            </button>
                        </div>

                    </div>
                </div>
            </div>
        `;

        document.body.insertAdjacentHTML("beforeend", html);

        document
            .getElementById("bdoDeliveryService")
            ?.addEventListener("change", updateDeliveryDefaults);

        bootstrap.Modal
            .getOrCreateInstance(document.getElementById("bdoFlowModal"))
            .show();

        preview();
    }

    function updateDeliveryDefaults(){
        const service = value("bdoDeliveryService");

        if(service === "02"){
            setValue("bdoCostAmount", "0");
            setValue(
                "bdoDeliveryInstructions",
                `CLIENTE RETIRA BAGAGEM NO AEROPORTO ${text(value("bdoStation"))}`
            );
        }
    }

    function buildMessage(bdoReference = ""){
        const station = text(value("bdoStation"));
        const service = value("bdoDeliveryService");
        const serviceLabel = DELIVERY_SERVICES[service] || service;
        const closeCase = document.getElementById("bdoCloseCase")?.checked;

        const lines = [
            `>WM BDO ${text(bdoReference || "PREVIEW")}`,
            `${currentCaseType} ${text(currentCase.reference_number)}`,
            `NM ${passengerName(currentCase) || "-"}`,
            `TN ${tagNumber(currentCase) || "-"}`,
            `FD ${flightInfo(currentCase) || "-"}`,
            `DS ${service} ${serviceLabel}`,
            `DD ${text(value("bdoDeliveryDate"))}`,
            `ST ${station}`,
            `CT ${text(value("bdoDeliveryContact")) || "-"}`,
            `AD ${text(value("bdoDeliveryAddress")) || "-"}`,
            `SI ${text(value("bdoDeliveryInstructions")) || "-"}`,
            `SP ${text(value("bdoSupplementaryInfo")) || "-"}`,
            "-"
        ];

        if(closeCase){
            lines.push(
                `CLOSE ${currentCaseType} ${text(currentCase.reference_number)}`,
                `RL ${text(value("bdoReasonLoss")) || "-"}`,
                `FS ${text(value("bdoFaultStation")) || "-"}`,
                `CS ${text(value("bdoCloseStation")) || station}`
            );
        }

        lines.push(`AG ${station}`);

        return lines.join("\n");
    }

    function preview(){
        const field = document.getElementById("bdoMessage");

        if(field){
            field.value = buildMessage();
        }
    }

    async function generateReference(){
        const { data, error } = await supabaseClient.rpc(
            "gerar_bdo_reference_number",
            {
                p_station: text(value("bdoStation")),
                p_airline: text(value("bdoAirline"))
            }
        );

        if(error){
            console.error(error);
            alert(
                "Não foi possível gerar a referência BDO. " +
                "Verifique se o SQL do BDO foi executado no Supabase."
            );
            return "";
        }

        return data || "";
    }

    async function save(){
        if(!currentCase){
            alert("Nenhum processo carregado para criar BDO.");
            return;
        }

        const bdoReference = await generateReference();

        if(!bdoReference){
            return;
        }

        const message = buildMessage(bdoReference);
        setValue("bdoMessage", message);

        const service = value("bdoDeliveryService");
        const closeCase = document.getElementById("bdoCloseCase")?.checked || false;

        const payload = {
            case_type: currentCaseType,
            case_id: currentCaseId,
            reference_number: currentCase.reference_number,
            bdo_reference: bdoReference,
            station: text(value("bdoStation")),
            airline: text(value("bdoAirline")),
            delivery_station: text(value("bdoStation")),
            delivery_date: value("bdoDeliveryDate") || null,
            scheduled_datetime: value("bdoScheduledAt") || null,
            delivery_service: service,
            delivery_service_label: DELIVERY_SERVICES[service] || service,
            delivery_cost_amount: value("bdoCostAmount") === "" ? 0 : Number(value("bdoCostAmount")),
            delivery_cost_currency: text(value("bdoCostCurrency")) || "BRL",
            recharge_station: text(value("bdoRechargeStation")),
            recharge_airline: text(value("bdoRechargeAirline")),
            delivery_company: value("bdoDeliveryCompany"),
            delivery_contact: value("bdoDeliveryContact"),
            delivery_address: value("bdoDeliveryAddress"),
            delivery_instructions: value("bdoDeliveryInstructions"),
            email: value("bdoEmail"),
            supplementary_info: value("bdoSupplementaryInfo"),
            close_requested: closeCase,
            close_confirmed: closeCase,
            close_date: closeCase ? new Date().toISOString() : null,
            close_station: text(value("bdoCloseStation")),
            reason_for_loss: text(value("bdoReasonLoss")),
            fault_station: text(value("bdoFaultStation")),
            status: closeCase ? "PROCESSO ENCERRADO" : "CRIADO",
            message: message
        };

        const { error } = await supabaseClient
            .from("bdo_orders")
            .insert([payload]);

        if(error){
            console.error(error);
            alert(
                "Não foi possível salvar o BDO. " +
                "Verifique se a tabela bdo_orders foi criada no Supabase."
            );
            return;
        }

        await createActionFile(payload);
        await appendToRelatedCaseHistory(payload);

        if(closeCase){
            await closeRelatedCase(payload);
        }

        await renderCurrentCaseHistory();

        alert(
            closeCase
                ? `BDO ${bdoReference} criado e processo encerrado com sucesso.`
                : `BDO ${bdoReference} criado com sucesso.`
        );

        bootstrap.Modal
            .getInstance(document.getElementById("bdoFlowModal"))
            ?.hide();

        refreshCurrentList();
    }

    async function createActionFile(payload){
        const actionPayload = {
            case_type: payload.case_type,
            case_id: payload.case_id,
            reference_number: payload.reference_number,
            station: payload.station,
            airline: payload.airline,
            action_code: "BDO",
            action_category: "ACTION_MESSAGES",
            action_category_label: "Action Messages",
            action_title: "Delivery Order",
            action_description: "Ordem de entrega de bagagem criada para o processo.",
            status: payload.close_confirmed ? "ENCERRADO" : "PENDENTE",
            priority: "NORMAL",
            assigned_to: payload.station,
            forward_to: payload.delivery_station,
            message: payload.message,
            history: [
                {
                    at: new Date().toISOString(),
                    event: payload.close_confirmed
                        ? "BDO criado e processo encerrado"
                        : "BDO criado",
                    bdo_reference: payload.bdo_reference,
                    case_reference: payload.reference_number
                }
            ]
        };

        const { error } = await supabaseClient
            .from("action_files")
            .insert([actionPayload]);

        if(error){
            console.error(error);
            alert(
                "O BDO foi salvo, mas não foi possível gerar o registro no Action File. " +
                "Verifique a tabela action_files no Supabase."
            );
        }
    }

    async function closeRelatedCase(payload){
        const table = CASE_TABLES[payload.case_type];

        if(!table){
            return;
        }

        const updatePayload = {
            status: "ENCERRADO",
            closed_at: new Date().toISOString()
        };

        if(payload.case_type === "AHL" || payload.case_type === "DPR"){
            updatePayload.rl = payload.reason_for_loss || currentCase.rl || "";
            updatePayload.fs = payload.fault_station || currentCase.fs || "";
        }

        const { error } = await supabaseClient
            .from(table)
            .update(updatePayload)
            .eq("id", payload.case_id);

        if(error){
            console.error(error);
            alert(
                "O BDO foi criado, mas o encerramento automático do processo não foi concluído."
            );
        }
    }

    function buildCaseHistoryEntry(payload){
        return [
            `[${new Date().toLocaleString("pt-BR")}] BDO ${payload.bdo_reference} criado.`,
            `Processo: ${payload.reference_number}`,
            `Servico: ${payload.delivery_service_label || "-"}`,
            `Entrega: ${payload.delivery_station || "-"}`,
            `Instrucao: ${payload.delivery_instructions || "-"}`
        ].join(" ");
    }

    async function appendToRelatedCaseHistory(payload){
        const table = CASE_TABLES[payload.case_type];

        if(!table || !currentCase){
            return;
        }

        const historyField = Object.prototype.hasOwnProperty.call(currentCase, "ff")
            ? "ff"
            : Object.prototype.hasOwnProperty.call(currentCase, "description")
                ? "description"
                : "";

        if(!historyField){
            return;
        }

        const atual = String(currentCase[historyField] || "").trim();
        const linha = buildCaseHistoryEntry(payload);

        const updatePayload = {
            [historyField]: atual
                ? `${atual}\n${linha}`
                : linha
        };

        const { error } = await supabaseClient
            .from(table)
            .update(updatePayload)
            .eq("id", payload.case_id);

        if(error){
            console.error(error);
            alert(
                "O BDO foi salvo, mas não foi possível anexar a nota ao histórico do processo."
            );
            return;
        }

        currentCase = {
            ...currentCase,
            ...updatePayload
        };
    }

    async function renderCurrentCaseHistory(){
        const containerByType = {
            AHL: "bdoHistoryAhl",
            OHD: "bdoHistoryOhd",
            DPR: "bdoHistoryDpr"
        };

        const containerId = containerByType[currentCaseType];

        if(containerId){
            await renderCaseHistory(currentCaseType, currentCaseId, containerId);
        }
    }

    async function renderCaseHistory(caseType, caseId, containerId){
        const container = document.getElementById(containerId);
        const normalizedType = text(caseType);

        if(!container || !CASE_TABLES[normalizedType] || !caseId){
            return;
        }

        const { data, error } = await supabaseClient
            .from("bdo_orders")
            .select("*")
            .eq("case_type", normalizedType)
            .eq("case_id", caseId)
            .order("created_at", { ascending:false });

        if(error){
            console.error(error);
            container.innerHTML = `
                <div class="alert alert-danger mb-0">
                    Não foi possível carregar o histórico BDO deste processo.
                </div>
            `;
            return;
        }

        if(!data || data.length === 0){
            container.innerHTML = `
                <div class="text-secondary small">
                    Nenhum BDO criado para este processo.
                </div>
            `;
            return;
        }

        container.innerHTML = data.map(order => {
            const statusClass = order.status === "PROCESSO ENCERRADO"
                ? "bg-secondary"
                : "bg-success";

            return `
                <div class="border border-secondary rounded p-3 mb-2 bg-dark text-light">
                    <div class="d-flex justify-content-between align-items-center gap-2 flex-wrap">
                        <div>
                            <strong class="text-warning">
                                BDO - Ordem de entrega criada
                            </strong>

                            <span class="badge ${statusClass} ms-2">
                                ${escapeHtml(order.status || "CRIADO")}
                            </span>
                        </div>

                        <div class="small text-secondary">
                            ${new Date(order.created_at).toLocaleString("pt-BR")}
                        </div>
                    </div>

                    <div class="mt-2 small">
                        <div>
                            <strong>BDO:</strong> ${escapeHtml(order.bdo_reference || "-")}
                        </div>
                        <div>
                            <strong>Processo:</strong> ${escapeHtml(order.reference_number || "-")}
                        </div>
                        <div>
                            <strong>Serviço:</strong> ${escapeHtml(order.delivery_service_label || "-")}
                        </div>
                        <div>
                            <strong>Entrega:</strong> ${escapeHtml(order.delivery_station || "-")}
                            ${order.delivery_date ? " - " + escapeHtml(order.delivery_date) : ""}
                        </div>
                        <div>
                            <strong>Custo:</strong>
                            ${escapeHtml(order.delivery_cost_currency || "BRL")}
                            ${Number(order.delivery_cost_amount || 0).toFixed(2)}
                        </div>
                    </div>

                    <pre class="bg-black text-light border border-secondary rounded p-2 mt-2 small mb-0">${escapeHtml(order.message || "")}</pre>
                </div>
            `;
        }).join("");
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
        save,
        renderCaseHistory
    };

})();

window.BdoFlow = BdoFlow;
