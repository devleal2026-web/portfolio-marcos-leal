/*==========================================================
AIRPORT BAGGAGE SIMULATOR
OHD.JS
==========================================================*/

"use strict";

let timerPesquisaOhd = null;

let ohdAtual = null;

const tabela = document.getElementById("listaOhd");

/*==========================================================
INICIALIZAÇÃO
==========================================================*/

document.addEventListener(

    "DOMContentLoaded",

    iniciarSistema

);

async function iniciarSistema(){

    carregarStations();

    carregarAirlines();

    await carregarOhd();

    await MatchEngine.alertPending("ohd");

    configurarEventos();

}
/*==========================================================
EVENTOS
==========================================================*/

function configurarEventos(){

    document

        .getElementById(

            "btnSalvar"

        )

        .addEventListener(

            "click",

            salvarOhd

        );

    document

        .getElementById(

            "btnContents"

        )

        .addEventListener(

            "click",

            abrirContents

        );
        const pesquisaOhd =
            document.getElementById("txtPesquisaOhd") ||
            document.getElementById("txtPesquisa");

        if(pesquisaOhd){
            pesquisaOhd.addEventListener("keyup", pesquisarOhdAutomaticamente);
        }

}
/*==========================================================
STATIONS
==========================================================*/

const stations=[

"GRU",

"GIG",

"CGH",

"VCP",

"SSA",

"REC",

"FOR",

"CNF",

"BSB",

"POA",

"MIA",

"JFK",

"LAX",

"CDG",

"FRA",

"LHR",

"LIS",

"MAD"

];

function carregarStations(){

    const combo=

    document.getElementById(

        "station"

    );

    stations.forEach(st=>{

        combo.innerHTML+=`

        <option>

            ${st}

        </option>

        `;

    });

}
/*==========================================================
AIRLINES
==========================================================*/

const airlines=[

"LA",

"G3",

"AD",

"AF",

"KL",

"BA",

"LH",

"IB",

"TP",

"UX",

"EK",

"EY",

"QR",

"ET",

"TK",

"AA",

"DL",

"UA",

"CM"

];

function carregarAirlines(){

    const combo=

    document.getElementById(

        "airline"

    );

    airlines.forEach(cia=>{

        combo.innerHTML+=`

        <option>

            ${cia}

        </option>

        `;

    });

}
/*==========================================================
UTILITÁRIOS
==========================================================*/

function valor(id){

    const campo=

    document.getElementById(id);

    return campo ?

        campo.value.trim()

        : "";

}

function preencher(

    id,

    valorCampo

){

    const campo=

    document.getElementById(id);

    if(campo){

        campo.value=

        valorCampo ?? "";

    }

}
/*==========================================================
VALIDAÇÃO
==========================================================*/

function validarOhd(){

    if(valor("station")===""){

        alert("Selecione a Station.");

        return false;

    }

    if(valor("airline")===""){

        alert("Selecione a Companhia Aérea.");

        return false;

    }

    if(valor("ct")===""){

        alert("Informe o CT.");

        return false;

    }

    if(valor("rt")===""){

        alert("Informe a RT.");

        return false;

    }

    if(valor("fd")===""){

        alert("Informe o FD.");

        return false;

    }

    if(valor("ag")===""){

        alert("Informe o AG.");

        return false;

    }

    return true;

}

/*==========================================================
OBJETO OHD
==========================================================*/

function objetoOhd(){

    return{

        station:valor("station"),

        airline:valor("airline"),

        reference_number:valor("reference_number"),

        status:"ABERTO",

        tn:valor("tn"),

        ct:valor("ct"),

        bi:valor("bi"),

        bw:

            valor("bw")===""

            ? null

            : parseFloat(valor("bw")),

        cc:valor("cc"),

        ab:valor("ab"),

        bp:valor("bp"),

        ea:valor("ea"),

        sl:valor("sl"),

        rt:valor("rt"),

        fd:valor("fd"),

        ag:valor("ag"),

        ff:valor("ff"),

        nm:valor("nm"),

        it:valor("it"),

        description:valor("description")

    };

}
/*==========================================================
REFERENCE NUMBER
==========================================================*/

async function gerarReferenceNumber(){

    const{

        data,

        error

    }=await supabaseClient.rpc(

        "gerar_ohd_reference_number",

        {

            p_station:

                valor("station"),

            p_airline:

                valor("airline")

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
SALVAR OHD
==========================================================*/

async function salvarOhd(){

    if(!validarOhd()){

        return;

    }

    const ohd=objetoOhd();

    const novoOhd = !ohdAtual;

    if(!ohdAtual){

        ohd.reference_number=

            await gerarReferenceNumber();

        if(ohd.reference_number===""){

            return;

        }

    }

    else{

        ohd.reference_number=

            valor("reference_number");

    }

    let resposta;

    if(ohdAtual){

        resposta=

            await supabaseClient

            .from("ohd_cases")

            .update(ohd)

            .eq("id",ohdAtual)

            .select()

            .single();

    }

    else{

        resposta=

            await supabaseClient

            .from("ohd_cases")

            .insert([ohd])

            .select()

            .single();

    }

    if(resposta.error){

        console.error(resposta.error);

        alert(resposta.error.message);

        return;

    }

    ohdAtual=null;

    alert(

        "OHD criado com sucesso.\n\n" +

        resposta.data.reference_number

    );

    if(novoOhd && window.ActionFileIntegration){
        await ActionFileIntegration.recordCaseCreated("OHD", resposta.data);
    }

    const idCriado = resposta.data.id;

    await MatchEngine.processOhd(resposta.data);
    await MatchEngine.alertPending("ohd");

    await carregarOhd();

    limparFormulario();

    ohdAtual = null;

    preencher(

        "reference_number",

        ""

    );

    window.open(

        "worldtracer/ohd.html?id=" + idCriado,

        "_blank"

    );

}
/*==========================================================
CARREGAR OHD
==========================================================*/

async function carregarOhd(){

    const{
        data,
        error
    } = await supabaseClient
        .from("ohd_cases")
        .select("*")
        .eq("status", "ABERTO")
        .order(
            "created_at",
            {
                ascending:false
            }
        );

    if(error){
        console.error(error);
        return;
    }

    const matches = await MatchEngine.getMatchesGrouped("ohd");

    tabela.innerHTML = "";

    data.forEach(reg => {

        const listaMatches = matches[reg.id] || [];

        tabela.innerHTML += `
        <tr>
            <td>
                ${reg.reference_number}
            </td>

            <td>
                <span class="badge ${reg.status==="ABERTO" ? "bg-success" : "bg-danger"}">
                    ${reg.status}
                </span>
            </td>

            <td>
                ${MatchEngine.matchPanel("ohd", reg.id, listaMatches)}
            </td>

            <td>
                <button
                    class="btn btn-success btn-sm"
                    onclick="abrirWorldTracer('${reg.id}')">
                    WT
                </button>

                <button
                    class="btn btn-primary btn-sm"
                    onclick="OperationalActions.open('FWD', 'OHD', '${reg.id}')">
                    FWD
                </button>

                <button
                    class="btn btn-warning btn-sm"
                    onclick="verSolicitacoesOhd('${reg.id}')">
                    FOH
                </button>

                <button
                    class="btn btn-secondary btn-sm"
                    onclick="OperationalActions.open('FLZ', 'OHD', '${reg.id}')">
                    FLZ
                </button>

                <button
                    class="btn btn-secondary btn-sm"
                    onclick="OperationalActions.open('COH', 'OHD', '${reg.id}')">
                    COH
                </button>

                <button
                    class="btn btn-warning btn-sm"
                    onclick="BdoFlow.open('OHD', '${reg.id}')">
                    BDO
                </button>

                <button
                    class="btn btn-info btn-sm"
                    onclick="visualizarOhd('${reg.id}')">
                    Visualizar
                </button>

                <button
                    class="btn btn-danger btn-sm"
                    onclick="encerrarOhd('${reg.id}')">
                    Encerrar
                </button>
            </td>
        </tr>
        `;

    });

}
/*==========================================================
LIMPAR
==========================================================*/

function limparFormulario(){

    document

    .querySelectorAll(

        "input,textarea"

    )

    .forEach(campo=>{

        switch(campo.id){

            case "reference_number":

                break;

            default:

                campo.value="";

        }

    });

}
/*==========================================================
ENCERRAR OHD
==========================================================*/

async function encerrarOhd(id){

    if(!confirm("Encerrar este OHD?")){

        return;

    }

    const { error } = await supabaseClient

        .from("ohd_cases")

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

    carregarOhd();

}

/*==========================================================
WORLDTRACER
==========================================================*/

function abrirWorldTracer(id=null){

    const registro=id || ohdAtual;

    if(!registro){

        window.open(

            "worldtracer/ohd.html",

            "_blank"

        );

        return;

    }

    window.open(

        "worldtracer/ohd.html?id="+registro,

        "_blank"

    );

}

/*==========================================================
AUTO IT
==========================================================*/

document

.getElementById("nm")

?.addEventListener(

    "blur",

    ()=>{

        const it=document.getElementById("it");

        if(!it) return;

        if(it.value!=="") return;

        const nome=valor("nm")

        .replace("/"," ")

        .trim()

        .split(/\s+/);

        if(nome.length<2){

            return;

        }

        it.value=

        nome[0][0].toUpperCase()+

        nome[nome.length-1][0].toUpperCase();

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

                salvarOhd();

                break;

            case "F3":

                e.preventDefault();

                abrirWorldTracer();

                break;

            case "F5":

                e.preventDefault();

                carregarOhd();

                break;

        }

    }

);

async function verSolicitacoesOhd(id){

    const container = document.getElementById("ohdFlowRequests");

    if(!container){
        alert("Área de solicitações ROH/FOH não encontrada.");
        return;
    }

    if(typeof OhdFlow === "undefined"){
        alert("Módulo ROH/FOH não carregado.");
        return;
    }

    await OhdFlow.renderOhdRequests(id, "ohdFlowRequests");

    container.scrollIntoView({
        behavior:"smooth",
        block:"start"
    });

}

async function visualizarOhd(id){

    const { data, error } = await supabaseClient
        .from("ohd_cases")
        .select("*")
        .eq("id", id)
        .single();

    if(error){
        console.error(error);
        alert("Erro ao carregar OHD.");
        return;
    }

    ohdAtual = data.id;

    preencher("station", data.station);
    preencher("airline", data.airline);
    preencher("reference_number", data.reference_number);
    preencher("status", data.status);

    preencher("tn", data.tn);
    preencher("ct", data.ct);
    preencher("bi", data.bi);
    preencher("bw", data.bw);

    preencher("cc", data.cc);

    preencher("ab", data.ab);
    preencher("bp", data.bp);
    preencher("ea", data.ea);
    preencher("sl", data.sl);

    preencher("rt", data.rt);
    preencher("fd", data.fd);
    preencher("ag", data.ag);
    preencher("ff", data.ff);

    preencher("nm", data.nm);
    preencher("it", data.it);

    preencher("description", data.description);

    await verSolicitacoesOhd(id);

    document.getElementById("reference_number")?.scrollIntoView({
        behavior:"smooth",
        block:"center"
    });

}
async function pesquisarOhdAutomaticamente(){

    clearTimeout(timerPesquisaOhd);

    timerPesquisaOhd = setTimeout(
        pesquisarOhd,
        300
    );

}

async function pesquisarOhd(){

    const texto = valor("txtPesquisaOhd").toUpperCase();

    const painel = document.getElementById("resultadoPesquisaOhd");

    if(!painel){
        return;
    }

    if(texto.length < 2){
        painel.style.display = "none";
        painel.innerHTML = "";
        return;
    }

    const { data, error } = await supabaseClient
        .from("ohd_cases")
        .select("*")
        .or(
            `reference_number.ilike.%${texto}%,tn.ilike.%${texto}%,nm.ilike.%${texto}%,cc.ilike.%${texto}%`
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
                Nenhum OHD encontrado.
            </div>
        `;
        return;
    }

    data.forEach(montarResultadoPesquisaOhd);

}

function montarResultadoPesquisaOhd(caso){

    const painel = document.getElementById("resultadoPesquisaOhd");

    const pesquisa = valor("txtPesquisaOhd").toUpperCase();

    let tipo = "OHD";

    let linha2 = caso.reference_number || "-";

    if(caso.tn && caso.tn.toUpperCase().includes(pesquisa)){
        tipo = "TAG";
        linha2 = caso.tn;
    }else if(caso.nm && caso.nm.toUpperCase().includes(pesquisa)){
        tipo = "PASSAGEIRO";
        linha2 = caso.nm;
    }else if(caso.cc && caso.cc.toUpperCase().includes(pesquisa)){
        tipo = "CONTEÚDO";
        linha2 = caso.cc;
    }

    const card = document.createElement("div");

    card.className = "list-group-item list-group-item-action bg-dark text-light border-secondary";

    card.style.cursor = "pointer";

    card.innerHTML = `
        <div class="fw-bold text-warning">
            ${tipo}
        </div>

        <div class="fw-bold">
            ${linha2}
        </div>

        <div>
            ${caso.reference_number || "-"}
        </div>

        <div>
            ${caso.nm || ""}
        </div>

        <div>
            <span class="badge ${caso.status === "ABERTO" ? "bg-success" : "bg-danger"}">
                ${caso.status}
            </span>
        </div>
    `;

    card.onclick = () => {

        painel.style.display = "none";

        painel.innerHTML = "";

        preencher("txtPesquisaOhd", "");

        visualizarOhd(caso.id);

    };

    painel.appendChild(card);

}
function campoPesquisaOhd(){
    return document.getElementById("txtPesquisaOhd") ||
           document.getElementById("txtPesquisa");
}

function painelPesquisaOhd(){
    return document.getElementById("resultadoPesquisaOhd") ||
           document.getElementById("resultadoPesquisa");
}

async function pesquisarOhdAutomaticamente(){

    clearTimeout(timerPesquisaOhd);

    timerPesquisaOhd = setTimeout(
        pesquisarOhd,
        300
    );

}

async function pesquisarOhd(){

    const campo = campoPesquisaOhd();

    const painel = painelPesquisaOhd();

    if(!campo || !painel){
        return;
    }

    const texto = campo.value.trim().toUpperCase();

    if(texto.length < 2){
        painel.style.display = "none";
        painel.innerHTML = "";
        return;
    }

    const { data, error } = await supabaseClient
        .from("ohd_cases")
        .select("*")
        .or(
            `reference_number.ilike.%${texto}%,tn.ilike.%${texto}%,nm.ilike.%${texto}%,cc.ilike.%${texto}%`
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
                Nenhum OHD encontrado.
            </div>
        `;
        return;
    }

    data.forEach(montarResultadoPesquisaOhd);

}

function montarResultadoPesquisaOhd(caso){

    const painel = painelPesquisaOhd();

    const campo = campoPesquisaOhd();

    const pesquisa = campo.value.trim().toUpperCase();

    let tipo = "OHD";

    let linha2 = caso.reference_number || "-";

    if(caso.tn && caso.tn.toUpperCase().includes(pesquisa)){
        tipo = "TAG";
        linha2 = caso.tn;
    }else if(caso.nm && caso.nm.toUpperCase().includes(pesquisa)){
        tipo = "PASSAGEIRO";
        linha2 = caso.nm;
    }else if(caso.cc && caso.cc.toUpperCase().includes(pesquisa)){
        tipo = "CONTEÚDO";
        linha2 = caso.cc;
    }

    const card = document.createElement("div");

    card.className = "list-group-item list-group-item-action bg-dark text-light border-secondary";

    card.style.cursor = "pointer";

    card.innerHTML = `
        <div class="fw-bold text-warning">
            ${tipo}
        </div>

        <div class="fw-bold">
            ${linha2}
        </div>

        <div>
            ${caso.reference_number || "-"}
        </div>

        <div>
            ${caso.nm || ""}
        </div>

        <div>
            <span class="badge ${caso.status === "ABERTO" ? "bg-success" : "bg-danger"}">
                ${caso.status}
            </span>
        </div>
    `;

    card.onclick = () => {

        painel.style.display = "none";

        painel.innerHTML = "";

        campo.value = "";

        visualizarOhd(caso.id);

    };

    painel.appendChild(card);

}

console.log("OHD carregado.");
