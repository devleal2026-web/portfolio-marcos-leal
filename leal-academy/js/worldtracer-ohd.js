/*==========================================================
WORLDTRACER OHD
Airport Baggage Simulator
==========================================================*/

"use strict";

let idOhd = null;

/*==========================================================
INICIALIZAÇÃO
==========================================================*/

document.addEventListener("DOMContentLoaded", iniciar);

async function iniciar(){

    const parametros = new URLSearchParams(window.location.search);

    idOhd = parametros.get("id");

    configurarBotoes();
    configurarAtalhos();

    if(idOhd){
        await carregarOhd();
    }else{
        preencher("status", "ABERTO");
        preencher("created_at", formatarData(new Date().toISOString()));
        document.getElementById("tn")?.focus();
    }

}

/*==========================================================
UTILITÁRIOS
==========================================================*/

function valor(id){
    const campo = document.getElementById(id);
    return campo ? campo.value.trim() : "";
}

function preencher(id, valorCampo){
    const campo = document.getElementById(id);
    if(!campo) return;
    campo.value = valorCampo ?? "";
}

function formatarData(data){
    if(!data) return "";
    return new Date(data).toLocaleString("pt-BR");
}

/*==========================================================
DERIVAR STATION / AIRLINE
==========================================================*/

function obterStation(){

    const rota = valor("rt").toUpperCase();
    const stationMenu = valor("station").toUpperCase();

    if(rota.includes("/")){
        const partes = rota
            .split("/")
            .map(item => item.trim())
            .filter(Boolean);

        const destino = partes[partes.length - 1];

        if(destino && destino.length === 3){
            return destino;
        }
    }

    if(stationMenu && stationMenu.length === 3){
        return stationMenu;
    }

    if(rota.length === 3){
        return rota;
    }

    return "GRU";

}

function obterAirline(){

    const fd = valor("fd").toUpperCase();
    const airlineMenu = valor("airline").toUpperCase();

    const match = fd.match(/^([A-Z0-9]{2})/);

    if(match && match[1] && match[1] !== "YY"){
        return match[1];
    }

    if(airlineMenu && airlineMenu.length === 2){
        return airlineMenu;
    }

    if(match && match[1]){
        return match[1];
    }

    return "YY";

}
async function gerarReferenciaOhd(){

    const station = obterStation();
    const airline = obterAirline();

    if(!station || station.length !== 3){
        alert("Não foi possível identificar a base. Informe STATION ou uma rota RT válida. Ex.: REC/GRU");
        return "";
    }

    if(!airline || airline.length !== 2){
        alert("Não foi possível identificar a companhia. Informe AIRLINE ou um FD válido. Ex.: LA1234/28JUN");
        return "";
    }

    const { data, error } = await supabaseClient.rpc(
        "gerar_ohd_reference_number",
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

    return data;

}

/*==========================================================
BUSCAR OHD
==========================================================*/

async function carregarOhd(){

    const { data, error } = await supabaseClient
        .from("ohd_cases")
        .select("*")
        .eq("id", idOhd)
        .single();

    if(error){
        console.error(error);
        alert("Erro ao carregar OHD.");
        return;
    }

    preencherCampos(data);

}

/*==========================================================
PREENCHER
==========================================================*/

function preencherCampos(d){

    preencher("reference_number", d.reference_number);
    preencher("status", d.status);
    preencher("created_at", formatarData(d.created_at));

    preencher("tn", d.tn);
    preencher("ct", d.ct);
    preencher("bi", d.bi);
    preencher("bw", d.bw);

    preencher("nm", d.nm);
    preencher("it", d.it);

    preencher("rt", d.rt);
    preencher("fd", d.fd);

    preencher("ab", d.ab);
    preencher("bp", d.bp);
    preencher("ea", d.ea);
    preencher("sl", d.sl);

    preencher("cc", d.cc);

    preencher("ag", d.ag);
    preencher("ff", d.ff);

    preencher("description", d.description);

}

/*==========================================================
GERAR REFERÊNCIA
==========================================================*/

async function gerarReferenciaOhd(){

    const { data, error } = await supabaseClient.rpc(
        "gerar_ohd_reference_number",
        {
            p_station: obterStation(),
            p_airline: obterAirline()
        }
    );

    if(error){
        console.error(error);
        alert(error.message);
        return "";
    }

    return data;

}

/*==========================================================
OBJETO OHD
==========================================================*/

function objetoOhd(){

    return {
        station: obterStation(),
        airline: obterAirline(),

        reference_number: valor("reference_number"),
        status: valor("status") || "ABERTO",

        tn: valor("tn"),
        ct: valor("ct"),
        bi: valor("bi"),

        bw: valor("bw") === ""
            ? null
            : parseFloat(valor("bw")),

        nm: valor("nm"),
        it: valor("it"),

        rt: valor("rt"),
        fd: valor("fd"),

        ab: valor("ab"),
        bp: valor("bp"),
        ea: valor("ea"),
        sl: valor("sl"),

        cc: valor("cc"),

        ag: valor("ag"),
        ff: valor("ff"),

        description: valor("description")
    };

}

/*==========================================================
VALIDAÇÃO
==========================================================*/

function validarOhd(){

    const obrigatorios = [
        ["ct", "CT"],
        ["rt", "RT"],
        ["fd", "FD"],
        ["ag", "AG"]
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

/*==========================================================
SALVAR / CRIAR
==========================================================*/

async function salvarOhd(){

    if(!validarOhd()){
        return;
    }

    const objeto = objetoOhd();
    const novoOhd = !idOhd;

    if(!idOhd && !objeto.reference_number){
        objeto.reference_number = await gerarReferenciaOhd();

        if(objeto.reference_number === ""){
            return;
        }
    }

    let resposta;

    if(idOhd){
        resposta = await supabaseClient
            .from("ohd_cases")
            .update(objeto)
            .eq("id", idOhd)
            .select()
            .single();
    }else{
        resposta = await supabaseClient
            .from("ohd_cases")
            .insert([objeto])
            .select()
            .single();
    }

    if(resposta.error){
        console.error(resposta.error);
        alert(resposta.error.message);
        return;
    }

    idOhd = resposta.data.id;

    preencher("reference_number", resposta.data.reference_number);
    preencher("status", resposta.data.status);
    preencher("created_at", formatarData(resposta.data.created_at));

    if(novoOhd && window.ActionFileIntegration){
        await ActionFileIntegration.recordCaseCreated("OHD", resposta.data);
    }

    if(window.MatchEngine){
        await MatchEngine.processOhd(resposta.data);
        await MatchEngine.alertPending("ohd");
    }

    alert((novoOhd ? "OHD criado com sucesso." : "OHD atualizado com sucesso.") + "\n\n" + resposta.data.reference_number);

}

/*==========================================================
BOTÕES
==========================================================*/

function configurarBotoes(){

    document
        .getElementById("btnSave")
        ?.addEventListener("click", salvarOhd);

    document
        .getElementById("btnPrint")
        ?.addEventListener("click", () => window.print());

    document
        .getElementById("btnClear")
        ?.addEventListener("click", limparCampos);

    document
        .getElementById("btnClose")
        ?.addEventListener("click", () => window.close());

    document
        .getElementById("btnHistory")
        ?.addEventListener("click", () => {
            alert("Histórico será implementado.");
        });

        document
            .getElementById("btnContents")
            ?.addEventListener("click", abrirContents);

}

/*==========================================================
LIMPAR
==========================================================*/

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

/*==========================================================
ATALHOS
==========================================================*/

function configurarAtalhos(){

    document.addEventListener("keydown", e => {

        switch(e.key){

            case "F1":
                e.preventDefault();
                salvarOhd();
                break;

            case "F2":
                e.preventDefault();
                limparCampos();
                break;

            case "F3":
                e.preventDefault();
                window.print();
                break;

            case "F4":
                e.preventDefault();
                alert("Histórico será implementado.");
                break;

            case "F10":
                e.preventDefault();
                window.close();
                break;

        }

    });

}

console.log("WORLDTRACER OHD carregado.");
