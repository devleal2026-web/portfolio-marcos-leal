const localAcademyCourses = Array.isArray(academyCourses)
    ? JSON.parse(JSON.stringify(academyCourses))
    : [];

function restoreLocalAcademyCourses(){
    if(!Array.isArray(academyCourses) || academyCourses.length > 0){
        return;
    }

    if(localAcademyCourses.length === 0){
        return;
    }

    academyCourses.splice(
        0,
        academyCourses.length,
        ...JSON.parse(JSON.stringify(localAcademyCourses))
    );
}
restoreLocalAcademyCourses();

const state = {
    selectedCourseId: (academyCourses[0] || {}).id || "",
    selectedModuleIndex: 0,
    quizAnswers: {},
    assessmentOpen: {},
    courseSearch: ""
};

const storageKey = "airportBaggageAcademyProgress";
const quizStorageKey = "airportBaggageAcademyQuiz";

const courseVisuals = {
    "fundamentos": { image: "linear-gradient(135deg, rgba(21,94,117,.92), rgba(15,23,42,.86)), url('https://images.unsplash.com/photo-1521791136064-7986c2920216?auto=format&fit=crop&w=900&q=80')", icon: "case" },
    "bagagem-extraviada": { image: "linear-gradient(135deg, rgba(16,185,129,.92), rgba(14,116,144,.88)), url('https://images.unsplash.com/photo-1436491865332-7a61a109cc05?auto=format&fit=crop&w=900&q=80')", icon: "case" },
    "objetos-esquecidos": { image: "linear-gradient(135deg, rgba(37,99,235,.9), rgba(8,145,178,.84)), url('https://images.unsplash.com/photo-1517404215738-15263e9f9178?auto=format&fit=crop&w=900&q=80')", icon: "tag" },
    "avsec": { image: "linear-gradient(135deg, rgba(30,64,175,.92), rgba(15,23,42,.86)), url('https://images.unsplash.com/photo-1556388158-158ea5ccacbd?auto=format&fit=crop&w=900&q=80')", icon: "shield" },
    "manuseio-bagagem": { image: "linear-gradient(135deg, rgba(249,115,22,.9), rgba(127,29,29,.82)), url('https://images.unsplash.com/photo-1529074963764-98f45c47344b?auto=format&fit=crop&w=900&q=80')", icon: "vest" },
    "ahl": { image: "linear-gradient(135deg, rgba(16,185,129,.92), rgba(14,116,144,.88)), url('https://images.unsplash.com/photo-1436491865332-7a61a109cc05?auto=format&fit=crop&w=900&q=80')", icon: "case" },
    "ohd": { image: "linear-gradient(135deg, rgba(14,165,233,.9), rgba(15,23,42,.86)), url('https://images.unsplash.com/photo-1553531889-e6cf4d692b1b?auto=format&fit=crop&w=900&q=80')", icon: "tag" },
    "matches": { image: "linear-gradient(135deg, rgba(6,95,70,.92), rgba(15,23,42,.86)), url('https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&w=900&q=80')", icon: "route" },
    "dpr": { image: "linear-gradient(135deg, rgba(245,158,11,.94), rgba(127,29,29,.86)), url('https://images.unsplash.com/photo-1565026057447-bc90a3dceb87?auto=format&fit=crop&w=900&q=80')", icon: "damage" },
    "worldtracer-completo": { image: "linear-gradient(135deg, rgba(37,99,235,.9), rgba(88,28,135,.84)), url('https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=900&q=80')", icon: "globe" },
    "atendimento-cliente-aviacao": { image: "linear-gradient(135deg, rgba(20,184,166,.9), rgba(21,94,117,.84)), url('https://images.unsplash.com/photo-1521791136064-7986c2920216?auto=format&fit=crop&w=900&q=80')", icon: "person" },
    "boas-praticas-atendimento": { image: "linear-gradient(135deg, rgba(34,197,94,.9), rgba(21,128,61,.84)), url('https://images.unsplash.com/photo-1552664730-d307ca884978?auto=format&fit=crop&w=900&q=80')", icon: "check" },
    "bagagem-violada": { image: "linear-gradient(135deg, rgba(220,38,38,.92), rgba(127,29,29,.86)), url('https://images.unsplash.com/photo-1499914485622-a88fac536970?auto=format&fit=crop&w=900&q=80')", icon: "lock" },
    "bagagem-danificada": { image: "linear-gradient(135deg, rgba(245,158,11,.94), rgba(194,65,12,.84)), url('https://images.unsplash.com/photo-1565026057447-bc90a3dceb87?auto=format&fit=crop&w=900&q=80')", icon: "damage" },
    "tratativa-rl-mct": { image: "linear-gradient(135deg, rgba(124,58,237,.9), rgba(49,46,129,.84)), url('https://images.unsplash.com/photo-1488646953014-85cb44e25828?auto=format&fit=crop&w=900&q=80')", icon: "route" },
    "bagagem-sem-etiqueta-ohd": { image: "linear-gradient(135deg, rgba(202,138,4,.92), rgba(113,63,18,.84)), url('https://images.unsplash.com/photo-1553531889-e6cf4d692b1b?auto=format&fit=crop&w=900&q=80')", icon: "tag" },
    "lideranca-bagagem-extraviada": { image: "linear-gradient(135deg, rgba(15,118,110,.92), rgba(12,74,110,.84)), url('https://images.unsplash.com/photo-1517048676732-d65bc937f952?auto=format&fit=crop&w=900&q=80')", icon: "leader" },
    "atendimento-pcd": { image: "linear-gradient(135deg, rgba(8,145,178,.92), rgba(30,64,175,.84)), url('https://images.unsplash.com/photo-1573497491208-6b1acb260507?auto=format&fit=crop&w=900&q=80')", icon: "access" },
    "interpretacao-etiqueta-bagagem": { image: "linear-gradient(135deg, rgba(15,118,110,.92), rgba(15,23,42,.86)), url('https://images.unsplash.com/photo-1569154941061-e231b4725ef1?auto=format&fit=crop&w=900&q=80')", icon: "barcode" },
    "gestao-pessoas-rampa": { image: "linear-gradient(135deg, rgba(15,118,110,.92), rgba(15,23,42,.86)), url('https://images.unsplash.com/photo-1517048676732-d65bc937f952?auto=format&fit=crop&w=900&q=80')", icon: "leader" }
};
const lessonMediaProfiles = {
    "fundamentos": [
        { kind:"service", labels:["Recepcao", "Clareza", "Postura", "Solucao"], caption:"Atendimento inicial com cordialidade, comunicacao clara e orientacao segura." },
        { kind:"service", labels:["PNAE", "Gestante", "Idoso", "Prioridade"], caption:"Reconhecimento de passageiros com prioridade e aplicacao de assistencias especiais." },
        { kind:"form", labels:["WCHR", "DEAF", "UMNR", "PETC"], caption:"Codigos AIRIMP ajudam a identificar necessidades especiais e servicos no atendimento." }
    ],
    "bagagem-extraviada": [
        { kind:"form", labels:["PIR", "AHL", "Etiqueta", "Registro"], caption:"A bagagem extraviada deve ser registrada no desembarque com dados corretos da etiqueta." },
        { kind:"service", labels:["Esteira", "Escuta", "Busca", "Prazo"], caption:"O atendimento no desembarque exige acolhimento, consulta operacional e orientacoes realistas." },
        { kind:"form", labels:["TN", "Contato", "Endereco", "RL/FS"], caption:"Campos obrigatorios garantem busca, contato com o passageiro e rastreabilidade do caso." },
        { kind:"route", labels:["Excecao", "Conexao", "Alfandega", "Tratativa"], caption:"Casos especiais exigem analise de rota, conexoes, restricoes e regra operacional aplicavel." },
        { kind:"flow", labels:["Chegada", "BDO", "Entrega", "Encerrar"], caption:"A entrega exige confirmacao, recibo, registro de voo/data e encerramento correto." }
    ],
    "objetos-esquecidos": [
        { kind:"found", labels:["Cabine", "Objeto", "RFP", "Guarda"], caption:"Objeto esquecido deve ser localizado, registrado, armazenado e controlado pelo Servico de Bagagem." },
        { kind:"form", labels:["Categoria", "Data", "Descricao", "RFP"], caption:"O registro pede categoria, data do encontro e descricao detalhada, preferencialmente em ingles." },
        { kind:"flow", labels:["Receber", "Armazenar", "Prazo", "Destino"], caption:"O controle evita perda de rastreabilidade durante guarda, retirada ou envio ao deposito." },
        { kind:"route", labels:["Origem", "Rush", "Destino", "AI02"], caption:"Transporte entre aeroportos deve usar caixa lacrada, etiqueta rush e dados de voo/data." },
        { kind:"service", labels:["Conferir", "Recibo", "CPF/RG", "Entrega"], caption:"A entrega ao proprietario exige identificacao, recibo assinado e baixa formal." }
    ],
    "avsec": [
        { kind:"security", labels:["Ameaca", "Area", "Pessoa", "Bagagem"], caption:"AVSEC protege aeronaves, aeroportos, pessoas e instalacoes contra interferencia ilicita." },
        { kind:"security", labels:["Identificar", "Isolar", "Acionar", "Registrar"], caption:"Bagagem suspeita requer isolamento da area e acionamento dos responsaveis de seguranca." },
        { kind:"security", labels:["Credencial", "Acesso", "Patio", "Controle"], caption:"Areas restritas so devem ser acessadas por pessoas autorizadas." },
        { kind:"form", labels:["ANAC", "RBAC", "ICAO", "Normas"], caption:"Normas e regulamentos orientam os procedimentos de seguranca aeroportuaria." },
        { kind:"flow", labels:["Prevenir", "Inspecionar", "Controlar", "Responder"], caption:"Prevencao combina controle de acesso, inspecao e resposta a eventos de risco." }
    ],
    "manuseio-bagagem": [
        { kind:"damage", labels:["Alca", "Roda", "Fecho", "Funcional"], caption:"Danos funcionais afetam o uso da mala e precisam de registro adequado." },
        { kind:"flow", labels:["Coletar", "Transportar", "Estivar", "Descarregar"], caption:"Toda equipe que interage com a bagagem influencia a integridade do volume." },
        { kind:"damage", labels:["Fragil", "Topo", "Peso", "Manta"], caption:"Estivagem segura distribui peso, protege itens frageis e evita atrito." },
        { kind:"security", labels:["Vazamento", "Separar", "Remover", "Registrar"], caption:"Bagagem contaminada deve ser separada e removida da area de carga." },
        { kind:"form", labels:["Limited", "Release", "Assinatura", "Protecao"], caption:"Limited Release registra dano pre-existente e reduz reclamacoes futuras." }
    ],
    "ahl": [
        { kind:"form", labels:["AHL", "TN", "NM", "Contato"], caption:"A mascara AHL organiza dados essenciais da bagagem extraviada e do passageiro." },
        { kind:"route", labels:["FD", "RT", "FS", "RL"], caption:"Rota, voo, fault station e motivo de perda orientam a tratativa operacional." },
        { kind:"flow", labels:["Salvar", "Buscar", "Atualizar", "Encerrar"], caption:"O fluxo AHL combina criacao, acompanhamento, historico e encerramento." }
    ],
    "ohd": [
        { kind:"form", labels:["OHD", "CT", "BI", "CC"], caption:"OHD registra bagagem sobrante com caracteristicas e conteudo detalhado." },
        { kind:"found", labels:["Esteira", "Sem dono", "OHD", "Guarda"], caption:"Bagagem nao retirada ou sem identificacao deve ser registrada e armazenada." },
        { kind:"route", labels:["ROH", "FOH", "Envio", "Destino"], caption:"Solicitacao e envio de OHD devem ficar registrados no historico." }
    ],
    "matches": [
        { kind:"match", labels:["AHL", "OHD", "50%+", "Alerta"], caption:"Matches com 50% ou mais indicam possivel relacao entre AHL e OHD." },
        { kind:"match", labels:["Tag", "Nome", "Rota", "Conteudo"], caption:"A tag tem maior peso, mas todos os campos ajudam na comparacao." },
        { kind:"flow", labels:["Analisar", "ROH", "FOH", "Historico"], caption:"O agente analisa o match e registra ROH/FOH quando houver acao operacional." }
    ],
    "dpr": [
        { kind:"damage", labels:["DPR", "Dano", "Local", "Extensao"], caption:"DPR registra dano ou violacao com elemento, localizacao e extensao." },
        { kind:"form", labels:["NM", "FD", "RT", "AG"], caption:"Campos obrigatorios conectam passageiro, voo, rota e agente responsavel." },
        { kind:"damage", labels:["TOP", "SIDE", "END", "BOTT"], caption:"Codigos de localizacao ajudam a descrever onde ocorreu a danificacao." }
    ],
    "worldtracer-completo": [
        { kind:"form", labels:["AHL", "OHD", "DPR", "RFP"], caption:"WorldTracer centraliza registros de extravio, sobrante, dano e objetos encontrados." },
        { kind:"tag", labels:["TN", "LPN", "Rota", "Status"], caption:"A rastreabilidade depende da leitura correta dos identificadores da bagagem." },
        { kind:"route", labels:["Origem", "Conexao", "Destino", "FWD"], caption:"Rotas e mensagens operacionais orientam a busca e o envio." },
        { kind:"match", labels:["AHL", "OHD", "Match", "Acao"], caption:"Comparacoes ajudam a localizar bagagens e acionar ROH/FOH." },
        { kind:"flow", labels:["Criar", "Atualizar", "Historico", "Fechar"], caption:"O ciclo do processo exige atualizacoes consistentes ate o encerramento." }
    ],
    "atendimento-cliente-aviacao": [
        { kind:"service", labels:["Jornada", "Escuta", "Empatia", "Solucao"], caption:"O objetivo e garantir uma experiencia satisfatoria em toda a jornada." },
        { kind:"service", labels:["Ouvir", "Acolher", "Orientar", "Resolver"], caption:"Comunicacao positiva combina cordialidade, foco em solucao e linguagem clara." },
        { kind:"service", labels:["Crise", "Calma", "Empatia", "Acao"], caption:"Passageiros em crise precisam de escuta ativa, postura calma e encaminhamento." },
        { kind:"service", labels:["Gestante", "Idoso", "PcD", "Apoio"], caption:"Atendimento inclusivo adapta a abordagem a necessidades especificas." },
        { kind:"flow", labels:["Feedback", "Registro", "Melhoria", "Padrao"], caption:"Feedbacks reforcam boas praticas e corrigem falhas do atendimento." }
    ],
    "boas-praticas-atendimento": [
        { kind:"service", labels:["Sorriso", "Clareza", "Respeito", "Agilidade"], caption:"Excelencia une postura profissional, empatia, eficiencia e agilidade." },
        { kind:"service", labels:["Perfil", "Demanda", "Apoio", "Seguranca"], caption:"Conhecer o perfil do cliente ajuda a adaptar o atendimento." },
        { kind:"service", labels:["Overbook", "Acolher", "Explicar", "Solucao"], caption:"Situacoes sensiveis pedem transparencia, acolhimento e busca de alternativas." },
        { kind:"form", labels:["ANAC", "IATA", "Padrao", "Registro"], caption:"Procedimentos reduzem risco operacional e aumentam seguranca juridica." },
        { kind:"flow", labels:["Atender", "Registrar", "Aprender", "Melhorar"], caption:"A melhoria continua nasce do uso correto de elogios, reclamacoes e feedbacks." }
    ],
    "bagagem-violada": [
        { kind:"damage", labels:["Lacre", "Foto", "PIR", "FF"], caption:"Violacao exige evidencias, registro no PIR e historico da tratativa." },
        { kind:"form", labels:["Prazo", "Nota", "Item", "Compensar"], caption:"Prazos, documentos e tipo de item definem a analise de compensacao." },
        { kind:"security", labels:["Valor", "Eletronico", "RL93", "Encerrar"], caption:"Objetos de valor e eletronicos seguem regra especifica e registro adequado." },
        { kind:"flow", labels:["Contato", "Proposta", "Recusa", "Derivar"], caption:"A tratativa deve registrar contatos, propostas, recusas e encaminhamentos." }
    ],
    "bagagem-danificada": [
        { kind:"damage", labels:["Vistoria", "Foto", "Dano", "PIR"], caption:"Dano declarado no desembarque deve ser vistoriado e registrado imediatamente." },
        { kind:"damage", labels:["Elemento", "Local", "TD", "Codigo"], caption:"O campo TD descreve tipo, localizacao e extensao da danificacao." },
        { kind:"form", labels:["Documento", "Etiqueta", "Foto", "Analise"], caption:"Reclamacoes fora do aeroporto exigem documentos e evidencias." },
        { kind:"damage", labels:["Arranhao", "Rachadura", "Total", "Negativa"], caption:"A classificacao do dano orienta registro, compensacao ou negativa." },
        { kind:"route", labels:["Origem", "FS", "Direto", "Conexao"], caption:"Fault Station deve refletir a regra operacional do trecho." }
    ],
    "tratativa-rl-mct": [
        { kind:"route", labels:["MCT", "Conexao", "Tempo", "Risco"], caption:"MCT ajuda a avaliar risco de extravio em conexoes." },
        { kind:"form", labels:["RL51", "RL55", "RL56", "RL53"], caption:"Codigos RL classificam falhas de conexao, check-in, carregamento e entrega." },
        { kind:"route", labels:["DOM", "INTER", "Alfandega", "Trecho"], caption:"Tipos de conexao mudam a leitura operacional do caso." },
        { kind:"form", labels:["Etiqueta", "A/B/C", "Erro", "RL"], caption:"Falhas de etiquetagem exigem codigo RL coerente com a causa." },
        { kind:"flow", labels:["Analisar", "Justificar", "Registrar", "Encerrar"], caption:"A tratativa completa combina causa, evidencias, registros e decisao final." }
    ],
    "bagagem-sem-etiqueta-ohd": [
        { kind:"found", labels:["Sem tag", "Esteira", "OHD", "Guarda"], caption:"Bagagem sobrante sem identificacao deve ser registrada como OHD." },
        { kind:"form", labels:["CC", "Marca", "Cor", "Detalhes"], caption:"Conteudo e caracteristicas devem ser descritos de forma fiel e detalhada." },
        { kind:"match", labels:["AHL", "OHD", "Conteudo", "Match"], caption:"Dados do OHD podem gerar match com AHLs abertos." },
        { kind:"route", labels:["ROH", "FOH", "Rush", "Destino"], caption:"Envio de OHD depende de solicitacao ativa e mensagem operacional." },
        { kind:"flow", labels:["5o dia", "Deposito", "FLZ", "Baixa"], caption:"Bagagens nao reclamadas seguem fluxo de deposito conforme prazo." }
    ],
    "lideranca-bagagem-extraviada": [
        { kind:"service", labels:["Equipe", "Briefing", "Meta", "Foco"], caption:"Lideranca orienta a equipe para atendimento consistente em bagagem extraviada." },
        { kind:"flow", labels:["Fila", "Prioridade", "Distribuir", "Acompanhar"], caption:"Organizacao do fluxo reduz espera e melhora a experiencia do passageiro." },
        { kind:"form", labels:["Indicador", "PIR", "Tempo", "Pendencia"], caption:"Indicadores ajudam a monitorar desempenho e pendencias operacionais." },
        { kind:"service", labels:["Conflito", "Escuta", "Calma", "Solucao"], caption:"Situacoes criticas pedem comunicacao firme, empatica e orientada a solucao." },
        { kind:"route", labels:["Base", "Busca", "Contato", "Entrega"], caption:"Coordenacao entre bases acelera localizacao, envio e entrega da bagagem." },
        { kind:"flow", labels:["Treinar", "Auditar", "Corrigir", "Evoluir"], caption:"Lideranca sustenta melhoria continua com treinamento e acompanhamento." }
    ],
    "atendimento-pcd": [
        { kind:"service", labels:["Respeito", "Acesso", "Autonomia", "Apoio"], caption:"Atendimento inclusivo deve ser respeitoso, acessivel e eficiente." },
        { kind:"service", labels:["Perguntar", "Ouvir", "Ajudar", "Respeitar"], caption:"A ajuda deve ser oferecida, nao imposta, preservando autonomia." },
        { kind:"form", labels:["ANAC 280", "LBI", "Direito", "Registro"], caption:"Normas de acessibilidade orientam atendimento e responsabilidades." },
        { kind:"service", labels:["Libras", "Escrita", "Frente", "Clareza"], caption:"Passageiros surdos podem precisar de comunicacao visual, escrita ou Libras." },
        { kind:"flow", labels:["Recurso", "Embarque", "Apoio", "Seguranca"], caption:"Recursos como ambulift e apoio especializado garantem embarque seguro." }
    ],
    "interpretacao-etiqueta-bagagem": [
        { kind:"tag", labels:["Etiqueta", "Codigo", "LPN", "Destino"], caption:"A etiqueta conecta passageiro, bagagem, voo e destino no fluxo operacional." },
        { kind:"tag", labels:["LPN", "Unico", "Recibo", "Sistema"], caption:"LPN e codigo de barras permitem localizar a bagagem nos sistemas." },
        { kind:"match", labels:["LPN/TN", "Busca", "AHL", "OHD"], caption:"A rastreabilidade facilita buscas, matches e comprovacao de entrega." },
        { kind:"tag", labels:["GRU", "REC", "MIA", "IATA"], caption:"Codigos IATA identificam aeroportos de origem, conexao e destino." },
        { kind:"route", labels:["Destino", "Conexao", "Origem", "Leitura"], caption:"A leitura da rota deve considerar a ordem operacional da etiqueta." },
        { kind:"tag", labels:["Priority", "Rush", "Reprint", "Alerta"], caption:"Etiquetas especiais sinalizam prioridade, reenvio ou divergencia." },
        { kind:"flow", labels:["Check-in", "BHS", "Porao", "Esteira"], caption:"A etiqueta acompanha a bagagem em cada etapa do fluxo aeroportuario." },
        { kind:"form", labels:["Conferir", "Comparar", "Registrar", "Corrigir"], caption:"Boas praticas evitam erro de leitura, troca de mala e perda de rastreabilidade." }
    ],
    "gestao-pessoas-rampa": [
        { kind:"service", labels:["Briefing", "Escala", "Equipe", "Exemplo"], caption:"Lideranca presente organiza recursos, orienta prioridades e da exemplo na operacao." },
        { kind:"flow", labels:["Clareza", "Curto", "Confirma", "Feedback"], caption:"Comunicacao assertiva no patio usa mensagens objetivas, respeito e confirmacao." },
        { kind:"service", labels:["Mentor", "Padrao", "Corrigir", "Cultura"], caption:"Mentoria positiva evita que novos colaboradores copiem praticas inseguras." },
        { kind:"form", labels:["Treino", "Meta", "KPI", "Evoluir"], caption:"Desenvolvimento continuo transforma rotina, indicadores e falhas em aprendizado." },
        { kind:"security", labels:["Ouvir", "Entender", "Agir", "Seguro"], caption:"Conflitos bem mediados e reportes sem medo fortalecem seguranca psicologica." }
    ]
};
const courseIntroVideos = {};
const lessonScreenshots = {};
const msbCoursePages = {};
function readJson(key){
    try{
        return JSON.parse(localStorage.getItem(key)) || {};
    }catch{
        return {};
    }
}

function saveJson(key, value){
    localStorage.setItem(key, JSON.stringify(value));
}

function readProgress(){
    return readJson(storageKey);
}

function saveProgress(progress){
    saveJson(storageKey, progress);
}

function readQuizResults(){
    return readJson(quizStorageKey);
}

function saveQuizResults(results){
    saveJson(quizStorageKey, results);
}

function courseProgress(course){
    const modules = courseModules(course);
    if(modules.length === 0){
        return 0;
    }

    const progress = readProgress();
    const done = progress[course.id] || [];
    return Math.round((done.length / modules.length) * 100);
}

function normalizeSearch(value){
    return String(value || "")
        .normalize("NFD")
        .replace(/[\u0300-\u036f]/g, "")
        .toLowerCase()
        .trim();
}

function selectedCourse(){
    restoreLocalAcademyCourses();
    return academyCourses.find(course => course.id === state.selectedCourseId) || academyCourses[0] || null;
}


function stripEmoji(value){
    return String(value ?? "")
        .replace(/[\uD800-\uDBFF][\uDC00-\uDFFF]/g, "")
        .replace(/[\u2600-\u27BF]/g, "")
        .replace(/[\uFE0F]/g, "");
}
function escapeHtml(value){
    return String(value ?? "")
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;")
        .replace(/"/g, "&quot;")
        .replace(/'/g, "&#039;");
}

function courseVisual(course){
    const visual = courseVisuals[course.id] || {
        image: `linear-gradient(135deg, ${course.color}, #0f172a)`,
        icon: "case"
    };

    return visual;
}

function iconSvg(type){
    const icons = {
        case: '<svg viewBox="0 0 64 64"><rect x="14" y="20" width="36" height="32" rx="5"/><path d="M24 20v-5h16v5"/><path d="M24 28v18M40 28v18"/></svg>',
        tag: '<svg viewBox="0 0 64 64"><path d="M12 30 30 12h18l4 4v18L34 52z"/><circle cx="41" cy="23" r="4"/></svg>',
        shield: '<svg viewBox="0 0 64 64"><path d="M32 8 50 15v13c0 13-7 22-18 28C21 50 14 41 14 28V15z"/><path d="M24 31l6 6 12-14"/></svg>',
        vest: '<svg viewBox="0 0 64 64"><path d="M22 10h20l8 14v30H14V24z"/><path d="M32 10v44M17 35h30"/></svg>',
        globe: '<svg viewBox="0 0 64 64"><circle cx="32" cy="32" r="23"/><path d="M9 32h46M32 9c8 8 8 38 0 46M32 9c-8 8-8 38 0 46"/></svg>',
        person: '<svg viewBox="0 0 64 64"><circle cx="32" cy="19" r="9"/><path d="M16 54c2-13 10-20 16-20s14 7 16 20"/></svg>',
        check: '<svg viewBox="0 0 64 64"><circle cx="32" cy="32" r="23"/><path d="M20 33l8 8 17-19"/></svg>',
        lock: '<svg viewBox="0 0 64 64"><rect x="16" y="28" width="32" height="24" rx="4"/><path d="M24 28v-8a8 8 0 0 1 16 0v8"/><path d="M32 36v8"/></svg>',
        damage: '<svg viewBox="0 0 64 64"><path d="M32 8 38 25 56 20 43 34 53 50 34 43 22 56 24 38 8 31 26 26z"/></svg>',
        route: '<svg viewBox="0 0 64 64"><circle cx="16" cy="48" r="6"/><circle cx="48" cy="16" r="6"/><path d="M20 44c12-18 24 0 28-22"/></svg>',
        leader: '<svg viewBox="0 0 64 64"><circle cx="32" cy="16" r="7"/><circle cx="16" cy="30" r="6"/><circle cx="48" cy="30" r="6"/><path d="M22 54c2-11 7-17 10-17s8 6 10 17M6 54c1-9 5-14 10-14M58 54c-1-9-5-14-10-14"/></svg>',
        access: '<svg viewBox="0 0 64 64"><circle cx="32" cy="12" r="5"/><path d="M18 24h28M32 18v18l12 18M32 36 20 54"/><circle cx="32" cy="44" r="14"/></svg>',
        barcode: '<svg viewBox="0 0 64 64"><rect x="10" y="14" width="44" height="36" rx="4"/><path d="M17 22v20M23 22v20M30 22v20M39 22v20M46 22v20M34 22v20"/></svg>'
    };

    return icons[type] || icons.case;
}

function materialForCourse(course){
    return "";
}

function materialSections(course){
    const material = materialForCourse(course);

    if(!material){
        return [];
    }

    const clean = material
        .replace(/\r\n/g, "\n")
        .replace(/\n{4,}/g, "\n\n\n")
        .trim();

    const slideSections = clean
        .split(/\n(?=Slide\b|M[ÓO]DULO\b|CURSO\b|VIOLAÇÃO\b|DANIFICAÇÃO\b|BAGAGEM\b|O que é)/i)
        .map(section => section.trim())
        .filter(section => section.length > 0);

    if(slideSections.length > 1){
        return slideSections;
    }

    return clean
        .split(/\n\s*"(?=[^"\n]{8,})/)
        .map(section => section.replace(/^"|"$/g, "").trim())
        .filter(section => section.length > 0);
}

function splitLargeSection(section, moduleCount){
    const paragraphs = String(section || "")
        .split(/\n{2,}/)
        .map(part => part.trim())
        .filter(Boolean);

    if(paragraphs.length <= moduleCount){
        return paragraphs.length > 0 ? paragraphs : [section];
    }

    const chunks = [];

    for(let index = 0; index < moduleCount; index++){
        const start = Math.floor((paragraphs.length * index) / moduleCount);
        const end = Math.max(start + 1, Math.floor((paragraphs.length * (index + 1)) / moduleCount));
        chunks.push(paragraphs.slice(start, end).join("\n\n"));
    }

    return chunks;
}

function lessonKeywords(value){
    const stopWords = new Set([
        "curso", "trilha", "aula", "pratica", "pratico", "consulta", "simulacao",
        "dados", "procedimento", "introducao", "operacional", "completo", "bagagem",
        "cliente", "passageiro", "passageiros", "sistema", "campo", "campos"
    ]);

    return stripEmoji(value)
        .toLowerCase()
        .normalize("NFD")
        .replace(/[\u0300-\u036f]/g, "")
        .replace(/[^a-z0-9\s]/g, " ")
        .split(/\s+/)
        .filter(word => word.length >= 3 && !stopWords.has(word));
}

function scoreSectionForModule(section, module){
    const haystack = stripEmoji(section)
        .toLowerCase()
        .normalize("NFD")
        .replace(/[\u0300-\u036f]/g, "");

    const titleTokens = lessonKeywords(module.title || "");
    const contentTokens = lessonKeywords(module.content || "").slice(0, 10);
    const tokens = [...new Set([...titleTokens, ...contentTokens])];

    const words = haystack
        .replace(/[^a-z0-9\s]/g, " ")
        .split(/\s+/)
        .filter(Boolean);

    return tokens.reduce((score, token) => {
        if(!token){
            return score;
        }

        return score + words.filter(word => word === token).length;
    }, 0);}

function distributedLessonMaterial(sections, moduleIndex, moduleCount){
    if(sections.length === 1 && moduleCount > 1){
        const chunks = splitLargeSection(sections[0], moduleCount);
        return (chunks[moduleIndex] || chunks[0] || "").trim();
    }

    const start = Math.floor((sections.length * moduleIndex) / moduleCount);
    const end = Math.max(start + 1, Math.floor((sections.length * (moduleIndex + 1)) / moduleCount));

    return sections.slice(start, end).join("\n\n").trim();
}

function lessonMaterial(course, moduleIndex){
    const sections = materialSections(course);

    if(sections.length === 0){
        return "";
    }

    const modules = courseModules(course);
    const module = modules[moduleIndex] || modules[0] || {};
    const moduleCount = Math.max(modules.length, 1);

    const scored = sections
        .map((section, index) => ({
            section,
            index,
            score: scoreSectionForModule(section, module)
        }))
        .filter(item => item.score > 0)
        .sort((a, b) => b.score - a.score || a.index - b.index);

    if(scored.length > 0){
        const selected = scored.slice(0, 2).sort((a, b) => a.index - b.index);
        return selected.map(item => item.section).join("\n\n").trim();
    }

    return distributedLessonMaterial(sections, moduleIndex, moduleCount);
}
function chunkLessonText(text, maxLength = 1200){
    const clean = String(text || "").trim();

    if(clean.length <= maxLength){
        return clean ? [clean] : [];
    }

    const chunks = [];
    let current = "";
    const sentences = clean.split(/(?<=[.!?])\s+(?=[A-ZÁÉÍÓÚÂÊÔÃÕÇ0-9])/);

    sentences.forEach(sentence => {
        if((current + " " + sentence).trim().length > maxLength && current){
            chunks.push(current.trim());
            current = sentence;
            return;
        }

        current = (current + " " + sentence).trim();
    });

    if(current){
        chunks.push(current.trim());
    }

    return chunks.length > 0 ? chunks : [clean.slice(0, maxLength).trim()];
}

function lessonParagraphs(course){
    const material = materialForCourse(course);

    if(!material){
        return [];
    }

    const clean = material
        .replace(/\r\n/g, "\n")
        .replace(/[ \t]{2,}/g, " ")
        .replace(/\n{4,}/g, "\n\n")
        .trim();

    return clean
        .split(/\n{2,}|\n(?=Slide\b|M[ÓO]DULO\b|\d+(?:\.\d+)*\.?\s+[A-ZÁÉÍÓÚÂÊÔÃÕÇ]|[A-ZÁÉÍÓÚÂÊÔÃÕÇ ]{8,}$)/im)
        .map(part => part.trim())
        .filter(part => part.length > 30)
        .flatMap(part => chunkLessonText(part, 1200));
}

function fallbackParagraphSelection(paragraphs, moduleIndex, moduleCount){
    const maxBlocks = 4;

    if(paragraphs.length === 0){
        return "";
    }

    const start = Math.floor((paragraphs.length * moduleIndex) / moduleCount);
    const end = Math.max(start + 1, Math.floor((paragraphs.length * (moduleIndex + 1)) / moduleCount));

    return paragraphs
        .slice(start, end)
        .slice(0, maxBlocks)
        .join("\n\n")
        .trim();
}

function lessonMaterial(course, moduleIndex){
    const paragraphs = lessonParagraphs(course);

    if(paragraphs.length === 0){
        return "";
    }

    const modules = courseModules(course);
    const module = modules[moduleIndex] || modules[0] || {};
    const moduleCount = Math.max(modules.length, 1);

    const scored = paragraphs
        .map((paragraph, index) => ({
            paragraph,
            index,
            score: scoreSectionForModule(paragraph, module)
        }))
        .filter(item => item.score > 0)
        .sort((a, b) => b.score - a.score || a.index - b.index);

    if(scored.length > 0){
        return scored
            .slice(0, 4)
            .sort((a, b) => a.index - b.index)
            .map(item => item.paragraph)
            .join("\n\n")
            .trim();
    }

    return fallbackParagraphSelection(paragraphs, moduleIndex, moduleCount);
}
function normalizeQuizQuestion(question){
    if(!question || !Array.isArray(question.options)){
        return question;
    }

    if(Number.isInteger(question.correct)){
        return question;
    }

    const answer = String(question.answer || "").trim();
    const correct = question.options.findIndex(option => String(option).trim() === answer);

    return {
        question: question.question,
        options: question.options,
        correct: correct >= 0 ? correct : 0
    };
}

function normalizeQuiz(course){
    course.quiz = (course.quiz || []).map(normalizeQuizQuestion);
    return course.quiz;
}

function compactText(value, limit = 160){
    const clean = stripEmoji(value).replace(/\s+/g, " ").trim();
    if(clean.length <= limit){
        return clean;
    }

    return clean.slice(0, limit - 3).trim() + "...";
}

function titleFromSection(section, index){
    const firstLine = stripEmoji(section)
        .split("\n")
        .map(line => line.trim())
        .find(Boolean) || `Trilha ${index + 1}`;

    return firstLine
        .replace(/^\d+\.\s*/, "")
        .replace(/^\[.*?\]\s*/, "")
        .slice(0, 72);
}

function autoModulesForCourse(course){
    const sections = materialSections(course);

    if(sections.length === 0){
        return [{
            title: course.title || "Introducao",
            type: "Trilha",
            duration: course.duration || "Livre",
            content: course.summary || "Conteudo em preparacao."
        }];
    }

    const desiredCount = Math.min(6, Math.max(3, sections.length));
    const modules = [];

    for(let index = 0; index < desiredCount; index++){
        const start = Math.floor((sections.length * index) / desiredCount);
        const end = Math.max(start + 1, Math.floor((sections.length * (index + 1)) / desiredCount));
        const chunk = sections.slice(start, end).join("\n\n");

        modules.push({
            title: titleFromSection(chunk, index),
            type: index === 0 ? "Introducao" : "Trilha",
            duration: "Leitura guiada",
            content: compactText(chunk, 220)
        });
    }

    return modules;
}

function courseModules(course){
    if(Array.isArray(course.modules) && course.modules.length > 0){
        return course.modules;
    }

    course.modules = autoModulesForCourse(course);
    return course.modules;
}

function currentModule(course){
    const modules = courseModules(course);

    if(state.selectedModuleIndex >= modules.length){
        state.selectedModuleIndex = 0;
    }

    return modules[state.selectedModuleIndex] || modules[0];
}

function lessonMedia(course, module, moduleIndex){
    const visual = courseVisual(course);

    return `
        <section class="lesson-media-card">
            <div class="lesson-media-image" style="background-image:${visual.image}">
                <div>
                    <span>Trilha ${String(moduleIndex + 1).padStart(2, "0")}</span>
                    <strong>${escapeHtml(module.title)}</strong>
                </div>
            </div>
        </section>
    `;
}

function lessonVisualKind(course, module){
    const text = normalizeSearch([
        course.id,
        course.title,
        module.title,
        module.content
    ].join(" "));

    if(text.includes("etiqueta") || text.includes("lpn") || text.includes("iata")){
        return "tag";
    }

    if(text.includes("rota") || text.includes("mct") || text.includes("conexao") || text.includes("fluxo")){
        return "route";
    }

    if(text.includes("match") || text.includes("roh") || text.includes("foh")){
        return "match";
    }

    if(text.includes("dano") || text.includes("danificada") || text.includes("violada") || text.includes("dpr") || text.includes("limited")){
        return "damage";
    }

    if(text.includes("avsec") || text.includes("seguranca") || text.includes("ameaca") || text.includes("rbac")){
        return "security";
    }

    if(text.includes("pcd") || text.includes("pnae") || text.includes("atendimento") || text.includes("cliente") || text.includes("passageiro")){
        return "service";
    }

    if(text.includes("documento") || text.includes("campo") || text.includes("mascara") || text.includes("registro")){
        return "form";
    }

    return "flow";
}

function lessonVisualFallbackLabels(kind){
    const presets = {
        tag: ["Origem", "Conexao", "Destino", "LPN/TN"],
        route: ["Origem", "Conexao", "Destino", "Conferencia"],
        match: ["AHL", "OHD", "Match", "Acao"],
        damage: ["Elemento", "Local", "Extensao", "Registro"],
        security: ["Identificar", "Isolar", "Acionar", "Registrar"],
        service: ["Ouvir", "Orientar", "Apoiar", "Resolver"],
        form: ["Dados", "Campos", "Historico", "Salvar"],
        found: ["Local", "Objeto", "Registro", "Guarda"],
        flow: ["Entrada", "Analise", "Acao", "Conclusao"]
    };

    return presets[kind] || presets.flow;
}

function lessonVisualProfile(course, module, moduleIndex){
    const courseProfiles = lessonMediaProfiles[course.id] || [];
    const profile = courseProfiles[moduleIndex];

    if(profile){
        return {
            kind: profile.kind || "flow",
            labels: profile.labels || lessonVisualFallbackLabels(profile.kind || "flow"),
            caption: profile.caption || module.content || course.summary || ""
        };
    }

    const kind = lessonVisualKind(course, module);

    return {
        kind,
        labels: lessonVisualFallbackLabels(kind),
        caption: module.content || course.summary || ""
    };
}

function lessonInlineIllustration(course, module, moduleIndex){
    const profile = lessonVisualProfile(course, module, moduleIndex);
    const kind = profile.kind;
    const labels = profile.labels.map(escapeHtml);
    const caption = escapeHtml(profile.caption);
    const title = escapeHtml(module.title || course.title || "Trilha");

    const diagrams = {
        found: `
            <div class="lesson-visual-found">
                <div class="found-cabin">
                    <span></span>
                    <span></span>
                    <span></span>
                    <strong>${labels[0]}</strong>
                </div>
                <div class="found-object">
                    <i></i>
                    <b>${labels[1]}</b>
                </div>
                <div class="found-steps">
                    <span>${labels[2]}</span>
                    <span>${labels[3]}</span>
                </div>
            </div>
        `,
        tag: `
            <div class="lesson-visual-tag">
                <div class="tag-slip">
                    <span class="tag-airport">${labels[0]}</span>
                    <span class="tag-airport">${labels[1]}</span>
                    <span class="tag-airport">${labels[2]}</span>
                    <div class="tag-barcode"><i></i><i></i><i></i><i></i><i></i><i></i><i></i></div>
                    <strong>${labels[3]}</strong>
                </div>
                <div class="tag-note">
                    <b>Leitura operacional</b>
                    <span>Conferir rota, etiqueta e registro antes de agir.</span>
                </div>
            </div>
        `,
        route: `
            <div class="lesson-visual-route">
                <span>${labels[0]}</span>
                <i></i>
                <span>${labels[1]}</span>
                <i></i>
                <span>${labels[2]}</span>
                <strong>${labels[3]}</strong>
            </div>
        `,
        match: `
            <div class="lesson-visual-match">
                <div><b>${labels[0]}</b><span>Processo origem</span></div>
                <strong>60%+</strong>
                <div><b>${labels[1]}</b><span>Processo localizado</span></div>
                <footer>${labels[2]} | ${labels[3]}</footer>
            </div>
        `,
        damage: `
            <div class="lesson-visual-damage">
                <div class="damage-case"><i></i><i></i><i></i></div>
                <ul>
                    <li>${labels[0]}</li>
                    <li>${labels[1]}</li>
                    <li>${labels[2]}</li>
                    <li>${labels[3]}</li>
                </ul>
            </div>
        `,
        security: `
            <div class="lesson-visual-security">
                <div class="shield-shape"></div>
                <ol>
                    <li>${labels[0]}</li>
                    <li>${labels[1]}</li>
                    <li>${labels[2]}</li>
                    <li>${labels[3]}</li>
                </ol>
            </div>
        `,
        service: `
            <div class="lesson-visual-service">
                <div class="service-person"></div>
                <div class="service-counter">
                    <span>${labels[0]}</span>
                    <span>${labels[1]}</span>
                    <span>${labels[2]}</span>
                    <span>${labels[3]}</span>
                </div>
            </div>
        `,
        form: `
            <div class="lesson-visual-form">
                <span>${labels[0]}</span>
                <span>${labels[1]}</span>
                <span>${labels[2]}</span>
                <strong>${labels[3]}</strong>
            </div>
        `,
        flow: `
            <div class="lesson-visual-flow">
                <span>${labels[0]}</span>
                <span>${labels[1]}</span>
                <span>${labels[2]}</span>
                <span>${labels[3]}</span>
            </div>
        `
    };

    return `
        <figure class="lesson-inline-visual lesson-inline-visual-${kind}">
            <div class="lesson-inline-visual-art">
                ${diagrams[kind] || diagrams.flow}
            </div>
            <figcaption>
                <strong>${title}</strong>
                <span>${caption}</span>
            </figcaption>
        </figure>
    `;
}

function formatLessonContent(value, inlineIllustration = ""){
    const lines = stripEmoji(value).replace(/\r\n/g, "\n").split("\n");
    let html = "";
    let listOpen = false;
    let preOpen = false;
    let paragraphCount = 0;
    let illustrationInserted = false;

    function insertIllustration(){
        if(inlineIllustration && !illustrationInserted){
            closeList();
            closePre();
            html += inlineIllustration;
            illustrationInserted = true;
        }
    }

    function closeList(){
        if(listOpen){
            html += "</ul>";
            listOpen = false;
        }
    }

    function closePre(){
        if(preOpen){
            html += "</code></pre>";
            preOpen = false;
        }
    }

    lines.forEach(rawLine => {
        const line = rawLine.trim();

        if(!line){
            closeList();
            closePre();
            return;
        }

        if(/^(&gt;|>)/.test(line) || /^(AHL|OHD|NM|XT|FO|FW|SI|AG|TN|RT|FD)\b/.test(line) && line.length < 90){
            closeList();
            if(!preOpen){
                html += '<pre class="lesson-command"><code>';
                preOpen = true;
            }
            html += `${escapeHtml(line)}\n`;
            return;
        }

        closePre();

        if(/^\d+\.\s+/.test(line)){
            closeList();
            html += `<h3>${escapeHtml(line)}</h3>`;
            return;
        }

        if(/^(Exemplo|Resumo operacional|Boas praticas|Checklist|Campos importantes|Codigo|Elemento|Extensao|Objetivo|Conceito)\b/i.test(line)){
            closeList();
            html += `<h4>${escapeHtml(line)}</h4>`;
            return;
        }

        if(/^[-*]\s+/.test(line)){
            if(!listOpen){
                html += "<ul>";
                listOpen = true;
            }
            html += `<li>${escapeHtml(line.replace(/^[-*]\s+/, ""))}</li>`;
            return;
        }

        html += `<p>${escapeHtml(line)}</p>`;
        paragraphCount += 1;

        if(paragraphCount === 2){
            insertIllustration();
        }
    });

    closeList();
    closePre();

    if(!illustrationInserted){
        insertIllustration();
    }

    return html;
}


function academyCurrentUserName(){
    if(window.AccessControl && typeof AccessControl.readLocalProfile === "function"){
        const profile = AccessControl.readLocalProfile();

        if(profile && profile.name){
            return profile.name;
        }
    }

    return "aluno";
}

function renderHome(){
    restoreLocalAcademyCourses();
    const grid = document.getElementById("courseGrid");
    const count = document.getElementById("homeCourseCount");
    const welcomeTitle = document.getElementById("academyWelcomeTitle");
    const search = document.getElementById("courseSearch");

    if(!grid){
        return;
    }

    if(welcomeTitle){
        welcomeTitle.textContent = `Olá, ${academyCurrentUserName()}. Escolha seu curso.`;
    }

    if(search && search.value !== state.courseSearch){
        search.value = state.courseSearch;
    }

    const query = normalizeSearch(state.courseSearch);
    const visibleCourses = query
        ? academyCourses.filter(course => {
            const haystack = normalizeSearch([
                course.title,
                course.eyebrow,
                course.summary,
                course.level,
                ...courseModules(course).map(module => module.title)
            ].join(" "));

            return haystack.includes(query);
        })
        : academyCourses;

    count.textContent = visibleCourses.length;

    grid.innerHTML = visibleCourses.map(course => {
        const visual = courseVisual(course);
        const percent = courseProgress(course);

        return `
            <a class="academy-course-card" href="course.html?id=${encodeURIComponent(course.id)}" target="_blank" rel="noopener">
                <div class="course-card-image" style="background-image:${visual.image}">
                    <strong class="course-card-image-title">
                        ${escapeHtml(course.title)}
                    </strong>
                    <span class="course-card-icon">${iconSvg(visual.icon)}</span>
                </div>
                <div class="course-card-body">
                    <span>${course.eyebrow}</span>
                    <h2>${course.title}</h2>
                    <p>${course.summary}</p>
                    <div class="course-card-footer">
                        <strong>${courseModules(course).length} trilhas</strong>
                        <small>${percent}% concluido</small>
                        <small>Conteudo curado</small>
                    </div>
                </div>
            </a>
        `;
    }).join("") || `
        <article class="academy-empty-state">
            <strong>Nenhum curso encontrado.</strong>
            <p>Confira o termo digitado ou pesquise por uma sigla operacional, como AHL, OHD, DPR, RFP, RL ou AVSEC.</p>
        </article>
    `;

    if(search){
        search.oninput = () => {
            state.courseSearch = search.value;
            renderHome();
        };
    }
}

function initializeCourseFromUrl(){
    const params = new URLSearchParams(window.location.search);
    const id = params.get("id");

    if(id && academyCourses.some(course => course.id === id)){
        state.selectedCourseId = id;
    }
}

function renderCourseHeader(course){
    const visual = courseVisual(course);
    const header = document.querySelector(".course-page-header");

    if(header){
        header.style.backgroundImage = visual.image;
    }

    document.getElementById("courseEyebrow").textContent = course.eyebrow;
    document.getElementById("courseTitle").textContent = course.title;
    document.getElementById("courseSummary").textContent = course.summary;
    document.getElementById("courseDuration").textContent = course.duration;
    document.getElementById("courseLevel").textContent = course.level;
    document.getElementById("courseProgress").textContent = `${courseProgress(course)}% concluido`;
}

function renderCourseIntroVideo(course){
    const container = document.getElementById("courseIntroVideo");

    if(!container){
        return;
    }

    const intro = courseIntroVideos[course.id];

    if(!intro){
        container.innerHTML = "";
        container.hidden = true;
        return;
    }

    container.hidden = false;
    container.innerHTML = `
        <div class="course-intro-video-card">
            <div class="course-intro-copy">
                <span>${escapeHtml(intro.title)}</span>
                <h2>${escapeHtml(intro.subtitle)}</h2>
                <p>${escapeHtml(intro.description)}</p>
            </div>

            <video
                class="lesson-local-video course-intro-video"
                controls
                preload="metadata"
                src="${intro.src}">
            </video>
        </div>
    `;
}
function renderTracks(course){
    const grid = document.getElementById("trackGrid");
    const progress = readProgress();
    const done = progress[course.id] || [];
    const modules = courseModules(course);

    grid.innerHTML = modules.map((module, index) => {
        const active = index === state.selectedModuleIndex ? "active" : "";
        const checked = done.includes(index) ? "Concluida" : "Pendente";

        return `
            <button class="track-card ${active}" type="button" data-module="${index}">
                <span>${String(index + 1).padStart(2, "0")}</span>
                <h3>${module.title}</h3>
                <p>${module.type} - ${module.duration}</p>
                <strong>${checked}</strong>
            </button>
        `;
    }).join("");

    grid.querySelectorAll("[data-module]").forEach(button => {
        button.addEventListener("click", () => {
            state.selectedModuleIndex = Number(button.dataset.module);
            renderCoursePage();
        });
    });
}

function renderCourseGuide(course){
    const guide = document.getElementById("courseGuide");

    if(!guide){
        return;
    }

    const modules = courseModules(course);
    const progress = readProgress();
    const done = progress[course.id] || [];
    const current = state.selectedModuleIndex + 1;
    const nextPending = modules.findIndex((_, index) => !done.includes(index));

    guide.innerHTML = `
        <div>
            <span>Voce esta na trilha ${current} de ${modules.length}</span>
            <strong>${escapeHtml(currentModule(course).title)}</strong>
            <p>${done.length} de ${modules.length} trilhas concluidas.</p>
        </div>

        <div class="course-guide-actions">
            <button class="secondary-action" id="goFirstPending" type="button">
                ${nextPending >= 0 ? "Continuar pendente" : "Revisar curso"}
            </button>
            <button class="primary-action" id="goAssessment" type="button">
                Ir para avaliacao
            </button>
        </div>
    `;

    document.getElementById("goFirstPending")?.addEventListener("click", () => {
        state.selectedModuleIndex = nextPending >= 0 ? nextPending : 0;
        renderCoursePage();
        document.getElementById("lessonPanel")?.scrollIntoView({ behavior:"smooth", block:"start" });
    });

    document.getElementById("goAssessment")?.addEventListener("click", () => {
        document.getElementById("assessmentPanel")?.scrollIntoView({ behavior:"smooth", block:"start" });
    });
}

function renderCourseNavigator(course){
    const navigator = document.getElementById("courseNavigator");

    if(!navigator){
        return;
    }

    const modules = courseModules(course);
    const progress = readProgress();
    const done = progress[course.id] || [];

    navigator.innerHTML = `
        <h3>Navegacao do curso</h3>
        <div class="course-progress-bar" aria-label="Progresso do curso">
            <span style="width:${courseProgress(course)}%"></span>
        </div>
        <div class="course-mini-tracks">
            ${modules.map((module, index) => {
                const active = index === state.selectedModuleIndex ? "active" : "";
                const completed = done.includes(index) ? "completed" : "";

                return `
                    <button class="${active} ${completed}" type="button" data-side-module="${index}">
                        <span>${String(index + 1).padStart(2, "0")}</span>
                        <strong>${escapeHtml(module.title)}</strong>
                    </button>
                `;
            }).join("")}
        </div>
    `;

    navigator.querySelectorAll("[data-side-module]").forEach(button => {
        button.addEventListener("click", () => {
            state.selectedModuleIndex = Number(button.dataset.sideModule);
            renderCoursePage();
            document.getElementById("lessonPanel")?.scrollIntoView({ behavior:"smooth", block:"start" });
        });
    });
}

function fullLessonContent(course, moduleIndex){
    const contentSource = window.academyCourseContent || {};
    const courseContent = contentSource[course.id];
    const lessonContent = Array.isArray(courseContent)
        ? courseContent[moduleIndex]
        : "";

    return lessonContent || currentModule(course).content;
}

function renderLesson(course){
    const module = currentModule(course);
    const panel = document.getElementById("lessonPanel");
    const lessonContent = fullLessonContent(course, state.selectedModuleIndex);
    const contentLabel = "Conteudo da trilha";
    const modules = courseModules(course);
    const hasPrevious = state.selectedModuleIndex > 0;
    const hasNext = state.selectedModuleIndex < modules.length - 1;

    panel.innerHTML = `
        <div class="lesson-topline">
            <span>${module.type}</span>
            <span>${module.duration}</span>
        </div>
        <h2>${module.title}</h2>
        ${lessonMedia(course, module, state.selectedModuleIndex)}
        <div class="lesson-content-label">${contentLabel}</div>
        <article class="lesson-full-content">${formatLessonContent(
            lessonContent,
            lessonInlineIllustration(course, module, state.selectedModuleIndex)
        )}</article>
        <div class="lesson-actions">
            <button class="secondary-action" id="previousLesson" type="button" ${hasPrevious ? "" : "disabled"}>Trilha anterior</button>
            <button class="primary-action" id="completeLesson" type="button">Marcar como concluida</button>
            <button class="primary-action" id="nextLesson" type="button" ${hasNext ? "" : "disabled"}>Proxima trilha</button>
            <button class="secondary-action" id="resetCourse" type="button">Reiniciar progresso</button>
        </div>
    `;

    document.getElementById("previousLesson")?.addEventListener("click", () => {
        if(!hasPrevious){
            return;
        }

        state.selectedModuleIndex -= 1;
        renderCoursePage();
        document.getElementById("lessonPanel")?.scrollIntoView({ behavior:"smooth", block:"start" });
    });

    document.getElementById("completeLesson").addEventListener("click", () => {
        const progress = readProgress();
        const done = new Set(progress[course.id] || []);
        done.add(state.selectedModuleIndex);
        progress[course.id] = [...done].sort((a, b) => a - b);
        saveProgress(progress);

        if(hasNext){
            state.selectedModuleIndex += 1;
        }

        renderCoursePage();
        document.getElementById("lessonPanel")?.scrollIntoView({ behavior:"smooth", block:"start" });
    });

    document.getElementById("nextLesson")?.addEventListener("click", () => {
        if(!hasNext){
            return;
        }

        state.selectedModuleIndex += 1;
        renderCoursePage();
        document.getElementById("lessonPanel")?.scrollIntoView({ behavior:"smooth", block:"start" });
    });

    document.getElementById("resetCourse").addEventListener("click", () => {
        const progress = readProgress();
        progress[course.id] = [];
        saveProgress(progress);
        renderCoursePage();
    });
}


function msbImageForLesson(course, moduleIndex){
    return null;
}
function lessonScreenshotCards(course, moduleIndex){
    return "";
}

function bindLessonScreenshots(){
    document.querySelectorAll("[data-screenshot-src]").forEach(button => {
        button.addEventListener("click", () => {
            const src = button.dataset.screenshotSrc;
            const title = button.dataset.screenshotTitle || "Print do sistema";
            const old = document.getElementById("screenshotPreviewModal");

            if(old){
                old.remove();
            }

            document.body.insertAdjacentHTML("beforeend", `
                <div class="screenshot-preview-modal" id="screenshotPreviewModal" role="dialog" aria-modal="true">
                    <div class="screenshot-preview-dialog">
                        <div class="screenshot-preview-header">
                            <strong>${escapeHtml(title)}</strong>
                            <button type="button" id="closeScreenshotPreview">Fechar</button>
                        </div>

                        <img src="${escapeHtml(src)}" alt="${escapeHtml(title)}">
                    </div>
                </div>
            `);

            document.getElementById("closeScreenshotPreview")?.addEventListener("click", () => {
                document.getElementById("screenshotPreviewModal")?.remove();
            });

            document.getElementById("screenshotPreviewModal")?.addEventListener("click", event => {
                if(event.target.id === "screenshotPreviewModal"){
                    event.currentTarget.remove();
                }
            });
        });
    });
}
function renderLabs(course){
    const labs = document.getElementById("labLinks");

    labs.innerHTML = course.labs.map(lab => `
        <a class="lab-link" href="${lab.href}">
            <span>${lab.label}</span>
            <strong>Abrir</strong>
        </a>
    `).join("") || `<div class="assessment-empty">Sem laboratorio vinculado.</div>`;
}

function quizScore(course){
    const answers = state.quizAnswers[course.id] || {};
    const questions = normalizeQuiz(course);

    if(questions.length === 0){
        return null;
    }

    const correct = questions.reduce((sum, question, index) => sum + (answers[index] === question.correct ? 1 : 0), 0);
    return { correct, total: questions.length, percent: Math.round((correct / questions.length) * 100) };
}

function renderAssessment(course){
    const container = document.getElementById("assessmentPanel");

    if(!container){
        return;
    }

    const questions = normalizeQuiz(course);

    if(questions.length === 0){
        container.innerHTML = `<div class="assessment-empty">Este curso ainda nao possui avaliacao cadastrada.</div>`;
        return;
    }

    const saved = readQuizResults()[course.id];
    const isOpen = Boolean(state.assessmentOpen[course.id]);

    if(!isOpen){
        container.innerHTML = `
            <article class="assessment-start-card">
                <div>
                    <span>Avaliacao</span>
                    <strong>${questions.length} perguntas</strong>
                    <p>${saved ? `Ultimo resultado: ${saved.percent}%` : "A prova ainda nao foi iniciada neste curso."}</p>
                </div>

                <button class="primary-action" id="startAssessment" type="button">
                    Iniciar prova
                </button>
            </article>
        `;

        document.getElementById("startAssessment")?.addEventListener("click", () => {
            const confirmed = window.confirm("Iniciar a prova?");

            if(!confirmed){
                return;
            }

            state.assessmentOpen[course.id] = true;
            renderAssessment(course);
        });

        return;
    }

    container.innerHTML = `
        <details class="assessment-expander" open>
            <summary>
                <span>Avaliacao em andamento</span>
                <strong>${questions.length} perguntas</strong>
                <small id="assessmentScore">${saved ? `Ultimo: ${saved.percent}%` : "Nao finalizada"}</small>
            </summary>

            <div class="quiz-list compact">
                ${questions.map((question, questionIndex) => `
                    <article class="quiz-card">
                        <h3>${questionIndex + 1}. ${question.question}</h3>
                        <div class="quiz-options">
                            ${question.options.map((option, optionIndex) => {
                                const selected = (state.quizAnswers[course.id] || {})[questionIndex] === optionIndex ? "selected" : "";
                                return `<button class="quiz-option ${selected}" type="button" data-question="${questionIndex}" data-option="${optionIndex}">${option}</button>`;
                            }).join("")}
                        </div>
                    </article>
                `).join("")}
            </div>

            <div class="lesson-actions assessment-actions">
                <button class="primary-action" id="finishQuiz" type="button">Finalizar avaliacao</button>
                <button class="secondary-action" id="clearQuiz" type="button">Limpar respostas</button>
                <button class="secondary-action" id="closeAssessment" type="button">Fechar prova</button>
            </div>

            <div class="assessment-feedback" id="assessmentFeedback"></div>
        </details>
    `;

    container.querySelectorAll("[data-question]").forEach(button => {
        button.addEventListener("click", () => {
            const questionIndex = Number(button.dataset.question);
            const optionIndex = Number(button.dataset.option);
            state.quizAnswers[course.id] = state.quizAnswers[course.id] || {};
            state.quizAnswers[course.id][questionIndex] = optionIndex;
            renderAssessment(course);
        });
    });

    document.getElementById("finishQuiz")?.addEventListener("click", () => {
        const answers = state.quizAnswers[course.id] || {};
        if(Object.keys(answers).length < questions.length){
            document.getElementById("assessmentFeedback").textContent = "Responda todas as perguntas antes de finalizar.";
            return;
        }

        const score = quizScore(course);
        const results = readQuizResults();
        results[course.id] = { correct: score.correct, total: score.total, percent: score.percent, finishedAt: new Date().toISOString() };
        saveQuizResults(results);
        document.getElementById("assessmentScore").textContent = `Resultado: ${score.correct}/${score.total} - ${score.percent}%`;
        document.getElementById("assessmentFeedback").textContent = score.percent >= 70 ? "Aprovado." : "Revise as trilhas e refaca a avaliacao.";
    });

    document.getElementById("clearQuiz")?.addEventListener("click", () => {
        state.quizAnswers[course.id] = {};
        renderAssessment(course);
    });

    document.getElementById("closeAssessment")?.addEventListener("click", () => {
        state.assessmentOpen[course.id] = false;
        renderAssessment(course);
    });
}
function renderFullMaterial(course){
    return;
}

function renderCoursePage(){
    const course = selectedCourse();

    if(!course){
        const panel = document.getElementById("lessonPanel");
        if(panel){
            panel.innerHTML = `<div class="assessment-empty">Nenhum curso encontrado. Verifique os dados da plataforma.</div>`;
        }
        return;
    }
    renderCourseHeader(course);
    renderCourseGuide(course);
    renderTracks(course);
    renderLesson(course);
    renderCourseNavigator(course);
    renderLabs(course);
    renderAssessment(course);
}

async function bootAcademy(){
    if(document.getElementById("courseGrid")){
        renderHome();
        return;
    }

    if(document.getElementById("trackGrid")){
        initializeCourseFromUrl();
        renderCoursePage();
    }
}

document.addEventListener("DOMContentLoaded", () => {
    bootAcademy();
});





















