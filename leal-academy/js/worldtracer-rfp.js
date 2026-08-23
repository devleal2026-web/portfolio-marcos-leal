/*==========================================================
WORLDTRACER RFP
Lost and Found Property
==========================================================*/

"use strict";

let rfpId = null;

const wtRfpStations = [
    "GRU", "GIG", "CGH", "VCP", "SSA", "REC", "FOR", "CNF", "BSB",
    "POA", "MIA", "JFK", "LAX", "CDG", "FRA", "LHR", "LIS", "MAD"
];

const wtRfpAirlines = [
    "LA", "G3", "AD", "AF", "KL", "BA", "LH", "IB", "TP", "UX",
    "EK", "EY", "QR", "ET", "TK", "AA", "DL", "UA", "CM", "YY"
];

const wtRfpCategories = [
    "BAG", "BOOK", "CLOTHING", "DOCUMENT", "ELECTRONIC", "FOOD",
    "GLASSES", "JEWELRY", "KEY", "MEDICAL", "MOBILE", "MONEY",
    "TOY", "UMBRELLA", "WATCH", "OTHER"
];

const wtRfpStorageStatuses = [
    "REGISTRADO",
    "EM GUARDA",
    "AGUARDANDO RETIRADA",
    "ENVIADO",
    "ENTREGUE",
    "ENCERRADO"
];

document.addEventListener("DOMContentLoaded", iniciarWorldTracerRfp);

async function iniciarWorldTracerRfp(){
    const params = new URLSearchParams(window.location.search);
    rfpId = params.get("id");

    carregarCombosRfp();
    configurarBotoesRfp();

    if(rfpId){
        await carregarRfp();
    }else{
        preencher("status", "ABERTO");
        preencher("created_at", formatarData(new Date().toISOString()));
        preencher("found_date", new Date().toISOString().slice(0, 10));
        preencher("found_time", new Date().toTimeString().slice(0, 5));
        preencher("item_count", "1");
    }
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

function formatarData(data){
    if(!data){
        return "";
    }

    return new Date(data).toLocaleString("pt-BR");
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
    carregarSelect("station", wtRfpStations);
    carregarSelect("airline", wtRfpAirlines);
    carregarSelect("category", wtRfpCategories);
    carregarSelect("storage_status", wtRfpStorageStatuses);
}

async function carregarRfp(){
    const { data, error } = await supabaseClient
        .from("rfp_cases")
        .select("*")
        .eq("id", rfpId)
        .single();

    if(error){
        console.error(error);
        alert("Erro ao carregar RFP.");
        return;
    }

    Object.keys(data).forEach(key => {
        preencher(key, data[key]);
    });

    preencher("created_at", formatarData(data.created_at));
}

function objetoRfp(){
    return {
        station: valor("station"),
        airline: valor("airline"),
        reference_number: valor("reference_number"),
        status: valor("status") || "ABERTO",

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
        ["station", "STATION"],
        ["airline", "AIRLINE"],
        ["found_date", "FD"],
        ["found_location", "FP"],
        ["category", "CA"],
        ["item_type", "OBJ"],
        ["detailed_description", "DD"],
        ["storage_location", "SL"]
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

function montarHistorico(acao){
    const atual = valor("history");
    const agora = new Date().toLocaleString("pt-BR");
    const linha = `[${agora}] ${acao}`;

    return atual
        ? atual + "\n" + linha
        : linha;
}

async function gerarReferenciaRfp(){
    const { data, error } = await supabaseClient.rpc(
        "gerar_rfp_reference_number",
        {
            p_station: valor("station").toUpperCase(),
            p_airline: valor("airline").toUpperCase()
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

    if(!rfpId){
        rfp.reference_number = await gerarReferenciaRfp();

        if(rfp.reference_number === ""){
            return;
        }

        rfp.history = montarHistorico("RFP criado na máscara WorldTracer.");
    }else{
        rfp.reference_number = valor("reference_number");
        rfp.history = montarHistorico("RFP atualizado na máscara WorldTracer.");
    }

    let resposta;

    if(rfpId){
        resposta = await supabaseClient
            .from("rfp_cases")
            .update(rfp)
            .eq("id", rfpId)
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

    rfpId = resposta.data.id;

    Object.keys(resposta.data).forEach(key => {
        preencher(key, resposta.data[key]);
    });

    preencher("created_at", formatarData(resposta.data.created_at));

    alert("RFP salvo com sucesso.\n\n" + resposta.data.reference_number);
}

function limparCampos(){
    document
        .querySelectorAll("input, textarea, select")
        .forEach(campo => {
            if(["reference_number", "created_at"].includes(campo.id)){
                return;
            }

            if(campo.tagName === "SELECT"){
                campo.selectedIndex = 0;
                return;
            }

            campo.value = "";
        });

    rfpId = null;
    preencher("status", "ABERTO");
    preencher("item_count", "1");
}

function configurarBotoesRfp(){
    document.getElementById("btnSave")?.addEventListener("click", salvarRfp);
    document.getElementById("btnClear")?.addEventListener("click", limparCampos);
    document.getElementById("btnPrint")?.addEventListener("click", () => window.print());
    document.getElementById("btnClose")?.addEventListener("click", () => window.close());
}

document.addEventListener("keydown", event => {
    switch(event.key){
        case "F1":
            event.preventDefault();
            salvarRfp();
            break;
        case "F2":
            event.preventDefault();
            limparCampos();
            break;
        case "F3":
            event.preventDefault();
            window.print();
            break;
        case "F10":
            event.preventDefault();
            window.close();
            break;
    }
});

console.log("WORLDTRACER RFP carregado.");
