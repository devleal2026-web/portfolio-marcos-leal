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
    'interpretacao-etiqueta-bagagem',
    'Interpretacao de Etiqueta de Bagagem',
    'Rastreabilidade operacional',
    'bagagem',
    'Basico',
    '1h 45min',
    '#0f766e',
    'Leitura de etiqueta de bagagem, LPN, codigo de barras, codigos IATA, rota de baixo para cima, conexoes e situacoes especiais.',
    '[{"title":"Funcao da etiqueta","type":"Aula","duration":"12 min","content":"A etiqueta de bagagem e o principal documento operacional da mala. Ela identifica, rastreia e direciona a bagagem dentro da cadeia aeroportuaria."},{"title":"Estrutura da etiqueta","type":"Consulta","duration":"16 min","content":"Codigo de barras, LPN, companhia emissora, aeroportos IATA, destino final, conexoes, voo e comprovante do passageiro formam a leitura basica."},{"title":"LPN e rastreabilidade","type":"Aula","duration":"14 min","content":"O License Plate Number e o numero unico da bagagem. Ele deve ser conferido em registros de irregularidade, busca, devolucao e rastreamento."},{"title":"Codigos IATA de aeroporto","type":"Consulta","duration":"14 min","content":"Codigos IATA possuem tres letras e identificam aeroportos ou cidades. Exemplos: GRU, GIG, REC, CWB, MIA, JFK, CDG."},{"title":"Leitura correta da rota","type":"Pratica guiada","duration":"18 min","content":"A rota impressa na etiqueta deve ser lida de baixo para cima: origem na parte inferior, conexao no meio e destino final no topo."},{"title":"Bagagem prioritaria, rush e reetiquetada","type":"Procedimento","duration":"16 min","content":"Etiquetas especiais exigem atencao redobrada, principalmente em bagagem prioritaria, rush, reetiquetada ou irregular."},{"title":"Fluxo operacional da bagagem","type":"Simulacao","duration":"16 min","content":"O fluxo inclui check-in, emissao da etiqueta, triagem, leitura automatizada, carregamento, transferencia em conexoes e restituicao."},{"title":"Boas praticas e erros comuns","type":"Exercicio","duration":"19 min","content":"Conferir destino final, rota, LPN e conexoes reduz erro de despacho, extravio, envio incorreto e falha na comunicacao ao passageiro."}]'::jsonb,
    '[{"label":"Simular Check-In","href":"checkin.html"},{"label":"AHL para irregularidade","href":"ahl.html"},{"label":"OHD para bagagem sobrante","href":"ohd.html"}]'::jsonb,
    '[{"question":"Qual e a funcao principal da etiqueta de bagagem?","options":["Apenas comprovar pagamento","Identificar, rastrear e direcionar a bagagem","Substituir o documento do passageiro","Informar somente o peso da mala"],"correct":1},{"question":"O que significa LPN na etiqueta de bagagem?","options":["Local Passenger Name","License Plate Number","Loading Priority Number","Lost Property Notice"],"correct":1},{"question":"Por que o LPN e importante?","options":["Define o preco da passagem","Identifica unicamente a bagagem no rastreamento","Mostra apenas o destino final","Indica o assento do passageiro"],"correct":1},{"question":"Os codigos IATA de aeroporto normalmente possuem:","options":["Duas letras","Tres letras","Quatro numeros","Uma letra e dois numeros"],"correct":1},{"question":"Como a rota da etiqueta deve ser lida?","options":["De cima para baixo","Da esquerda para direita","De baixo para cima","Somente pelo codigo de barras"],"correct":2},{"question":"Na leitura da etiqueta, a parte inferior normalmente representa:","options":["Destino final","Origem","Peso","Nome do passageiro"],"correct":1},{"question":"A parte superior da sequencia de aeroportos normalmente indica:","options":["Origem","Conexao anterior","Destino final","Balanca utilizada"],"correct":2},{"question":"Bagagem rush indica, em geral:","options":["Bagagem enviada depois do voo original","Bagagem de cortesia","Bagagem de cabine","Bagagem sem necessidade de rastreio"],"correct":0},{"question":"Qual campo deve ser usado como referencia principal em irregularidade?","options":["Cor da mala","LPN/TN da etiqueta","Nome do atendente","Portao de embarque"],"correct":1},{"question":"Uma boa pratica antes do despacho e:","options":["Conferir destino final, rota e conexoes","Ler apenas a primeira linha","Ignorar conexoes","Usar somente a cor da bagagem"],"correct":0},{"question":"Se a etiqueta estiver ilegivel ou danificada, o agente deve:","options":["Despachar assim mesmo sem conferencia","Reimprimir ou corrigir conforme procedimento local","Retirar a bagagem do passageiro sem registro","Alterar o destino manualmente sem validar"],"correct":1},{"question":"A leitura errada da rota pode causar:","options":["Aumento de milhas","Erro de despacho ou extravio","Melhor rastreio","Cancelamento automatico do voo"],"correct":1}]'::jsonb,
    '',
    'Funcao da etiqueta

Objetivo da trilha
Compreender a funcao da etiqueta de bagagem no transporte aereo e sua importancia para rastreabilidade, despacho correto e tratativa de irregularidades.

A etiqueta de bagagem e o principal documento operacional da mala. Sem uma etiqueta valida, a bagagem perde sua identificacao formal no fluxo aeroportuario e se torna muito mais dificil de rastrear. Ela e emitida no check-in para bagagens despachadas e acompanha a mala desde a entrega pelo passageiro ate a restituicao no destino.

A etiqueta identifica a bagagem, orienta o sistema automatizado, apoia a leitura humana dos agentes e permite conectar a mala ao passageiro, ao voo, ao itinerario e aos registros de irregularidade. Tudo o que acontece com a mala - despacho, conexao, falha de carregamento, envio incorreto, extravio, localizacao ou devolucao - depende das informacoes impressas e registradas nessa etiqueta.

Na operacao diaria, o agente deve entender que a etiqueta nao e apenas um adesivo. Ela e uma chave operacional. Uma leitura incorreta pode gerar despacho para destino errado, perda de conexao, criacao equivocada de AHL/OHD, demora na busca e insatisfacao do passageiro.

Pontos essenciais
- A etiqueta identifica a bagagem despachada.
- A etiqueta orienta a triagem e o carregamento.
- A etiqueta permite rastreabilidade em sistemas de bagagem.
- A etiqueta ajuda a comprovar origem, destino e conexoes.
- A etiqueta deve ser protegida, lida e registrada corretamente.

Exemplo operacional
Um passageiro desembarca e informa que sua mala nao chegou. Antes de qualquer conclusao, o agente confere o comprovante de bagagem, identifica o numero da etiqueta e usa esse dado como referencia principal para busca e abertura do registro de irregularidade.

Estrutura da etiqueta

Objetivo da trilha
Identificar os principais campos de uma etiqueta de bagagem e compreender como cada informacao apoia a operacao.

Uma etiqueta de bagagem normalmente contem informacoes destinadas a leitura automatizada e leitura humana. O sistema de triagem utiliza o codigo de barras para direcionar a mala, enquanto os agentes utilizam campos impressos para conferencia visual, orientacao, reetiquetagem e investigacao.

Campos principais
- Codigo de barras: permite leitura automatizada no sistema de triagem.
- LPN ou TN: numero unico de identificacao da bagagem.
- Companhia emissora: indica quem emitiu a etiqueta.
- Codigo IATA dos aeroportos: identifica origem, conexoes e destino.
- Voo e data: ajudam a confirmar o trecho operacional.
- Nome ou referencia do passageiro: quando disponivel, auxilia na associacao com a viagem.
- Stub ou comprovante: parte entregue ao passageiro para conferencias futuras.

A leitura deve ser feita com calma. Em momentos de pressa, e comum olhar apenas o destino mais visivel e ignorar conexoes. Esse erro pode direcionar a mala para um ponto intermediario ou fazer o agente interpretar destino final como origem.

Boa pratica
Sempre confira tres elementos juntos: numero da etiqueta, rota e destino final. Se houver conexao, valide a sequencia completa antes de orientar, separar ou enviar a bagagem.

LPN e rastreabilidade

Objetivo da trilha
Entender o papel do License Plate Number na identificacao unica da bagagem.

LPN significa License Plate Number. Na pratica, e a placa de identificacao da mala dentro da operacao. Assim como um veiculo possui uma placa unica, a bagagem despachada possui um numero que permite rastrear eventos, localizar registros, abrir irregularidades e vincular a mala ao passageiro.

O LPN pode aparecer junto ao codigo de barras e tambem em formato numerico ou alfanumerico, dependendo do padrao utilizado. Em muitos processos operacionais, ele tambem e chamado de TN, Bag Tag Number ou numero da etiqueta.

Por que conferir o LPN
- Evita abrir processo com numero errado.
- Ajuda a localizar mensagens de encaminhamento.
- Permite comparar AHL, OHD e registros de carregamento.
- Reduz risco de entregar mala errada.
- Ajuda em auditoria e historico operacional.

Situacoes em que o LPN e essencial
- Passageiro sem bagagem no desembarque.
- Mala localizada sem passageiro.
- Bagagem enviada por rush.
- Reetiquetagem por falha, dano ou alteracao de rota.
- Conferencia de entrega ao passageiro.

Erro comum
Copiar apenas parte do numero ou confundir caracteres parecidos. Sempre confirme o numero com o comprovante, com a etiqueta fisica e com o sistema antes de salvar um processo.

Codigos IATA de aeroporto

Objetivo da trilha
Reconhecer os codigos IATA impressos na etiqueta e interpretar sua funcao na rota.

Os codigos IATA de aeroporto possuem tres letras e identificam aeroportos ou cidades na operacao aerea. Eles aparecem na etiqueta para indicar origem, conexoes e destino final. Exemplos comuns incluem GRU, GIG, REC, CWB, MIA, JFK, LHR e CDG.

Esses codigos sao essenciais porque permitem leitura rapida por agentes, sistemas automatizados e equipes de rampa. Um erro de interpretacao pode levar a bagagem para aeroporto incorreto, causar atraso na conexao ou gerar abertura indevida de irregularidade.

Como interpretar
- Verifique todos os aeroportos impressos.
- Identifique qual e a origem.
- Localize conexoes intermediarias.
- Confirme o destino final.
- Compare a etiqueta com o itinerario do passageiro.

Exemplo
Uma etiqueta apresenta CWB, GRU e MIA. Se lida de forma correta, a sequencia indica que a bagagem saiu de CWB, conectou em GRU e tem destino final MIA. Se o agente ler de cima para baixo sem criterio, pode interpretar o destino como origem e direcionar a tratativa de forma errada.

Ponto de atencao
Alguns aeroportos e cidades podem gerar confusao por siglas parecidas. Sempre confira a rota completa, nao apenas um codigo isolado.

Leitura correta da rota

Objetivo da trilha
Aplicar a regra operacional critica: a rota impressa na etiqueta deve ser lida de baixo para cima.

A leitura correta da rota e uma das competencias mais importantes na interpretacao de etiqueta de bagagem. Em muitas etiquetas, a sequencia de aeroportos aparece verticalmente. A regra operacional e ler de baixo para cima.

Regra pratica
- Parte inferior: origem da bagagem.
- Parte central: conexao ou conexoes.
- Parte superior: destino final.

Essa regra evita um dos erros mais comuns: ler a etiqueta de cima para baixo e inverter a rota. Quando isso acontece, o agente pode achar que a mala deveria ir para a origem, quando na verdade a origem esta na parte inferior da etiqueta.

Exemplo guiado
Se a etiqueta apresenta, de cima para baixo:
MIA
GRU
CWB

A leitura correta e CWB/GRU/MIA. A mala saiu de CWB, conecta em GRU e segue para MIA.

Aplicacao no atendimento
Ao receber uma reclamação de bagagem, o agente deve comparar o itinerario informado pelo passageiro com a leitura de baixo para cima da etiqueta. Se houver divergencia, deve investigar antes de registrar conclusoes no sistema.

Ponto de atencao
A excelencia operacional comeca na leitura correta da etiqueta. Quando a rota e compreendida corretamente, o agente melhora a busca, reduz retrabalho e orienta o passageiro com mais seguranca.

Bagagem prioritaria, rush e reetiquetada

Objetivo da trilha
Identificar etiquetas em condicoes operacionais diferenciadas e entender os cuidados de conferencia.

Nem toda etiqueta representa uma bagagem em fluxo normal. Algumas malas recebem tratamento especial por prioridade, atraso, reenvio, reetiquetagem ou irregularidade. Esses casos exigem atencao redobrada, porque normalmente envolvem prazo curto, passageiro aguardando, conexao sensivel ou historico de falha anterior.

Bagagem prioritaria
Indica necessidade de tratamento diferenciado, normalmente ligada ao perfil do passageiro, classe de servico, conexao ou processo operacional. Deve ser separada e carregada conforme regra local.

Bagagem rush
E usada quando a bagagem nao seguiu no voo original ou precisa ser encaminhada posteriormente. A etiqueta rush deve estar associada a uma mensagem ou registro que justifique o envio, informando voo, rota, data e destino.

Bagagem reetiquetada
Ocorre quando a etiqueta original precisa ser substituida por dano, falha de leitura, alteracao de voo ou redirecionamento. A reetiquetagem deve preservar rastreabilidade e evitar duplicidade de informacao.

Bagagem irregular
Pode envolver etiqueta ilegivel, rota divergente, tag danificada, bagagem sem comprovante claro ou mala localizada fora do fluxo esperado. Nesses casos, o agente deve investigar antes de enviar ou entregar.

Checklist rapido
- Conferir LPN/TN.
- Conferir rota de baixo para cima.
- Confirmar destino final.
- Validar voo/data.
- Verificar se ha mensagem operacional relacionada.
- Registrar qualquer divergencia no historico apropriado.

Fluxo operacional da bagagem

Objetivo da trilha
Visualizar o caminho da bagagem desde o check-in ate a restituicao ao passageiro.

O fluxo operacional da bagagem comeca no check-in, quando a mala e pesada, aceita e etiquetada. A partir desse momento, a etiqueta passa a orientar todas as etapas seguintes.

Etapas do fluxo
1. Check-in e emissao da etiqueta.
2. Entrega da bagagem ao sistema de triagem.
3. Leitura automatizada do codigo de barras.
4. Separacao por voo, destino ou conexao.
5. Transporte ate a aeronave correta.
6. Carregamento no porao ou equipamento previsto.
7. Transferencia em conexoes, quando houver.
8. Descarregamento no destino.
9. Restituicao ao passageiro.

Em cada etapa, a etiqueta pode ser lida por sistema, agente ou equipe operacional. Por isso, a qualidade da impressao, fixacao e conferencia da etiqueta influencia diretamente o resultado final.

Riscos operacionais
- Codigo de barras danificado.
- Etiqueta mal fixada.
- Leitura incorreta da rota.
- Bagagem separada no pier errado.
- Perda de conexao por atraso no manuseio.
- Falha de comunicacao entre areas.

Mensagem principal
Por tras de cada mala entregue corretamente, existe uma cadeia de profissionais que interpretou e executou corretamente as informacoes da etiqueta.

Boas praticas e erros comuns

Objetivo da trilha
Padronizar condutas para reduzir falhas operacionais ligadas a leitura e registro de etiqueta.

Boas praticas
- Conferir sempre o destino final antes de despachar.
- Ler a rota de baixo para cima.
- Confirmar conexoes quando existirem.
- Usar o LPN/TN como referencia principal.
- Guardar e orientar o passageiro sobre o comprovante da bagagem.
- Registrar corretamente o numero da etiqueta em AHL, OHD, DPR ou outro processo.
- Investigar etiquetas ilegíveis, rasgadas ou divergentes antes de concluir a tratativa.

Erros comuns
- Ler a rota de cima para baixo.
- Copiar numero incompleto da etiqueta.
- Confundir aeroporto de conexao com destino final.
- Ignorar etiqueta rush ou reetiquetagem.
- Entregar mala sem conferir etiqueta e documento.
- Abrir processo sem validar o comprovante do passageiro.

Conduta esperada
Quando houver duvida, o agente deve parar, conferir e registrar. A pressa nao pode substituir a verificacao. A etiqueta de bagagem concentra informacoes essenciais, e sua leitura correta protege o passageiro, a operacao e a credibilidade do atendimento.

Resumo final
A correta interpretacao da etiqueta garante rastreabilidade, fluidez operacional e integridade do servico. O profissional que domina LPN, codigos IATA, leitura de rota e situacoes especiais reduz extravios e atua com mais seguranca.',
    240
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
    'gestao-pessoas-rampa',
    'Gestao de Pessoas e Comportamento Assertivo na Rampa',
    'Lideranca operacional',
    'bagagem',
    'Intermediario',
    '1h 40min',
    '#0f766e',
    'Lideranca presente, comunicacao assertiva, mudanca de cultura, desenvolvimento continuo e gestao de conflitos na operacao de rampa.',
    '[{"title":"Fundamentos da gestao na rampa","type":"Aula","duration":"20 min","content":"Papel do lider como facilitador, exemplo e ponto de equilibrio entre pontualidade, seguranca, produtividade e clima da equipe."},{"title":"Comunicacao assertiva no patio","type":"Pratica guiada","duration":"18 min","content":"Comunicacao clara, curta e respeitosa sob pressao, uso correto do radio, confirmacao de entendimento e feedback imediato."},{"title":"Mudanca de cultura e osmose operacional","type":"Aula","duration":"20 min","content":"Como evitar que novos colaboradores copiem praticas erradas, criando mentoria positiva, padroes visiveis e correcao imediata."},{"title":"Desenvolvimento continuo na operacao","type":"Consulta","duration":"20 min","content":"Aprendizado diario, microtreinamentos, metas trimestrais, indicadores tecnicos e comportamentais para evolucao da equipe."},{"title":"Conflitos e seguranca psicologica","type":"Simulacao","duration":"22 min","content":"Mediacao de conflitos, canal seguro para reporte de riscos, escuta ativa e tecnica ouvir-entender-agir."}]'::jsonb,
    '[{"label":"Biblioteca Operacional","href":"operational-library.html"}]'::jsonb,
    '[{"question":"Qual e o papel central do lider na rampa?","options":["Controlar tudo sozinho sem delegar","Ser facilitador, exemplo e organizador da operacao","Ficar apenas no escritorio acompanhando mensagens","Priorizar somente a pontualidade, mesmo com risco"],"correct":1},{"question":"Uma boa pratica de lideranca antes do inicio da operacao e:","options":["Fazer briefing curto, claro e objetivo","Esperar a equipe perguntar o que fazer","Distribuir tarefas sempre para as mesmas pessoas","Corrigir erros apenas no fim do mes"],"correct":0},{"question":"Na comunicacao por radio, a regra dos 3 Cs representa:","options":["Controle, cobranca e comando","Clareza, concisao e confirmacao","Calma, carisma e competencia","Carga, cabine e conexao"],"correct":1},{"question":"Qual mensagem e mais assertiva no patio?","options":["Vai la ver o negocio no aviao","Equipe 23, loader avariado. Mover para posicao 114 em 2 minutos","Todo mundo esta fazendo errado","Resolva isso logo"],"correct":1},{"question":"O que significa osmose operacional no contexto do curso?","options":["Aprender apenas observando bons manuais","Copiar praticas erradas por convivencia e repeticao","Troca automatica de funcao na escala","Sistema de medicao de carga"],"correct":1},{"question":"Como reduzir a osmose operacional negativa?","options":["Ignorar pequenos desvios","Criar mentoria positiva e corrigir desvios imediatamente","Permitir atalhos quando o voo esta atrasado","Evitar reunioes de padronizacao"],"correct":1},{"question":"Desenvolvimento continuo na rampa inclui:","options":["Recusar reciclagens por experiencia anterior","Microtreinamentos, metas e acompanhamento de indicadores","Treinar somente novos colaboradores","Usar apenas conhecimento informal"],"correct":1},{"question":"Seguranca psicologica significa que a equipe pode:","options":["Falar riscos e falhas sem medo de punicao injusta","Ignorar procedimentos quando discordar","Evitar comunicar incidentes","Transferir responsabilidades para outro turno"],"correct":0},{"question":"A tecnica ouvir-entender-agir ajuda principalmente em:","options":["Conflitos e reportes de risco","Calculo de peso de bagagem","Emissao de etiqueta","Controle de combustivel"],"correct":0},{"question":"Um exemplo de ma lideranca operacional e:","options":["Reconhecer uma acao preventiva","Acompanhar a operacao por presenca","Ignorar sugestoes da equipe e permanecer distante","Distribuir tarefas de forma equilibrada"],"correct":2}]'::jsonb,
    '',
    'Fundamentos da gestao na rampa

Objetivo da trilha
Compreender o papel do lider de rampa como facilitador, exemplo operacional e ponto de equilibrio entre pontualidade, seguranca e comportamento da equipe.

A operacao de rampa exige lideranca presente. O lider nao atua apenas distribuindo tarefas: ele observa o ambiente, antecipa riscos, organiza prioridades, acompanha a execucao e garante que a equipe tenha condicoes reais de trabalhar com seguranca. Quando a lideranca esta distante, pequenos desvios se transformam em habitos, atrasos se repetem e a equipe perde referencia.

Impacto da lideranca
A postura do lider influencia diretamente pontualidade, seguranca operacional, uso correto dos equipamentos, cumprimento de padroes e clima da equipe. Uma equipe que percebe presenca, clareza e justica tende a responder melhor sob pressao.

O lider como facilitador
Ser facilitador significa remover obstaculos para a equipe executar bem. Isso inclui conferir escala, checar equipamentos, confirmar prioridades do voo, organizar alocacao de pessoas, ouvir alertas da equipe e agir antes que o problema cresca.

Bons exemplos
- Chegar antes do pico operacional, conferir escala, equipamentos e informacoes do voo.
- Fazer briefing claro de 5 minutos antes da operacao.
- Reconhecer um operador que agiu preventivamente e evitou incidente.
- Distribuir tarefas de forma equilibrada, evitando sobrecarregar sempre as mesmas pessoas.
- Acompanhar a operacao no patio, com gestao por presenca.

Maus exemplos
- Permanecer no escritorio sem acompanhar a operacao.
- Dar ordens sem explicar prioridade, risco ou criterio.
- Atribuir sempre tarefas pesadas para os mesmos colaboradores.
- Ignorar sugestoes da equipe.
- Cobrar resultado sem oferecer orientacao ou recursos.

Checklist de lideranca antes da operacao
- Escala conferida.
- Equipamentos disponiveis e em condicao de uso.
- Briefing realizado.
- Riscos do turno comunicados.
- Responsaveis por tarefas criticas definidos.
- Canal de comunicacao confirmado.

Pratica recomendada
Ao iniciar o turno, o lider deve reunir a equipe rapidamente e responder: qual e o foco do turno, quais voos exigem atencao, quais riscos existem, quem faz cada tarefa e como comunicar desvios. Esse pequeno ritual reduz improviso e aumenta previsibilidade.

Comunicacao assertiva no patio

Objetivo da trilha
Aplicar comunicacao clara, curta e respeitosa em ambiente operacional de alta pressao, especialmente no uso de radio, orientacao de equipe e feedback imediato.

Assertividade e comunicar com clareza e respeito. Na rampa, a comunicacao precisa ser objetiva, porque o ambiente envolve ruido, tempo curto, deslocamento de equipamentos, risco operacional e necessidade de resposta rapida. Ser assertivo nao e gritar; e dizer o que precisa ser feito, por quem, onde e em quanto tempo.

Regra dos 3 Cs
- Clareza: a mensagem deve dizer exatamente o que precisa acontecer.
- Concisao: usar poucas palavras, sem explicacao longa no radio.
- Confirmacao: garantir que o receptor entendeu e assumiu a acao.

Uso correto do radio
Mensagens por radio devem evitar ambiguidades. Uma mensagem vaga obriga o outro lado a adivinhar, aumenta retrabalho e pode gerar risco. Sempre que possivel, use identificacao da equipe, equipamento, posicao, acao e prazo.

Bom exemplo de mensagem
Equipe 23, loader avariado. Mover para posicao 114 em 2 minutos.

Por que funciona
A mensagem informa quem deve agir, qual e o problema, qual e a acao esperada, para onde deve ir e em quanto tempo.

Mau exemplo de mensagem
Vai la ver o negocio no aviao.

Por que falha
Nao informa equipe, problema, local exato, prioridade nem prazo. Em operacao real, esse tipo de mensagem gera atraso e confusao.

Feedback imediato e construtivo
Quando houver erro, o lider deve corrigir o comportamento e explicar o procedimento correto. O foco deve ser seguranca e padrao, nao humilhacao. Feedback assertivo combina fato, impacto e orientacao.

Modelo pratico
- Fato: observei que o equipamento foi posicionado fora da area combinada.
- Impacto: isso aumenta risco de interferencia na operacao.
- Orientacao: reposicione para a area marcada e confirme pelo radio.

Condutas que devem ser evitadas
- Sarcasmo ou ironia.
- Gritos sem orientacao.
- Mensagens longas no radio.
- Exposicao publica desnecessaria.
- Frases como voces sempre fazem errado.

Padronizacao de termos
A equipe deve usar termos comuns para posicoes, equipamentos, atrasos, avarias e prioridades. Quando cada pessoa usa uma palavra diferente para o mesmo problema, o risco de interpretacao aumenta.

Exercicio de aplicacao
Transforme mensagens vagas em mensagens assertivas. Exemplo: troque arruma isso ai por equipe de carregamento, conferir travamento do carrinho na posicao 2 e confirmar quando concluido.

Mudanca de cultura e osmose operacional

Objetivo da trilha
Entender como praticas erradas se espalham por repeticao e como o lider pode criar uma cultura operacional positiva, segura e padronizada.

Osmose operacional e o aprendizado informal por convivencia. Um novo colaborador observa a equipe e tende a repetir aquilo que ve, mesmo quando o comportamento nao esta escrito em procedimento. Se ele ve atalho inseguro, comunicacao ruim ou improviso constante, pode entender que aquilo e o padrao aceito.

Por que isso e perigoso
A rampa e um ambiente em que pequenos desvios podem virar rotina. Uma pratica incorreta tolerada hoje pode ser ensinada sem querer para novos colaboradores amanha. Quando a lideranca nao corrige, a equipe interpreta o silencio como permissao.

Papel do lider na cultura
O lider deve ser filtro de comportamento. Isso significa reforcar boas praticas, corrigir desvios no momento certo, explicar o motivo do padrao e escolher mentores positivos para novos colaboradores.

Bons exemplos
- Novo colaborador aprende posicionamento correto de cones desde o primeiro dia.
- Lider corrige imediatamente manuseio incorreto de equipamento.
- Mentor experiente demonstra o procedimento e explica o risco de atalhos.
- Reuniao semanal reforca padroes observados no turno.
- Boas praticas sao reconhecidas publicamente.

Maus exemplos
- Novo colaborador aprende atalho perigoso pela pista.
- Lider ignora erro recorrente para evitar conversa dificil.
- Colaborador antigo ensina que sempre foi feito assim.
- A equipe valoriza velocidade mesmo quando o procedimento e quebrado.

Mentoria positiva
A escolha de quem acompanha novos colaboradores e decisiva. Nem sempre o colaborador mais antigo e o melhor mentor. O mentor deve ter postura segura, paciencia, dominio do processo e compromisso com o padrao.

Como corrigir sem desmotivar
Correcao imediata nao precisa ser agressiva. A melhor abordagem e parar o desvio, explicar o risco, demonstrar o padrao correto e acompanhar a proxima execucao.

Roteiro de correcao
1. Interrompa o comportamento inseguro.
2. Explique o risco operacional.
3. Mostre o procedimento correto.
4. Peca confirmacao de entendimento.
5. Acompanhe a repeticao correta.

Mensagem principal
Cultura operacional e construida em detalhes. O que o lider tolera, a equipe repete. O que o lider reforca, a equipe aprende.

Desenvolvimento continuo na operacao

Objetivo da trilha
Criar uma rotina de aprendizado constante na rampa, usando microtreinamentos, indicadores tecnicos e comportamentais, metas e acompanhamento de evolucao.

Desenvolvimento continuo e a pratica de aprender e melhorar todos os dias. Na operacao, conhecimento parado vira risco. Procedimentos mudam, equipamentos variam, equipes se renovam e cenarios de pressao exigem preparo permanente.

Aprender na rotina
Treinamento nao precisa ocorrer apenas em sala. A rampa permite microaprendizados: antes do turno, apos uma falha, durante uma reciclagem rapida ou em reunioes curtas. O importante e transformar ocorrencias reais em aprendizado.

Bons exemplos
- Operador busca material para melhorar tecnica.
- Supervisor oferece microtreinamento de 10 a 15 minutos antes de um pico.
- Lider revisa um incidente e transforma em checklist.
- Equipe acompanha indicador de atraso, retrabalho ou avaria.
- Colaborador experiente compartilha pratica segura com novatos.

Maus exemplos
- Ja faco isso ha 10 anos, nao preciso aprender de novo.
- Recusar reciclagem.
- Ignorar indicador de falha recorrente.
- Treinar apenas quando ocorre acidente ou auditoria.
- Medir desempenho sem orientar melhoria.

Indicadores tecnicos e comportamentais
Indicadores ajudam o lider a enxergar fatos, nao apenas percepcoes. Alem de pontualidade, podem ser acompanhados: cumprimento de briefing, uso correto de EPI, reporte de riscos, retrabalho, avarias, absenteismo, participacao em treinamentos e aderencia a padroes.

Metas trimestrais
Metas curtas ajudam a equipe a visualizar evolucao. Exemplo: reduzir retrabalho de carregamento, aumentar reportes preventivos, melhorar cumprimento de checklist ou diminuir falhas de comunicacao no radio.

Painel de KPIs
Um painel simples e visivel pode mostrar resultado do turno, pendencias, pontos de atencao e evolucao. O objetivo nao e expor pessoas, mas orientar o time.

Microtreinamento sugerido
Tema: comunicacao por radio.
Duracao: 10 minutos.
Atividade: cada colaborador transforma uma mensagem vaga em mensagem assertiva.
Fechamento: padronizar 3 frases que a equipe passara a usar no turno.

Mensagem principal
Equipe que aprende continuamente erra menos, comunica melhor e responde com mais maturidade em situacoes de pressao.

Conflitos e seguranca psicologica

Objetivo da trilha
Gerenciar conflitos de forma construtiva e criar ambiente em que a equipe possa reportar riscos, duvidas e falhas sem medo de punicao injusta.

Conflitos na rampa podem surgir por pressao de tempo, distribuicao desigual de tarefas, falhas de comunicacao, cansaco, disputa por equipamento, divergencia entre setores ou percepcao de injustica. Ignorar conflito raramente resolve; normalmente ele reaparece em momento mais critico.

Mediacao construtiva
O lider deve ouvir as partes, separar fato de interpretacao, identificar impacto operacional e propor encaminhamento. O objetivo nao e escolher um vencedor, mas restaurar cooperacao e proteger a operacao.

Seguranca psicologica
Seguranca psicologica significa que as pessoas se sentem autorizadas a falar sobre risco, erro, duvida ou sugestao sem medo de humilhacao ou punicao injusta. Isso nao elimina responsabilidade; pelo contrario, aumenta a chance de o risco ser comunicado cedo.

Bons exemplos
- Lider intervem para redistribuir recursos e explica a decisao.
- Colaborador reporta risco sem medo.
- Equipe informa falha de equipamento antes de ocorrer incidente.
- Lider agradece reporte preventivo e corrige o processo.
- Feedback mensal permite falar de conflitos recorrentes.

Maus exemplos
- Lider ignora discussao no patio.
- Punir quem reporta falha sem avaliar contexto.
- Ridicularizar duvidas de novo colaborador.
- Resolver conflito apenas com ameaca.
- Permitir apelidos ou comentarios que desrespeitam a equipe.

Tecnica ouvir-entender-agir
Ouvir: deixe a pessoa relatar o fato sem interrupcao inicial.
Entender: confirme o que aconteceu, onde, quando e qual impacto.
Agir: defina a acao, responsavel e prazo.

Canal seguro de reporte
A equipe deve saber como comunicar problema de equipamento, desvio de seguranca, comportamento inadequado ou risco operacional. O canal pode ser uma rotina de briefing, formulario interno, lider do turno ou reuniao mensal.

Exercicio pratico
Simule uma operacao com tres problemas simultaneos: equipamento indisponivel, atraso em voo critico e discussao entre colaboradores. O participante deve definir prioridade, mensagem ao time, acao imediata e registro necessario.

Mensagem principal
Conflito bem conduzido vira aprendizado. Conflito ignorado vira risco. Um lider assertivo protege pessoas, processo e seguranca.',
    241
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
    'restituicao-bagagem-sla',
    'Restituição de Bagagem - SLA e Fluxo Operacional',
    'Operação de chegada',
    'bagagem',
    'Intermediário',
    '1h 50min',
    '#0f766e',
    'Controle de restituição de bagagem, tempos de percurso, risco por posição, SLA de esteira, análise por turno e plano de ação.',
    '[{"title":"Objetivo da restituição","type":"Aula","duration":"14 min","content":"A restituição de bagagem é o fluxo que leva os volumes descarregados da aeronave até a esteira de entrega ao passageiro. O objetivo é cumprir o SLA definido, reduzir espera, evitar acúmulo de volumes e manter comunicação operacional clara."},{"title":"Distância, percurso e risco","type":"Procedimento","duration":"16 min","content":"A distância entre a posição da aeronave, o pátio, o BHS e a área de restituição influencia diretamente o tempo de entrega. Posições próximas têm baixo risco; posições afastadas exigem mais planejamento, equipamentos e acompanhamento."},{"title":"Classificação operacional","type":"Consulta","duration":"16 min","content":"O risco pode ser classificado como baixo, moderado, crescente, alto ou crítico. A classificação considera distância, tempo médio de deslocamento, congestionamento interno, pico operacional, tipo de voo e disponibilidade de equipe."},{"title":"Composição do SLA","type":"Prática guiada","duration":"18 min","content":"O SLA de restituição deve ser analisado pela soma de descarga, transporte, entrada no BHS e disponibilização na esteira. Quando a soma se aproxima do limite, qualquer atraso pequeno pode gerar não conformidade."},{"title":"Monitoramento por turno","type":"Análise","duration":"18 min","content":"A análise por turno identifica onde estão as maiores violações de SLA. Turnos com alto volume, voos internacionais, congestionamento de esteiras ou longas janelas sem restituição exigem prioridade de gestão."},{"title":"Pareto e priorização","type":"Gestão","duration":"16 min","content":"A leitura de Pareto ajuda a priorizar ações. Se dois turnos concentram a maior parte das violações, atuar primeiro nesses turnos pode reduzir rapidamente o impacto total."},{"title":"Plano de ação operacional","type":"Simulação","duration":"17 min","content":"O plano de ação deve prever equipe, tratores, carretas, prioridade para voos críticos, comunicação pré-chegada, início imediato do transporte e supervisão dedicada quando o risco for alto."},{"title":"Governança e registros","type":"Procedimento","duration":"15 min","content":"Todo atraso relevante deve ser registrado com horário, causa, turno, voo, posição, início da descarga, chegada ao BHS e início da restituição. O histórico permite corrigir processo, dimensionamento e comunicação."}]'::jsonb,
    '[{"label":"Biblioteca Operacional","href":"operational-library.html"},{"label":"Dashboard do Simulador","href":"../index.html"}]'::jsonb,
    '[{"question":"Qual é o principal objetivo da restituição de bagagem?","options":["Guardar bagagens não retiradas por tempo indeterminado","Levar as bagagens descarregadas até a esteira dentro do SLA definido","Substituir o processo de triagem do aeroporto","Evitar o uso de registros operacionais"],"correct":1},{"question":"Qual fator aumenta diretamente o risco de descumprimento do SLA?","options":["Posição da aeronave muito próxima ao BHS","Baixo volume de voos no turno","Grande distância entre aeronave, BHS e esteira","Equipe pronta antes da chegada"],"correct":2},{"question":"Em uma operação com posição distante, qual ação é recomendada?","options":["Aguardar o fim da descarga para planejar o transporte","Reduzir equipamentos para liberar espaço","Iniciar o transporte rapidamente e acompanhar o fluxo","Priorizar apenas voos com menor quantidade de bagagens"],"correct":2},{"question":"O SLA de restituição deve considerar:","options":["Somente o horário de pouso","Somente o horário de abertura da porta da aeronave","Descarga, percurso, entrada no BHS e início da entrega na esteira","Apenas o número de passageiros no voo"],"correct":2},{"question":"Quando a soma descarga + percurso + BHS chega ao limite do SLA, o que ocorre?","options":["A operação fica sem risco","Qualquer pequeno desvio pode gerar não conformidade","O turno deixa de precisar de supervisão","A esteira pode ser aberta sem bagagem"],"correct":1},{"question":"A classificação de risco operacional serve para:","options":["Eliminar a necessidade de medição","Definir quais voos podem ser ignorados","Apoiar planejamento, priorização e dimensionamento","Registrar apenas atrasos de passageiros"],"correct":2},{"question":"Qual cenário representa risco crítico?","options":["Percurso curto, equipe disponível e baixa demanda","Percurso muito longo, pico operacional e esteiras saturadas","Voo doméstico com poucas bagagens e esteira livre","Transporte iniciado antes do fim da descarga"],"correct":1},{"question":"A análise por turno ajuda a identificar:","options":["Somente o nome do passageiro","Onde ocorrem mais violações e qual turno exige ação","A quantidade de assentos disponíveis no voo","O valor de indenização por bagagem"],"correct":1},{"question":"Na lógica de Pareto, a gestão deve priorizar:","options":["Os eventos que concentram maior parte do impacto","Somente os eventos mais simples","Apenas turnos com baixo volume","Casos sem registro operacional"],"correct":0},{"question":"Qual prática melhora a previsibilidade da restituição?","options":["Planejamento pré-chegada dos voos críticos","Uso de comunicação informal sem confirmação","Registro apenas quando há reclamação","Atrasar a saída das carretas para juntar mais volumes"],"correct":0},{"question":"O que deve ser registrado em uma violação de SLA?","options":["Apenas o nome do supervisor","Horários, causa, turno, posição e etapa afetada","Somente o número total de malas","Apenas o portão de embarque do passageiro"],"correct":1},{"question":"Em turnos com longas janelas sem restituição, a prioridade deve ser:","options":["Governança, controle e priorização operacional","Redução de registros","Fechar esteiras sem comunicação","Aguardar demanda do passageiro"],"correct":0},{"question":"Qual item faz parte de um plano de ação para voo crítico?","options":["Supervisão dedicada e equipamentos dimensionados","Ausência de briefing","Nenhuma medição de tempo","Comunicação somente após reclamações"],"correct":0},{"question":"Por que o histórico operacional é importante?","options":["Porque substitui a operação em tempo real","Porque permite identificar causa, reincidência e melhoria de processo","Porque elimina necessidade de equipe","Porque serve apenas para arquivamento"],"correct":1},{"question":"Qual é uma boa conclusão gerencial quando poucos turnos concentram a maioria das violações?","options":["Não existe problema operacional","A ação deve começar pelos turnos de maior impacto","Todos os turnos devem receber exatamente a mesma ação","O SLA deve deixar de ser acompanhado"],"correct":1}]'::jsonb,
    '',
    'Objetivo da restituição

Objetivo da trilha
Compreender o que é restituição de bagagem, por que o SLA existe e como o tempo de entrega afeta a experiência do passageiro.

Restituição de bagagem é o conjunto de etapas que começa após a chegada da aeronave e termina quando a bagagem é disponibilizada na esteira correta para retirada pelo passageiro. A operação envolve descarga do porão, separação dos volumes, transporte por tratores e carretas, entrada no BHS ou área de triagem, direcionamento para a esteira e acompanhamento até a entrega.

O passageiro percebe o resultado da operação pela espera na área de restituição. Mesmo que a descarga tenha sido eficiente, se o transporte, o BHS ou a esteira demorarem, a percepção será de falha. Por isso, o SLA não pode ser visto apenas como um número contratual. Ele é um indicador direto de fluidez operacional, previsibilidade e qualidade de atendimento.

O que deve ser controlado
- Horário de chegada da aeronave.
- Início e fim da descarga.
- Saída da primeira carreta ou equipamento equivalente.
- Chegada das bagagens ao BHS ou ponto de restituição.
- Início da entrega na esteira.
- Interrupções, congestionamentos e mudança de esteira.
- Horário de encerramento da restituição.

Responsabilidades integradas
A restituição depende de rampa, BHS, serviço de bagagem, supervisão, centro de controle e atendimento ao passageiro. Quando cada área atua isoladamente, o tempo se perde em transições. Quando existe coordenação pré-chegada, a operação ganha minutos importantes.

Conduta esperada do agente
O agente deve acompanhar o status da chegada, manter contato com a operação, orientar passageiros quando houver atraso e registrar informações relevantes. A comunicação deve ser objetiva: informar que a equipe está atuando, evitar promessas sem confirmação e atualizar quando houver mudança real.

Exemplo operacional
Um voo chega em posição próxima, com baixa demanda e esteira livre. O risco de atraso é baixo. Outro voo chega em posição distante, em horário de pico e com esteiras ocupadas. Mesmo com a mesma quantidade de bagagens, o segundo voo exige plano especial para cumprir o SLA.

Mensagem principal
Restituição eficiente não acontece por acaso. Ela depende de preparação, leitura de risco, início rápido do transporte e registro fiel dos tempos.

Distância, percurso e risco

Objetivo da trilha
Relacionar distância operacional, tempo médio de percurso e risco de descumprimento do SLA.

O tempo de restituição é diretamente afetado pela distância entre a posição da aeronave e a entrada do BHS ou ponto de entrega. Em aeroportos de médio e grande porte, duas aeronaves podem pousar no mesmo horário, mas gerar riscos completamente diferentes porque uma está próxima da restituição e outra em uma posição remota ou em píer distante.

Classificação genérica de percurso
- Percurso curto: normalmente baixo risco, com alta previsibilidade.
- Percurso médio: risco moderado, sensível a atraso de descarga ou trânsito interno.
- Percurso médio/longo: risco crescente, principalmente se houver congestionamento de vias internas.
- Percurso longo: alto risco, exigindo início imediato do transporte e maior disponibilidade de equipamentos.
- Percurso muito longo: risco crítico, pois pode comprometer o SLA mesmo quando a descarga é eficiente.

Variáveis que alteram o risco
A distância física é apenas uma parte do problema. O risco aumenta quando existem filas de equipamentos, cruzamento de fluxos, restrição de via, baixa disponibilidade de carretas, equipe reduzida, aeronave com grande volume de bagagem, chegada simultânea de voos e esteiras ocupadas.

Aplicação prática
Antes da chegada, a supervisão deve identificar a posição prevista da aeronave e estimar o risco. Se a posição for distante, o time deve preparar equipamento, alinhar prioridade, liberar rota interna quando possível e evitar que o primeiro transporte seja iniciado tarde.

Exemplo de leitura operacional
Um voo em posição próxima pode ter percurso médio de 5 a 9 minutos. Um voo em extremidade ou posição remota pode exigir 15 a 22 minutos apenas de deslocamento. Se a descarga consumir 20 minutos e o BHS/esteira consumir mais 5 minutos, o voo distante já fica muito próximo de um SLA de 45 minutos.

Ponto de atenção
Percurso longo não significa falha. A falha ocorre quando o risco conhecido não é tratado com antecedência.

Mensagem principal
Quanto maior a distância, maior deve ser a antecipação. O tempo perdido antes da primeira carreta raramente é recuperado no fim do processo.

Classificação operacional

Objetivo da trilha
Aprender a classificar voos por risco e aplicar ações proporcionais antes da não conformidade acontecer.

A classificação operacional transforma dados simples em decisão. Em vez de tratar todos os voos da mesma forma, a equipe classifica cada chegada conforme risco de descumprimento do SLA. Isso ajuda a priorizar pessoas, equipamentos e comunicação.

Níveis de risco
Baixo risco: posição próxima, percurso curto, operação simples, baixa interferência e esteira disponível.

Risco moderado: percurso médio, operação estável, mas sensível a atraso de descarga, volume de bagagens ou pequeno congestionamento.

Risco crescente: distância média/longa, possibilidade de fila interna, necessidade de coordenação e acompanhamento mais próximo.

Alto risco: posição distante, percurso longo, pico operacional, alto volume de bagagem ou necessidade de mais carretas.

Risco crítico: posição muito distante, congestionamento, muitas chegadas simultâneas, voos internacionais ou qualquer combinação que deixe pouca margem para erro.

Critérios de avaliação
- Posição da aeronave.
- Tipo de voo e volume estimado de bagagens.
- Quantidade de equipamentos disponíveis.
- Quantidade de colaboradores no turno.
- Tempo médio de percurso até o BHS.
- Esteira prevista e ocupação das esteiras.
- Existência de voos críticos no mesmo intervalo.
- Histórico de atrasos daquele período.

Como usar a classificação
A classificação deve ser usada antes da chegada. Voos de alto risco precisam de alerta operacional, confirmação de equipamento, acompanhamento da primeira carreta e plano de contingência. Voos de baixo risco podem seguir fluxo padrão, mantendo monitoramento normal.

Recomendações para alto risco
- Aumentar disponibilidade de carretas ou viagens.
- Iniciar transporte assim que houver volume viável.
- Designar acompanhamento de supervisão.
- Confirmar esteira antes da chegada das primeiras bagagens.
- Comunicar o serviço de bagagem em caso de atraso provável.

Mensagem principal
Classificar risco é transformar informação em ação. O objetivo é agir antes que o SLA seja perdido.

Composição do SLA

Objetivo da trilha
Entender que o SLA de restituição é formado pela soma de etapas e que cada minuto deve ser protegido.

O SLA de restituição não depende de uma única área. Ele é resultado da soma de várias etapas. Quando uma etapa atrasa, as próximas precisam compensar; quando todas consomem tempo demais, a não conformidade é inevitável.

Etapas que compõem o SLA
1. Chegada e liberação operacional da aeronave.
2. Posicionamento de equipe e equipamentos.
3. Abertura de porão e início da descarga.
4. Separação e acomodação dos volumes nas carretas.
5. Transporte até o BHS ou área de restituição.
6. Entrada das bagagens no sistema ou ponto de entrega.
7. Direcionamento à esteira correta.
8. Início da disponibilização ao passageiro.
9. Encerramento da restituição.

Exemplo prático de limite
Considere uma operação com SLA máximo de 45 minutos. Se a descarga levar 20 minutos, o percurso consumir 20 minutos e o BHS/esteira consumir 5 minutos, o total chega exatamente ao limite. Nesse cenário, qualquer desvio - equipamento indisponível, esteira ocupada, parada no trajeto ou falha de comunicação - gera descumprimento.

Margem operacional
A gestão deve trabalhar com margem, não com o limite. Se a previsão mostra que o voo chegará perto de 45 minutos, ele deve ser tratado como crítico antes do atraso acontecer.

Perguntas de controle
- A equipe estava posicionada antes da chegada?
- O equipamento estava disponível e em condição de uso?
- O primeiro transporte saiu cedo o suficiente?
- A esteira estava liberada?
- Houve espera para entrada no BHS?
- O passageiro foi informado quando houve atraso relevante?

Boas práticas
Mantenha uma linha do tempo simples para cada voo crítico. Registrar horários permite descobrir se a perda ocorreu na descarga, no percurso, no BHS ou na esteira. Sem linha do tempo, a discussão vira opinião.

Mensagem principal
SLA é soma de tempos. Melhorar restituição exige medir cada etapa, não apenas olhar o horário final.

Monitoramento por turno

Objetivo da trilha
Analisar violações de SLA por turno e identificar padrões de volume, severidade e causa provável.

A análise por turno permite enxergar onde o problema se concentra. Alguns turnos podem ter poucas ocorrências, mas atrasos severos. Outros podem ter grande volume de violações menores. Há também turnos com longas janelas sem restituição, especialmente quando há acúmulo de voos, esteiras saturadas ou falha de registro.

Como interpretar os turnos
Turno com baixo volume e alta severidade: exige investigação pontual, pois poucos voos geram grande impacto quando falham.

Turno com alto volume de violações: exige revisão de dimensionamento, fluxo, priorização e capacidade de esteiras.

Turno com eventos longos e concentrados: geralmente indica atraso de início, falha de acompanhamento ou falta de registro em tempo real.

Turno com muitos voos internacionais ou de grande volume: exige governança mais forte, porque descarga, inspeção, distância e esteiras podem consumir mais tempo.

Indicadores úteis
- Quantidade de voos acima do SLA.
- Tempo médio de atraso por turno.
- Maior atraso registrado.
- Percentual de voos críticos por turno.
- Motivos recorrentes.
- Esteiras mais impactadas.
- Intervalos sem restituição.
- Volume de voos no mesmo horário.

Ação por perfil de turno
Se o turno apresenta alto volume, a prioridade é dimensionamento e fluxo. Se apresenta longas janelas sem restituição, a prioridade é controle, governança e acompanhamento. Se apresenta falhas de registro, a prioridade é padronização de apontamento e treinamento.

Exemplo genérico
Um turno de pico concentra muitos voos próximos, múltiplas esteiras ocupadas e alta demanda de equipamentos. Mesmo que cada atraso seja moderado, o volume acumulado compromete a experiência do passageiro. Já um turno noturno pode ter menos voos, mas falhas pontuais graves por equipe reduzida ou atraso de acionamento.

Mensagem principal
Métrica por turno mostra onde agir primeiro. Sem essa leitura, a gestão distribui esforço igualmente para problemas que não têm o mesmo peso.

Pareto e priorização

Objetivo da trilha
Aplicar a lógica 80/20 para priorizar os pontos que concentram maior impacto na restituição de bagagem.

Pareto é uma ferramenta de gestão que ajuda a identificar quais causas, turnos, posições ou horários concentram a maior parte do problema. Na restituição de bagagem, é comum que poucos períodos ou fluxos sejam responsáveis por grande parte das violações de SLA.

Como aplicar
1. Liste as violações por turno, área, posição, esteira ou tipo de voo.
2. Some a quantidade de ocorrências e a severidade de cada grupo.
3. Ordene do maior impacto para o menor.
4. Identifique os grupos que concentram a maior parte das violações.
5. Priorize ações nesses grupos antes de espalhar esforço por toda a operação.

Leitura gerencial
Se dois turnos concentram aproximadamente 70% das violações, atuar neles primeiro pode reduzir a maior parte do impacto. Se três turnos concentram mais de 90%, a operação tem um problema localizado e mensurável. Se todos os turnos têm comportamento semelhante, o problema é estrutural e exige revisão ampla do processo.

Tipos de impacto
Volume: quantidade de voos fora do SLA.
Severidade: quanto tempo cada voo ultrapassou o limite.
Recorrência: repetição do problema em dias diferentes.
Experiência: número de passageiros afetados e tempo de espera percebido.

Decisão com Pareto
A gestão deve evitar tratar casos residuais como prioridade principal quando há grupos que concentram grande impacto. Isso não significa ignorar pequenos desvios, mas sim usar energia onde o retorno operacional será maior.

Exemplo genérico
Se um turno representa o maior número de violações e outro apresenta os atrasos mais longos, as ações podem ser diferentes: no primeiro, reforçar fluxo e equipamentos; no segundo, melhorar governança, comunicação e resposta a exceções.

Mensagem principal
Pareto transforma dados em foco. A operação melhora mais rápido quando ataca primeiro o que mais pesa.

Plano de ação operacional

Objetivo da trilha
Criar ações práticas para reduzir atrasos de restituição e proteger o SLA em voos críticos.

Um plano de ação eficaz começa antes da chegada do voo. A restituição não deve esperar o passageiro reclamar para ser gerenciada. O time precisa antecipar riscos, preparar recursos e acompanhar o fluxo até que as bagagens estejam na esteira.

Ações pré-chegada
- Verificar posição prevista da aeronave.
- Classificar risco conforme distância e pico operacional.
- Confirmar equipe e equipamentos.
- Identificar esteira prevista e possíveis conflitos.
- Alinhar prioridade com rampa, BHS e serviço de bagagem.
- Preparar comunicação para voos com risco de atraso.

Ações durante a operação
- Acompanhar início da descarga.
- Garantir saída rápida da primeira carreta.
- Evitar espera desnecessária para completar carga quando o SLA está sensível.
- Monitorar trânsito interno e entrada no BHS.
- Confirmar abertura correta da esteira.
- Atualizar o atendimento se houver atraso relevante.

Ações pós-operação
- Registrar horários reais.
- Identificar etapa onde ocorreu perda de tempo.
- Classificar causa provável.
- Comparar com histórico do turno.
- Definir correção para próxima ocorrência.

Plano para risco alto
Voos de alto risco devem ter supervisão dedicada, equipamento dimensionado, comunicação ativa e prioridade no primeiro transporte. Em alguns casos, vale dividir volumes em viagens menores para iniciar restituição mais cedo.

Plano para risco moderado
Voos moderados precisam de acompanhamento padrão com atenção à descarga e à disponibilidade de esteira. Pequenos atrasos devem ser sinalizados cedo para evitar acúmulo.

Plano para baixo risco
Fluxo padrão, mantendo registro e monitoramento. Baixo risco não significa ausência de controle.

Mensagem principal
Plano de ação bom é simples, executável e medido. Se a equipe não sabe quem faz, quando faz e como registra, o plano ainda não está pronto.

Governança e registros

Objetivo da trilha
Padronizar registros, indicadores e rituais de acompanhamento para sustentar a melhoria da restituição de bagagem.

Governança é o conjunto de regras, rotinas e responsabilidades que mantém a operação sob controle. Sem governança, a restituição depende de esforço individual. Com governança, a equipe sabe o que medir, quando agir e como aprender com cada desvio.

Registros essenciais
- Voo e data.
- Posição da aeronave.
- Esteira utilizada.
- Horário de chegada.
- Início e fim da descarga.
- Saída do primeiro transporte.
- Chegada ao BHS ou ponto de restituição.
- Início da entrega na esteira.
- Encerramento da entrega.
- Motivo de atraso, quando houver.
- Ação corretiva adotada.

Indicadores recomendados
- Percentual de voos dentro do SLA.
- Quantidade de violações por turno.
- Tempo médio até a primeira bagagem.
- Tempo médio até a última bagagem.
- Voos críticos por posição ou terminal.
- Tempo médio de percurso por área.
- Ocorrências por esteira.
- Causas recorrentes.

Rituais de acompanhamento
Briefing pré-turno: revisar voos críticos, equipe, equipamentos e riscos.
Monitoramento em tempo real: acompanhar chegadas com maior risco.
Debriefing pós-turno: registrar principais desvios, causas e ações.
Revisão semanal: analisar Pareto e definir prioridades.

Comunicação com atendimento
Quando houver atraso, o atendimento deve receber informação objetiva para orientar passageiros. O ideal é informar status real, evitar promessas e atualizar quando a previsão mudar. O silêncio aumenta tensão na área de restituição.

Cultura de melhoria
A governança não deve ser usada para culpar pessoas, mas para entender processo. Um atraso pode ter causa em posição distante, congestionamento, falha de equipamento, dimensionamento insuficiente ou comunicação tardia. O registro correto protege a equipe e permite melhorar.

Mensagem principal
O que não é medido vira percepção. O que é medido com qualidade vira gestão.',
    242
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
    'siga-gestao-aeroportuaria',
    'Sistema Integrado de Gestão Aeroportuária - SIGA',
    'Gestão operacional',
    'bagagem',
    'Básico',
    '1h 20min',
    '#2563eb',
    'Uso de plataforma integrada para acompanhamento de voos, atualizações operacionais, alertas, incidentes e colaboração em tempo real.',
    '[{"title":"Conceito e finalidade","type":"Aula","duration":"12 min","content":"Um sistema integrado de gestão aeroportuária centraliza informações operacionais em tempo real para apoiar equipes de aeroporto, rampa, atendimento, coordenação e gestão."},{"title":"Acesso seguro","type":"Procedimento","duration":"10 min","content":"O acesso deve ocorrer por canal autorizado, com usuário individual, senha forte e, quando disponível, autenticação em dois fatores. Credenciais não devem ser compartilhadas."},{"title":"Dashboard operacional","type":"Aula","duration":"12 min","content":"O dashboard apresenta data, hora local e UTC, boas-vindas ao usuário, menu de navegação, publicações recentes, atualizações e avisos críticos."},{"title":"Controle de voos","type":"Prática guiada","duration":"14 min","content":"O controle de voos permite buscar voos por número e data, acompanhar chegada, partida, embarque, atraso, mudança de portão e impactos nos serviços de solo."},{"title":"Atualizações operacionais","type":"Consulta","duration":"12 min","content":"Atualizações de capacidade, mudanças de voo, alterações de gate, retenção de equipe e ajustes de processo devem ser lidos, aplicados e registrados."},{"title":"Avisos, alertas e incidentes","type":"Procedimento","duration":"14 min","content":"Alertas operacionais, avisos gerais, ocorrências com passageiros especiais, leitura de etapas e incidentes devem ser tratados com registro, ação e acompanhamento."},{"title":"Colaboração e feedback","type":"Simulação","duration":"12 min","content":"A colaboração permite reportar erros, comunicar incidências, enviar feedback e manter diferentes áreas alinhadas em uma mesma fonte de informação."},{"title":"Boas práticas de uso","type":"Checklist","duration":"14 min","content":"Boas práticas incluem atualizar dados em tempo real, evitar duplicidade, confirmar informações antes de publicar, registrar cada etapa e comunicar desvios com clareza."}]'::jsonb,
    '[{"label":"Dashboard do Simulador","href":"../index.html"},{"label":"Biblioteca Operacional","href":"operational-library.html"}]'::jsonb,
    '[{"question":"Qual é a finalidade principal de um sistema integrado de gestão aeroportuária?","options":["Substituir todos os procedimentos operacionais","Centralizar informações operacionais em tempo real","Servir apenas como mural de notícias","Controlar somente dados financeiros"],"correct":1},{"question":"Qual prática é recomendada no acesso ao sistema?","options":["Compartilhar login com a equipe","Usar senha simples para agilizar","Utilizar usuário individual e autenticação segura","Salvar senha em computadores públicos"],"correct":2},{"question":"O dashboard operacional normalmente apresenta:","options":["Apenas fotos dos colaboradores","Data, hora, avisos, atualizações e menu de navegação","Somente dados de vendas","Informações sem relação com a operação"],"correct":1},{"question":"No controle de voos, é importante acompanhar:","options":["Somente o número do assento","Chegada, partida, atraso, embarque e mudança de portão","Apenas o nome do comandante","Somente o tipo de aeronave"],"correct":1},{"question":"Uma mudança de gate deve ser:","options":["Ignorada se o voo ainda não pousou","Registrada e comunicada às áreas impactadas","Tratada apenas pelo passageiro","Publicada sem confirmação"],"correct":1},{"question":"Atualizações operacionais servem para:","options":["Orientar mudanças de processo, capacidade e fluxo","Eliminar a necessidade de supervisão","Substituir o atendimento ao passageiro","Remover registros anteriores"],"correct":0},{"question":"Ao receber um alerta operacional, o usuário deve:","options":["Fechar sem ler","Registrar ação, acompanhar e evitar duplicidades","Criar novo alerta igual","Enviar mensagem informal sem registro"],"correct":1},{"question":"O registro de cada etapa é importante porque:","options":["Aumenta burocracia sem utilidade","Garante rastreabilidade e continuidade entre equipes","Dispensa comunicação com outras áreas","Serve apenas para auditoria anual"],"correct":1},{"question":"Em incidentes operacionais, a colaboração deve ocorrer por:","options":["Fonte única de informação e feedback estruturado","Mensagens soltas sem histórico","Apenas comunicação verbal","Decisão isolada de uma área"],"correct":0},{"question":"Qual é uma boa prática antes de publicar informação operacional?","options":["Confirmar a informação","Publicar primeiro e verificar depois","Usar abreviações não padronizadas","Apagar dados anteriores sem critério"],"correct":0},{"question":"O campo de feedback ou incidências deve ser usado para:","options":["Reportar erros, desvios e oportunidades de melhoria","Substituir o login individual","Registrar informações pessoais sem necessidade","Evitar comunicação com suporte"],"correct":0},{"question":"Qual conduta reduz duplicidade de follow-up?","options":["Registrar a etapa concluída e verificar histórico antes de nova ação","Criar várias mensagens iguais","Usar canais paralelos sem atualização","Ignorar ações anteriores"],"correct":0},{"question":"O uso de hora local e UTC ajuda principalmente em:","options":["Padronização de eventos e comunicação entre áreas","Definição de preço da passagem","Escolha de assento","Troca de uniforme"],"correct":0},{"question":"Quando uma informação do sistema parece incorreta, o usuário deve:","options":["Corrigir sem registrar","Reportar pelo canal de incidência ou suporte","Ignorar a informação","Divulgar em canal informal"],"correct":1},{"question":"Qual é o resultado esperado do uso correto do sistema?","options":["Mais previsibilidade, menos erros e melhor coordenação","Menos comunicação entre equipes","Menos registros operacionais","Mais decisões sem evidência"],"correct":0}]'::jsonb,
    '',
    'Conceito e finalidade

Objetivo da trilha
Compreender o papel de uma plataforma integrada de gestão aeroportuária e como ela apoia a operação em tempo real.

Um sistema integrado de gestão aeroportuária reúne informações de diferentes áreas em uma única interface operacional. Ele pode apoiar equipes de atendimento, rampa, bagagem, coordenação, supervisão e gestão em atividades como acompanhamento de voos, publicações internas, alertas, incidentes, mudanças operacionais e comunicação entre equipes.

A principal finalidade é reduzir dispersão de informações. Em uma operação aeroportuária, muitos eventos acontecem ao mesmo tempo: chegada de aeronaves, mudanças de portão, atrasos, passageiros que precisam de assistência, demandas de bagagem, retenção de equipe, incidentes e ajustes de processo. Quando cada informação fica em um canal diferente, a chance de erro aumenta.

Benefícios esperados
- Centralização de dados operacionais.
- Visão em tempo real de eventos críticos.
- Redução de retrabalho e ruído de comunicação.
- Melhor coordenação entre áreas.
- Rastreabilidade das ações tomadas.
- Apoio à tomada de decisão por supervisores.
- Registro histórico para melhoria contínua.

Como o sistema deve ser entendido
Ele não substitui o procedimento operacional. Ele organiza a informação para que o procedimento seja executado com mais rapidez e segurança. O usuário ainda precisa interpretar dados, confirmar informações relevantes e registrar ações corretamente.

Exemplo operacional
Uma mudança de portão é publicada no sistema. O atendimento visualiza a alteração, a rampa ajusta posicionamento de equipe, o setor de bagagem confirma impacto no fluxo e a supervisão acompanha a execução. Todos trabalham com a mesma informação.

Mensagem principal
Uma plataforma integrada só gera valor quando as áreas registram e consultam informações com disciplina operacional.

Acesso seguro

Objetivo da trilha
Entender como acessar o sistema com segurança e proteger dados operacionais e pessoais.

O acesso a sistemas aeroportuários deve ser individual, controlado e rastreável. Cada usuário deve entrar com sua própria credencial, sem compartilhar login ou senha. Isso permite identificar quem registrou uma ação, quando ela foi feita e qual informação foi alterada.

Boas práticas de acesso
- Usar canal oficial autorizado pela empresa ou operador aeroportuário.
- Utilizar credencial individual.
- Criar senha forte, com letras, números e caracteres especiais quando aplicável.
- Ativar autenticação em dois fatores quando disponível.
- Encerrar sessão ao sair do equipamento.
- Não salvar senha em computadores compartilhados.
- Não enviar prints com dados sensíveis em canais inadequados.

Segurança da informação
Sistemas operacionais podem conter dados de voo, informações de passageiros, incidentes, nomes de colaboradores, horários, portões, registros de bagagem e ações internas. O uso inadequado pode expor dados sensíveis e comprometer a operação.

Condutas proibidas
- Compartilhar usuário e senha.
- Acessar o sistema por curiosidade, sem necessidade operacional.
- Alterar dados sem confirmação.
- Publicar informações em grupos informais sem autorização.
- Usar conta de outro colaborador.
- Deixar sessão aberta em equipamento público.

Primeiro acesso
No primeiro acesso, o usuário deve conferir seu perfil, nome, área, permissões e menus disponíveis. Se o perfil estiver incorreto, deve acionar o canal responsável antes de iniciar registros operacionais.

Mensagem principal
Acesso seguro protege o usuário, a operação e o passageiro. Em sistema rastreável, cada ação precisa ter dono.

Dashboard operacional

Objetivo da trilha
Aprender a interpretar os principais elementos do dashboard e usá-lo como ponto inicial de acompanhamento.

O dashboard é a tela inicial de gestão operacional. Ele deve apresentar uma visão rápida do estado da operação, combinando informações de tempo, publicações recentes, atualizações, avisos, alertas e atalhos para módulos de trabalho.

Elementos comuns do dashboard
- Data e hora local.
- Horário UTC, quando aplicável.
- Identificação do usuário logado.
- Menu lateral ou superior.
- Publicações recentes.
- Atualizações operacionais.
- Avisos críticos.
- Alertas pendentes.
- Incidentes ou comunicações abertas.

Por que hora local e UTC importam
Operações aéreas usam referência de tempo com frequência. A hora local ajuda a equipe do aeroporto; a hora UTC facilita comunicação com outras bases, sistemas e áreas que operam em fusos diferentes. A divergência de horário pode causar erro de registro se o agente não observar a referência correta.

Leitura das publicações
Publicações podem tratar de mudanças de procedimento, ajustes de fluxo, retenção de equipes, atualizações de capacidade, alertas temporários ou orientações de segurança. O usuário deve ler, interpretar impacto e aplicar ao seu turno.

Rotina recomendada ao abrir o dashboard
1. Confirmar usuário e perfil.
2. Verificar data/hora.
3. Ler avisos e atualizações recentes.
4. Identificar alertas pendentes.
5. Acessar módulos relevantes para o turno.
6. Registrar ciência ou ação quando solicitado.

Mensagem principal
O dashboard deve ser o primeiro ponto de leitura do turno. Ele reduz surpresa operacional e ajuda a alinhar a equipe.

Controle de voos

Objetivo da trilha
Usar o módulo de controle de voos para acompanhar operação, status e impactos nos serviços de solo.

O controle de voos permite consultar voos por número, data, aeroporto, horário ou status. Ele centraliza informações de chegada, partida, embarque, atraso, mudança de portão, posição de aeronave e eventos que impactam a operação.

Informações importantes
- Número do voo.
- Data operacional.
- Origem e destino.
- Horário programado e estimado.
- Status do voo.
- Portão ou posição.
- Atrasos e motivos quando disponíveis.
- Serviços associados: bagagem, limpeza, atendimento, assistência, rampa ou conexão.

Status comuns
Em planejamento: voo previsto, aguardando preparação.
Em atendimento: equipes atuando em alguma etapa.
Embarque: passageiros em processo de embarque.
Atrasado: horário alterado ou impacto operacional identificado.
Mudança de portão: local de embarque ou desembarque alterado.
Concluído: etapa finalizada e registrada.

Integração operacional
O controle de voos deve conversar com a operação real. Se o sistema informa um status, mas a área informa situação diferente, o usuário deve confirmar antes de publicar ou tomar decisão. O sistema apoia, mas a validação operacional continua necessária.

Exemplo prático
Um voo tem alteração de portão pouco antes do embarque. O agente consulta o controle de voos, confirma a mudança, atualiza equipes envolvidas e registra a ação. Esse registro evita que outra área trabalhe com portão antigo.

Mensagem principal
Controle de voo bem utilizado reduz falhas de comunicação entre atendimento, rampa, bagagem e supervisão.

Atualizações operacionais

Objetivo da trilha
Entender como ler, aplicar e registrar atualizações que impactam a operação diária.

Atualizações operacionais podem envolver mudança de capacidade, alteração de voo, ajuste de gate, retenção de equipe, mudança de processo, informação de contingência ou orientação temporária. Elas precisam ser lidas com atenção, porque podem alterar a rotina do turno.

Tipos de atualização
- Mudança de horário de voo.
- Alteração de portão ou posição.
- Retenção ou redistribuição de equipe.
- Ajuste de fluxo de passageiros.
- Mudança de esteira ou área de entrega.
- Procedimento temporário de atendimento.
- Orientação sobre passageiros especiais.
- Restrição operacional em determinada área.

Como aplicar uma atualização
1. Leia o conteúdo completo.
2. Identifique quais áreas são afetadas.
3. Confirme se a atualização vale para seu aeroporto, turno ou voo.
4. Comunique a equipe diretamente impactada.
5. Registre ciência ou ação, se o sistema solicitar.
6. Monitore se a mudança foi aplicada corretamente.

Refresh e leitura ativa
Atualizar a tela não basta. O usuário deve observar se novos avisos surgiram, se houve alteração em publicações antigas e se algum alerta pede resposta. A leitura ativa evita que a equipe trabalhe com informação vencida.

Risco de não aplicar
Uma atualização ignorada pode gerar equipe no local errado, passageiro orientado incorretamente, perda de prazo, atraso de atendimento, duplicidade de ação ou conflito entre áreas.

Mensagem principal
Atualização operacional é comando de contexto. Quem lê tarde, age tarde.

Avisos, alertas e incidentes

Objetivo da trilha
Saber responder a avisos, alertas e incidentes com registro, ação e acompanhamento.

Avisos e alertas existem para destacar situações que exigem atenção. Podem envolver passageiros com assistência especial, leitura de etapas, incidentes operacionais, falha sistêmica, ocorrência em voo, irregularidade de bagagem, restrição de área ou necessidade de resposta imediata.

Tipos de alerta
Geral: comunicado amplo para ciência ou orientação.
Operacional: exige ação de equipe ou atualização de processo.
Assistência especial: envolve passageiros que precisam de suporte diferenciado.
Incidente: registra falha, risco, erro ou evento fora do padrão.
Follow-up: pede acompanhamento posterior até encerramento.

Como responder
- Abra o alerta e leia o conteúdo completo.
- Verifique se a ação é sua ou de outra área.
- Execute ou encaminhe conforme responsabilidade.
- Registre ação tomada.
- Evite duplicidade verificando histórico anterior.
- Acompanhe até conclusão quando necessário.

Registro de etapas
Quando um alerta envolve várias etapas, cada etapa deve ser registrada. Isso permite saber o que já foi feito, quem fez e o que ainda falta. Sem esse controle, duas equipes podem executar a mesma ação ou nenhuma executar.

Exemplo prático
Um alerta informa passageiro com assistência especial chegando em conexão. O atendimento confirma chegada, a equipe de apoio é acionada, o embarque é informado e cada etapa fica registrada. Se houver troca de turno, a próxima equipe entende o status sem depender de explicação verbal.

Mensagem principal
Alerta sem registro vira ruído. Alerta com ação registrada vira controle operacional.

Colaboração e feedback

Objetivo da trilha
Usar recursos de colaboração para reportar erros, comunicar incidências e melhorar a qualidade da informação.

Sistemas integrados normalmente possuem área de incidências, feedback ou suporte. Essa funcionalidade existe para que o usuário reporte falhas, inconsistências, dados incorretos, dificuldade de uso ou oportunidade de melhoria.

Quando reportar
- Informação de voo divergente.
- Status incorreto.
- Alerta duplicado.
- Publicação com erro.
- Menu indisponível.
- Falha de acesso.
- Dado operacional desatualizado.
- Dificuldade recorrente de uso.

Como reportar bem
Um bom reporte deve ser claro e objetivo. Inclua módulo, voo ou processo afetado, data/hora, print quando permitido, descrição do erro, impacto operacional e ação esperada. Evite mensagens genéricas como sistema não funciona sem explicar o que aconteceu.

Modelo de reporte
Módulo: Controle de voos.
Evento: status de voo divergente.
Data/hora: informar horário local.
Impacto: equipe recebeu informação conflitante.
Ação solicitada: verificar atualização do status.
Observação: incluir evidência quando permitido.

Colaboração entre áreas
A colaboração deve ocorrer em fonte única de informação. Se o feedback é registrado no sistema, as equipes conseguem acompanhar evolução e evitar conversas paralelas sem histórico.

Mensagem principal
Reportar erro não é reclamar: é proteger a operação e melhorar o sistema.

Boas práticas de uso

Objetivo da trilha
Consolidar condutas para usar o sistema de forma segura, útil e confiável durante o turno.

O uso correto de um sistema integrado depende de disciplina. A ferramenta só é confiável quando os usuários consultam, atualizam, registram e conferem informações de forma padronizada.

Boas práticas essenciais
- Iniciar o turno verificando o dashboard.
- Ler avisos recentes antes de acessar módulos específicos.
- Confirmar informações críticas antes de publicar.
- Registrar ações realizadas.
- Evitar duplicidade de follow-up.
- Usar linguagem objetiva e profissional.
- Manter informações atualizadas em tempo real.
- Encerrar pendências quando forem resolvidas.
- Reportar erro pelo canal correto.
- Encerrar sessão ao finalizar o uso.

O que evitar
- Publicar dados sem validação.
- Usar abreviações não padronizadas.
- Criar alertas duplicados.
- Deixar incidentes sem status.
- Compartilhar credenciais.
- Registrar ação em nome de outro usuário.
- Usar canais paralelos sem atualizar o sistema.

Checklist rápido para o usuário
1. Entrei com minha credencial?
2. Li os avisos do turno?
3. Consultei o voo ou alerta correto?
4. Confirmei a informação antes de agir?
5. Registrei o que foi feito?
6. Há pendência para outra área?
7. O próximo turno entenderá o histórico?

Cultura de fonte única
Quando todos usam a mesma fonte, a operação ganha clareza. Quando cada área trabalha por prints, mensagens soltas e memória individual, o risco de erro aumenta.

Mensagem principal
Sistema integrado não é apenas tecnologia. É disciplina operacional aplicada à informação.',
    243
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
    'checkin-operacional',
    'Check-in Operacional Aeroportuário',
    'Atendimento e aceitação',
    'bagagem',
    'Básico',
    '1h 10min',
    '#0f766e',
    'Procedimentos essenciais de check-in, documentação, aceitação de bagagem, passageiros especiais, encerramento de voo e registros operacionais.',
    '[{"title":"Função do check-in","type":"Aula","duration":"10 min","content":"O check-in confirma a elegibilidade do passageiro para viajar, valida dados do voo, documentos, serviços, assentos, bagagens e necessidades especiais antes do embarque."},{"title":"Documentos e identificação","type":"Procedimento","duration":"12 min","content":"A identificação deve ser conferida conforme rota, tipo de passageiro, exigência nacional ou internacional, autorização de menor e compatibilidade entre documento, reserva e cartão de embarque."},{"title":"Aceitação de bagagem","type":"Prática guiada","duration":"14 min","content":"A bagagem deve ser aceita com conferência de peso, dimensão, franquia, restrições, itens proibidos, condição física, etiqueta, comprovante e orientações claras ao passageiro."},{"title":"Passageiros especiais e SSR","type":"Aula","duration":"12 min","content":"Passageiros com necessidades especiais, menores desacompanhados, gestantes, idosos, animais, equipamentos de mobilidade e serviços adicionais exigem registro correto e comunicação entre áreas."},{"title":"Fechamento e no-show","type":"Simulação","duration":"10 min","content":"O fechamento do check-in precisa respeitar prazos operacionais, reconciliação de passageiros, status de embarque, bagagens aceitas e comunicação com portão, rampa e coordenação."},{"title":"Conformidade e registros","type":"Checklist","duration":"12 min","content":"Registros corretos protegem passageiro, empresa e operação. Toda exceção deve ser documentada com clareza, evidência, horário, responsável e encaminhamento adequado."}]'::jsonb,
    '[{"label":"Simulador Check-In","href":"../pages/checkin.html"},{"label":"Biblioteca Operacional","href":"operational-library.html"}]'::jsonb,
    '[{"question":"Qual é a principal finalidade do check-in operacional?","options":["Apenas imprimir cartão de embarque","Confirmar elegibilidade do passageiro, documentos, serviços e bagagens para o voo","Substituir a inspeção de segurança","Definir a rota da aeronave"],"correct":1},{"question":"Antes de aceitar o passageiro, o agente deve conferir:","options":["Apenas o primeiro nome","Documento, reserva, voo, rota e requisitos aplicáveis","Somente o número do assento","Apenas a quantidade de malas"],"correct":1},{"question":"Em voos internacionais, a conferência documental deve considerar:","options":["Apenas documento com foto nacional","Passaporte, visto, autorização, validade e regras do destino quando aplicáveis","Somente cartão de embarque","Apenas autorização verbal do passageiro"],"correct":1},{"question":"Na aceitação de bagagem despachada, é correto verificar:","options":["Peso, dimensão, franquia, condição externa, restrições e etiqueta","Apenas a cor da mala","Somente o destino final","Apenas se o passageiro está com pressa"],"correct":0},{"question":"Quando a bagagem apresenta dano pré-existente, o agente deve:","options":["Ignorar o dano","Registrar conforme procedimento aplicável e orientar o passageiro","Trocar a etiqueta por outra companhia","Despachar sem qualquer observação"],"correct":1},{"question":"Códigos SSR e assistências servem para:","options":["Registrar necessidades especiais e comunicar áreas envolvidas","Cancelar automaticamente o passageiro","Substituir documento de identificação","Definir preço da passagem"],"correct":0},{"question":"Um passageiro com mobilidade reduzida deve receber:","options":["Atendimento padronizado, sem perguntar nada","Apoio adequado, respeito à autonomia e comunicação com as áreas necessárias","Apenas orientação verbal","Atendimento somente se estiver acompanhado"],"correct":1},{"question":"O menor desacompanhado exige atenção porque:","options":["Depende de regra, documentação, responsáveis e acompanhamento operacional","Pode viajar sem qualquer registro","Não precisa de conferência documental","É tratado como passageiro adulto"],"correct":0},{"question":"O fechamento do check-in deve ser alinhado com:","options":["Portão, rampa, coordenação e status dos passageiros/bagagens","Apenas o passageiro que chegou primeiro","Somente o setor comercial","Nenhuma outra área"],"correct":0},{"question":"Quando o passageiro chega após o prazo operacional de aceitação, o agente deve:","options":["Prometer embarque mesmo sem confirmação","Seguir o procedimento, explicar com clareza e buscar alternativas permitidas","Liberar a bagagem sem passageiro","Encerrar atendimento sem orientação"],"correct":1},{"question":"Qual conduta protege a rastreabilidade do atendimento?","options":["Registrar exceções, horários, evidências e encaminhamentos","Resolver tudo apenas verbalmente","Usar conta de outro colaborador","Apagar histórico após o voo"],"correct":0},{"question":"Itens restritos ou perigosos na bagagem devem ser tratados:","options":["Com orientação e aplicação das regras de segurança e transporte","Como bagagem comum","Somente no destino","Sem comunicação ao passageiro"],"correct":0},{"question":"A etiqueta de bagagem deve refletir:","options":["Rota/destino correto conforme aceitação e regras do itinerário","Apenas a origem","O aeroporto preferido do passageiro","Um destino genérico"],"correct":0},{"question":"Uma boa comunicação no check-in deve ser:","options":["Clara, objetiva, respeitosa e orientada à solução","Técnica e difícil para mostrar autoridade","Rápida sem confirmação","Sempre informal"],"correct":0},{"question":"Qual é o resultado esperado de um check-in bem executado?","options":["Passageiro, bagagem e áreas operacionais alinhados antes do embarque","Mais dúvidas no portão","Menos registros operacionais","Bagagens aceitas sem controle"],"correct":0}]'::jsonb,
    '',
    'Função do check-in

Objetivo da trilha
Compreender o papel do check-in dentro da jornada do passageiro e da operação aeroportuária.

O check-in operacional é a etapa em que o passageiro, sua reserva, seus documentos, seus serviços contratados e sua bagagem são preparados para o voo. A função do agente não é apenas emitir cartão de embarque. O agente valida se a pessoa pode viajar, se está no voo correto, se possui documentação compatível, se a bagagem pode ser transportada e se há alguma necessidade especial que precise ser comunicada às demais áreas.

O check-in é um ponto de prevenção. Quando o atendimento é feito com atenção, muitos problemas deixam de chegar ao portão, à rampa, ao serviço de bagagem ou ao destino. Um documento incorreto, uma bagagem etiquetada para destino errado, uma assistência não registrada ou um item restrito aceito indevidamente podem gerar impacto operacional e prejuízo ao passageiro.

Responsabilidades principais
- Confirmar reserva, voo, data, trecho e status do passageiro.
- Conferir documento de identificação conforme rota e perfil do passageiro.
- Verificar requisitos de viagem quando aplicáveis.
- Aceitar bagagem despachada conforme franquia, peso, dimensão e regras de segurança.
- Orientar sobre bagagem de mão, itens proibidos e itens restritos.
- Registrar serviços especiais e necessidades de assistência.
- Emitir cartão de embarque e comprovante de bagagem.
- Encaminhar o passageiro com informação clara sobre portão, horário e próximos passos.

Postura operacional
O agente deve unir cortesia e precisão. Um atendimento simpático, mas sem conferência técnica, é frágil. Uma conferência correta, mas comunicada de forma ríspida, gera conflito. O padrão ideal é acolher, conferir, orientar e registrar.

Exemplo prático
Um passageiro se apresenta no balcão para voo com conexão. O agente confere nome, documento, destino final, horário, franquia e necessidade de assistência. Ao perceber conexão curta, reforça o portão, orienta sobre deslocamento e garante que a bagagem esteja etiquetada corretamente. Essa ação reduz risco de perda de conexão e extravio.

Mensagem principal
Check-in bem executado protege a experiência do passageiro e reduz falhas em toda a cadeia operacional.

Documentos e identificação

Objetivo da trilha
Aplicar uma conferência documental segura, coerente com a rota e com o perfil do passageiro.

A validação de documentos é uma das responsabilidades mais sensíveis do check-in. O agente deve confirmar se o documento apresentado identifica corretamente o passageiro e se atende às exigências do tipo de viagem. A regra pode variar conforme voo doméstico, internacional, idade do passageiro, nacionalidade, destino, trânsito, autorização de menor e exigências migratórias.

Pontos de conferência
- Nome do passageiro no documento e na reserva.
- Foto, quando aplicável, e compatibilidade visual com o passageiro.
- Validade do documento.
- Documento aceito para a rota.
- Requisitos de visto, autorização, formulário ou comprovante quando aplicáveis.
- Documentação de menores, incluindo autorização de viagem quando exigida.
- Divergências de sobrenome, ordem do nome, acentuação ou abreviações relevantes.

Viagem doméstica
Em regra, o agente deve validar documento oficial aceito para identificação do passageiro. A conferência precisa ser objetiva e respeitosa, observando nome, documento e requisitos aplicáveis à rota. Em caso de menor, a autorização e os responsáveis devem ser verificados conforme regra vigente.

Viagem internacional
Além da identificação, pode haver necessidade de passaporte, visto, autorização eletrônica, comprovante sanitário, autorização de menor, validade mínima e regras específicas do país de destino ou trânsito. O agente não deve presumir que o passageiro está apto apenas porque possui passagem comprada.

Divergências documentais
Nem toda divergência impede a viagem, mas toda divergência relevante precisa ser analisada. O agente deve seguir procedimento interno, acionar supervisão quando necessário e evitar promessas sem confirmação.

Exemplo prático
Uma passageira apresenta reserva com sobrenome de casada e documento com sobrenome anterior. O agente verifica documentação complementar e procedimento aplicável antes de aceitar. Se houver dúvida, aciona supervisão e registra a orientação.

Mensagem principal
Documento não é formalidade. É requisito de segurança, conformidade e proteção do passageiro.

Aceitação de bagagem

Objetivo da trilha
Realizar a aceitação de bagagem despachada com segurança, rastreabilidade e orientação adequada.

A aceitação de bagagem começa antes da etiqueta. O agente deve observar se a bagagem está apta ao transporte, se respeita peso e dimensões, se a franquia permite despacho, se há itens restritos ou proibidos e se a condição física exige registro. A etiqueta correta é o vínculo entre passageiro, voo, rota e bagagem.

Etapas recomendadas
1. Confirmar quantidade de volumes permitidos.
2. Conferir peso e dimensão.
3. Verificar destino final e conexões.
4. Questionar sobre itens proibidos ou restritos quando aplicável.
5. Observar condição externa da bagagem.
6. Registrar dano pré-existente quando o procedimento exigir.
7. Emitir etiqueta correta.
8. Entregar comprovante ao passageiro.
9. Orientar sobre retirada no destino ou conexão quando necessário.

Condição da bagagem
Bagagens com alças quebradas, zíper danificado, rodas ausentes, embalagem frágil, excesso de volume ou dano aparente podem exigir registro de limitação de responsabilidade ou recusa, conforme procedimento. O objetivo é evitar que dano pré-existente seja tratado como dano ocorrido no transporte.

Itens restritos
Baterias de lítio, powerbanks, produtos inflamáveis, químicos, aerossóis fora das condições permitidas, ferramentas perigosas, armas, munições e outros artigos controlados devem ser tratados conforme regras de segurança e transporte de artigos perigosos. O agente deve orientar sem improvisar.

Etiqueta de bagagem
A etiqueta deve refletir a rota aceita. Em viagens com conexão, a leitura de destino final e pontos de transferência é essencial. Uma etiqueta emitida para destino incorreto pode gerar extravio mesmo quando todo o restante do atendimento foi correto.

Exemplo prático
Um passageiro despacha uma mala com roda quebrada e conexão internacional. O agente registra a condição conforme procedimento, confirma se a etiqueta segue até o destino correto, entrega o comprovante e orienta sobre retirada ou redespacho se houver exigência alfandegária.

Mensagem principal
Aceitar bagagem é assumir responsabilidade operacional. Peso, rota, condição e segurança precisam estar corretos antes do volume seguir para o sistema.

Passageiros especiais e SSR

Objetivo da trilha
Identificar, registrar e comunicar necessidades especiais de atendimento de forma correta.

Passageiros especiais exigem atenção técnica e humana. O agente deve reconhecer necessidades de assistência sem constranger o passageiro, registrar o serviço correto e garantir comunicação com as áreas envolvidas. A assistência pode envolver mobilidade reduzida, deficiência visual, deficiência auditiva, deficiência intelectual, transtorno do espectro autista, gestantes, idosos, menor desacompanhado, passageiro com condição médica, animal de assistência ou transporte de equipamento de mobilidade.

Princípios de atendimento
- Falar diretamente com o passageiro, não apenas com acompanhante.
- Perguntar antes de ajudar.
- Respeitar autonomia e privacidade.
- Usar linguagem simples e objetiva.
- Evitar exposição pública da condição do passageiro.
- Confirmar o tipo de assistência necessário.
- Registrar o serviço correto no sistema.
- Informar portão, rampa, tripulação e destino quando aplicável.

SSR e comunicação operacional
Códigos de serviço especial ajudam a padronizar a comunicação entre áreas. O código, porém, não substitui a orientação humana. Se um passageiro precisa de cadeira de rodas até o assento, a equipe precisa saber o nível de assistência. Se o passageiro usa equipamento de mobilidade próprio, o tratamento do equipamento deve ser rastreado.

Menor desacompanhado
O menor desacompanhado depende de idade, regra do operador, rota, documentação, dados do responsável na origem, dados do responsável no destino e acompanhamento durante as etapas. Não deve haver improviso nem entrega a pessoa não autorizada.

Animais e casos médicos
Animais de companhia, animais de assistência e condições médicas possuem regras próprias. O agente deve conferir documentação exigida, reserva do serviço, condições de transporte, limites operacionais e orientação ao passageiro.

Exemplo prático
Um passageiro solicita cadeira de rodas, mas informa que consegue caminhar pequenas distâncias. O agente registra a assistência adequada, orienta sobre o fluxo, comunica a equipe de apoio e garante que o destino receba a informação.

Mensagem principal
A assistência correta começa no check-in. Registro incompleto gera falha de atendimento no portão, na conexão ou no destino.

Fechamento e no-show

Objetivo da trilha
Entender a importância do fechamento do check-in e da comunicação com as áreas envolvidas.

O fechamento do check-in organiza a transição entre atendimento, embarque, rampa e coordenação. A partir desse momento, a operação precisa saber quem está aceito, quem embarcou, quem não compareceu, quais bagagens foram despachadas, quais passageiros exigem assistência e quais pendências ainda existem.

Elementos do fechamento
- Passageiros aceitos.
- Passageiros não apresentados.
- Bagagens despachadas.
- Passageiros com assistência especial.
- Pendências documentais ou operacionais.
- Bagagens retiradas ou não embarcadas quando aplicável.
- Informações relevantes para portão e rampa.

No-show
No-show é a situação em que o passageiro não se apresenta dentro do prazo operacional. O tratamento deve seguir procedimento, evitando decisões isoladas. A bagagem de passageiro que não embarca exige atenção especial, pois regras de segurança podem impedir o transporte sem reconciliação adequada.

Late show
Passageiros atrasados devem ser atendidos com clareza. O agente deve explicar o prazo operacional, verificar alternativas permitidas e evitar prometer embarque quando a aceitação depende de autorização de portão, coordenação ou segurança operacional.

Comunicação com o portão
O portão precisa receber informações relevantes antes do embarque: passageiros com assistência, menores desacompanhados, pendências, passageiros em conexão crítica e alterações relevantes. A comunicação deve ser objetiva e rastreável.

Exemplo prático
Um passageiro aceito no check-in não chega ao portão. A equipe precisa confirmar status de embarque e bagagem, aplicar procedimento de reconciliação e registrar a ação. O objetivo é proteger a segurança do voo e evitar irregularidade de bagagem.

Mensagem principal
Fechar o check-in não é apenas encerrar balcão. É garantir que a operação siga com informação correta.

Conformidade e registros

Objetivo da trilha
Registrar exceções e decisões de forma profissional, rastreável e útil para continuidade operacional.

A conformidade no check-in depende de procedimento, registro e comunicação. Muitas decisões são simples quando tudo está regular, mas situações fora do padrão exigem histórico claro. Sem registro, uma decisão correta pode parecer erro; com registro ruim, uma ocorrência fica difícil de explicar.

O que registrar
- Divergência documental relevante.
- Recusa de transporte ou aceitação condicionada.
- Dano pré-existente de bagagem.
- Passageiro com assistência especial.
- Menor desacompanhado.
- Itens restritos identificados.
- Bagagem retirada ou não embarcada.
- Autorização recebida de supervisão.
- Reclamação ou conflito no atendimento.
- Orientação dada ao passageiro.

Qualidade do registro
Um bom registro responde: o que aconteceu, quando aconteceu, quem participou, qual decisão foi tomada, qual regra foi aplicada e qual área foi comunicada. Comentários vagos como problema resolvido ou passageiro orientado não ajudam em auditoria, continuidade ou defesa operacional.

Privacidade
Dados pessoais devem ser tratados com cuidado. O agente deve registrar somente o necessário para a operação e evitar exposição indevida de documentos, condições de saúde, contatos ou informações sensíveis.

Comunicação profissional
Em situações de tensão, o agente deve manter postura calma, explicar limites operacionais e acionar supervisão quando necessário. O objetivo não é vencer discussão, mas aplicar procedimento com respeito e segurança.

Checklist final
1. O passageiro foi identificado corretamente?
2. A rota e o voo foram confirmados?
3. A bagagem foi aceita conforme regra?
4. Serviços especiais foram registrados?
5. Pendências foram comunicadas?
6. Exceções ficaram registradas?
7. O próximo setor consegue entender o histórico?

Mensagem principal
Registro bom é parte do atendimento. Ele protege a operação, o passageiro e o agente.',
    244
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
    'embarque-controle-portao',
    'Embarque e Controle de Portão',
    'Operação de gate',
    'bagagem',
    'Básico',
    '1h 05min',
    '#1d4ed8',
    'Rotina operacional do portão de embarque, conferência de passageiros, prioridades, bagagem de mão, irregularidades e fechamento do voo.',
    '[{"title":"Preparação do portão","type":"Aula","duration":"10 min","content":"A preparação do portão começa antes da chamada de embarque, com conferência de voo, horário, aeronave, posição, documentação operacional, equipe e recursos de atendimento."},{"title":"Sequência de embarque","type":"Procedimento","duration":"10 min","content":"A sequência de embarque organiza prioridades, grupos, passageiros com assistência, famílias, conexões e fluxo geral para reduzir filas, conflito e atraso."},{"title":"Conferência e conciliação","type":"Prática guiada","duration":"12 min","content":"O controle de portão exige conferência do cartão de embarque, documento quando aplicável, status do passageiro e conciliação entre aceitos, embarcados e pendentes."},{"title":"Bagagem no portão","type":"Aula","duration":"12 min","content":"Bagagem de mão, volumes fora do padrão e bagagem despachada no portão precisam ser tratados com etiqueta, orientação, segurança e comunicação com rampa."},{"title":"Irregularidades no gate","type":"Simulação","duration":"11 min","content":"Atraso de passageiro, troca de assento, impedimento de embarque, overbooking, assistência especial não prevista e conflito exigem calma, registro e acionamento correto."},{"title":"Fechamento do voo","type":"Checklist","duration":"10 min","content":"O fechamento do voo confirma passageiros embarcados, ausentes, bagagens reconciliadas, informações à tripulação, documentação final e liberação operacional."}]'::jsonb,
    '[{"label":"Simulador Loading","href":"../pages/loading.html"},{"label":"Biblioteca Operacional","href":"operational-library.html"}]'::jsonb,
    '[{"question":"Qual é a finalidade da preparação do portão antes do embarque?","options":["Iniciar chamada sem conferir dados","Garantir voo, horário, equipe, recursos e informações operacionais corretas","Substituir a atuação da rampa","Eliminar a conferência de passageiros"],"correct":1},{"question":"A sequência de embarque deve considerar:","options":["Prioridades, assistências, grupos e fluxo seguro","Apenas passageiros sem bagagem de mão","Somente ordem de chegada","Apenas passageiros frequentes"],"correct":0},{"question":"O controle de portão exige conciliar:","options":["Aceitos, embarcados, pendentes e ausentes","Somente passageiros na fila","Apenas bagagens pesadas","Somente assentos de janela"],"correct":0},{"question":"Quando houver passageiro com assistência especial, o portão deve:","options":["Aguardar o passageiro pedir novamente","Confirmar registro, apoio necessário e comunicação com áreas envolvidas","Ignorar se o voo estiver no horário","Encaminhar sem registro"],"correct":1},{"question":"Bagagem de mão fora do padrão no portão deve ser tratada com:","options":["Orientação, etiqueta quando aplicável e comunicação com rampa","Aceitação automática na cabine","Entrega direta na esteira de restituição","Nenhuma ação"],"correct":0},{"question":"A conferência do cartão de embarque no gate serve para:","options":["Confirmar passageiro, voo, trecho e status de embarque","Definir franquia de bagagem","Alterar destino do passageiro","Substituir documentação internacional"],"correct":0},{"question":"Se um passageiro chega após encerramento do embarque, o agente deve:","options":["Abrir a porta da aeronave sem consulta","Seguir procedimento, explicar com clareza e acionar supervisão quando necessário","Prometer embarque no mesmo voo","Ignorar o passageiro"],"correct":1},{"question":"Overbooking ou preterição deve ser tratado com:","options":["Comunicação transparente, registro, alternativas e regras aplicáveis","Silêncio até o passageiro perceber","Remoção de passageiros sem explicação","Apenas orientação para comprar nova passagem"],"correct":0},{"question":"No fechamento do voo, é essencial confirmar:","options":["Passageiros embarcados, ausentes e bagagens reconciliadas","Apenas o horário local","Somente a quantidade de assentos vazios","Apenas a fila encerrada"],"correct":0},{"question":"Uma comunicação eficiente entre portão e rampa evita:","options":["Bagagens sem reconciliação, atraso e informação conflitante","Uso de cartão de embarque","Atendimento prioritário","Leitura de documentos"],"correct":0},{"question":"Em situação de conflito no gate, a postura recomendada é:","options":["Manter calma, escutar, explicar limites e registrar a ocorrência","Responder no mesmo tom do passageiro","Evitar qualquer explicação","Abandonar a posição"],"correct":0},{"question":"A chamada de embarque deve ser:","options":["Clara, audível, objetiva e coerente com o fluxo definido","Improvisada e sem sequência","Feita apenas uma vez","Sempre em linguagem técnica"],"correct":0},{"question":"Quando há mudança de portão, a equipe deve:","options":["Atualizar informação, orientar passageiros e comunicar áreas impactadas","Esperar que os passageiros descubram","Alterar sem registro","Informar somente após encerramento"],"correct":0},{"question":"Qual informação deve chegar à tripulação quando aplicável?","options":["Passageiros com assistência, casos especiais e pendências relevantes","Opiniões pessoais do agente","Apenas quantidade de malas grandes","Informações sem relação com o voo"],"correct":0},{"question":"O resultado de um embarque bem controlado é:","options":["Voo fechado com passageiros, bagagens e áreas alinhadas","Mais filas sem orientação","Menos rastreabilidade","Aumento de conflitos no portão"],"correct":0}]'::jsonb,
    '',
    'Preparação do portão

Objetivo da trilha
Preparar o portão de embarque com antecedência, garantindo que equipe, informações e recursos estejam alinhados antes da primeira chamada.

O embarque começa antes do passageiro formar fila. A equipe de portão precisa chegar com tempo suficiente para conferir voo, horário, aeronave, posição, portão, status operacional, passageiros especiais, eventuais mudanças e recursos necessários. A falta de preparação faz o atendimento começar atrasado e cria pressão desnecessária na equipe.

Conferências iniciais
- Número do voo e destino.
- Horário previsto de embarque e partida.
- Portão correto e eventuais alterações.
- Status da aeronave e disponibilidade para embarque.
- Lista de passageiros aceitos.
- Passageiros com assistência especial.
- Menores desacompanhados e casos sensíveis.
- Bagagens de mão em excesso ou voo com ocupação alta.
- Equipamentos do portão e comunicação com rampa.

Organização do espaço
O portão deve permitir fluxo claro. Passageiros precisam entender onde aguardar, onde formar fila, qual grupo será chamado, onde ficam prioridades e como proceder em caso de dúvida. Um ambiente confuso aumenta conflito e torna o embarque mais lento.

Comunicação inicial
Antes da chamada, a equipe deve alinhar linguagem, sequência e responsabilidades. Quem faz anúncio, quem controla fila, quem confere documentos, quem trata exceções e quem comunica rampa. Esse alinhamento evita mensagens contraditórias.

Exemplo prático
O voo está cheio e há previsão de excesso de bagagem de mão. Antes do embarque, a equipe identifica risco, prepara etiquetas de gate bag, define local de abordagem e alinha com rampa. Quando o fluxo começa, a ação já está organizada.

Mensagem principal
Portão preparado reduz atraso, conflito e improviso. O embarque bom começa antes da chamada.

Sequência de embarque

Objetivo da trilha
Aplicar uma sequência de embarque organizada, segura e compreensível para passageiros e equipe.

A sequência de embarque serve para ordenar o fluxo de passageiros até a aeronave. Ela precisa respeitar prioridades legais e operacionais, assistências especiais, famílias quando aplicável, grupos definidos no cartão de embarque, passageiros com conexão sensível e limitações de infraestrutura.

Prioridades
Passageiros com necessidade de assistência, pessoas com mobilidade reduzida, idosos, gestantes, pessoas com crianças de colo e outros perfis previstos em regra aplicável devem receber atendimento adequado. Prioridade não significa pressa desorganizada; significa fluxo protegido e comunicação respeitosa.

Chamada por grupos
A chamada por grupos reduz congestionamento no portão, na ponte, no corredor e dentro da aeronave. Quando todos são chamados ao mesmo tempo, a fila aumenta, a conferência perde qualidade e o embarque pode atrasar.

Boas práticas de anúncio
- Informar voo, destino e grupo chamado.
- Usar frases curtas e claras.
- Repetir informação essencial quando houver ruído.
- Evitar termos técnicos sem explicação.
- Orientar documentos e cartão de embarque à mão.
- Atualizar passageiros quando houver espera.

Controle de fila
A fila deve ser organizada sem confronto. O agente deve orientar com firmeza e educação, reposicionando passageiros fora do grupo chamado quando necessário. A mensagem deve explicar o motivo: segurança, fluidez e sequência operacional.

Exemplo prático
Ao chamar passageiros com assistência, a equipe garante apoio e tempo de deslocamento. Em seguida chama grupos conforme organização prevista. Passageiros de outros grupos são orientados a aguardar, evitando acúmulo na entrada da aeronave.

Mensagem principal
Sequência de embarque é gestão de fluxo. Quando a fila entende o processo, a operação fica mais rápida e menos tensa.

Conferência e conciliação

Objetivo da trilha
Controlar embarque com conferência correta de passageiro, cartão, voo, trecho e status.

O portão é uma barreira operacional de controle. Antes de entrar na aeronave, o passageiro precisa estar aceito para aquele voo e trecho. A conferência pode envolver cartão de embarque, documento quando aplicável, status no sistema, autorização especial e eventuais alertas.

Pontos de conferência
- Nome e voo.
- Origem e destino do trecho.
- Data e horário.
- Grupo de embarque quando aplicável.
- Documento exigido pela rota.
- Status aceito, embarcado, pendente ou cancelado.
- Alertas de assistência ou caso especial.

Conciliação
Conciliação é comparar a lista de passageiros aceitos com os passageiros efetivamente embarcados. Ao final do processo, a equipe precisa saber quem embarcou, quem está ausente, quem foi retirado, quem foi reacomodado e se há bagagem associada a passageiro não embarcado.

Riscos de falha
- Passageiro entra no voo errado.
- Passageiro embarca sem estar aceito.
- Passageiro aceito não embarca e sua bagagem segue indevidamente.
- Informação de no-show chega tarde à rampa.
- Tripulação recebe dado incorreto.

Tratamento de pendências
Quando o sistema aponta impedimento, alerta ou divergência, o agente não deve liberar por pressão. Deve pausar, conferir, acionar supervisão se necessário e registrar a decisão.

Exemplo prático
Um passageiro apresenta cartão de embarque antigo após reacomodação. O leitor indica divergência. O agente verifica o novo voo, explica ao passageiro e evita embarque incorreto.

Mensagem principal
Conferência no portão protege a segurança do voo e a rastreabilidade de passageiros e bagagens.

Bagagem no portão

Objetivo da trilha
Tratar bagagem de mão e volumes despachados no portão com segurança, rastreabilidade e comunicação com rampa.

Bagagem no portão é uma das fontes mais comuns de atraso e conflito. Em voos cheios, aeronaves menores ou quando há volumes fora do padrão, parte da bagagem de mão pode precisar ser despachada no portão. Esse processo exige etiqueta, orientação e controle.

Bagagem de mão fora do padrão
Volumes acima de dimensão, peso ou quantidade permitida devem ser tratados conforme regra operacional. A abordagem deve ser clara e respeitosa, explicando que a limitação existe por segurança, espaço e conforto a bordo.

Gate bag
Quando a bagagem é despachada no portão, precisa receber identificação correta e seguir fluxo seguro até a aeronave. O passageiro deve ser informado sobre onde retirará o volume: destino final, conexão, ponte ou outro ponto definido pelo procedimento.

Comunicação com rampa
A equipe de rampa precisa saber que há volumes de portão, onde estão, quantos são e para qual destino seguem. A falta de comunicação pode gerar volume não carregado, envio incorreto ou atraso no fechamento da porta.

Cuidados com itens restritos
Antes de retirar bagagem de mão da cabine, o passageiro deve ser orientado a remover itens que não podem seguir no porão, como baterias sobressalentes, powerbanks, eletrônicos essenciais, documentos, medicamentos e objetos de valor.

Exemplo prático
O voo está com ocupação alta e a tripulação informa limitação de espaço. A equipe de gate seleciona volumes maiores, etiqueta corretamente, orienta passageiros a retirar itens essenciais e comunica a rampa sobre quantidade e localização.

Mensagem principal
Despachar bagagem no portão sem controle cria risco. O processo precisa de etiqueta, orientação e comunicação.

Irregularidades no gate

Objetivo da trilha
Atuar em situações fora do padrão no portão sem comprometer segurança, rastreabilidade e experiência do passageiro.

O portão concentra pressão de tempo e expectativa do passageiro. Atrasos, troca de portão, divergência documental, passageiro atrasado, overbooking, assistência não registrada, comportamento agressivo e impedimento de embarque podem ocorrer em poucos minutos. A resposta do agente precisa ser técnica e calma.

Tipos comuns de irregularidade
- Passageiro late show.
- Passageiro em voo ou trecho incorreto.
- Documento pendente.
- Bagagem de mão fora do padrão.
- Passageiro com assistência não prevista.
- Menor desacompanhado com pendência.
- Overbooking ou preterição.
- Mudança de portão.
- Atraso operacional sem previsão definitiva.
- Conflito ou comportamento disruptivo.

Conduta profissional
1. Escutar e identificar o problema real.
2. Conferir informação no sistema ou com área responsável.
3. Explicar o limite operacional com clareza.
4. Oferecer alternativa quando disponível.
5. Acionar supervisão em caso sensível.
6. Registrar ocorrência e orientação dada.

Overbooking e preterição
Quando há mais passageiros aptos do que assentos disponíveis, a situação deve ser tratada conforme regra aplicável, com transparência, busca de voluntários quando prevista, alternativas e registro. O agente não deve improvisar promessa ou ocultar informação.

Conflito no portão
Em conflito, a equipe deve manter distância segura, tom calmo, linguagem objetiva e apoio de supervisão ou segurança quando necessário. A prioridade é proteger pessoas e operação.

Mensagem principal
Irregularidade no gate exige método: conferir, comunicar, resolver ou escalar, sempre registrando.

Fechamento do voo

Objetivo da trilha
Finalizar o embarque com conciliação correta, informação completa às áreas e liberação operacional segura.

O fechamento do voo é a etapa em que o portão confirma que o embarque foi concluído e que as áreas envolvidas podem seguir para fechamento operacional. Um fechamento apressado ou sem conciliação pode gerar passageiro ausente com bagagem a bordo, informação incorreta para tripulação ou atraso de partida.

Checklist de fechamento
- Passageiros embarcados confirmados.
- Ausentes identificados.
- Pendências resolvidas ou escaladas.
- Bagagens de passageiros ausentes tratadas conforme procedimento.
- Gate bags informadas e carregadas.
- Passageiros especiais comunicados à tripulação quando aplicável.
- Documentação final conferida.
- Horário de fechamento registrado.
- Informações relevantes repassadas à coordenação.

Comunicação final
A comunicação precisa ser objetiva: número de passageiros embarcados, ausentes, casos especiais, volumes de portão, pendências e autorização para fechamento. Mensagens incompletas atrasam a tomada de decisão.

Rastreabilidade
Tudo que foge do fluxo padrão deve ter registro. Passageiro retirado, recusa de embarque, alteração de portão, bagagem retirada, conflito, assistência não prevista e late show devem ficar documentados de forma clara.

Exemplo prático
Após última chamada, dois passageiros permanecem ausentes. O portão informa coordenação e rampa, verifica existência de bagagem despachada, aguarda orientação e registra o resultado. Só depois o voo é fechado.

Mensagem principal
Fechamento correto é segurança operacional. O voo só deve ser liberado quando passageiros, bagagens e informações estiverem conciliados.',
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
    'irregularidades-voo',
    'Atendimento em Irregularidades de Voo',
    'Direitos e contingência',
    'bagagem',
    'Intermediário',
    '1h 25min',
    '#7c3aed',
    'Atendimento em atrasos, cancelamentos, interrupções, preterição, assistência material, reacomodação, reembolso e registro de ocorrências.',
    '[{"title":"Tipos de irregularidade","type":"Aula","duration":"12 min","content":"Irregularidades de voo incluem atraso, cancelamento, interrupção, alteração programada, perda de conexão, preterição de embarque e mudanças operacionais que impactam a jornada."},{"title":"Informação ao passageiro","type":"Procedimento","duration":"12 min","content":"O passageiro deve receber informação clara, tempestiva e atualizada sobre situação do voo, previsão, motivo quando disponível, alternativas e próximos passos."},{"title":"Assistência material","type":"Consulta","duration":"14 min","content":"A assistência material deve observar tempo de espera e necessidade do passageiro, podendo envolver comunicação, alimentação, acomodação e transporte conforme regra aplicável."},{"title":"Reacomodação e reembolso","type":"Prática guiada","duration":"16 min","content":"Em cancelamento, atraso relevante ou interrupção, o atendimento deve apresentar alternativas permitidas, como reacomodação, execução por outra modalidade ou reembolso, conforme cenário."},{"title":"Preterição de embarque","type":"Simulação","duration":"15 min","content":"Preterição ocorre quando o passageiro apto não embarca por motivo operacional. O tratamento exige transparência, busca de voluntários quando aplicável, compensação e registro."},{"title":"Registro e postura em crise","type":"Checklist","duration":"16 min","content":"Em contingência, o agente deve manter calma, registrar decisões, orientar com consistência, acionar liderança e evitar promessas sem confirmação operacional."}]'::jsonb,
    '[{"label":"Dashboard do Simulador","href":"../index.html"},{"label":"Biblioteca Operacional","href":"operational-library.html"}]'::jsonb,
    '[{"question":"Qual situação é considerada irregularidade de voo?","options":["Atraso, cancelamento, interrupção, preterição ou alteração que impacta a jornada","Somente troca voluntária de assento","Apenas despacho de bagagem comum","Somente compra de passagem"],"correct":0},{"question":"Durante atraso ou cancelamento, a comunicação ao passageiro deve ser:","options":["Clara, atualizada e coerente com as informações disponíveis","Feita apenas após o embarque","Ocultada até haver solução definitiva","Sempre informal e sem registro"],"correct":0},{"question":"A assistência material deve considerar:","options":["Tempo de espera e necessidade do passageiro","Apenas o preço pago pela passagem","Somente o número do assento","Apenas a classe tarifária"],"correct":0},{"question":"Em regra operacional brasileira, a assistência após 1 hora de espera envolve:","options":["Facilidades de comunicação","Hospedagem obrigatória imediata","Reembolso automático integral sem análise","Encerramento do atendimento"],"correct":0},{"question":"Após 2 horas de espera, a assistência material tende a incluir:","options":["Alimentação conforme meios disponíveis","Apenas nova etiqueta de bagagem","Cancelamento do documento","Nenhuma obrigação adicional"],"correct":0},{"question":"Após 4 horas de espera, conforme cenário, pode ser necessária assistência com:","options":["Acomodação ou hospedagem e transporte quando aplicável","Somente aviso verbal","Troca de uniforme","Nada além de comunicação"],"correct":0},{"question":"Reacomodação significa:","options":["Oferecer alternativa de transporte ao passageiro conforme regra e disponibilidade","Cancelar o passageiro sem aviso","Alterar bagagem para outro aeroporto sem passageiro","Trocar somente o portão"],"correct":0},{"question":"Quando o passageiro tem direito a alternativas, o agente deve:","options":["Explicar opções disponíveis, prazos, impactos e registrar a escolha","Escolher por ele sem informar","Oferecer apenas a alternativa mais barata","Evitar qualquer registro"],"correct":0},{"question":"Preterição de embarque ocorre quando:","options":["Passageiro apto deixa de embarcar por motivo operacional","Passageiro decide não viajar espontaneamente","Passageiro perde documento antes do check-in","A mala fica danificada"],"correct":0},{"question":"Em caso de preterição, uma prática correta é:","options":["Buscar voluntários quando aplicável, explicar alternativas e registrar","Remover passageiro sem justificativa","Negar qualquer informação","Encerrar voo sem controle"],"correct":0},{"question":"A postura do agente em contingência deve ser:","options":["Calma, empática, objetiva e baseada em procedimento","Irritada e defensiva","Silenciosa para evitar perguntas","Improvisada a cada passageiro"],"correct":0},{"question":"Por que registros são importantes em irregularidades?","options":["Garantem rastreabilidade de informação, orientação e decisão tomada","Substituem a necessidade de atender","Servem apenas para estatística sem uso operacional","Permitem apagar evidências"],"correct":0},{"question":"Se ainda não há previsão confiável de partida, o agente deve:","options":["Informar a situação real e atualizar quando houver nova previsão","Inventar um horário para acalmar a fila","Prometer embarque imediato","Evitar contato visual"],"correct":0},{"question":"Passageiros com assistência especial em contingência exigem:","options":["Acompanhamento, prioridade adequada e cuidado com necessidades específicas","Atendimento somente no fim da fila","Nenhum tratamento diferenciado","Apenas informação por alto-falante"],"correct":0},{"question":"O objetivo de um bom atendimento em irregularidade é:","options":["Reduzir incerteza, aplicar direitos, oferecer alternativas e preservar segurança","Evitar que o passageiro saiba o que ocorreu","Encerrar a conversa o mais rápido possível","Transferir toda responsabilidade para outra área"],"correct":0}]'::jsonb,
    '',
    'Tipos de irregularidade

Objetivo da trilha
Reconhecer os principais tipos de irregularidade de voo e entender como cada uma afeta a jornada do passageiro.

Irregularidade de voo é qualquer evento que altera a execução normal da viagem e impacta o passageiro. Pode ocorrer antes do embarque, durante a conexão, depois do embarque ou até após a chegada, quando há reflexo em bagagem, transporte, acomodação ou continuidade da viagem.

Tipos mais comuns
- Atraso: o voo não parte ou não chega no horário previsto.
- Cancelamento: o voo deixa de ser realizado.
- Interrupção: a viagem é interrompida antes do destino final.
- Alteração programada: mudança feita antes da data do voo, como horário, rota ou aeroporto.
- Perda de conexão: passageiro perde o próximo trecho por atraso, mudança operacional ou tempo insuficiente.
- Preterição de embarque: passageiro apto não embarca por motivo operacional, como indisponibilidade de assento.
- Mudança de portão ou aeronave: altera fluxo, tempo de deslocamento ou capacidade.
- Contingência sistêmica: falha de sistema, fila extensa, queda de comunicação ou operação manual.

Impacto na jornada
Para o passageiro, a irregularidade gera incerteza. Ele quer saber o que aconteceu, quanto tempo vai esperar, quais opções possui, quem pagará assistência, onde retirar bagagem e como continuará a viagem. O agente deve transformar incerteza em orientação.

Diferença entre causa e efeito
A causa pode ser manutenção, meteorologia, restrição de tráfego aéreo, tripulação, segurança, infraestrutura, sistema ou malha aérea. O efeito é o que o passageiro vive: espera, perda de conexão, remarcação, pernoite, reembolso, mudança de rota ou impossibilidade de embarque.

Conduta inicial
1. Confirmar o status do voo em fonte confiável.
2. Identificar passageiros impactados.
3. Separar casos simples e casos sensíveis.
4. Verificar alternativas permitidas.
5. Comunicar com clareza e atualizar sempre que houver nova informação.
6. Registrar orientações e decisões relevantes.

Mensagem principal
Irregularidade de voo não é apenas atraso. É uma ruptura na jornada que exige informação, alternativa, assistência e registro.

Informação ao passageiro

Objetivo da trilha
Comunicar atrasos, cancelamentos e mudanças operacionais de forma clara, tempestiva e segura.

A informação é a primeira assistência ao passageiro. Em uma irregularidade, silêncio aumenta tensão, boatos e conflito. Mesmo quando ainda não existe solução definitiva, o passageiro precisa saber que a situação está sendo acompanhada, qual é o status atual e quando haverá nova atualização.

Princípios de comunicação
- Clareza: usar linguagem simples e direta.
- Atualização: informar sempre que houver mudança relevante.
- Transparência: não esconder incerteza nem inventar previsão.
- Coerência: garantir que balcão, portão, aplicativo e alto-falante não transmitam mensagens conflitantes.
- Empatia: reconhecer o impacto na vida do passageiro.
- Registro: documentar orientação dada em casos sensíveis.

O que informar
- Status atual do voo.
- Motivo quando estiver disponível e autorizado.
- Previsão de nova atualização.
- Alternativas possíveis, quando confirmadas.
- Assistência material aplicável.
- Local de atendimento.
- Orientações para conexões, bagagens e passageiros especiais.

Como falar quando não há previsão
Não é correto inventar horário para acalmar a fila. A melhor prática é dizer que ainda não há previsão confirmada, explicar que a equipe está acompanhando e informar quando a próxima atualização será dada. Promessa falsa piora a experiência e fragiliza a operação.

Exemplo de comunicação adequada
“Senhores passageiros do voo informado, ainda aguardamos confirmação operacional para nova previsão. A equipe está acompanhando a situação e retornaremos com atualização assim que houver informação segura. Passageiros com conexão ou necessidade de assistência podem procurar a equipe no balcão.”

Comunicação individual
Alguns passageiros precisam de abordagem individual: PNAE, idosos, gestantes, menores desacompanhados, passageiros com conexão curta, passageiros com compromisso médico ou situações emocionais sensíveis. A comunicação individual reduz risco e melhora a percepção de cuidado.

Mensagem principal
Boa comunicação não elimina a irregularidade, mas reduz incerteza, conflito e sensação de abandono.

Assistência material

Objetivo da trilha
Aplicar a assistência material de acordo com tempo de espera, necessidade do passageiro e cenário operacional.

A assistência material existe para reduzir o impacto da espera em atrasos, cancelamentos, interrupções ou preterições, conforme regra aplicável. Ela deve ser oferecida de forma proporcional ao tempo de espera e às condições do passageiro. No Brasil, a regra de referência estabelece assistência progressiva em marcos de tempo, sem prejuízo de políticas internas mais protetivas.

Marcos práticos de assistência
- A partir de 1 hora: facilidades de comunicação, como acesso a telefone ou internet quando aplicável.
- A partir de 2 horas: alimentação adequada, conforme meios disponíveis no aeroporto.
- A partir de 4 horas: acomodação ou hospedagem, quando necessário, e transporte entre aeroporto e local de acomodação quando aplicável.

Pontos de atenção
A assistência deve considerar a situação concreta. Um passageiro residente na cidade pode receber tratamento diferente de passageiro em trânsito sem apoio local. Passageiros com deficiência, mobilidade reduzida, idosos, gestantes, menores desacompanhados e pessoas em situação sensível exigem acompanhamento mais próximo.

O que não fazer
- Esperar o passageiro reclamar para informar direitos.
- Prometer hotel sem disponibilidade confirmada.
- Distribuir voucher sem critério ou registro.
- Tratar passageiros especiais como se tivessem as mesmas condições de espera dos demais.
- Informar horários sem fonte confiável.

Fluxo recomendado
1. Confirmar tempo estimado de espera.
2. Verificar marco de assistência aplicável.
3. Identificar passageiros com necessidade especial.
4. Organizar distribuição por ordem e prioridade operacional.
5. Registrar assistência concedida.
6. Atualizar passageiro sobre próximos passos.

Exemplo prático
Um voo sofre atraso superior a 2 horas. A equipe organiza alimentação conforme disponibilidade local, prioriza passageiros com necessidades especiais, registra distribuição e mantém atualização sobre nova previsão.

Mensagem principal
Assistência material é direito operacionalizado. Ela precisa ser entregue com controle, critério e respeito.

Reacomodação e reembolso

Objetivo da trilha
Orientar passageiros sobre alternativas em atraso relevante, cancelamento, interrupção ou perda de conexão.

Quando a viagem não acontece como contratado, o passageiro pode ter direito a alternativas. O agente deve apresentar opções permitidas conforme o caso, disponibilidade e regra aplicável. A comunicação precisa ser objetiva: o que pode ser feito, quais prazos existem, como a bagagem será tratada e quais impactos haverá na jornada.

Alternativas comuns
- Reacomodação em outro voo próprio ou de terceiro quando aplicável.
- Remarcação para data e horário de conveniência do passageiro, dentro das regras do caso.
- Execução do serviço por outra modalidade de transporte, quando cabível.
- Reembolso conforme condições da irregularidade e escolha do passageiro.
- Retorno ao aeroporto de origem, quando a viagem foi interrompida.

Como orientar
O passageiro deve entender a diferença entre esperar o próximo voo, remarcar, cancelar, receber reembolso ou seguir por outra rota. A opção mais rápida nem sempre é a melhor para todos. Passageiros com conexão, bagagem despachada, documentação internacional ou compromissos urgentes exigem análise cuidadosa.

Bagagem em reacomodação
Sempre que houver alteração de voo, a bagagem precisa ser considerada. O agente deve verificar se a bagagem foi carregada, retirada, reetiquetada ou se seguirá fluxo separado. Não adianta reacomodar o passageiro e deixar a mala em rota incompatível.

Registro da escolha
A escolha do passageiro deve ser registrada quando a situação exigir. O histórico deve indicar a alternativa oferecida, a alternativa aceita, horário, responsável e qualquer orientação sobre bagagem ou assistência.

Exemplo prático
Um cancelamento afeta passageiros com destinos diferentes. Alguns preferem reacomodação no próximo voo; outros solicitam reembolso; passageiros em conexão precisam de rota alternativa. O agente segmenta os casos e evita uma solução única para todos.

Mensagem principal
Reacomodação boa é aquela que combina direito do passageiro, disponibilidade real e controle operacional.

Preterição de embarque

Objetivo da trilha
Entender preterição de embarque e aplicar atendimento correto quando passageiro apto não puder embarcar por motivo operacional.

Preterição ocorre quando o passageiro se apresenta para embarque, cumpre requisitos aplicáveis e, ainda assim, não embarca por motivo operacional. Pode ocorrer por indisponibilidade de assento, troca de aeronave, restrição operacional, balanceamento ou outra razão que impeça o embarque apesar da aptidão do passageiro.

Conduta inicial
- Confirmar que o passageiro estava apto e dentro do prazo.
- Confirmar motivo operacional da não aceitação.
- Acionar supervisão ou coordenação.
- Buscar voluntários quando o procedimento permitir.
- Explicar alternativas de forma transparente.
- Aplicar compensação e assistência quando cabível.
- Registrar todo o processo.

Voluntários
Quando houver necessidade de reduzir passageiros, pode ser feita busca por voluntários, conforme regra aplicável. A proposta deve ser clara: benefício, novo voo, assistência, prazos e condições. O passageiro precisa aceitar de forma consciente.

Preterição involuntária
Quando não há voluntários suficientes ou o passageiro é impedido de embarcar contra sua vontade por motivo operacional, o tratamento deve ser cuidadoso. O agente deve evitar frases que culpem o passageiro e deve aplicar o fluxo previsto de compensação, assistência e reacomodação.

Comunicação recomendada
“Seu embarque foi impactado por uma restrição operacional do voo. Vamos registrar o caso, apresentar as alternativas disponíveis e providenciar a assistência aplicável.”

O que evitar
- Dizer que o passageiro perdeu o voo se ele estava apto.
- Retirar passageiro sem explicação.
- Prometer solução sem confirmar disponibilidade.
- Deixar a bagagem sem tratamento compatível.
- Não registrar a ocorrência.

Mensagem principal
Preterição é uma situação sensível. O tratamento deve ser transparente, documentado e orientado por regra.

Registro e postura em crise

Objetivo da trilha
Manter qualidade de atendimento e rastreabilidade durante contingências com muitos passageiros impactados.

Irregularidades grandes testam a maturidade da operação. Quando há atraso longo, cancelamento em massa, falha sistêmica, fila extensa ou passageiros irritados, a equipe precisa de método. Sem coordenação, cada agente fala uma coisa, a fila perde confiança e o conflito aumenta.

Postura do agente
- Manter calma e tom respeitoso.
- Escutar sem interromper agressivamente.
- Validar a frustração do passageiro sem assumir culpa pessoal.
- Explicar o que já se sabe e o que ainda está sendo confirmado.
- Evitar promessas sem respaldo.
- Direcionar casos prioritários.
- Acionar liderança quando necessário.

Organização da contingência
A liderança deve definir uma fonte única de informação, dividir tarefas e criar fluxo. Um grupo pode atender remarcações, outro assistência material, outro passageiros especiais e outro comunicação geral. Essa divisão reduz fila e evita retrabalho.

Registros essenciais
- Voo e data.
- Tipo de irregularidade.
- Horário da comunicação ao passageiro.
- Assistência concedida.
- Alternativa oferecida e escolhida.
- Passageiros com prioridade ou necessidade especial.
- Reclamações críticas ou conflito.
- Acionamento de supervisão, segurança ou áreas parceiras.

Linguagem em crise
A linguagem deve ser firme e humana. Frases como “não posso fazer nada” devem ser substituídas por “vou verificar as opções disponíveis para este caso”. A equipe deve informar limites, mas sem abandonar o passageiro.

Debriefing
Após a contingência, a equipe deve revisar o que funcionou, onde houve falha, quais informações demoraram, quais assistências foram insuficientes e quais registros precisam ser melhorados. A crise deve virar aprendizado.

Mensagem principal
Em irregularidade, o passageiro lembra de duas coisas: se recebeu informação e se foi tratado com respeito. O registro garante que a operação também aprenda com o evento.',
    246
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
    'conexoes-mct',
    'Conexões e MCT',
    'Conectividade operacional',
    'bagagem',
    'Intermediário',
    '1h 15min',
    '#0891b2',
    'Interpretação de conexões, tempo mínimo operacional, riscos para passageiros e bagagens, perda de conexão, priorização e indicadores.',
    '[{"title":"Conceito de conexão e MCT","type":"Aula","duration":"12 min","content":"MCT é o tempo mínimo de conexão necessário para que passageiro e bagagem sejam transferidos com segurança entre voos dentro das condições previstas."},{"title":"Leitura de itinerário","type":"Prática guiada","duration":"12 min","content":"A leitura do itinerário deve considerar origem, conexão, destino final, tipo de voo, mudança de terminal, controle migratório, retirada de bagagem e tempo disponível."},{"title":"Risco para passageiro e bagagem","type":"Aula","duration":"13 min","content":"Conexões curtas aumentam risco de passageiro embarcar sem a bagagem, bagagem perder o trecho, falha de reconciliação e abertura de processo no destino."},{"title":"Priorização operacional","type":"Procedimento","duration":"13 min","content":"Conexões críticas exigem identificação antecipada, comunicação entre áreas, prioridade de bagagem, orientação ao passageiro e acompanhamento até o embarque."},{"title":"Perda de conexão","type":"Simulação","duration":"13 min","content":"Quando há perda de conexão, o atendimento deve verificar causa, reacomodação, assistência, tratamento da bagagem e registros necessários para continuidade."},{"title":"Indicadores e melhoria","type":"Checklist","duration":"12 min","content":"A gestão de conexões deve acompanhar misconnection, bagagens não conectadas, tempo de transferência, causas recorrentes, turnos críticos e ações corretivas."}]'::jsonb,
    '[{"label":"Dashboard do Simulador","href":"../index.html"},{"label":"Biblioteca Operacional","href":"operational-library.html"}]'::jsonb,
    '[{"question":"O que significa MCT?","options":["Tempo mínimo de conexão","Controle máximo de tarifa","Mensagem comercial de transporte","Manual de carga temporária"],"correct":0},{"question":"O MCT existe para avaliar se há tempo mínimo para:","options":["Transferência segura de passageiro e bagagem entre voos","Escolha de assento","Compra de bagagem extra","Troca de uniforme da equipe"],"correct":0},{"question":"Na leitura de um itinerário com conexão, o agente deve observar:","options":["Origem, conexão, destino, terminais, controles e tempo disponível","Apenas o número do primeiro voo","Somente a classe tarifária","Apenas a cor da etiqueta"],"correct":0},{"question":"Uma conexão curta aumenta o risco de:","options":["Passageiro ou bagagem não seguirem no próximo trecho","Melhorar automaticamente a pontualidade","Eliminar necessidade de comunicação","Dispensar triagem de bagagem"],"correct":0},{"question":"Qual fator pode tornar uma conexão mais crítica?","options":["Mudança de terminal, controle migratório ou atraso do voo de chegada","Passageiro sentado na janela","Bagagem sem cor informada","Cartão de embarque impresso em papel"],"correct":0},{"question":"Conexões críticas devem ser tratadas com:","options":["Identificação antecipada, prioridade e comunicação entre áreas","Espera passiva","Apenas anúncio genérico","Nenhum acompanhamento"],"correct":0},{"question":"Quando a bagagem perde a conexão, uma consequência possível é:","options":["Abertura de processo de bagagem no destino","Cancelamento automático do passageiro","Eliminação do comprovante de bagagem","Embarque sem necessidade de etiqueta"],"correct":0},{"question":"Em perda de conexão do passageiro, o atendimento deve verificar:","options":["Causa, alternativa de viagem, assistência e bagagem","Apenas o assento preferido","Somente a esteira de restituição","Apenas o nome da aeronave"],"correct":0},{"question":"A bagagem em conexão precisa ser acompanhada porque:","options":["Pode exigir transferência, reconciliação, prioridade ou reetiquetagem","Nunca depende do voo do passageiro","Sempre fica no aeroporto de conexão","Não possui relação com MCT"],"correct":0},{"question":"Um bom indicador para gestão de conexões é:","options":["Quantidade de passageiros e bagagens que perderam conexão por causa recorrente","Quantidade de cafés servidos","Cor das malas por voo","Número de poltronas vazias sem análise"],"correct":0},{"question":"Quando há conexão internacional, pode ser necessário considerar:","options":["Imigração, alfândega, segurança, terminal e retirada/redespacho de bagagem","Apenas a distância até a loja mais próxima","Somente o idioma do passageiro","Nenhum controle adicional"],"correct":0},{"question":"A priorização de bagagem em conexão deve ser comunicada a:","options":["Áreas envolvidas no fluxo, como rampa, BHS, gate e coordenação","Apenas passageiros que perguntarem","Somente setor financeiro","Ninguém"],"correct":0},{"question":"Se o tempo de conexão está abaixo do mínimo aplicável, o agente deve:","options":["Tratar como risco, orientar e acionar fluxo adequado","Garantir que tudo dará certo","Ignorar por ser responsabilidade do passageiro","Apagar o registro"],"correct":0},{"question":"A análise de causa em conexões ajuda a:","options":["Reduzir reincidência de misconnection e bagagem não conectada","Aumentar filas","Remover prioridade","Evitar qualquer registro"],"correct":0},{"question":"O objetivo da gestão de MCT é:","options":["Proteger a continuidade da viagem e reduzir falhas de conexão","Criar atraso proposital","Substituir o check-in","Eliminar acompanhamento de bagagens"],"correct":0}]'::jsonb,
    '',
    'Conceito de conexão e MCT

Objetivo da trilha
Compreender o que é conexão, o que significa MCT e por que esse tempo é decisivo para passageiros e bagagens.

Conexão é a continuidade da viagem por meio de dois ou mais voos. O passageiro chega a um aeroporto intermediário e precisa seguir para outro voo até o destino final. A bagagem também pode precisar ser transferida entre aeronaves, terminais, sistemas de triagem ou áreas de carregamento.

MCT significa Minimum Connection Time, ou tempo mínimo de conexão. Ele representa o menor intervalo operacional aceitável para que o passageiro e, quando aplicável, sua bagagem consigam seguir para o próximo trecho em condições normais de operação. Esse tempo não é um detalhe comercial; ele é uma referência operacional usada para avaliar viabilidade de conexão.

Por que o MCT importa
- Ajuda a evitar venda ou aceitação de conexões inviáveis.
- Reduz risco de passageiro perder o próximo voo.
- Reduz risco de bagagem não ser transferida a tempo.
- Orienta priorização de passageiros e bagagens em conexão curta.
- Apoia análise de falhas quando ocorre extravio ou misconnection.

MCT não é garantia absoluta
Mesmo uma conexão dentro do MCT pode falhar se houver atraso de chegada, troca de terminal, controle migratório demorado, esteira distante, congestionamento no BHS, baixa disponibilidade de equipe ou restrição operacional. Por outro lado, uma conexão muito curta pode até funcionar em circunstâncias favoráveis, mas não deve ser tratada como padrão seguro.

Tipos de conexão
Doméstica para doméstica: normalmente envolve menor complexidade documental e migratória.
Doméstica para internacional: pode exigir controle documental, segurança e fluxo específico.
Internacional para doméstica: pode envolver imigração, alfândega, retirada e redespacho de bagagem conforme regra local.
Internacional para internacional: pode envolver controle de trânsito, segurança e terminal específico.

Mensagem principal
MCT é uma ferramenta de prevenção. Ele ajuda a operação a identificar risco antes que passageiro e bagagem se percam no fluxo.

Leitura de itinerário

Objetivo da trilha
Ler corretamente um itinerário com conexão e identificar pontos de risco para atendimento, portão, rampa e bagagem.

A leitura de itinerário exige olhar a viagem inteira, não apenas o próximo voo. O agente deve compreender origem, conexão, destino final, horários, terminais, tipo de voo, companhia operadora quando houver, bagagem despachada e necessidade de retirada ou redespacho.

Elementos a conferir
- Aeroporto de origem.
- Aeroporto de conexão.
- Destino final.
- Número e data de cada voo.
- Horário de chegada do primeiro trecho.
- Horário de partida do próximo trecho.
- Tempo disponível entre chegada e partida.
- Terminal ou área de embarque/desembarque.
- Necessidade de imigração, alfândega ou nova inspeção de segurança.
- Status da bagagem: etiquetada até o destino final ou até a conexão.

Como calcular a conexão
O tempo de conexão não deve ser visto apenas como diferença entre horário de chegada e saída. Na prática, o passageiro precisa desembarcar, deslocar-se, passar por controles quando existirem e chegar ao portão dentro do horário de embarque. A bagagem precisa sair da aeronave, ser lida, transferida, direcionada e carregada no próximo voo.

Pontos de atenção
- Chegada em posição remota.
- Partida em terminal diferente.
- Passageiro com mobilidade reduzida.
- Criança desacompanhada.
- Grupo grande.
- Bagagem especial ou fora do padrão.
- Voo internacional com controle documental.
- Atraso do primeiro trecho.

Exemplo prático
Um passageiro chega de voo doméstico e segue em voo internacional. Além do tempo entre voos, o agente precisa considerar deslocamento até o terminal internacional, controle de segurança, eventual conferência documental e horário real de encerramento do embarque.

Mensagem principal
Itinerário bem lido evita orientação errada. A conexão deve ser analisada como fluxo de pessoa e de bagagem, não como simples diferença de horários.

Risco para passageiro e bagagem

Objetivo da trilha
Identificar como conexões curtas ou complexas podem gerar perda de conexão e irregularidade de bagagem.

A conexão envolve dois fluxos paralelos: passageiro e bagagem. O passageiro pode conseguir chegar ao portão e a bagagem não, ou a bagagem pode seguir e o passageiro não embarcar. Ambas as situações exigem controle, comunicação e registro.

Riscos para o passageiro
- Desembarque demorado.
- Portão distante.
- Mudança de terminal.
- Controle migratório ou de segurança com fila.
- Falta de informação sobre próximo portão.
- Necessidade de assistência especial.
- Atraso do voo de chegada.
- Última chamada já iniciada ao chegar na conexão.

Riscos para a bagagem
- Descarga tardia do primeiro voo.
- Falha de leitura no BHS.
- Bagagem separada para destino incorreto.
- Tempo insuficiente de transferência.
- Falta de prioridade para conexão crítica.
- Etiqueta com destino incorreto.
- Volume especial que exige manuseio manual.
- Passageiro reacomodado sem tratamento compatível da bagagem.

Cenários comuns
Passageiro embarca sem bagagem: gera extravio no destino e possível abertura de AHL.
Bagagem segue sem passageiro: exige avaliação de reconciliação e segurança.
Passageiro perde conexão: exige reacomodação e avaliação da bagagem.
Bagagem perde conexão, passageiro segue: exige envio posterior e comunicação ao destino.

Como reduzir risco
- Identificar conexões críticas antes da chegada.
- Comunicar gate e rampa.
- Priorizar descarga e transferência quando possível.
- Orientar passageiro sobre caminho e horário.
- Verificar bagagens com destino final correto.
- Registrar exceções e causas quando ocorrer falha.

Mensagem principal
Conexão crítica não é só problema de passageiro. É risco integrado de atendimento, rampa, BHS, portão e serviço de bagagem.

Priorização operacional

Objetivo da trilha
Organizar ações preventivas para conexões críticas antes que a falha aconteça.

Priorização operacional é agir antes que a conexão seja perdida. O objetivo não é privilegiar um passageiro sem critério, mas proteger a continuidade da viagem quando existe risco real identificado por tempo, rota, atraso, terminal, bagagem ou condição especial.

Quando priorizar
- Tempo de conexão próximo ao mínimo aplicável.
- Voo de chegada atrasado.
- Próximo voo com encerramento iminente.
- Passageiro com mobilidade reduzida ou assistência especial.
- Menor desacompanhado.
- Grupo grande em conexão curta.
- Bagagem com transferência sensível.
- Voo internacional com controles adicionais.

Ações para passageiros
- Informar portão e caminho mais direto.
- Acionar assistência quando necessário.
- Comunicar o gate do próximo voo.
- Orientar sobre documentação à mão.
- Evitar que o passageiro perca tempo em filas indevidas.
- Atualizar em caso de mudança de portão.

Ações para bagagens
- Identificar volumes de conexão crítica.
- Comunicar rampa e BHS.
- Priorizar descarga quando possível.
- Verificar leitura e direcionamento.
- Confirmar se a etiqueta está correta para o destino final.
- Registrar quando a bagagem não puder seguir no mesmo voo.

Comunicação entre áreas
A priorização só funciona se check-in, conexão, portão, rampa, BHS e serviço de bagagem compartilham a mesma informação. Mensagem solta e tardia raramente resolve conexão crítica.

Exemplo prático
Um voo chega com atraso e possui passageiros para uma conexão com pouco tempo. A equipe identifica os passageiros, orienta deslocamento, comunica o próximo gate e informa a rampa sobre bagagens prioritárias. Mesmo que nem todos consigam embarcar, a operação atuou com método e registro.

Mensagem principal
Conexão crítica precisa de antecipação. Quando a equipe espera o passageiro reclamar, o tempo já foi perdido.

Perda de conexão

Objetivo da trilha
Atender corretamente passageiro e bagagem quando a conexão não acontece.

A perda de conexão, também chamada de misconnection em muitos contextos operacionais, ocorre quando o passageiro ou a bagagem não segue no trecho previsto. A resposta deve ser rápida, clara e documentada, porque o passageiro costuma estar sob pressão e precisa entender como continuará a viagem.

Primeiras verificações
- Qual voo foi perdido?
- Qual foi a causa provável?
- O passageiro estava dentro do fluxo previsto?
- Houve atraso no voo anterior?
- Existe alternativa de reacomodação?
- A bagagem foi carregada, ficou na conexão ou seguiu sem o passageiro?
- Há passageiro com assistência especial?
- Há necessidade de assistência material?

Tratamento do passageiro
O agente deve explicar a situação, apresentar alternativas permitidas, orientar sobre novo horário e registrar a solução. Se houver espera relevante, assistência material deve ser analisada conforme regra aplicável. Passageiros em viagem internacional podem precisar de atenção adicional por documentação, conexão posterior ou hospedagem.

Tratamento da bagagem
A bagagem precisa ser rastreada. Se ainda está na conexão, deve ser reetiquetada ou direcionada para o novo voo. Se seguiu sem o passageiro, o destino precisa ser comunicado e a reconciliação deve seguir procedimento. Se não for localizada, o caso pode evoluir para irregularidade de bagagem.

Comunicação com o passageiro
Evite frases vagas como “sua mala vai automaticamente”. O correto é informar o que foi verificado e, se ainda não houver confirmação, dizer que a equipe está rastreando.

Exemplo prático
O passageiro perde a conexão por atraso do voo anterior. O atendimento reacomoda no próximo voo disponível, confirma se a bagagem foi transferida, orienta sobre novo portão e registra a ocorrência. Se a bagagem não seguir, o destino recebe informação para atendimento adequado.

Mensagem principal
Perda de conexão exige duas frentes: continuar a viagem do passageiro e controlar o destino da bagagem.

Indicadores e melhoria

Objetivo da trilha
Usar dados de conexão para reduzir falhas recorrentes e melhorar a coordenação operacional.

Conexões geram aprendizado quando são medidas. Sem indicadores, a operação trata cada falha como caso isolado. Com indicadores, é possível identificar horários críticos, rotas problemáticas, terminais com maior risco, voos que chegam atrasados com frequência e etapas em que bagagens deixam de conectar.

Indicadores recomendados
- Quantidade de passageiros que perderam conexão.
- Quantidade de bagagens não conectadas.
- Percentual de conexão dentro e fora do MCT.
- Tempo médio disponível entre voos.
- Causas recorrentes de perda de conexão.
- Rotas com maior reincidência.
- Turnos com maior volume de falhas.
- Tempo de transferência de bagagem por terminal ou área.
- Casos de passageiro embarcado sem bagagem.
- Casos de bagagem encaminhada sem passageiro.

Análise de causa
A causa pode estar no atraso do voo de chegada, no MCT insuficiente, no deslocamento entre terminais, em falha de orientação, em congestionamento no BHS, em etiqueta incorreta, em falha de priorização ou em falta de comunicação entre áreas. A ação corretiva depende de identificar a causa certa.

Planos de melhoria
- Mapear conexões críticas do dia.
- Criar alerta pré-chegada para voos sensíveis.
- Padronizar comunicação entre rampa, BHS e gate.
- Melhorar sinalização e orientação ao passageiro.
- Ajustar equipe em horários de pico.
- Registrar bagagens não conectadas com causa provável.
- Revisar rotas recorrentes com alto índice de falha.

Governança
A gestão deve revisar dados periodicamente e transformar falhas em ação. Se uma mesma conexão falha várias vezes, o problema não é acaso; é padrão operacional que precisa de intervenção.

Mensagem principal
MCT bem gerido reduz extravio, reduz conflito e melhora a continuidade da viagem. O que se mede com qualidade pode ser melhorado.',
    247
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
    'bagagens-especiais',
    'Bagagens Especiais',
    'Itens fora do padrão',
    'bagagem',
    'Intermediário',
    '1h 20min',
    '#0f766e',
    'Atendimento, aceitação, identificação, manuseio e rastreabilidade de bagagens especiais, equipamentos assistivos, itens esportivos, instrumentos, animais e volumes frágeis.',
    '[{"title":"Conceito e classificação","type":"Aula","duration":"12 min","content":"Bagagens especiais são volumes que exigem análise adicional por peso, dimensão, fragilidade, valor, forma, necessidade assistiva, conteúdo ou condição de transporte."},{"title":"Equipamentos assistivos","type":"Procedimento","duration":"14 min","content":"Cadeiras de rodas, andadores, muletas, próteses e outros recursos de mobilidade devem ser tratados com prioridade, identificação clara, cuidado físico e devolução controlada."},{"title":"Itens esportivos e instrumentos","type":"Prática guiada","duration":"13 min","content":"Equipamentos esportivos e instrumentos musicais precisam de conferência de embalagem, dimensões, aceite operacional, etiqueta correta e orientação objetiva ao passageiro."},{"title":"Animais e cão-guia","type":"Aula","duration":"14 min","content":"Animais em transporte aéreo exigem regras específicas de aceitação, documentação e acomodação; cão-guia possui tratamento diferenciado por ser recurso de acessibilidade."},{"title":"Frágeis, valor e restrições","type":"Checklist","duration":"13 min","content":"Volumes frágeis, itens de valor e conteúdos restritos exigem orientação prévia, análise de aceite, registro de limitação quando aplicável e cuidado no manuseio."},{"title":"Rastreabilidade e entrega","type":"Simulação","duration":"14 min","content":"Toda bagagem especial deve manter vínculo com passageiro, etiqueta, voo e histórico de manuseio, reduzindo risco de dano, extravio e falha de devolução."}]'::jsonb,
    '[{"label":"Check-in do Simulador","href":"checkin.html"},{"label":"BHS do Simulador","href":"bhs.html"},{"label":"Biblioteca Operacional","href":"operational-library.html"}]'::jsonb,
    '[{"question":"O que caracteriza uma bagagem especial?","options":["Volume que exige análise adicional por dimensão, fragilidade, conteúdo, valor ou necessidade assistiva","Qualquer mala pequena levada na cabine","Somente bagagem despachada em voo internacional","Apenas bagagem com excesso de peso"],"correct":0},{"question":"Antes de aceitar uma bagagem especial, o agente deve verificar:","options":["Regra aplicável, embalagem, identificação, peso, dimensão e restrições operacionais","Somente a cor do volume","Apenas se o passageiro está com pressa","Somente o destino final"],"correct":0},{"question":"Equipamentos assistivos devem ser tratados com atenção porque:","options":["Podem ser essenciais para autonomia, segurança e mobilidade do passageiro","São sempre bagagens comuns sem prioridade","Devem ser recusados em todos os voos","Não precisam de identificação"],"correct":0},{"question":"Ao receber uma cadeira de rodas, é importante:","options":["Identificar, registrar condição aparente e garantir devolução adequada","Enviar sem etiqueta para agilizar","Dobrar qualquer parte sem perguntar","Misturar com volumes frágeis sem separação"],"correct":0},{"question":"Itens esportivos e instrumentos musicais exigem:","options":["Conferência de embalagem, dimensões e aceite operacional","Aceitação automática sem análise","Transporte sempre gratuito","Dispensa de etiqueta"],"correct":0},{"question":"Cão-guia deve ser entendido como:","options":["Recurso de acessibilidade vinculado ao passageiro","Bagagem comum","Carga desacompanhada","Animal sem regra específica"],"correct":0},{"question":"Em transporte de animais, o agente deve observar:","options":["Documentação, recipiente, regra de aceite, destino e condição do animal","Apenas a raça do animal","Somente a preferência do passageiro","Apenas o valor pago"],"correct":0},{"question":"Itens frágeis devem receber orientação clara porque:","options":["Podem exigir embalagem adequada, aceite condicionado e cuidado no manuseio","Nunca sofrem dano","Devem ser sempre aceitos sem registro","Não precisam ser identificados"],"correct":0},{"question":"O registro de limitação de responsabilidade é útil quando:","options":["Existe condição prévia, embalagem inadequada ou risco informado ao passageiro","O agente não quer atender","A bagagem está perfeita e sem qualquer restrição","O passageiro não despachou volume"],"correct":0},{"question":"A rastreabilidade de bagagem especial depende de:","options":["Etiqueta correta, vínculo com passageiro, voo, destino e registros de manuseio","Memória verbal da equipe","Cor da mala apenas","Ausência de comprovante"],"correct":0},{"question":"Se uma bagagem especial não puder ser aceita, o agente deve:","options":["Explicar o motivo, registrar quando necessário e orientar alternativa permitida","Apenas dizer não e encerrar","Enviar escondida no porão","Prometer transporte no próximo voo sem confirmação"],"correct":0},{"question":"O manuseio de volumes especiais deve priorizar:","options":["Integridade do item, segurança operacional e comunicação entre áreas","Rapidez sem cuidado","Empilhamento pesado sobre frágil","Ausência de conferência"],"correct":0},{"question":"Na devolução de bagagem especial, é recomendável:","options":["Conferir item, condição aparente, passageiro correto e registro de entrega","Entregar ao primeiro passageiro que reclamar","Deixar no saguão sem controle","Remover etiquetas antes da conferência"],"correct":0},{"question":"Por que bagagens especiais exigem comunicação entre check-in, rampa e restituição?","options":["Porque o risco acompanha o volume em todo o fluxo operacional","Porque apenas o check-in é responsável","Porque a restituição não precisa saber","Porque rampa não participa do processo"],"correct":0},{"question":"O objetivo do atendimento de bagagens especiais é:","options":["Garantir aceite correto, transporte seguro, rastreabilidade e devolução adequada","Aumentar recusas sem justificativa","Evitar registro de itens sensíveis","Tratar todo volume como bagagem comum"],"correct":0}]'::jsonb,
    '',
    'Conceito e classificação

Objetivo da trilha
Reconhecer quando uma bagagem deixa de ser tratada como volume comum e passa a exigir aceite, identificação e manuseio diferenciado.

Bagagens especiais são volumes que apresentam alguma característica fora do fluxo padrão. O motivo pode estar no peso, dimensão, formato, fragilidade, valor declarado, finalidade, necessidade assistiva do passageiro, conteúdo sujeito a restrição ou condição de transporte. O ponto central é entender que o risco operacional acompanha o volume desde o atendimento até a entrega.

Exemplos comuns
- Cadeira de rodas, andador, muletas, próteses e outros recursos assistivos.
- Carrinho de bebê e dispositivos de apoio à mobilidade.
- Pranchas, bicicletas, equipamentos de golfe, pesca, mergulho ou esqui.
- Instrumentos musicais em estojo rígido ou embalagem própria.
- Volumes frágeis, obras, equipamentos sensíveis e itens de alto valor operacional.
- Animais transportados conforme regra aplicável e cão-guia como recurso de acessibilidade.

Primeira análise do agente
O agente deve identificar o tipo de item, conferir se há regra de aceitação, avaliar embalagem, peso, dimensões, documentação quando aplicável, destino, conexões, restrições de aeronave e necessidade de registro adicional. A orientação ao passageiro deve ser clara antes do despacho.

Diferença entre aceitar e transportar com segurança
Aceitar o volume no balcão não encerra a responsabilidade operacional. O item ainda passará por etiquetagem, inspeção, triagem, transporte interno, carregamento, descarregamento e restituição. Cada etapa precisa preservar identificação e integridade.

Conduta recomendada
1. Perguntar qual é o item e como está embalado.
2. Conferir regra de aceitação aplicável.
3. Verificar peso, dimensão e condição aparente.
4. Orientar riscos e limitações antes do despacho.
5. Registrar informações relevantes.
6. Identificar corretamente o volume.
7. Comunicar áreas envolvidas quando o item exigir cuidado especial.

Mensagem principal
Bagagem especial não é problema; é um volume que precisa de tratamento operacional compatível com o risco.

Equipamentos assistivos

Objetivo da trilha
Aplicar cuidado operacional a equipamentos que garantem mobilidade, autonomia e dignidade do passageiro.

Equipamentos assistivos incluem cadeira de rodas manual ou motorizada, andadores, bengalas, muletas, próteses, órteses e outros recursos usados pelo passageiro para se deslocar ou manter autonomia. O tratamento desses itens deve unir acessibilidade, segurança e rastreabilidade.

Por que o cuidado é crítico
Diferente de uma mala comum, um equipamento assistivo pode ser indispensável para que o passageiro consiga desembarcar, circular no aeroporto e seguir viagem. Dano, atraso ou perda desse equipamento gera impacto direto na dignidade e na segurança da pessoa.

Atendimento no check-in
O agente deve confirmar se o passageiro precisa usar o equipamento até a porta da aeronave, se há bateria, peças removíveis, modo de dobragem, freio, joystick, apoio de pés ou partes frágeis. Sempre que houver cadeira motorizada, é necessário observar as regras aplicáveis a baterias e segurança do transporte.

Registro e identificação
- Etiquetar de forma visível e resistente.
- Registrar condição aparente quando necessário.
- Identificar peças removíveis.
- Orientar o passageiro sobre retirada ou proteção de acessórios soltos.
- Informar ponto de devolução previsto.
- Comunicar equipe de embarque, rampa e chegada quando aplicável.

Manuseio
A equipe não deve forçar dobragens, puxar por partes sensíveis, empilhar peso sobre o equipamento ou movimentar cadeira motorizada sem entender o procedimento básico. Quando houver dúvida, deve-se pedir orientação ao passageiro ou acionar equipe responsável.

Devolução
A devolução deve ocorrer de forma controlada, no ponto adequado e com conferência de integridade aparente. Se houver dano ou atraso, o passageiro deve receber atendimento prioritário e registro formal.

Mensagem principal
Equipamento assistivo é extensão da autonomia do passageiro. O cuidado operacional precisa refletir essa importância.

Itens esportivos e instrumentos

Objetivo da trilha
Tratar equipamentos esportivos e instrumentos musicais com atenção a embalagem, dimensão, fragilidade e rastreabilidade.

Itens esportivos e instrumentos musicais costumam ter formatos diferentes, partes sensíveis e valor afetivo ou profissional. Bicicletas, pranchas, tacos, varas, equipamentos de mergulho, estojos de violão, teclado, saxofone e outros instrumentos não devem ser conduzidos como mala comum sem avaliação.

Aceite operacional
Antes do despacho, o agente deve conferir se o item está embalado de forma adequada, se cabe no fluxo de esteiras e equipamentos, se precisa seguir como volume especial, se há restrição por aeronave ou aeroporto, se existe cobrança aplicável e se o passageiro foi orientado sobre riscos de embalagem inadequada.

Embalagem
Uma boa embalagem reduz danos. O ideal é usar estojo rígido, proteção interna, travamento de partes móveis e identificação externa. Sacos frágeis, caixas abertas, capa fina, fita solta ou embalagem improvisada aumentam risco e devem gerar orientação e registro quando aplicável.

Pontos de atenção
- Instrumento musical com caixa rígida ou proteção adequada.
- Bicicleta com guidão, pedal e pneus tratados conforme regra operacional.
- Prancha protegida contra impacto em extremidades.
- Equipamento de mergulho sem cilindro pressurizado fora da regra permitida.
- Itens de esporte com partes pontiagudas protegidas.
- Peso e dimensões compatíveis com transporte.

Comunicação entre áreas
Se o item não puder seguir por esteira comum, deve ser direcionado ao canal correto. A rampa precisa reconhecer que se trata de volume sensível e o setor de restituição precisa saber onde o passageiro retirará o item.

Mensagem principal
O item especial precisa chegar inteiro e identificável. A prevenção começa no aceite e continua até a restituição.

Animais e cão-guia

Objetivo da trilha
Diferenciar o transporte de animais sujeitos a regras específicas do atendimento ao cão-guia como recurso de acessibilidade.

O transporte de animais no ambiente aéreo exige avaliação documental, condição do animal, recipiente, rota, conexão, temperatura, aeronave, restrição do destino e regra do operador. O agente deve seguir normas aplicáveis e nunca improvisar aceite sem confirmação.

Animais de estimação
Quando o transporte é permitido, é necessário confirmar documentação sanitária, recipiente adequado, ventilação, segurança, identificação, peso, rota e condição aparente do animal. O passageiro deve ser orientado sobre limites de aceite, local de apresentação, tempo de antecedência e eventuais restrições.

Animais no porão ou cabine
A regra pode variar conforme tipo de animal, tamanho, recipiente, destino e aeronave. O agente deve confirmar se o animal seguirá na cabine ou no porão conforme procedimento aplicável. O foco é segurança do passageiro, do animal e da operação.

Cão-guia
Cão-guia não deve ser tratado como bagagem comum. Ele é recurso de acessibilidade vinculado à autonomia do passageiro com deficiência visual. O atendimento deve preservar respeito, espaço, prioridade e orientação adequada. O agente deve falar com o passageiro, não apenas com acompanhante, e evitar tocar ou distrair o cão sem autorização.

Conduta recomendada
- Conferir documentação exigida para o tipo de transporte.
- Confirmar recipiente, identificação e destino.
- Orientar o passageiro de forma antecipada.
- Registrar informações relevantes.
- Respeitar cão-guia como assistência essencial.
- Acionar supervisão em caso de dúvida ou restrição.

Mensagem principal
Animais exigem regra e cuidado. Cão-guia exige, além disso, respeito à acessibilidade e à autonomia do passageiro.

Frágeis, valor e restrições

Objetivo da trilha
Orientar corretamente volumes frágeis, itens de valor e conteúdos que podem exigir restrição, recusa ou registro de limitação.

Nem todo item deve ser despachado da mesma forma. Objetos frágeis, eletrônicos, itens de valor, documentos, medicamentos, dinheiro, joias, equipamentos sensíveis, líquidos, perecíveis e materiais sujeitos a regra de segurança precisam ser avaliados antes do aceite. O agente deve orientar o passageiro sem assumir responsabilidade indevida nem omitir risco.

Itens frágeis
Fragilidade pode estar no material, na embalagem ou na função do item. Um objeto pode parecer bem embalado e ainda assim ser sensível a impacto, pressão ou variação de posição. Quando a embalagem é inadequada, o passageiro deve ser orientado e o registro de limitação deve ser utilizado quando previsto.

Itens de valor
Itens de valor ou de uso essencial devem ser preferencialmente mantidos sob controle do passageiro quando permitidos. O agente deve evitar instruções que incentivem o despacho de documentos, dinheiro, joias, eletrônicos essenciais, medicamentos indispensáveis ou itens sem reposição simples.

Conteúdos restritos
Alguns conteúdos podem ser proibidos, limitados ou exigir condição específica de transporte. A análise deve considerar segurança da aviação, mercadorias perigosas, baterias, líquidos, aerossóis, equipamentos pressurizados e legislação local. Em caso de dúvida, a equipe deve consultar referência operacional e supervisão.

Registro de limitação
O registro de limitação de responsabilidade ou aceite condicionado não é ferramenta para negar atendimento; é forma de deixar claro que o passageiro foi orientado sobre condição pré-existente, embalagem inadequada ou risco conhecido. O registro deve ser objetivo e vinculado ao volume correto.

Mensagem principal
Orientar antes do despacho evita conflito depois da chegada. Fragilidade, valor e restrição precisam ser tratados com clareza e registro.

Rastreabilidade e entrega

Objetivo da trilha
Garantir que bagagens especiais sejam acompanhadas até a devolução correta ao passageiro ou ao setor responsável.

Rastreabilidade é a capacidade de saber qual item foi recebido, de quem é, para onde deve ir, por qual voo segue, em que condição aparente estava e onde foi entregue. Em bagagens especiais, essa rastreabilidade é ainda mais importante porque muitos itens não entram no fluxo comum ou exigem devolução em ponto específico.

Dados essenciais
- Nome do passageiro e vínculo com a reserva quando disponível.
- Número da etiqueta ou identificação equivalente.
- Tipo de item.
- Voo, data, origem, conexão e destino.
- Condição aparente no aceite.
- Registro de limitação ou orientação quando aplicável.
- Área responsável pelo manuseio.
- Ponto de retirada na chegada.

Durante o fluxo
O volume especial pode passar por balcão, área de itens fora de medida, inspeção, BHS, rampa, porão, descarga e restituição. Em cada etapa, a equipe precisa preservar etiqueta, evitar separação de partes, comunicar exceções e registrar falhas.

Entrega ao passageiro
A devolução deve confirmar que o item pertence ao passageiro correto. Em itens assistivos, a prioridade é devolver o mais próximo possível do ponto necessário para mobilidade. Em itens esportivos ou instrumentos, o passageiro deve ser direcionado ao local correto de retirada.

Quando ocorre irregularidade
Se houver dano, extravio ou atraso de bagagem especial, o atendimento deve ser formal, rápido e documentado. O histórico precisa descrever o item, condição observada, último ponto conhecido, ações realizadas e orientação dada ao passageiro.

Melhoria contínua
A operação deve acompanhar quais itens especiais mais geram ocorrência, em quais rotas, horários e etapas. A melhoria pode envolver treinamento de rampa, ajustes de sinalização, revisão de aceitação no check-in ou reforço de comunicação com restituição.

Mensagem principal
Bagagem especial bem rastreada reduz dano, extravio e conflito. O processo termina quando o item certo é entregue à pessoa certa.',
    248
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
    'mercadorias-perigosas-atendimento',
    'Mercadorias Perigosas no Atendimento',
    'Segurança e aceite',
    'bagagem',
    'Intermediário',
    '1h 25min',
    '#b45309',
    'Reconhecimento de artigos perigosos no atendimento ao passageiro, perguntas de segurança, baterias de lítio, aerossóis, líquidos, itens proibidos e comunicação de risco.',
    '[{"title":"Fundamentos de DGR","type":"Aula","duration":"13 min","content":"Mercadorias perigosas são artigos ou substâncias capazes de oferecer risco à saúde, segurança, aeronave, pessoas, bens ou meio ambiente durante o transporte aéreo."},{"title":"Reconhecimento no atendimento","type":"Prática guiada","duration":"14 min","content":"O agente deve reconhecer sinais de itens perigosos em bagagens por descrição, embalagem, etiquetas, odor, vazamento, aquecimento, comportamento do passageiro ou respostas às perguntas de segurança."},{"title":"Baterias, power banks e smart bags","type":"Procedimento","duration":"15 min","content":"Baterias de lítio, baterias de íon de sódio, power banks, smart bags, vapes, drones e eletrônicos exigem consulta à lista vigente, proteção contra curto-circuito, análise de dano físico e local correto de transporte."},{"title":"Aerossóis, líquidos e químicos","type":"Checklist","duration":"14 min","content":"Aerossóis, produtos inflamáveis, corrosivos, oxidantes, tintas, solventes, combustíveis, cilindros e substâncias químicas devem ser avaliados conforme regra aplicável e podem ser proibidos."},{"title":"Recusa e orientação ao passageiro","type":"Simulação","duration":"14 min","content":"Quando um item não pode ser transportado, o agente deve recusar com clareza, explicar o motivo de segurança, acionar supervisão quando necessário e registrar a ocorrência conforme procedimento."},{"title":"Incidente e comunicação","type":"Procedimento","duration":"15 min","content":"Suspeita, vazamento, fumaça, aquecimento, dano de bateria ou artigo perigoso não declarado exigem isolamento, comunicação imediata, preservação da segurança e registro formal."}]'::jsonb,
    '[{"label":"Check-in do Simulador","href":"checkin.html"},{"label":"Loading do Simulador","href":"loading.html"},{"label":"Biblioteca Operacional","href":"operational-library.html"}]'::jsonb,
    '[{"question":"O que são mercadorias perigosas no transporte aéreo?","options":["Artigos ou substâncias que podem oferecer risco à saúde, segurança, aeronave, pessoas, bens ou meio ambiente","Apenas bagagens acima do peso","Somente produtos importados","Qualquer item comprado no aeroporto"],"correct":0},{"question":"Qual é o papel do agente de atendimento em DGR?","options":["Reconhecer sinais de risco, orientar, recusar quando aplicável e acionar o procedimento correto","Classificar tecnicamente toda carga perigosa","Autorizar qualquer item solicitado pelo passageiro","Ignorar itens dentro da mala"],"correct":0},{"question":"Um indício de artigo perigoso não declarado pode ser:","options":["Odor forte, vazamento, embalagem com símbolo de risco ou resposta inconsistente","Mala com rodinhas","Passageiro com cartão de embarque impresso","Etiqueta comum de bagagem"],"correct":0},{"question":"Power banks e baterias sobressalentes exigem cuidado porque:","options":["Podem apresentar risco de curto-circuito, aquecimento ou incêndio se transportados incorretamente e devem seguir a lista vigente","São sempre proibidos em qualquer circunstância","Não têm relação com segurança","Devem ser sempre colocados na bagagem despachada"],"correct":0},{"question":"Se uma bagagem de mão for despachada no gate, o agente deve lembrar o passageiro de:","options":["Remover power banks, baterias sobressalentes e dispositivos sensíveis quando a regra exigir transporte na cabine","Retirar todas as roupas","Remover apenas etiquetas antigas","Deixar eletrônicos ligados dentro da mala"],"correct":0},{"question":"Cigarros eletrônicos e dispositivos semelhantes merecem atenção porque:","options":["Contêm bateria e podem ter restrição de uso, recarga e transporte","São equivalentes a roupas comuns","Devem ser despachados sempre","Não precisam ser informados"],"correct":0},{"question":"Qual item pode indicar risco em aerossóis ou químicos?","options":["Inflamável, corrosivo, oxidante, tóxico, gás comprimido ou vazamento","Etiqueta de prioridade","Cadeado TSA","Mala rígida"],"correct":0},{"question":"Quando um item não pode ser transportado, o agente deve:","options":["Explicar a razão de segurança, orientar alternativa permitida e registrar ou acionar supervisão quando necessário","Esconder o item na mala","Aceitar para evitar reclamação","Ignorar se o passageiro insistir"],"correct":0},{"question":"Em caso de vazamento, fumaça ou aquecimento de item na bagagem, a prioridade é:","options":["Segurança das pessoas, isolamento e comunicação imediata","Continuar o embarque sem informar","Colocar a bagagem junto das demais","Pedir ao passageiro para levar para casa sem registro"],"correct":0},{"question":"As perguntas de segurança no atendimento servem para:","options":["Prevenir embarque de artigos perigosos não permitidos ou não declarados","Aumentar o tempo de fila sem motivo","Substituir toda inspeção de segurança","Escolher assentos"],"correct":0},{"question":"Produtos aparentemente comuns podem ser DGR quando:","options":["Contêm gás, bateria, power bank, inflamável, corrosivo, oxidante, tóxico ou pressão interna","Possuem cor escura","São comprados no exterior","Estão em mala nova"],"correct":0},{"question":"Smart luggage com bateria não removível deve ser tratada como:","options":["Item que exige consulta à regra vigente e pode ser proibido se a bateria não atender às condições permitidas","Mala comum sem necessidade de análise","Bagagem que sempre deve ir despachada","Item sem relação com mercadorias perigosas"],"correct":0},{"question":"O registro de ocorrência com item perigoso é importante porque:","options":["Garante rastreabilidade, aprendizado operacional e evidência da ação tomada","Serve para culpar automaticamente o passageiro","Substitui a comunicação imediata","Permite apagar o histórico"],"correct":0},{"question":"Em caso de dúvida sobre aceite de item potencialmente perigoso, a melhor conduta é:","options":["Consultar procedimento, supervisor ou área responsável antes de aceitar","Aceitar e resolver depois","Perguntar a outro passageiro","Despachar sem etiqueta"],"correct":0},{"question":"O objetivo do treinamento de DGR no atendimento é:","options":["Prevenir transporte indevido, proteger a operação e orientar corretamente o passageiro","Transformar todo agente em expedidor de carga","Eliminar a inspeção de segurança","Permitir transporte de qualquer item"],"correct":0}]'::jsonb,
    '',
    'Fundamentos de DGR

Objetivo da trilha
Compreender o conceito de mercadorias perigosas e o papel do atendimento ao passageiro na prevenção do transporte indevido.

Mercadorias perigosas, também chamadas de artigos perigosos ou DGR, são artigos ou substâncias que podem oferecer risco à saúde, à segurança, à aeronave, às pessoas, aos bens ou ao meio ambiente durante o transporte aéreo. O risco pode estar em explosão, fogo, gás, pressão, corrosão, toxicidade, radiação, reação química, contaminação ou aquecimento.

O transporte aéreo possui restrições porque a aeronave é um ambiente pressurizado, fechado, com variação de temperatura, vibração e limitação de resposta durante o voo. Um item aparentemente comum pode se tornar perigoso se estiver mal embalado, danificado, superaquecido, vazando ou colocado no local errado.

Responsabilidade no atendimento
O agente de atendimento não precisa atuar como expedidor técnico de carga, mas precisa reconhecer sinais de risco e impedir que itens não permitidos entrem no fluxo de bagagem. Essa prevenção começa nas perguntas de segurança, na observação da bagagem, na escuta das respostas do passageiro e no acionamento do procedimento correto quando houver dúvida.

Categorias de risco que o agente deve reconhecer
- Explosivos, munições e fogos de artifício.
- Gases comprimidos ou inflamáveis.
- Líquidos inflamáveis, solventes e combustíveis.
- Sólidos inflamáveis e materiais de ignição fácil.
- Oxidantes e peróxidos orgânicos.
- Substâncias tóxicas ou infectantes.
- Materiais radioativos.
- Corrosivos.
- Baterias de lítio e equipamentos alimentados por bateria.
- Outros itens perigosos, como gelo seco ou motores com combustível residual.

Regra de ouro
Se o agente não tem certeza de que o item pode ser transportado, ele não deve aceitar por improviso. Deve consultar a referência operacional, acionar supervisão ou área responsável e manter o item fora do fluxo até decisão segura.

Mensagem principal
DGR no atendimento é prevenção. Uma pergunta feita no balcão pode evitar um risco dentro da aeronave.

Reconhecimento no atendimento

Objetivo da trilha
Identificar sinais de mercadorias perigosas durante check-in, despacho de bagagem, atendimento no gate e contato com o passageiro.

Mercadorias perigosas nem sempre chegam com etiqueta de perigo visível. Muitas aparecem como itens do dia a dia: bateria, aerossol, tinta, cola, produto de limpeza, cosmético, equipamento eletrônico, ferramenta, isqueiro, cilindro, material de camping ou produto químico. O agente precisa desenvolver atenção para descrições e sinais indiretos.

Perguntas de segurança
As perguntas de segurança devem ser feitas com naturalidade e objetividade. O passageiro precisa entender que a finalidade é proteger o voo, não criar dificuldade. Perguntas úteis investigam se há baterias sobressalentes, líquidos inflamáveis, cilindros, aerossóis, produtos químicos, armas, munições, ferramentas com combustível, itens de camping ou equipamentos danificados.

Sinais visuais e comportamentais
- Caixa com símbolo de inflamável, corrosivo, tóxico ou gás comprimido.
- Embalagem industrial sem identificação clara.
- Odor forte de combustível, solvente ou químico.
- Vazamento, umidade, manchas ou ruído interno.
- Passageiro inseguro sobre o conteúdo.
- Resposta contraditória ou genérica demais.
- Volume muito pesado para o tamanho.
- Equipamento com bateria grande, drone ou ferramenta elétrica.

Descrições de alerta
Palavras como bateria extra, power bank, spray, tinta, querosene, gasolina, fluido, solvente, cilindro, gás, munição, fogos, produto para piscina, inseticida, corrosivo, ácido, alvejante, gelo seco, motor, gerador e equipamento de mergulho devem acender atenção.

Fluxo quando houver suspeita
1. Interromper o aceite do volume.
2. Perguntar de forma objetiva sobre o conteúdo.
3. Solicitar embalagem ou documentação quando aplicável.
4. Consultar regra ou responsável competente.
5. Orientar o passageiro sobre aceite, remoção, recusa ou alternativa.
6. Registrar a ocorrência quando o procedimento exigir.

Mensagem principal
Reconhecer DGR é combinar pergunta, observação e prudência. A pressa nunca deve vencer a segurança.

Baterias, power banks e smart bags

Objetivo da trilha
Tratar corretamente baterias de lítio, baterias de íon de sódio, power banks, smart bags, eletrônicos, drones, vapes e dispositivos com risco de aquecimento ou curto-circuito.

Baterias estão presentes em celulares, notebooks, tablets, câmeras, drones, cigarros eletrônicos, brinquedos, ferramentas elétricas, equipamentos médicos portáteis, rastreadores, smart bags e power banks. Em condições normais são seguras, mas podem representar risco se estiverem danificadas, expostas a curto-circuito, esmagadas, superaquecidas, instaladas de forma inadequada ou transportadas fora das condições permitidas.

Atualização constante
A lista de itens permitidos, restritos ou proibidos muda com atualizações da OACI, IATA, ANAC, autoridade local e operador aéreo. Em 2026, a IATA destaca atualização relacionada a power banks transportados por passageiros ou tripulantes. Por isso, o treinamento não deve congelar uma lista definitiva; o agente deve consultar a tabela/lista vigente antes de liberar itens sensíveis.

Diferença importante
Bateria instalada no equipamento é diferente de bateria sobressalente. Bateria instalada costuma ter menor risco de curto-circuito quando o aparelho está protegido contra acionamento acidental. Bateria sobressalente exige proteção dos terminais e, em muitos casos, deve permanecer na bagagem de mão, conforme regra aplicável.

Power banks
Power banks são tratados como baterias sobressalentes porque sua finalidade é fornecer energia para outro equipamento. Devem receber atenção especial quanto a quantidade, capacidade, proteção contra curto-circuito, local de transporte e restrições de uso ou recarga a bordo. O passageiro deve ser orientado conforme a lista vigente e a política operacional em vigor.

Smart bags
Smart bags podem conter baterias, rastreadores, balanças eletrônicas, travas e módulos de carregamento. Se a bateria não puder ser removida ou se exceder condição permitida, a bagagem pode ser proibida. Quando a bagagem for despachada e a regra exigir remoção da bateria, a bateria deve permanecer com o passageiro na cabine, conforme procedimento vigente.

Bagagem despachada no gate
Quando uma bagagem de mão vai para o porão por falta de espaço, o agente deve lembrar o passageiro de remover power banks, baterias sobressalentes e dispositivos sujeitos a transporte somente na cabine. Essa etapa é crítica porque o passageiro pode ter passado pelo check-in com a bagagem como item de cabine.

Equipamento danificado
Eletrônico ou bateria danificada, inchada, quente, com cheiro estranho, vazamento ou sinal de queda severa deve ser tratado como risco. Não se deve colocar esse item no fluxo comum sem avaliação.

Cigarros eletrônicos e vaporizadores
Esses dispositivos possuem bateria e podem ter restrições de uso, recarga e transporte. O agente deve seguir regra aplicável e orientar o passageiro sem permitir uso indevido a bordo ou transporte em local incorreto.

Mensagem principal
Baterias exigem controle de lista vigente, local, condição e proteção. O risco principal é curto-circuito, aquecimento e fogo.

Aerossóis, líquidos e químicos

Objetivo da trilha
Reconhecer produtos químicos, aerossóis, líquidos inflamáveis e outros itens que podem ser restritos ou proibidos no transporte aéreo.

Nem todo líquido é perigoso, mas muitos líquidos e aerossóis podem oferecer risco. A diferença está na composição, quantidade, finalidade, pressão interna, inflamabilidade, corrosividade, toxicidade e embalagem. Produtos domésticos, cosméticos, ferramentas, itens automotivos e materiais de manutenção podem conter substâncias sujeitas a restrição.

Aerossóis
Aerossóis são recipientes pressurizados. Alguns podem ser permitidos em condições específicas e outros podem ser proibidos, especialmente se forem inflamáveis, industriais, tóxicos ou destinados a uso não pessoal. O agente deve observar rótulo, finalidade, quantidade e regra aplicável.

Líquidos inflamáveis
Combustíveis, solventes, tintas, removedores, colas, vernizes, querosene, álcool em alta concentração e produtos semelhantes podem ser incompatíveis com o transporte como bagagem. O risco é agravado por vazamento, vapores inflamáveis e ignição.

Corrosivos e oxidantes
Produtos como ácidos, bases fortes, alvejantes concentrados, produtos para piscina, baterias não protegidas e alguns limpadores podem corroer materiais, reagir com outras substâncias ou liberar gases. O agente deve recusar ou acionar avaliação conforme regra aplicável.

Cilindros e gases
Cilindros pressurizados, cartuchos de gás, botijões, sprays industriais e certos equipamentos de mergulho ou camping merecem atenção. Pressão interna e gás inflamável ou oxidante representam risco operacional.

Perguntas práticas
- O produto é inflamável?
- Está pressurizado?
- É produto químico industrial ou doméstico concentrado?
- Tem símbolo de risco no rótulo?
- Pode vazar ou reagir?
- Foi usado em motor, ferramenta ou equipamento com combustível?

Mensagem principal
Produto comum fora de contexto pode ser perigoso. Rótulo, finalidade e condição da embalagem devem orientar a decisão.

Recusa e orientação ao passageiro

Objetivo da trilha
Comunicar a recusa de transporte de item perigoso com clareza, respeito e firmeza operacional.

Recusar um item não é falha de atendimento. É ação de segurança. O agente deve explicar que a restrição existe para proteger passageiros, tripulação, aeronave e operação. A comunicação precisa ser objetiva, sem discussão técnica excessiva e sem exposição pública desnecessária do passageiro.

Como comunicar
Use linguagem simples: “Este item não pode seguir nesta condição porque oferece risco no transporte aéreo. Vou verificar a alternativa permitida ou orientar a retirada do item.” Evite frases como “isso é problema seu” ou “sempre passa”. A regra deve ser apresentada como procedimento de segurança.

Alternativas possíveis
Dependendo do item e da regra aplicável, pode haver alternativas: remover o item da bagagem, transportar em local diferente, proteger terminais de bateria, descartar o produto, entregar a acompanhante fora da área restrita, reembalar adequadamente ou acionar procedimento específico. Quando não houver alternativa permitida, a recusa deve ser mantida.

Quando acionar supervisão
- Passageiro discorda da recusa.
- Item não é claramente identificado.
- Há suspeita de artigo proibido ou não declarado.
- Há risco imediato, vazamento, cheiro forte ou aquecimento.
- O item envolve arma, munição, bateria grande, produto químico ou cilindro.
- O agente não localiza regra aplicável.

Registro
O registro deve conter item, orientação dada, decisão tomada, responsável acionado e eventual retirada ou recusa. Registros protegem o passageiro, a equipe e a operação.

Postura
O agente deve ser firme e respeitoso. Segurança não é negociada, mas a pessoa deve ser tratada com dignidade. Uma recusa bem explicada reduz conflito e aumenta confiança no procedimento.

Mensagem principal
A melhor recusa é clara, documentada e acompanhada de orientação possível.

Incidente e comunicação

Objetivo da trilha
Responder corretamente a suspeita, vazamento, fumaça, aquecimento ou identificação tardia de artigo perigoso.

Incidente com artigo perigoso exige ação imediata e coordenada. O agente não deve tentar resolver sozinho, abrir embalagens suspeitas sem orientação ou recolocar o item no fluxo comum. A prioridade é preservar pessoas, isolar o risco e comunicar as áreas responsáveis.

Situações críticas
- Fumaça, calor, estalo ou cheiro de queimado vindo de equipamento eletrônico.
- Bateria inchada, danificada ou vazando.
- Produto químico vazando dentro ou fora da bagagem.
- Odor de combustível ou solvente.
- Aerossol rompido ou recipiente pressurizado danificado.
- Passageiro declara item proibido após despacho.
- Bagagem com símbolo de risco identificada tardiamente.

Primeiras ações
1. Manter pessoas afastadas do item.
2. Evitar manuseio desnecessário.
3. Acionar supervisão, segurança operacional ou área definida no procedimento local.
4. Informar local, tipo de item, condição observada e se há pessoas expostas.
5. Seguir orientação de isolamento, remoção ou contenção conforme responsável competente.
6. Registrar a ocorrência.

Comunicação operacional
A comunicação deve ser curta e precisa: local, item suspeito, condição, risco aparente, passageiro vinculado quando houver, voo, bagagem, horário e ações já tomadas. Informação incompleta atrasa resposta; informação exagerada causa alarme desnecessário.

Depois do evento
Após a contenção, a equipe deve revisar causa, ponto de falha, pergunta de segurança, orientação dada, registro e necessidade de reforço de treinamento. Incidentes reais e quase incidentes são fonte de melhoria.

Mensagem principal
Com DGR, a resposta certa é rápida, coordenada e registrada. Nunca normalize vazamento, fumaça, aquecimento ou item não declarado.',
    249
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
    'comunicacao-operacional-aeroportuaria',
    'Comunicação Operacional Aeroportuária',
    'Coordenação e registro',
    'bagagem',
    'Intermediário',
    '1h 15min',
    '#2563eb',
    'Comunicação clara entre áreas aeroportuárias, briefing, passagem de turno, mensagens críticas, registro operacional, escalonamento e resposta a contingências.',
    '[{"title":"Princípios da comunicação operacional","type":"Aula","duration":"12 min","content":"Comunicação operacional deve ser clara, objetiva, confirmada, rastreável e orientada à segurança, reduzindo erro entre atendimento, gate, rampa, BHS, restituição e coordenação."},{"title":"Briefing e alinhamento do turno","type":"Procedimento","duration":"12 min","content":"O briefing organiza prioridades do turno, voos críticos, recursos, mudanças de procedimento, riscos, pendências, indicadores e responsabilidades de cada área."},{"title":"Passagem de turno e continuidade","type":"Checklist","duration":"12 min","content":"A passagem de turno deve transferir pendências, decisões, alertas, ocorrências abertas, passageiros sensíveis, bagagens críticas e próximos prazos sem perda de contexto."},{"title":"Mensagens em tempo real","type":"Prática guiada","duration":"13 min","content":"Mensagens operacionais precisam indicar quem informa, o que ocorreu, voo, local, horário, impacto, ação solicitada e confirmação de recebimento."},{"title":"Registro e rastreabilidade","type":"Procedimento","duration":"13 min","content":"O registro transforma comunicação verbal em histórico verificável, apoiando continuidade do atendimento, investigação de falhas e melhoria operacional."},{"title":"Comunicação em contingência","type":"Simulação","duration":"13 min","content":"Durante contingências, a operação precisa de fonte única de informação, linguagem padronizada, escalonamento claro, atualização periódica e controle de boatos."}]'::jsonb,
    '[{"label":"Dashboard do Simulador","href":"../index.html"},{"label":"Loading do Simulador","href":"loading.html"},{"label":"Biblioteca Operacional","href":"operational-library.html"}]'::jsonb,
    '[{"question":"Qual é a principal função da comunicação operacional no aeroporto?","options":["Garantir alinhamento seguro, claro e rastreável entre áreas","Aumentar a quantidade de mensagens sem critério","Substituir procedimentos formais","Evitar que supervisores sejam acionados"],"correct":0},{"question":"Uma mensagem operacional eficaz deve conter:","options":["Quem informa, o que ocorreu, voo, local, horário, impacto, ação e confirmação","Apenas uma opinião geral","Somente o nome do passageiro","Texto longo sem ação definida"],"correct":0},{"question":"O briefing de turno deve abordar:","options":["Prioridades, riscos, voos críticos, recursos, pendências e responsabilidades","Somente assuntos pessoais da equipe","Apenas previsão do tempo sem relação operacional","Somente número de passageiros do mês"],"correct":0},{"question":"A passagem de turno é importante porque:","options":["Evita perda de contexto sobre pendências, ocorrências e prazos","Dispensa registro no sistema","Elimina necessidade de comunicação com outras áreas","Serve apenas para troca de escala"],"correct":0},{"question":"Quando uma mensagem crítica é enviada, o receptor deve:","options":["Confirmar recebimento e informar ação quando aplicável","Ignorar se estiver ocupado","Responder apenas no fim do turno","Encaminhar sem ler"],"correct":0},{"question":"O que deve ser evitado em comunicação operacional?","options":["Mensagens vagas, boatos, informações sem fonte e promessas sem confirmação","Objetividade","Registro formal","Confirmação de recebimento"],"correct":0},{"question":"Em contingência, a operação deve trabalhar com:","options":["Fonte única de informação e atualizações padronizadas","Cada agente criando sua própria versão","Silêncio até o fim do evento","Apenas mensagens informais"],"correct":0},{"question":"O escalonamento deve ocorrer quando:","options":["A decisão excede a autonomia, envolve segurança, conflito, risco ou impacto operacional relevante","O agente quer evitar qualquer atendimento","O passageiro faz uma pergunta simples","Não existe pendência"],"correct":0},{"question":"Por que registros operacionais são essenciais?","options":["Criam histórico verificável para continuidade, auditoria e melhoria","Substituem o atendimento ao passageiro","Servem para ocultar falhas","Eliminam a necessidade de ação"],"correct":0},{"question":"A comunicação entre gate e rampa deve ser precisa porque:","options":["Impacta embarque, bagagens, carregamento, pontualidade e segurança","Não interfere na operação","Serve apenas para cordialidade","É opcional em voos domésticos"],"correct":0},{"question":"Uma boa comunicação de pendência deve informar:","options":["O que falta, responsável, prazo, impacto e próxima ação","Apenas que existe problema","Somente o nome do setor","Nenhum prazo"],"correct":0},{"question":"O uso de linguagem padronizada ajuda a:","options":["Reduzir ambiguidade, retrabalho e erro operacional","Criar mensagens mais confusas","Aumentar improviso","Evitar confirmação"],"correct":0},{"question":"Quando houver informação ainda não confirmada, o agente deve:","options":["Informar que está em verificação e atualizar quando houver fonte confiável","Inventar uma previsão","Repassar boato para ganhar tempo","Prometer solução imediata"],"correct":0},{"question":"A cultura de reporte contribui para:","options":["Identificar perigos, aprender com eventos e melhorar a segurança operacional","Punir automaticamente todos os envolvidos","Reduzir transparência","Evitar comunicação com liderança"],"correct":0},{"question":"O objetivo final da comunicação operacional é:","options":["Manter a operação segura, coordenada, eficiente e rastreável","Aumentar o volume de conversas paralelas","Evitar registros","Centralizar tudo em uma pessoa sem backup"],"correct":0}]'::jsonb,
    '',
    'Princípios da comunicação operacional

Objetivo da trilha
Entender como a comunicação reduz erro, aumenta coordenação entre áreas e fortalece a segurança operacional.

Comunicação operacional é a troca estruturada de informações necessárias para que a operação aeroportuária aconteça com segurança, pontualidade e rastreabilidade. Ela conecta atendimento, check-in, gate, rampa, BHS, restituição, manutenção, segurança, coordenação, supervisão e demais áreas envolvidas no voo.

Uma comunicação boa não é apenas falar rápido. Ela precisa ser clara, objetiva, confirmada e útil para decisão. Em ambiente aeroportuário, uma informação incompleta pode gerar atraso, bagagem fora do voo, passageiro sem assistência, falha de carregamento, conflito no portão ou risco de segurança.

Princípios essenciais
- Clareza: usar palavras simples e diretas.
- Precisão: informar voo, local, horário, item, responsável e impacto.
- Confirmação: garantir que a outra área recebeu e entendeu.
- Rastreabilidade: registrar o que precisa permanecer como histórico.
- Prioridade: diferenciar informação crítica de informação rotineira.
- Respeito: manter tom profissional mesmo sob pressão.

O que uma mensagem deve responder
Quem está informando? O que aconteceu? Onde aconteceu? Qual voo ou processo está envolvido? Qual é o impacto? O que precisa ser feito? Quem é responsável pela próxima ação? Até quando?

Erros comuns
- Mensagens vagas: “deu problema no voo”.
- Falta de identificação: não informar voo, horário ou local.
- Promessa sem confirmação: “já vai sair”.
- Boato operacional: repassar informação sem fonte.
- Falta de retorno: pedir ação e não confirmar conclusão.

Mensagem principal
Comunicação operacional não é conversa paralela. É ferramenta de segurança, continuidade e controle.

Briefing e alinhamento do turno

Objetivo da trilha
Organizar a equipe antes da operação, alinhando prioridades, riscos, mudanças e responsabilidades.

O briefing é o momento em que a equipe constrói uma visão comum do turno. Ele deve ser curto, objetivo e orientado à ação. Sem briefing, cada pessoa começa o trabalho com informações diferentes, e a operação perde coordenação logo nos primeiros eventos críticos.

Temas do briefing
- Voos do turno e horários críticos.
- Picos de passageiros e bagagens.
- Equipamentos indisponíveis ou restrições de infraestrutura.
- Mudanças de gate, esteira, sala, posição ou procedimento.
- Passageiros com assistência especial ou casos sensíveis.
- Bagagens especiais, conexões críticas ou volumes prioritários.
- Ocorrências abertas do turno anterior.
- Condições meteorológicas ou restrições operacionais.
- Distribuição de funções e responsáveis.
- Canal de comunicação e forma de escalonamento.

Briefing eficiente
Um briefing eficiente não precisa ser longo. O importante é que todos saiam sabendo o que merece atenção, quem decide, quem executa, onde buscar informação confiável e quando reportar desvio.

Modelo simples
1. Situação do turno: volume, voos e riscos.
2. Recursos: equipe, equipamentos e áreas disponíveis.
3. Pendências: o que vem do turno anterior.
4. Prioridades: o que não pode falhar.
5. Comunicação: canais, responsáveis e escalonamento.
6. Confirmação: espaço para dúvidas rápidas.

Papel da liderança
A liderança deve transformar informação em direção prática. Um bom briefing não é leitura de lista; é alinhamento para execução. Se houver mudança durante o turno, a equipe deve receber atualização com a mesma clareza.

Mensagem principal
Briefing reduz improviso. Uma equipe alinhada antes do voo responde melhor quando a operação aperta.

Passagem de turno e continuidade

Objetivo da trilha
Garantir que informações importantes não se percam quando uma equipe substitui outra.

A passagem de turno é uma das etapas mais sensíveis da operação. Muitas falhas acontecem não porque ninguém sabia resolver, mas porque a informação ficou com quem saiu do turno. O objetivo é transferir contexto, pendências e próximos passos com precisão.

O que deve ser transferido
- Voos ainda em andamento.
- Passageiros aguardando solução.
- Bagagens pendentes, localizadas, retidas ou aguardando envio.
- Casos de AHL, OHD, DPR, RFP ou entrega com ação pendente.
- Solicitações abertas de outras bases ou setores.
- Equipamentos indisponíveis ou com restrição.
- Ocorrências de segurança ou quase falhas.
- Decisões tomadas e responsáveis já acionados.
- Prazos próximos e horários combinados.

Formato recomendado
A passagem deve combinar registro escrito com conversa objetiva. O registro garante rastreabilidade; a conversa permite esclarecer contexto. Se houver apenas conversa, a informação pode se perder. Se houver apenas registro sem explicação, a equipe pode não entender a urgência.

Perguntas para validar a passagem
- O que ainda precisa ser feito?
- Quem está responsável?
- Qual é o prazo?
- Qual foi a última ação tomada?
- Quem já foi informado?
- O passageiro ou setor aguarda retorno?
- Existe risco operacional se nada for feito?

Falhas comuns
- Escrever “pendente” sem explicar pendência.
- Não informar contato feito com passageiro.
- Não registrar horário da última atualização.
- Transferir apenas parte do caso.
- Deixar informação em mensagens pessoais sem registro formal.

Mensagem principal
Passagem de turno boa evita que o passageiro conte a história de novo e evita que a operação recomece do zero.

Mensagens em tempo real

Objetivo da trilha
Construir mensagens operacionais curtas, acionáveis e confirmáveis durante a operação.

Durante a operação, a equipe precisa tomar decisões em movimento. Portão muda, bagagem atrasa, voo troca posição, passageiro precisa de assistência, rampa solicita informação, restituição identifica volume sem dono. A mensagem em tempo real deve permitir ação rápida sem gerar interpretação errada.

Estrutura de uma boa mensagem
- Identificação: quem envia e de qual área.
- Referência: voo, processo, etiqueta, gate, esteira ou posição.
- Fato: o que aconteceu, sem julgamento desnecessário.
- Impacto: atraso, passageiro aguardando, bagagem crítica, segurança, conexão.
- Ação solicitada: o que precisa ser feito.
- Prazo: quando precisa de retorno.
- Confirmação: quem recebeu e assumiu.

Exemplo fraco
“Tem uma mala aqui com problema.”

Exemplo melhor
“Restituição informa: bagagem sem etiqueta na esteira 03, chegada do voo 1234, cor preta rígida, passageiro não identificado. Solicito apoio para verificação de leitura/BHS e orientação se abre OHD.”

Canais de comunicação
Cada operação pode ter canais próprios: rádio, telefone, sistema, grupo operacional ou registro interno. O canal deve ser adequado ao tipo de informação. Mensagem crítica não deve depender de canal que ninguém monitora.

Confirmação de recebimento
A confirmação não é burocracia. Ela mostra que a mensagem chegou a alguém responsável. Em situações críticas, deve haver retorno da ação: recebido, em atendimento, concluído, sem condição, escalonado.

Mensagem principal
Mensagem operacional boa é aquela que permite agir. Se o receptor precisa adivinhar, a mensagem falhou.

Registro e rastreabilidade

Objetivo da trilha
Transformar decisões e comunicações importantes em histórico verificável.

Nem toda conversa precisa virar relatório, mas toda decisão operacional relevante precisa deixar rastro. Registro é o que permite continuidade, auditoria, investigação, defesa do atendimento e melhoria. Sem registro, a operação depende da memória individual.

O que registrar
- Decisões que afetam passageiro, bagagem, voo ou segurança.
- Mudanças de procedimento durante o turno.
- Assistência concedida ou recusada.
- Contatos feitos e tentativas de contato.
- Ocorrências, incidentes, quase falhas e desvios.
- Bagagens ou itens com tratamento especial.
- Solicitações entre áreas ou bases.
- Promessas feitas ao passageiro e prazos informados.
- Motivos de recusa ou impossibilidade operacional.

Qualidade do registro
Um registro deve ser objetivo, datado, compreensível e livre de julgamento pessoal. Ele deve indicar fato, ação e resultado. Evite textos ofensivos, suposições, abreviações desconhecidas e frases vagas.

Exemplo fraco
“Passageiro reclamou muito.”

Exemplo melhor
“Passageiro informado às 14:20 sobre atraso de entrega da bagagem. Endereço confirmado. Nova previsão enviada ao fornecedor às 14:35. Próximo retorno previsto até 16:00.”

Rastreabilidade entre áreas
Quando uma área registra corretamente, outra consegue continuar. Isso é essencial em casos de bagagem, assistência especial, irregularidade de voo, item perigoso, dano, objeto encontrado ou conexão crítica.

Cultura justa
Registro não deve ser usado apenas para procurar culpados. Ele deve ajudar a identificar perigo, corrigir processo e aprender. A cultura de reporte melhora quando a equipe percebe que registrar ajuda a operação e protege todos.

Mensagem principal
O que não fica registrado desaparece da operação. O registro certo transforma conversa em continuidade.

Comunicação em contingência

Objetivo da trilha
Manter informação confiável e coordenação quando a operação sai da normalidade.

Contingência é qualquer situação que rompe o fluxo normal: atraso em cadeia, cancelamento, queda de sistema, restrição meteorológica, fila crítica, falha de equipamento, indisponibilidade de esteira, conflito no portão, bagagem não localizada em volume relevante ou ocorrência de segurança.

Risco da comunicação em crise
Quando há pressão, surgem boatos, mensagens contraditórias e promessas apressadas. O passageiro escuta uma coisa no balcão, outra no gate e outra na restituição. A equipe também se perde, porque cada área toma decisão com informação diferente.

Fonte única de informação
A liderança deve definir uma fonte confiável para atualização. Essa fonte pode ser coordenação, supervisão ou sistema operacional. O importante é que todos saibam onde confirmar a informação antes de comunicar ao passageiro ou executar ação relevante.

Ritmo de atualização
Mesmo quando não há solução final, a equipe precisa atualizar. Dizer “ainda estamos verificando e retornaremos em novo horário” é melhor do que deixar silêncio. A atualização reduz ansiedade e evita acúmulo de perguntas individuais.

Escalonamento
Nem tudo pode ser decidido pelo primeiro atendimento. Situações com risco de segurança, conflito, mídia, passageiro vulnerável, falha sistêmica, impacto em muitos voos ou exceção à regra devem ser escalonadas rapidamente.

Plano de comunicação
1. Definir fonte oficial de informação.
2. Separar mensagens para equipe e para passageiros.
3. Padronizar linguagem.
4. Atualizar em intervalos definidos.
5. Registrar decisões críticas.
6. Encerrar a contingência com debriefing.

Mensagem principal
Em contingência, comunicação é controle operacional. Sem mensagem única, a crise se multiplica.',
    250
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
    'contestacao-operacional-aviacao',
    'Contestação Operacional na Aviação',
    'Análise e defesa técnica',
    'bagagem',
    'Intermediário',
    '1h 20min',
    '#0e7490',
    'Análise de reclamações, evidências, prazos, procedência, resposta técnica, contestação de responsabilidade, custos, registros e melhoria operacional.',
    '[{"title":"Conceito de contestação","type":"Aula","duration":"12 min","content":"Contestação é a análise técnica e documental de uma reclamação, cobrança ou responsabilização, avaliando se ela procede total, parcialmente ou não procede."},{"title":"Coleta de evidências","type":"Checklist","duration":"14 min","content":"Uma contestação forte depende de fotos, histórico, etiqueta, recibos, horários, mensagens, registros de sistema, relatos objetivos e documentos vinculados ao processo."},{"title":"Prazos e admissibilidade","type":"Procedimento","duration":"13 min","content":"Antes de analisar mérito, o agente deve verificar prazo, legitimidade, duplicidade, vínculo com o transporte, documentos mínimos e canal utilizado."},{"title":"Procedência e responsabilidade","type":"Prática guiada","duration":"14 min","content":"A análise deve separar fato comprovado, alegação, responsabilidade operacional, dano pré-existente, limitação registrada, nexo causal e decisão final."},{"title":"Resposta técnica ao passageiro","type":"Simulação","duration":"14 min","content":"A resposta deve ser clara, respeitosa, objetiva e abordar todos os pontos da demanda, explicando evidências, decisão e próximos passos."},{"title":"Indicadores e prevenção","type":"Checklist","duration":"13 min","content":"Contestações devem gerar aprendizado: causas recorrentes, bases críticas, falhas de registro, inconsistências de atendimento e ações preventivas."}]'::jsonb,
    '[{"label":"DPR do Simulador","href":"dpr.html"},{"label":"AHL do Simulador","href":"ahl.html"},{"label":"Biblioteca Operacional","href":"operational-library.html"}]'::jsonb,
    '[{"question":"O que é contestação operacional?","options":["Análise técnica e documental de uma reclamação, cobrança ou responsabilização","Negativa automática de qualquer reclamação","Substituição do atendimento ao passageiro","Exclusão de registros do processo"],"correct":0},{"question":"Qual é o primeiro cuidado em uma contestação?","options":["Entender o fato reclamado e verificar documentos, prazos e vínculo com a operação","Responder rapidamente sem analisar","Culpar outro setor","Ignorar a reclamação se houver fila"],"correct":0},{"question":"Uma evidência forte pode ser:","options":["Foto, etiqueta, recibo, histórico de sistema, horário e mensagem operacional","Comentário informal sem data","Opinião pessoal do agente","Suposição sem registro"],"correct":0},{"question":"O que significa procedência parcial?","options":["Parte da reclamação é confirmada e parte não é comprovada ou não é atribuível","Toda reclamação deve ser recusada","Toda reclamação deve ser aceita","O caso não precisa de resposta"],"correct":0},{"question":"Antes de responsabilizar uma base ou setor, deve-se confirmar:","options":["Nexo causal, registros, horários, rota, evidências e regra aplicável","Apenas quem estava no turno","Somente a opinião do passageiro","A cor da bagagem"],"correct":0},{"question":"Dano pré-existente deve ser tratado com:","options":["Registro claro, evidência e análise de limitação quando aplicável","Compensação automática","Remoção do histórico","Resposta agressiva ao passageiro"],"correct":0},{"question":"A resposta ao passageiro deve:","options":["Ser clara, objetiva, respeitosa e abordar todos os pontos da demanda","Usar termos ofensivos","Evitar explicar a decisão","Responder apenas com frases genéricas"],"correct":0},{"question":"Quando faltam informações essenciais, a conduta correta é:","options":["Solicitar complementação de forma objetiva e registrar a pendência","Encerrar sem avisar","Inventar dados para completar","Aprovar a contestação automaticamente"],"correct":0},{"question":"A duplicidade de reclamação ocorre quando:","options":["Há mais de uma demanda sobre o mesmo fato sem novo elemento relevante","O passageiro apresenta um documento","O agente faz nova análise","A reclamação tem mais de uma página"],"correct":0},{"question":"Em contestação de custo, o analista deve verificar:","options":["Origem do custo, autorização, comprovante, responsabilidade e registro no processo","Apenas o valor final","Somente quem pagou","Nenhum documento"],"correct":0},{"question":"O histórico do processo é importante porque:","options":["Mostra ações tomadas, contatos, decisões, prazos e evidências","Serve para apagar dados sensíveis","Substitui fotos e documentos","Impede nova análise"],"correct":0},{"question":"Uma contestação bem feita deve evitar:","options":["Negativas sem evidência, linguagem defensiva e conclusões sem base documental","Organização de provas","Resposta respeitosa","Análise de prazos"],"correct":0},{"question":"O que é nexo causal?","options":["Relação comprovável entre o fato ocorrido e o dano ou cobrança reclamada","Número da etiqueta da bagagem","Nome do passageiro","Prazo de embarque"],"correct":0},{"question":"Quando a reclamação é procedente, a contestação deve:","options":["Reconhecer o ponto confirmado, indicar solução e registrar ação corretiva quando aplicável","Negar mesmo com evidência","Apagar a ocorrência","Transferir sem análise"],"correct":0},{"question":"O aprendizado gerado por contestações ajuda a:","options":["Identificar falhas recorrentes de processo, registro e atendimento","Aumentar conflitos","Diminuir transparência","Eliminar treinamentos"],"correct":0}]'::jsonb,
    '',
    'Conceito de contestação

Objetivo da trilha
Entender contestação como análise técnica, documental e responsável de uma reclamação, cobrança ou imputação operacional.

Contestação operacional é o processo de verificar se uma reclamação, custo, responsabilização ou pedido de compensação procede. Ela não existe para negar o passageiro ou proteger uma área a qualquer custo. Existe para separar fato comprovado, alegação, responsabilidade, exceção, falha de processo e decisão final.

Onde aparece
A contestação pode ocorrer em casos de bagagem danificada, bagagem violada, extravio, atraso de entrega, assistência material, reembolso, custo entre bases, fault station, reason for loss, objeto encontrado, atendimento considerado inadequado ou divergência entre registros de áreas diferentes.

Três resultados possíveis
- Procedente: a análise confirma a reclamação ou responsabilidade.
- Parcialmente procedente: parte do que foi reclamado é confirmada e parte não é comprovada ou não tem vínculo operacional.
- Improcedente: as evidências disponíveis não confirmam a reclamação ou indicam ausência de responsabilidade operacional.

O que contestação não é
- Não é resposta automática negativa.
- Não é opinião pessoal do agente.
- Não é apagar histórico desfavorável.
- Não é procurar culpado sem evidência.
- Não é tratar o passageiro como adversário.

Perguntas iniciais
O que foi reclamado? Quando ocorreu? Qual voo, processo ou serviço está envolvido? Há vínculo com o transporte aéreo? O prazo foi respeitado? Existem documentos mínimos? Há evidência do fato? Há registro anterior? Há duplicidade?

Mensagem principal
Contestação boa é técnica e respeitosa. Ela protege o passageiro, a operação e a qualidade da decisão.

Coleta de evidências

Objetivo da trilha
Identificar quais documentos e registros sustentam uma contestação confiável.

Uma contestação sem evidência vira opinião. A força da análise depende de dados objetivos que possam ser conferidos por outra pessoa. O agente deve buscar fontes primárias: sistema, histórico, fotos, recibos, etiquetas, horários, mensagens, relatórios, comprovantes e documentos apresentados pelo passageiro.

Evidências comuns em bagagem
- Número da etiqueta e comprovante de despacho.
- Fotos da bagagem no ato do recebimento ou reclamação.
- Registro de dano pré-existente ou limitação de responsabilidade.
- Histórico de AHL, OHD, DPR, RFP ou entrega.
- Data e hora de abertura do processo.
- Voo, rota e esteira de restituição.
- Recibo de entrega e confirmação de endereço.
- Mensagens entre bases, rampa, BHS ou fornecedor.
- Relato objetivo do passageiro e da equipe.

Evidências em atendimento ou voo
- Protocolo de atendimento.
- Cartão de embarque, bilhete ou reserva.
- Horário de chegada, embarque, cancelamento ou alteração.
- Alternativas oferecidas.
- Assistência concedida ou recusada.
- Mensagens de supervisão ou coordenação.
- Registro de contato e tentativa de contato.

Qualidade da evidência
A evidência deve ter vínculo com o caso, data, origem e conteúdo legível. Foto sem data, print cortado, mensagem sem identificação ou relato sem contexto enfraquece a contestação. Se a evidência não for suficiente, a resposta deve reconhecer a limitação da análise.

Organização do dossiê
1. Separar dados do passageiro e do processo.
2. Montar linha do tempo.
3. Anexar documentos por tipo.
4. Destacar registros que comprovam decisão.
5. Apontar lacunas de informação.
6. Concluir com base no conjunto de evidências.

Mensagem principal
Quem contesta precisa provar. Evidência organizada evita resposta frágil e reduz retrabalho.

Prazos e admissibilidade

Objetivo da trilha
Verificar se a reclamação pode ser analisada e quais condições mínimas precisam estar presentes antes do mérito.

Antes de discutir se a reclamação procede, é preciso verificar admissibilidade. Isso significa confirmar se a demanda tem relação com o transporte aéreo, se foi apresentada por pessoa legitimada, se há documentos mínimos, se não há duplicidade e se o prazo aplicável foi observado.

Pontos de admissibilidade
- A reclamação tem relação com serviço aéreo prestado?
- O passageiro ou representante tem legitimidade?
- O processo se refere ao mesmo fato de uma demanda já aberta?
- Há documento, bilhete, etiqueta, protocolo ou informação mínima para localizar o caso?
- O prazo de reclamação aplicável foi respeitado?
- A demanda exige complemento antes da análise?

Prazos
Prazos variam conforme o tipo de ocorrência, legislação aplicável, rota, canal e política operacional. Por isso, o agente deve consultar a regra vigente antes de concluir. Em plataformas regulatórias, também podem existir prazos específicos para resposta e para interação posterior do passageiro.

Duplicidade
Duas reclamações sobre o mesmo fato podem gerar confusão, respostas divergentes e duplicidade de compensação. Quando houver duplicidade, deve-se identificar o processo principal, registrar vínculo e orientar a continuidade no canal correto.

Complementação
Se faltar informação essencial, a equipe deve pedir complementação de forma objetiva. O pedido deve dizer exatamente o que falta: etiqueta, foto, documento, data, voo, recibo, protocolo ou autorização de representação. Pedidos genéricos atrasam o caso.

Quando seguir para o mérito
A análise de mérito começa quando há elementos mínimos para comparar alegação, registros e regra aplicável. Se o caso não for admissível, a resposta deve explicar o motivo sem linguagem hostil.

Mensagem principal
Admissibilidade vem antes do mérito. Uma contestação técnica começa confirmando se o caso pode ser analisado.

Procedência e responsabilidade

Objetivo da trilha
Avaliar se há responsabilidade operacional, nexo causal e base documental para aceitar, negar ou aceitar parcialmente a reclamação.

Procedência é a conclusão sobre o mérito da reclamação. Ela deve resultar da comparação entre o relato do passageiro, os registros operacionais, documentos apresentados, prazos, regras aplicáveis e evidências internas.

Nexo causal
Nexo causal é a relação comprovável entre o fato ocorrido e o dano, custo ou reclamação. Por exemplo: uma bagagem foi entregue com dano, há foto no desembarque, não havia registro de dano pré-existente e o processo foi aberto dentro do prazo. Nesse caso, há elementos para analisar responsabilidade. Sem nexo, a contestação fica mais forte para improcedência ou procedência parcial.

Responsabilidade operacional
A responsabilidade pode estar associada ao atendimento, check-in, rampa, BHS, restituição, entrega, base de origem, base de conexão, base de destino, fornecedor ou situação externa. A análise deve evitar conclusões por aparência. É preciso olhar horários, rota, manipulação conhecida, registros e exceções.

Dano pré-existente e limitação
Quando há registro anterior de dano, embalagem inadequada, item frágil mal acondicionado ou limitação aceita pelo passageiro, a decisão pode mudar. Mas isso só é válido se o registro for claro, vinculado ao volume correto e feito antes do evento reclamado.

Procedência parcial
A procedência parcial é comum. Um atraso pode ser confirmado, mas o valor pedido pode não ter comprovação. Um dano pode existir, mas parte do item reclamado pode não ter relação com transporte. Uma assistência pode ter sido devida por determinado período, mas não por todo o valor solicitado.

Checklist de decisão
- O fato ocorreu?
- O prazo foi respeitado?
- Há evidência suficiente?
- Existe nexo causal?
- Há registro prévio que limite responsabilidade?
- Há custo comprovado?
- A regra aplicável permite a solução solicitada?
- A resposta aborda todos os pontos?

Mensagem principal
Contestação técnica decide com base em fatos, não em impressão. Procedência exige prova, regra e coerência.

Resposta técnica ao passageiro

Objetivo da trilha
Construir respostas claras, respeitosas e completas para demandas procedentes, parcialmente procedentes ou improcedentes.

A resposta é a face visível da contestação. Mesmo quando a decisão é negativa, o passageiro deve compreender que houve análise. Uma resposta genérica aumenta conflito; uma resposta técnica e humana reduz dúvida e melhora confiança no processo.

Características de uma boa resposta
- Cumprimenta e identifica o caso.
- Resume o que foi analisado.
- Informa documentos e registros considerados.
- Responde todos os pontos da demanda.
- Explica a decisão com linguagem clara.
- Indica solução, negativa ou complementação necessária.
- Evita termos ofensivos, culpabilização e jargão excessivo.
- Orienta próximo passo quando existir.

Resposta procedente
Quando a reclamação procede, a resposta deve reconhecer o ponto confirmado, informar a solução aplicável, prazo de execução e canal de acompanhamento. Se houver ação corretiva interna, ela pode ser registrada sem expor detalhes sensíveis.

Resposta parcialmente procedente
Nesse caso, explique o que foi reconhecido e o que não foi comprovado. A clareza evita percepção de contradição. Exemplo: “Foi confirmada a demora na entrega; porém, os itens adicionais informados não possuem comprovação documental suficiente para análise de ressarcimento.”

Resposta improcedente
A improcedência deve ser fundamentada. Evite apenas “não procede”. Explique quais registros foram consultados e por que eles não confirmam responsabilidade ou nexo causal. Se faltou documento essencial, informe isso de forma objetiva.

Tom adequado
A resposta deve ser firme sem ser defensiva. O objetivo não é vencer o passageiro; é concluir a análise com respeito, transparência e base documental.

Mensagem principal
Boa resposta não é longa; é completa. Ela mostra o que foi analisado, qual foi a decisão e por quê.

Indicadores e prevenção

Objetivo da trilha
Usar as contestações para identificar falhas recorrentes e melhorar a operação.

Cada contestação revela algo sobre o processo. Se muitas reclamações são improcedentes por falta de documentação, talvez o passageiro esteja sendo mal orientado. Se muitas são procedentes por falha de registro, o problema está no fluxo interno. Se uma base concentra custos contestados, talvez exista falha de manuseio, comunicação ou entrega.

Indicadores úteis
- Quantidade de contestações por tema.
- Percentual procedente, improcedente e parcialmente procedente.
- Tempo médio de resposta.
- Reclamações por base, voo, rota ou fornecedor.
- Principais documentos ausentes.
- Custos contestados e custos confirmados.
- Reincidência por tipo de dano, atraso ou atendimento.
- Falhas de registro encontradas durante a análise.

Prevenção
A melhor contestação é aquela que não precisa acontecer porque o processo foi bem executado desde o início. Fotos corretas, histórico claro, recibo preenchido, comunicação entre áreas e orientação ao passageiro reduzem conflitos futuros.

Ações corretivas
- Treinar equipe em registro de evidências.
- Padronizar fotos e descrições de dano.
- Melhorar passagem de turno.
- Revisar campos obrigatórios em processos de bagagem.
- Criar checklist para casos sensíveis.
- Monitorar fornecedores de entrega.
- Reforçar comunicação em atrasos e irregularidades.

Cuidado com cultura defensiva
Se a equipe enxerga contestação apenas como disputa, perde-se aprendizado. O ideal é usar dados para melhorar o processo, reduzir reclamações e responder com mais qualidade.

Mensagem principal
Contestação não termina na resposta. Ela deve gerar melhoria, reduzir reincidência e fortalecer a operação.',
    251
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
    'gestao-crise-aeroporto',
    'Gestão de Crise no Aeroporto',
    'Resposta e continuidade',
    'gestão operacional',
    'Avançado',
    '1h 25min',
    '#0369a1',
    'Preparação, comando, comunicação, atendimento humanizado, continuidade operacional, exercícios e lições aprendidas em eventos críticos aeroportuários.',
    '[{"title":"Conceito de crise aeroportuária","type":"Aula","duration":"13 min","content":"Uma crise aeroportuária é uma situação fora da normalidade que exige resposta coordenada, comunicação controlada e tomada de decisão rápida. Pode envolver falha sistêmica, evento de segurança, cancelamento massivo, restrição meteorológica, acidente, ameaça, interrupção de terminal, indisponibilidade de esteiras, conflito operacional ou impacto severo ao passageiro."},{"title":"Comando e papéis","type":"Procedimento","duration":"14 min","content":"Em crise, cada pessoa precisa saber seu papel. A liderança define prioridades, coordena áreas, valida informações e evita decisões isoladas. O agente executa ações dentro de sua responsabilidade, registra ocorrências, informa desvios e aciona supervisão quando a situação ultrapassa seu nível de decisão."},{"title":"Comunicação de crise","type":"Prática guiada","duration":"14 min","content":"A comunicação de crise deve ser única, objetiva e atualizada. Mensagens diferentes entre balcão, portão, restituição e supervisão aumentam tensão e reduzem confiança. O ideal é ter fonte oficial, intervalo de atualização, registro de decisões e linguagem adequada para equipe e passageiros."},{"title":"Atendimento humanizado","type":"Aula","duration":"15 min","content":"Eventos críticos afetam pessoas. O atendimento deve priorizar escuta, respeito, clareza e suporte a passageiros vulneráveis. Informar com honestidade, evitar promessas sem confirmação e orientar próximos passos ajuda a reduzir ansiedade e protege a relação com o usuário."},{"title":"Continuidade operacional","type":"Simulação","duration":"15 min","content":"Continuidade operacional é manter serviços essenciais funcionando ou retomá-los em ordem de prioridade. A equipe deve identificar recursos críticos, gargalos, alternativas de fluxo, necessidade de reforço, impacto em voos e comunicação com áreas de apoio."},{"title":"Exercícios e lições aprendidas","type":"Checklist","duration":"14 min","content":"Treinamentos, simulações e debriefings transformam experiência em melhoria. Depois de uma crise, a equipe deve revisar linha do tempo, decisões, falhas de comunicação, tempos de resposta, registros e ações corretivas para fortalecer o plano."}]'::jsonb,
    '["Simulação de sala de crise","Checklist de comunicação","Plano de ação pós-evento"]'::jsonb,
    '[{"question":"O que caracteriza uma crise aeroportuária?","options":["Evento fora da normalidade que exige resposta coordenada e rápida","Qualquer atendimento comum no balcão","Somente atraso de cinco minutos","Apenas problema comercial"],"correct":0},{"question":"Em uma crise, a fonte oficial de informação serve para:","options":["Evitar mensagens conflitantes e orientar decisões","Substituir todos os registros","Impedir comunicação entre áreas","Criar boatos mais rápidos"],"correct":0},{"question":"Qual conduta é adequada diante de passageiros afetados por uma crise?","options":["Escutar, informar com clareza e evitar promessas sem confirmação","Ignorar perguntas até haver solução final","Transferir todos sem orientação","Usar linguagem agressiva para encerrar filas"],"correct":0},{"question":"O papel da liderança durante crise é:","options":["Coordenar prioridades, validar informações e distribuir responsabilidades","Executar todas as tarefas sozinha","Evitar qualquer registro","Deixar cada área decidir isoladamente"],"correct":0},{"question":"Continuidade operacional significa:","options":["Manter ou retomar serviços essenciais com prioridade definida","Parar todos os serviços sem análise","Atender apenas passageiros frequentes","Aguardar fim da crise sem plano"],"correct":0},{"question":"Por que registrar decisões críticas?","options":["Para rastreabilidade, passagem de turno e aprendizado","Para aumentar retrabalho","Para substituir atendimento","Para dificultar auditoria"],"correct":0},{"question":"Um bom comunicado em contingência deve ser:","options":["Objetivo, confirmado, atualizado e compreensível","Longo, confuso e sem responsável","Baseado em suposição","Diferente em cada área"],"correct":0},{"question":"Exercícios simulados servem para:","options":["Treinar resposta, testar plano e identificar melhorias","Substituir plano real","Eliminar necessidade de liderança","Criar registros fictícios"],"correct":0},{"question":"O atendimento a passageiros vulneráveis em crise deve priorizar:","options":["Segurança, respeito, acessibilidade e orientação clara","Rapidez sem escuta","Atendimento somente após todos os demais","Informação técnica sem acolhimento"],"correct":0},{"question":"Quando a informação ainda não está confirmada, o agente deve:","options":["Informar que está verificando e atualizar no prazo combinado","Inventar uma previsão","Culpar outra área","Encerrar a conversa"],"correct":0},{"question":"Um debriefing pós-crise deve analisar:","options":["Linha do tempo, decisões, comunicação, registros e ações corretivas","Somente quem errou","Apenas elogios","Nenhum dado operacional"],"correct":0},{"question":"Em crise, escalonamento é necessário quando:","options":["Há risco, exceção, impacto amplo ou decisão fora da alçada","O passageiro faz pergunta simples","A operação está normal","O agente quer evitar registro"],"correct":0},{"question":"O plano de emergência deve ser conhecido por:","options":["Equipes envolvidas e responsáveis por execução e comunicação","Somente pela direção","Apenas pelo passageiro","Ninguém, por segurança"],"correct":0},{"question":"Uma crise mal comunicada tende a gerar:","options":["Boatos, tensão, retrabalho e perda de confiança","Mais clareza operacional","Menos necessidade de supervisão","Ausência de filas"],"correct":0},{"question":"A cultura de melhoria após crise depende de:","options":["Registrar fatos, aprender com desvios e executar ações corretivas","Apagar evidências","Evitar treinamento","Responsabilizar sem análise"],"correct":0}]'::jsonb,
    '',
    'Conceito de crise aeroportuária

Objetivo da trilha
Entender o que transforma uma ocorrência operacional em crise aeroportuária e quais são os primeiros cuidados para manter controle, segurança e comunicação.

Uma crise aeroportuária é uma situação que ultrapassa a rotina normal da operação e exige coordenação rápida entre áreas. Pode envolver acidente, ameaça, falha sistêmica, indisponibilidade de terminal, evento meteorológico severo, cancelamentos em massa, filas críticas, conflito com passageiros, interrupção de esteiras, pane em sistemas de atendimento, indisponibilidade de equipes ou qualquer evento com impacto amplo em segurança, continuidade e imagem institucional.

Diferença entre ocorrência e crise
Uma ocorrência é um desvio pontual que pode ser tratado pelo fluxo normal. Uma crise surge quando o desvio afeta várias pessoas, áreas ou processos, quando há risco à segurança, quando a decisão precisa ser escalonada ou quando a comunicação passa a exigir fonte oficial. A mesma falha pode ser pequena ou crítica dependendo de horário, volume de passageiros, exposição, recursos disponíveis e risco envolvido.

Elementos de uma crise
- Evento fora da normalidade.
- Impacto em segurança, continuidade, atendimento ou reputação.
- Necessidade de coordenação entre áreas.
- Informação incompleta ou em rápida mudança.
- Pressão de tempo.
- Necessidade de registro e rastreabilidade.
- Possibilidade de passageiros vulneráveis afetados.

Primeiras ações
A primeira resposta deve priorizar segurança das pessoas, preservação de informações, acionamento correto e comunicação controlada. O agente não precisa resolver tudo sozinho; precisa identificar o risco, acionar a liderança, seguir procedimento local, registrar fatos e evitar divulgar informação não confirmada.

Cultura de segurança
A gestão de crise se conecta ao Sistema de Gerenciamento da Segurança Operacional, que trabalha com identificação de perigos, gestão de riscos, ações corretivas, treinamento, comunicação e melhoria contínua. Uma crise deve gerar aprendizado, não apenas encerramento administrativo.

Mensagem principal
Crise não é apenas evento grande. É qualquer situação em que a operação perde previsibilidade e precisa recuperar controle com método, comunicação e responsabilidade.

Comando e papéis

Objetivo da trilha
Compreender como responsabilidades claras reduzem improviso e evitam conflito de decisão durante uma crise.

Durante uma crise, a operação precisa de comando definido. Isso não significa centralizar todas as tarefas em uma pessoa, mas estabelecer quem valida informação, quem decide, quem executa, quem comunica, quem registra e quem acompanha pendências. Quando todos tentam decidir ao mesmo tempo, surgem mensagens contraditórias, atrasos e retrabalho.

Papéis essenciais
- Coordenação ou liderança: define prioridade, valida informações e autoriza decisões fora da rotina.
- Atendimento: orienta passageiros, identifica necessidades especiais e registra interações relevantes.
- Rampa e bagagem: informam impactos operacionais, restrições, recursos e andamento de serviços.
- Segurança: atua em risco físico, acesso, isolamento e acionamentos previstos.
- Comunicação: padroniza mensagens internas e externas conforme orientação oficial.
- Suporte administrativo: apoia registros, listas, contatos e documentação.

Escalonamento
O agente deve escalonar quando houver risco à segurança, mídia, conflito, passageiro vulnerável, exceção à regra, custo relevante, decisão sem precedente ou impacto em vários voos. Escalonar não é abandonar o caso; é levar a decisão para o nível correto.

Briefing de crise
Um briefing curto ajuda a alinhar: o que aconteceu, qual impacto, quais áreas envolvidas, quais ações já foram feitas, quem é responsável por cada frente, quando será a próxima atualização e qual mensagem pode ser comunicada.

Registro de responsabilidade
Decisões precisam deixar rastro. Quem autorizou? Em qual horário? Qual ação foi determinada? Qual área assumiu? Qual foi o resultado? Esse histórico permite continuidade quando há troca de turno e apoia análise posterior.

Erro comum
Um erro frequente é confundir boa vontade com coordenação. Muitas pessoas tentando ajudar sem comando claro podem bloquear passagem, duplicar contato, prometer soluções diferentes ou deixar tarefas críticas sem dono.

Mensagem principal
Em crise, clareza de papéis é tão importante quanto rapidez. A equipe age melhor quando sabe exatamente quem decide e quem executa.

Comunicação de crise

Objetivo da trilha
Aprender a comunicar com precisão, regularidade e empatia quando a operação está sob pressão.

A comunicação é uma das principais ferramentas de controle em crise. Se a informação circula sem validação, a crise cresce. Passageiros recebem versões diferentes, equipes executam ações conflitantes e a liderança perde visão do que está acontecendo. Por isso, a comunicação deve ter fonte oficial, linguagem clara, frequência definida e registro das decisões.

Fonte única de informação
A liderança deve indicar onde a equipe confirmará informações: coordenação, sistema, grupo operacional autorizado, rádio ou sala de crise. A fonte única evita que prints, boatos e mensagens soltas conduzam a operação.

Mensagem para equipe
A equipe precisa de informação objetiva: fato confirmado, impacto, ação esperada, responsável, prazo e próxima atualização. Exemplo: “Sistema de bagagem com instabilidade. Atendimento deve orientar passageiros que a entrega poderá atrasar. Rampa informará primeira previsão em 15 minutos. Não prometer horário final sem confirmação.”

Mensagem para passageiros
A comunicação ao passageiro deve ser humana e direta. Deve explicar o que é possível confirmar, o que está sendo feito e quando haverá nova atualização. Quando não houver previsão, é melhor dizer que a previsão ainda está em apuração do que criar expectativa falsa.

Periodicidade
Mesmo sem solução final, a equipe deve atualizar em intervalos definidos. Silêncio prolongado aumenta ansiedade e provoca deslocamento de passageiros para balcões, portões e restituição. Informação curta e frequente reduz tensão.

O que evitar
- Culpar outra área em público.
- Usar termos técnicos sem explicação.
- Prometer solução não confirmada.
- Divulgar causa antes de validação.
- Responder com ironia ou irritação.
- Enviar mensagens diferentes para públicos diferentes.

Mensagem principal
Comunicação de crise não é improviso. É disciplina para dizer a verdade disponível, no momento certo, com linguagem que permite ação.

Atendimento humanizado

Objetivo da trilha
Aplicar empatia, prioridade e clareza no atendimento de passageiros afetados por eventos críticos.

Toda crise operacional atinge pessoas. Passageiros podem estar cansados, com crianças, idosos, deficiência, conexão perdida, compromisso médico, luto, viagem internacional, barreira de idioma ou limitação financeira. O agente precisa unir regra e humanidade para reduzir sofrimento sem prometer o que não pode cumprir.

Escuta ativa
Antes de responder, o agente deve ouvir o problema real. Muitas vezes a necessidade do passageiro não é apenas saber “quando resolve”, mas entender onde aguardar, como receber atualização, se terá assistência, se precisa remarcar, como proteger bagagem ou como registrar contato.

Prioridades
Passageiros com deficiência, mobilidade reduzida, idosos, gestantes, crianças desacompanhadas e pessoas em situação de vulnerabilidade devem receber atenção especial conforme procedimento aplicável. Prioridade não significa descumprir segurança; significa ajustar suporte à necessidade.

Linguagem adequada
Use frases simples e objetivas: “Estamos verificando”, “A próxima atualização será às...”, “Seu caso foi registrado”, “Esta é a orientação disponível agora”. Evite frases como “não posso fazer nada”, “a culpa não é nossa” ou “aguarde sem previsão” quando houver possibilidade de explicar o fluxo.

Controle emocional
O agente não deve absorver a agressividade do momento. Deve manter postura profissional, voz calma e foco em solução. Se houver ameaça, discriminação, risco físico ou descontrole, a situação deve ser escalonada conforme procedimento de segurança.

Registro do atendimento
Contatos, promessas, recusas, assistência oferecida e orientações relevantes devem ser registradas. Isso evita que o passageiro precise repetir tudo e protege a continuidade do atendimento.

Mensagem principal
Atendimento humanizado em crise não é ceder a tudo. É tratar pessoas com dignidade enquanto a operação busca a solução possível.

Continuidade operacional

Objetivo da trilha
Organizar recursos e prioridades para manter ou restabelecer serviços essenciais durante a crise.

Continuidade operacional é a capacidade de manter funções críticas funcionando, mesmo com restrição. Em aeroporto, algumas atividades não podem simplesmente parar: segurança, atendimento essencial, embarque, desembarque, bagagem, assistência especial, comunicação, suporte a passageiros e coordenação com áreas operacionais.

Serviços críticos
- Segurança de pessoas e aeronaves.
- Comunicação entre áreas.
- Atendimento a passageiros vulneráveis.
- Controle de filas e fluxo.
- Gestão de bagagens e itens críticos.
- Registro de ocorrências.
- Reacomodação ou orientação quando aplicável.
- Atualização de voos e portões.

Priorização
Quando não há recurso para tudo, a equipe deve priorizar risco e impacto. Um passageiro com assistência especial, uma esteira parada em horário de pico, um voo com conexão crítica ou uma área bloqueada podem exigir ação antes de tarefas administrativas comuns.

Planos alternativos
A continuidade depende de alternativas: outro balcão, outra esteira, comunicação manual, reforço de equipe, redistribuição de filas, acionamento de suporte, separação de casos críticos e atualização frequente. Alternativa deve ser simples, conhecida e autorizada.

Passagem de turno
Crises frequentemente atravessam turnos. A passagem deve informar: situação atual, decisões tomadas, pendências, responsáveis, próximos horários, passageiros críticos, documentos e contatos. Sem passagem adequada, a operação recomeça do zero.

Retomada
Encerrar a crise não é apenas “voltar ao normal”. É confirmar que pendências foram tratadas, passageiros orientados, registros feitos, áreas liberadas, indicadores atualizados e lições coletadas.

Mensagem principal
Continuidade operacional é manter o essencial sob controle. O objetivo é reduzir dano, proteger pessoas e recuperar previsibilidade.

Exercícios e lições aprendidas

Objetivo da trilha
Usar simulações, treinamentos e revisão pós-evento para fortalecer a resposta da equipe.

A resposta a crises melhora quando a equipe treina antes. Exercícios permitem testar comunicação, papéis, recursos, tempo de resposta, fluxo de escalonamento e registro. O objetivo não é encenar perfeição; é encontrar fragilidades enquanto ainda há tempo de corrigir.

Tipos de exercício
- Discussão de cenário em sala.
- Simulação de comunicação interna.
- Exercício de atendimento a passageiros afetados.
- Teste de contato e escalonamento.
- Simulação de indisponibilidade de sistema.
- Exercício integrado com várias áreas.

Como conduzir
Um bom exercício define cenário, objetivos, participantes, tempo, papéis, critérios de avaliação e forma de registro. Após o exercício, a equipe deve realizar debriefing para comparar o que era esperado com o que aconteceu.

Lições aprendidas
Depois de uma crise real ou simulada, registre: o que funcionou, o que atrasou, onde houve conflito de informação, quais recursos faltaram, quais decisões foram difíceis, que comunicação falhou e qual ação corretiva será implementada.

Plano de ação pós-evento
Cada lição precisa virar ação. Ação sem responsável e prazo vira intenção. O plano deve indicar responsável, prazo, evidência de conclusão e forma de verificar se a melhoria funcionou.

Cultura justa
A revisão deve buscar causas e melhoria, não apenas culpados. O reporte de erro, quase falha e vulnerabilidade precisa ser tratado como fonte de prevenção. Isso fortalece segurança operacional e maturidade da equipe.

Mensagem principal
A crise revela o preparo da operação. Treinamento, simulação e debriefing transformam reação em competência.',
    252
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
    'qualidade-indicadores-operacionais',
    'Qualidade e Indicadores Operacionais',
    'Métricas e melhoria',
    'gestão operacional',
    'Intermediário',
    '1h 20min',
    '#047857',
    'Construção de indicadores, coleta de dados, dashboards, SLA, análise de causa, planos de ação e melhoria contínua na operação aeroportuária.',
    '[{"title":"Conceito de qualidade operacional","type":"Aula","duration":"12 min","content":"Qualidade operacional é a capacidade de entregar o serviço combinado com segurança, regularidade, rastreabilidade e melhoria contínua. Na aviação, qualidade não é apenas satisfação do passageiro; também envolve cumprimento de padrões, redução de desvios, confiabilidade de dados e resposta rápida a falhas."},{"title":"Construção de indicadores","type":"Procedimento","duration":"14 min","content":"Um indicador precisa ter nome, objetivo, meta, unidade de medida, fonte de dados, fórmula, periodicidade de medição e responsável. Indicadores mal definidos criam interpretações diferentes e dificultam a tomada de decisão."},{"title":"Coleta e confiabilidade dos dados","type":"Prática guiada","duration":"13 min","content":"Dados operacionais precisam ser coletados, limpos, validados, integrados e padronizados. A confiabilidade depende de registro no momento certo, fonte conhecida, critérios claros e rastreabilidade para explicar como o número foi calculado."},{"title":"Análise de causa e tendência","type":"Aula","duration":"14 min","content":"A análise de indicadores deve procurar padrões, tendência, causa provável e risco emergente. Um número isolado informa pouco; a comparação por turno, voo, área, estação, processo e período mostra onde agir."},{"title":"Dashboards e tomada de decisão","type":"Simulação","duration":"13 min","content":"Dashboards devem transformar dados em decisão. Um bom painel mostra prioridade, meta, status, tendência, responsável e ação necessária. Visual bonito sem leitura operacional não melhora a qualidade."},{"title":"Plano de ação e melhoria contínua","type":"Checklist","duration":"14 min","content":"Quando um indicador mostra desvio, a equipe deve definir causa, ação, responsável, prazo e forma de verificação. A melhoria contínua fecha o ciclo entre medir, analisar, agir e revisar."}]'::jsonb,
    '["Montagem de KPI operacional","Análise de SLA","Plano de ação por causa raiz"]'::jsonb,
    '[{"question":"Um indicador operacional bem definido deve conter:","options":["Nome, objetivo, meta, fonte, fórmula, periodicidade e responsável","Apenas um gráfico colorido","Somente opinião da equipe","Nenhuma meta"],"correct":0},{"question":"Qual é a finalidade de um SLA?","options":["Definir nível de serviço esperado e medir cumprimento","Eliminar registros","Substituir procedimentos","Criar metas sem acompanhamento"],"correct":0},{"question":"Dados confiáveis dependem principalmente de:","options":["Fonte clara, critério padronizado e rastreabilidade","Memória do turno","Estimativa sem registro","Planilha sem data"],"correct":0},{"question":"Quando um indicador piora, a equipe deve:","options":["Analisar causa, definir ação e acompanhar resultado","Esconder o dado","Trocar o nome do indicador","Ignorar até o mês seguinte"],"correct":0},{"question":"Dashboard operacional deve ajudar a:","options":["Priorizar decisões e acompanhar desvios","Decorar a tela","Substituir supervisores","Evitar análise"],"correct":0},{"question":"A fórmula de um indicador é importante porque:","options":["Garante cálculo consistente entre períodos e áreas","Permite cada pessoa calcular de um jeito","Não influencia o resultado","Serve apenas para auditoria financeira"],"correct":0},{"question":"Análise de tendência compara:","options":["Resultados ao longo do tempo para identificar padrão ou mudança","Apenas um voo isolado","Somente nomes de passageiros","A cor das malas"],"correct":0},{"question":"Um plano de ação eficaz precisa definir:","options":["Ação, responsável, prazo e forma de verificação","Somente intenção","Frase genérica sem dono","Apenas uma reunião"],"correct":0},{"question":"A qualidade dos dados inclui:","options":["Coleta, validação, padronização, integridade e disponibilidade","Apenas digitação rápida","Dados sem origem","Exclusão de registros ruins"],"correct":0},{"question":"Indicadores de segurança operacional podem apoiar:","options":["Identificação de perigos, tendências e riscos emergentes","Apenas cobrança comercial","Somente decoração de relatórios","Eliminação de treinamento"],"correct":0},{"question":"Meta operacional deve ser:","options":["Clara, mensurável e compatível com o processo","Secreta e indefinida","Alterada após cada erro para parecer boa","Sempre impossível"],"correct":0},{"question":"A causa raiz é:","options":["Fator que originou ou contribuiu para o desvio","O primeiro nome citado","A última pessoa do processo","Uma desculpa operacional"],"correct":0},{"question":"Periodicidade de medição indica:","options":["Com que frequência o indicador será apurado","Quem será punido","Qual cor usar no painel","O nome da planilha"],"correct":0},{"question":"Melhoria contínua significa:","options":["Medir, analisar, agir, verificar e ajustar o processo","Criar relatório sem ação","Trocar equipe a cada desvio","Aceitar erros repetidos"],"correct":0},{"question":"Um indicador sem responsável tende a:","options":["Não gerar ação prática quando houver desvio","Melhorar automaticamente","Eliminar risco","Ser mais confiável"],"correct":0}]'::jsonb,
    '',
    'Conceito de qualidade operacional

Objetivo da trilha
Compreender qualidade como entrega consistente, segura, rastreável e orientada por melhoria contínua.

Qualidade operacional é a capacidade de executar processos de forma padronizada e confiável, entregando o nível de serviço esperado com segurança, clareza e controle. Em aeroporto, qualidade aparece no atendimento, check-in, portão, rampa, bagagem, restituição, comunicação, registro e solução de irregularidades.

Qualidade não é apenas simpatia
Um atendimento cordial é importante, mas não substitui precisão operacional. A qualidade exige que dados estejam corretos, prazos sejam monitorados, procedimentos sejam cumpridos e desvios sejam tratados com ação. Um processo pode parecer agradável e ainda assim falhar se gera extravio, atraso, registro incompleto ou informação incorreta.

Dimensões de qualidade
- Segurança: evitar danos, riscos e violações de procedimento.
- Pontualidade: cumprir tempos e SLAs.
- Confiabilidade: entregar o que foi prometido.
- Rastreabilidade: registrar ações e decisões.
- Clareza: comunicar sem ambiguidade.
- Melhoria: aprender com desvios.

Indicadores e gestão
A qualidade precisa ser medida. Sem indicador, a equipe depende de percepção. Indicadores mostram se o processo está melhorando, piorando ou oscilando. Eles também ajudam a priorizar recursos e justificar ações corretivas.

Exemplo operacional
Se a restituição de bagagem atrasa com frequência em determinado horário, a percepção pode culpar a equipe. Um indicador bem construído pode mostrar que o gargalo está em posição remota, falta de equipamento, conflito de esteira ou dimensionamento de pessoal.

Mensagem principal
Qualidade operacional é transformar rotina em padrão confiável. O passageiro percebe o resultado, mas a gestão precisa enxergar o processo.

Construção de indicadores

Objetivo da trilha
Aprender a criar indicadores úteis, mensuráveis e conectados à decisão operacional.

Um indicador operacional deve responder a uma pergunta clara. Exemplo: “Estamos entregando bagagem dentro do tempo esperado?”, “Quantos processos foram abertos com dados incompletos?”, “Quais causas geram mais atrasos?”, “Qual etapa do atendimento concentra desvios?”. Se o indicador não ajuda a decidir, ele vira número decorativo.

Elementos de um indicador
- Nome do indicador.
- Objetivo ou pergunta que ele responde.
- Meta ou limite aceitável.
- Natureza do indicador: segurança, qualidade, prazo, produtividade ou satisfação.
- Unidade de medida: percentual, quantidade, minutos, taxa ou índice.
- Fonte dos dados.
- Fórmula de cálculo.
- Periodicidade de medição.
- Periodicidade de revisão.
- Responsável pelo acompanhamento.

Exemplo de indicador
Nome: Voos com restituição dentro do SLA.
Objetivo: medir cumprimento do tempo de entrega de bagagem.
Fórmula: quantidade de voos dentro do SLA dividido pelo total de voos avaliados.
Unidade: percentual.
Fonte: registros operacionais de horários.
Periodicidade: diária, semanal e mensal.
Responsável: supervisão operacional.

Meta
A meta precisa ser realista e desafiadora. Meta sem base histórica pode ser injusta; meta muito fácil não promove melhoria. Quando o processo muda, a meta pode precisar de revisão documentada.

Cuidado com indicador mal definido
Se cada área mede “atraso” de forma diferente, o indicador perde valor. Definições devem deixar claro início, fim, exceções e fonte oficial.

Mensagem principal
Indicador bom é simples, consistente e acionável. Ele mostra onde agir e como saber se a ação funcionou.

Coleta e confiabilidade dos dados

Objetivo da trilha
Garantir que os dados usados em indicadores sejam íntegros, rastreáveis e comparáveis.

Dados operacionais passam por várias etapas: coleta, limpeza, validação, integração, padronização e preparação para análise. Se qualquer etapa falhar, o dashboard pode mostrar uma realidade falsa. Uma decisão baseada em dado ruim pode piorar o processo.

Coleta
A coleta deve ocorrer perto do fato. Horários, status, ocorrências, fotos, processos, contatos e encerramentos devem ser registrados no momento correto. Registro feito depois, por memória, tende a erro.

Validação
Validar é conferir se o dado faz sentido. Um voo não pode ter entrega final antes da chegada. Um processo não deve aparecer como concluído sem ação final. Uma ocorrência não deve ter campo obrigatório em branco. A validação reduz distorções.

Padronização
Use nomes, códigos, horários e categorias de forma padronizada. Se uma equipe registra “atraso bagagem”, outra “bag atrasada” e outra “demora esteira”, a análise fica fragmentada. Padronizar aumenta comparabilidade.

Rastreabilidade
Todo dado importante deve poder ser explicado: de onde veio, quem registrou, quando foi alterado e qual regra foi usada. Rastreabilidade protege a equipe e permite auditoria.

Qualidade e confidencialidade
Dados podem conter informações pessoais e operacionais sensíveis. A análise deve respeitar acesso autorizado, necessidade operacional e proteção de dados. Nem todo painel deve ser aberto para todos.

Mensagem principal
Indicador confiável começa no registro. Não existe dashboard bom com dado fraco.

Análise de causa e tendência

Objetivo da trilha
Interpretar indicadores para descobrir padrões, causas prováveis e riscos emergentes.

Analisar indicador não é apenas dizer se está verde ou vermelho. É entender o motivo do resultado. Um desvio pode vir de falha de processo, equipamento, treinamento, comunicação, sistema, clima, volume, conexão crítica, fornecedor ou regra mal aplicada.

Tipos de análise
- Descritiva: o que aconteceu?
- Diagnóstica: por que aconteceu?
- Preditiva: o que pode acontecer se a tendência continuar?
- Prescritiva: qual ação deve ser tomada?

Tendência
Tendência mostra comportamento ao longo do tempo. Um mês ruim pode ser exceção; três meses de piora indicam risco. A análise deve comparar períodos, turnos, áreas, voos, rotas e tipos de ocorrência.

Pareto
O Pareto ajuda a identificar poucas causas que geram grande parte dos problemas. Se 70% dos atrasos de restituição estão em voos remotos, o plano de ação deve focar nesse fluxo antes de tentar corrigir tudo ao mesmo tempo.

Causa raiz
Causa raiz é o fator que originou ou contribuiu de forma relevante para o desvio. Cuidado para não parar no sintoma. “Bagagem atrasou” é efeito. A causa pode ser falta de trator, esteira indisponível, porão liberado tarde, documentação incompleta ou prioridade mal definida.

Perguntas úteis
O desvio é recorrente? Em qual turno? Com qual rota? Qual etapa demora mais? Houve mudança de processo? A equipe foi treinada? O dado é confiável? A meta é adequada?

Mensagem principal
Análise boa transforma número em ação. O indicador mostra o sinal; a investigação mostra o caminho.

Dashboards e tomada de decisão

Objetivo da trilha
Construir painéis que apoiem decisões rápidas, claras e baseadas em prioridade.

Dashboard operacional deve facilitar leitura. Ele precisa mostrar o que está acontecendo, o que exige atenção e qual ação deve ser tomada. Painel bonito, mas sem decisão, não melhora a operação.

Elementos de um bom dashboard
- Indicador principal.
- Meta ou limite.
- Status atual.
- Tendência.
- Comparativo com período anterior.
- Segmentação por área, turno, rota ou processo.
- Alertas de desvio.
- Responsável ou próximo passo.

Cores e contraste
Cores devem apoiar interpretação: verde para dentro do esperado, amarelo para atenção, vermelho para desvio crítico. Mas a cor não deve ser a única informação. Texto, números e legenda precisam deixar o status compreensível.

Níveis de painel
Painel executivo: mostra visão geral, tendência e riscos principais.
Painel operacional: mostra filas, voos, pendências, SLA, alertas e responsáveis.
Painel analítico: permite investigar causa, histórico e detalhe.

Tomada de decisão
O dashboard deve responder: qual problema exige ação agora? Quem é responsável? Qual impacto? Há tendência de piora? A ação anterior funcionou? O risco está controlado?

Cuidado com excesso
Muitos indicadores na mesma tela confundem. É melhor ter poucos indicadores bem escolhidos, com filtros claros, do que dezenas de números sem prioridade.

Mensagem principal
Dashboard é instrumento de decisão. Se ninguém age ao olhar o painel, ele precisa ser redesenhado.

Plano de ação e melhoria contínua

Objetivo da trilha
Transformar desvios identificados em ações corretivas acompanhadas até resultado comprovado.

Quando um indicador aponta falha, o próximo passo é agir. A ação deve ser específica, responsável e verificável. Frases como “melhorar comunicação” ou “reforçar atenção” são insuficientes se não indicam o que muda na prática.

Estrutura do plano de ação
- Desvio identificado.
- Causa provável ou causa raiz.
- Ação corretiva ou preventiva.
- Responsável.
- Prazo.
- Recursos necessários.
- Evidência de conclusão.
- Indicador de acompanhamento.
- Data de revisão.

Exemplo prático
Desvio: aumento de processos de bagagem com campo obrigatório incompleto.
Causa provável: falta de checklist no atendimento.
Ação: inserir checklist antes de salvar o processo e treinar equipe.
Responsável: supervisão.
Prazo: 10 dias.
Verificação: percentual de processos completos por semana.

Ação corretiva e preventiva
Ação corretiva trata desvio que já ocorreu. Ação preventiva reduz chance de repetição. Em operações maduras, a equipe usa indicadores para agir antes que a falha vire crise.

Revisão de eficácia
Concluir uma ação não significa que ela funcionou. É preciso medir depois. Se o indicador não melhora, a causa pode estar errada, a ação pode ser fraca ou a execução pode não ter ocorrido como planejado.

Cultura de melhoria
A melhoria contínua depende de dados, disciplina e abertura para aprender. O objetivo não é criar culpa, mas reduzir risco, aumentar eficiência e melhorar experiência do passageiro.

Mensagem principal
Medição sem ação é relatório. Ação sem verificação é tentativa. Melhoria contínua exige fechar o ciclo.',
    253
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
    'introducao-operacao-rampa',
    'Introdução à Operação de Rampa',
    'Airside e turnaround',
    'operação aeroportuária',
    'Básico',
    '1h 30min',
    '#0f766e',
    'Fundamentos de pátio, segurança no airside, GSE, zonas de risco, turnaround, comunicação, FOD, clima adverso e interface com bagagem.',
    '[{"title":"Ambiente de rampa","type":"Aula","duration":"14 min","content":"A rampa é a área operacional onde aeronaves, veículos, equipamentos, equipes e cargas se encontram em movimento. É um ambiente de risco elevado que exige atenção permanente, comunicação clara e cumprimento rigoroso de procedimentos."},{"title":"Segurança no pátio","type":"Procedimento","duration":"16 min","content":"Segurança no pátio envolve controle de velocidade, uso correto de EPIs, respeito às áreas demarcadas, distância segura da aeronave, atenção a motores, hélices, jato de exaustão, ingestão, sinalização e circulação autorizada."},{"title":"GSE e equipamentos","type":"Prática guiada","duration":"14 min","content":"Equipamentos de apoio em solo devem ser inspecionados, posicionados e operados por pessoas autorizadas. Carrinhos, tratores, esteiras, escadas, GPUs e dollies podem causar danos se usados sem checklist, calço, freio, distância e comunicação adequados."},{"title":"Turnaround da aeronave","type":"Simulação","duration":"16 min","content":"Turnaround é o conjunto de atividades entre chegada e próxima partida da aeronave. Inclui estacionamento, desembarque, descarregamento, abastecimento quando aplicável, limpeza, catering, carregamento, embarque e despacho, sempre com coordenação entre áreas."},{"title":"Bagagem, carga e reconciliação","type":"Aula","duration":"15 min","content":"A interface com bagagem exige leitura correta, segregação, carregamento conforme instrução, atenção a conexões, itens especiais e reconciliação. Uma falha de etiqueta, porão, destino ou prioridade pode gerar extravio ou atraso."},{"title":"FOD, clima e reporte","type":"Checklist","duration":"15 min","content":"FOD, chuva, vento, raios, baixa visibilidade e falhas de equipamento exigem prevenção e reporte. Qualquer quase falha, dano, objeto solto ou condição insegura deve ser comunicado e registrado para proteger pessoas, aeronaves e operação."}]'::jsonb,
    '["Checklist de segurança de rampa","Fluxo de turnaround","Reporte de FOD e quase falha"]'::jsonb,
    '[{"question":"A operação de rampa ocorre principalmente:","options":["No pátio, próximo a aeronaves, veículos e equipamentos","Somente dentro da loja do aeroporto","Apenas na sala de embarque","Exclusivamente no escritório"],"correct":0},{"question":"Por que a rampa é considerada área de alto risco?","options":["Porque há aeronaves, veículos, equipamentos e pessoas em movimento","Porque não possui regras","Porque não existe supervisão","Porque passageiros circulam livremente"],"correct":0},{"question":"GSE significa:","options":["Equipamentos de apoio em solo","Grupo de serviço externo","Gestão simples de embarque","Guia de segurança eletrônica"],"correct":0},{"question":"Antes de operar equipamento de solo, o colaborador deve:","options":["Estar autorizado e realizar verificações aplicáveis","Usar sem treinamento se estiver com pressa","Pedir ao passageiro para ajudar","Ignorar freios e calços"],"correct":0},{"question":"Turnaround é:","options":["Conjunto de atividades entre chegada e próxima partida da aeronave","Somente carregamento de bagagem","Apenas embarque de passageiros","Tempo de voo em cruzeiro"],"correct":0},{"question":"FOD é perigoso porque:","options":["Objetos soltos podem danificar aeronaves, motores, pneus ou equipamentos","Aumenta conforto do passageiro","Substitui inspeção de rampa","É apenas sujeira comum sem risco"],"correct":0},{"question":"Uma condição insegura na rampa deve ser:","options":["Comunicada e registrada conforme procedimento","Ignorada até causar dano","Ocultada para evitar atraso","Resolvida apenas por mensagem informal"],"correct":0},{"question":"Na interface com bagagem, erro de porão ou destino pode gerar:","options":["Extravio, atraso ou necessidade de correção operacional","Melhoria automática do SLA","Nenhum impacto","Apenas mudança estética"],"correct":0},{"question":"Distância segura da aeronave é importante para:","options":["Evitar colisão, ingestão, jato de exaustão e acidentes pessoais","Permitir trânsito livre sem controle","Reduzir necessidade de EPI","Aumentar velocidade no pátio"],"correct":0},{"question":"Durante clima adverso, a equipe deve:","options":["Seguir orientação operacional, reduzir exposição e reportar riscos","Manter tudo igual independentemente do risco","Correr no pátio","Ignorar raios e baixa visibilidade"],"correct":0},{"question":"A comunicação no turnaround deve ser:","options":["Clara, confirmada e coordenada entre áreas","Feita apenas por suposição","Desnecessária se todos têm experiência","Reservada ao fim do voo"],"correct":0},{"question":"EPI na rampa serve para:","options":["Reduzir exposição a riscos e aumentar visibilidade e proteção","Substituir treinamento","Permitir entrada em qualquer área sem autorização","Apenas identificar uniforme"],"correct":0},{"question":"Quase falha deve ser reportada porque:","options":["Permite prevenir acidente antes que ocorra dano","Só importa se houver lesão","Não tem valor operacional","Serve para ocultar erro"],"correct":0},{"question":"A reconciliação de bagagem ajuda a garantir:","options":["Que volumes carregados correspondam ao voo e às autorizações aplicáveis","Que qualquer mala possa ser carregada","Que etiquetas sejam ignoradas","Que a carga seja decidida no portão"],"correct":0},{"question":"O melhor comportamento na rampa é:","options":["Atenção situacional, disciplina de procedimento e reporte de risco","Pressa sem checagem","Improvisação constante","Uso de atalhos sem autorização"],"correct":0}]'::jsonb,
    '',
    'Ambiente de rampa

Objetivo da trilha
Conhecer o ambiente de rampa, seus riscos e a importância da coordenação entre equipes.

A rampa é a área operacional próxima às aeronaves onde ocorrem chegada, estacionamento, atendimento, descarregamento, carregamento, abastecimento quando aplicável, limpeza, embarque, despacho e saída. É um ambiente dinâmico, com pessoas, veículos, equipamentos, aeronaves e cargas circulando ao mesmo tempo.

Características da rampa
- Alto volume de movimentação.
- Ruído intenso.
- Áreas demarcadas e restritas.
- Dependência de comunicação visual, rádio e procedimentos.
- Necessidade de autorização e treinamento.
- Risco de colisão, queda, atropelamento, ingestão por motor e dano à aeronave.

Consciência situacional
Consciência situacional é perceber o que acontece ao redor, entender o risco e antecipar consequências. Na rampa, o colaborador deve observar aeronaves em movimento, motores, cones, veículos, pedestres, equipamentos, clima e sinalizações.

Entrada e circulação
Ninguém deve circular em área restrita sem autorização, credencial, treinamento e necessidade operacional. Caminhar fora das rotas, cruzar área de manobra sem atenção ou ficar próximo à aeronave sem função aumenta o risco.

Interface entre áreas
A rampa depende de atendimento, portão, manutenção, limpeza, abastecimento, bagagem, carga, segurança e coordenação. Uma informação errada em qualquer área pode atrasar o turnaround ou gerar falha de segurança.

Mensagem principal
A rampa não perdoa distração. Segurança começa com atenção, autorização e respeito ao procedimento.

Segurança no pátio

Objetivo da trilha
Aplicar práticas essenciais de segurança para reduzir risco de acidente e dano operacional.

Segurança no pátio envolve cumprir regras de circulação, usar EPIs, respeitar marcações, manter distância segura da aeronave, controlar velocidade, reportar riscos e nunca improvisar fora do procedimento autorizado. A rotina pode parecer repetitiva, mas o risco permanece presente em cada operação.

Riscos principais
- Colisão entre veículos e aeronaves.
- Atropelamento de pessoas.
- Queda de bagagens ou equipamentos.
- Jato de exaustão.
- Ingestão por motor.
- Hélices e partes móveis.
- Escorregões em chuva ou óleo.
- FOD na área de movimentação.
- Equipamento sem freio ou mal posicionado.

EPIs
Colete refletivo, calçado adequado, proteção auditiva e outros EPIs definidos localmente reduzem exposição ao risco. EPI não substitui procedimento, mas é barreira importante de segurança.

Zonas de risco da aeronave
Motores, trem de pouso, portas, porões, áreas de abastecimento, ponta de asa e cones de segurança exigem atenção especial. A aproximação deve ocorrer apenas quando autorizado e conforme procedimento.

Velocidade e prioridade
Veículos devem obedecer limites de velocidade e rotas autorizadas. A aeronave sempre exige respeito prioritário. Pressa operacional não justifica manobra insegura.

Mensagem principal
Segurança de rampa depende de disciplina. Atalho pode parecer rápido, mas aumenta risco para pessoas e aeronaves.

GSE e equipamentos

Objetivo da trilha
Entender o uso seguro de equipamentos de apoio em solo e sua relação com a proteção da aeronave e da equipe.

GSE, ou Ground Support Equipment, são equipamentos de apoio em solo usados para atender aeronaves e movimentar bagagens, carga e serviços. Incluem tratores, carrinhos, dollies, esteiras, escadas, rebocadores, GPUs, cones, calços e outros recursos definidos pela operação.

Princípios de uso
- Operar apenas se treinado e autorizado.
- Fazer inspeção visual antes do uso.
- Verificar freios, luzes, pneus, acoplamentos e condição geral.
- Respeitar velocidade e rotas.
- Posicionar equipamento com distância segura.
- Usar calços e freios quando exigido.
- Nunca abandonar equipamento em área insegura.

Aproximação da aeronave
A aproximação deve ser lenta, alinhada e autorizada. Equipamento mal posicionado pode danificar fuselagem, portas, porões, sensores, antenas ou motores. Pequeno contato pode gerar atraso, inspeção e custo elevado.

Esteiras e bagagens
Esteiras devem ser posicionadas com cuidado, sem pressionar a aeronave. Bagagens devem ser movimentadas sem arremesso e sem criar risco de queda. O operador deve observar mãos, pés, altura da esteira e estabilidade dos volumes.

Equipamento defeituoso
Equipamento com falha deve ser retirado de uso e reportado. Usar equipamento defeituoso para “não atrasar” pode causar acidente, dano à aeronave ou lesão.

Mensagem principal
GSE ajuda a operação, mas também é fonte de risco. Equipamento seguro depende de inspeção, autorização e posicionamento correto.

Turnaround da aeronave

Objetivo da trilha
Compreender o fluxo de atividades entre chegada e partida e como a coordenação reduz atraso e risco.

Turnaround é o período entre a chegada da aeronave ao estacionamento e sua próxima saída. Nesse intervalo, várias equipes trabalham simultaneamente: desembarque, bagagem, carga, limpeza, abastecimento, manutenção, catering, embarque, documentação e despacho.

Etapas comuns
- Chegada e estacionamento.
- Calçamento e sinalização.
- Liberação segura para aproximação de equipamentos.
- Desembarque de passageiros.
- Abertura de porões.
- Descarregamento de bagagem e carga.
- Serviços de limpeza e abastecimento quando aplicável.
- Carregamento do próximo voo.
- Embarque.
- Fechamento de portas e porões.
- Retirada de equipamentos.
- Pushback ou saída.

Coordenação
Cada etapa depende de outra. Se a bagagem não chega, o embarque pode atrasar. Se equipamento fica mal posicionado, outra equipe não acessa a aeronave. Se a comunicação falha, o porão pode ser fechado com pendência.

Sequenciamento seguro
Atividades simultâneas exigem controle. Nem todo equipamento pode se aproximar ao mesmo tempo. A equipe deve respeitar sequência, distância e autorização para evitar colisão e conflito.

Pressão de tempo
Turnaround costuma ter meta de pontualidade. Mesmo assim, segurança não pode ser sacrificada. Atraso é problema operacional; acidente é problema crítico.

Mensagem principal
Turnaround eficiente é coordenação segura. O voo sai melhor quando cada área cumpre sua etapa no tempo certo e comunica desvios cedo.

Bagagem, carga e reconciliação

Objetivo da trilha
Entender a responsabilidade da rampa no fluxo de bagagens, cargas e conferências operacionais.

A interface da rampa com bagagem é essencial para evitar extravio, dano, atraso e carregamento incorreto. O volume que chega ao porão deve estar compatível com voo, destino, conexão, prioridade e instruções operacionais.

Pontos críticos da bagagem
- Conferir etiqueta e destino.
- Separar conexões e prioridades.
- Proteger itens frágeis e especiais.
- Evitar arremesso e esmagamento.
- Carregar no porão correto.
- Respeitar instruções de carregamento.
- Reportar volume sem etiqueta, danificado ou suspeito.

Reconciliação
Reconciliação é a conferência entre volumes aceitos, autorizados e carregados. Ela ajuda a garantir que bagagens estejam associadas ao passageiro e ao voo correto, conforme regras e sistemas aplicáveis. Falha nessa etapa pode gerar impacto de segurança e serviço.

Carga e itens especiais
Alguns volumes exigem cuidado adicional: cadeira de rodas, equipamentos esportivos, instrumentos, carrinhos infantis, animais quando aplicável, cargas frágeis e itens com restrição. O manuseio deve seguir procedimento e comunicação entre áreas.

Danos por manuseio
Danos ocorrem por queda, arremesso, arraste, esmagamento, exposição inadequada, empilhamento errado ou uso incorreto de equipamento. A prevenção começa no treinamento e continua no acompanhamento da supervisão.

Mensagem principal
Bagagem é compromisso com o passageiro e com a segurança. A rampa protege a operação quando lê, separa, carrega e reporta corretamente.

FOD, clima e reporte

Objetivo da trilha
Reconhecer riscos ambientais e reportar condições inseguras antes que se transformem em acidente ou dano.

FOD significa objeto estranho que pode causar dano. Pode ser parafuso, plástico, pedra, etiqueta, ferramenta, pedaço de metal, lacre, papel rígido ou qualquer material solto em área operacional. Um FOD pode danificar pneu, motor, fuselagem ou equipamento.

Prevenção de FOD
- Inspecionar área antes e depois da operação.
- Recolher objetos soltos quando seguro e autorizado.
- Manter ferramentas controladas.
- Evitar deixar material em carrinhos e dollies.
- Reportar áreas contaminadas.
- Participar de campanhas de limpeza operacional.

Clima adverso
Chuva, vento forte, raios, calor intenso, baixa visibilidade e piso escorregadio alteram o risco. A equipe deve seguir orientações locais, reduzir exposição, ajustar velocidade, proteger bagagens e interromper atividade quando o procedimento exigir.

Quase falha
Quase falha é evento que não gerou dano, mas poderia gerar. Exemplo: veículo freia a tempo antes de atingir equipamento; bagagem cai perto de colaborador; objeto é encontrado próximo ao motor. Reportar quase falha permite prevenir acidente real.

Reporte
O reporte deve ser objetivo: local, horário, risco, ação tomada, pessoas envolvidas quando aplicável, equipamento e evidência. O objetivo é permitir correção e aprendizado.

Cultura justa
Reportar risco não deve ser visto como problema. É sinal de maturidade operacional. A equipe que reporta aprende mais rápido e protege melhor pessoas, aeronaves e passageiros.

Mensagem principal
FOD, clima e quase falhas precisam de atenção antes do dano. Segurança operacional depende de observar, agir e registrar.',
    254
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
    '[{"title":"Para que serve o chart IATA","type":"Aula","duration":"10 min","content":"O chart de bagagem ajuda o agente a transformar a aparência da mala em códigos padronizados. Essa padronização melhora o match entre AHL e OHD, reduz erro de descrição e facilita comunicação entre aeroportos."},{"title":"Cores da bagagem","type":"Consulta guiada","duration":"12 min","content":"A primeira leitura é a cor predominante. A referência IATA atual apresenta códigos como BK para preto, BU para azul, RD para vermelho, WT para branco/transparente, GY para cinza/prata/alumínio, PU para roxo/violeta/lilás, YW para amarelo, BE para bege/creme/marfim, BN para marrom/tan/taupe/bronze/cobre, GN para verde/oliva/jade, MC para duas ou mais cores sólidas e PC para estampa ou padrão."},{"title":"Tipo do volume","type":"Prática guiada","duration":"16 min","content":"Depois da cor, o agente escolhe o tipo visual do volume. A parte superior do chart mostra luggage/bags, com exemplos de malas rígidas, malas flexíveis, mochilas, sacolas, bolsas, caixas e formatos especiais. A escolha deve representar o formato real mais próximo, não a marca ou o conteúdo."},{"title":"Elementos descritivos","type":"Aula prática","duration":"14 min","content":"Os elementos descritivos complementam cor e tipo. Eles indicam características visíveis como alça, rodinhas, cadeado, etiqueta, zíper, cinta, bolso externo, dano aparente, material, formato ou outra característica que ajude a diferenciar volumes semelhantes."},{"title":"Artigos diversos","type":"Consulta","duration":"12 min","content":"A segunda parte do chart reúne miscellaneous articles, usados quando o item não é uma mala tradicional. A imagem inclui exemplos como carrinho, cadeira, equipamento esportivo, instrumento, pacote, caixa, equipamento infantil, itens dobráveis, objetos volumosos e outros artigos especiais."},{"title":"Montagem do código no atendimento","type":"Simulação","duration":"16 min","content":"No WorldTracer, a descrição deve ser objetiva: identificar cor, tipo e elementos visíveis; registrar conteúdo em inglês quando aplicável; evitar termos genéricos; e revisar se a escolha ajudaria outro aeroporto a reconhecer a mesma bagagem."}]'::jsonb,
    '[{"label":"Laboratório AHL Web","href":"ahl.html"},{"label":"Laboratório OHD Web","href":"ohd.html"},{"label":"Máscara AHL WorldTracer","href":"worldtracer/ahl.html"},{"label":"Máscara OHD WorldTracer","href":"worldtracer/ohd.html"}]'::jsonb,
    '[{"question":"Qual é o objetivo principal do Baggage Identification Chart?","options":["Padronizar a descrição visual da bagagem para facilitar identificação e match","Substituir a etiqueta da bagagem","Definir indenização ao passageiro","Informar peso permitido no voo"],"correct":0},{"question":"Na leitura do chart, a cor deve representar:","options":["A cor predominante da bagagem","A cor preferida do passageiro","A cor da etiqueta","A cor do uniforme do agente"],"correct":0},{"question":"O código BK representa normalmente:","options":["Preto","Azul","Bege","Marrom"],"correct":0},{"question":"O código RD representa:","options":["Vermelho","Roxo","Cinza","Verde"],"correct":0},{"question":"O código MC deve ser usado quando a bagagem é:","options":["Multicolorida","Metálica obrigatoriamente","Muito comum","Sem identificação"],"correct":0},{"question":"Depois de identificar a cor, o agente deve escolher:","options":["O tipo visual do volume mais parecido com a bagagem","O preço da bagagem","A companhia que fabricou a mala","O nome do passageiro"],"correct":0},{"question":"A escolha do tipo da bagagem deve considerar principalmente:","options":["Formato e aparência externa","Conteúdo declarado","Valor estimado","Destino do passageiro"],"correct":0},{"question":"Elementos descritivos servem para:","options":["Diferenciar volumes parecidos por características visíveis","Apagar a necessidade da cor","Substituir o número da etiqueta","Criar categoria de conteúdo"],"correct":0},{"question":"Exemplo de elemento descritivo útil é:","options":["Rodinhas, alça, bolso externo, cinta ou zíper aparente","Nome do agente","Horário do almoço","Número do balcão"],"correct":0},{"question":"Miscellaneous articles são usados para:","options":["Itens que não se encaixam como mala tradicional","Apenas malas pretas","Somente bagagem extraviada internacional","Excluir o registro do WorldTracer"],"correct":0},{"question":"Ao registrar AHL ou OHD, uma descrição boa deve ser:","options":["Objetiva, padronizada e útil para outro aeroporto reconhecer o volume","Longa, subjetiva e sem códigos","Baseada apenas no conteúdo","Feita em português sempre que possível"],"correct":0},{"question":"Se houver dúvida entre dois tipos de mala no chart, o agente deve:","options":["Escolher o formato visual mais próximo e complementar com elementos descritivos","Escolher qualquer código","Deixar o campo em branco","Usar sempre o primeiro tipo da lista"],"correct":0},{"question":"O chart contribui diretamente para:","options":["Melhor qualidade de match entre bagagem extraviada e bagagem sobrante","Aumentar o peso permitido","Emitir cartão de embarque","Alterar a rota do passageiro"],"correct":0},{"question":"Qual erro deve ser evitado ao usar o chart?","options":["Descrever de forma genérica, como mala comum, sem cor/tipo/característica","Comparar a bagagem com o chart","Usar característica visível","Confirmar a cor predominante"],"correct":0},{"question":"A regra prática para montar uma boa identificação é:","options":["Cor predominante + tipo visual + elementos descritivos relevantes","Nome do passageiro + preço + marca","Destino + telefone + assento","Peso + horário + balcão"],"correct":0}]'::jsonb,
    '',
    'Para que serve o chart IATA

Objetivo da trilha
Entender por que o Baggage Identification Chart existe e como ele ajuda na rotina de AHL, OHD, DPR e busca de bagagem.

O chart de bagagem IATA é uma referência visual usada para transformar a aparência de uma bagagem ou artigo em uma descrição padronizada. Em vez de cada agente escrever de um jeito, a equipe passa a usar uma linguagem comum para cor, tipo, formato e elementos visíveis.

Base oficial consultada
A IATA descreve o Baggage ID Chart como uma lista internacionalmente reconhecida de tipos de bagagem, cores e elementos descritivos. A codificação de cores foi conferida com o modelo AIDM/IATA, que referencia os códigos da Resolução 743b. A imagem enviada foi usada como base visual do treinamento, mas os pontos de codificação foram alinhados com a referência oficial atual.

Por que isso importa
Quando uma bagagem é extraviada, o sistema depende de informações comparáveis. Um AHL aberto em uma base pode gerar match com um OHD aberto em outro aeroporto. Se um agente escreve apenas “mala preta comum”, a identificação fica fraca. Se registra cor predominante, tipo visual e elementos descritivos, a chance de reconhecimento aumenta.

O que a imagem mostra
A imagem enviada traz duas áreas principais: a primeira parte com cores, tipos de bagagem e elementos descritivos; a segunda com miscellaneous articles, ou artigos diversos. A leitura deve ser feita por comparação visual: olho na bagagem, olho no chart, escolha do código mais próximo e complementação com características relevantes.

Onde aplicar
- AHL: bagagem extraviada informada pelo passageiro.
- OHD: bagagem sobrante encontrada no aeroporto.
- DPR: dano ou violação, quando a descrição da mala precisa ser clara.
- Conteúdo/CC: quando o conteúdo declarado ajuda na busca, sempre com descrição objetiva e preferencialmente em inglês quando o sistema exigir.

Mensagem principal
O chart não é decoração. Ele é uma ferramenta de padronização. Quanto melhor a leitura visual, melhor a qualidade do processo e do match.

Cores da bagagem

Objetivo da trilha
Aprender a escolher a cor predominante da bagagem usando os códigos visuais do chart.

A cor é a primeira camada da identificação. O agente deve observar a cor predominante do volume, não pequenos detalhes. Uma mala preta com zíper vermelho continua sendo preta; o vermelho pode ser citado como detalhe se ajudar na identificação.

Códigos oficiais de cor IATA
- BK: preto.
- BU: azul.
- RD: vermelho, vinho, rosa ou burgundy.
- WT: branco ou transparente.
- GY: cinza, prata ou alumínio.
- PU: roxo, violeta ou lilás.
- YW: amarelo.
- BE: bege, creme ou marfim.
- BN: marrom, tan, taupe, bronze ou cobre.
- GN: verde, oliva ou jade.
- MC: duas ou mais cores sólidas, excluindo acabamento pequeno.
- PC: print, pattern, floral, listrado, xadrez, manchado ou outro padrão visual marcante.

Observação operacional
Alguns charts antigos ou máscaras locais podem exibir abreviações diferentes para padrão/estampa. A referência IATA atual usa PC. Em treinamento, ensine o conceito e confirme a abreviação disponível no sistema usado pela base.

Como decidir
1. Observe a bagagem de frente e de lado.
2. Identifique a cor que ocupa maior área.
3. Se houver mistura forte de cores sólidas, use MC.
4. Se houver estampa marcante, padrão ou desenho, avalie PC ou a abreviação equivalente exibida no sistema local.
5. Use detalhes de cor apenas como complemento, não como cor principal.

Erros comuns
- Usar a cor da etiqueta em vez da cor da mala.
- Registrar cor de alça, fita ou cadeado como cor principal.
- Chamar cinza escuro de preto sem observar iluminação.
- Ignorar estampa evidente.

Exemplos práticos
Mala rígida azul com rodinhas pretas: cor principal azul, detalhe rodinhas pretas se necessário.
Mala bege com flores coloridas grandes: pode ser bege com padrão, ou PC se o padrão domina a identificação.
Mochila preta com logo branco: preta; o logo pode entrar na descrição complementar.

Mensagem principal
A cor deve ajudar outro agente a reconhecer a mesma bagagem, não apenas registrar uma impressão rápida.

Tipo do volume

Objetivo da trilha
Escolher o tipo de bagagem ou artigo pela forma externa, sem confundir tipo com conteúdo, marca ou valor.

Depois da cor, o chart orienta a escolha do tipo visual. A imagem mostra luggage/bags, com malas de diferentes formatos, bolsas, mochilas, sacolas, caixas e volumes especiais. O agente deve escolher a figura mais parecida com o volume real.

Critérios de leitura
- Estrutura: rígida, flexível, caixa, bolsa, mochila ou saco.
- Formato: retangular, quadrado, cilíndrico, dobrável ou irregular.
- Transporte: com rodas, com alça, de mão, de ombro, de costas.
- Tamanho aparente: pequeno, médio, grande ou volumoso.
- Uso visual: mala de viagem, mochila, sacola, pasta, caixa ou equipamento.

O que não fazer
Não escolha o tipo pela marca. Uma Samsonite, uma Delsey ou uma mala sem marca podem ter o mesmo tipo visual. Também não escolha pelo conteúdo: uma mala com roupas continua sendo mala; uma caixa com roupa continua sendo caixa.

Como complementar
Quando duas figuras parecem possíveis, escolha a mais próxima e use elementos descritivos para diferenciar. Exemplo: mala rígida preta com quatro rodas, alça telescópica e cinta vermelha. Mesmo que o código de tipo não capture tudo, a descrição complementar melhora a busca.

Casos frequentes
- Mala rígida com rodinhas: priorize formato rígido e rodas visíveis.
- Mala flexível de tecido: priorize tipo flexível e bolsos externos se houver.
- Mochila despachada: não registre como mala rígida; use o tipo visual de mochila/saco quando aplicável.
- Caixa ou pacote: use tipo de caixa/pacote quando não houver aparência de mala.

Mensagem principal
Tipo é aparência externa. Conteúdo, marca e valor entram em outros campos ou na descrição complementar.

Elementos descritivos

Objetivo da trilha
Usar detalhes visíveis para diferenciar volumes parecidos e melhorar a precisão do registro.

Elementos descritivos são características externas que ajudam outro agente a reconhecer o mesmo volume. A imagem traz uma faixa de descriptive elements, com ícones de detalhes estruturais e visuais. Mesmo quando o código exato não é legível na imagem, a função operacional é clara: complementar cor e tipo.

Elementos úteis
- Rodinhas: duas ou quatro rodas, quando visíveis.
- Alça: alça lateral, superior ou telescópica.
- Bolso externo: principalmente em malas flexíveis e mochilas.
- Cinta ou faixa: cor e posição ajudam muito.
- Cadeado: quando visível e relevante.
- Etiquetas antigas: podem confundir rota e ajudam na identificação.
- Zíper aparente: especialmente se a bagagem tem zíper frontal forte.
- Dano visível: rasgo, quebrado, amassado ou alça faltando.
- Material aparente: rígida, tecido, couro, plástico ou caixa papelão.
- Formato incomum: cilíndrico, dobrável, comprido ou irregular.

Regra dos três níveis
Uma boa identificação pode seguir este raciocínio:
1. Cor predominante.
2. Tipo visual do volume.
3. Dois ou três elementos que realmente diferenciam.

Exemplo ruim
“Mala preta.”

Exemplo melhor
“Mala preta rígida, quatro rodas, alça telescópica, cinta vermelha.”

Exemplo em inglês operacional
“BLACK HARD CASE, FOUR WHEELS, RED STRAP.”

Mensagem principal
Detalhe bom é aquele que diferencia. Detalhe demais, sem critério, pode poluir a descrição.

Artigos diversos

Objetivo da trilha
Reconhecer quando o item deve ser tratado como miscellaneous article e não como mala tradicional.

A segunda parte da imagem apresenta miscellaneous articles, ou artigos diversos. Essa área é usada para objetos que não têm aparência de mala comum. Ela inclui itens volumosos, equipamentos, carrinhos, cadeiras, pacotes, instrumentos, artigos esportivos, objetos infantis e outros formatos especiais.

Quando usar essa parte do chart
Use miscellaneous articles quando o volume não se encaixa bem em luggage/bags. O objetivo é evitar forçar um item especial dentro de um tipo de mala que não representa sua aparência.

Exemplos práticos
- Carrinho infantil despachado.
- Cadeira ou equipamento de mobilidade.
- Instrumento musical em case próprio.
- Equipamento esportivo em bolsa específica.
- Caixa ou pacote sem formato de mala.
- Objeto dobrável, volumoso ou com formato irregular.
- Item infantil, assento, base ou acessório especial.

Cuidados operacionais
Itens diversos costumam exigir atenção extra: podem ser frágeis, ter valor afetivo, precisar de etiqueta especial, embalagem adequada ou registro mais detalhado. Se o item chega danificado ou sem etiqueta, a descrição precisa ser ainda mais precisa.

Relação com RFP, AHL e OHD
Nem todo artigo diverso será bagagem despachada. Alguns podem aparecer como objeto esquecido, outros como volume despachado. O agente deve separar a natureza do processo: RFP para objeto encontrado/esquecido, AHL para bagagem não localizada, OHD para bagagem sobrante e DPR para dano/violação.

Mensagem principal
Se não parece mala, não force como mala. Use a área de artigos diversos para representar melhor o objeto.

Montagem do código no atendimento

Objetivo da trilha
Aplicar a leitura do chart em registros reais, com descrição clara e útil para busca operacional.

A montagem da identificação deve seguir uma sequência lógica. Primeiro observe a bagagem; depois compare com o chart; em seguida registre cor, tipo e elementos; por fim revise se a descrição seria útil para outro aeroporto localizar o volume.

Fluxo recomendado
1. Confirmar se o item é bagagem tradicional ou artigo diverso.
2. Escolher a cor predominante.
3. Escolher o tipo visual mais próximo.
4. Adicionar elementos externos relevantes.
5. Registrar conteúdo/CC quando aplicável, em inglês quando o sistema exigir.
6. Evitar termos genéricos, subjetivos ou sem valor de busca.
7. Revisar com o passageiro quando for AHL.

Perguntas que ajudam
- Se outro agente olhar esta descrição, ele reconheceria a mala?
- A cor escolhida é predominante ou apenas detalhe?
- O tipo representa o formato real?
- Há cinta, etiqueta, dano, roda, alça ou bolso que diferencie?
- O conteúdo foi informado em categoria correta?
- Alguma informação está baseada em suposição?

Exemplo AHL
Passageiro informa mala cinza rígida, quatro rodas, sem cadeado, com fita verde. Registro sugerido: cor cinza, tipo rígido com rodas, descrição complementar “GREEN STRAP, FOUR WHEELS”.

Exemplo OHD
Equipe encontra mochila preta sem etiqueta, com bolso frontal e logotipo branco. Registro sugerido: cor preta, tipo mochila, descrição complementar “FRONT POCKET, WHITE LOGO, NO TAG”.

Exemplo de artigo diverso
Carrinho infantil azul dobrável encontrado como volume sobrante. Use a lógica de artigo diverso, cor azul e descrição “FOLDING BABY STROLLER”.

Mensagem principal
O chart deve transformar observação em padrão. O bom registro reduz retrabalho, acelera match e protege a qualidade do atendimento.',
    255
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

