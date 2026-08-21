const menu = document.getElementById("manualMenu");
const cards = document.getElementById("manualCards");
const search = document.getElementById("manualSearch");

let categoriaAtual = "Todos";

function categoriasDisponiveis(){
    return ["Todos", ...new Set(manualWfsData.map(item => item.categoria))];
}

function criarMenu(){
    menu.innerHTML = "";

    categoriasDisponiveis().forEach(categoria => {
        const botao = document.createElement("button");

        botao.type = "button";
        botao.textContent = categoria;

        if(categoria === categoriaAtual){
            botao.classList.add("active");
        }

        botao.addEventListener("click", () => {
            categoriaAtual = categoria;
            criarMenu();
            renderizarCards();
        });

        menu.appendChild(botao);
    });
}

function normalizar(texto){
    return texto
        .toLowerCase()
        .normalize("NFD")
        .replace(/[\u0300-\u036f]/g, "");
}

function filtrarDados(){
    const termo = normalizar(search.value.trim());

    return manualWfsData.filter(item => {
        const dentroCategoria =
            categoriaAtual === "Todos" ||
            item.categoria === categoriaAtual;

        const textoBusca = normalizar([
            item.categoria,
            item.titulo,
            item.texto,
            item.pontos.join(" "),
            item.tags.join(" ")
        ].join(" "));

        const dentroBusca =
            termo === "" ||
            textoBusca.includes(termo);

        return dentroCategoria && dentroBusca;
    });
}

function renderizarCards(){
    const dados = filtrarDados();

    cards.innerHTML = "";

    if(dados.length === 0){
        cards.innerHTML = `
            <article class="manual-card">
                <h2>Nenhum resultado encontrado</h2>
                <p>Tente buscar por outro termo operacional.</p>
            </article>
        `;
        return;
    }

    dados.forEach(item => {
        const card = document.createElement("article");

        card.className = "manual-card";

        card.innerHTML = `
            <h2>${item.titulo}</h2>
            <p>${item.texto}</p>

            <ul>
                ${item.pontos.map(ponto => `<li>${ponto}</li>`).join("")}
            </ul>

            <div class="manual-tags">
                ${item.tags.map(tag => `<span class="manual-tag">${tag}</span>`).join("")}
            </div>
        `;

        cards.appendChild(card);
    });
}

search.addEventListener("input", renderizarCards);

criarMenu();
renderizarCards();