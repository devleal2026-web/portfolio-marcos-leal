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

const itensPorCategoria = {
    "ALCOHOL-2": ["BEER", "BRANDY", "CACHAÇA", "CHAMPAGNE", "LIQUOR", "VODKA", "WHISKY", "WINE"],
    "ART-3": ["ARTWORK", "CRAFT", "DRAWING", "FRAME", "PAINTING", "SCULPTURE", "SOUVENIR"],
    "AUDIO-1": ["EARPHONES", "HEADSET", "MICROPHONE", "RADIO", "SPEAKER", "SOUND BOX"],
    "BOOK-2": ["AGENDA", "BOOK", "DIARY", "MAGAZINE", "MANUAL", "NOTEBOOK", "PRINTED MATERIAL"],
    "COAT-1": ["BLAZER", "COAT", "HOODIE", "JACKET", "RAINCOAT", "VEST"],
    "COMPUTER-2": ["CHARGER", "EXTERNAL HD", "KEYBOARD", "LAPTOP", "MOUSE", "PENDRIVE", "TABLET"],
    "COSMETIC-1": ["CREAM", "DEODORANT", "MAKEUP", "PERFUME", "SHAMPOO", "TOOTHBRUSH"],
    "CURRENCY-3": ["BANK CARD", "CASH", "CHECK", "COINS", "FOREIGN CURRENCY", "PREPAID CARD"],
    "DRESS-1": ["BLOUSE", "DRESS", "PANTS", "SHIRT", "SKIRT", "T-SHIRT", "UNDERWEAR"],
    "ELECTRIC-2": ["ADAPTER", "CABLE", "CHARGER", "ELECTRIC SHAVER", "HAIR DRYER", "IRON"],
    "FOOD-1": ["BISCUIT", "CANDY", "CHOCOLATE", "COFFEE", "FOOD CAN", "SNACK", "SUPPLEMENT"],
    "FOOTWEAR-1": ["BOOTS", "FLIP FLOPS", "SANDALS", "SHOES", "SLIPPERS", "SNEAKERS"],
    "GIFT-1": ["DECORATIVE ITEM", "GIFT BOX", "PACKED GIFT", "SOUVENIR", "TOY"],
    "HAIR-2": ["COMB", "HAIR ACCESSORY", "HAIR BRUSH", "HAIR EXTENSION", "WIG"],
    "HANDBAG-1": ["BACKPACK", "HANDBAG", "NECESSAIRE", "POUCH", "PURSE", "WALLET"],
    "HEADWEAR-2": ["CAP", "HAT", "HELMET", "SCARF", "WOOL CAP"],
    "HOUSEHOLD-1": ["CUP", "CUTLERY", "DECORATION", "HOUSEHOLD ITEM", "PAN", "UTENSIL"],
    "INFANT-1": ["BABY BOTTLE", "BABY CLOTHES", "DIAPER", "FOLDING STROLLER", "TOY"],
    "JEWELLERY-1": ["BRACELET", "EARRINGS", "JEWELLERY", "NECKLACE", "RING", "WATCH"],
    "LINEN-1": ["BLANKET", "PILLOW", "SHEET", "TOWEL"],
    "MECHANIC-3": ["BOLT", "MECHANICAL PART", "SCREW", "TECHNICAL EQUIPMENT", "TOOL", "WRENCH"],
    "MEDICAL-1": ["CONTACT LENS", "EYEGLASSES", "MEDICAL DEVICE", "MEDICINE", "PRESCRIPTION"],
    "MUSIC-3": ["FLUTE", "GUITAR", "INSTRUMENT", "KEYBOARD", "MUSIC ACCESSORY", "SHEET MUSIC"],
    "NATURE-2": ["FLOWER", "NATURAL ITEM", "PLANT", "SEEDS", "SHELL", "STONE"],
    "OPTICS-3": ["CONTACT LENS", "EYEGLASSES", "LENS CASE", "SUNGLASSES"],
    "PAPERS-1": ["BOARDING PASS", "CERTIFICATE", "CONTRACT", "DOCUMENT", "PAPERS", "RECEIPT"],
    "PHOTO-1": ["CAMERA", "LENS", "MEMORY CARD", "PHOTO", "PHOTO ALBUM", "TRIPOD"],
    "RELIGIOUS-3": ["BIBLE", "MEDAL", "PRAYER BOOK", "RELIGIOUS ARTICLE", "ROSARY"],
    "SHIRT-1": ["BLOUSE", "POLO SHIRT", "SHIRT", "T-SHIRT"],
    "SKIRT-1": ["LONG SKIRT", "SHORT SKIRT", "SKIRT"],
    "SLEEPWEAR-1": ["PAJAMAS", "ROBE", "SLEEPWEAR"],
    "SPORT-1": ["BALL", "BIKE HELMET", "RACKET", "SPORT EQUIPMENT", "SPORTS ACCESSORY"],
    "SPORTSWEAR-1": ["GYM CLOTHES", "LEGGINGS", "SHORTS", "SPORTS SHIRT", "TRACKSUIT"],
    "SUIT-1": ["BLAZER", "FORMAL SUIT", "SUIT", "TIE"],
    "SWEATER-1": ["CARDIGAN", "HOODIE", "SWEATER", "WOOL SWEATER"],
    "TIMEPIECE-2": ["CLOCK", "SMARTWATCH", "WATCH"],
    "TOBACCO-2": ["CIGAR", "CIGARETTE", "E-CIGARETTE", "LIGHTER", "TOBACCO"],
    "TOOLS-3": ["DRILL", "HAMMER", "PLIERS", "SCREWDRIVER", "TOOL KIT", "WRENCH"],
    "TOYS-2": ["DOLL", "GAME", "PUZZLE", "TEDDY BEAR", "TOY"],
    "TROUSERS-1": ["JEANS", "PANTS", "SHORTS", "TROUSERS"],
    "UNIFORM-3": ["BADGE", "CAP", "SHIRT", "UNIFORM", "VEST"],
    "VIDEO-1": ["ACTION CAMERA", "CAMERA", "DVD", "MEMORY CARD", "VIDEO EQUIPMENT"],
    "WEAPON-3": ["AMMUNITION", "FIREARM", "KNIFE", "SPORT WEAPON"],
    "WEATHER-1": ["GLOVES", "RAINCOAT", "SCARF", "UMBRELLA", "WINTER CLOTHES"]
};

let categoriasSelecionadas = [];

/*==========================================================
ABRIR
==========================================================*/

function abrirContents(){

    categoriasSelecionadas = [];

    gerarCategorias();

    preencherCategoriasDoCampo();

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
        const itemSugerido = card.querySelector(".item-sugerido");
        const opcaoExiste = Array.from(itemSugerido.options)
            .some(opcao => opcao.value === descricao);

        if(opcaoExiste){
            itemSugerido.value = descricao;
        }else{
            itemSugerido.value = "__OUTROS__";
        }

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

    categorias.forEach((nome, index) => {

        const idCheck = "categoria_" + index;

        const coluna = document.createElement("div");

        coluna.className = "col-6 col-lg-4 col-xl-3 mb-2 mb-md-3";

        const sugestoes = itensPorCategoria[nome] || [];
        const opcoes = sugestoes
            .map(item => `<option value="${item}">${item}</option>`)
            .join("");

        coluna.innerHTML = `
            <div class="card h-100 shadow-sm contents-category-card">
                <div class="card-body p-2 p-md-3">

                    <div class="form-check">

                        <input
                            type="checkbox"
                            id="${idCheck}"
                            class="form-check-input categoria"
                            value="${nome}">

                        <label
                            class="form-check-label fw-bold small"
                            for="${idCheck}">
                            ${nome}
                        </label>

                    </div>

                    <select
                        class="form-select form-select-sm item-sugerido mt-2"
                        disabled>
                        <option value="">Selecione um item</option>
                        ${opcoes}
                        <option value="__OUTROS__">OUTROS</option>
                    </select>

                    <input
                        type="text"
                        class="form-control form-control-sm descricao mt-2 mt-md-3"
                        placeholder="Digite ou ajuste o item"
                        disabled>

                </div>
            </div>
        `;

        const check = coluna.querySelector(".categoria");

        const descricao = coluna.querySelector(".descricao");
        const itemSugerido = coluna.querySelector(".item-sugerido");

        check.addEventListener("change", function(){
            selecionarCategoria(this);
        });

        itemSugerido.addEventListener("change", function(){

            if(!check.checked){
                check.checked = true;
                selecionarCategoria(check);
            }

            if(this.value === "__OUTROS__"){
                descricao.value = "";
                descricao.disabled = false;
                descricao.focus();
                return;
            }

            descricao.value = this.value;
            descricao.disabled = false;

        });

        [itemSugerido, descricao].forEach(campo => campo.addEventListener("click", function(){

            if(!check.checked){
                check.checked = true;
                selecionarCategoria(check);
            }

        }));

        lista.appendChild(coluna);

    });

}

/*==========================================================
SELEÇÃO
==========================================================*/

function selecionarCategoria(check){

    const card = check.closest(".card");

    const descricao = card.querySelector(".descricao");
    const itemSugerido = card.querySelector(".item-sugerido");

    if(check.checked){

        if(categoriasSelecionadas.includes(check)){
            itemSugerido.disabled = false;
            descricao.disabled = false;
            if(descricao.value.trim() === ""){
                itemSugerido.focus();
            }else{
                descricao.focus();
            }
            return;
        }

        if(categoriasSelecionadas.length >= LIMITE_CATEGORIAS){

            check.checked = false;

            alert("Máximo de 12 categorias.");

            return;

        }

        categoriasSelecionadas.push(check);

        itemSugerido.disabled = false;
        descricao.disabled = false;

        itemSugerido.focus();

    }else{

        categoriasSelecionadas = categoriasSelecionadas.filter(
            item => item !== check
        );

        descricao.value = "";

        itemSugerido.value = "";
        itemSugerido.disabled = true;
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
