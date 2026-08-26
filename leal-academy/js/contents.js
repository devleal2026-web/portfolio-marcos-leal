/*==========================================================
CONTENTS CATEGORIES
==========================================================*/

const LIMITE_CATEGORIAS = 12;

let categorias = [];
let itensPorCategoria = {};
let categoriasSelecionadas = [];

/*==========================================================
ABRIR
==========================================================*/

async function abrirContents(){

    categoriasSelecionadas = [];

    const modalEl = document.getElementById("modalContents");

    if(!modalEl){
        alert("Modal de Contents não encontrado.");
        return;
    }

    const modal = new bootstrap.Modal(modalEl);

    modal.show();

    await carregarCategoriasSupabase();

    gerarCategorias();

    preencherCategoriasDoCampo();

    atualizarContador();

}

/*==========================================================
CARREGAR SUPABASE
==========================================================*/

async function carregarCategoriasSupabase(){

    const lista = document.getElementById("listaCategorias");

    if(lista){
        lista.innerHTML = '<div class="col-12"><div class="alert alert-secondary">Carregando categorias do Supabase...</div></div>';
    }

    if(typeof supabaseClient === "undefined" || !supabaseClient){
        categorias = [];
        itensPorCategoria = {};
        alert("Supabase indisponível. Não foi possível carregar as categorias de conteúdo.");
        return;
    }

    const { data, error } = await supabaseClient
        .from("content_category_items")
        .select("category_code,item_label,sort_order,is_active")
        .eq("is_active", true)
        .order("category_code", { ascending:true })
        .order("sort_order", { ascending:true })
        .order("item_label", { ascending:true });

    if(error){
        categorias = [];
        itensPorCategoria = {};
        alert(error.message);
        return;
    }

    const mapa = {};

    (data || []).forEach(row => {

        const categoria = String(row.category_code || "").trim().toUpperCase();
        const item = String(row.item_label || "").trim().toUpperCase();

        if(!categoria || !item){
            return;
        }

        if(!mapa[categoria]){
            mapa[categoria] = [];
        }

        if(!mapa[categoria].includes(item)){
            mapa[categoria].push(item);
        }

    });

    categorias = Object.keys(mapa).sort();
    itensPorCategoria = mapa;

    if(categorias.length === 0){
        alert("Nenhuma categoria de conteúdo ativa foi encontrada no Supabase.");
    }

}

function escaparHtml(valor){
    return String(valor ?? "")
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;")
        .replace(/"/g, "&quot;")
        .replace(/'/g, "&#039;");
}

/*==========================================================
CARREGAR CC EXISTENTE
==========================================================*/

function preencherCategoriasDoCampo(){

    const campo = document.getElementById("cc");

    if(!campo || campo.value.trim() === ""){
        return;
    }

    const linhas = campo.value
        .split(/\r?\n/)
        .map(linha => linha.trim())
        .filter(Boolean);

    linhas.forEach(linha => {

        const partes = linha.split("/");
        const categoria = partes.shift();
        const descricao = partes.join("/").trim();

        if(!categoria || !descricao){
            return;
        }

        const check = Array.from(document.querySelectorAll(".categoria"))
            .find(item => item.value === categoria.trim());

        if(!check || categoriasSelecionadas.length >= LIMITE_CATEGORIAS){
            return;
        }

        check.checked = true;
        selecionarCategoria(check);

        const card = check.closest(".card");
        const descricaoInput = card.querySelector(".descricao");

        descricaoInput.value = descricao;

    });

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

    if(categorias.length === 0){
        lista.innerHTML = '<div class="col-12"><div class="alert alert-warning">Nenhuma categoria disponível no Supabase.</div></div>';
        return;
    }

    categorias.forEach((nome, index) => {

        const idCheck = "categoria_" + index;

        const coluna = document.createElement("div");

        coluna.className = "col-6 col-lg-4 col-xl-3 mb-2 mb-md-3";

        const idLista = "itens_" + index;
        const sugestoes = itensPorCategoria[nome] || [];
        const opcoes = sugestoes
            .map(item => `<option value="${escaparHtml(item)}">${escaparHtml(item)}</option>`)
            .join("");

        coluna.innerHTML = `
            <div class="card h-100 shadow-sm contents-category-card">
                <div class="card-body p-2 p-md-3">

                    <div class="form-check">

                        <input
                            type="checkbox"
                            id="${idCheck}"
                            class="form-check-input categoria"
                            value="${escaparHtml(nome)}">

                        <label
                            class="form-check-label fw-bold small"
                            for="${idCheck}">
                            ${escaparHtml(nome)}
                        </label>

                    </div>

                    <input
                        type="text"
                        class="form-control form-control-sm descricao mt-2 mt-md-3"
                        list="${idLista}"
                        placeholder="Selecione ou digite o item"
                        disabled>

                    <datalist id="${idLista}">
                        ${opcoes}
                    </datalist>

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
