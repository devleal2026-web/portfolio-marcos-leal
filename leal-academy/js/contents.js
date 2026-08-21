/*==========================================================
CONTENTS CATEGORIES
==========================================================*/

const LIMITE_CATEGORIAS = 12;

const categorias = [
    "ALCOHOL",
    "ART",
    "AUDIO",
    "BOOK",
    "COAT",
    "COMPUTER",
    "COSMETIC",
    "CURRENCY",
    "DISHES",
    "DOCUMENT",
    "DRESS",
    "ELECTRIC",
    "FOOD",
    "FOOTWEAR",
    "FRAGILE",
    "GLASSES",
    "HANDICRAFT",
    "HAT",
    "JEWELRY",
    "KEY",
    "KITCHEN",
    "LINEN",
    "LIQUID",
    "MEDICAL",
    "MOBILE",
    "MUSIC",
    "OPTICAL",
    "PAPER",
    "PERSONAL",
    "PHOTO",
    "RELIGIOUS",
    "SHOES",
    "SPORT",
    "SUIT",
    "TOILETRIES",
    "TOOLS",
    "TOYS",
    "UMBRELLA",
    "VIDEO",
    "WATCH",
    "WEAPON",
    "WORK",
    "OTHER"
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

        coluna.className = "col-lg-4 col-md-6 mb-3";

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
                        placeholder="Ex.: WT TENNIS ADIDAS, BN SANDALS HAVAIANAS"
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