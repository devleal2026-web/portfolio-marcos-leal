/*==========================================================
ACTION FILE
WorldTracer Simulator
==========================================================*/

"use strict";

const ActionFile = (() => {
    const ACTION_CODES = [
        {
            code:"DXF",
            title:"Documento ou dado pendente",
            description:"Solicitação de conferência, ajuste ou complemento de dados do processo."
        },
        {
            code:"EXF",
            title:"Informação extra",
            description:"Pedido de atualização, observação operacional ou informação complementar."
        },
        {
            code:"AP",
            title:"Ação pendente",
            description:"Pendência operacional que exige atuação da base ou do agente responsável."
        },
        {
            code:"FW",
            title:"Encaminhamento",
            description:"Ação de encaminhamento de mensagem, objeto, bagagem ou processo para outra base."
        },
        {
            code:"FWD",
            title:"Envio de rush bag",
            description:"Registro de envio ou encaminhamento de bagagem com etiqueta rush para outra base."
        },
        {
            code:"BDO",
            title:"Entrega de bagagem",
            description:"Registro de entrega da bagagem ao passageiro, representante ou destinatário autorizado."
        },
        {
            code:"AA",
            title:"Ação administrativa",
            description:"Acompanhamento administrativo, auditoria, revisão ou encerramento operacional."
        },
        {
            code:"ROH",
            title:"Request On-Hand",
            description:"Solicitação de envio de OHD relacionado a um AHL."
        },
        {
            code:"FOH",
            title:"Forward On-Hand",
            description:"Envio de OHD para a base solicitante ou destino definido."
        },
        {
            code:"GEN",
            title:"Ação geral",
            description:"Ação operacional genérica para casos fora dos códigos principais."
        }
    ];

    const CASE_TABLES = {
        AHL:"ahl_cases",
        OHD:"ohd_cases",
        DPR:"dpr_cases",
        RFP:"rfp_cases"
    };

    let registros = [];
    let registroAtual = null;

    document.addEventListener("DOMContentLoaded", iniciar);

    function iniciar(){
        carregarCombos();
        configurarEventos();
        carregarActionFile();
    }

    function valor(id){
        const campo = document.getElementById(id);
        return campo ? campo.value.trim() : "";
    }

    function preencher(id, value){
        const campo = document.getElementById(id);
        if(campo){
            campo.value = value ?? "";
        }
    }

    function text(value){
        return String(value ?? "").trim().toUpperCase();
    }

    function escapeHtml(value){
        return String(value ?? "")
            .replaceAll("&", "&amp;")
            .replaceAll("<", "&lt;")
            .replaceAll(">", "&gt;")
            .replaceAll('"', "&quot;")
            .replaceAll("'", "&#039;");
    }

    function carregarCombos(){
        const actionSelect = document.getElementById("action_code");
        const filtroCodigo = document.getElementById("filtroCodigo");

        if(actionSelect){
            actionSelect.innerHTML = ACTION_CODES
                .map(item => `<option value="${item.code}">${item.code} - ${item.title}</option>`)
                .join("");
        }

        if(filtroCodigo){
            filtroCodigo.innerHTML =
                `<option value="">Todos os códigos</option>` +
                ACTION_CODES
                    .map(item => `<option value="${item.code}">${item.code}</option>`)
                    .join("");
        }
    }

    function configurarEventos(){
        document.getElementById("btnSalvarActionFile")?.addEventListener("click", salvarActionFile);
        document.getElementById("btnAtualizarActionFile")?.addEventListener("click", carregarActionFile);
        document.getElementById("btnLimparActionFile")?.addEventListener("click", limparFormulario);
        document.getElementById("btnFiltrarActionFile")?.addEventListener("click", renderTabela);
        document.getElementById("txtPesquisaActionFile")?.addEventListener("keyup", renderTabela);
        document.getElementById("filtroTipo")?.addEventListener("change", renderTabela);
        document.getElementById("filtroCodigo")?.addEventListener("change", renderTabela);
        document.getElementById("filtroStatus")?.addEventListener("change", renderTabela);
        document.getElementById("btnSalvarTratativaActionFile")?.addEventListener("click", salvarTratativa);
    }

    function friendlyError(error){
        const message = error?.message || "";

        if(message.includes("action_files") && message.includes("schema cache")){
            return "A tabela Action File ainda não foi criada no Supabase. Execute o SQL do arquivo leal-academy/sql/action-file.sql e atualize a página.";
        }

        if(message.includes("permission denied") || message.includes("row-level security")){
            return "Seu usuário não tem permissão para esta ação no Supabase. Verifique as políticas RLS do módulo Action File.";
        }

        if(message.includes("JWT") || message.includes("auth")){
            return "Sua sessão expirou. Entre novamente com sua conta Google.";
        }

        return message || "Não foi possível concluir a operação. Tente novamente.";
    }

    function alertar(tipo, mensagem){
        const container = document.getElementById("actionFileAlert");

        if(!container){
            return;
        }

        container.innerHTML = `
            <div class="alert alert-${tipo} border-0 fw-bold">
                ${escapeHtml(mensagem)}
            </div>
        `;
    }

    function limparAlerta(){
        const container = document.getElementById("actionFileAlert");

        if(container){
            container.innerHTML = "";
        }
    }

    async function localizarProcesso(caseType, referenceNumber){
        const table = CASE_TABLES[caseType];

        if(!table || !referenceNumber){
            return null;
        }

        const { data, error } = await supabaseClient
            .from(table)
            .select("id, reference_number, station, airline, status")
            .eq("reference_number", referenceNumber)
            .maybeSingle();

        if(error){
            console.warn("Não foi possível vincular processo:", error);
            return null;
        }

        return data || null;
    }

    function actionInfo(code){
        return ACTION_CODES.find(item => item.code === code) || ACTION_CODES[ACTION_CODES.length - 1];
    }

    function montarHistoricoInicial(payload){
        return [
            {
                at:new Date().toISOString(),
                status:payload.status,
                action:"Ação criada",
                message:payload.message,
                assigned_to:payload.assigned_to || "",
                forward_to:payload.forward_to || ""
            }
        ];
    }

    async function salvarActionFile(){
        limparAlerta();

        const caseType = text(valor("case_type"));
        const referenceNumber = text(valor("reference_number"));
        const station = text(valor("station"));
        const airline = text(valor("airline"));
        const actionCode = text(valor("action_code"));
        const info = actionInfo(actionCode);
        const message = valor("message");

        if(!caseType || !referenceNumber || !actionCode || !message){
            alertar("warning", "Preencha tipo de processo, referência, código e mensagem da ação.");
            return;
        }

        const processo = await localizarProcesso(caseType, referenceNumber);

        const payload = {
            case_type:caseType,
            case_id:processo?.id || null,
            reference_number:referenceNumber,
            station:station || processo?.station || referenceNumber.substring(0, 3),
            airline:airline || processo?.airline || referenceNumber.substring(3, 5),
            action_code:actionCode,
            action_title:info.title,
            action_description:info.description,
            status:"PENDENTE",
            priority:text(valor("priority")) || "NORMAL",
            assigned_to:valor("assigned_to"),
            message,
            response:"",
            forward_to:"",
            history:[]
        };

        payload.history = montarHistoricoInicial(payload);

        const { error } = await supabaseClient
            .from("action_files")
            .insert([payload]);

        if(error){
            console.error(error);
            alertar("danger", friendlyError(error));
            return;
        }

        alertar("success", "Ação registrada no Action File.");
        limparFormulario(false);
        await carregarActionFile();
    }

    async function carregarActionFile(){
        limparAlerta();

        const { data, error } = await supabaseClient
            .from("action_files")
            .select("*")
            .order("created_at", { ascending:false });

        if(error){
            console.error(error);
            registros = [];
            renderTabela();
            alertar("danger", friendlyError(error));
            return;
        }

        registros = data || [];
        renderTabela();
    }

    function registrosFiltrados(){
        const pesquisa = text(valor("txtPesquisaActionFile"));
        const tipo = text(valor("filtroTipo"));
        const codigo = text(valor("filtroCodigo"));
        const status = text(valor("filtroStatus"));

        return registros.filter(item => {
            if(tipo && item.case_type !== tipo){
                return false;
            }

            if(codigo && item.action_code !== codigo){
                return false;
            }

            if(status && item.status !== status){
                return false;
            }

            if(!pesquisa){
                return true;
            }

            const haystack = [
                item.reference_number,
                item.case_type,
                item.action_code,
                item.action_title,
                item.station,
                item.airline,
                item.status,
                item.priority,
                item.assigned_to,
                item.message,
                item.response
            ].join(" ").toUpperCase();

            return haystack.includes(pesquisa);
        });
    }

    function statusBadge(status){
        switch(status){
            case "PENDENTE":
                return "bg-warning text-dark";
            case "EM TRATATIVA":
                return "bg-info text-dark";
            case "RESPONDIDO":
                return "bg-success";
            case "ENCERRADO":
                return "bg-secondary";
            default:
                return "bg-light text-dark";
        }
    }

    function priorityBadge(priority){
        switch(priority){
            case "URGENTE":
                return "bg-danger";
            case "ALTA":
                return "bg-warning text-dark";
            default:
                return "bg-secondary";
        }
    }

    function renderTabela(){
        const tbody = document.getElementById("listaActionFile");
        const counter = document.getElementById("actionFileCounter");
        const lista = registrosFiltrados();

        if(counter){
            counter.textContent = `${lista.length} ações`;
        }

        if(!tbody){
            return;
        }

        if(lista.length === 0){
            tbody.innerHTML = `
                <tr>
                    <td colspan="8" class="text-center text-secondary py-4">
                        Nenhuma ação encontrada.
                    </td>
                </tr>
            `;
            return;
        }

        tbody.innerHTML = lista.map(item => `
            <tr>
                <td>
                    <span class="badge bg-primary">${escapeHtml(item.action_code)}</span>
                    <div class="small text-secondary">${escapeHtml(item.action_title)}</div>
                </td>
                <td>${escapeHtml(item.case_type)}</td>
                <td class="fw-bold">${escapeHtml(item.reference_number)}</td>
                <td>${escapeHtml(item.station || "-")}</td>
                <td>
                    <span class="badge ${statusBadge(item.status)}">${escapeHtml(item.status)}</span>
                </td>
                <td>
                    <span class="badge ${priorityBadge(item.priority)}">${escapeHtml(item.priority || "NORMAL")}</span>
                </td>
                <td style="max-width:360px">
                    <div class="small">${escapeHtml(item.message).slice(0, 180)}</div>
                    ${item.response ? `<div class="small text-success mt-1">${escapeHtml(item.response).slice(0, 120)}</div>` : ""}
                </td>
                <td>
                    <div class="d-flex flex-wrap gap-1">
                        <button class="btn btn-info btn-sm" onclick="ActionFile.abrirTratativa('${item.id}')">
                            Tratar
                        </button>
                        <button class="btn btn-light btn-sm" onclick="ActionFile.abrirProcesso('${item.case_type}', '${item.case_id || ""}')">
                            Processo
                        </button>
                        <button class="btn btn-danger btn-sm" onclick="ActionFile.encerrar('${item.id}')">
                            Encerrar
                        </button>
                    </div>
                </td>
            </tr>
        `).join("");
    }

    function limparFormulario(clearAlert = true){
        [
            "reference_number",
            "station",
            "airline",
            "assigned_to",
            "message",
            "txtPesquisaActionFile"
        ].forEach(id => preencher(id, ""));

        preencher("case_type", "AHL");
        preencher("action_code", "DXF");
        preencher("priority", "NORMAL");

        if(clearAlert){
            limparAlerta();
        }
    }

    function historicoTexto(history){
        if(!Array.isArray(history) || history.length === 0){
            return "Nenhum histórico registrado.";
        }

        return history.map(item => {
            const data = item.at
                ? new Date(item.at).toLocaleString("pt-BR")
                : "";

            return [
                `[${data}] ${item.action || "-"}`,
                `Status: ${item.status || "-"}`,
                item.assigned_to ? `Responsável: ${item.assigned_to}` : "",
                item.forward_to ? `Encaminhado para: ${item.forward_to}` : "",
                item.message ? `Mensagem: ${item.message}` : ""
            ].filter(Boolean).join("\n");
        }).join("\n\n");
    }

    function abrirTratativa(id){
        registroAtual = registros.find(item => item.id === id);

        if(!registroAtual){
            alertar("warning", "Ação não encontrada. Atualize a página e tente novamente.");
            return;
        }

        preencher("modal_action_id", registroAtual.id);
        preencher("modal_status", registroAtual.status || "PENDENTE");
        preencher("modal_assigned_to", registroAtual.assigned_to || "");
        preencher("modal_forward_to", registroAtual.forward_to || "");
        preencher("modal_response", registroAtual.response || "");

        const titulo = document.getElementById("modalActionFileTitle");
        const historico = document.getElementById("modal_history");

        if(titulo){
            titulo.textContent = `${registroAtual.action_code} - ${registroAtual.reference_number}`;
        }

        if(historico){
            historico.textContent = historicoTexto(registroAtual.history);
        }

        bootstrap.Modal
            .getOrCreateInstance(document.getElementById("modalActionFile"))
            .show();
    }

    async function salvarTratativa(){
        if(!registroAtual){
            alertar("warning", "Nenhuma ação selecionada.");
            return;
        }

        const response = valor("modal_response");
        const status = text(valor("modal_status"));
        const assignedTo = valor("modal_assigned_to");
        const forwardTo = text(valor("modal_forward_to"));

        if(response === ""){
            alert("Informe a resposta ou atualização da tratativa.");
            return;
        }

        const history = Array.isArray(registroAtual.history)
            ? [...registroAtual.history]
            : [];

        history.push({
            at:new Date().toISOString(),
            status,
            action:"Tratativa atualizada",
            message:response,
            assigned_to:assignedTo,
            forward_to:forwardTo
        });

        const payload = {
            status,
            assigned_to:assignedTo,
            forward_to:forwardTo,
            response,
            history,
            updated_at:new Date().toISOString(),
            resolved_at:status === "ENCERRADO" ? new Date().toISOString() : null
        };

        const { error } = await supabaseClient
            .from("action_files")
            .update(payload)
            .eq("id", registroAtual.id);

        if(error){
            console.error(error);
            alertar("danger", friendlyError(error));
            return;
        }

        bootstrap.Modal
            .getInstance(document.getElementById("modalActionFile"))
            ?.hide();

        alertar("success", "Tratativa salva com sucesso.");
        await carregarActionFile();
    }

    async function encerrar(id){
        if(!confirm("Encerrar esta ação do Action File?")){
            return;
        }

        const registro = registros.find(item => item.id === id);
        const history = Array.isArray(registro?.history)
            ? [...registro.history]
            : [];

        history.push({
            at:new Date().toISOString(),
            status:"ENCERRADO",
            action:"Ação encerrada",
            message:"Encerramento manual pelo usuário."
        });

        const { error } = await supabaseClient
            .from("action_files")
            .update({
                status:"ENCERRADO",
                history,
                resolved_at:new Date().toISOString(),
                updated_at:new Date().toISOString()
            })
            .eq("id", id);

        if(error){
            console.error(error);
            alertar("danger", friendlyError(error));
            return;
        }

        alertar("success", "Ação encerrada.");
        await carregarActionFile();
    }

    function abrirProcesso(caseType, caseId){
        const tipo = text(caseType).toLowerCase();

        if(!caseId){
            alertar("warning", "Esta ação não está vinculada a um processo existente. Verifique a referência informada.");
            return;
        }

        if(["ahl", "ohd", "dpr", "rfp"].includes(tipo)){
            window.open(`worldtracer/${tipo}.html?id=${caseId}`, "_blank");
        }
    }

    return {
        abrirTratativa,
        salvarTratativa,
        encerrar,
        abrirProcesso,
        carregarActionFile
    };
})();
