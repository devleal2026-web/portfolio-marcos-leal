const fila =

document.getElementById(
    'filaCheckin'
)

const painel =

document.getElementById(
    'bagagemSelecionada'
)

document

.getElementById(
    'btnPesquisar'
)

.addEventListener(

    'click',

    pesquisarTag
)

carregarFila()

async function carregarFila(){

    const {

        data,

        error

    } = await supabaseClient

    .from('baggages')

    .select('*')

    .eq(
        'status',
        'CHECKIN'
    )

    if(error){

        console.error(error)

        return
    }

    fila.innerHTML=''

    data.forEach(

        bag=>{

            fila.innerHTML +=

            `
            <tr
            style="cursor:pointer"

            onclick="mostrarBagagemSelecionada(
            '${bag.id}'
            )">

                <td>${bag.tag_number}</td>

                <td>

                ${
                    bag.flight_display ||

                    bag.flight_number
                }

                </td>

                <td>${bag.destination_iata}</td>

                <td>${bag.weight}</td>

            </tr>
            `
        }
    )
}

async function pesquisarTag(){

    const pesquisa =

    document
    .getElementById('tagInput')
    .value
    .trim()
    .toUpperCase()

    if(!pesquisa){

        alert('Informe uma etiqueta')

        return
    }

    let query = supabaseClient
    .from('baggages')
    .select('*')

    if(pesquisa.startsWith('LA')){

        query = query.eq(
            'tag_number',
            pesquisa
        )

    }else if(pesquisa.length === 9){

        const serial =

        pesquisa.substring(3)

        query = query.eq(
            'tag_serial',
            serial
        )

    }else{

        query = query.eq(
            'tag_serial',
            pesquisa
        )
    }

    const {

        data,

        error

    } = await query.single()

    if(error){

        alert(
            'Bagagem não encontrada'
        )

        return
    }

    mostrarBagagem(data)
}

function mostrarBagagem(

    bag

){

    painel.innerHTML =

    `
    <div class="card bg-dark text-light mb-4">

        <div class="card-body">

            <h3>

                ${bag.tag_number}

            </h3>

            <p>

                Passageiro:
                ${bag.passenger_name}

            </p>

            <p>

                Voo:
                ${bag.flight_number}

            </p>

            <p>

                Destino:
                ${bag.destination_iata}

            </p>

            <button
            class="btn btn-success"

            onclick="
            moverBagagem(
            '${bag.id}',
            'MAKEUP'
            )">

                MAKEUP

            </button>

            <button
            class="btn btn-warning"

            onclick="
            moverBagagem(
            '${bag.id}',
            'CONNECTION'
            )">

                CONNECTION

            <button


            <button
            class="btn btn-secondary"

            onclick="voltarFila()">

            Voltar

            </button>

        </div>

    </div>
    `
}

async function moverBagagem(

    id,

    novoStatus

){

    const {

        data

    } = await supabaseClient

    .from('baggages')

    .select('*')

    .eq(
        'id',
        id
    )

    .single()

    await supabaseClient

    .from('baggages')

    .update({

        status:
        novoStatus

    })

    .eq(
        'id',
        id
    )

    await supabaseClient

    .from('baggage_history')

    .insert([{

        baggage_id:
        id,

        old_status:
        data.status,

        new_status:
        novoStatus

    }])

    painel.innerHTML=''

    carregarFila()

    alert(
        'Bagagem movimentada'
    )
}

async function mostrarBagagemSelecionada(

    id

){

    const {

        data,

        error

    } = await supabaseClient

    .from('baggages')

    .select('*')

    .eq(
        'id',
        id
    )

    .single()

    if(error){

        console.error(error)

        return
    }

    mostrarBagagem(data)
}

function voltarFila(){

    painel.innerHTML=''

    document.querySelector(
    '.fila-container'
    ).style.display='block'

    document
    .getElementById('tagInput')
    .value=''

}