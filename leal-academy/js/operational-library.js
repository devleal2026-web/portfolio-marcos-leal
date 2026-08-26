const menu = document.getElementById("manualMenu");
const cards = document.getElementById("manualCards");
const search = document.getElementById("manualSearch");

let categoriaAtual = "Todos";

function categoriasDisponiveis(){
    return ["Todos", ...new Set(operationalLibraryData.map(item => item.categoria))];
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

    return operationalLibraryData.filter(item => {
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

        const imagem = item.imagem
            ? `
                <button
                    type="button"
                    class="manual-card-image"
                    data-manual-image="${item.imagem.src}"
                    data-manual-title="${item.imagem.titulo || item.titulo}">
                    <img src="${item.imagem.src}" alt="${item.imagem.titulo || item.titulo}">
                </button>
            `
            : "";

        card.innerHTML = `
            <h2>${item.titulo}</h2>
            <p>${item.texto}</p>

            ${imagem}

            <ul>
                ${item.pontos.map(ponto => `<li>${ponto}</li>`).join("")}
            </ul>

            <div class="manual-tags">
                ${item.tags.map(tag => `<span class="manual-tag">${tag}</span>`).join("")}
            </div>
        `;

        cards.appendChild(card);
    });

    document.querySelectorAll("[data-manual-image]").forEach(button => {
        button.addEventListener("click", () => {
            const old = document.getElementById("manualImagePreview");

            if(old){
                old.remove();
            }

            document.body.insertAdjacentHTML("beforeend", `
                <div class="manual-image-preview" id="manualImagePreview" role="dialog" aria-modal="true">
                    <div class="manual-image-dialog">
                        <div class="manual-image-header">
                            <strong>${button.dataset.manualTitle}</strong>
                            <button type="button" id="manualImageClose">Fechar</button>
                        </div>
                        <img src="${button.dataset.manualImage}" alt="${button.dataset.manualTitle}">
                    </div>
                </div>
            `);

            document.getElementById("manualImageClose")?.addEventListener("click", () => {
                document.getElementById("manualImagePreview")?.remove();
            });

            document.getElementById("manualImagePreview")?.addEventListener("click", event => {
                if(event.target.id === "manualImagePreview"){
                    event.currentTarget.remove();
                }
            });
        });
    });
}

search.addEventListener("input", renderizarCards);

criarMenu();
renderizarCards();
