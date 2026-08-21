async function salvarBagagem(

    bagagem

) {

    const {

        data,

        error

    } = await supabaseClient

        .from('baggages')

        .insert([

            bagagem

        ])

        .select()

    if (error) {

        console.error(error)

        return null
    }

    return data
}

async function listarBagagensCheckin() {

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

    if (error) {

        console.error(error)

        return []
    }

    return data
}