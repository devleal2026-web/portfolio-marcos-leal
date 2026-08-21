carregarDashboard()

atualizarRelogio()

setInterval(
    atualizarRelogio,
    1000
)

async function carregarDashboard(){

    const { data, error } =

    await supabaseClient

    .from('baggages')

    .select('*')

    if(error){

        console.error(error)

        return
    }

    preencherKPIs(data)

    preencherTabela(data)
}

function preencherKPIs(data){

    document.getElementById(
        'checkinCount'
    ).innerText =

    data.filter(
        b => b.status === 'CHECKIN'
    ).length

    document.getElementById(
        'bhsCount'
    ).innerText =

    data.filter(
        b => b.status === 'BHS'
    ).length

    document.getElementById(
        'makeupCount'
    ).innerText =

    data.filter(
        b => b.status === 'BHS'
    ).length

    document.getElementById(
        'loadingCount'
    ).innerText =

    data.filter(
        b => b.status === 'LOADING'
    ).length
}

function preencherTabela(data){

    const tbody =

    document.getElementById(
        'bagTable'
    )

    tbody.innerHTML = ''

    data.forEach(b => {

        tbody.innerHTML +=

        `
        <tr>

            <td>${b.tag_number}</td>

            <td>${b.flight_number}</td>

            <td>${b.destination_iata}</td>

            <td>${b.status}</td>

        </tr>
        `
    })
}

function atualizarRelogio(){

    document.getElementById(
        'clock'
    ).innerText =

    new Date()

    .toLocaleString(
        'pt-BR'
    )
}