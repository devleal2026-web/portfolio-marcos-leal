/*==========================================================
CT SELECTOR
Airport Baggage Simulator
==========================================================*/

let listaCT = [];

async function iniciarCT() {

    const { data, error } = await supabaseClient
        .from("color_types")
        .select("*")
        .order("code");

    if (error) {

        console.error(error);

        return;

    }

    listaCT = data;

}

document.addEventListener("DOMContentLoaded", () => {

    iniciarCT();

    const botao = document.getElementById("btnSelecionarCT");

    if (botao) {

        botao.addEventListener("click", abrirCT);

    }

});

function abrirCT() {

    let texto = prompt(

        "Pesquisar Cor/Tipo\n\nExemplos:\nBLK\nRED\nSUITCASE\nBACKPACK"

    );

    if (!texto) return;

    texto = texto.toUpperCase();

    const resultados = listaCT.filter(item =>

        item.code.toUpperCase().includes(texto) ||

        item.description.toUpperCase().includes(texto)

    );

    if (resultados.length === 0) {

        alert("Nenhum CT encontrado.");

        return;

    }

    let lista = "";

    resultados.forEach((item, index) => {

        lista +=

            (index + 1) +

            " - " +

            item.code +

            " - " +

            item.description +

            "\n";

    });

    const escolha = prompt(

        lista +

        "\nDigite o número desejado:"

    );

    if (!escolha) return;

    const indice = parseInt(escolha) - 1;

    if (

        indice < 0 ||

        indice >= resultados.length

    ) {

        alert("Opção inválida.");

        return;

    }

    document.getElementById("ct").value =

        resultados[indice].code;

}