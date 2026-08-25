/*==========================================================
AIRPORT BAGGAGE SIMULATOR
RFP.JS - Lost and Found Property
==========================================================*/

"use strict";

let rfpAtual = null;
let timerPesquisaRfp = null;

const tabelaRfp = document.getElementById("listaRfp");

const rfpStations = [
    "GRU", "GIG", "CGH", "VCP", "SSA", "REC", "FOR", "CNF", "BSB",
    "POA", "MIA", "JFK", "LAX", "CDG", "FRA", "LHR", "LIS", "MAD"
];

const rfpAirlines = [
    "LA", "G3", "AD", "AF", "KL", "BA", "LH", "IB", "TP", "UX",
    "EK", "EY", "QR", "ET", "TK", "AA", "DL", "UA", "CM", "YY"
];

const rfpCategories = [
    "BAG", "BOOK", "CLOTHING", "DOCUMENT", "ELECTRONIC", "FOOD",
    "GLASSES", "JEWELRY", "KEY", "MEDICAL", "MOBILE", "MONEY",
    "TOY", "UMBRELLA", "WATCH", "OTHER"
];

const rfpStorageStatuses = [
    "REGISTRADO",
    "EM GUARDA",
    "AGUARDANDO RETIRADA",
    "ENVIADO",
    "ENTREGUE",
    "ENCERRADO"
];

document.addEventListener("DOMContentLoaded", iniciarRfp);

async function iniciarRfp(){
    carregarCombosRfp();
    configurarEventosRfp();
    preencherDataPadraoRfp();
    await carregarRfp();
}

function valor(id){
    const campo = document.getElementById(id);
    return campo ? campo.value.trim() : "";
}

function preencher(id, valorCampo){
    const campo = document.getElementById(id);
    if(campo){
        campo.value = valorCampo ?? "";
    }
}

function carregarSelect(id, lista){
    const combo = document.getElementById(id);

    if(!combo){
        return;
    }

    combo.innerHTML = "";

    lista.forEach(item => {
        combo.innerHTML += `<option value="${item}">${item}</option>`;
    });
}

function carregarCombosRfp(){
    carregarSelect("station", rfpStations);
    carregarSelect("airline", rfpAirlines);
    carregarSelect("category", rfpCategories);
    carregarSelect("storage_status", rfpStorageStatuses);
}

function configurarEventosRfp(){
    document.getElementById("btnSalvar")?.addEventListener("click", salvarRfp);
    document.getElementById("btnWorldTracer")?.addEventListener("click", () => abrirWorldTracerRfp());
    document.getElementById("btnLimpar")?.addEventListener("click", limparFormularioRfp);
    document.getElementById("txtPesquisaRfp")?.addEventListener("keyup", pesquisarRfpAutomaticamente);
    atualizarModoRfp();
}

function atualizarModoRfp(){
    const botao = document.getElementById("btnSalvar");

    if(!botao){
        return;
    }

    const emEdicao = Boolean(rfpAtual || valor("reference_number"));

    botao.textContent = emEdicao
        ? "AFP - Alterar RFP"
        : "Criar RFP";

    botao.dataset.mode = emEdicao ? "edit" : "create";
    botao.classList.toggle("btn-warning", emEdicao);
    botao.classList.toggle("btn-success", !emEdicao);
}

function preencherDataPadraoRfp(){
    const hoje = new Date();

    if(!valor("found_date")){
        preencher("found_date", hoje.toISOString().slice(0, 10));
    }

    if(!valor("found_time")){
        preencher("found_time", hoje.toTimeString().slice(0, 5));
    }
}

function objetoRfp(){
    const status = valor("status") || "ABERTO";

    return {
        station: valor("station"),
        airline: valor("airline"),
        reference_number: valor("reference_number"),
        status,

        found_date: valor("found_date") || null,
        found_time: valor("found_time") || null,
        found_location: valor("found_location"),
        found_by: valor("found_by"),

        flight_number: valor("flight_number"),
        flight_date: valor("flight_date") || null,
        route: valor("route"),
        seat: valor("seat"),
        aircraft_registration: valor("aircraft_registration"),

        category: valor("category"),
        item_type: valor("item_type"),
        item_count: valor("item_count") === "" ? 1 : Number(valor("item_count")),
        item_brand: valor("item_brand"),
        item_color: valor("item_color"),
        detailed_description: valor("detailed_description"),

        passenger_name: valor("passenger_name"),
        passenger_phone: valor("passenger_phone"),
        passenger_email: valor("passenger_email"),
        passenger_document: valor("passenger_document"),

        storage_location: valor("storage_location"),
        storage_status: valor("storage_status") || "REGISTRADO",
        storage_until: valor("storage_until") || null,

        rush_tag: valor("rush_tag"),
        ai02: valor("ai02"),
        forwarded_to: valor("forwarded_to"),
        forwarded_flight: valor("forwarded_flight"),

        delivered_to: valor("delivered_to"),
        delivered_document: valor("delivered_document"),
        delivered_at: valor("delivered_at") || null,

        notes: valor("notes"),
        history: valor("history")
    };
}

function validarRfp(){
    const obrigatorios = [
        ["station", "Station"],
        ["airline", "Airline"],
        ["found_date", "Data em que o objeto foi encontrado"],
        ["found_location", "Local onde o objeto foi encontrado"],
        ["category", "Categoria"],
        ["item_type", "Objeto"],
        ["detailed_description", "Descrição detalhada"],
        ["storage_location", "Local de armazenamento"]
    ];

    for(const [id, label] of obrigatorios){
        if(valor(id) === ""){
            alert("Campo obrigatório: " + label);
            document.getElementById(id)?.focus();
            return false;
        }
    }

    return true;
}

function montarHistoricoRfp(acao){
    const atual = valor("history");
    const agora = new Date().toLocaleString("pt-BR");
    const linha = `[${agora}] ${acao}`;

    return atual
        ? atual + "\n" + linha
        : linha;
}

async function gerarReferenciaRfp(){
    const station = valor("station").toUpperCase();
    const airline = valor("airline").toUpperCase();

    if(station === "" || airline === ""){
        alert("Selecione Station e Airline antes de criar o RFP.");
        return "";
    }

    const { data, error } = await supabaseClient.rpc(
        "gerar_rfp_reference_number",
        {
            p_station: station,
            p_airline: airline
        }
    );

    if(error){
        console.error(error);
        alert(error.message);
        return "";
    }

    return data || "";
}

async function salvarRfp(){
    if(!validarRfp()){
        return;
    }

    const rfp = objetoRfp();
    const novoRfp = !rfpAtual;

    if(novoRfp){
        rfp.reference_number = await gerarReferenciaRfp();

        if(rfp.reference_number === ""){
            return;
        }

        rfp.history = montarHistoricoRfp("RFP criado.");
    }else{
        rfp.reference_number = valor("reference_number");
        rfp.history = montarHistoricoRfp("RFP atualizado.");
    }

    let resposta;

    if(!novoRfp){
        resposta = await supabaseClient
            .from("rfp_cases")
            .update(rfp)
            .eq("id", rfpAtual)
            .select()
            .single();
    }else{
        resposta = await supabaseClient
            .from("rfp_cases")
            .insert([rfp])
            .select()
            .single();
    }

    if(resposta.error){
        console.error(resposta.error);
        alert(resposta.error.message);
        return;
    }

    rfpAtual = resposta.data.id;

    if(window.ActionFileIntegration){
        if(novoRfp){
            await window.ActionFileIntegration.recordCaseCreated("RFP", resposta.data);
        }else{
            await window.ActionFileIntegration.recordCaseUpdated("RFP", resposta.data);
        }
    }

    preencher("reference_number", resposta.data.reference_number);
    preencher("status", resposta.data.status);
    preencher("history", resposta.data.history);

    await carregarRfp();
    atualizarModoRfp();

    if(!novoRfp){
        alert("RFP alterado com sucesso.\n\n" + resposta.data.reference_number);
        return;
    }

    alert("RFP criado com sucesso.\n\n" + resposta.data.reference_number);

    window.open(
        "worldtracer/rfp.html?id=" + resposta.data.id,
        "_blank"
    );
}

async function carregarRfp(){
    if(!tabelaRfp){
        return;
    }

    const { data, error } = await supabaseClient
        .from("rfp_cases")
        .select("*")
        .eq("status", "ABERTO")
        .order("created_at", { ascending:false });

    if(error){
        console.error(error);
        return;
    }

    tabelaRfp.innerHTML = "";

    data.forEach(reg => {
        tabelaRfp.innerHTML += `
            <tr>
                <td>${reg.reference_number || "-"}</td>
                <td>${reg.category || "-"}</td>
                <td>${reg.item_type || "-"}</td>
                <td>${reg.found_location || "-"}</td>
                <td>
                    <span class="badge ${reg.status === "ABERTO" ? "bg-success" : "bg-danger"}">
                        ${reg.status || "-"}
                    </span>
                </td>
                <td>
                    <button class="btn btn-success btn-sm" onclick="abrirWorldTracerRfp('${reg.id}')">
                        WT
                    </button>
                    <button class="btn btn-info btn-sm" onclick="visualizarRfp('${reg.id}')">
                        Visualizar
                    </button>
                    <button class="btn btn-danger btn-sm" onclick="encerrarRfp('${reg.id}')">
                        Encerrar
                    </button>
                </td>
            </tr>
        `;
    });
}

async function visualizarRfp(id){
    const { data, error } = await supabaseClient
        .from("rfp_cases")
        .select("*")
        .eq("id", id)
        .single();

    if(error){
        console.error(error);
        alert("Erro ao carregar RFP.");
        return;
    }

    rfpAtual = data.id;

    Object.keys(data).forEach(key => {
        preencher(key, data[key]);
    });

    atualizarModoRfp();
    requestAnimationFrame(atualizarModoRfp);

    document.getElementById("reference_number")?.scrollIntoView({
        behavior:"smooth",
        block:"center"
    });
}

async function encerrarRfp(id){
    if(!confirm("Encerrar este RFP?")){
        return;
    }

    const { data, error: loadError } = await supabaseClient
        .from("rfp_cases")
        .select("history")
        .eq("id", id)
        .single();

    if(loadError){
        console.error(loadError);
        alert(loadError.message);
        return;
    }

    preencher("history", data?.history || "");

    const { error } = await supabaseClient
        .from("rfp_cases")
        .update({
            status:"ENCERRADO",
            storage_status:"ENCERRADO",
            closed_at:new Date().toISOString(),
            history: montarHistoricoRfp("RFP encerrado.")
        })
        .eq("id", id);

    if(error){
        console.error(error);
        alert(error.message);
        return;
    }

    await carregarRfp();
}

function abrirWorldTracerRfp(id=null){
    if(!id && !rfpAtual){
        window.open("worldtracer/rfp.html", "_blank");
        return;
    }

    window.open(
        "worldtracer/rfp.html?id=" + (id || rfpAtual),
        "_blank"
    );
}

async function pesquisarRfpAutomaticamente(){
    clearTimeout(timerPesquisaRfp);
    timerPesquisaRfp = setTimeout(pesquisarRfp, 300);
}

async function pesquisarRfp(){
    const texto = valor("txtPesquisaRfp").toUpperCase();
    const painel = document.getElementById("resultadoPesquisaRfp");

    if(!painel){
        return;
    }

    if(texto.length < 2){
        painel.style.display = "none";
        painel.innerHTML = "";
        return;
    }

    const { data, error } = await supabaseClient
        .from("rfp_cases")
        .select("*")
        .or(`reference_number.ilike.%${texto}%,category.ilike.%${texto}%,item_type.ilike.%${texto}%,detailed_description.ilike.%${texto}%,passenger_name.ilike.%${texto}%,flight_number.ilike.%${texto}%`)
        .order("created_at", { ascending:false })
        .limit(10);

    if(error){
        console.error(error);
        return;
    }

    painel.innerHTML = "";
    painel.style.display = "block";

    if(!data || data.length === 0){
        painel.innerHTML = `
            <div class="list-group-item bg-dark text-light border-secondary">
                Nenhum RFP encontrado.
            </div>
        `;
        return;
    }

    data.forEach(reg => {
        const card = document.createElement("div");

        card.className = "list-group-item list-group-item-action bg-dark text-light border-secondary";
        card.style.cursor = "pointer";

        card.innerHTML = `
            <div class="fw-bold text-warning">${reg.reference_number || "-"}</div>
            <div>${reg.category || ""} - ${reg.item_type || ""}</div>
            <div>${reg.detailed_description || ""}</div>
            <div>${reg.passenger_name || ""}</div>
            <span class="badge ${reg.status === "ABERTO" ? "bg-success" : "bg-danger"}">
                ${reg.status || "-"}
            </span>
        `;

        card.onclick = () => {
            painel.style.display = "none";
            painel.innerHTML = "";
            preencher("txtPesquisaRfp", "");
            visualizarRfp(reg.id);
        };

        painel.appendChild(card);
    });
}

function limparFormularioRfp(){
    rfpAtual = null;

    document
        .querySelectorAll("input, textarea, select")
        .forEach(campo => {
            switch(campo.id){
                case "station":
                case "airline":
                case "category":
                case "storage_status":
                    campo.selectedIndex = 0;
                    break;
                case "status":
                    campo.value = "ABERTO";
                    break;
                default:
                    campo.value = "";
            }
        });

    preencherDataPadraoRfp();
    atualizarModoRfp();
}

document.addEventListener("keydown", event => {
    switch(event.key){
        case "F1":
            event.preventDefault();
            salvarRfp();
            break;
        case "F2":
            event.preventDefault();
            limparFormularioRfp();
            break;
        case "F3":
            event.preventDefault();
            abrirWorldTracerRfp();
            break;
        case "F5":
            event.preventDefault();
            carregarRfp();
            break;
    }
});

console.log("RFP carregado.");
