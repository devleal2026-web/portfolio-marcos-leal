alter table public.academy_courses
    add column if not exists category text;

grant usage on schema public to anon, authenticated;
grant select on public.academy_courses to anon, authenticated;

alter table public.academy_courses enable row level security;

drop policy if exists "academy_courses_select_all" on public.academy_courses;
create policy "academy_courses_select_all"
on public.academy_courses
for select
to anon, authenticated
using (true);

with course_seed as (
    select *
    from (
        values
        (
            'baggage-claim-desembarque',
            'Baggage Claim e Atendimento no Desembarque',
            'Desembarque e primeira triagem',
            'bagagem',
            'Intermediário',
            '1h 10min',
            '#0ea5e9',
            'Atendimento prático na área de restituição: esteira, orientação ao passageiro, triagem inicial, AHL, OHD e preparação para entrega.',
            '[
                {"title":"Presença operacional no desembarque","type":"Aula prática","duration":"12 min","content":"O agente deve acompanhar a chegada do voo, orientar esteira, observar passageiros aguardando bagagem e identificar sinais de irregularidade antes que o atendimento vire conflito."},
                {"title":"Primeira triagem de extravio","type":"Fluxo guiado","duration":"14 min","content":"Quando a mala não aparece, confirme voo, etiqueta, destino, conexão, volumes despachados e possível mensagem prévia antes de abrir o processo."},
                {"title":"Consulta OHD e match","type":"Consulta operacional","duration":"14 min","content":"Pesquisar bagagens sobrantes e comparar dados reduz abertura indevida e acelera localização."},
                {"title":"Comunicação com o passageiro","type":"Atendimento","duration":"14 min","content":"Explique o que será feito, registre contatos, evite promessas sem confirmação e mantenha o passageiro orientado sobre próximos passos."},
                {"title":"Entrega e encerramento","type":"Simulação","duration":"16 min","content":"Quando a bagagem é localizada, organize BDO, endereço, prazo, responsável e registro final da entrega."}
            ]'::jsonb,
            '[
                {"label":"AHL Web","href":"ahl.html"},
                {"label":"OHD Web","href":"ohd.html"},
                {"label":"Action File","href":"action-file.html"},
                {"label":"Máscara AHL WorldTracer","href":"worldtracer/ahl.html"}
            ]'::jsonb,
            '[
                {"question":"Qual é a primeira postura correta no desembarque?","options":["Acompanhar a restituição e orientar o passageiro","Esperar o passageiro procurar ajuda","Abrir AHL sem conferir etiqueta","Encerrar atendimento na esteira"],"correct":0},
                {"question":"Antes de abrir um AHL, o agente deve conferir:","options":["Voo, etiqueta, destino, conexão e volumes despachados","Apenas o nome do passageiro","Somente a cor da mala","A senha do sistema"],"correct":0},
                {"question":"A consulta OHD ajuda a:","options":["Encontrar possível bagagem sobrante compatível","Emitir cartão de embarque","Alterar assento","Cancelar etiqueta"],"correct":0},
                {"question":"Uma promessa inadequada ao passageiro seria:","options":["Garantir entrega sem confirmação real","Explicar o fluxo de busca","Registrar telefone","Informar o número do processo"],"correct":0},
                {"question":"BDO está ligado principalmente a:","options":["Ordem ou fluxo de entrega da bagagem localizada","Código de assento","Categoria de conteúdo","Controle de peso no check-in"],"correct":0},
                {"question":"O histórico do processo deve registrar:","options":["Contatos, mensagens, decisões e encaminhamentos","Apenas comentários informais","Somente o primeiro atendimento","Nada após abertura"],"correct":0}
            ]'::jsonb,
            '../assets/academy-screenshots/advanced-baggage-courses/baggage-claim-checkin.png',
            $material$Curso voltado ao atendimento de bagagem no desembarque. O aluno aprende a atuar na área de restituição, observar o fluxo do voo, orientar passageiro, confirmar dados antes da abertura do AHL, consultar OHD e preparar entrega quando a bagagem é localizada.

Sequência recomendada: acompanhar chegada do voo, confirmar esteira, observar passageiros sem volume, verificar etiqueta e rota, pesquisar mensagens e OHD, abrir processo somente com dados consistentes, registrar histórico e acompanhar entrega.

Mensagem principal: a qualidade do Baggage Claim depende de presença operacional, escuta clara e registro completo.$material$,
            246
        ),
        (
            'conexoes-criticas-mct-pratica',
            'Conexões Críticas e MCT na Prática',
            'Tempo, rota e risco',
            'bagagem',
            'Intermediário',
            '1h 15min',
            '#14b8a6',
            'Curso prático para avaliar conexões curtas, risco de misconnection, prioridade operacional e impacto na bagagem.',
            '[
                {"title":"MCT como referência operacional","type":"Aula","duration":"12 min","content":"MCT é o tempo mínimo de conexão usado para avaliar se passageiro e bagagem têm condição normal de seguir viagem."},
                {"title":"Leitura de rota e destino final","type":"Prática","duration":"14 min","content":"Analise origem, conexão, destino, horários, terminais, controles e etiqueta da bagagem."},
                {"title":"BHS, Make-Up e Loading","type":"Fluxo visual","duration":"16 min","content":"A conexão precisa ser acompanhada entre triagem, montagem do voo e carregamento."},
                {"title":"Priorização e comunicação","type":"Rotina operacional","duration":"15 min","content":"Conexões críticas exigem comunicação entre check-in, conexão, portão, BHS, rampa e serviço de bagagem."},
                {"title":"Quando a conexão falha","type":"Estudo de caso","duration":"18 min","content":"A falha pode afetar passageiro, bagagem ou ambos. O tratamento envolve reacomodação, rastreio, registro e comunicação ao destino."}
            ]'::jsonb,
            '[
                {"label":"BHS","href":"bhs.html"},
                {"label":"Make-Up","href":"makeup.html"},
                {"label":"Loading","href":"loading.html"},
                {"label":"AHL Web","href":"ahl.html"}
            ]'::jsonb,
            '[
                {"question":"MCT significa:","options":["Tempo mínimo de conexão","Controle máximo de ticket","Mensagem de check-in tardio","Modelo de etiqueta"],"correct":0},
                {"question":"Em conexão crítica, a bagagem precisa ser acompanhada em:","options":["BHS, Make-Up e Loading","Somente no balcão","Apenas no destino","Somente no certificado"],"correct":0},
                {"question":"Risco de misconnection aumenta quando há:","options":["Atraso, troca de terminal ou tempo curto","Etiqueta legível e tempo amplo","Comunicação antecipada","Prioridade bem definida"],"correct":0},
                {"question":"Priorização operacional depende de:","options":["Comunicação entre áreas","Apenas sorte","Ignorar o passageiro","Registrar depois sem ação"],"correct":0},
                {"question":"Se passageiro segue e bagagem não conecta, pode gerar:","options":["AHL no destino","RFP de objeto encontrado","Certificado automático","Cancelamento do voo"],"correct":0},
                {"question":"A leitura correta do itinerário considera:","options":["Origem, conexão, destino, horários, controles e etiqueta","Somente destino final","Somente nome do passageiro","Apenas peso da bagagem"],"correct":0}
            ]'::jsonb,
            '../assets/academy-screenshots/advanced-baggage-courses/connections-bhs.png',
            $material$Curso para transformar MCT em decisão operacional. O aluno aprende a calcular risco, ler itinerário, identificar conexão crítica, acionar áreas certas e acompanhar a bagagem até o carregamento.

Pontos centrais: MCT não é garantia absoluta; atraso de chegada, terminal distante, controles, assistência especial e falha de leitura podem quebrar a conexão. O atendimento precisa tratar passageiro e bagagem como fluxos paralelos.

Mensagem principal: conexão crítica se resolve com antecipação, comunicação e registro.$material$,
            247
        ),
        (
            'mensagens-worldtracer-action-file',
            'Mensagens WorldTracer e Action File',
            'Pendências e comunicação',
            'bagagem',
            'Intermediário',
            '1h 20min',
            '#facc15',
            'Interpretação prática de ROH, FOH, BDO, mensagens, matches e pendências dentro do Action File.',
            '[
                {"title":"Station Inbox e tipos de mensagem","type":"Aula","duration":"14 min","content":"O Action File organiza mensagens encaminhadas, ações pendentes, matches, prompts e correspondências."},
                {"title":"Como criar uma ação útil","type":"Prática","duration":"14 min","content":"Uma ação precisa ter processo, referência, base, companhia, código, prioridade, responsável e orientação clara."},
                {"title":"ROH e FOH","type":"Mensagem operacional","duration":"16 min","content":"ROH solicita bagagem ou informação; FOH responde ou encaminha OHD conforme a necessidade da base solicitante."},
                {"title":"BDO e encaminhamento","type":"Fluxo","duration":"16 min","content":"BDO transforma localização em entrega: serviço, endereço, data, conteúdo e agente responsável."},
                {"title":"Tratamento de matches","type":"Simulação","duration":"20 min","content":"Matches devem ser conferidos com dados de AHL, OHD, conteúdo, etiqueta, rota e descrição visual antes da ação."}
            ]'::jsonb,
            '[
                {"label":"Action File","href":"action-file.html"},
                {"label":"AHL Web","href":"ahl.html"},
                {"label":"OHD Web","href":"ohd.html"},
                {"label":"Máscara OHD WorldTracer","href":"worldtracer/ohd.html"}
            ]'::jsonb,
            '[
                {"question":"O Action File serve para:","options":["Controlar mensagens, ações e pendências operacionais","Emitir bilhete","Cadastrar aluno","Gerar etiqueta física"],"correct":0},
                {"question":"Uma ação útil deve conter:","options":["Referência, base, código, prioridade e orientação","Somente texto livre sem processo","Apenas telefone","Só o nome do agente"],"correct":0},
                {"question":"ROH normalmente indica:","options":["Solicitação relacionada a OHD ou informação de bagagem","Relatório de dano finalizado","Curso concluído","Mudança de assento"],"correct":0},
                {"question":"FOH normalmente indica:","options":["Resposta ou envio de OHD","Falha de certificado","Fechamento de check-in","Filtro de passageiro"],"correct":0},
                {"question":"Antes de aceitar um match, deve-se conferir:","options":["AHL, OHD, descrição, rota, conteúdo e etiqueta","Somente cor","Apenas peso","Nada, todo match é automático"],"correct":0},
                {"question":"BDO está associado a:","options":["Entrega da bagagem localizada","Dano por uso","Objeto perdido não despachado","Senha administrativa"],"correct":0}
            ]'::jsonb,
            '../assets/academy-screenshots/advanced-baggage-courses/action-file-inbox.png',
            $material$Curso focado na leitura e escrita de mensagens operacionais. O aluno aprende a sair do texto solto e trabalhar com referência, código, prioridade, base responsável e ação concreta.

ROH e FOH precisam ser claros, curtos e úteis. BDO precisa transformar localização em entrega. Matches precisam ser analisados, não aceitos automaticamente.

Mensagem principal: mensagem boa reduz espera, evita retrabalho e mantém rastreabilidade entre aeroportos.$material$,
            248
        ),
        (
            'dpr-avancado-responsabilidade',
            'DPR Avançado: Dano, Pilferage e Responsabilidade',
            'Análise técnica de dano',
            'bagagem',
            'Avançado',
            '1h 25min',
            '#ef4444',
            'Curso avançado para classificar dano, violação, evidência, prazo, responsabilidade e encerramento técnico do DPR.',
            '[
                {"title":"Diferença entre dano e pilferage","type":"Aula","duration":"14 min","content":"Dano envolve avaria física; pilferage envolve violação ou falta de conteúdo. A classificação muda a análise."},
                {"title":"Campos técnicos do DPR","type":"Prática WorldTracer","duration":"18 min","content":"Elemento, localização e extensão do dano precisam ser compatíveis com a bagagem e com o relato."},
                {"title":"Evidências, fotos e prazo","type":"Análise","duration":"16 min","content":"Aceitação depende de prazo, etiqueta, cartão de embarque, evidência, fotos e coerência."},
                {"title":"Responsabilidade e limites","type":"Decisão operacional","duration":"18 min","content":"Nem todo relato gera indenização. O agente registra, orienta e encaminha conforme regra, sem prometer resultado."},
                {"title":"Histórico e encerramento","type":"Auditoria","duration":"19 min","content":"FF, contatos, documentos, proposta, recusa e razão de encerramento precisam justificar a decisão."}
            ]'::jsonb,
            '[
                {"label":"DPR Web","href":"dpr.html"},
                {"label":"Máscara DPR WorldTracer","href":"worldtracer/dpr.html"},
                {"label":"Action File","href":"action-file.html"},
                {"label":"Biblioteca Operacional","href":"operational-library.html"}
            ]'::jsonb,
            '[
                {"question":"DPR pode tratar principalmente de:","options":["Dano ou violação de bagagem","Apenas atraso de voo","Somente objeto esquecido","Certificado do aluno"],"correct":0},
                {"question":"Campos de elemento, localização e extensão devem ser:","options":["Coerentes entre si e com a evidência","Preenchidos aleatoriamente","Sempre iguais","Ignorados"],"correct":0},
                {"question":"O agente deve evitar:","options":["Prometer indenização sem análise","Registrar fotos","Conferir prazo","Orientar documentação"],"correct":0},
                {"question":"Pilferage está ligado a:","options":["Violação ou falta de conteúdo","Troca de terminal","MCT curto","Etiqueta impressa"],"correct":0},
                {"question":"O histórico FF deve conter:","options":["Tratativas, documentos, contatos e decisão","Apenas saudação","Nenhum detalhe","Somente peso"],"correct":0},
                {"question":"Uma recusa deve ser:","options":["Justificada e registrada","Informal e verbal apenas","Oculta no processo","Decidida sem evidência"],"correct":0}
            ]'::jsonb,
            '../assets/academy-screenshots/advanced-baggage-courses/dpr-web.png',
            $material$Curso avançado para formar análise técnica em DPR. O aluno aprende a separar dano físico de violação, conferir evidências, preencher campos técnicos, orientar passageiro e registrar encerramento com rastreabilidade.

O processo deve responder três perguntas: o que aconteceu, onde está a evidência e qual decisão é sustentada pelo procedimento. A postura profissional exige acolher o passageiro sem prometer compensação antes da análise.

Mensagem principal: DPR forte é aquele que combina atendimento humano com decisão documentada.$material$,
            249
        ),
        (
            'entrevista-passageiro-ahl',
            'Entrevista com Passageiro em AHL',
            'Coleta de dados sem erro',
            'bagagem',
            'Intermediário',
            '1h 15min',
            '#8b5cf6',
            'Curso para conduzir entrevista de extravio com perguntas certas, descrição visual, contatos, conteúdo, rota e acompanhamento.',
            '[
                {"title":"Acolhimento inicial","type":"Atendimento","duration":"12 min","content":"O passageiro chega frustrado. O agente precisa acolher, explicar o processo e conduzir a coleta com calma."},
                {"title":"Perguntas essenciais","type":"Roteiro prático","duration":"16 min","content":"Confirme etiqueta, nome, rota, conexões, volumes, descrição da bagagem, conteúdo, endereço e telefone."},
                {"title":"Descrição visual com chart","type":"Consulta guiada","duration":"16 min","content":"Use cor, tipo, marca, peso, elementos externos e conteúdo para fortalecer o match."},
                {"title":"Dados de contato e entrega","type":"Qualidade de cadastro","duration":"14 min","content":"Telefone, e-mail, endereço, disponibilidade e observações reduzem falha na entrega posterior."},
                {"title":"Pós-abertura e acompanhamento","type":"Fluxo","duration":"17 min","content":"Após abrir o AHL, acompanhe mensagens, matches, histórico, BDO e comunicação com o passageiro."}
            ]'::jsonb,
            '[
                {"label":"AHL Web","href":"ahl.html"},
                {"label":"Chart IATA","href":"course.html?id=chart-bagagem-iata"},
                {"label":"Action File","href":"action-file.html"},
                {"label":"Máscara AHL WorldTracer","href":"worldtracer/ahl.html"}
            ]'::jsonb,
            '[
                {"question":"A entrevista AHL deve começar com:","options":["Acolhimento e explicação clara do processo","Culpar o passageiro","Prometer entrega imediata","Ignorar conexão"],"correct":0},
                {"question":"Pergunta essencial em AHL é:","options":["Quantos volumes foram despachados e qual a etiqueta","Qual comida o passageiro prefere","Se deseja certificado","Qual cor do balcão"],"correct":0},
                {"question":"O chart ajuda a:","options":["Padronizar descrição visual da bagagem","Calcular tarifa","Emitir embarque","Trocar voo"],"correct":0},
                {"question":"Contato e endereço são importantes porque:","options":["Permitem comunicação e entrega correta","Substituem a etiqueta","Encerram o processo automaticamente","Não têm uso operacional"],"correct":0},
                {"question":"Depois da abertura do AHL, o agente deve:","options":["Acompanhar mensagens, matches e histórico","Nunca mais consultar","Apagar dados","Abrir outro processo igual"],"correct":0},
                {"question":"Uma boa entrevista evita:","options":["Erro de registro e match fraco","Atendimento cordial","Dados completos","Descrição objetiva"],"correct":0}
            ]'::jsonb,
            '../assets/academy-screenshots/advanced-baggage-courses/ahl-web.png',
            $material$Curso centrado na conversa com o passageiro. A entrevista não é interrogatório: é coleta guiada para transformar uma situação de estresse em registro útil.

Perguntas essenciais: nome como consta na etiqueta, número da etiqueta, rota completa, conexão, quantidade de volumes, descrição visual, conteúdo relevante, medicamentos, documentos, endereço, telefone, e-mail e disponibilidade para entrega.

Mensagem principal: AHL bom nasce de entrevista boa. O sistema só encontra aquilo que foi registrado com precisão.$material$,
            250
        ),
        (
            'auditoria-processos-bagagem',
            'Auditoria de Processos de Bagagem',
            'Qualidade e supervisão',
            'bagagem',
            'Avançado',
            '1h 30min',
            '#22c55e',
            'Curso para revisar AHL, OHD, DPR, RFP e Action File com foco em qualidade, rastreabilidade, indicadores e melhoria contínua.',
            '[
                {"title":"O que auditar em bagagem","type":"Aula","duration":"15 min","content":"A auditoria verifica completude, coerência, prazo, evidência, mensagens e status dos processos."},
                {"title":"Indicadores de qualidade","type":"Gestão","duration":"16 min","content":"Use métricas de acesso, conclusão, aprovação, tempo de resposta, reincidência e pendências."},
                {"title":"Checklist de AHL e OHD","type":"Revisão prática","duration":"18 min","content":"Compare rota, etiqueta, descrição, conteúdo, matches, ROH, FOH, BDO e histórico."},
                {"title":"Checklist de DPR e RFP","type":"Revisão prática","duration":"18 min","content":"Verifique evidências, prazo, descrição, classificação, responsabilidade, contato e encerramento."},
                {"title":"Plano de melhoria","type":"Debriefing","duration":"23 min","content":"Transforme falhas recorrentes em treinamento, ajuste de processo e acompanhamento."}
            ]'::jsonb,
            '[
                {"label":"Admin","href":"admin.html"},
                {"label":"AHL Web","href":"ahl.html"},
                {"label":"DPR Web","href":"dpr.html"},
                {"label":"Action File","href":"action-file.html"}
            ]'::jsonb,
            '[
                {"question":"Auditoria de bagagem busca principalmente:","options":["Qualidade, coerência e rastreabilidade","Punir sem análise","Apagar processos","Substituir atendimento"],"correct":0},
                {"question":"Um processo fraco costuma ter:","options":["Dados incompletos e histórico pobre","Descrição objetiva","Evidência anexada","Prazo conferido"],"correct":0},
                {"question":"Indicadores ajudam a:","options":["Identificar reincidência e treinar melhor","Esconder falhas","Evitar cursos","Eliminar registros"],"correct":0},
                {"question":"AHL e OHD devem ser comparados por:","options":["Rota, etiqueta, descrição, conteúdo e histórico","Apenas nome do agente","Cor do botão","Tema da tela"],"correct":0},
                {"question":"DPR exige auditoria de:","options":["Evidência, prazo, classificação e encerramento","Somente imagem do logo","Apenas curso do aluno","Nenhum documento"],"correct":0},
                {"question":"A auditoria deve gerar:","options":["Plano de melhoria e treinamento","Somente reclamação","Exclusão de dados","Silêncio operacional"],"correct":0}
            ]'::jsonb,
            '../assets/academy-screenshots/advanced-baggage-courses/admin-metrics.png',
            $material$Curso para supervisores, instrutores e agentes avançados. A auditoria organiza a qualidade dos processos de bagagem, revisando se o registro sustenta a decisão e se a equipe acompanha pendências.

Checklist-base: dados obrigatórios, coerência da rota, descrição visual, conteúdo, contatos, prazos, evidências, mensagens, matches, ações abertas, status e encerramento.

Mensagem principal: auditoria boa não procura culpado; procura padrão, causa e melhoria.$material$,
            251
        ),
        (
            'simulacao-integrada-checkin-worldtracer',
            'Simulação Integrada: Do Check-in ao WorldTracer',
            'Fluxo completo de bagagem',
            'bagagem',
            'Avançado',
            '1h 40min',
            '#06b6d4',
            'Curso-simulação que acompanha a bagagem do check-in ao BHS, Make-Up, Loading e irregularidades no WorldTracer.',
            '[
                {"title":"Check-in e nascimento da bagagem","type":"Simulação","duration":"18 min","content":"Gere bagagem, confira tag, passageiro, PNR, voo, rota, peso e status inicial."},
                {"title":"BHS e triagem","type":"Simulação","duration":"18 min","content":"Acompanhe leitura da tag, fila, destino, peso e movimentação para a etapa correta."},
                {"title":"Make-Up e preparação do voo","type":"Simulação","duration":"18 min","content":"Agrupe bagagens por voo e envie para loading quando o voo estiver pronto."},
                {"title":"Loading e finalização","type":"Simulação","duration":"20 min","content":"Carregue volumes no voo, finalize carregamento e observe impacto nos indicadores."},
                {"title":"Irregularidade e WorldTracer","type":"Caso completo","duration":"26 min","content":"Quando algo falha, abra AHL, OHD, DPR ou RFP, acompanhe Action File e feche o ciclo."}
            ]'::jsonb,
            '[
                {"label":"Check-In","href":"checkin.html"},
                {"label":"BHS","href":"bhs.html"},
                {"label":"Make-Up","href":"makeup.html"},
                {"label":"Loading","href":"loading.html"},
                {"label":"WorldTracer AHL","href":"worldtracer/ahl.html"}
            ]'::jsonb,
            '[
                {"question":"O fluxo integrado começa em:","options":["Check-in e geração da bagagem","DPR direto","Certificado","Admin"],"correct":0},
                {"question":"No BHS, a atenção principal é:","options":["Leitura, rota, destino e movimentação","Contato do passageiro","Endereço de entrega","Quiz do curso"],"correct":0},
                {"question":"Make-Up organiza bagagens por:","options":["Voo em preparação","Nome do aluno","Senha do admin","Cor da tela"],"correct":0},
                {"question":"Loading confirma:","options":["Bagagens carregadas no voo","Apenas conteúdo da mala","Aprovação do curso","E-mail do passageiro"],"correct":0},
                {"question":"Uma falha no fluxo pode gerar:","options":["AHL, OHD, DPR, RFP ou Action File","Somente logout","Mudança de logo","Nada operacional"],"correct":0},
                {"question":"A simulação completa treina:","options":["Visão ponta a ponta da bagagem","Somente um botão","Apenas teoria sem tela","Somente certificados"],"correct":0}
            ]'::jsonb,
            '../assets/academy-screenshots/advanced-baggage-courses/baggage-claim-checkin.png',
            $material$Curso final de integração operacional. O aluno acompanha a bagagem desde a criação no check-in até triagem, make-up, loading e eventual irregularidade em WorldTracer.

Roteiro prático: gerar bagagem, verificar tag e rota, mover pelo BHS, preparar voo no make-up, enviar para loading, finalizar carregamento e analisar o que acontece quando a bagagem não segue o caminho esperado.

Mensagem principal: quem entende o fluxo completo registra melhor, comunica melhor e resolve irregularidade com mais segurança.$material$,
            252
        )
    ) as t(id, title, eyebrow, category, level, duration, color, summary, modules, labs, quiz, cover_path, material, sort_order)
)
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
select
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
from course_seed
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

update public.academy_courses
set modules = jsonb_set(modules, '{0,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/baggage-claim-checkin.png","title":"Bagagens recebidas e indicadores","caption":"O desembarque começa antes da reclamação: a equipe precisa conferir voos, volumes e status das bagagens."}]'::jsonb, true)
where id = 'baggage-claim-desembarque';
update public.academy_courses
set modules = jsonb_set(modules, '{1,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/ahl-web.png","title":"Tela AHL para abertura do caso","caption":"Quando a bagagem não aparece, a triagem conduz para registro com dados da bagagem, viagem e passageiro."}]'::jsonb, true)
where id = 'baggage-claim-desembarque';
update public.academy_courses
set modules = jsonb_set(modules, '{2,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/ohd-web.png","title":"Consulta OHD","caption":"Pesquisar OHDs e matches evita abrir ou manter casos sem checar bagagens sobrantes."}]'::jsonb, true)
where id = 'baggage-claim-desembarque';
update public.academy_courses
set modules = jsonb_set(modules, '{3,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/ahl-history.png","title":"Histórico ROH e FOH","caption":"O histórico operacional documenta pedidos e respostas entre bases durante a busca."}]'::jsonb, true)
where id = 'baggage-claim-desembarque';
update public.academy_courses
set modules = jsonb_set(modules, '{4,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/bdo-history.png","title":"BDO e entrega","caption":"Após localização, a entrega precisa ser registrada com serviço, endereço, data e conteúdo relevante."}]'::jsonb, true)
where id = 'baggage-claim-desembarque';

update public.academy_courses
set modules = jsonb_set(modules, '{0,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/connections-bhs.png","title":"Fila no BHS","caption":"A conexão crítica começa na leitura da fila: rota, destino e tempo disponível para transferir o volume."}]'::jsonb, true)
where id = 'conexoes-criticas-mct-pratica';
update public.academy_courses
set modules = jsonb_set(modules, '{1,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/connections-makeup.png","title":"Make-Up por voo","caption":"Agrupar bagagens por voo ajuda a enxergar prioridade e risco de perda de conexão."}]'::jsonb, true)
where id = 'conexoes-criticas-mct-pratica';
update public.academy_courses
set modules = jsonb_set(modules, '{2,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/integrated-loading.png","title":"Loading e carregamento","caption":"O carregamento confirma se o volume realmente chegou ao voo correto."}]'::jsonb, true)
where id = 'conexoes-criticas-mct-pratica';
update public.academy_courses
set modules = jsonb_set(modules, '{3,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/action-file-inbox.png","title":"Mensagens e pendências","caption":"Conexões críticas podem gerar mensagens no Action File quando há pendência operacional."}]'::jsonb, true)
where id = 'conexoes-criticas-mct-pratica';
update public.academy_courses
set modules = jsonb_set(modules, '{4,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/ahl-web.png","title":"Efeito no destino","caption":"Quando a mala não conecta, o impacto aparece no destino como atendimento de extravio."}]'::jsonb, true)
where id = 'conexoes-criticas-mct-pratica';

update public.academy_courses
set modules = jsonb_set(modules, '{0,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/action-file-inbox.png","title":"Station Inbox","caption":"A caixa de ações concentra mensagens, matches, prompts e pendências por dia operacional."}]'::jsonb, true)
where id = 'mensagens-worldtracer-action-file';
update public.academy_courses
set modules = jsonb_set(modules, '{1,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/action-file-create.png","title":"Criar mensagem ou ação","caption":"Uma ação bem registrada informa processo, referência, base, companhia, código e orientação."}]'::jsonb, true)
where id = 'mensagens-worldtracer-action-file';
update public.academy_courses
set modules = jsonb_set(modules, '{2,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/ahl-history.png","title":"ROH e FOH no AHL","caption":"Pedidos de OHD e respostas entre aeroportos precisam ser objetivos e rastreáveis."}]'::jsonb, true)
where id = 'mensagens-worldtracer-action-file';
update public.academy_courses
set modules = jsonb_set(modules, '{3,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/bdo-history.png","title":"BDO no histórico","caption":"A ordem de entrega mostra como a mensagem operacional vira ação prática para o passageiro."}]'::jsonb, true)
where id = 'mensagens-worldtracer-action-file';
update public.academy_courses
set modules = jsonb_set(modules, '{4,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/ohd-web.png","title":"Processos OHD","caption":"Mensagens e matches devem ser conferidos contra dados do OHD e do AHL antes de agir."}]'::jsonb, true)
where id = 'mensagens-worldtracer-action-file';

update public.academy_courses
set modules = jsonb_set(modules, '{0,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/dpr-web.png","title":"DPR na interface web","caption":"O registro de dano exige dados base, bagagem, ocorrência, passageiro e dano ou violação."}]'::jsonb, true)
where id = 'dpr-avancado-responsabilidade';
update public.academy_courses
set modules = jsonb_set(modules, '{1,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/dpr-worldtracer.png","title":"Máscara DPR WorldTracer","caption":"Na máscara operacional, códigos de elemento, localização e extensão do dano precisam estar coerentes."}]'::jsonb, true)
where id = 'dpr-avancado-responsabilidade';
update public.academy_courses
set modules = jsonb_set(modules, '{2,screenshots}', '[{"src":"../assets/academy-screenshots/chart-iata/chart-iata-code-reading.jpg","title":"Descrição visual de apoio","caption":"O chart ajuda a descrever a bagagem danificada com cor, tipo e elementos externos."}]'::jsonb, true)
where id = 'dpr-avancado-responsabilidade';
update public.academy_courses
set modules = jsonb_set(modules, '{3,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/dpr-web.png","title":"Campos de dano e violação","caption":"A decisão de aceitar, recusar ou encaminhar depende de evidência, prazo e coerência do relato."}]'::jsonb, true)
where id = 'dpr-avancado-responsabilidade';
update public.academy_courses
set modules = jsonb_set(modules, '{4,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/action-file-create.png","title":"Encaminhamento registrado","caption":"Quando há pendência, a ação deve documentar responsabilidade, prioridade e orientação."}]'::jsonb, true)
where id = 'dpr-avancado-responsabilidade';

update public.academy_courses
set modules = jsonb_set(modules, '{0,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/ahl-web.png","title":"Formulário AHL","caption":"A entrevista transforma relato do passageiro em dados estruturados para busca."}]'::jsonb, true)
where id = 'entrevista-passageiro-ahl';
update public.academy_courses
set modules = jsonb_set(modules, '{1,screenshots}', '[{"src":"../assets/academy-screenshots/chart-iata/chart-iata-code-reading.jpg","title":"Descrição da bagagem","caption":"Use o chart para confirmar cor, tipo, marca, peso, conteúdo e sinais visíveis."}]'::jsonb, true)
where id = 'entrevista-passageiro-ahl';
update public.academy_courses
set modules = jsonb_set(modules, '{2,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/ahl-history.png","title":"Histórico da ocorrência","caption":"Cada contato e cada mensagem precisam ficar registrados para continuidade do atendimento."}]'::jsonb, true)
where id = 'entrevista-passageiro-ahl';
update public.academy_courses
set modules = jsonb_set(modules, '{3,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/bdo-history.png","title":"Preparação para entrega","caption":"Endereço, telefone e disponibilidade do passageiro evitam falhas no BDO."}]'::jsonb, true)
where id = 'entrevista-passageiro-ahl';
update public.academy_courses
set modules = jsonb_set(modules, '{4,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/action-file-inbox.png","title":"Acompanhamento após abertura","caption":"O AHL não termina na criação: mensagens, matches e pendências precisam ser acompanhados."}]'::jsonb, true)
where id = 'entrevista-passageiro-ahl';

update public.academy_courses
set modules = jsonb_set(modules, '{0,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/admin-metrics.png","title":"Painel administrativo","caption":"Auditoria começa olhando volume de acessos, cursos, aprovações, certificados e atividade."}]'::jsonb, true)
where id = 'auditoria-processos-bagagem';
update public.academy_courses
set modules = jsonb_set(modules, '{1,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/admin-accounts.png","title":"Detalhe por conta","caption":"O acompanhamento por aluno ajuda a identificar lacunas de treinamento e necessidade de reforço."}]'::jsonb, true)
where id = 'auditoria-processos-bagagem';
update public.academy_courses
set modules = jsonb_set(modules, '{2,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/ahl-history.png","title":"Qualidade do histórico AHL","caption":"Mensagens ROH/FOH mostram se o processo tem rastreabilidade suficiente."}]'::jsonb, true)
where id = 'auditoria-processos-bagagem';
update public.academy_courses
set modules = jsonb_set(modules, '{3,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/dpr-worldtracer.png","title":"Conferência de DPR","caption":"Campos técnicos do DPR devem bater com evidência, relato e classificação do dano."}]'::jsonb, true)
where id = 'auditoria-processos-bagagem';
update public.academy_courses
set modules = jsonb_set(modules, '{4,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/action-file-inbox.png","title":"Pendências operacionais","caption":"Action File ajuda a auditar ações abertas, status, prioridade e tempo de resposta."}]'::jsonb, true)
where id = 'auditoria-processos-bagagem';

update public.academy_courses
set modules = jsonb_set(modules, '{0,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/baggage-claim-checkin.png","title":"Check-in de bagagens","caption":"A simulação integrada começa com geração de bagagem, etiqueta, rota, peso e status inicial."}]'::jsonb, true)
where id = 'simulacao-integrada-checkin-worldtracer';
update public.academy_courses
set modules = jsonb_set(modules, '{1,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/connections-bhs.png","title":"Triagem BHS","caption":"No BHS, a bagagem é localizada e movimentada para o próximo ponto do fluxo."}]'::jsonb, true)
where id = 'simulacao-integrada-checkin-worldtracer';
update public.academy_courses
set modules = jsonb_set(modules, '{2,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/connections-makeup.png","title":"Make-Up","caption":"A área de make-up prepara volumes por voo antes do envio ao carregamento."}]'::jsonb, true)
where id = 'simulacao-integrada-checkin-worldtracer';
update public.academy_courses
set modules = jsonb_set(modules, '{3,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/integrated-loading.png","title":"Loading","caption":"O carregamento finaliza o ciclo operacional do voo ou revela falhas para investigação."}]'::jsonb, true)
where id = 'simulacao-integrada-checkin-worldtracer';
update public.academy_courses
set modules = jsonb_set(modules, '{4,screenshots}', '[{"src":"../assets/academy-screenshots/advanced-baggage-courses/ahl-web.png","title":"WorldTracer e irregularidade","caption":"Quando o fluxo falha, a simulação conduz para AHL, OHD, DPR, RFP e Action File."}]'::jsonb, true)
where id = 'simulacao-integrada-checkin-worldtracer';
