/*==========================================================
ACTION FILE
WorldTracer Simulator
==========================================================*/

"use strict";

const ActionFile = (() => {
    const INBOX_CATEGORIES = [
        {
            key:"FORWARD_MESSAGES",
            label:"Forward Messages",
            description:"Forward Messages e FWDs recebidos ou enviados pela estação."
        },
        {
            key:"ACTION_MESSAGES",
            label:"Action Messages",
            description:"Ações necessárias em PIRs, solicitações de QOH/OHD, respostas de ROH, FOH e FAH."
        },
        {
            key:"SYSTEM_MATCHES",
            label:"System Matches",
            description:"Matches comparativos entre AHLs da estação e OHDs registrados em outros aeroportos."
        },
        {
            key:"EXTENDED_MATCHES",
            label:"Extended Matches",
            description:"Possíveis matches gerados quando o período de rastreio de uma AHL foi prolongado."
        },
        {
            key:"CLAIM_MATCHES",
            label:"Claim Matches",
            description:"Notificações do módulo de investigação e reclamações."
        },
        {
            key:"SYSTEM_PROMPTS",
            label:"System Prompts",
            description:"Alertas automáticos do sistema indicando ações pendentes em algum PIR."
        },
        {
            key:"ADDITIONAL_PROMPTS",
            label:"Additional Prompts",
            description:"Mensagens gerais entre aeroportos. Equivalente ao antigo PXF do WorldTracer Native."
        },
        {
            key:"EMAIL_CORRESPONDENCE",
            label:"Email Correspondence",
            description:"E-mails enviados por passageiros pela internet."
        },
        {
            key:"CLAIMS_MESSAGES",
            label:"Claims Messages",
            description:"Notificações de reclamações enviadas pela internet ou autoatendimento."
        },
        {
            key:"PURGED_RETIRED_ITEMS",
            label:"Purged/retired items",
            description:"QOHs com prazo vencido, normalmente após 24 horas."
        },
        {
            key:"LOCAL_MANAGER",
            label:"Local Manager",
            description:"Mensagens enviadas pela Central de Bagagem, HDQ ou headquarters, aos aeroportos."
        }
    ];

    const ACTION_CODES = [
        {
            code:"DXF",
            category:"ACTION_MESSAGES",
            title:"Visualização de mensagem",
            description:"Leitura, conferência ou tratativa de mensagem recebida no Action File."
        },
        {
            code:"EXF",
            category:"ACTION_MESSAGES",
            title:"Informação extra",
            description:"Pedido de atualização, observação operacional ou informação complementar."
        },
        {
            code:"AP",
            category:"ADDITIONAL_PROMPTS",
            title:"Additional Prompt",
            description:"Mensagem geral entre bases, comunicados de turno ou orientação operacional."
        },
        {
            code:"FW",
            category:"FORWARD_MESSAGES",
            title:"Encaminhamento",
            description:"Área de mensagens de envio, incluindo registros de encaminhamento operacional."
        },
        {
            code:"FWD",
            category:"FORWARD_MESSAGES",
            title:"Envio de rush bag",
            description:"Registro de envio ou encaminhamento de bagagem com etiqueta rush para outra base."
        },
        {
            code:"BDO",
            category:"ACTION_MESSAGES",
            title:"Entrega de bagagem",
            description:"Registro de entrega da bagagem ao passageiro, representante ou destinatário autorizado."
        },
        {
            code:"AA",
            category:"ACTION_MESSAGES",
            title:"Action Message",
            description:"Ação que precisa ser tomada em PIRs, solicitações de OHD/QOH, ROH, FOH ou FAH."
        },
        {
            code:"ROH",
            category:"ACTION_MESSAGES",
            title:"Request On-Hand",
            description:"Solicitação de envio de OHD relacionado a um AHL."
        },
        {
            code:"FOH",
            category:"ACTION_MESSAGES",
            title:"Forward On-Hand",
            description:"Envio de OHD para a base solicitante ou destino definido."
        },
        {
            code:"FAH",
            category:"ACTION_MESSAGES",
            title:"Forward Delayed Bag",
            description:"Envio de bagagem localizada vinculada a um AHL para outra base providenciar a entrega."
        },
        {
            code:"WM",
            category:"SYSTEM_MATCHES",
            title:"System Match",
            description:"Mensagem de comparação entre AHL e OHD gerada pelo sistema."
        },
        {
            code:"MATCH",
            category:"SYSTEM_MATCHES",
            title:"Match do sistema",
            description:"Informação comparativa entre AHL e OHD."
        },
        {
            code:"SP",
            category:"SYSTEM_PROMPTS",
            title:"System Prompt",
            description:"Alerta do sistema indicando que alguma ação operacional deve ser tomada."
        },
        {
            code:"EXT",
            category:"EXTENDED_MATCHES",
            title:"Match estendido",
            description:"Possível match após prolongamento do rastreio de AHL."
        },
        {
            code:"CLM",
            category:"CLAIM_MATCHES",
            title:"Claim Match",
            description:"Notificação comparativa do módulo de investigação e reclamações."
        },
        {
            code:"CLAIM",
            category:"CLAIMS_MESSAGES",
            title:"Mensagem de claim",
            description:"Reclamação recebida pela internet ou autoatendimento."
        },
        {
            code:"EC",
            category:"EMAIL_CORRESPONDENCE",
            title:"Correspondência por e-mail",
            description:"E-mail enviado pelo passageiro através dos canais digitais."
        },
        {
            code:"PR",
            category:"PURGED_RETIRED_ITEMS",
            title:"QOH vencido",
            description:"Item QOH com prazo operacional vencido."
        },
        {
            code:"LM",
            category:"LOCAL_MANAGER",
            title:"Local Manager",
            description:"Mensagem enviada pela central ou gestão operacional para uma base."
        },
        {
            code:"GEN",
            category:"ADDITIONAL_PROMPTS",
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
        renderInbox();
        renderTabela();
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
        const categorySelect = document.getElementById("action_category");
        const filtroCategoria = document.getElementById("filtroCategoria");

        if(actionSelect){
            actionSelect.innerHTML = ACTION_CODES
                .map(item => `<option value="${item.code}">${item.code} - ${item.title}</option>`)
                .join("");

            actionSelect.addEventListener("change", atualizarCategoriaPeloCodigo);
        }

        if(filtroCodigo){
            filtroCodigo.innerHTML =
                `<option value="">Todos os códigos</option>` +
                ACTION_CODES
                    .map(item => `<option value="${item.code}">${item.code}</option>`)
                    .join("");
        }

        if(categorySelect){
            categorySelect.innerHTML = INBOX_CATEGORIES
                .map(item => `<option value="${item.key}">${item.label}</option>`)
                .join("");
        }

        if(filtroCategoria){
            filtroCategoria.innerHTML =
                `<option value="">Todos os campos</option>` +
                INBOX_CATEGORIES
                    .map(item => `<option value="${item.key}">${item.label}</option>`)
                    .join("");
        }

        atualizarCategoriaPeloCodigo();
    }

    function configurarEventos(){
        document.getElementById("btnSalvarActionFile")?.addEventListener("click", salvarActionFile);
        document.getElementById("btnAtualizarActionFile")?.addEventListener("click", carregarActionFile);
        document.getElementById("btnLimparActionFile")?.addEventListener("click", limparFormulario);
        document.getElementById("btnFiltrarActionFile")?.addEventListener("click", renderTabela);
        document.getElementById("txtPesquisaActionFile")?.addEventListener("keyup", renderTabela);
        document.getElementById("filtroTipo")?.addEventListener("change", renderTabela);
        document.getElementById("filtroCodigo")?.addEventListener("change", renderTabela);
        document.getElementById("filtroCategoria")?.addEventListener("change", renderTabela);
        document.getElementById("filtroDia")?.addEventListener("change", renderTabela);
        document.getElementById("filtroStatus")?.addEventListener("change", renderTabela);
        document.getElementById("btnSalvarTratativaActionFile")?.addEventListener("click", salvarTratativa);
    }

    function atualizarCategoriaPeloCodigo(){
        const code = text(valor("action_code"));
        const info = actionInfo(code);

        preencher("action_category", info.category || "ACTION_MESSAGES");
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

    function categoryInfo(key){
        return INBOX_CATEGORIES.find(item => item.key === key) || INBOX_CATEGORIES[1];
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
        const category = valor("action_category") || info.category || "ACTION_MESSAGES";
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
            action_category:category,
            action_category_label:categoryInfo(category).label,
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

        renderInbox();

        if(typeof supabaseClient === "undefined" || !supabaseClient){
            registros = [];
            renderInbox();
            renderTabela();
            alertar(
                "warning",
                "Não foi possível conectar ao Supabase agora. A estrutura do Action File foi carregada, mas as mensagens salvas serão exibidas quando a conexão voltar."
            );
            return;
        }

        const { data, error } = await supabaseClient
            .from("action_files")
            .select("*")
            .order("created_at", { ascending:false });

        if(error){
            console.error(error);
            registros = [];
            renderInbox();
            renderTabela();
            alertar("danger", friendlyError(error));
            return;
        }

        registros = data || [];
        renderInbox();
        renderTabela();
    }

    function registrosFiltrados(){
        const pesquisa = text(valor("txtPesquisaActionFile"));
        const tipo = text(valor("filtroTipo"));
        const codigo = text(valor("filtroCodigo"));
        const categoria = text(valor("filtroCategoria"));
        const dia = Number(valor("filtroDia"));
        const status = text(valor("filtroStatus"));

        return registros.filter(item => {
            if(tipo && item.case_type !== tipo){
                return false;
            }

            if(codigo && item.action_code !== codigo){
                return false;
            }

            if(categoria && categoriaRegistro(item) !== categoria){
                return false;
            }

            if(dia && dayBucket(item.created_at) !== dia){
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
                item.action_category_label,
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

    function categoriaRegistro(item){
        if(item.action_category){
            return item.action_category;
        }

        return actionInfo(item.action_code).category || "ACTION_MESSAGES";
    }

    function dayBucket(dateValue){
        if(!dateValue){
            return 7;
        }

        const created = new Date(dateValue);
        const now = new Date();
        const diffMs = now.getTime() - created.getTime();
        const diffDays = Math.floor(diffMs / 86400000) + 1;

        if(diffDays < 1){
            return 1;
        }

        if(diffDays > 7){
            return 7;
        }

        return diffDays;
    }

    function renderInbox(){
        const tbody = document.getElementById("stationInboxActionFile");
        const refresh = document.getElementById("lastRefreshActionFile");

        if(refresh){
            refresh.textContent = "Last refresh: " + new Date().toLocaleString("pt-BR");
        }

        if(!tbody){
            return;
        }

        const abertas = registros.filter(item => item.status !== "ENCERRADO");

        tbody.innerHTML = INBOX_CATEGORIES.map(category => {
            const cells = [];

            for(let day = 1; day <= 7; day++){
                const count = abertas.filter(item =>
                    categoriaRegistro(item) === category.key &&
                    dayBucket(item.created_at) === day
                ).length;

                cells.push(`
                    <td class="text-center">
                        <button
                            type="button"
                            class="btn btn-sm ${count > 0 ? "btn-warning" : "btn-outline-light"}"
                            onclick="ActionFile.filtrarInbox('${category.key}', '${day}')">
                            ${count}
                        </button>
                    </td>
                `);
            }

            return `
                <tr>
                    <td>
                        <button
                            type="button"
                            class="btn btn-link p-0 text-decoration-none text-start fw-bold"
                            onclick="ActionFile.filtrarInbox('${category.key}', '')">
                            ${escapeHtml(category.label)}
                        </button>
                        <div class="small text-secondary">${escapeHtml(category.description)}</div>
                    </td>
                    ${cells.join("")}
                </tr>
            `;
        }).join("");
    }

    function filtrarInbox(category, day){
        preencher("filtroCategoria", category || "");
        preencher("filtroDia", day || "");
        renderTabela();

        document.getElementById("listaActionFile")?.scrollIntoView({
            behavior:"smooth",
            block:"start"
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
                    <td colspan="9" class="text-center text-secondary py-4">
                        Nenhuma ação encontrada.
                    </td>
                </tr>
            `;
            return;
        }

        tbody.innerHTML = lista.map(item => `
            <tr>
                <td>
                    <div class="fw-bold">${escapeHtml(categoryInfo(categoriaRegistro(item)).label)}</div>
                    <div class="small text-secondary">Day ${dayBucket(item.created_at)}</div>
                </td>
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
                        <button class="btn btn-success btn-sm" onclick="ActionFile.abrirWorldTracer('${item.id}')">
                            WT
                        </button>
                        <button class="btn btn-warning btn-sm" onclick="ActionFile.transferir('${item.id}')">
                            Transferir
                        </button>
                        <button class="btn btn-light btn-sm" onclick="ActionFile.copiar('${item.id}')">
                            Copiar
                        </button>
                        <button class="btn btn-secondary btn-sm" onclick="ActionFile.imprimir('${item.id}')">
                            Imprimir
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
            "txtPesquisaActionFile",
            "filtroCategoria",
            "filtroDia"
        ].forEach(id => preencher(id, ""));

        preencher("case_type", "AHL");
        preencher("action_code", "DXF");
        atualizarCategoriaPeloCodigo();
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

    async function transferir(id){
        const registro = registros.find(item => item.id === id);

        if(!registro){
            alertar("warning", "Mensagem não encontrada. Atualize a página e tente novamente.");
            return;
        }

        if(!registro.case_id){
            alertar("warning", "Esta mensagem não está vinculada a um processo existente.");
            return;
        }

        const history = Array.isArray(registro.history)
            ? [...registro.history]
            : [];

        history.push({
            at:new Date().toISOString(),
            status:"EM TRATATIVA",
            action:"Mensagem transferida para o processo",
            message:`Mensagem ${registro.action_code} marcada para tratativa no processo ${registro.reference_number}.`
        });

        const { error } = await supabaseClient
            .from("action_files")
            .update({
                status:"EM TRATATIVA",
                history,
                updated_at:new Date().toISOString()
            })
            .eq("id", id);

        if(error){
            console.error(error);
            alertar("danger", friendlyError(error));
            return;
        }

        alertar("success", "Mensagem transferida para tratativa do processo.");
        await carregarActionFile();
    }

    async function copiar(id){
        const registro = registros.find(item => item.id === id);

        if(!registro){
            alertar("warning", "Mensagem não encontrada. Atualize a página e tente novamente.");
            return;
        }

        const texto = mensagemCompleta(registro);

        try{
            await navigator.clipboard.writeText(texto);
            alertar("success", "Mensagem copiada para a área de transferência.");
        }
        catch(error){
            console.warn(error);
            alertar("warning", "Não foi possível copiar automaticamente. Abra a tratativa e copie o texto manualmente.");
        }
    }

    function imprimir(id){
        const registro = registros.find(item => item.id === id);

        if(!registro){
            alertar("warning", "Mensagem não encontrada. Atualize a página e tente novamente.");
            return;
        }

        const janela = window.open("", "_blank", "width=900,height=700");

        if(!janela){
            alertar("warning", "O navegador bloqueou a janela de impressão.");
            return;
        }

        janela.document.write(`
            <!DOCTYPE html>
            <html lang="pt-BR">
            <head>
                <meta charset="UTF-8">
                <title>Action File - ${escapeHtml(registro.reference_number)}</title>
                <style>
                    body{font-family:Arial,sans-serif;padding:24px;color:#111}
                    h1{font-size:22px;margin-bottom:8px}
                    .meta{margin-bottom:16px;color:#444}
                    pre{border:1px solid #999;padding:16px;white-space:pre-wrap}
                </style>
            </head>
            <body>
                <h1>Action File - ${escapeHtml(registro.action_code)}</h1>
                <div class="meta">
                    Processo: ${escapeHtml(registro.case_type)} ${escapeHtml(registro.reference_number)}
                    <br>
                    Campo: ${escapeHtml(categoryInfo(categoriaRegistro(registro)).label)}
                    <br>
                    Status: ${escapeHtml(registro.status)}
                </div>
                <pre>${escapeHtml(mensagemCompleta(registro))}</pre>
            </body>
            </html>
        `);

        janela.document.close();
        janela.focus();
        janela.print();
    }

    function abrirWorldTracer(id){
        if(!id){
            return;
        }

        window.open(
            `worldtracer/action-file.html?id=${id}`,
            "_blank"
        );
    }

    function mensagemCompleta(registro){
        return [
            `${registro.action_code || ""} - ${registro.action_title || ""}`,
            `Processo: ${registro.case_type || ""} ${registro.reference_number || ""}`,
            `Station: ${registro.station || "-"}`,
            `Airline: ${registro.airline || "-"}`,
            `Status: ${registro.status || "-"}`,
            `Prioridade: ${registro.priority || "-"}`,
            "",
            registro.message || "",
            registro.response ? `\nResposta:\n${registro.response}` : ""
        ].join("\n");
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
        transferir,
        copiar,
        imprimir,
        abrirProcesso,
        carregarActionFile,
        filtrarInbox,
        abrirWorldTracer
    };
})();
