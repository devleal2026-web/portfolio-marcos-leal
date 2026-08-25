/*==========================================================
WORLDTRACER DPR
==========================================================*/

"use strict";

let dprId = null;

const dprStations = [
    "GRU", "GIG", "CGH", "VCP", "SSA", "REC", "FOR", "CNF", "BSB",
    "POA", "MIA", "JFK", "LAX", "CDG", "FRA", "LHR", "LIS", "MAD"
];

const dprAirlines = [
    "LA", "G3", "AD", "AF", "KL", "BA", "LH", "IB", "TP", "UX",
    "EK", "EY", "QR", "ET", "TK", "AA", "DL", "UA", "CM", "YY"
];

document.addEventListener("DOMContentLoaded", iniciarWorldTracerDpr);

async function iniciarWorldTracerDpr(){
    const params = new URLSearchParams(window.location.search);

    dprId = params.get("id");

    carregarCombos();
    configurarBotoes();

    if(dprId){
        await carregarDpr();
    }else{
        preencher("status", "ABERTO");
        preencher("created_at", formatarData(new Date().toISOString()));
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

function carregarSelect(id, lista, valueKey, labelKey){
    const combo = document.getElementById(id);

    if(!combo){
        return;
    }

    combo.innerHTML = "";

    lista.forEach(item => {
        const value = typeof item === "string" ? item : item[valueKey];
        const label = typeof item === "string" ? item : `${item[valueKey]} - ${item[labelKey]}`;

        combo.innerHTML += `
            <option value="${value}">
                ${label}
            </option>
        `;
    });
}

function carregarCombos(){
    carregarSelect("station", dprStations);
    carregarSelect("airline", dprAirlines);
    carregarSelect("damage_element", dprDamageCodes.elementos, "code", "description");
    carregarSelect("damage_location", dprDamageCodes.localizacoes, "code", "description");
    carregarSelect("damage_extent", dprDamageCodes.extensoes, "code", "description");
}

async function carregarDpr(){
    const { data, error } = await supabaseClient
        .from("dpr_cases")
        .select("*")
        .eq("id", dprId)
        .single();

    if(error){
        console.error(error);
        alert("Erro ao carregar DPR.");
        return;
    }

    Object.keys(data).forEach(key => {
        preencher(key, data[key]);
    });

    preencher("created_at", formatarData(data.created_at));
}

function objetoDpr(){
    return {
        station: valor("station"),
        airline: valor("airline"),
        reference_number: valor("reference_number"),
        status: valor("status") || "ABERTO",

        tn: valor("tn"),
        nm: valor("nm"),
        it: valor("it"),
        pp: valor("pp"),
        ps: valor("ps"),
        dv: valor("dv"),

        cp: valor("cp"),
        pn: valor("pn"),
        tp: valor("tp"),
        ea: valor("ea"),

        pa: valor("pa"),
        pc: valor("pc"),
        pz: valor("pz"),
        co: valor("co"),

        ta: valor("ta"),
        tc: valor("tc"),
        ts: valor("ts"),
        tz: valor("tz"),
        tco: valor("tc"),
        fd: valor("fd"),
        rt: valor("rt"),
        co: valor("co"),
        rl: valor("rl"),
        fs: valor("fs"),
        pn: valor("pn"),
        ag: valor("ag"),

        ct: valor("ct"),
        bi: valor("bi"),

        bw: valor("bw") === ""
            ? null
            : parseFloat(valor("bw")),

        lp: valor("lp"),
        bd: valor("bd"),
        cd: valor("cd"),
        td: valor("td"),
        rb: valor("rb"),
        ca: valor("ca"),
        ff: valor("ff"),

        damage_element: valor("damage_element"),
        damage_location: valor("damage_location"),
        damage_extent: valor("damage_extent"),
        damage_description: valor("damage_description")
    };
}

async function gerarReferenciaDpr(){

    const station = valor("station").toUpperCase();
    const airline = valor("airline").toUpperCase();

    if(station === ""){
        alert("Selecione a Station antes de criar o DPR.");
        return "";
    }

    if(airline === ""){
        alert("Selecione a Airline antes de criar o DPR.");
        return "";
    }

    const { data, error } = await supabaseClient.rpc(
        "gerar_dpr_reference_number",
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

    if(!data){
        alert("A referência DPR não foi gerada.");
        return "";
    }

    return data;

}

async function salvarDpr(){
    const dpr = objetoDpr();
    const novoDpr = !dprId;

    if(!dprId && !dpr.reference_number){
        dpr.reference_number = await gerarReferenciaDpr();

        if(dpr.reference_number === ""){
            return;
        }
    }

    let resposta;

    if(dprId){
        resposta = await supabaseClient
            .from("dpr_cases")
            .update(dpr)
            .eq("id", dprId)
            .select()
            .single();
    }else{
        resposta = await supabaseClient
            .from("dpr_cases")
            .insert([dpr])
            .select()
            .single();
    }

    if(resposta.error){
        console.error(resposta.error);
        alert(resposta.error.message);
        return;
    }

    dprId = resposta.data.id;

    preencher("reference_number", resposta.data.reference_number);
    preencher("created_at", formatarData(resposta.data.created_at));

    if(novoDpr && window.ActionFileIntegration){
        await ActionFileIntegration.recordCaseCreated("DPR", resposta.data);
    }

    alert("DPR salvo com sucesso.\n\n" + resposta.data.reference_number);
    limparFormularioDprWorldTracer();
}

function configurarBotoes(){
    document.getElementById("btnSave")?.addEventListener("click", salvarDpr);
    document.getElementById("btnPrint")?.addEventListener("click", () => window.print());
    document.getElementById("btnClear")?.addEventListener("click", limparCampos);
    document.getElementById("btnClose")?.addEventListener("click", () => window.close());
    document.getElementById("btnReference")?.addEventListener("click", gerarReferenciaManualDpr);

    document.getElementById("btnHistory")?.addEventListener("click", () => {
        alert("Histórico DPR será implementado.");
    });

    document.addEventListener("keydown", e => {
        switch(e.key){
            case "F1":
                e.preventDefault();
                salvarDpr();
                break;

            case "F2":
                e.preventDefault();
                limparCampos();
                break;

            case "F3":
                e.preventDefault();
                window.print();
                break;

            case "F5":
                e.preventDefault();
                gerarReferenciaManualDpr();
                break;

            case "F10":
                e.preventDefault();
                window.close();
                break;
        }
    });
}

async function gerarReferenciaManualDpr(){
    if(dprId){
        alert("Este DPR já possui referência.");
        return;
    }

    const reference = await gerarReferenciaDpr();

    if(reference){
        preencher("reference_number", reference);
    }
}

function limparCampos(){
    document
        .querySelectorAll("input, textarea")
        .forEach(campo => {
            if(
                campo.id !== "reference_number" &&
                campo.id !== "created_at"
            ){
                campo.value = "";
            }
        });

    preencher("status", "ABERTO");
}
function limparFormularioDprWorldTracer(){

    document
        .querySelectorAll("input, textarea, select")
        .forEach(campo => {
            switch(campo.id){
                case "reference_number":
                case "created_at":
                    break;

                default:
                    campo.value = "";
            }
        });

    carregarCombos();

    preencher("status", "ABERTO");
    preencher("reference_number", "");
    preencher("created_at", formatarData(new Date().toISOString()));

    dprId = null;

}

console.log("WORLDTRACER DPR carregado.");
