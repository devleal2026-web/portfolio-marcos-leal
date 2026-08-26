insert into public.academy_courses (
    id,
    title,
    eyebrow,
    category,
    level,
    duration,
    color,
    summary,
    modules,
    labs,
    quiz,
    cover_path,
    material,
    sort_order
)
values (
    'chart-bagagem-iata',
    'Interpretação do Chart de Bagagem IATA',
    'Identificação visual',
    'bagagem',
    'Básico',
    '1h 20min',
    '#0284c7',
    'Leitura prática do Baggage Identification Chart: cores, tipo de volume, elementos descritivos, artigos diversos e aplicação correta em AHL, OHD e DPR.',
    '[
        {
            "title": "Para que serve o chart IATA",
            "type": "Aula",
            "duration": "10 min",
            "content": "O chart de bagagem ajuda o agente a transformar a aparência da mala em códigos padronizados. Essa padronização melhora o match entre AHL e OHD, reduz erro de descrição e facilita comunicação entre aeroportos."
        },
        {
            "title": "Cores da bagagem",
            "type": "Consulta guiada",
            "duration": "12 min",
            "content": "A primeira leitura é a cor predominante. A referência IATA atual apresenta códigos como BK para preto, BU para azul, RD para vermelho, WT para branco/transparente, GY para cinza/prata/alumínio, PU para roxo/violeta/lilás, YW para amarelo, BE para bege/creme/marfim, BN para marrom/tan/taupe/bronze/cobre, GN para verde/oliva/jade, MC para duas ou mais cores sólidas e PC para estampa ou padrão."
        },
        {
            "title": "Tipo do volume",
            "type": "Prática guiada",
            "duration": "16 min",
            "content": "Depois da cor, o agente escolhe o tipo visual do volume. A parte superior do chart mostra luggage/bags, com exemplos de malas rígidas, malas flexíveis, mochilas, sacolas, bolsas, caixas e formatos especiais. A escolha deve representar o formato real mais próximo, não a marca ou o conteúdo."
        },
        {
            "title": "Elementos descritivos",
            "type": "Aula prática",
            "duration": "14 min",
            "content": "Os elementos descritivos complementam cor e tipo. Eles indicam características visíveis como alça, rodinhas, cadeado, etiqueta, zíper, cinta, bolso externo, dano aparente, material, formato ou outra característica que ajude a diferenciar volumes semelhantes."
        },
        {
            "title": "Artigos diversos",
            "type": "Consulta",
            "duration": "12 min",
            "content": "A segunda parte do chart reúne miscellaneous articles, usados quando o item não é uma mala tradicional. A imagem inclui exemplos como carrinho, cadeira, equipamento esportivo, instrumento, pacote, caixa, equipamento infantil, itens dobráveis, objetos volumosos e outros artigos especiais."
        },
        {
            "title": "Montagem do código no atendimento",
            "type": "Simulação",
            "duration": "16 min",
            "content": "No WorldTracer, a descrição deve ser objetiva: identificar cor, tipo e elementos visíveis; registrar conteúdo em inglês quando aplicável; evitar termos genéricos; e revisar se a escolha ajudaria outro aeroporto a reconhecer a mesma bagagem."
        }
    ]'::jsonb,
    '[
        {"label": "Laboratório AHL Web", "href": "ahl.html"},
        {"label": "Laboratório OHD Web", "href": "ohd.html"},
        {"label": "Máscara AHL WorldTracer", "href": "worldtracer/ahl.html"},
        {"label": "Máscara OHD WorldTracer", "href": "worldtracer/ohd.html"}
    ]'::jsonb,
    '[
        {
            "question": "Qual é o objetivo principal do Baggage Identification Chart?",
            "options": ["Padronizar a descrição visual da bagagem para facilitar identificação e match", "Substituir a etiqueta da bagagem", "Definir indenização ao passageiro", "Informar peso permitido no voo"],
            "correct": 0
        },
        {
            "question": "Na leitura do chart, a cor deve representar:",
            "options": ["A cor predominante da bagagem", "A cor preferida do passageiro", "A cor da etiqueta", "A cor do uniforme do agente"],
            "correct": 0
        },
        {
            "question": "O código BK representa normalmente:",
            "options": ["Preto", "Azul", "Bege", "Marrom"],
            "correct": 0
        },
        {
            "question": "O código RD representa:",
            "options": ["Vermelho", "Roxo", "Cinza", "Verde"],
            "correct": 0
        },
        {
            "question": "O código MC deve ser usado quando a bagagem é:",
            "options": ["Multicolorida", "Metálica obrigatoriamente", "Muito comum", "Sem identificação"],
            "correct": 0
        },
        {
            "question": "Depois de identificar a cor, o agente deve escolher:",
            "options": ["O tipo visual do volume mais parecido com a bagagem", "O preço da bagagem", "A companhia que fabricou a mala", "O nome do passageiro"],
            "correct": 0
        },
        {
            "question": "A escolha do tipo da bagagem deve considerar principalmente:",
            "options": ["Formato e aparência externa", "Conteúdo declarado", "Valor estimado", "Destino do passageiro"],
            "correct": 0
        },
        {
            "question": "Elementos descritivos servem para:",
            "options": ["Diferenciar volumes parecidos por características visíveis", "Apagar a necessidade da cor", "Substituir o número da etiqueta", "Criar categoria de conteúdo"],
            "correct": 0
        },
        {
            "question": "Exemplo de elemento descritivo útil é:",
            "options": ["Rodinhas, alça, bolso externo, cinta ou zíper aparente", "Nome do agente", "Horário do almoço", "Número do balcão"],
            "correct": 0
        },
        {
            "question": "Miscellaneous articles são usados para:",
            "options": ["Itens que não se encaixam como mala tradicional", "Apenas malas pretas", "Somente bagagem extraviada internacional", "Excluir o registro do WorldTracer"],
            "correct": 0
        },
        {
            "question": "Ao registrar AHL ou OHD, uma descrição boa deve ser:",
            "options": ["Objetiva, padronizada e útil para outro aeroporto reconhecer o volume", "Longa, subjetiva e sem códigos", "Baseada apenas no conteúdo", "Feita em português sempre que possível"],
            "correct": 0
        },
        {
            "question": "Se houver dúvida entre dois tipos de mala no chart, o agente deve:",
            "options": ["Escolher o formato visual mais próximo e complementar com elementos descritivos", "Escolher qualquer código", "Deixar o campo em branco", "Usar sempre o primeiro tipo da lista"],
            "correct": 0
        },
        {
            "question": "O chart contribui diretamente para:",
            "options": ["Melhor qualidade de match entre bagagem extraviada e bagagem sobrante", "Aumentar o peso permitido", "Emitir cartão de embarque", "Alterar a rota do passageiro"],
            "correct": 0
        },
        {
            "question": "Qual erro deve ser evitado ao usar o chart?",
            "options": ["Descrever de forma genérica, como mala comum, sem cor/tipo/característica", "Comparar a bagagem com o chart", "Usar característica visível", "Confirmar a cor predominante"],
            "correct": 0
        },
        {
            "question": "A regra prática para montar uma boa identificação é:",
            "options": ["Cor predominante + tipo visual + elementos descritivos relevantes", "Nome do passageiro + preço + marca", "Destino + telefone + assento", "Peso + horário + balcão"],
            "correct": 0
        }
    ]'::jsonb,
    '',
    'Curso de interpretação do chart de bagagem IATA

Objetivo
Ensinar o aluno a ler o Baggage Identification Chart de forma prática, conectando cor, tipo, elementos descritivos e artigos diversos ao preenchimento correto de AHL, OHD e DPR.

Informações extraídas da imagem
- O chart separa a identificação em cores, tipos de bagagem, elementos descritivos e miscellaneous articles.
- As cores aparecem em códigos de duas letras. A referência IATA atual inclui BK preto, BU azul, RD vermelho, WT branco/transparente, GY cinza/prata/alumínio, PU roxo/violeta/lilás, YW amarelo, BE bege/creme/marfim, BN marrom/tan/taupe/bronze/cobre, GN verde/oliva/jade, MC duas ou mais cores sólidas excluindo acabamento e PC print/pattern/floral/listrado/xadrez.
- A área de luggage/bags apresenta formatos de malas, bolsas, mochilas, sacolas, caixas e volumes especiais.
- A área de descriptive elements complementa o tipo com detalhes visíveis.
- A área de miscellaneous articles serve para itens que não parecem mala tradicional.

Referências oficiais consultadas
- IATA Resources & Support: Baggage ID Chart.
- IATA AIDM Bag Color Code: codelist de cores da Resolução 743b.
- IATA AIDM Baggage Type Code: referência aos códigos descritivos da Resolução 743b.

Método de leitura
1. Confirmar se o item é bagagem tradicional ou artigo diverso.
2. Identificar a cor predominante.
3. Escolher o tipo visual mais próximo.
4. Complementar com elementos visíveis relevantes.
5. Registrar conteúdo em inglês quando aplicável.
6. Revisar se outro aeroporto conseguiria reconhecer o volume pela descrição.

Exemplo de boa descrição
BLACK HARD CASE, FOUR WHEELS, RED STRAP.

Mensagem principal
O chart deve transformar observação em padrão. A descrição correta melhora match, reduz retrabalho e aumenta a qualidade do atendimento.',
    245
)
on conflict (id)
do update set
    title = excluded.title,
    eyebrow = excluded.eyebrow,
    category = excluded.category,
    level = excluded.level,
    duration = excluded.duration,
    color = excluded.color,
    summary = excluded.summary,
    modules = excluded.modules,
    labs = excluded.labs,
    quiz = excluded.quiz,
    cover_path = excluded.cover_path,
    material = excluded.material,
    sort_order = excluded.sort_order;
