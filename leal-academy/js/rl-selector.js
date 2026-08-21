/*==========================================
RL SELECTOR
Airport Baggage Simulator
==========================================*/

let listaReasonLoss=[];

async function carregarRL(){

    const{

        data,

        error

    }=await supabaseClient

    .from("reason_for_loss")

    .select("*")

    .eq("active",true)

    .order("code");

    if(error){

        console.error(error);

        return;

    }

    listaReasonLoss=data;

    preencherListaRL();

}
function preencherListaRL(){

    const lista=document.getElementById("listaRL");

    lista.innerHTML="";

    listaReasonLoss.forEach(item=>{

        lista.innerHTML+=`

            <option

            value="${item.code}">

            ${item.code} -

            ${item.description}

            </option>

        `;

    });

}
function atualizarPainelRL(){

    const codigo=

    document

    .getElementById("rl")

    .value;

    const rl=

    listaReasonLoss.find(

    item=>item.code===codigo

    );

    if(!rl){

        document

        .getElementById("painelRL")

        .style.display="none";

        return;

    }

    document

    .getElementById("painelRL")

    .style.display="block";

    document

    .getElementById("rlCodigo")

    .innerText=rl.code;

    document

    .getElementById("rlDescricao")

    .innerText=rl.description;

    document

    .getElementById("rlCategoria")

    .innerText=rl.category;

    document

    .getElementById("rlResponsabilidade")

    .innerText=rl.responsibility;

    document

    .getElementById("rlGerenciavel")

    .innerText=

    rl.manageable

    ?"SIM"

    :"NÃO";

}
function iniciarRL(){

    carregarRL();

    document

    .getElementById("rl")

    .addEventListener(

        "change",

        atualizarPainelRL

    );

}