/*==========================================================
WORLDTRACER AHL
Airport Baggage Simulator
==========================================================*/

"use strict";

const parametros = new URLSearchParams(window.location.search);
let ahlId = parametros.get("id");

/*==========================================================
INICIALIZAÇÃO
==========================================================*/

document.addEventListener("DOMContentLoaded", iniciar);

async function iniciar(){

    configurarBotoes();
    configurarAtalhos();

    if(ahlId){
        await carregarAhlWorldTracer(ahlId);
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
CARREGAR
==========================================================*/

async function carregarAhlWorldTracer(id){

    const { data, error } = await supabaseClient
        .from("ahl_cases")
        .select("*")
        .eq("id", id)
        .single();

    if(error){
        console.error(error);
        alert("Erro ao carregar AHL.");
        return;
    }

    preencherCampos(data);

}

function preencherCampos(d){

    preencher("reference_number", d.reference_number);
    preencher("status", d.status);
    preencher("created_at", formatarData(d.created_at));

    preencher("tn", d.tn);
    preencher("ct", d.ct);
    preencher("bi", d.bi);
    preencher("bw", d.bw);
    preencher("cc", d.cc);

    preencher("fd", d.fd);
    preencher("rt", d.rt);
    preencher("tk", d.tk);
    preencher("la", d.la);
    preencher("fl", d.fl);

    preencher("nm", d.nm);
    preencher("it", d.it);
    preencher("pp", d.pp);
    preencher("ps", d.ps);
    preencher("dv", d.dv);

    preencher("cp", d.cp);
    preencher("pn", d.pn);
    preencher("tp", d.tp);
    preencher("ea", d.ea);

    preencher("pa", d.pa);
    preencher("pc", d.pc);
    preencher("pz", d.pz);
    preencher("co", d.co);

    preencher("ta", d.ta);
    preencher("tc", d.tc);
    preencher("ts", d.ts);
    preencher("tz", d.tz);
    preencher("co", d.co);

    preencher("rl", d.rl);
    preencher("fs", d.fs);
    preencher("ag", d.ag);
    preencher("pr", d.pr);

    preencher("description", d.description);

}

/*==========================================================
GERAR REFERÊNCIA
==========================================================*/

async function gerarReferenciaAhl(){

    const { data, error } = await supabaseClient.rpc(
        "gerar_reference_number",
        {
            rota: valor("rt"),
            voo: valor("fd")
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
OBJETO
==========================================================*/

function objetoAhl(){

    return {
        reference_number: valor("reference_number"),
        status: valor("status") || "ABERTO",

        tn: valor("tn"),
        ct: valor("ct"),
        bi: valor("bi"),

        bw: valor("bw") === ""
            ? null
            : parseFloat(valor("bw")),

        cc: valor("cc"),

        fd: valor("fd"),
        rt: valor("rt"),
        tk: valor("tk"),
        la: valor("la"),
        fl: valor("fl"),

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

        rl: valor("rl"),
        fs: valor("fs"),
        ag: valor("ag"),
        pr: valor("pr"),

        description: valor("description")
    };

}

/*==========================================================
VALIDAÇÃO
==========================================================*/

function validarAhl(){

    const obrigatorios = [
        ["tn", "TN"],
        ["fd", "FD"],
        ["rt", "RT"],
        ["nm", "NM"],
        ["cp", "CP"],
        ["pa", "PA"],
        ["pc", "PC"],
        ["co", "CO"]
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

async function salvarAHL(){

    if(!validarAhl()){
        return;
    }

    const objeto = objetoAhl();
    const novoAhl = !ahlId;

    if(!ahlId && !objeto.reference_number){
        objeto.reference_number = await gerarReferenciaAhl();

        if(objeto.reference_number === ""){
            return;
        }
    }

    let resposta;

    if(ahlId){
        resposta = await supabaseClient
            .from("ahl_cases")
            .update(objeto)
            .eq("id", ahlId)
            .select()
            .single();
    }else{
        resposta = await supabaseClient
            .from("ahl_cases")
            .insert([objeto])
            .select()
            .single();
    }

    if(resposta.error){
        console.error(resposta.error);
        alert(resposta.error.message);
        return;
    }

    ahlId = resposta.data.id;

    preencher("reference_number", resposta.data.reference_number);
    preencher("status", resposta.data.status);
    preencher("created_at", formatarData(resposta.data.created_at));

    if(novoAhl && window.ActionFileIntegration){
        await ActionFileIntegration.recordCaseCreated("AHL", resposta.data);
    }

    if(window.MatchEngine){
        await MatchEngine.processAhl(resposta.data);
        await MatchEngine.alertPending("ahl");
    }

    alert((novoAhl ? "AHL criado com sucesso." : "AHL atualizado com sucesso.") + "\n\n" + resposta.data.reference_number);

}

/*==========================================================
BOTÕES
==========================================================*/

function configurarBotoes(){

    document
        .getElementById("btnSave")
        ?.addEventListener("click", salvarAHL);

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
                salvarAHL();
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

console.log("WORLDTRACER AHL carregado.");
