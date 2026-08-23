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
    courseSearch: "",
    trackedCourses: {},
    cloudReady: false,
    useCloudData: false,
    cloudProgress: {},
    cloudQuizResults: {},
    cloudCertificates: {},
    pendingQuizCloudSync: {}
};

const storageKey = "airportBaggageAcademyProgress";
const quizStorageKey = "airportBaggageAcademyQuiz";
const certificateStorageKey = "airportBaggageAcademyCertificates";
const minimumApprovalPercent = 80;

const supplementalCourseQuizzes = {
    "fundamentos": [
        q("Qual é a principal função do atendimento aeroportuário?", ["Orientar o passageiro com segurança, clareza e cordialidade", "Apenas vender serviços adicionais", "Substituir todos os sistemas", "Atender somente passageiros frequentes"]),
        q("Uma comunicação eficiente no aeroporto deve ser:", ["Clara, objetiva e adaptada ao perfil do passageiro", "Sempre técnica e longa", "Rápida mesmo sem confirmação", "Feita somente por escrito"]),
        q("Passageiros com prioridade devem ser tratados com:", ["Respeito, atenção e suporte compatível com a necessidade", "Atendimento apenas se solicitarem por escrito", "Menor atenção para evitar atraso", "Preferência somente se houver supervisor"]),
        q("O que significa manter postura profissional?", ["Agir com respeito, controle emocional e foco em solução", "Falar de forma autoritária", "Evitar contato com passageiros", "Transferir todos os problemas"]),
        q("Escuta ativa é importante porque:", ["Ajuda a entender a necessidade real antes de orientar", "Elimina a necessidade de procedimento", "Permite responder antes do passageiro terminar", "Serve apenas para reclamações formais"]),
        q("Quando não souber uma informação, o agente deve:", ["Verificar em fonte confiável antes de orientar", "Informar qualquer previsão", "Ignorar a pergunta", "Pedir ao passageiro para pesquisar"]),
        q("Um atendimento seguro depende de:", ["Procedimento, registro e comunicação adequada", "Improviso constante", "Ausência de registros", "Apenas simpatia"]),
        q("Em caso de conflito com passageiro, a conduta recomendada é:", ["Manter calma, ouvir, orientar e escalar se houver risco", "Responder no mesmo tom", "Encerrar sem explicação", "Expor o passageiro"]),
        q("Por que registrar informações relevantes?", ["Para garantir rastreabilidade e continuidade do atendimento", "Para aumentar burocracia sem motivo", "Para substituir comunicação", "Para evitar responsabilidade"]),
        q("O atendimento aeroportuário começa:", ["Antes do embarque e segue por toda a jornada do passageiro", "Somente no portão", "Apenas após reclamação", "Depois do voo"]),
        q("Um passageiro estrangeiro deve receber:", ["Informação clara e apoio compatível com barreira de idioma", "Atendimento somente se falar português", "Menos prioridade sempre", "Orientação sem confirmação"]),
        q("A prioridade operacional nunca deve eliminar:", ["Segurança e respeito ao procedimento", "A pressa", "A fila", "A comunicação interna"]),
        q("Qual atitude melhora a experiência do passageiro?", ["Explicar próximos passos de forma simples", "Usar siglas sem explicar", "Evitar atualizar informações", "Prometer solução não confirmada"]),
        q("O agente representa:", ["A operação aeroportuária perante o passageiro", "Apenas seu próprio setor", "Somente o sistema usado", "Nenhuma área"]),
        q("Boa experiência no aeroporto depende de:", ["Clareza, empatia, segurança e execução correta", "Somente rapidez", "Apenas tecnologia", "Ausência de procedimentos"])
    ],
    "ahl": [
        q("AHL é utilizado para registrar:", ["Bagagem extraviada ou não localizada pelo passageiro", "Bagagem encontrada sem dono", "Objeto esquecido a bordo", "Dano sem passageiro"]),
        q("Qual campo identifica a etiqueta da bagagem?", ["TN", "NM", "FF", "AG"]),
        q("O campo NM representa:", ["Nome do passageiro", "Número da mala", "Natureza do dano", "Nome da estação"]),
        q("Por que o contato do passageiro é essencial no AHL?", ["Para atualizar localização, entrega e tratativa", "Para substituir a etiqueta", "Para gerar peso da bagagem", "Para cancelar o voo"]),
        q("O campo RT deve indicar:", ["Rota relacionada ao passageiro ou bagagem", "Somente telefone", "Descrição do dano", "Número do assento"]),
        q("O campo FD é usado para:", ["Voo e data", "Endereço permanente", "Marca da mala", "País de emissão"]),
        q("Reason for Loss ajuda a:", ["Classificar a causa operacional provável", "Escolher idioma do sistema", "Definir cor da mala", "Gerar etiqueta"]),
        q("Fault Station indica:", ["Base ou ponto associado à falha operacional", "Cidade do passageiro", "Tipo de documento", "Peso da bagagem"]),
        q("A descrição da bagagem deve ser:", ["Clara, detalhada e compatível com a busca", "Vazia para evitar erro", "Sempre igual para todos", "Apenas cor genérica"]),
        q("Histórico do AHL deve registrar:", ["Contatos, atualizações, buscas e decisões", "Apenas o primeiro atendimento", "Somente o nome do agente", "Nenhuma alteração"]),
        q("Ao localizar a bagagem, o processo deve:", ["Ser atualizado até entrega ou encerramento correto", "Ser apagado", "Permanecer sem histórico", "Virar OHD automaticamente sem análise"]),
        q("Dados incompletos no AHL podem causar:", ["Dificuldade de busca e contato com passageiro", "Melhoria do match", "Entrega automática", "Redução de responsabilidade"]),
        q("O botão WT serve para:", ["Visualizar a máscara WorldTracer do processo", "Excluir o processo", "Encerrar sem confirmação", "Gerar certificado"]),
        q("AHL permanece aberto até:", ["Solução, entrega, encerramento ou tratativa final aplicável", "Sempre 24 horas", "Somente imprimir", "Nunca"]),
        q("Uma boa abertura de AHL exige:", ["Dados corretos, escuta e registro completo", "Apenas referência", "Somente foto da mala", "Nenhuma validação"])
    ],
    "ohd": [
        q("OHD é usado para registrar:", ["Bagagem localizada/sobrante sem passageiro associado no momento", "Reclamação de dano", "Curso concluído", "Controle de escala"]),
        q("O campo CC deve conter:", ["Conteúdo da bagagem descrito com detalhe", "Somente número do voo", "Apenas nome do agente", "Senha do usuário"]),
        q("Por que a descrição do conteúdo é importante?", ["Ajuda no match com AHL e na identificação do dono", "Substitui todos os campos", "Impede consulta", "Fecha o processo automaticamente"]),
        q("OHD deve ter status atualizado quando:", ["For enviado, entregue ou encerrado conforme fluxo", "Sempre que abrir a página", "Somente por estética", "Nunca"]),
        q("Quando há solicitação ROH ativa, o OHD deve:", ["Mostrar histórico para o agente avaliar envio", "Apagar a solicitação", "Virar AHL", "Ser ignorado"]),
        q("FOH representa:", ["Envio do OHD para a base solicitante", "Abertura de reclamação de dano", "Cancelamento de etiqueta", "Cadastro de passageiro"]),
        q("Ao enviar FOH, o OHD deve:", ["Registrar mensagem e ser encerrado automaticamente quando aplicável", "Continuar sem histórico", "Excluir match", "Abrir nova prova"]),
        q("O campo CT registra:", ["Cor e tipo da bagagem", "Telefone", "Rota", "Nota final"]),
        q("O campo BI registra:", ["Marca ou informação da bagagem", "Base de origem", "Email", "Motivo de perda"]),
        q("A geração da referência OHD deve considerar:", ["Rota/voo quando válidos ou base/cia escolhidas", "Somente conteúdo", "Sempre YY", "A data do computador apenas"]),
        q("OHD sem etiqueta exige:", ["Descrição cuidadosa e armazenamento rastreável", "Encerramento imediato", "Ausência de registro", "Entrega a qualquer passageiro"]),
        q("Match entre OHD e AHL deve indicar:", ["Percentual e processo correspondente", "Somente cor da tela", "Senha do usuário", "Apenas status"]),
        q("OHD não deve solicitar ROH de AHL porque:", ["ROH parte da AHL para pedir envio de um OHD", "AHL nunca tem passageiro", "OHD não tem histórico", "FOH é prova"]),
        q("O histórico do OHD deve registrar:", ["ROH recebido, FOH enviado e mensagens completas", "Apenas número da referência", "Somente data de criação", "Nada após encerramento"]),
        q("Um OHD bem preenchido melhora:", ["Busca, match, envio e rastreabilidade", "Apenas aparência da página", "Tempo de login", "Número de cursos"])
    ],
    "matches": [
        q("O match AHL x OHD compara:", ["Dados dos processos para sugerir relação entre extravio e bagagem localizada", "Somente nomes de agentes", "Apenas cor das telas", "Certificados emitidos"]),
        q("A partir de qual percentual os matches devem aparecer?", ["50%", "10%", "25%", "Todos sem limite"]),
        q("Qual campo tende a ter maior peso no match?", ["Tag da bagagem", "Cor do botão", "Nome do curso", "Senha do usuário"]),
        q("Além da tag, o sistema deve comparar:", ["Nome, rota, voo, conteúdo, contato, endereço e demais campos úteis", "Somente data do login", "Apenas status", "Nada mais"]),
        q("O maior match deve ficar:", ["Sempre visível na lista", "Oculto em outra página", "Apagado após ver", "Sem percentual"]),
        q("O card expansivo de matches serve para:", ["Mostrar todos os processos correspondentes sem poluir a tela", "Excluir processos", "Criar usuários", "Substituir histórico"]),
        q("Quando o AHL solicita um OHD, a transação é:", ["ROH", "FOH", "DPR", "RFP"]),
        q("Quando o OHD é enviado para a base solicitante, a transação é:", ["FOH", "ROH", "AHL", "MCT"]),
        q("A mensagem ROH deve ficar salva:", ["No histórico do AHL e do OHD", "Somente no navegador", "Apenas no botão", "Em nenhum lugar"]),
        q("A mensagem FOH deve ficar salva:", ["No histórico do OHD e do AHL", "Somente na lista de cursos", "Apenas no alerta", "Sem referência"]),
        q("O objetivo do alerta de match é:", ["Informar o usuário sobre possível relação entre processos", "Bloquear o sistema", "Encerrar todos os casos", "Alterar senha"]),
        q("Depois de visualizado, o alerta pode:", ["Ser fechado, mantendo o match salvo", "Apagar o processo", "Zerar a prova", "Remover o curso"]),
        q("Um match de baixa qualidade pode ocorrer quando:", ["Há poucos campos preenchidos ou dados genéricos", "Todos os dados são completos", "A tag é idêntica", "A rota é confirmada"]),
        q("O agente deve tratar match como:", ["Indício para análise, não confirmação automática", "Entrega automática obrigatória", "Erro do sistema", "Prova concluída"]),
        q("A rastreabilidade do match depende de:", ["Histórico, mensagens e dados dos processos", "Apenas cor do badge", "Somente quantidade de cursos", "Nenhum registro"])
    ],
    "dpr": [
        q("DPR é usado para registrar:", ["Dano ou violação de bagagem", "Bagagem extraviada sem dano", "Objeto esquecido", "Controle de aula"]),
        q("O campo TD relaciona-se a:", ["Tipo/localização/extensão do dano", "Nome do passageiro", "Telefone", "Base administrativa"]),
        q("TOP indica qual localização?", ["Parte superior", "Parte inferior", "Lateral", "Área do zíper"]),
        q("SIDE significa:", ["Lateral", "Superior", "Inferior", "Fecho"]),
        q("BOTT indica:", ["Parte inferior", "Alça", "Documento", "Rota"]),
        q("MI representa:", ["Desgaste por uso ou dano menor conforme tabela", "Dano total", "Base de origem", "Objeto proibido"]),
        q("MA representa:", ["Grande extensão de dano", "Apenas mancha pequena", "Nome do agente", "Mensagem SITA"]),
        q("TL indica:", ["Dano total", "Telefone local", "Tempo limite", "Trecho longo"]),
        q("Uma boa descrição DPR deve:", ["Detalhar dano, localização, extensão e evidências", "Ser sempre vazia", "Usar só uma palavra", "Excluir fotos"]),
        q("Fotos e documentos ajudam a:", ["Comprovar a condição da bagagem e sustentar a análise", "Substituir todos os campos obrigatórios", "Eliminar prazo", "Gerar OHD"]),
        q("Quando houver violação, o registro deve indicar:", ["Sinais de abertura, lacre, conteúdo e relato", "Somente peso", "Apenas portão", "Somente horário UTC"]),
        q("Dano pré-existente deve ser:", ["Registrado de forma clara quando identificado", "Ignorado", "Compensado sempre", "Apagado do histórico"]),
        q("O DPR deve preservar:", ["Rastreabilidade, evidência e decisão operacional", "Somente aparência", "Acesso irrestrito", "Dados incompletos"]),
        q("Campo AG registra:", ["Agente responsável", "Altura da mala", "Aeroporto de destino", "Aprovação da prova"]),
        q("Encerramento de DPR exige:", ["Tratativa compatível com evidências e regra aplicável", "Excluir processo", "Ignorar passageiro", "Remover histórico"])
    ],
    "lideranca-bagagem-extraviada": [
        q("O papel da liderança em bagagem extraviada é:", ["Coordenar equipe, priorizar casos e garantir qualidade da tratativa", "Executar tudo sozinho", "Evitar registros", "Atender somente casos fáceis"]),
        q("Um briefing de equipe deve alinhar:", ["Prioridades, riscos, pendências, metas e responsabilidades", "Apenas horários de pausa", "Somente reclamações", "Nenhum dado operacional"]),
        q("Indicadores ajudam o líder a:", ["Identificar tendências, desvios e oportunidades de melhoria", "Substituir atendimento", "Punir sem análise", "Apagar histórico"]),
        q("Passagem de turno eficiente deve conter:", ["Pendências, responsáveis, prazos e última ação registrada", "Somente nomes da equipe", "Apenas elogios", "Nada por escrito"]),
        q("Em caso crítico, o líder deve:", ["Escalonar, orientar equipe e acompanhar solução", "Desaparecer da operação", "Prometer sem confirmação", "Ignorar passageiro"]),
        q("Cultura justa significa:", ["Analisar falhas para aprender e melhorar, sem busca automática por culpa", "Não registrar erros", "Aceitar qualquer desvio", "Evitar treinamento"]),
        q("Qualidade na liderança depende de:", ["Dados, comunicação, acompanhamento e consistência", "Improviso", "Silêncio", "Ausência de metas"]),
        q("Um bom líder operacional deve:", ["Dar direção clara e apoiar a equipe sob pressão", "Criar confusão", "Evitar feedback", "Centralizar informação sem compartilhar"]),
        q("Conflitos com passageiros devem ser tratados com:", ["Calma, escuta, orientação e escalonamento quando necessário", "Irritação", "Exposição pública", "Resposta defensiva"]),
        q("A análise de causa serve para:", ["Evitar repetição de falhas e corrigir processo", "Encontrar culpado sem evidência", "Encerrar sem solução", "Eliminar indicadores"]),
        q("Casos de maior impacto devem ser:", ["Priorizados conforme risco, prazo e vulnerabilidade", "Deixados para depois sempre", "Apagados", "Tratados sem registro"]),
        q("Treinamento da equipe deve focar em:", ["Procedimento, atendimento, sistema, comunicação e decisão", "Somente teoria genérica", "Apenas aparência", "Nada após contratação"]),
        q("Feedback operacional deve ser:", ["Objetivo, respeitoso e conectado a comportamento observável", "Humilhante", "Sem exemplo", "Sempre público"]),
        q("O líder deve acompanhar certificados e cursos porque:", ["Capacitação sustenta qualidade e padronização", "Serve para bloquear usuários", "Substitui supervisão", "Não tem valor"]),
        q("Liderança eficaz em LL busca:", ["Reduzir reincidência, melhorar resposta e proteger passageiro e operação", "Aumentar reclamações", "Evitar comunicação", "Trabalhar sem metas"])
    ],
    "avsec": [
        q("O controle de acesso em área restrita existe para:", ["Impedir entrada não autorizada e reduzir risco de interferência ilícita", "Facilitar circulação livre", "Substituir inspeção", "Aumentar fila"]),
        q("Uma cultura AVSEC eficiente depende de:", ["Atenção, reporte, cumprimento de regras e atuação preventiva", "Apenas tecnologia", "Improviso", "Ausência de treinamento"]),
        q("Ao identificar comportamento suspeito, o colaborador deve:", ["Acionar o canal responsável conforme procedimento", "Abordar agressivamente", "Ignorar", "Publicar em rede social"]),
        q("Itens e bagagens suspeitas devem ser tratados com:", ["Isolamento, comunicação e acionamento autorizado", "Abertura imediata pelo agente", "Entrega a qualquer pessoa", "Descarte sem registro"]),
        q("Normas de segurança operacional e AVSEC devem ser:", ["Conhecidas e cumpridas por todos os envolvidos", "Opcionais", "Aplicadas só em auditoria", "Substituídas por opinião"])
    ],
    "atendimento-cliente-aviacao": [
        q("Uma experiência positiva no aeroporto depende de:", ["Clareza, empatia, previsibilidade e solução possível", "Somente preço da passagem", "Falta de contato", "Informação incompleta"]),
        q("Ao lidar com passageiro irritado, o agente deve:", ["Manter controle emocional e buscar solução dentro das regras", "Elevar o tom", "Ignorar", "Responder com ironia"]),
        q("A diferença entre atendimento e suporte é que:", ["Atendimento é amplo e suporte resolve demanda específica", "São sempre a mesma coisa", "Suporte é apenas venda", "Atendimento não exige escuta"]),
        q("Comunicação positiva evita:", ["Ruído, insegurança e conflito desnecessário", "Solução", "Registro", "Cordialidade"]),
        q("O feedback do cliente deve ser usado para:", ["Melhorar processos e reforçar boas práticas", "Punir sem análise", "Apagar reclamações", "Ignorar recorrências"])
    ],
    "boas-praticas-atendimento": [
        q("Atendimento de excelência exige:", ["Empatia, postura, clareza, agilidade e cumprimento de procedimento", "Apenas simpatia", "Somente rapidez", "Ausência de regras"]),
        q("Conhecer perfis de passageiros ajuda a:", ["Adaptar a comunicação e o suporte necessário", "Separar pessoas sem critério", "Evitar perguntas", "Eliminar prioridade"]),
        q("Diante de overbooking, cancelamento ou atraso, a equipe deve:", ["Explicar a situação e orientar alternativas possíveis", "Culpar o passageiro", "Esconder informação", "Encerrar a fila"]),
        q("Uma má prática de atendimento é:", ["Tratar passageiro com frieza por dificuldade de comunicação", "Oferecer ajuda", "Explicar procedimentos", "Registrar contato"]),
        q("Ao fim do atendimento, é importante:", ["Confirmar se o passageiro entendeu o próximo passo", "Sair sem explicar", "Usar apenas siglas", "Evitar registro"])
    ],
    "bagagem-violada": [
        q("Violação de bagagem envolve:", ["Indício de abertura indevida ou subtração de conteúdo", "Somente atraso de voo", "Excesso de peso", "Alteração de portão"]),
        q("Em suspeita de violação, o registro deve conter:", ["Relato, fotos, lacre, conteúdo informado e evidências", "Apenas cor da mala", "Somente nome do agente", "Nada por escrito"]),
        q("Itens de valor exigem análise cuidadosa porque:", ["Podem ter regra específica de responsabilidade e comprovação", "Sempre são compensados sem prova", "Nunca importam", "Substituem processo"]),
        q("O campo FF pode ser usado para:", ["Registrar tratativas, contatos e informações adicionais", "Gerar etiqueta", "Cadastrar curso", "Alterar senha"]),
        q("Quando houver prazo aplicável, ele deve ser:", ["Verificado antes da decisão", "Ignorado", "Inventado", "Apagado"]),
        q("Resposta ao passageiro em violação deve ser:", ["Clara, respeitosa e baseada em evidências", "Genérica e agressiva", "Sem explicação", "Somente verbal"])
    ],
    "bagagem-danificada": [
        q("Dano funcional é aquele que:", ["Compromete o uso normal da bagagem", "É apenas sujeira leve", "Acontece antes do check-in sempre", "Não precisa registro"]),
        q("Limited Release serve para:", ["Registrar condição pré-existente ou limitação aplicável", "Garantir compensação automática", "Criar OHD", "Excluir fotos"]),
        q("O local do dano deve ser descrito porque:", ["Ajuda a identificar a ocorrência e avaliar responsabilidade", "É irrelevante", "Substitui o passageiro", "Serve para login"]),
        q("Arranhões leves podem exigir:", ["Avaliação conforme regra e evidência disponível", "Compensação total automática", "Apagar processo", "FOH"]),
        q("Dano total deve ser avaliado com:", ["Critério, fotos, descrição e regra aplicável", "Apenas opinião", "Sem contato", "Somente peso"])
    ],
    "tratativa-rl-mct": [
        q("RL deve refletir:", ["Causa operacional mais compatível com os fatos", "Preferência do agente", "Cor da mala", "Nome do curso"]),
        q("MCT abaixo do mínimo aumenta risco de:", ["Bagagem não conectar a tempo", "Melhor SLA", "Certificado automático", "Dano total"])
    ],
    "bagagem-sem-etiqueta-ohd": [
        q("Bagagem sem etiqueta exige atenção a:", ["Identificação por características, conteúdo e histórico", "Apenas peso", "Somente cor da tela", "Nenhum dado"]),
        q("Após prazo definido, bagagem não reclamada pode seguir:", ["Fluxo de guarda, envio ou destinação conforme procedimento", "Entrega aleatória", "Exclusão do sistema", "Sem registro"]),
        q("Itens perecíveis em bagagem localizada devem ser:", ["Tratados conforme orientação local e registrados", "Sempre guardados indefinidamente", "Ignorados", "Enviados sem avaliação"]),
        q("Descrição genérica no OHD prejudica:", ["Busca, match e identificação do proprietário", "A cor do botão", "O login", "A nota da prova"]),
        q("Antes de enviar OHD ao depósito, deve-se verificar:", ["Solicitações ativas e histórico do processo", "Somente imagem do curso", "Senha do usuário", "Nada"])
    ],
    "atendimento-pcd": [
        q("Atendimento inclusivo exige perguntar antes de ajudar porque:", ["Respeita autonomia e preferência do passageiro", "Atrasa sempre", "Elimina procedimento", "Evita comunicação"]),
        q("A linguagem adequada deve ser:", ["Respeitosa, direta e sem infantilização", "Paternalista", "Agressiva", "Cheia de jargões"]),
        q("Recursos de acessibilidade devem ser:", ["Oferecidos conforme necessidade e disponibilidade operacional", "Negados por padrão", "Usados sem perguntar", "Apenas decorativos"]),
        q("Falar apenas com acompanhante é inadequado porque:", ["Retira autonomia da pessoa atendida", "Acelera sempre", "É obrigatório", "Substitui escuta"]),
        q("O atendimento PcD deve equilibrar:", ["Segurança, autonomia, respeito e eficiência", "Pressa e silêncio", "Padronização sem adaptação", "Ausência de registro"])
    ],
    "interpretacao-etiqueta-bagagem": [
        q("O código de barras da etiqueta permite:", ["Leitura e rastreabilidade do volume", "Identificar humor do passageiro", "Substituir voo", "Gerar certificado"]),
        q("Destino final na etiqueta ajuda a:", ["Direcionar carregamento, conexão e restituição", "Definir valor da passagem", "Escolher assento", "Excluir bagagem"]),
        q("Etiqueta ilegível deve gerar:", ["Atenção, reemissão/verificação e registro conforme fluxo", "Ignorar e carregar", "Entrega a qualquer voo", "Fechamento automático"])
    ],
    "gestao-pessoas-rampa": [
        q("Comportamento assertivo na rampa significa:", ["Comunicar riscos com clareza e respeito", "Gritar sempre", "Ficar calado", "Ignorar desvios"]),
        q("Liderança na rampa deve reforçar:", ["Segurança, disciplina e coordenação", "Pressa sem controle", "Atalhos", "Ausência de EPI"]),
        q("Feedback em equipe operacional deve:", ["Ser específico, respeitoso e orientado à melhoria", "Expor para humilhar", "Ser vago", "Nunca acontecer"]),
        q("Conflitos entre áreas devem ser tratados com:", ["Fato, procedimento e foco na solução", "Culpa imediata", "Silêncio", "Competição"]),
        q("Uma equipe madura reporta quase falhas para:", ["Prevenir acidentes e melhorar o processo", "Criar punição automática", "Evitar aprendizagem", "Ocultar risco"])
    ]
};

function q(question, options, correct = 0){
    return { question, options, correct };
}

function ensureCourseQuizzes(){
    if(!Array.isArray(academyCourses)){
        return;
    }

    academyCourses.forEach(course => {
        const supplement = supplementalCourseQuizzes[course.id];

        if(!Array.isArray(supplement) || supplement.length === 0){
            return;
        }

        if(!Array.isArray(course.quiz)){
            course.quiz = [];
        }

        const existingQuestions = new Set(
            course.quiz.map(item => normalizeSearch(item.question || ""))
        );

        for(const item of supplement){
            if(course.quiz.length >= 15){
                break;
            }

            const key = normalizeSearch(item.question || "");

            if(existingQuestions.has(key)){
                continue;
            }

            course.quiz.push(item);
            existingQuestions.add(key);
        }
    });
}

ensureCourseQuizzes();

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
    "gestao-pessoas-rampa": { image: "linear-gradient(135deg, rgba(15,118,110,.92), rgba(15,23,42,.86)), url('https://images.unsplash.com/photo-1517048676732-d65bc937f952?auto=format&fit=crop&w=900&q=80')", icon: "leader" },
    "restituicao-bagagem-sla": { image: "linear-gradient(135deg, rgba(15,118,110,.9), rgba(12,74,110,.86)), url('https://images.unsplash.com/photo-1530521954074-e64f6810b32d?auto=format&fit=crop&w=900&q=80')", icon: "route" },
    "siga-gestao-aeroportuaria": { image: "linear-gradient(135deg, rgba(37,99,235,.9), rgba(15,23,42,.86)), url('https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=900&q=80')", icon: "globe" },
    "checkin-operacional": { image: "linear-gradient(135deg, rgba(15,118,110,.9), rgba(15,23,42,.86)), url('https://images.unsplash.com/photo-1569154941061-e231b4725ef1?auto=format&fit=crop&w=900&q=80')", icon: "case" },
    "embarque-controle-portao": { image: "linear-gradient(135deg, rgba(29,78,216,.9), rgba(15,23,42,.86)), url('https://images.unsplash.com/photo-1556388158-158ea5ccacbd?auto=format&fit=crop&w=900&q=80')", icon: "globe" },
    "irregularidades-voo": { image: "linear-gradient(135deg, rgba(124,58,237,.9), rgba(15,23,42,.86)), url('https://images.unsplash.com/photo-1513267048331-5611cad62e41?auto=format&fit=crop&w=900&q=80')", icon: "shield" },
    "conexoes-mct": { image: "linear-gradient(135deg, rgba(8,145,178,.9), rgba(15,23,42,.86)), url('https://images.unsplash.com/photo-1436491865332-7a61a109cc05?auto=format&fit=crop&w=900&q=80')", icon: "globe" },
    "bagagens-especiais": { image: "linear-gradient(135deg, rgba(15,118,110,.92), rgba(15,23,42,.86)), url('https://images.unsplash.com/photo-1553531889-e6cf4d692b1b?auto=format&fit=crop&w=900&q=80')", icon: "case" },
    "mercadorias-perigosas-atendimento": { image: "linear-gradient(135deg, rgba(180,83,9,.92), rgba(15,23,42,.88)), url('https://images.unsplash.com/photo-1581092160607-ee22621dd758?auto=format&fit=crop&w=900&q=80')", icon: "shield" },
    "comunicacao-operacional-aeroportuaria": { image: "linear-gradient(135deg, rgba(37,99,235,.92), rgba(15,23,42,.86)), url('https://images.unsplash.com/photo-1516321318423-f06f85e504b3?auto=format&fit=crop&w=900&q=80')", icon: "globe" },
    "contestacao-operacional-aviacao": { image: "linear-gradient(135deg, rgba(14,116,144,.92), rgba(15,23,42,.86)), url('https://images.unsplash.com/photo-1450101499163-c8848c66ca85?auto=format&fit=crop&w=900&q=80')", icon: "form" },
    "gestao-crise-aeroporto": { image: "linear-gradient(135deg, rgba(3,105,161,.92), rgba(15,23,42,.86)), url('https://images.unsplash.com/photo-1436491865332-7a61a109cc05?auto=format&fit=crop&w=900&q=80')", icon: "shield" },
    "qualidade-indicadores-operacionais": { image: "linear-gradient(135deg, rgba(4,120,87,.92), rgba(15,23,42,.86)), url('https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&w=900&q=80')", icon: "check" },
    "introducao-operacao-rampa": { image: "linear-gradient(135deg, rgba(15,118,110,.9), rgba(15,23,42,.86)), url('https://images.unsplash.com/photo-1529074963764-98f45c47344b?auto=format&fit=crop&w=900&q=80')", icon: "vest" }
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
    ],
    "restituicao-bagagem-sla": [
        { kind:"flow", labels:["Aeronave", "Descarga", "BHS", "Esteira"], caption:"A restituição conecta descarga, transporte, BHS e entrega da bagagem ao passageiro." },
        { kind:"route", labels:["Posição", "Percurso", "Tempo", "Risco"], caption:"Quanto maior a distância até a restituição, maior deve ser a antecipação operacional." },
        { kind:"security", labels:["Baixo", "Moderado", "Alto", "Crítico"], caption:"A classificação de risco orienta equipe, equipamentos e prioridade antes da chegada." },
        { kind:"flow", labels:["Descarga", "Transporte", "BHS", "SLA"], caption:"O SLA é a soma de etapas; cada minuto perdido reduz a margem da operação." },
        { kind:"form", labels:["Turno", "Atraso", "Causa", "Registro"], caption:"Monitorar por turno mostra onde as violações se concentram e qual ação é necessária." },
        { kind:"match", labels:["Pareto", "Impacto", "Prioridade", "Ação"], caption:"Pareto ajuda a atacar primeiro os turnos, posições ou causas de maior impacto." },
        { kind:"route", labels:["Equipe", "Carreta", "Esteira", "Plano"], caption:"Voos críticos exigem plano pré-chegada, recursos definidos e supervisão dedicada." },
        { kind:"form", labels:["Horário", "Causa", "SLA", "Melhoria"], caption:"Registros consistentes transformam atrasos em aprendizado e melhoria de processo." }
    ],
    "siga-gestao-aeroportuaria": [
        { kind:"globe", labels:["Voos", "Alertas", "Equipes", "Tempo real"], caption:"Um sistema integrado centraliza dados operacionais para diferentes áreas do aeroporto." },
        { kind:"security", labels:["Login", "Senha", "2FA", "Perfil"], caption:"Acesso seguro exige credencial individual, senha forte e proteção dos dados operacionais." },
        { kind:"form", labels:["UTC", "Avisos", "Menu", "Dashboard"], caption:"O dashboard organiza avisos, atualizações, horário e atalhos de navegação." },
        { kind:"route", labels:["Voo", "Gate", "Status", "Atraso"], caption:"Controle de voos acompanha status, mudanças e impactos nos serviços de solo." },
        { kind:"flow", labels:["Atualizar", "Aplicar", "Comunicar", "Registrar"], caption:"Atualizações operacionais precisam ser lidas, aplicadas e registradas no turno." },
        { kind:"security", labels:["Alerta", "Ação", "Etapa", "Follow-up"], caption:"Alertas e incidentes exigem ação registrada e acompanhamento até conclusão." },
        { kind:"service", labels:["Erro", "Feedback", "Suporte", "Melhoria"], caption:"Colaboração estruturada transforma erros reportados em melhoria operacional." },
        { kind:"check", labels:["Confirmar", "Registrar", "Evitar duplicidade", "Encerrar"], caption:"Boas práticas mantêm a plataforma confiável como fonte única da operação." }
    ],
    "checkin-operacional": [
        { kind:"service", labels:["Reserva", "Documento", "Serviço", "Bagagem"], caption:"O check-in valida passageiro, voo, documentos, serviços e bagagem antes do embarque." },
        { kind:"form", labels:["Nome", "Foto", "Validade", "Rota"], caption:"A conferência documental precisa considerar tipo de viagem, perfil do passageiro e exigências da rota." },
        { kind:"case", labels:["Peso", "Franquia", "Etiqueta", "Restrição"], caption:"A aceitação de bagagem exige conferência de peso, condição, rota, itens restritos e comprovante." },
        { kind:"service", labels:["PNAE", "UMNR", "Gestante", "Animal"], caption:"Serviços especiais devem ser registrados e comunicados às áreas envolvidas." },
        { kind:"flow", labels:["Aceito", "No-show", "Gate", "Rampa"], caption:"O fechamento do check-in organiza a transição para embarque, rampa e coordenação." },
        { kind:"check", labels:["Horário", "Evidência", "Responsável", "Histórico"], caption:"Registros claros garantem rastreabilidade, continuidade e conformidade operacional." }
    ],
    "embarque-controle-portao": [
        { kind:"route", labels:["Voo", "Portão", "Equipe", "Recursos"], caption:"A preparação do portão antecipa informações, equipe, recursos e riscos antes da chamada." },
        { kind:"flow", labels:["Prioridade", "Grupo", "Fila", "Fluxo"], caption:"A sequência de embarque organiza prioridades, grupos e deslocamento seguro até a aeronave." },
        { kind:"check", labels:["Cartão", "Documento", "Status", "Conciliação"], caption:"A conferência no gate confirma passageiro, voo, trecho e status antes da entrada na aeronave." },
        { kind:"case", labels:["Cabine", "Gate bag", "Etiqueta", "Rampa"], caption:"Bagagem no portão precisa de orientação, etiqueta e comunicação clara com a rampa." },
        { kind:"service", labels:["Late show", "Mudança", "Conflito", "Supervisão"], caption:"Irregularidades no gate exigem calma, método, comunicação e registro." },
        { kind:"form", labels:["Embarcados", "Ausentes", "Bagagem", "Fechar"], caption:"O fechamento do voo confirma passageiros, bagagens, pendências e liberação operacional." }
    ],
    "irregularidades-voo": [
        { kind:"route", labels:["Atraso", "Cancelamento", "Conexão", "Preterição"], caption:"Irregularidades alteram a jornada e exigem leitura correta do cenário operacional." },
        { kind:"service", labels:["Status", "Previsão", "Alternativas", "Atualização"], caption:"Informação clara reduz incerteza e melhora o atendimento durante contingências." },
        { kind:"check", labels:["1h", "2h", "4h", "Assistência"], caption:"A assistência material deve acompanhar tempo de espera e necessidade do passageiro." },
        { kind:"flow", labels:["Reacomodar", "Reembolsar", "Bagagem", "Registrar"], caption:"Alternativas precisam considerar disponibilidade, escolha do passageiro e bagagem." },
        { kind:"form", labels:["Voluntário", "Assento", "Compensação", "Registro"], caption:"Preterição exige transparência, alternativa, compensação quando cabível e histórico." },
        { kind:"security", labels:["Calma", "Prioridade", "Liderança", "Histórico"], caption:"Em crise, método e registro protegem passageiros, equipe e operação." }
    ],
    "conexoes-mct": [
        { kind:"route", labels:["Origem", "Conexão", "Destino", "MCT"], caption:"MCT indica o tempo mínimo para passageiro e bagagem seguirem entre voos." },
        { kind:"form", labels:["Voo 1", "Terminal", "Controle", "Voo 2"], caption:"A leitura do itinerário considera horários, terminais, controles e destino final." },
        { kind:"case", labels:["Passageiro", "Bagagem", "BHS", "Gate"], caption:"Conexões curtas aumentam risco de passageiro ou bagagem perderem o próximo trecho." },
        { kind:"flow", labels:["Identificar", "Priorizar", "Comunicar", "Acompanhar"], caption:"Conexões críticas precisam de ação antecipada e comunicação entre áreas." },
        { kind:"service", labels:["Misconnect", "Reacomodar", "Rastrear", "Orientar"], caption:"Perda de conexão exige continuidade da viagem e controle do destino da bagagem." },
        { kind:"check", labels:["Causa", "Rota", "Turno", "Melhoria"], caption:"Indicadores de conexão ajudam a reduzir reincidência e orientar planos de melhoria." }
    ],
    "bagagens-especiais": [
        { kind:"case", labels:["Peso", "Dimensão", "Fragilidade", "Regra"], caption:"Bagagem especial exige análise de peso, dimensão, embalagem, conteúdo e regra de transporte." },
        { kind:"service", labels:["Cadeira", "Muleta", "Prótese", "Autonomia"], caption:"Equipamentos assistivos devem preservar mobilidade, autonomia e dignidade do passageiro." },
        { kind:"case", labels:["Esporte", "Instrumento", "Estojo", "Etiqueta"], caption:"Itens esportivos e instrumentos precisam de embalagem adequada, etiqueta e manuseio diferenciado." },
        { kind:"service", labels:["Animal", "Documento", "Recipiente", "Cão-guia"], caption:"Animais exigem regra específica; cão-guia é recurso de acessibilidade vinculado ao passageiro." },
        { kind:"security", labels:["Frágil", "Valor", "Restrição", "Registro"], caption:"Itens frágeis, de valor ou restritos exigem orientação e registro quando aplicável." },
        { kind:"flow", labels:["Aceite", "Rampa", "Chegada", "Entrega"], caption:"Rastreabilidade acompanha o volume especial do aceite até a devolução correta." }
    ],
    "mercadorias-perigosas-atendimento": [
        { kind:"security", labels:["Risco", "Aeronave", "Pessoas", "Ambiente"], caption:"Mercadorias perigosas podem afetar segurança, saúde, bens, aeronave e meio ambiente." },
        { kind:"check", labels:["Perguntar", "Observar", "Consultar", "Acionar"], caption:"O reconhecimento combina perguntas de segurança, sinais visuais e consulta ao procedimento." },
        { kind:"security", labels:["Bateria", "Power bank", "Smart bag", "Cabine"], caption:"Baterias e power banks exigem verificação da lista vigente e transporte no local correto." },
        { kind:"form", labels:["Aerossol", "Químico", "Gás", "Vazamento"], caption:"Produtos pressurizados, inflamáveis, corrosivos ou tóxicos exigem avaliação antes do aceite." },
        { kind:"service", labels:["Explicar", "Recusar", "Orientar", "Registrar"], caption:"A recusa deve ser firme, respeitosa, baseada em segurança e registrada quando aplicável." },
        { kind:"flow", labels:["Isolar", "Comunicar", "Conter", "Histórico"], caption:"Incidente com DGR exige isolamento, comunicação imediata, ação coordenada e registro." }
    ],
    "comunicacao-operacional-aeroportuaria": [
        { kind:"flow", labels:["Clareza", "Precisão", "Confirma", "Registro"], caption:"Comunicação operacional precisa ser clara, confirmada e rastreável." },
        { kind:"service", labels:["Briefing", "Riscos", "Recursos", "Funções"], caption:"O briefing alinha equipe, prioridades, riscos e responsabilidades do turno." },
        { kind:"form", labels:["Pendência", "Prazo", "Ação", "Responsável"], caption:"Passagem de turno preserva contexto e evita perda de informação crítica." },
        { kind:"route", labels:["Voo", "Local", "Impacto", "Ação"], caption:"Mensagens em tempo real precisam indicar referência, impacto e ação solicitada." },
        { kind:"check", labels:["Fato", "Hora", "Decisão", "Histórico"], caption:"Registros transformam comunicação verbal em evidência operacional." },
        { kind:"security", labels:["Fonte", "Atualiza", "Escala", "Debrief"], caption:"Contingências exigem fonte única, atualização periódica e escalonamento." }
    ],
    "contestacao-operacional-aviacao": [
        { kind:"form", labels:["Fato", "Evidência", "Regra", "Decisão"], caption:"Contestação separa alegação, evidência, regra aplicável e conclusão técnica." },
        { kind:"check", labels:["Foto", "Etiqueta", "Histórico", "Recibo"], caption:"Evidências organizadas sustentam análise e reduzem retrabalho." },
        { kind:"flow", labels:["Prazo", "Vínculo", "Documento", "Canal"], caption:"Admissibilidade verifica prazo, legitimidade, duplicidade e documentos mínimos." },
        { kind:"match", labels:["Fato", "Nexo", "Causa", "Responsável"], caption:"Procedência depende de nexo causal, registros e responsabilidade operacional." },
        { kind:"service", labels:["Clareza", "Respeito", "Pontos", "Solução"], caption:"Resposta técnica deve ser objetiva, respeitosa e abordar toda a demanda." },
        { kind:"route", labels:["Indicador", "Causa", "Ação", "Prevenção"], caption:"Contestações revelam falhas recorrentes e oportunidades de melhoria." }
    ],
    "gestao-crise-aeroporto": [
        { kind:"security", labels:["Risco", "Impacto", "Controle", "Ação"], caption:"Crise aeroportuária exige recuperar controle, proteger pessoas e estabilizar a operação." },
        { kind:"flow", labels:["Líder", "Área", "Ação", "Registro"], caption:"Papéis claros evitam decisões isoladas e mensagens contraditórias." },
        { kind:"service", labels:["Fonte", "Equipe", "Pax", "Update"], caption:"Comunicação de crise precisa de fonte oficial, frequência e linguagem compreensível." },
        { kind:"service", labels:["Escuta", "Apoio", "Prioridade", "Respeito"], caption:"Atendimento humanizado reduz tensão e protege passageiros vulneráveis." },
        { kind:"route", labels:["Essencial", "Recurso", "Fluxo", "Retorno"], caption:"Continuidade operacional mantém serviços críticos e organiza a retomada." },
        { kind:"check", labels:["Treino", "Teste", "Lição", "Melhoria"], caption:"Simulações e debriefings transformam crise em aprendizado operacional." }
    ],
    "qualidade-indicadores-operacionais": [
        { kind:"check", labels:["Padrão", "SLA", "Registro", "Melhoria"], caption:"Qualidade operacional une serviço, segurança, rastreabilidade e melhoria contínua." },
        { kind:"form", labels:["Nome", "Meta", "Fonte", "Fórmula"], caption:"Indicadores precisam de definição clara para gerar decisão confiável." },
        { kind:"flow", labels:["Coleta", "Valida", "Padroniza", "Rastreia"], caption:"A confiabilidade do painel começa na qualidade do dado registrado." },
        { kind:"match", labels:["Desvio", "Causa", "Tendência", "Risco"], caption:"Análise identifica padrões, causa raiz e risco emergente." },
        { kind:"route", labels:["Painel", "Meta", "Alerta", "Decisão"], caption:"Dashboard bom mostra prioridade e orienta a ação do gestor." },
        { kind:"check", labels:["Ação", "Dono", "Prazo", "Eficácia"], caption:"Melhoria contínua exige plano de ação e verificação de resultado." }
    ],
    "introducao-operacao-rampa": [
        { kind:"route", labels:["Pátio", "Equipe", "Veículo", "Aeronave"], caption:"A rampa reúne pessoas, equipamentos e aeronaves em ambiente de risco elevado." },
        { kind:"security", labels:["EPI", "Motor", "Área", "Velocidade"], caption:"Segurança no pátio depende de distância, EPI, circulação correta e atenção." },
        { kind:"service", labels:["GSE", "Freio", "Calço", "Inspeção"], caption:"Equipamentos de solo devem ser inspecionados, posicionados e operados com autorização." },
        { kind:"flow", labels:["Chegada", "Serviço", "Embarque", "Saída"], caption:"Turnaround coordena várias etapas entre chegada e próxima partida da aeronave." },
        { kind:"case", labels:["Etiqueta", "Porão", "Conexão", "Carga"], caption:"Bagagem e carga exigem leitura, segregação, carregamento correto e reconciliação." },
        { kind:"check", labels:["FOD", "Clima", "Quase", "Reporte"], caption:"FOD, clima adverso e quase falhas devem ser prevenidos, comunicados e registrados." }
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

function cloudDataActive(){
    return state.useCloudData && state.cloudReady;
}

function readProgress(){
    if(cloudDataActive()){
        return state.cloudProgress;
    }

    return readJson(storageKey);
}

function saveProgress(progress){
    state.cloudProgress = progress || {};

    if(cloudDataActive()){
        return;
    }

    saveJson(storageKey, progress);
}

function readQuizResults(){
    if(cloudDataActive()){
        return state.cloudQuizResults;
    }

    return readJson(quizStorageKey);
}

function saveQuizResults(results){
    state.cloudQuizResults = results || {};

    if(cloudDataActive()){
        return;
    }

    saveJson(quizStorageKey, results);
}

function readCertificates(){
    if(cloudDataActive()){
        return state.cloudCertificates;
    }

    return readJson(certificateStorageKey);
}

function saveCertificates(certificates){
    state.cloudCertificates = certificates || {};

    if(cloudDataActive()){
        return;
    }

    saveJson(certificateStorageKey, certificates);
}

function courseProgress(course){
    const modules = courseModules(course);
    if(modules.length === 0){
        return 0;
    }

    const quizResult = readQuizResults()[course.id];
    const certificate = readCertificates()[course.id];

    if(
        certificate ||
        (quizResult && isApprovedPercent(quizResult.percent))
    ){
        return 100;
    }

    const progress = readProgress();
    const done = progress[course.id] || [];
    const lessonPercent = Math.round((done.length / modules.length) * 100);

    return Math.min(lessonPercent, 90);
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

const portugueseAccentMap = [
    ["Avaliacao", "Avaliação"], ["avaliacao", "avaliação"],
    ["Conclusao", "Conclusão"], ["conclusao", "conclusão"],
    ["Codigo", "Código"], ["codigo", "código"], ["Codigos", "Códigos"], ["codigos", "códigos"],
    ["Conteudo", "Conteúdo"], ["conteudo", "conteúdo"],
    ["Endereco", "Endereço"], ["endereco", "endereço"],
    ["Obrigatorios", "Obrigatórios"], ["obrigatorios", "obrigatórios"],
    ["Caracteristicas", "Características"], ["caracteristicas", "características"],
    ["Identificacao", "Identificação"], ["identificacao", "identificação"],
    ["Solicitacao", "Solicitação"], ["solicitacao", "solicitação"],
    ["Historico", "Histórico"], ["historico", "histórico"],
    ["Localizacao", "Localização"], ["localizacao", "localização"],
    ["Danificacao", "Danificação"], ["danificacao", "danificação"],
    ["Aviacao", "Aviação"], ["aviacao", "aviação"],
    ["Seguranca", "Segurança"], ["seguranca", "segurança"],
    ["Aeroportuaria", "Aeroportuária"], ["aeroportuaria", "aeroportuária"],
    ["Operacao", "Operação"], ["operacao", "operação"],
    ["Operacional", "Operacional"], ["operacional", "operacional"],
    ["Pratica", "Prática"], ["pratica", "prática"], ["Praticas", "Práticas"], ["praticas", "práticas"],
    ["Simulacao", "Simulação"], ["simulacao", "simulação"],
    ["Introducao", "Introdução"], ["introducao", "introdução"],
    ["Preparacao", "Preparação"], ["preparacao", "preparação"],
    ["Protecao", "Proteção"], ["protecao", "proteção"],
    ["Prevencao", "Prevenção"], ["prevencao", "prevenção"],
    ["Inspecao", "Inspeção"], ["inspecao", "inspeção"],
    ["Reclamacoes", "Reclamações"], ["reclamacoes", "reclamações"],
    ["Excecao", "Exceção"], ["excecao", "exceção"],
    ["Conexao", "Conexão"], ["conexao", "conexão"], ["Conexoes", "Conexões"], ["conexoes", "conexões"],
    ["Alfandega", "Alfândega"], ["alfandega", "alfândega"],
    ["Analise", "Análise"], ["analise", "análise"],
    ["Restricoes", "Restrições"], ["restricoes", "restrições"],
    ["Aplicavel", "Aplicável"], ["aplicavel", "aplicável"],
    ["Ameaca", "Ameaça"], ["ameaca", "ameaça"],
    ["Area", "Área"], ["area", "área"],
    ["Instalacoes", "Instalações"], ["instalacoes", "instalações"],
    ["Ilicita", "Ilícita"], ["ilicita", "ilícita"],
    ["Responsaveis", "Responsáveis"], ["responsaveis", "responsáveis"],
    ["Solucao", "Solução"], ["solucao", "solução"],
    ["Experiencia", "Experiência"], ["experiencia", "experiência"],
    ["Satisfatoria", "Satisfatória"], ["satisfatoria", "satisfatória"],
    ["Padrao", "Padrão"], ["padrao", "padrão"], ["Padroes", "Padrões"], ["padroes", "padrões"],
    ["Eficiencia", "Eficiência"], ["eficiencia", "eficiência"],
    ["Agilidade", "Agilidade"], ["agilidade", "agilidade"],
    ["Formulario", "Formulário"], ["formulario", "formulário"],
    ["Compensacao", "Compensação"], ["compensacao", "compensação"],
    ["Decisao", "Decisão"], ["decisao", "decisão"],
    ["Continuo", "Contínuo"], ["continuo", "contínuo"], ["Continua", "Contínua"], ["continua", "contínua"],
    ["Disponiveis", "Disponíveis"], ["disponiveis", "disponíveis"],
    ["Condicao", "Condição"], ["condicao", "condição"],
    ["Lideranca", "Liderança"], ["lideranca", "liderança"],
    ["Lider", "Líder"], ["lider", "líder"],
    ["Escritorio", "Escritório"], ["escritorio", "escritório"],
    ["Criterio", "Critério"], ["criterio", "critério"],
    ["Sugestoes", "Sugestões"], ["sugestoes", "sugestões"],
    ["Orientacao", "Orientação"], ["orientacao", "orientação"],
    ["Comunicacao", "Comunicação"], ["comunicacao", "comunicação"],
    ["Patio", "Pátio"], ["patio", "pátio"],
    ["Pressao", "Pressão"], ["pressao", "pressão"],
    ["Radio", "Rádio"], ["radio", "rádio"],
    ["Rapida", "Rápida"], ["rapida", "rápida"], ["Rapido", "Rápido"], ["rapido", "rápido"],
    ["Concisao", "Concisão"], ["concisao", "concisão"],
    ["Confirmacao", "Confirmação"], ["confirmacao", "confirmação"],
    ["Posicao", "Posição"], ["posicao", "posição"],
    ["Possivel", "Possível"], ["possivel", "possível"],
    ["Pagina", "Página"], ["pagina", "página"],
    ["Opcao", "Opção"], ["opcao", "opção"],
    ["Botao", "Botão"], ["botao", "botão"],
    ["Funcao", "Função"], ["funcao", "função"],
    ["Automatica", "Automática"], ["automatica", "automática"], ["Automatico", "Automático"], ["automatico", "automático"],
    ["Minimo", "Mínimo"], ["minimo", "mínimo"],
    ["Proxima", "Próxima"], ["proxima", "próxima"], ["Proximo", "Próximo"], ["proximo", "próximo"],
    ["Concluido", "Concluído"], ["concluido", "concluído"],
    ["Concluida", "Concluída"], ["concluida", "concluída"],
    ["Voce", "Você"], ["voce", "você"],
    ["Nao", "Não"], ["nao", "não"],
    ["Esta", "Está"], ["esta", "está"],
    ["Ja", "Já"], ["ja", "já"],
    ["Duvida", "Dúvida"], ["duvida", "dúvida"],
    ["Verificacao", "Verificação"], ["verificacao", "verificação"],
    ["Exercicio", "Exercício"], ["exercicio", "exercício"],
    ["Aplicacao", "Aplicação"], ["aplicacao", "aplicação"]
];

function applyPortugueseAccents(value){
    if(window.LealText && typeof LealText.apply === "function"){
        return LealText.apply(value);
    }

    let text = String(value ?? "");

    portugueseAccentMap.forEach(([plain, accented]) => {
        text = text.replace(new RegExp(`\\b${plain}\\b`, "g"), accented);
    });

    return text;
}

function escapeHtml(value){
    return applyPortugueseAccents(value)
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
            content: course.summary || "Conteúdo em preparação."
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
        flow: ["Entrada", "Análise", "Ação", "Conclusão"]
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
                    <span>${escapeHtml(course.eyebrow)}</span>
                    <h2>${escapeHtml(course.title)}</h2>
                    <p>${escapeHtml(course.summary)}</p>
                    <div class="course-card-footer">
                        <strong>${courseModules(course).length} trilhas</strong>
                        <small>${percent}% concluído</small>
                        <small>Conteúdo curado</small>
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

    document.getElementById("courseEyebrow").textContent = applyPortugueseAccents(course.eyebrow);
    document.getElementById("courseTitle").textContent = applyPortugueseAccents(course.title);
    document.getElementById("courseSummary").textContent = applyPortugueseAccents(course.summary);
    document.getElementById("courseDuration").textContent = applyPortugueseAccents(course.duration);
    document.getElementById("courseLevel").textContent = applyPortugueseAccents(course.level);
    document.getElementById("courseProgress").textContent = `${courseProgress(course)}% concluído`;
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
        const checked = done.includes(index) ? "Concluída" : "Pendente";

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
            <span>Você está na trilha ${current} de ${modules.length}</span>
            <strong>${escapeHtml(currentModule(course).title)}</strong>
            <p>${done.length} de ${modules.length} trilhas concluídas.</p>
        </div>

        <div class="course-guide-actions">
            <button class="secondary-action" id="goFirstPending" type="button">
                ${nextPending >= 0 ? "Continuar pendente" : "Revisar curso"}
            </button>
            <button class="primary-action" id="goAssessment" type="button">
                Ir para avaliação
            </button>
        </div>
    `;

    document.getElementById("goFirstPending")?.addEventListener("click", () => {
        state.selectedModuleIndex = nextPending >= 0 ? nextPending : 0;
        renderCoursePage();
        document.getElementById("lessonPanel")?.scrollIntoView({ behavior:"smooth", block:"start" });
    });

    document.getElementById("goAssessment")?.addEventListener("click", () => openAssessmentWindow(course));
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
    const contentLabel = "Conteúdo da trilha";
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
            <button class="primary-action" id="completeLesson" type="button">Marcar como concluída</button>
            <button class="primary-action" id="nextLesson" type="button" ${hasNext ? "" : "disabled"}>Próxima trilha</button>
            <button class="secondary-action" id="resetCourse" type="button">Reiniciar progresso</button>
        </div>
        <nav class="lesson-quick-nav" aria-label="Navegação rápida da trilha">
            <a class="secondary-action" href="academy.html">Voltar aos cursos</a>
            <button class="secondary-action" id="lessonBackToTracks" type="button">Ver trilhas</button>
            <button class="primary-action" id="lessonBackToTop" type="button">Voltar ao topo</button>
        </nav>
    `;

    document.getElementById("previousLesson")?.addEventListener("click", () => {
        if(!hasPrevious){
            return;
        }

        state.selectedModuleIndex -= 1;
        renderCoursePage();
        document.getElementById("lessonPanel")?.scrollIntoView({ behavior:"smooth", block:"start" });
    });

    document.getElementById("completeLesson").addEventListener("click", async () => {
        const progress = readProgress();
        const done = new Set(progress[course.id] || []);
        done.add(state.selectedModuleIndex);
        const completedLessons = [...done].sort((a, b) => a - b);

        if(window.AccessControl && typeof AccessControl.syncCourseProgress === "function"){
            const saved = await AccessControl.syncCourseProgress(course, completedLessons);

            if(!saved){
                alert("Não foi possível salvar o progresso no Supabase. Tente novamente.");
                return;
            }

            await syncCloudAcademyDataFromSupabase();
        }
        else{
            progress[course.id] = completedLessons;
            saveProgress(progress);
        }

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

    document.getElementById("resetCourse").addEventListener("click", async () => {
        const progress = readProgress();

        if(window.AccessControl && typeof AccessControl.syncCourseProgress === "function"){
            const saved = await AccessControl.syncCourseProgress(course, []);

            if(!saved){
                alert("Não foi possível reiniciar o progresso no Supabase. Tente novamente.");
                return;
            }

            await syncCloudAcademyDataFromSupabase();
        }
        else{
            progress[course.id] = [];
            saveProgress(progress);
        }

        renderCoursePage();
    });

    const lessonBackToTracks = document.getElementById("lessonBackToTracks");
    const lessonBackToTop = document.getElementById("lessonBackToTop");

    if(lessonBackToTracks){
        lessonBackToTracks.onclick = () => {
            document.getElementById("trackGrid")?.scrollIntoView({ behavior:"smooth", block:"start" });
        };
    }

    if(lessonBackToTop){
        lessonBackToTop.onclick = () => {
            window.scrollTo({ top:0, behavior:"smooth" });
        };
    }

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

function gradeFromPercent(percent){
    return Math.round((Number(percent) || 0)) / 10;
}

function formatGrade(percent){
    const grade = gradeFromPercent(percent);
    return Number.isInteger(grade) ? String(grade) : grade.toFixed(1);
}

function isApprovedPercent(percent){
    return Number(percent) >= minimumApprovalPercent;
}

function certificatePercentValue(certificate){
    if(certificate.percent !== undefined){
        return Number(certificate.percent) || 0;
    }

    const storedScore = Number(certificate.score) || 0;
    return storedScore > 10 ? storedScore : Math.round(storedScore * 10);
}

function certificateGradeValue(certificate){
    if(certificate.grade !== undefined){
        return String(certificate.grade);
    }

    const storedScore = Number(certificate.score) || 0;
    return storedScore > 10 ? formatGrade(storedScore) : formatGrade(storedScore * 10);
}

function academyCurrentUserProfile(){
    if(window.AccessControl && typeof AccessControl.readLocalProfile === "function"){
        const profile = AccessControl.readLocalProfile();

        if(profile && (profile.name || profile.email)){
            return {
                name: profile.name || "Aluno Leal Academy",
                email: profile.email || ""
            };
        }
    }

    if(window.AcademyAuth && typeof AcademyAuth.getProfile === "function"){
        const profile = AcademyAuth.getProfile();

        if(profile && (profile.name || profile.email)){
            return {
                name: profile.name || "Aluno Leal Academy",
                email: profile.email || ""
            };
        }
    }

    return {
        name: academyCurrentUserName() || "Aluno Leal Academy",
        email: ""
    };
}

function quizReview(course, questions, answers){
    return questions.map((question, index) => {
        const selectedIndex = Number(answers[index]);
        const correctIndex = Number(question.correct);

        return {
            index,
            question: question.question,
            selectedIndex,
            selectedAnswer: question.options[selectedIndex] || "Sem resposta",
            correctIndex,
            correctAnswer: question.options[correctIndex] || "Resposta não cadastrada",
            correct: selectedIndex === correctIndex
        };
    });
}

function certificateId(course, issuedAt){
    const prefix = String(course.id || "curso")
        .toUpperCase()
        .replace(/[^A-Z0-9]/g, "")
        .slice(0, 10);

    return `LA-${prefix}-${new Date(issuedAt).getTime().toString(36).toUpperCase()}`;
}

function issueCertificate(course, score, issuedAt = new Date().toISOString()){
    const profile = academyCurrentUserProfile();
    const certificate = {
        id: certificateId(course, issuedAt),
        courseId: course.id,
        courseTitle: course.title,
        studentName: profile.name,
        studentEmail: profile.email,
        score: formatGrade(score.percent),
        grade: formatGrade(score.percent),
        percent: score.percent,
        correct: score.correct,
        total: score.total,
        issuedAt
    };
    const certificates = readCertificates();
    certificates[course.id] = certificate;
    saveCertificates(certificates);

    if(window.AccessControl && typeof AccessControl.recordCertificate === "function"){
        AccessControl.recordCertificate(certificate);
    }

    return certificate;
}

function ensureCertificate(course, savedResult){
    const certificates = readCertificates();

    if(certificates[course.id]){
        if(window.AccessControl && typeof AccessControl.recordCertificate === "function"){
            AccessControl.recordCertificate(certificates[course.id]);
        }

        return certificates[course.id];
    }

    if(!savedResult || !isApprovedPercent(savedResult.percent)){
        return null;
    }

    return issueCertificate(
        course,
        {
            percent:Number(savedResult.percent) || 0,
            correct:Number(savedResult.correct) || 0,
            total:Number(savedResult.total) || normalizeQuiz(course).length
        },
        savedResult.finishedAt || new Date().toISOString()
    );
}

async function syncCloudAcademyDataFromSupabase(){
    if(
        !window.AccessControl ||
        typeof AccessControl.loadAcademyCloudData !== "function" ||
        typeof AccessControl.session !== "function"
    ){
        return;
    }

    const currentSession = await AccessControl.session();

    if(!currentSession){
        state.cloudReady = false;
        state.useCloudData = false;
        return;
    }

    const cloudData = await AccessControl.loadAcademyCloudData();

    if(!cloudData){
        return;
    }

    state.cloudProgress = { ...(cloudData.progress || {}) };
    state.cloudQuizResults = { ...(cloudData.quizResults || {}) };
    state.cloudCertificates = { ...(cloudData.certificates || {}) };
    state.pendingQuizCloudSync = {};
    state.useCloudData = true;
    state.cloudReady = true;
}

async function syncSessionAcademyDataToSupabase(){
    if(!window.AccessControl){
        return;
    }

    const progress = readProgress();
    const certificates = readCertificates();
    const quizResults = readQuizResults();
    const syncedAttempts = readJson("airportBaggageAcademySyncedAttempts");

    for(const course of academyCourses){
        const completedLessons = Array.isArray(progress[course.id])
            ? progress[course.id]
            : [];

        if(completedLessons.length > 0 && typeof AccessControl.syncCourseProgress === "function"){
            await AccessControl.syncCourseProgress(course, completedLessons);
        }

        const certificate = certificates[course.id];

        if(certificate && typeof AccessControl.recordCertificate === "function"){
            await AccessControl.recordCertificate(certificate);
        }

        const result = cloudDataActive()
            ? state.pendingQuizCloudSync[course.id]
            : quizResults[course.id];

        if(result && typeof AccessControl.recordQuizAttempt === "function"){
            const attemptKey = [
                course.id,
                result.finishedAt || "",
                result.percent ?? "",
                result.correct ?? "",
                result.total ?? ""
            ].join("|");

            if(!syncedAttempts[attemptKey]){
                await AccessControl.recordQuizAttempt(course, {
                    correct: result.correct,
                    total: result.total,
                    percent: result.percent,
                    grade: formatGrade(result.percent),
                    approved: result.approved,
                    review: result.review || []
                });

                syncedAttempts[attemptKey] = true;
                delete state.pendingQuizCloudSync[course.id];
            }
        }
    }

    saveJson("airportBaggageAcademySyncedAttempts", syncedAttempts);
}

function certificatePageUrl(courseId){
    return `certificate.html?id=${encodeURIComponent(courseId)}`;
}

function renderQuizReview(review){
    const incorrect = review.filter(item => !item.correct);

    if(incorrect.length === 0){
        return `
            <div class="assessment-review assessment-review-clean">
                Todas as questoes foram respondidas corretamente.
            </div>
        `;
    }

    return `
        <section class="assessment-review">
            <h3>Questoes incorretas</h3>

            <div class="assessment-wrong-list">
                ${incorrect.map(item => `
                    <article class="assessment-wrong-card">
                        <strong>${item.index + 1}. ${escapeHtml(item.question)}</strong>
                        <p><span>Sua resposta:</span> ${escapeHtml(item.selectedAnswer)}</p>
                        <p><span>Resposta correta:</span> ${escapeHtml(item.correctAnswer)}</p>
                    </article>
                `).join("")}
            </div>
        </section>
    `;
}

function certificateHtml(certificate, course){
    const issuedDate = new Date(certificate.issuedAt).toLocaleDateString("pt-BR", {
        day:"2-digit",
        month:"long",
        year:"numeric"
    });
    const certificatePercent = certificatePercentValue(certificate);
    const certificateGrade = certificateGradeValue(certificate);
    const studentName = applyPortugueseAccents(certificate.studentName || "Aluno Leal Academy");
    const courseTitle = applyPortugueseAccents(certificate.courseTitle || course?.title || "Curso Leal Academy");
    const issuedDateText = applyPortugueseAccents(issuedDate);
    const certificateCode = applyPortugueseAccents(certificate.id || "");
    const studentEmail = certificate.studentEmail || "E-mail não informado";

    return `
        <article class="certificate-document">
            <div class="certificate-border">
                <header class="certificate-top">
                    <img src="../assets/brand/leal-academy-logo.png" alt="Leal Academy">
                    <div>
                        <span>Leal Academy</span>
                        <strong>Certificado de Conclusão</strong>
                    </div>
                </header>

                <section class="certificate-body">
                    <span class="certificate-kicker">Treinamento Operacional em Aviação Civil</span>
                    <h1>${escapeHtml(studentName)}</h1>
                    <p>
                        concluiu com aproveitamento o curso
                        <strong>${escapeHtml(courseTitle)}</strong>,
                        obtendo nota final <strong>${escapeHtml(certificateGrade)}</strong>
                        (${certificatePercent}% - ${certificate.correct}/${certificate.total} acertos).
                    </p>
                </section>

                <footer class="certificate-footer">
                    <div>
                        <span>Emitido em</span>
                        <strong>${escapeHtml(issuedDateText)}</strong>
                    </div>

                    <div>
                        <span>Código</span>
                        <strong>${escapeHtml(certificateCode)}</strong>
                    </div>

                    <div>
                        <span>Aluno</span>
                        <strong>${escapeHtml(studentEmail)}</strong>
                    </div>
                </footer>

                <div class="certificate-runway" aria-hidden="true">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
        </article>
    `;
}

function certificateDownloadHtml(certificate, course){
    const logoUrl = new URL("../assets/brand/leal-academy-logo.png", window.location.href).href;
    const documentHtml = certificateHtml(certificate, course)
        .replace("../assets/brand/leal-academy-logo.png", logoUrl);
    const pageTitle = applyPortugueseAccents(certificate.courseTitle || course?.title || "Certificado");

    return `<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${escapeHtml(pageTitle)} - Certificado Leal Academy</title>
    <style>
        *{box-sizing:border-box}
        body{margin:0;padding:28px;background:#e6eef4;color:#0f172a;font-family:Arial,Helvetica,sans-serif}
        .certificate-document{max-width:1120px;margin:0 auto;background:#fff;border:1px solid #cbd5e1;border-radius:24px;padding:18px;box-shadow:0 24px 60px rgba(15,23,42,.14)}
        .certificate-border{position:relative;overflow:hidden;min-height:640px;border:3px solid #0f766e;border-radius:18px;padding:42px;background:linear-gradient(135deg,rgba(15,118,110,.08),rgba(255,255,255,.95) 42%,rgba(14,165,233,.1)),radial-gradient(circle at 88% 16%,rgba(14,116,144,.16),transparent 32%),#fff}
        .certificate-border:before{content:"";position:absolute;inset:22px;border:1px solid rgba(15,118,110,.25);border-radius:12px;pointer-events:none}
        .certificate-top{position:relative;z-index:1;display:flex;align-items:center;gap:18px}
        .certificate-top img{width:92px;height:92px;object-fit:contain;border-radius:18px;background:#fff;box-shadow:0 12px 30px rgba(15,23,42,.12)}
        .certificate-top span{display:block;color:#0f766e;font-weight:900;letter-spacing:.12em;text-transform:uppercase}
        .certificate-top strong{display:block;margin-top:5px;color:#0f172a;font-size:48px;line-height:1.05}
        .certificate-body{position:relative;z-index:1;max-width:860px;margin:70px auto 60px;text-align:center}
        .certificate-kicker{display:inline-flex;border:1px solid #99f6e4;border-radius:999px;background:#ecfdf5;color:#047857;font-weight:900;letter-spacing:.08em;text-transform:uppercase;padding:8px 14px}
        .certificate-body h1{margin:28px 0 18px;color:#082f49;font-size:72px;line-height:1;font-family:Georgia,"Times New Roman",serif}
        .certificate-body p{margin:0 auto;max-width:760px;color:#334155;font-size:24px;line-height:1.55}
        .certificate-body p strong{color:#0f766e}
        .certificate-footer{position:relative;z-index:1;display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:16px;margin-top:52px}
        .certificate-footer div{border-top:2px solid #0f766e;padding-top:12px}
        .certificate-footer span{display:block;color:#64748b;font-size:12px;font-weight:900;letter-spacing:.08em;text-transform:uppercase}
        .certificate-footer strong{display:block;margin-top:4px;color:#0f172a;overflow-wrap:anywhere}
        .certificate-runway{position:absolute;right:-80px;bottom:-90px;width:420px;height:260px;border-radius:50%;background:linear-gradient(135deg,rgba(8,47,73,.95),rgba(15,118,110,.88));transform:rotate(-12deg);opacity:.95}
        .certificate-runway span{position:absolute;left:86px;right:86px;height:5px;background:rgba(255,255,255,.84);border-radius:999px}
        .certificate-runway span:nth-child(1){top:82px}.certificate-runway span:nth-child(2){top:128px}.certificate-runway span:nth-child(3){top:174px}
        .download-note{max-width:1120px;margin:18px auto 0;color:#475569;font-weight:700;text-align:center}
        @media print{body{background:#fff;padding:0}.certificate-document{box-shadow:none;border:0;border-radius:0;padding:0}.download-note{display:none}.certificate-border{min-height:92vh}}
    </style>
</head>
<body>
    ${documentHtml}
    <p class="download-note">Certificado baixado da Leal Academy. Para gerar PDF, use Ctrl+P e selecione Salvar como PDF.</p>
</body>
</html>`;
}

function downloadCertificate(certificate, course){
    if(!certificate){
        alert("Nenhum certificado emitido para baixar.");
        return;
    }

    const safeName = String(certificate.courseTitle || "certificado")
        .normalize("NFD")
        .replace(/[\u0300-\u036f]/g, "")
        .replace(/[^a-zA-Z0-9]+/g, "-")
        .replace(/^-|-$/g, "")
        .toLowerCase();
    const fileName = `certificado-leal-academy-${safeName || "curso"}-${certificate.id}.html`;
    const blob = new Blob([certificateDownloadHtml(certificate, course)], { type:"text/html;charset=utf-8" });
    const url = URL.createObjectURL(blob);
    const link = document.createElement("a");
    link.href = url;
    link.download = fileName;
    document.body.appendChild(link);
    link.click();
    link.remove();
    URL.revokeObjectURL(url);
}

function openMailClient(certificate){
    if(!certificate.studentEmail){
        alert("Não existe e-mail cadastrado para este aluno.");
        return;
    }

    const subject = encodeURIComponent(`Certificado Leal Academy - ${certificate.courseTitle}`);
    const certificatePercent = certificatePercentValue(certificate);
    const certificateGrade = certificateGradeValue(certificate);
    const body = encodeURIComponent([
        `Ola, ${certificate.studentName}.`,
        "",
        `Seu certificado do curso ${certificate.courseTitle} foi emitido.`,
        `Nota: ${certificateGrade} (${certificatePercent}% - ${certificate.correct}/${certificate.total} acertos).`,
        `Código do certificado: ${certificate.id}`,
        "",
        "Abra a página do certificado na plataforma e use a opção Imprimir / Salvar em PDF para anexar ao e-mail."
    ].join("\n"));

    window.location.href = `mailto:${encodeURIComponent(certificate.studentEmail)}?subject=${subject}&body=${body}`;
}

async function sendCertificateEmail(certificate){
    if(!certificate || !certificate.studentEmail){
        return {
            sent:false,
            message:"Certificado emitido. Cadastre um e-mail para preparar o envio."
        };
    }

    if(typeof supabaseClient !== "undefined" && supabaseClient.functions && typeof supabaseClient.functions.invoke === "function"){
        try{
            const { error } = await supabaseClient.functions.invoke("send-certificate", {
                body: { certificate }
            });

            if(!error){
                return {
                    sent:true,
                    message:`Certificado enviado para ${certificate.studentEmail}.`
                };
            }
        }catch(error){
            console.warn("Envio automático de certificado indisponível:", error);
        }
    }

    return {
        sent:false,
        message:`Certificado emitido para ${certificate.studentEmail}. Use o botão de e-mail enquanto a função automática não estiver configurada.`
    };
}

function renderAssessmentResult(course, score, review, certificate, emailStatus){
    const approved = isApprovedPercent(score.percent);
    const grade = formatGrade(score.percent);
    const certificateBlock = approved && certificate
        ? `
            <section class="certificate-result-card">
                <div>
                    <span>Certificado emitido</span>
                    <strong>${escapeHtml(certificate.id)}</strong>
                    <p>
                        Aluno: ${escapeHtml(certificate.studentName)}
                        ${certificate.studentEmail ? ` | ${escapeHtml(certificate.studentEmail)}` : ""}
                    </p>
                    <small>${escapeHtml(emailStatus || "Envio automático preparado. Use o botão de e-mail se a função de envio não estiver configurada.")}</small>
                </div>

                <div class="certificate-actions">
                    <a class="primary-action" href="${certificatePageUrl(course.id)}" target="_blank" rel="noopener">
                        Abrir certificado
                    </a>
                    <button class="secondary-action" type="button" id="downloadCertificate">
                        Baixar certificado
                    </button>
                    <button class="secondary-action" type="button" id="emailCertificate">
                        Enviar por e-mail
                    </button>
                </div>
            </section>
        `
        : "";

    return `
        <section class="assessment-result ${approved ? "approved" : "failed"}">
            <div>
                <span>${approved ? "Aprovado" : "Não aprovado"}</span>
                <strong>Nota: ${grade} | Resultado: ${score.correct}/${score.total} - ${score.percent}%</strong>
                <p>${approved ? "Parabéns. O certificado foi liberado para este curso." : "Revise as trilhas e refaça a avaliação para atingir nota mínima 8.0."}</p>
            </div>
        </section>

        ${renderQuizReview(review)}
        ${certificateBlock}
    `;
}

function openAssessmentWindow(course){
    const questions = normalizeQuiz(course);

    if(questions.length === 0){
        alert("Este curso ainda não possui avaliação cadastrada.");
        return;
    }

    const confirmed = window.confirm("Iniciar a prova?");

    if(!confirmed){
        return;
    }

    window.open(
        `assessment.html?id=${encodeURIComponent(course.id)}`,
        "_blank",
        "noopener"
    );
}

function renderAssessment(course){
    const container = document.getElementById("assessmentPanel");

    if(!container){
        return;
    }

    const questions = normalizeQuiz(course);

    if(questions.length === 0){
        container.innerHTML = `<div class="assessment-empty">Este curso ainda não possui avaliação cadastrada.</div>`;
        return;
    }

    const saved = readQuizResults()[course.id];
    const isStandalone = document.body.classList.contains("assessment-page");
    const isOpen = Boolean(state.assessmentOpen[course.id]);
    const savedCertificate = ensureCertificate(course, saved);
    const savedApproved = Boolean(savedCertificate);

    if(!isStandalone && !isOpen){
        container.innerHTML = `
            <article class="assessment-start-card">
                <div>
                    <span>Avaliação</span>
                    <strong>${questions.length} perguntas</strong>
                    <p>${saved ? `Último resultado: nota ${formatGrade(saved.percent)} (${saved.percent}%)` : "A prova ainda não foi iniciada neste curso."}</p>
                </div>

                <div class="assessment-start-actions">
                    <button class="primary-action" id="startAssessment" type="button">
                        ${savedApproved ? "Refazer prova" : "Iniciar prova"}
                    </button>

                    ${savedApproved ? `
                        <a class="secondary-action" href="${certificatePageUrl(course.id)}" target="_blank" rel="noopener">
                            Abrir certificado
                        </a>
                        <button class="secondary-action" id="downloadSavedCertificate" type="button">
                            Baixar certificado
                        </button>
                        <button class="secondary-action" id="emailSavedCertificate" type="button">
                            Enviar por e-mail
                        </button>
                    ` : ""}
                </div>
            </article>
        `;

        document.getElementById("startAssessment")?.addEventListener("click", () => openAssessmentWindow(course));
        document.getElementById("downloadSavedCertificate")?.addEventListener("click", () => {
            downloadCertificate(savedCertificate, course);
        });
        document.getElementById("emailSavedCertificate")?.addEventListener("click", () => {
            openMailClient(savedCertificate);
        });

        return;
    }

    container.innerHTML = `
        <details class="assessment-expander ${isStandalone ? "assessment-fullscreen-card" : ""}" open>
            <summary>
                <span>${isStandalone ? "Prova em tela cheia" : "Avaliação em andamento"}</span>
                <strong>${questions.length} perguntas</strong>
                <small id="assessmentScore">${saved ? `Último: ${saved.percent}%` : "Não finalizada"}</small>
            </summary>

            <div class="quiz-list compact">
                ${questions.map((question, questionIndex) => `
                    <article class="quiz-card">
                        <h3 class="quiz-question-title">
                            <span>${questionIndex + 1}</span>
                            <strong>${escapeHtml(question.question || `Questão ${questionIndex + 1}`)}</strong>
                        </h3>
                        <div class="quiz-options">
                            ${question.options.map((option, optionIndex) => {
                                const selected = (state.quizAnswers[course.id] || {})[questionIndex] === optionIndex ? "selected" : "";
                                return `<button class="quiz-option ${selected}" type="button" data-question="${questionIndex}" data-option="${optionIndex}">${escapeHtml(option)}</button>`;
                            }).join("")}
                        </div>
                    </article>
                `).join("")}
            </div>

            <div class="lesson-actions assessment-actions">
                <button class="primary-action" id="finishQuiz" type="button">Finalizar avaliação</button>
                <button class="secondary-action" id="clearQuiz" type="button">Limpar respostas</button>
                <button class="secondary-action" id="closeAssessment" type="button">${isStandalone ? "Fechar aba" : "Fechar prova"}</button>
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

    document.getElementById("finishQuiz")?.addEventListener("click", async () => {
        const answers = state.quizAnswers[course.id] || {};
        if(Object.keys(answers).length < questions.length){
            document.getElementById("assessmentFeedback").textContent = "Responda todas as perguntas antes de finalizar.";
            return;
        }

        const score = quizScore(course);
        const review = quizReview(course, questions, answers);
        const approved = isApprovedPercent(score.percent);
        const certificate = approved ? issueCertificate(course, score) : null;
        const results = readQuizResults();
        results[course.id] = {
            correct: score.correct,
            total: score.total,
            percent: score.percent,
            finishedAt: new Date().toISOString(),
            approved,
            review
        };
        saveQuizResults(results);

        if(window.AccessControl && typeof AccessControl.recordQuizAttempt === "function"){
            await AccessControl.recordQuizAttempt(course, {
                correct: score.correct,
                total: score.total,
                percent: score.percent,
                grade: formatGrade(score.percent),
                approved,
                review
            });
        }

        if(
            certificate &&
            window.AccessControl &&
            typeof AccessControl.recordCertificate === "function"
        ){
            await AccessControl.recordCertificate(certificate);
            await syncCloudAcademyDataFromSupabase();
        }

        const emailStatus = certificate
            ? await sendCertificateEmail(certificate)
            : null;
        document.getElementById("assessmentScore").textContent = `Nota: ${formatGrade(score.percent)} | Resultado: ${score.correct}/${score.total} - ${score.percent}%`;
        document.getElementById("assessmentFeedback").innerHTML = renderAssessmentResult(
            course,
            score,
            review,
            certificate,
            emailStatus?.message || ""
        );

        document.getElementById("emailCertificate")?.addEventListener("click", () => {
            openMailClient(certificate);
        });

        document.getElementById("downloadCertificate")?.addEventListener("click", () => {
            downloadCertificate(certificate, course);
        });
    });

    document.getElementById("clearQuiz")?.addEventListener("click", () => {
        state.quizAnswers[course.id] = {};
        renderAssessment(course);
    });

    document.getElementById("closeAssessment")?.addEventListener("click", () => {
        if(isStandalone){
            window.close();
            return;
        }

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

    if(!state.trackedCourses[course.id] && window.AccessControl && typeof AccessControl.recordEvent === "function"){
        state.trackedCourses[course.id] = true;
        AccessControl.recordEvent("course_view", {
            courseId: course.id,
            courseTitle: course.title,
            metadata:{
                progress: courseProgress(course)
            }
        });
    }

    renderCourseHeader(course);
    renderCourseGuide(course);
    renderTracks(course);
    renderLesson(course);
    renderCourseNavigator(course);
    renderLabs(course);
    renderAssessment(course);
}

function renderCertificatePage(){
    initializeCourseFromUrl();
    const course = selectedCourse();
    const container = document.getElementById("certificatePanel");
    const title = document.getElementById("certificateCourseTitle");
    const meta = document.getElementById("certificateCourseMeta");

    if(!container){
        return;
    }

    if(!course){
        container.innerHTML = `<div class="assessment-empty">Curso não encontrado.</div>`;
        return;
    }

    const certificate = readCertificates()[course.id];

    if(title){
        title.textContent = "Certificado";
    }

    if(meta){
        meta.textContent = applyPortugueseAccents(course.title);
    }

    if(!certificate){
        container.innerHTML = `
            <div class="assessment-empty">
                Nenhum certificado emitido para este curso. Conclua a avaliação com aproveitamento mínimo de 80% (nota 8.0).
            </div>
        `;
        return;
    }

    container.innerHTML = `
        <div class="certificate-page-actions">
            <button class="primary-action" id="downloadCertificatePage" type="button">
                Baixar certificado
            </button>
            <button class="primary-action" id="printCertificate" type="button">
                Imprimir / Salvar PDF
            </button>
            <button class="secondary-action" id="emailCertificatePage" type="button">
                Enviar por e-mail
            </button>
            <button class="secondary-action" type="button" onclick="window.close()">
                Fechar aba
            </button>
        </div>

        ${certificateHtml(certificate, course)}
    `;

    document.getElementById("printCertificate")?.addEventListener("click", () => window.print());
    document.getElementById("downloadCertificatePage")?.addEventListener("click", () => downloadCertificate(certificate, course));
    document.getElementById("emailCertificatePage")?.addEventListener("click", () => openMailClient(certificate));
}

async function bootAcademy(){
    await syncCloudAcademyDataFromSupabase();

    if(document.getElementById("courseGrid")){
        renderHome();
        return;
    }

    if(document.body.classList.contains("assessment-page")){
        initializeCourseFromUrl();
        const course = selectedCourse();
        const title = document.getElementById("assessmentCourseTitle");
        const meta = document.getElementById("assessmentCourseMeta");

        if(title){
            title.textContent = course ? applyPortugueseAccents(course.title) : "Avaliação";
        }

        if(meta && course){
            meta.textContent = `${normalizeQuiz(course).length} perguntas | ${course.level} | ${course.duration}`;
        }

        renderAssessment(course);
        return;
    }

    if(document.body.classList.contains("certificate-page")){
        renderCertificatePage();
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





















