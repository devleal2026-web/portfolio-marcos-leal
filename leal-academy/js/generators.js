function gerarEtiqueta() {

    const cia = [

        'LA',
        'G3',
        'AD'

    ]

    const codigo =

        cia[
            Math.floor(
                Math.random() *
                cia.length
            )
        ]

    const voo =

        Math.floor(
            Math.random() * 9000
        ) + 1000

    const numero =

        Math.floor(
            Math.random() * 999999
        )
        .toString()
        .padStart(6, '0')

    return `${codigo}${voo}/${numero}/01`
}

function gerarPassageiro() {

    const nomes = [

        'Carlos Silva',
        'Ana Souza',
        'João Pereira',
        'Marcos Leal',
        'Fernanda Costa',
        'Pedro Santos',
        'Maria Oliveira'
    ]

    return nomes[
        Math.floor(
            Math.random() *
            nomes.length
        )
    ]
}

function gerarDestino(){

    const destinos = [

        'GRU',
        'CGH',
        'GIG',
        'BSB',
        'CNF',
        'SSA',
        'POA',
        'REC',
        'MIA',
        'MAD',
        'LIS',
        'JFK'

    ]

    return destinos[
        Math.floor(
            Math.random() *
            destinos.length
        )
    ]
}

function gerarPNR(){

    const letras = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

    let pnr = ''

    for(let i=0;i<3;i++){

        pnr += letras[
            Math.floor(
                Math.random()*26
            )
        ]
    }

    for(let i=0;i<3;i++){

        pnr += Math.floor(
            Math.random()*10
        )
    }

    return pnr
}
function gerarTagLatam(){

    const serial =

    Math.floor(
        100000 +
        Math.random()*900000
    )

    return {

        companhia:'LA',

        iata:'957',

        serial:serial
            .toString()

    }
}

function gerarPeso() {

    return Number(

        (
            Math.random() * 25 + 5

        ).toFixed(1)

    )
}


function gerarItinerario(){

    const aeroportos = [

        'BSB',
        'CNF',
        'REC',
        'SSA',
        'POA',
        'GIG',
        'MIA',
        'JFK',
        'MAD',
        'LIS'

    ]

    const origem = 'GRU'

    const totalSegmentos =
    Math.floor(Math.random() * 5) + 1

    let pontos = [origem]

    while(

        pontos.length <

        totalSegmentos + 1

    ){

        const aeroporto =

        aeroportos[
            Math.floor(
                Math.random() *
                aeroportos.length
            )
        ]

        if(

            !pontos.includes(
                aeroporto
            )

        ){

            pontos.push(
                aeroporto
            )
        }
    }

    return pontos
}