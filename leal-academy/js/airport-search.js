/*==================================================
AIRPORT SEARCH
Airport Baggage Simulator
Versão 1.0
==================================================*/

async function pesquisarAeroportos(texto){

    if(texto.length < 1){

        return [];

    }

    const { data, error } = await supabase

        .from("airports")

        .select("*")

        .or(`iata.ilike.%${texto}%,airport_name.ilike.%${texto}%,city.ilike.%${texto}%`)

        .eq("active", true)

        .order("iata");

    if(error){

        console.error(error);

        return [];

    }

    return data;

}
function montarListaAirport(listaDiv,dados,input){

    listaDiv.innerHTML="";

    if(dados.length===0){

        listaDiv.style.display="none";

        return;

    }

    dados.forEach(aeroporto=>{

        const item=document.createElement("button");

        item.type="button";

        item.className="list-group-item list-group-item-action";

        item.innerHTML=`

            <strong>${aeroporto.iata}</strong>

            <br>

            ${aeroporto.airport_name}

            <br>

            <small>

            ${aeroporto.city}

            -

            ${aeroporto.country}

            </small>

        `;

        item.onclick=()=>{

            input.value=aeroporto.iata;

            listaDiv.style.display="none";

        };

        listaDiv.appendChild(item);

    });

    listaDiv.style.display="block";

}
function configurarPesquisaAirport(inputId,listaId){

    const input=document.getElementById(inputId);

    const lista=document.getElementById(listaId);

    if(!input || !lista){

        return;

    }

    input.addEventListener("keyup",async()=>{

        const resultado=await pesquisarAeroportos(input.value);

        montarListaAirport(lista,resultado,input);

    });

    document.addEventListener("click",(e)=>{

        if(!lista.contains(e.target) && e.target!==input){

            lista.style.display="none";

        }

    });

}