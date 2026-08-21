const combo =

document.getElementById(
    'operador'
)

const btn =

document.getElementById(
    'btnEntrar'
)

carregarOperadores()

async function carregarOperadores(){

    const {

        data,

        error

    } = await supabaseClient

    .from('operators')

    .select('*')

    .order(
        'full_name'
    )

    if(error){

        console.error(error)

        return
    }

    data.forEach(

        op=>{

            combo.innerHTML +=

            `
            <option
            value="${op.id}">

            ${op.full_name}

            -
            ${op.role_name}

            </option>
            `
        }
    )
}

btn.addEventListener(

    'click',

    ()=>{

        const operador =

        combo.value

        if(!operador){

            alert(
                'Selecione um operador'
            )

            return
        }

        localStorage.setItem(

            'operatorId',

            operador

        )

        window.location.href =

        '../index.html'
    }

)