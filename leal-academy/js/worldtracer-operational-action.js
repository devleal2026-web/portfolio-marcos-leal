/*==========================================================
WORLDTRACER OPERATIONAL ACTION
FWD / FAH SITA MASK
==========================================================*/

"use strict";

const params = new URLSearchParams(window.location.search);
const actionId = params.get("id");
const actionReference = params.get("ref");

document.addEventListener("DOMContentLoaded", iniciarWorldTracerAction);

async function iniciarWorldTracerAction(){
    configurarBotoes();

    if(!actionId && !actionReference){
        preencher("status", "NÃO CARREGADO");
        return;
    }

    await carregarAcaoOperacional();
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

async function carregarAcaoOperacional(){
    if(typeof supabaseClient === "undefined" || !supabaseClient){
        alert("Não foi possível conectar ao Supabase agora. Tente novamente em instantes.");
        return;
    }

    let query = supabaseClient
        .from("operational_actions")
        .select("*");

    query = actionId
        ? query.eq("id", actionId)
        : query.eq("action_reference", actionReference);

    const { data, error } = await query.single();

    if(error){
        console.error(error);
        alert("Não foi possível carregar a máscara SITA desta ação.");
        return;
    }

    preencherCampos(data);
}

function preencherCampos(data){
    preencher("action_reference", data.action_reference);
    preencher("reference_number", data.reference_number);
    preencher("status", data.status);
    preencher("created_at", formatDate(data.created_at));
    preencher("station", data.station);
    preencher("airline", data.airline);
    preencher("destination_station", data.destination_station);
    preencher("rush_tag", data.rush_tag);
    preencher("original_tag", data.original_tag);
    preencher("flight", data.flight);
    preencher("route", data.route);
    preencher("weight", data.weight);
    preencher("reason_for_loss", data.reason_for_loss);
    preencher("fault_station", data.fault_station);
    preencher("fault_airline", data.fault_airline);
    preencher("notes", data.notes);
    preencher("bag_description", data.bag_description);
    preencher("message", data.message);
    preencher("origin_address", `${data.station || ""}/${data.airline || ""}`.replace(/\/$/, ""));
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
