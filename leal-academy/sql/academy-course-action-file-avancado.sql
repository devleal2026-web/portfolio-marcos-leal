grant usage on schema public to anon, authenticated;
grant select on public.academy_courses to anon, authenticated;

alter table public.academy_courses
    add column if not exists category text;

alter table public.academy_courses enable row level security;

drop policy if exists "academy_courses_select_all" on public.academy_courses;
create policy "academy_courses_select_all"
on public.academy_courses
for select
to anon, authenticated
using (true);

update public.academy_courses
set
    title = 'Mensagens WorldTracer e Action File',
    eyebrow = 'Action File avançado',
    category = 'bagagem',
    level = 'Avançado',
    duration = '2h 10min',
    color = '#facc15',
    summary = 'Curso completo para acessar, interpretar, administrar e tratar pendências do Action File, incluindo áreas WM, FW, AA, comandos DXF, EXF, CXF e regra operacional dos 7 dias.',
    modules = '[
        {
            "title":"Acesso ao Action File",
            "type":"Aula guiada",
            "duration":"12 min",
            "content":"O Action File é acessado pelo menu principal do simulador, na opção Action File. A tela apresenta a rede de treinamento, filtros, Station Inbox, criação de mensagens e a lista de ações registradas. O aluno deve entender que esta tela funciona como uma fila operacional: ela não é apenas consulta, mas controle de pendências que precisam ser lidas, tratadas, respondidas ou encerradas.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/action-file-inbox.png","title":"Acesso e Station Inbox","caption":"A entrada pelo menu Action File abre a caixa de pendências da estação, separada por área e dia operacional."}]
        },
        {
            "title":"Station Inbox e regra dos 7 dias",
            "type":"Rotina operacional",
            "duration":"18 min",
            "content":"O Station Inbox organiza mensagens por tipo de pendência e por dia operacional, de Day 1 a Day 7. A regra prática dos 7 dias serve para administrar envelhecimento da fila: o que entrou hoje deve ser avaliado imediatamente; o que permanece aberto precisa ser acompanhado diariamente; itens próximos ao Day 7 exigem prioridade de decisão, resposta ou encerramento. A leitura por dia evita que mensagens críticas fiquem escondidas atrás de casos novos.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/action-file-inbox.png","title":"Contagem por Day 1 a Day 7","caption":"A tabela mostra quantas mensagens existem em cada área e há quantos dias aguardam tratamento."}]
        },
        {
            "title":"Áreas do Action File: FW, AA e WM",
            "type":"Mapa da tela",
            "duration":"20 min",
            "content":"FW significa Forward Messages: área ligada a mensagens de encaminhamento, envio e movimentação de bagagens, incluindo FWD. AA significa Action Messages: área de ações que exigem providência em PIRs, solicitações de QOH/OHD, ROH, FOH, FAH, alterações e respostas. WM significa System Matches: área onde o sistema sugere possíveis correspondências entre AHL e OHD. Cada área exige postura diferente: FW pede conferência de envio; AA pede ação humana; WM pede análise antes de aceitar ou rejeitar match.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/action-file-inbox.png","title":"FW, AA e WM no painel","caption":"Forward Messages, Action Messages e System Matches são áreas centrais da rotina de bagagem."}]
        },
        {
            "title":"Demais áreas: prompts, claims, e-mail e Local Manager",
            "type":"Consulta",
            "duration":"20 min",
            "content":"Além de FW, AA e WM, o Action File pode concentrar Extended Matches, Claim Matches, System Prompts, Additional Prompts, Email Correspondence, Claims Messages, Purged/retired items e Local Manager. Extended Matches indicam possíveis matches após prolongamento de rastreio. Claim Matches e Claims Messages envolvem investigação ou reclamações. System Prompts são alertas automáticos. Additional Prompts são mensagens gerais entre bases. Email Correspondence reúne mensagens digitais do passageiro. Purged/retired items indica itens vencidos, como QOH após prazo operacional. Local Manager reúne orientações da central, HDQ ou gestão operacional.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/action-file-inbox.png","title":"Áreas completas do Inbox","caption":"Cada linha da caixa de entrada representa uma família diferente de pendências."}]
        },
        {
            "title":"Comandos DXF, EXF e CXF",
            "type":"Comandos operacionais",
            "duration":"20 min",
            "content":"DXF é usado na plataforma como visualização ou tratativa de mensagem recebida no Action File. EXF é usado para informação extra, pedido de atualização ou observação operacional complementar. CXF deve ser entendido, neste treinamento, como comando de conclusão ou encerramento da pendência depois que a ação foi analisada e registrada; se a base possuir regra oficial diferente para CXF, prevalece o procedimento local. O ponto didático é: primeiro ler, depois complementar se necessário, depois concluir somente quando houver evidência de que a pendência foi tratada.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/action-file-create.png","title":"Campo Código","caption":"O código define a natureza da ação: leitura, complemento, encaminhamento, match ou encerramento."}]
        },
        {
            "title":"Códigos de bagagem: FWD, ROH, FOH, FAH e BDO",
            "type":"Mensagens de processo",
            "duration":"22 min",
            "content":"FWD registra envio ou encaminhamento de bagagem, geralmente com etiqueta rush. ROH é Request On-Hand: solicitação para que uma base envie um OHD relacionado a um AHL. FOH é Forward On-Hand: envio do OHD solicitado ou definido. FAH é Forward Delayed Bag: encaminhamento de bagagem localizada vinculada a um AHL para outra base providenciar entrega. BDO registra ordem ou informação de entrega ao passageiro ou destinatário autorizado. Esses códigos precisam ser usados com referência correta, base, companhia, voo, data, peso, lacre quando aplicável e histórico coerente.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/ahl-history.png","title":"ROH e FOH no histórico","caption":"Mensagens de solicitação e envio precisam ficar registradas no histórico do processo."}]
        },
        {
            "title":"Como administrar a fila",
            "type":"Gestão operacional",
            "duration":"18 min",
            "content":"Administrar o Action File exige rotina: filtrar por processo, código, área, status e dias; priorizar mensagens antigas, matches de alta probabilidade, solicitações de outras bases e casos com passageiro aguardando; atribuir responsável; responder com texto objetivo; atualizar o processo relacionado; e encerrar somente quando a pendência estiver resolvida. A fila deve ser revisada no início, durante e no fim do turno.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/action-file-create.png","title":"Criação e administração da ação","caption":"Filtros, prioridade, responsável e mensagem ajudam a transformar a fila em controle operacional."}]
        },
        {
            "title":"Fluxo prático de tratamento",
            "type":"Simulação",
            "duration":"20 min",
            "content":"O fluxo recomendado é: acessar o Action File, verificar Day 1 a Day 7, selecionar área, abrir a mensagem, identificar referência e processo, consultar AHL/OHD/DPR/RFP, avaliar se há match ou solicitação, executar a ação necessária, registrar resposta e histórico, atualizar status e revisar se há nova pendência gerada. Nenhuma mensagem deve ser encerrada apenas para limpar a tela; o encerramento precisa refletir ação real.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/ohd-web.png","title":"Conferência no processo vinculado","caption":"Antes de responder uma mensagem, o agente precisa conferir o processo relacionado."}]
        }
    ]'::jsonb,
    labs = '[
        {"label":"Action File","href":"action-file.html"},
        {"label":"AHL Web","href":"ahl.html"},
        {"label":"OHD Web","href":"ohd.html"},
        {"label":"DPR Web","href":"dpr.html"},
        {"label":"Máscara Action File WorldTracer","href":"worldtracer/action-file.html"}
    ]'::jsonb,
    quiz = '[
        {"question":"Como acessar o Action File no simulador?","options":["Pelo menu principal, opção Action File","Somente pela tela de certificado","Apenas pelo admin","Pelo botão de logout"],"correct":0},
        {"question":"O Station Inbox serve para:","options":["Concentrar mensagens e pendências da estação por área e dia","Emitir cartão de embarque","Cadastrar senha de aluno","Alterar layout da página"],"correct":0},
        {"question":"A regra dos 7 dias ajuda principalmente a:","options":["Controlar envelhecimento e prioridade das pendências","Excluir todos os processos no sétimo dia","Liberar acesso sem login","Calcular peso da mala"],"correct":0},
        {"question":"FW significa, no contexto do Action File:","options":["Forward Messages","Final Weight","File Warning","Flight Window"],"correct":0},
        {"question":"AA significa:","options":["Action Messages","Airport Arrival","Airline Admin","Automatic Approval"],"correct":0},
        {"question":"WM indica:","options":["System Match entre processos, como AHL e OHD","Peso mundial","Mensagem sem ação","Encerramento automático"],"correct":0},
        {"question":"DXF é usado na plataforma como:","options":["Visualização ou tratativa de mensagem recebida","Envio de etiqueta física","Registro de bagagem danificada","Cadastro de aeroporto"],"correct":0},
        {"question":"EXF representa:","options":["Informação extra ou complemento operacional","Exclusão de voo","Erro de formulário","Entrega final"],"correct":0},
        {"question":"CXF deve ser tratado didaticamente como:","options":["Conclusão ou encerramento de pendência após ação registrada","Criação de AHL","Match automático obrigatório","Categoria de conteúdo"],"correct":0},
        {"question":"ROH significa:","options":["Request On-Hand","Report On Hold","Return Of Handling","Rush On Flight"],"correct":0},
        {"question":"FOH significa:","options":["Forward On-Hand","Final On Hold","File Of History","Flight On Hold"],"correct":0},
        {"question":"FAH está ligado a:","options":["Forward Delayed Bag vinculado a AHL","Fechamento de RFP","Filtro de administração","Falha de login"],"correct":0},
        {"question":"Antes de aceitar um WM, o agente deve:","options":["Comparar AHL, OHD, rota, tag, conteúdo e descrição","Encerrar sem verificar","Criar certificado","Apagar OHD"],"correct":0},
        {"question":"Uma fila bem administrada exige:","options":["Filtro, prioridade, responsável, resposta e histórico","Apenas abrir a tela uma vez por semana","Encerrar tudo sem resposta","Ignorar mensagens antigas"],"correct":0},
        {"question":"Quando encerrar uma ação?","options":["Somente depois que a pendência foi tratada e registrada","Assim que aparecer no Day 1","Sempre no Day 7 sem análise","Antes de consultar o processo"],"correct":0}
    ]'::jsonb,
    cover_path = '../assets/academy-screenshots/advanced-baggage-courses/action-file-inbox.png',
    material = 'Curso avançado de Mensagens WorldTracer e Action File

Objetivo
Ensinar o aluno a acessar, interpretar, priorizar, responder e encerrar pendências do Action File com método operacional.

1. Como acessar
Na plataforma, o Action File fica no menu principal. Ao entrar, o aluno encontra Station Inbox, área de criação de mensagem/ação, filtros e tabela de ações registradas. A rotina começa pela leitura da fila, não pela criação aleatória de mensagens.

2. Regra dos 7 dias
O Inbox separa pendências de Day 1 a Day 7. Essa régua indica envelhecimento operacional. Mensagens novas devem ser avaliadas cedo; mensagens antigas precisam de prioridade, resposta ou conclusão. O objetivo é evitar que solicitações de outras bases, matches ou prompts fiquem esquecidos.

3. Áreas principais
FW - Forward Messages: mensagens de encaminhamento e envio de bagagem.
AA - Action Messages: ações que exigem providência humana em PIRs, OHD/QOH, ROH, FOH, FAH e alterações.
WM - System Matches: possíveis correspondências entre AHL e OHD geradas pelo sistema.

4. Outras áreas
Extended Matches: matches prolongados após extensão de rastreio.
Claim Matches: correspondências ligadas a investigação ou reclamação.
System Prompts: alertas automáticos.
Additional Prompts: mensagens gerais entre bases.
Email Correspondence: mensagens recebidas por canal digital.
Claims Messages: reclamações ou notificações de claim.
Purged/retired items: itens vencidos ou retirados da fila, como QOH fora do prazo.
Local Manager: comunicações de central, HDQ ou gestão.

5. Comandos
DXF: visualização, leitura ou tratativa de mensagem.
EXF: informação extra ou complemento operacional.
CXF: no treinamento, conclusão/encerramento de pendência após ação registrada. Se a base possuir definição oficial diferente, o procedimento local deve prevalecer.
FWD: envio de rush bag ou encaminhamento de bagagem.
ROH: solicitação de envio de OHD.
FOH: envio do OHD para a base solicitante/destino definido.
FAH: encaminhamento de bagagem localizada vinculada a AHL.
BDO: informação ou ordem de entrega.

6. Administração da fila
Filtrar por processo, código, área, status e dias. Priorizar mensagens antigas, matches fortes, solicitações de outras bases e casos com passageiro aguardando. Atribuir responsável, responder de forma objetiva, atualizar processo vinculado e encerrar somente com ação real.

Mensagem principal
Action File é disciplina de acompanhamento. Uma fila limpa sem ação real não é qualidade; qualidade é pendência tratada, processo atualizado e histórico rastreável.',
    sort_order = 248
where id = 'mensagens-worldtracer-action-file';
