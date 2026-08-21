const btnNovaBagagem =
document.getElementById(
    'btnNovaBagagem'
)

btnNovaBagagem.addEventListener(
    'click',
    gerarBagagem
)

carregarBagagens()

// =======================
// GERA NOVA BAGAGEM
// =======================

async function gerarBagagem(){

    const tag = gerarTagCompanhia()

    const itinerario =

    gerarItinerario()

    const voos = []

    for (let i = 0; i < itinerario.length - 1; i++) {
        voos.push(gerarVoo())
    }

    const rotaCompleta =

    itinerario.join('/')

    const destinoFinal =

    itinerario[
        itinerario.length - 1
    ]

    const tipo =

    itinerario.length > 2

    ? 'CONNECTION'

    : 'LOCAL'

    const bagagem = {

        tag_number:
        `${tag.companhia}${tag.serial}`,

        tag_airline:
        tag.companhia,

        tag_iata:
        tag.iata,

        tag_serial:
        tag.serial,

        passenger_name:
        gerarPassageiro(),

        pnr:
        gerarPNR(),

        flight_number: voos.map(v => v.numero).join('/'),

        flight_date: voos[0].data,

        flight_display: voos
            .map(v => `${v.numero}/${v.data}`)
            .join(' / '),

        origin_iata:
        itinerario[0],

        destination_iata:
        destinoFinal,

        route:
        rotaCompleta,

        weight:
        gerarPeso(),

        priority_baggage:
        false,

        connection_baggage:
        itinerario.length > 2,

        baggage_type:
        tipo,

        status:
        'CHECKIN',

        last_station:
        'GRU-CHECKIN'
    }

    // =======================
    // VERIFICA DUPLICIDADE
    // =======================

    const {

        data: existente

    } = await supabaseClient

    .from('baggages')

    .select('id')

    .eq(
        'tag_number',
        bagagem.tag_number
    )

    .maybeSingle()

    if(existente){

        alert(
            'Etiqueta duplicada detectada'
        )

        return
    }

    if(

        !destinoFinal ||

        !rotaCompleta ||

        rotaCompleta === 'GRU'

    ){

        console.error(
            'Rota inválida:',
            rota
        )

        return
    }

    // =======================
    // INSERT
    // =======================

    const {

        data,

        error

    } = await supabaseClient

    .from('baggages')

    .insert([

        bagagem

    ])

    .select()

    if(error){

        console.error(error)

        alert(

            'Erro: ' +

            error.message

        )

        return
    }

    const novaBagagem = data[0]

    const segmentos = []

    for(

        let i = 0;

        i < itinerario.length - 1;

        i++

    ){

        const vooSegmento = voos[i]

        segmentos.push({

            baggage_id:
            novaBagagem.id,

            pnr:
            novaBagagem.pnr,

            segment_order:
            i + 1,

            airline_code:
            vooSegmento.numero.substring(
                0,
                2
            ),

            flight_number:
            vooSegmento.numero,

            flight_date:
            vooSegmento.data,

            flight_display:
            `${vooSegmento.numero}/${vooSegmento.data}`,

            origin_iata:
            itinerario[i],

            destination_iata:
            itinerario[i + 1]

        })
    }

    await supabaseClient

    .from(
        'itinerary_segments'
    )

    .insert(
        segmentos
    )

    carregarBagagens()
}

// =======================
// LISTA BAGAGENS
// =======================

async function carregarBagagens(){

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

    .order(
        'created_at',
        {
            ascending:false
        }
    )

    if(error){

        console.error(error)

        return
    }

    preencherTabela(data)

    preencherKPIs(data)
}

// =======================
// TABELA
// =======================

function preencherTabela(

    bagagens

){

    const tabela =

    document.getElementById(
        'listaBagagens'
    )

    tabela.innerHTML = ''

    bagagens.forEach(

        bag=>{

            tabela.innerHTML +=

            `
            <tr>

                <td>
                    ${bag.tag_number}
                </td>

                <td>${bag.passenger_name}</td>

                <td>${bag.pnr || '-'}</td>

                <td>${bag.flight_display || '-'}</td>

                <td>
                    ${bag.route}
                </td>

                <td>
                    ${bag.weight}
                </td>

                <td>
                    ${bag.status}
                </td>

            </tr>
            `
        }
    )
}

// =======================
// KPIs
// =======================

function preencherKPIs(

    bagagens

){

    document

    .getElementById(
        'totalCheckin'
    )

    .innerText =

    bagagens.length

    const voos =

    new Set(

        bagagens.map(

            b=>b.flight_display

        )

    )

    document

    .getElementById(
        'totalVoos'
    )

    .innerText =

    voos.size

    const pesoTotal =

    bagagens.reduce(

        (
            total,
            bag
        )=>

        total +
        Number(
            bag.weight
        ),

        0

    )

    document

    .getElementById(
        'totalPeso'
    )

    .innerText =

    pesoTotal.toFixed(1)
}

// =======================
// GERA VOO
// =======================

function gerarVoo(){

    const empresas = [

        'LA',
        'AD',
        'G3',
        'TP',
        'AA',
        'DL',
        'UX'
    ]

    const cia =

    empresas[
        Math.floor(
            Math.random() *
            empresas.length
        )
    ]

    const numero =

    Math.floor(
        1000 +
        Math.random() * 9000
    )

    const hoje =

    new Date()

    const meses = [

        'JAN','FEB','MAR',
        'APR','MAY','JUN',
        'JUL','AUG','SEP',
        'OCT','NOV','DEC'
    ]

    const dia =

    String(
        hoje.getDate()
    ).padStart(
        2,
        '0'
    )

    const data =

    `${dia}${meses[
        hoje.getMonth()
    ]}`

    return {

        numero:
        `${cia}${numero}`,

        data:
        data
    }
}

// =======================
// GERA ROTA
// =======================

function gerarRota(){

    const aeroportos = [

        'BSB',
        'GIG',
        'CNF',
        'SSA',
        'REC',
        'POA',
        'MIA',
        'MAD',
        'LIS',
        'JFK'

    ]

    const origem = 'GRU'

    let destino = aeroportos[
        Math.floor(
            Math.random() *
            aeroportos.length
        )
    ]

    while(destino === origem){

        destino = aeroportos[
            Math.floor(
                Math.random() *
                aeroportos.length
            )
        ]
    }

    const temConexao = Math.random() < 0.30

    if(temConexao){

        let conexao = aeroportos[
            Math.floor(
                Math.random() *
                aeroportos.length
            )
        ]

        while(
            conexao === origem ||
            conexao === destino
        ){

            conexao = aeroportos[
                Math.floor(
                    Math.random() *
                    aeroportos.length
                )
            ]
        }

        return {

            origem: origem,

            destino: destino,

            conexao: true,

            completa:
            `${origem}/${conexao}/${destino}`
        }
    }

    return {

        origem: origem,

        destino: destino,

        conexao: false,

        completa:
        `${origem}/${destino}`
    }
}
