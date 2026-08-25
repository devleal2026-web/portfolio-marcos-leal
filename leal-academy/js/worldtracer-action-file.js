/*==========================================================
WORLDTRACER ACTION FILE
SITA MASK
==========================================================*/

"use strict";

const params = new URLSearchParams(window.location.search);
const actionFileId = params.get("id");

document.addEventListener("DOMContentLoaded", iniciarActionFileWorldTracer);

async function iniciarActionFileWorldTracer(){
    configurarBotoes();

    if(!actionFileId){
        preencher("status", "NÃO CARREGADO");
        return;
    }

    await carregarActionFileWorldTracer();
}

function configurarBotoes(){
    document.getElementById("btnPrint")?.addEventListener("click", () => window.print());
    document.getElementById("btnClose")?.addEventListener("click", () => window.close());

    document.addEventListener("keydown", event => {
        if(event.key === "F3"){
            event.preventDefault();
            window.print();
        }

        if(event.key === "F10"){
            event.preventDefault();
            window.close();
        }
    });
}

async function carregarActionFileWorldTracer(){
    if(typeof supabaseClient === "undefined" || !supabaseClient){
        alert("Não foi possível conectar ao Supabase agora. Tente novamente em instantes.");
        return;
    }

    const { data, error } = await supabaseClient
        .from("action_files")
        .select("*")
        .eq("id", actionFileId)
        .single();

    if(error){
        console.error(error);
        alert("Não foi possível carregar a máscara SITA do Action File.");
        return;
    }

    preencherCampos(data);
}

function preencherCampos(data){
    preencher("reference_number", data.reference_number);
    preencher("status", data.status);
    preencher("created_at", formatDate(data.created_at));
    preencher("action_category_label", data.action_category_label);
    preencher("action_code", data.action_code);
    preencher("case_type", data.case_type);
    preencher("day", "DAY " + dayBucket(data.created_at));
    preencher("station", data.station);
    preencher("airline", data.airline);
    preencher("priority", data.priority);
    preencher("assigned_to", data.assigned_to);
    preencher("forward_to", data.forward_to);
    preencher("action_title", data.action_title);
    preencher("message", data.message);
    preencher("response", data.response);
    preencher("history", formatHistory(data.history));
}

function preencher(id, value){
    const campo = document.getElementById(id);

    if(campo){
        campo.value = value ?? "";
    }
}

function formatDate(value){
    if(!value){
        return "";
    }

    return new Date(value).toLocaleString("pt-BR");
}

function dayBucket(value){
    if(!value){
        return 7;
    }

    const created = new Date(value);
    const now = new Date();
    const diffDays = Math.floor((now.getTime() - created.getTime()) / 86400000) + 1;

    if(diffDays < 1){
        return 1;
    }

    if(diffDays > 7){
        return 7;
    }

    return diffDays;
}

function formatHistory(history){
    if(!Array.isArray(history) || history.length === 0){
        return "";
    }

    return history.map(item => {
        const date = item.at ? formatDate(item.at) : "";
        const event = item.event || item.action || "";
        const message = item.message || item.response || "";

        return [date, event, message].filter(Boolean).join(" - ");
    }).join("\n");
}
