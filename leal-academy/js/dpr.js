/*==========================================================
DPR.JS
Damage and Pilferage Report
==========================================================*/

"use strict";

let dprAtual = null;
let timerPesquisaDpr = null;

const tabelaDpr = document.getElementById("listaDpr");

const stations = [
    "GRU", "GIG", "CGH", "VCP", "SSA", "REC", "FOR", "CNF", "BSB",
    "POA", "MIA", "JFK", "LAX", "CDG", "FRA", "LHR", "LIS", "MAD"
];

const airlines = [
    "LA", "G3", "AD", "AF", "KL", "BA", "LH", "IB", "TP", "UX",
    "EK", "EY", "QR", "ET", "TK", "AA", "DL", "UA", "CM", "YY"
];

document.addEventListener("DOMContentLoaded", iniciarDpr);

async function iniciarDpr(){
    carregarCombosBase();
    carregarCombosDano();
    configurarEventosDpr();
    await carregarDpr();
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

function carregarCombosBase(){
    carregarSelect("station", stations);
    carregarSelect("airline", airlines);
}

function carregarCombosDano(){
    carregarSelect("damage_element", dprDamageCodes.elementos, "code", "description");
    carregarSelect("damage_location", dprDamageCodes.localizacoes, "code", "description");
    carregarSelect("damage_extent", dprDamageCodes.extensoes, "code", "description");
}

function configurarEventosDpr(){
    document
        .getElementById("btnSalvar")
        ?.addEventListener("click", salvarDpr);

    document
        .getElementById("txtPesquisaDpr")
        ?.addEventListener("keyup", pesquisarDprAutomaticamente);
        document
            .getElementById("btnWorldTracer")
            ?.addEventListener(
                "click",
                () => abrirWorldTracerDpr()
            );
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
        tc: valor("tc"),
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

function validarDpr(){
    const obrigatorios = [
        ["station", "Station"],
        ["airline", "Airline"],
        ["tn", "TN"],
        ["nm", "NM"],
        ["fd", "FD"],
        ["rt", "RT"],
        ["co", "CO"],
        ["rl", "RL"],
        ["fs", "FS"],
        ["pn", "PN"],
        ["ag", "AG"],   // ← vírgula adicionada aqui
        ["cp", "CP - Celular"],
        ["ea", "EA - E-mail"],
        ["pa", "PA - Endereço Permanente"]

    ];

    for(const item of obrigatorios){

        if(valor(item[0]) === ""){
            alert("Campo obrigatório: " + item[1]);
            document.getElementById(item[0])?.focus();
            return false;
        }
    }

    return true;
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
    if(!validarDpr()){
        return;
    }

    const dpr = objetoDpr();

    if(!dprAtual){
        dpr.reference_number = await gerarReferenciaDpr();

        if(dpr.reference_number === ""){
            return;
        }
    }else{
        dpr.reference_number = valor("reference_number");
    }

    let resposta;

    if(dprAtual){
        resposta = await supabaseClient
            .from("dpr_cases")
            .update(dpr)
            .eq("id", dprAtual)
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

    dprAtual = resposta.data.id;

    preencher("reference_number", resposta.data.reference_number);
    preencher("status", resposta.data.status);

    alert("DPR salvo com sucesso.\n\n" + resposta.data.reference_number);

    await carregarDpr();

    limparFormularioDpr();

    window.open(
        "worldtracer/dpr.html?id=" + resposta.data.id,
        "_blank"
    );
}

async function carregarDpr(){
    const { data, error } = await supabaseClient
        .from("dpr_cases")
        .select("*")
        .eq("status", "ABERTO")
        .order("created_at", { ascending:false });

    if(error){
        console.error(error);
        return;
    }

    tabelaDpr.innerHTML = "";

    data.forEach(reg => {
        tabelaDpr.innerHTML += `
            <tr>
                <td>${reg.reference_number || "-"}</td>

                <td>
                    <span class="badge ${reg.status === "ABERTO" ? "bg-success" : "bg-danger"}">
                        ${reg.status}
                    </span>
                </td>

                <td>
                    <button
                        class="btn btn-success btn-sm"
                        onclick="abrirWorldTracerDpr('${reg.id}')">
                        WT
                    </button>

                    <button
                        class="btn btn-info btn-sm"
                        onclick="visualizarDpr('${reg.id}')">
                        Visualizar
                    </button>

                    <button
                        class="btn btn-danger btn-sm"
                        onclick="encerrarDpr('${reg.id}')">
                        Encerrar
                    </button>
                </td>
            </tr>
        `;
    });
}

async function visualizarDpr(id){
    const { data, error } = await supabaseClient
        .from("dpr_cases")
        .select("*")
        .eq("id", id)
        .single();

    if(error){
        console.error(error);
        alert("Erro ao carregar DPR.");
        return;
    }

    dprAtual = data.id;

    Object.keys(data).forEach(key => {
        preencher(key, data[key]);
    });

    document.getElementById("reference_number")?.scrollIntoView({
        behavior:"smooth",
        block:"center"
    });
}

async function encerrarDpr(id){
    if(!confirm("Encerrar este DPR?")){
        return;
    }

    const { error } = await supabaseClient
        .from("dpr_cases")
        .update({
            status:"ENCERRADO",
            closed_at:new Date().toISOString()
        })
        .eq("id", id);

    if(error){
        console.error(error);
        alert(error.message);
        return;
    }

    await carregarDpr();
}

function abrirWorldTracerDpr(id=null){
    if(!id && !dprAtual){
        window.open("worldtracer/dpr.html", "_blank");
        return;
    }

    window.open(
        "worldtracer/dpr.html?id=" + (id || dprAtual),
        "_blank"
    );
}

async function pesquisarDprAutomaticamente(){
    clearTimeout(timerPesquisaDpr);
    timerPesquisaDpr = setTimeout(pesquisarDpr, 300);
}

async function pesquisarDpr(){
    const texto = valor("txtPesquisaDpr").toUpperCase();
    const painel = document.getElementById("resultadoPesquisaDpr");

    if(!painel){
        return;
    }

    if(texto.length < 2){
        painel.style.display = "none";
        painel.innerHTML = "";
        return;
    }

    const { data, error } = await supabaseClient
        .from("dpr_cases")
        .select("*")
        .or(`reference_number.ilike.%${texto}%,tn.ilike.%${texto}%,nm.ilike.%${texto}%`)
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
                Nenhum DPR encontrado.
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
            <div>${reg.tn || ""}</div>
            <div>${reg.nm || ""}</div>
            <span class="badge ${reg.status === "ABERTO" ? "bg-success" : "bg-danger"}">
                ${reg.status}
            </span>
        `;

        card.onclick = () => {
            painel.style.display = "none";
            painel.innerHTML = "";
            preencher("txtPesquisaDpr", "");
            visualizarDpr(reg.id);
        };

        painel.appendChild(card);
    });
}
function limparFormularioDpr(){

    document
        .querySelectorAll("input, textarea, select")
        .forEach(campo => {
            switch(campo.id){
                case "txtPesquisaDpr":
                    break;

                default:
                    campo.value = "";
            }
        });

    carregarCombosBase();
    carregarCombosDano();

    preencher("status", "ABERTO");

    dprAtual = null;

}

console.log("DPR.JS carregado.");