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
    duration = '2h 45min',
    color = '#facc15',
    summary = 'Curso completo para acessar, interpretar, administrar e tratar pendências do Action File, incluindo áreas FW, AA, WM, SP, PR, AP, EC, LM, transações CXF, DXF, EXF, PXF, TXF e regra operacional dos 7 dias.',
    modules = '[
        {
            "title":"Acesso ao Action File",
            "type":"Aula guiada",
            "duration":"12 min",
            "content":"O Action File é uma área de gerenciamento de mensagens operacionais. Nele ficam armazenadas mensagens enviadas para a sua base, exceto mensagens recebidas via teletipo, e mensagens enviadas pela própria estação. É pelo Action File que a equipe mede a carga de trabalho do dia, identifica pendências, acompanha matches e decide quais relatórios precisam de ação. Cada base tem seu próprio Action File, mas ele pode ser consultado por outra base ou companhia aérea autorizada. No simulador, o acesso é feito pelo menu Action File; no padrão WorldTracer Native, o comando de entrada pode seguir a lógica WM CXF BASE/CIA, como WM CXF XJGLA.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/action-file-inbox.png","title":"Acesso e Station Inbox","caption":"A entrada pelo menu Action File abre a caixa de pendências da estação, separada por área e dia operacional."}]
        },
        {
            "title":"Station Inbox e regra dos 7 dias",
            "type":"Rotina operacional",
            "duration":"18 min",
            "content":"O Station Inbox organiza mensagens por área e por dia operacional, de D1 a D7. A leitura normalmente começa pelas mensagens mais antigas, porque elas representam maior risco de atraso na tratativa. A regra prática dos 7 dias serve para administrar envelhecimento da fila: o que entrou hoje deve ser avaliado imediatamente; o que permanece aberto precisa ser acompanhado diariamente; itens próximos ao Day 7 exigem prioridade de decisão, resposta ou encerramento. A tabela por dia evita que mensagens críticas fiquem escondidas atrás de casos novos.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/action-file-inbox.png","title":"Contagem por Day 1 a Day 7","caption":"A tabela mostra quantas mensagens existem em cada área e há quantos dias aguardam tratamento."}]
        },
        {
            "title":"Áreas principais: FW, AA e WM",
            "type":"Mapa da tela",
            "duration":"20 min",
            "content":"FW é a área onde ficam armazenadas as informações de envio de FWD. AA é a área de ação: nela aparecem solicitações de envio de OHDs que estão em sua base, como ROH, envios de OHDs de outras bases solicitados por você, como FOH, e também mensagens FAH. WM é a área de comparação, onde ficam mensagens de match geradas pelo sistema entre AHLs e OHDs registrados em outras bases. Cada área exige postura diferente: FW pede conferência de envio; AA pede providência humana; WM pede análise antes de aceitar ou rejeitar uma possível correspondência.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/action-file-inbox.png","title":"FW, AA e WM no painel","caption":"Forward Messages, Action Messages e System Matches são áreas centrais da rotina de bagagem."}]
        },
        {
            "title":"Demais áreas: prompts, claims, e-mail e Local Manager",
            "type":"Consulta",
            "duration":"20 min",
            "content":"SP mostra alertas do sistema quando alguma ação deve ser tomada. PR mostra todos os QOHs que já tiveram o prazo de 24 horas expirado. AP é uma área geral de mensagens, usada quando outras bases enviam recados operacionais ou quando a equipe quer deixar uma orientação para outro turno; pode funcionar como diário de serviço. EC armazena e-mails enviados pelo cliente via internet. LM concentra mensagens enviadas pela central, HDQ ou headquarters às bases. Além dessas áreas, o simulador também apresenta Extended Matches, Claim Matches e Claims Messages para treinar investigação, reclamações e possíveis correspondências prolongadas.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/action-file-inbox.png","title":"Áreas completas do Inbox","caption":"Cada linha da caixa de entrada representa uma família diferente de pendências."}]
        },
        {
            "title":"Transações CXF, DXF, EXF, PXF e TXF",
            "type":"Comandos operacionais",
            "duration":"20 min",
            "content":"CXF é a área de armazenamento de mensagens do Action File. No padrão WorldTracer Native, a entrada pode ser representada por WM CXF BASE/CIA, por exemplo WM CXF XJGLA. Depois de acessar a fila, a equipe usa DXF para ler mensagens, EXF para excluir mensagens já tratadas, PXF para enviar mensagens a outras bases ou companhias aéreas, e TXF para transferir uma mensagem para o relatório correto. A sequência didática é: entrar na área CXF, avaliar a contagem por área e dia, ler a pendência com DXF, responder ou enviar quando aplicável com PXF, transferir responsabilidade quando necessário com TXF e excluir apenas mensagens resolvidas com EXF.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/action-file-create.png","title":"Campo Código","caption":"O código define a natureza da ação: leitura, complemento, encaminhamento, match ou encerramento."}]
        },
        {
            "title":"Leitura e exclusão: DXF e EXF",
            "type":"Prática orientada",
            "duration":"18 min",
            "content":"DXF é a transação usada para ler mensagens do Action File. Ao utilizar DXF, o sistema passa a mostrar as mensagens da área escolhida, normalmente a partir do D7 em direção aos dias mais recentes, começando pelas mais antigas. Também é possível solicitar uma área e um dia específico, como WM DXF XJGLA AA D1. EXF é usado para apagar mensagens do Action File somente depois que elas foram lidas e todas as ações pertinentes foram tomadas. A exclusão é uma providência importante porque mensagens resolvidas continuam acumulando e atrapalham a visualização das pendências novas. Como regra de treinamento, apagar mensagem sem tratar o caso é erro operacional, pois depois de excluída a mensagem pode não ser recuperada.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/action-file-create.png","title":"Leitura e limpeza da fila","caption":"DXF abre as mensagens; EXF remove da fila apenas o que já foi resolvido."}]
        },
        {
            "title":"Transferência e envio: TXF e PXF",
            "type":"Comandos operacionais",
            "duration":"18 min",
            "content":"TXF transfere mensagens recebidas no Action File para um relatório, principalmente em áreas como FW, WM, AP e LM. A transferência exige informar de qual área vem a mensagem, qual número será transferido e para qual relatório ela deve ir, por exemplo associando a pendência a um AHL específico. PXF é usado quando a estação precisa enviar mensagem para outra base ou companhia aérea, ou deixar um recado para outro turno. A mensagem deve ser objetiva, identificar referência, base, companhia, necessidade e assinatura operacional.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/action-file-create.png","title":"Mensagem e ação","caption":"PXF envia mensagens; TXF transfere uma pendência para o relatório correto."}]
        },
        {
            "title":"Códigos de bagagem: FWD, ROH, FOH, FAH e BDO",
            "type":"Mensagens de processo",
            "duration":"22 min",
            "content":"FWD é mensagem de envio de bagagem. ROH é solicitar OHD. FOH é enviar OHD. FAH é envio de bagagens pertencentes a AHLs de sua base. FLZ é envio de bagagem para a central de bagagens ou HDQ. BDO é ordem de entrega de bagagem. Esses códigos precisam ser usados com referência correta, base, companhia, voo, data, peso, lacre quando aplicável e histórico coerente.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/ahl-history.png","title":"ROH e FOH no histórico","caption":"Mensagens de solicitação e envio precisam ficar registradas no histórico do processo."}]
        },
        {
            "title":"Identificação das transações",
            "type":"Tabela de consulta",
            "duration":"22 min",
            "content":"As principais transações relacionadas à consulta, criação, visualização, alteração e mensagens são: HELP ajuda do sistema; AHL criar relatório de bagagem extraviada; OHD criar relatório de bagagem sobrante; QOH inserção rápida de bagagem sobrante; DPR criar relatório de danificação e violação; DAH visualizar AHL; DOH visualizar OHD; DDP visualizar DPR; RAF lista de AHLs; ROF lista de OHDs; DOF lista de OHDs, QOHs e mensagens FWD, FOH, FAH e FLZ; AAH alterar AHL; AOH alterar OHD; ADP alterar DPR; CXF área de armazenamento de mensagens; DXF ler mensagens; EXF excluir mensagens; PXF enviar mensagens; TXF transferir mensagens; ROH solicitar OHD; FOH enviar OHD; RIT reativar relatórios de AHL e OHD; CAH fechar AHL; CDP fechar DPR; COH fechar OHD; CFD fechar AHL e abrir DPR; RCB reabrir relatório fechado; DST visualizar dados da base; RFP inserir objetos localizados a bordo; DFP visualizar objetos encontrados a bordo; AFP inserir informações em objetos esquecidos; PDI visualizar relatórios inativos; PDE inserir, alterar ou apagar informações em relatórios inativos; FRR visualizar relatórios AHL, OHD ou DPR abertos usando somente o número.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/action-file-inbox.png","title":"Transações e fila operacional","caption":"A transação indica se o agente deve criar, visualizar, alterar, enviar, transferir, reativar ou fechar um processo."}]
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
        {"question":"CXF representa:","options":["Área de armazenamento de mensagens do Action File","Fechamento de AHL","Envio de OHD","Lista de DPR"],"correct":0},
        {"question":"DXF significa:","options":["Ler mensagens do Action File","Excluir mensagens","Transferir mensagens","Criar AHL"],"correct":0},
        {"question":"EXF representa:","options":["Excluir mensagens do Action File","Informação extra","Envio de etiqueta física","Entrega final"],"correct":0},
        {"question":"PXF significa:","options":["Enviar mensagens","Visualizar DPR","Reabrir relatório","Criar OHD"],"correct":0},
        {"question":"TXF significa:","options":["Transferir mensagens","Listar AHLs","Fechar DPR","Ajuda do sistema"],"correct":0},
        {"question":"ROH significa:","options":["Request On-Hand","Report On Hold","Return Of Handling","Rush On Flight"],"correct":0},
        {"question":"FOH significa:","options":["Forward On-Hand","Final On Hold","File Of History","Flight On Hold"],"correct":0},
        {"question":"FAH está ligado a:","options":["Envio de bagagens pertencentes a AHLs de sua base","Fechamento de RFP","Filtro de administração","Falha de login"],"correct":0},
        {"question":"Antes de aceitar um WM, o agente deve:","options":["Comparar AHL, OHD, rota, tag, conteúdo e descrição","Encerrar sem verificar","Criar certificado","Apagar OHD"],"correct":0},
        {"question":"Uma fila bem administrada exige:","options":["Filtro, prioridade, responsável, resposta e histórico","Apenas abrir a tela uma vez por semana","Encerrar tudo sem resposta","Ignorar mensagens antigas"],"correct":0},
        {"question":"Quando encerrar uma ação?","options":["Somente depois que a pendência foi tratada e registrada","Assim que aparecer no Day 1","Sempre no Day 7 sem análise","Antes de consultar o processo"],"correct":0}
    ]'::jsonb,
    cover_path = '../assets/academy-screenshots/advanced-baggage-courses/action-file-inbox.png',
    material = 'Curso avançado de Mensagens WorldTracer e Action File

Objetivo
Ensinar o aluno a acessar, interpretar, priorizar, responder e encerrar pendências do Action File com método operacional.

1. Como acessar
Na plataforma, o Action File fica no menu principal. Ao entrar, o aluno encontra Station Inbox, área de criação de mensagem/ação, filtros e tabela de ações registradas. No padrão WorldTracer Native, o acesso ao Action File pode seguir a lógica WM CXF BASE/CIA, por exemplo WM CXF XJGLA. A rotina começa pela leitura da fila, não pela criação aleatória de mensagens.

2. Regra dos 7 dias
O Inbox separa pendências de Day 1 a Day 7. Essa régua indica envelhecimento operacional. Mensagens novas devem ser avaliadas cedo; mensagens antigas precisam de prioridade, resposta ou conclusão. O objetivo é evitar que solicitações de outras bases, matches ou prompts fiquem esquecidos.

3. Áreas principais
FW - Forward Messages: área onde ficam armazenadas informações de envio de FWD.
AA - Action Messages: área de ação com solicitações de OHDs na sua base, envios de OHDs solicitados em outras bases e mensagens FAH.
WM - System Matches: área de comparação com matches gerados pelo sistema entre AHLs da estação e OHDs de outras bases.

4. Outras áreas
SP - System Prompts: alertas do sistema quando alguma ação precisa ser tomada.
PR - Purged/retired items: QOHs que já tiveram o prazo operacional de 24 horas expirado.
AP - Additional Prompts: mensagens gerais entre bases ou companhia aérea; pode ser usado como diário de serviço e passagem de turno.
EC - Email Correspondence: e-mails enviados pelo cliente via internet.
LM - Local Manager: mensagens enviadas pela central, HDQ ou headquarters às bases.
Extended Matches: matches prolongados após extensão de rastreio.
Claim Matches: correspondências ligadas a investigação ou reclamação.
Claims Messages: reclamações ou notificações de claim.

5. Comandos
HELP: ajuda do sistema.
AHL: criar relatório de bagagem extraviada.
OHD: criar relatório de bagagem sobrante.
QOH: inserção rápida de bagagem sobrante.
DPR: criar relatório de danificação e violação.
DAH: visualização de AHL.
DOH: visualização de OHD.
DDP: visualização de DPR.
RAF: lista de AHLs.
ROF: lista de OHDs.
DOF: lista de OHDs, QOHs e mensagens de envio FWD, FOH, FAH e FLZ.
AAH: incluir, apagar ou alterar informações no AHL.
AOH: incluir, apagar ou alterar informações no OHD.
ADP: incluir, apagar ou alterar informações no DPR.
CXF: área de armazenamento de mensagens do Action File.
DXF: ler mensagens do Action File.
EXF: excluir mensagens do Action File.
PXF: enviar mensagens.
TXF: transferir mensagens.
ROH: solicitar OHD.
FOH: enviar OHD.
RIT: reativar relatórios de AHL e OHD.
FAH: envio de bagagens pertencentes a AHLs de sua base.
FLZ: envio de bagagem para a central de bagagens, HDQ.
CAH: fechamento de AHL.
CDP: fechamento de DPR.
COH: fechamento de OHD.
CFD: fechamento de AHL e abertura de DPR.
BDO: ordem de entrega de bagagem.
RCB: reabertura de relatório fechado.
DST: área de visualização dos dados da base.
FWD: mensagem de envio de bagagem.
RFP: inserção de objetos localizados a bordo.
DFP: visualização de objetos encontrados a bordo.
AFP: inserir informações nos objetos esquecidos a bordo.
PDI: visualizar relatórios inativos no sistema.
PDE: inserir, alterar ou apagar informações em relatórios inativos.
FRR: relatórios de AHL, OHD e DPR abertos usando somente o número.

6. Administração da fila
Filtrar por processo, código, área, status e dias. Priorizar mensagens antigas, matches fortes, solicitações de outras bases e casos com passageiro aguardando. A leitura por DXF pode ser feita por área e dia, como WM DXF XJGLA AA D1. Quando a mensagem pertence a um relatório, usar TXF para transferir a pendência ao processo correto. Quando for necessário comunicar outra base, companhia aérea ou turno, usar PXF com texto objetivo, referência, necessidade e assinatura operacional. Usar EXF somente depois de ler, tratar e registrar a ação necessária; apagar mensagem sem resolver o caso elimina rastreabilidade e prejudica a operação.

Mensagem principal
Action File é disciplina de acompanhamento. Uma fila limpa sem ação real não é qualidade; qualidade é pendência tratada, processo atualizado e histórico rastreável.',
    sort_order = 248
where id = 'mensagens-worldtracer-action-file';
