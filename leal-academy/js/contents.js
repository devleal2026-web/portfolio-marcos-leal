/*==========================================================
CONTENTS CATEGORIES
==========================================================*/

const LIMITE_CATEGORIAS = 12;

const categorias = [
    "ALCOHOL-2",
    "ART-3",
    "AUDIO-1",
    "BOOK-2",
    "COAT-1",
    "COMPUTER-2",
    "COSMETIC-1",
    "CURRENCY-3",
    "DRESS-1",
    "ELECTRIC-2",
    "FOOD-1",
    "FOOTWEAR-1",
    "GIFT-1",
    "HAIR-2",
    "HANDBAG-1",
    "HEADWEAR-2",
    "HOUSEHOLD-1",
    "INFANT-1",
    "JEWELLERY-1",
    "LINEN-1",
    "MECHANIC-3",
    "MEDICAL-1",
    "MUSIC-3",
    "NATURE-2",
    "OPTICS-3",
    "PAPERS-1",
    "PHOTO-1",
    "RELIGIOUS-3",
    "SHIRT-1",
    "SKIRT-1",
    "SLEEPWEAR-1",
    "SPORT-1",
    "SPORTSWEAR-1",
    "SUIT-1",
    "SWEATER-1",
    "TIMEPIECE-2",
    "TOBACCO-2",
    "TOOLS-3",
    "TOYS-2",
    "TROUSERS-1",
    "UNIFORM-3",
    "VIDEO-1",
    "WEAPON-3",
    "WEATHER-1"
];

let categoriasSelecionadas = [];

/*==========================================================
ABRIR
==========================================================*/

function abrirContents(){

    categoriasSelecionadas = [];

    gerarCategorias();

    atualizarContador();

    const modalEl = document.getElementById("modalContents");

    if(!modalEl){
        alert("Modal de Contents não encontrado.");
        return;
    }

    const modal = new bootstrap.Modal(modalEl);

    modal.show();

}

/*==========================================================
GERAR CATEGORIAS
==========================================================*/

function gerarCategorias(){

    const lista = document.getElementById("listaCategorias");

    if(!lista){
        alert("Lista de categorias não encontrada.");
        return;
    }

    lista.innerHTML = "";

    categorias.forEach((nome, index) => {

        const idCheck = "categoria_" + index;

        const coluna = document.createElement("div");

        coluna.className = "col-xl-3 col-lg-4 col-md-6 mb-3";

        coluna.innerHTML = `
            <div class="card h-100 shadow-sm">
                <div class="card-body">

                    <div class="form-check">

                        <input
                            type="checkbox"
                            id="${idCheck}"
                            class="form-check-input categoria"
                            value="${nome}">

                        <label
                            class="form-check-label fw-bold"
                            for="${idCheck}">
                            ${nome}
                        </label>

                    </div>

                    <input
                        type="text"
                        class="form-control descricao mt-3"
                        placeholder="Ex.: DICTIONARY, BK MALE SHOES"
                        disabled>

                </div>
            </div>
        `;

        const check = coluna.querySelector(".categoria");

        const descricao = coluna.querySelector(".descricao");

        check.addEventListener("change", function(){
            selecionarCategoria(this);
        });

        descricao.addEventListener("click", function(){

            if(!check.checked){
                check.checked = true;
                selecionarCategoria(check);
            }

        });

        lista.appendChild(coluna);

    });

}

/*==========================================================
SELEÇÃO
==========================================================*/

function selecionarCategoria(check){

    const card = check.closest(".card");

    const descricao = card.querySelector(".descricao");

    if(check.checked){

        if(categoriasSelecionadas.includes(check)){
            descricao.disabled = false;
            descricao.focus();
            return;
        }

        if(categoriasSelecionadas.length >= LIMITE_CATEGORIAS){

            check.checked = false;

            alert("Máximo de 12 categorias.");

            return;

        }

        categoriasSelecionadas.push(check);

        descricao.disabled = false;

        descricao.focus();

    }else{

        categoriasSelecionadas = categoriasSelecionadas.filter(
            item => item !== check
        );

        descricao.value = "";

        descricao.disabled = true;

    }

    atualizarContador();

}

/*==========================================================
CONTADOR
==========================================================*/

function atualizarContador(){

    const contador = document.getElementById("contadorCategorias");

    if(!contador){
        return;
    }

    contador.innerHTML =
        "Categorias selecionadas: <strong>" +
        categoriasSelecionadas.length +
        "</strong> / " +
        LIMITE_CATEGORIAS;

    if(categoriasSelecionadas.length >= LIMITE_CATEGORIAS){
        contador.className = "alert alert-warning";
    }else{
        contador.className = "alert alert-secondary";
    }

    bloquearCategorias();

}

/*==========================================================
BLOQUEAR
==========================================================*/

function bloquearCategorias(){

    const checks = document.querySelectorAll(".categoria");

    if(categoriasSelecionadas.length < LIMITE_CATEGORIAS){

        checks.forEach(c => c.disabled = false);

        return;

    }

    checks.forEach(check => {

        if(!check.checked){
            check.disabled = true;
        }

    });

}

/*==========================================================
APLICAR
==========================================================*/

function aplicarCategorias(){

    if(categoriasSelecionadas.length === 0){
        alert("Selecione pelo menos uma categoria.");
        return;
    }

    let linhas = [];

    for(const check of categoriasSelecionadas){

        const card = check.closest(".card");

        const descricaoInput = card.querySelector(".descricao");

        const descricao = descricaoInput.value.trim();

        if(descricao === ""){

            alert("Informe a descrição da categoria " + check.value);

            descricaoInput.focus();

            return;

        }

        linhas.push(check.value + "/" + descricao);

    }

    const campo = document.getElementById("cc");

    if(!campo){
        alert("Campo CC não encontrado.");
        return;
    }

    campo.value = linhas.join("\n");

    const modalEl = document.getElementById("modalContents");

    const modal = bootstrap.Modal.getInstance(modalEl);

    if(modal){
        modal.hide();
    }

}

/*==========================================================
EVENTOS
==========================================================*/

document.addEventListener("DOMContentLoaded", function(){

    const btnAplicar = document.getElementById("btnAplicarCategorias");

    if(btnAplicar){
        btnAplicar.addEventListener("click", aplicarCategorias);
    }

    window.abrirContents = abrirContents;

    window.aplicarCategorias = aplicarCategorias;

});

console.log("CONTENTS.JS CARREGADO");
