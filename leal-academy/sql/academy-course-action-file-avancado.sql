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
    title = 'Action File Operacional',
    eyebrow = 'Action File avançado',
    category = 'bagagem',
    level = 'Avançado',
    duration = '2h 20min',
    color = '#facc15',
    summary = 'Curso dedicado exclusivamente ao Action File: acesso, Station Inbox, áreas FW, AA, WM, SP, PR, AP, EC, LM, leitura, exclusão, envio, transferência e administração da fila.',
    modules = '[
        {
            "title":"O que é Action File",
            "type":"Aula guiada",
            "duration":"12 min",
            "content":"O Action File é o gerenciador operacional de mensagens da estação. Ele reúne mensagens enviadas para a base, mensagens criadas pela própria equipe e alertas que precisam de acompanhamento. O objetivo da tela é mostrar o volume de trabalho do dia, organizar pendências por área e permitir que o agente leia, envie, transfira ou retire mensagens da fila somente depois da tratativa correta.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/action-file-inbox.png","title":"Station Inbox","caption":"A tela apresenta as famílias de mensagens e a distribuição por dia operacional."}]
        },
        {
            "title":"Acesso pelo CXF",
            "type":"Comando operacional",
            "duration":"14 min",
            "content":"CXF identifica a área de armazenamento de mensagens do Action File. No padrão de máscara, a entrada pode seguir a estrutura WM CXF BASE/CIA, como WM CXF XJGLA. Na plataforma, o acesso ocorre pelo menu Action File. O aluno deve entender que entrar no CXF significa abrir a caixa de trabalho da estação, não encerrar pendência nem criar relatório de outro módulo.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/action-file-inbox.png","title":"Entrada no Action File","caption":"A primeira ação é conferir a fila antes de criar novas mensagens."}]
        },
        {
            "title":"Station Inbox e D1 a D7",
            "type":"Rotina operacional",
            "duration":"18 min",
            "content":"O Station Inbox organiza mensagens por área e por idade operacional, de D1 a D7. D1 indica mensagens recentes; D7 indica mensagens antigas e mais críticas. A leitura deve priorizar o que está envelhecido, porque mensagens antigas representam risco de atraso, perda de rastreabilidade e falha de resposta. A regra dos 7 dias é uma régua de controle: acompanhar diariamente, responder o que exige providência e retirar da fila somente o que já foi tratado.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/action-file-inbox.png","title":"Dias operacionais","caption":"A contagem por dia ajuda a priorizar a fila sem depender de memória."}]
        },
        {
            "title":"Áreas FW, AA e WM",
            "type":"Mapa da fila",
            "duration":"18 min",
            "content":"FW concentra mensagens de encaminhamento e movimentação operacional. AA concentra mensagens que exigem ação da equipe. WM concentra mensagens de comparação geradas pelo sistema. A diferença entre as áreas evita tratamento equivocado: FW pede conferência de envio ou deslocamento, AA pede providência humana, e WM pede análise criteriosa antes de aceitar, rejeitar ou transferir uma pendência.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/action-file-inbox.png","title":"Áreas principais","caption":"FW, AA e WM são linhas centrais para leitura diária da caixa."}]
        },
        {
            "title":"Áreas SP, PR, AP, EC e LM",
            "type":"Mapa da fila",
            "duration":"18 min",
            "content":"SP apresenta alertas automáticos do sistema. PR reúne itens vencidos ou retirados da rotina ativa conforme regra operacional da fila. AP é usado para mensagens gerais entre bases, companhias ou turnos. EC concentra correspondências recebidas por canal digital. LM apresenta comunicações da gestão, central ou headquarters. Cada área deve ser lida com uma intenção clara: identificar origem, urgência, responsável e próxima ação.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/action-file-inbox.png","title":"Demais áreas","caption":"As áreas complementares ajudam a separar alerta, recado, e-mail e orientação central."}]
        },
        {
            "title":"Leitura com DXF",
            "type":"Prática orientada",
            "duration":"18 min",
            "content":"DXF é a transação usada para ler mensagens do Action File. A leitura pode ser feita de forma geral ou direcionada por área e dia, como WM DXF XJGLA AA D1. O agente deve ler a mensagem inteira, identificar área, número, origem, destino, data, conteúdo e ação esperada. A leitura não resolve a pendência sozinha; ela apenas transforma uma mensagem acumulada em uma tarefa operacional compreendida.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/action-file-create.png","title":"Leitura da mensagem","caption":"DXF abre a pendência para análise antes de qualquer resposta."}]
        },
        {
            "title":"Exclusão com EXF",
            "type":"Controle de fila",
            "duration":"16 min",
            "content":"EXF exclui mensagens do Action File. A exclusão só deve ocorrer após leitura, tratativa e registro da providência necessária. Apagar uma mensagem para limpar a tela sem resolver o assunto gera perda de controle e pode impedir que outro agente entenda o histórico da pendência. Em treinamento, o critério é simples: se ainda existe ação pendente, a mensagem permanece; se a ação foi concluída e registrada, a mensagem pode sair da fila.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/action-file-create.png","title":"Limpeza responsável","caption":"EXF é etapa final de uma pendência, não atalho para reduzir volume."}]
        },
        {
            "title":"Envio com PXF",
            "type":"Mensagem operacional",
            "duration":"16 min",
            "content":"PXF envia mensagens pelo Action File. Ele deve ser usado quando a estação precisa comunicar outra base, companhia ou equipe sobre uma ação operacional. Uma boa mensagem informa referência, origem, destino, motivo, pedido objetivo e assinatura do responsável. O texto deve ser curto, claro e rastreável, evitando abreviações ambíguas quando elas prejudicam o entendimento.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/action-file-create.png","title":"Envio de mensagem","caption":"PXF transforma a necessidade operacional em comunicação formal."}]
        },
        {
            "title":"Transferência com TXF",
            "type":"Tratamento de pendência",
            "duration":"16 min",
            "content":"TXF transfere uma mensagem para o local correto de acompanhamento. A transferência é usada quando a pendência precisa deixar a fila geral e ficar vinculada ao tratamento adequado. Antes de transferir, o agente confere área, número da mensagem, referência citada, motivo e destino da transferência. Transferir sem leitura completa apenas muda o problema de lugar; transferir bem melhora rastreabilidade e continuidade do atendimento.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/action-file-create.png","title":"Transferência","caption":"TXF direciona a mensagem para a tratativa correta."}]
        },
        {
            "title":"Administração da fila",
            "type":"Gestão operacional",
            "duration":"18 min",
            "content":"Administrar o Action File exige rotina de início, meio e fim de turno. O agente deve filtrar por área, código, status, prioridade, responsável e dias; atacar primeiro mensagens antigas e críticas; registrar providências; evitar duplicidade de comunicação; e revisar se a fila gerou novas pendências. Uma fila saudável não é necessariamente vazia: é uma fila compreendida, priorizada e com histórico coerente.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/action-file-create.png","title":"Filtros e ações","caption":"Filtro, prioridade e responsável ajudam a transformar mensagens em fluxo de trabalho."}]
        }
    ]'::jsonb,
    labs = '[
        {"label":"Action File","href":"action-file.html"},
        {"label":"Máscara Action File WorldTracer","href":"worldtracer/action-file.html"}
    ]'::jsonb,
    quiz = '[
        {"question":"Qual é o objetivo do Action File?","options":["Gerenciar mensagens e pendências operacionais da estação","Criar certificados de curso","Alterar dados de login","Montar uma escala de funcionários"],"correct":0},
        {"question":"CXF representa:","options":["Área de armazenamento de mensagens do Action File","Fechamento de atendimento","Cadastro de passageiro","Tela de relatório financeiro"],"correct":0},
        {"question":"O Station Inbox organiza mensagens principalmente por:","options":["Área e dia operacional","Nome do aluno","Cor da mala","Número de certificado"],"correct":0},
        {"question":"D7 indica uma mensagem:","options":["Mais antiga e com maior prioridade de acompanhamento","Criada automaticamente no futuro","Sem necessidade de leitura","Excluída pelo sistema"],"correct":0},
        {"question":"DXF é usado para:","options":["Ler mensagens do Action File","Excluir a base","Criar nova senha","Gerar relatório administrativo"],"correct":0},
        {"question":"EXF deve ser usado quando:","options":["A mensagem já foi lida, tratada e registrada","A fila parece longa","O agente não sabe o que fazer","A mensagem chegou em D1"],"correct":0},
        {"question":"PXF serve para:","options":["Enviar mensagens operacionais","Alterar a cor da tela","Abrir biblioteca de cursos","Calcular peso total"],"correct":0},
        {"question":"TXF serve para:","options":["Transferir uma mensagem para o acompanhamento correto","Excluir todos os filtros","Criar uma nova categoria de curso","Fechar a plataforma"],"correct":0},
        {"question":"AP no contexto do Action File é:","options":["Área de mensagens gerais entre bases, companhias ou turnos","Aprovação automática de avaliação","Arquivo pessoal do aluno","Atalho para painel administrativo"],"correct":0},
        {"question":"Uma fila bem administrada deve ser:","options":["Priorizada, registrada e revisada durante o turno","Esvaziada sem leitura","Ignorada até D7","Tratada apenas uma vez por semana"],"correct":0}
    ]'::jsonb,
    cover_path = '../assets/academy-screenshots/advanced-baggage-courses/action-file-inbox.png',
    material = 'Curso avançado de Action File

Objetivo
Ensinar o aluno a acessar, interpretar, priorizar, responder, transferir e limpar mensagens do Action File com método operacional.

1. Conceito
O Action File é o gerenciador de mensagens da estação. Ele organiza pendências por área e por dia operacional, permitindo acompanhar o volume de trabalho e a prioridade de cada mensagem.

2. Acesso
Na plataforma, o acesso fica no menu Action File. No padrão de máscara, a entrada pode seguir o formato WM CXF BASE/CIA, como WM CXF XJGLA.

3. Station Inbox
A caixa de entrada separa mensagens por D1 a D7. D1 representa entrada recente. D7 representa pendência antiga e deve receber atenção prioritária.

4. Áreas do Action File
FW - Forward Messages: mensagens de encaminhamento e movimentação operacional.
AA - Action Messages: mensagens que exigem ação da equipe.
WM - System Matches: mensagens de comparação geradas pelo sistema.
SP - System Prompts: alertas automáticos do sistema.
PR - Purged/retired items: itens retirados ou vencidos conforme regra operacional da fila.
AP - Additional Prompts: mensagens gerais entre bases, companhias ou turnos.
EC - Email Correspondence: correspondências recebidas por canal digital.
LM - Local Manager: comunicações da gestão, central ou headquarters.

5. Transações próprias do Action File
CXF: área de armazenamento de mensagens.
DXF: leitura de mensagens.
EXF: exclusão de mensagens já tratadas.
PXF: envio de mensagens.
TXF: transferência de mensagens para acompanhamento correto.

6. Método de trabalho
Entrar na fila, conferir área e dia, priorizar mensagens antigas, ler com DXF, decidir a ação, enviar com PXF quando houver comunicação externa, transferir com TXF quando a pendência precisar seguir para acompanhamento específico e excluir com EXF somente após conclusão real.

Mensagem principal
Action File é controle de pendências. O objetivo não é apenas reduzir números na tela; é garantir leitura, ação, registro e continuidade operacional.',
    sort_order = 248
where id = 'mensagens-worldtracer-action-file';
