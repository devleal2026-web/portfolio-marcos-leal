const voosDiv =
document.getElementById(
    "voos"
);

document
.getElementById(
    "btnAtualizar"
)
.addEventListener(
    "click",
    carregarVoos
);

carregarVoos();

async function carregarVoos(){

    const{

        data,

        error

    }=await supabaseClient

        .from("baggages")

        .select("*")

        .eq(
            "status",
            "LOADING"
        )

        .order(
            "flight_number"
        );

    if(error){

        console.error(error);

        return;

    }

    renderizarVoos(data);

}

function renderizarVoos(bagagens){

    voosDiv.innerHTML="";

    if(bagagens.length===0){

        voosDiv.innerHTML=`

        <div class="card bg-dark text-light">

            <div class="card-body">

                <h3>

                    Nenhum voo aguardando carregamento.

                </h3>

            </div>

        </div>

        `;

        return;

    }

    const grupos={};

    bagagens.forEach(bagagem=>{

        if(!grupos[bagagem.flight_number]){

            grupos[bagagem.flight_number]=[];

        }

        grupos[bagagem.flight_number].push(bagagem);

    });

    Object.keys(grupos).forEach(voo=>{

        const lista=grupos[voo];

        let pesoTotal=0;

        lista.forEach(b=>{

            pesoTotal+=Number(b.weight);

        });

        let html=`

        <div class="card bg-dark text-light mb-4">

            <div class="card-body">

                <h3>

                    ✈ Voo ${voo}

                </h3>

                <p>

                    Bagagens: ${lista.length}

                </p>

                <p>

                    Peso Total: ${pesoTotal.toFixed(1)} kg

                </p>

                <table class="table table-dark table-hover">

                    <thead>

                        <tr>

                            <th>TAG</th>

                            <th>PASSAGEIRO</th>

                            <th>PESO</th>

                            <th>STATUS</th>

                        </tr>

                    </thead>

                    <tbody>

        `;

        lista.forEach(bagagem=>{

            html+=`

                <tr>

                    <td>${bagagem.tag_number}</td>

                    <td>${bagagem.passenger_name}</td>

                    <td>${bagagem.weight} kg</td>

                    <td>${bagagem.status}</td>

                </tr>

            `;

        });

        html+=`

                    </tbody>

                </table>

                <button

                    class="btn btn-success"

                    onclick="embarcarVoo('${voo}')">

                    Finalizar Carregamento

                </button>

            </div>

        </div>

        `;

        voosDiv.innerHTML+=html;

    });

}

async function embarcarVoo(voo){

    if(!confirm(

        "Confirmar carregamento do voo "+voo+" ?"

    )){

        return;

    }

    const{

        error

    }=await supabaseClient

        .from("baggages")

        .update({

            status:"LOADED"

        })

        .eq(

            "flight_number",

            voo

        )

        .eq(

            "status",

            "LOADING"

        );

    if(error){

        console.error(error);

        alert("Erro ao finalizar.");

        return;

    }

    alert("Voo carregado com sucesso.");

    carregarVoos();

}

document
.getElementById("btnScanner")
.addEventListener(
"click",
escanearBagagem
);

async function escanearBagagem(){

    const tag=document
    .getElementById("scannerTag")
    .value
    .trim();

    if(tag==="") return;

    const{

        data,

        error

    }=await supabaseClient

    .from("baggages")

    .select("*")

    .eq("tag_number",tag)

    .eq("status","LOADING")

    .single();

    if(error||!data){

        alert("Bagagem não encontrada.");

        return;

    }

    await supabaseClient

    .from("baggages")

    .update({

        status:"LOADED"

    })

    .eq("id",data.id);

    await supabaseClient

    .from("loading_events")

    .insert({

        bag_id:data.id,

        tag_number:data.tag_number,

        flight_number:data.flight_number,

        operator:"OPERADOR"

    });

    carregarVoos();

    document
    .getElementById("scannerTag")
    .value="";

}