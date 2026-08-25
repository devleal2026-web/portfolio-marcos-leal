/*==========================================================
AIRPORT BAGGAGE SIMULATOR
AHL.JS 3.0
Versão limpa
==========================================================*/

"use strict";

/*==========================================================
VARIÁVEIS
==========================================================*/

let ahlAtual = null;

const tabela = document.getElementById("listaAhl");

let timerPesquisa = null;

/*==========================================================
INICIALIZAÇÃO
==========================================================*/

document.addEventListener(

    "DOMContentLoaded",

    iniciarSistema

);

async function iniciarSistema(){

    configurarEventos();

    await carregarAhl();
    await MatchEngine.alertPending("ahl");

}

/*==========================================================
EVENTOS
==========================================================*/

function configurarEventos(){

    document

        .getElementById("btnSalvar")

        ?.addEventListener(

            "click",

            salvarAhl

        );

    document

        .getElementById("btnWorldTracer")

        ?.addEventListener(

            "click",

            ()=>abrirWorldTracer()

        );

    const pesquisa =

        document.getElementById(

            "txtPesquisa"

        );

    if(pesquisa){

        pesquisa.addEventListener(

            "keyup",

            pesquisarAutomaticamente

        );

    }
    document
        .getElementById("btnContents")
        ?.addEventListener(
            "click",
            abrirContents
        );

}

/*==========================================================
UTILITÁRIOS
==========================================================*/

function valor(id){

    const campo =

        document.getElementById(id);

    if(!campo){

        return "";

    }

    return campo.value.trim();

}

function preencher(

    id,

    valorCampo

){

    const campo =

        document.getElementById(id);

    if(!campo){

        return;

    }

    campo.value =

        valorCampo ?? "";

}

/*==========================================================
LIMPAR FORMULÁRIO
==========================================================*/

function limparFormulario(){

    document

        .querySelectorAll(

            "input, textarea, select"

        )

        .forEach(campo=>{

            switch(campo.id){

                case "reference_number":

                case "txtPesquisa":

                    break;

                default:

                    campo.value="";

            }

        });

}

/*==========================================================
GERAR FILE REFERENCE
==========================================================*/

async function gerarReferencia(){

    const{

        data,

        error

    } = await supabaseClient.rpc(

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
OBJETO AHL
==========================================================*/

function objetoAHL(){

    return{

        reference_number:valor("reference_number"),

        tn:valor("tn"),
        ct:valor("ct"),
        bi:valor("bi"),

        bw:valor("bw")===""
            ? null
            : parseFloat(valor("bw")),
        cc: valor("cc"),

        fd:valor("fd"),
        rt:valor("rt"),
        db:valor("db"),
        br:valor("br"),
        fl:valor("fl"),
        tk:valor("tk"),
        la:valor("la"),

        nm:valor("nm"),
        it:valor("it"),
        pp:valor("pp"),
        ps:valor("ps"),
        dv:valor("dv"),

        cp:valor("cp"),
        pn:valor("pn"),
        tp:valor("tp"),
        ea:valor("ea"),

        pa:valor("pa"),
        pc:valor("pc"),
        pz:valor("pz"),
        co:valor("co"),

        ta:valor("ta"),
        tc:valor("tc"),
        ts:valor("ts"),
        tz:valor("tz"),
        co:valor("co"),

        rl:valor("rl"),
        fs:valor("fs"),
        ag:valor("ag"),
        pr:valor("pr"),

        description:valor("description"),

        status:"ABERTO"

    };

}

/*==========================================================
VALIDAÇÃO
==========================================================*/

function validarFormulario(){

    const obrigatorios=[

        ["tn","TN - Tag Number"],
        ["fd","FD - Flight / Date"],
        ["rt","RT - Route"],
        ["nm","NM - Passenger Name"],
        ["cp","CP - Cellular Phone"],
        ["pa","PA - Permanent Address"],
        ["pc","PC - Permanent City"],
        ["co","CO - Country"],
        ["rl","RL - Reason for Loss"],
        ["fs","FS - Fault Station"]

    ];

    for(const campo of obrigatorios){

        if(valor(campo[0])===""){

            alert(

                "Campo obrigatório:\n\n"+

                campo[1]

            );

            document

                .getElementById(

                    campo[0]

                )

                ?.focus();

            return false;

        }

    }

    return true;

}

/*==========================================================
SALVAR AHL
==========================================================*/

async function salvarAhl(){

    if(

        !validarFormulario()

    ){

        return;

    }

    const ahl=

        objetoAHL();

    const novoAhl = !ahlAtual;

    if(

        !ahlAtual

    ){

        ahl.reference_number=

            await gerarReferencia();

        if(

            ahl.reference_number===""

        ){

            return;

        }

    }

    else{

        ahl.reference_number=

            valor(

                "reference_number"

            );

    }

    let resposta;

    if(

        ahlAtual

    ){

        resposta=

            await supabaseClient

            .from("ahl_cases")

            .update(ahl)

            .eq("id",ahlAtual)

            .select()

            .single();

    }

    else{

        resposta=

            await supabaseClient

            .from("ahl_cases")

            .insert([ahl])

            .select()

            .single();

    }

    if(

        resposta.error

    ){

        console.error(

            resposta.error

        );

        alert(

            resposta.error.message

        );

        return;

    }

    ahlAtual=

        resposta.data.id;

    preencher(

        "reference_number",

        resposta.data.reference_number

    );

    if(novoAhl && window.ActionFileIntegration){
        await ActionFileIntegration.recordCaseCreated("AHL", resposta.data);
    }

    await carregarAhl();

    const idCriado=

        ahlAtual;

        await MatchEngine.processAhl(resposta.data);
        await MatchEngine.alertPending("ahl");

    limparFormulario();

    ahlAtual=null;

    preencher(

        "reference_number",

        ""

    );

    document

        .getElementById("tn")

        ?.focus();

    window.open(

        "worldtracer/ahl.html?id="+

        idCriado,

        "_blank"

    );

}
/*==========================================================
CARREGAR LISTA DE AHL
==========================================================*/

async function carregarAhl(){

    const { data, error } = await supabaseClient
        .from("ahl_cases")
        .select("*")
        .eq("status", "ABERTO")
        .order(
            "created_at",
            { ascending:false }
        );

    if(error){
        console.error(error);
        return;
    }

    const matches = await MatchEngine.getMatchesGrouped("ahl");

    tabela.innerHTML = "";

    data.forEach(caso => {

        const listaMatches = matches[caso.id] || [];

        tabela.innerHTML += `
        <tr>
            <td>
                ${caso.reference_number}
            </td>

            <td>
                <span class="badge ${caso.status==="ABERTO" ? "bg-success" : "bg-danger"}">
                    ${caso.status}
                </span>
            </td>

            <td>
                ${MatchEngine.matchPanel("ahl", caso.id, listaMatches)}
            </td>

            <td>
            <button
                class="btn btn-success btn-sm"
                onclick="abrirWorldTracer('${caso.id}')">
                WT
            </button>

            <button
                class="btn btn-primary btn-sm"
                onclick="OperationalActions.open('FWD', 'AHL', '${caso.id}')">
                FWD
            </button>

            <button
                class="btn btn-primary btn-sm"
                onclick="OperationalActions.open('FAH', 'AHL', '${caso.id}')">
                FAH
            </button>

            <button
                class="btn btn-warning btn-sm"
                onclick="BdoFlow.open('AHL', '${caso.id}')">
                BDO
            </button>

            <button
                class="btn btn-info btn-sm"
                onclick="visualizarAhl('${caso.id}')">
                Visualizar
            </button>

            <button
                class="btn btn-danger btn-sm"
                onclick="encerrar('${caso.id}')">
                Encerrar
            </button>
            </td>
        </tr>
        `;

    });

}

/*==========================================================
PESQUISA
==========================================================*/

async function pesquisarAutomaticamente(){

    clearTimeout(timerPesquisa);

    timerPesquisa=setTimeout(

        pesquisar,

        300

    );

}

async function pesquisar(){

    const texto = valor("txtPesquisa").toUpperCase();

    const painel = document.getElementById("resultadoPesquisa");

    if(!painel){
        return;
    }

    if(texto.length < 2){
        painel.style.display = "none";
        painel.innerHTML = "";
        return;
    }

    const { data, error } = await supabaseClient
        .from("ahl_cases")
        .select("*")
        .or(
            `reference_number.ilike.%${texto}%,tn.ilike.%${texto}%,nm.ilike.%${texto}%`
        )
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
                Nenhum processo encontrado.
            </div>
        `;
        return;
    }

    data.forEach(montarResultadoPesquisa);

}
/*==========================================================
MONTAR RESULTADOS DA PESQUISA
==========================================================*/

function montarResultadoPesquisa(caso){

    const painel=document.getElementById("resultadoPesquisa");

    const pesquisa=valor("txtPesquisa").toUpperCase();

    let tipo="AHL";

    let linha2=caso.reference_number;

    if(caso.tn && caso.tn.toUpperCase().includes(pesquisa)){

        tipo="TAG";
        linha2=caso.tn;

    }
    else if(caso.pn && caso.pn.toUpperCase().includes(pesquisa)){

        tipo="PNR";
        linha2=caso.pn;

    }
    else if(caso.nm && caso.nm.toUpperCase().includes(pesquisa)){

        tipo="PASSAGEIRO";
        linha2=caso.nm;

    }

    const card=document.createElement("div");

    card.className="list-group-item list-group-item-action";

    card.style.cursor="pointer";

    card.innerHTML=`

        <div class="fw-bold text-primary">

            ${tipo}

        </div>

        <div class="fw-bold">

            ${linha2}

        </div>

        <div>

            ${caso.nm}

        </div>

        <div>

            <span class="badge ${caso.status==="ABERTO" ? "bg-success" : "bg-danger"}">

                ${caso.status}

            </span>

        </div>

    `;

    card.onclick=()=>{

        painel.style.display="none";

        painel.innerHTML="";

        preencher("txtPesquisa","");

        visualizarAhl(caso.id);

    };

    painel.appendChild(card);

}

/*==========================================================
WORLDTRACER
==========================================================*/

function abrirWorldTracer(id=null){

    const registro=id || ahlAtual;

    if(!registro){

        window.open(

            "worldtracer/ahl.html",

            "_blank"

        );

        return;

    }

    window.open(

        "worldtracer/ahl.html?id="+registro,

        "_blank"

    );

}
/*==========================================================
ENCERRAR AHL
==========================================================*/

async function encerrar(id){

    if(!confirm("Encerrar este AHL?")){

        return;

    }

    const { error } = await supabaseClient

        .from("ahl_cases")

        .update({

            status:"ENCERRADO",

            closed_at:new Date().toISOString()

        })

        .eq("id",id);

    if(error){

        console.error(error);

        alert(error.message);

        return;

    }

    await carregarAhl();

}

/*==========================================================
AUTO PREENCHIMENTO DO IT
==========================================================*/

document

.addEventListener(

    "DOMContentLoaded",

    ()=>{

        const campoNome=document.getElementById("nm");

        if(!campoNome) return;

        campoNome.addEventListener(

            "blur",

            ()=>{

                const it=document.getElementById("it");

                if(!it) return;

                if(it.value!=="") return;

                const partes=valor("nm")

                    .replace("/"," ")

                    .trim()

                    .split(/\s+/);

                if(partes.length<2) return;

                it.value=

                    partes[0][0].toUpperCase()+

                    partes[partes.length-1][0].toUpperCase();

            }

        );

    }

);

/*==========================================================
ATALHOS
==========================================================*/

document.addEventListener(

    "keydown",

    e=>{

        switch(e.key){

            case "F1":

                e.preventDefault();

                salvarAhl();

                break;

            case "F3":

                e.preventDefault();

                abrirWorldTracer();

                break;

            case "F5":

                e.preventDefault();

                carregarAhl();

                break;

            case "Escape":

                document.getElementById("resultadoPesquisa").style.display="none";

                break;

        }

    }

);

async function visualizarAhl(id){

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

    ahlAtual = data.id;

    preencher("reference_number", data.reference_number);

    preencher("tn", data.tn);
    preencher("ct", data.ct);
    preencher("bi", data.bi);
    preencher("bw", data.bw);

    preencher("cc", data.cc);

    preencher("fd", data.fd);
    preencher("rt", data.rt);
    preencher("db", data.db);
    preencher("br", data.br);
    preencher("fl", data.fl);
    preencher("tk", data.tk);
    preencher("la", data.la);

    preencher("nm", data.nm);
    preencher("it", data.it);
    preencher("pp", data.pp);
    preencher("ps", data.ps);
    preencher("dv", data.dv);

    preencher("cp", data.cp);
    preencher("pn", data.pn);
    preencher("tp", data.tp);
    preencher("ea", data.ea);

    preencher("pa", data.pa);
    preencher("pc", data.pc);
    preencher("pz", data.pz);
    preencher("co", data.co);

    preencher("ta", data.ta);
    preencher("tc", data.tc);
    preencher("ts", data.ts);
    preencher("tz", data.tz);
    preencher("co", data.co);

    preencher("rl", data.rl);
    preencher("fs", data.fs);
    preencher("ag", data.ag);
    preencher("pr", data.pr);

    preencher("description", data.description);

    if(window.OhdFlow){
        await OhdFlow.renderAhlRequests(id, "ahlFlowRequests");
    }

    document.getElementById("reference_number")?.scrollIntoView({
        behavior:"smooth",
        block:"center"
    });

}

/*==========================================================
FIM
==========================================================*/

console.log("AHL.JS 3.0 carregado com sucesso.");
