const voosDiv =

document.getElementById(
    'voos'
)

document

.getElementById(
    'btnAtualizar'
)

.addEventListener(

    'click',

    carregarVoos

)

carregarVoos()

async function carregarVoos() {

    const {

        data,

        error

    } = await supabaseClient

        .from('baggages')

        .select('*')

        .eq(
            'status',
            'MAKEUP'
        )

    if (error) {

        console.error(error)

        return
    }

    renderizarVoos(data)
}

function renderizarVoos(

    bagagens

) {

    voosDiv.innerHTML = ''

    const grupos = {}

    bagagens.forEach(

        bagagem => {

            if (

                !grupos[
                    bagagem.flight_number
                ]

            ) {

                grupos[
                    bagagem.flight_number
                ] = []
            }

            grupos[
                bagagem.flight_number
            ]

            .push(bagagem)
        }
    )

    Object.keys(grupos)

    .forEach(

        voo => {

            const lista =

            grupos[voo]

            let html =

            `
            <div class="card">

                <h2>

                    Voo ${voo}

                </h2>

                <p>

                    Total:
                    ${lista.length}

                </p>
            `

            lista.forEach(

                bagagem => {

                    html +=

                    `
                    <p>

                        ${bagagem.tag_number}

                    </p>
                    `
                }
            )

            html +=

            `
                <button
                onclick="
                enviarLoading(
                '${voo}'
                )">

                    ENVIAR PARA LOADING

                </button>

            </div>
            `

            voosDiv.innerHTML +=
            html
        }
    )
}

async function enviarLoading(

    voo

) {

    const {

        error

    } = await supabaseClient

        .from('baggages')

        .update({

            status:
            'LOADING'

        })

        .eq(
            'flight_number',
            voo
        )

        .eq(
            'status',
            'MAKEUP'
        )

    if (error) {

        console.error(error)

        return
    }

    carregarVoos()
}