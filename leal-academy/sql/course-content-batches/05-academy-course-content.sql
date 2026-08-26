-- Lote 05: restaura conteudo completo dos cursos no Supabase.
-- Execute este arquivo no SQL Editor do Supabase.

with course_content_update(id, modules, material) as (
values
('lideranca-bagagem-extraviada', $json_lideranca_bagagem_extraviada$[{"title":"Papel do lider LL","type":"Aula","duration":"22 min","content":"Slide\n\"CURSO PRÁTICO DE LIDERANÇA EM BAGAGEM EXTRAVIADA Objetivo Geral\nFormar líderes proativos, assertivos e empáticos no setor de bagagem extraviada, capacitando-os para gerenciar operações críticas, atender passageiros com excelência e liderar equipes em cenários de alta pressão, garantindo segurança, eficiência e melhoria contínua.\n\"\n\"MÓDULO 1: Fundamentos da Liderança no Setor de Bagagem Extraviada Objetivo\nCompreender o papel do líder no contexto específico do Lost and Found, destacando a importância de equilibrar operações, atendimento ao cliente e gestão de equipe.Tópicos Detalhados Diferença entre chefe e líder no Lost and Found Chefe: Foca em ordens diretas e cumprimento de metas (ex.: “Resolva esses PIRs até o fim do turno!”). \nLíder: Escuta a equipe, orienta com clareza e promove soluções colaborativas (ex.: “Vamos priorizar os PIRs de voos internacionais hoje. Quem pode assumir o rastreio?”). \nExemplo prático: Um passageiro reclama no balcão enquanto o sistema WorldTracer está fora do ar. O chefe apenas cobra rapidez; o líder acalma o passageiro, divide tarefas e propõe uma solução temporária (como registrar manualmente e rastrear após o sistema voltar).\n\nEstilos de liderança aplicados ao Lost and Found Autoritário: Útil em emergências, como um voo com múltiplos extravios simultâneos (ex.: “Dividam-se: dois no balcão, um no WorldTracer, agora!”). \nDemocrático: Envolve a equipe em decisões, como criar um novo checklist de entrega de bagagens. \nSituacional: Adapta-se à experiência da equipe (ex.: com novatos, ser mais diretivo; com veteranos, delegar mais autonomia). \nEstudo de caso: Durante um pico de 15 PIRs abertos, o líder decide ser diretivo para organizar prioridades, mas usa o estilo democrático na troca de turno para ouvir sugestões de melhoria.\n\nLíder como multiplicador da cultura organizacional Segurança: Priorizar a identificação correta de bagagens e relatar qualquer item suspeito (ex.: mala sem identificação próxima ao balcão). \nPontualidade: Garantir que os prazos de resposta aos passageiros (ex.: 48h para localizar bagagens) sejam cumpridos. \nPadronização: Seguir protocolos do WorldTracer e da companhia aérea, evitando improvisos que gerem erros (ex.: entrega sem conferência de documentos). \nExemplo prático: Um líder reforça a importância de verificar a identidade do passageiro antes de entregar uma mala, mesmo em horários de pico.\n\nAtividade Prática Teste de autoconhecimento: Aplicar um questionário (ex.: DISC ou Situational Leadership) para identificar o estilo de liderança predominante de cada participante. Após o teste, realizar uma devolutiva em grupo com exemplos de como aplicar cada estilo no setor de Lost and Found (ex.: “Se você é mais diretivo, como lidaria com um novato que erra no preenchimento do PIR?”). \nDinâmica: Listar 3 comportamentos de um líder ineficaz no setor (ex.: ignorar reclamações de passageiros, não checar relatórios do WorldTracer, delegar sem acompanhamento) e propor soluções para cada um.\n\n\"\n\"MÓDULO 2: Comunicação Assertiva e Atendimento Humanizado Objetivo\nDesenvolver habilidades de comunicação clara e empática, equilibrando informações técnicas com um atendimento acolhedor, mesmo sob pressão.Tópicos Detalhados Condução de reuniões pré-turno Duração ideal: 5-7 minutos, com pauta clara. \nEstrutura sugerida: Informar voos críticos (ex.: “Hoje temos um voo internacional com 3 PIRs pendentes”). \nDefinir prioridades (ex.: “Foco em rastrear bagagens do voo 1425 e atender passageiros no balcão”). \nReforçar segurança (ex.: “Chequem as áreas para itens abandonados antes de liberar o balcão”)."},{"title":"Comunicacao assertiva","type":"Pratica","duration":"24 min","content":"Comunicação assertiva\n\nA liderança em bagagem extraviada depende de comunicação assertiva: transmitir prioridades, dividir tarefas, alinhar expectativas, orientar a equipe e dar feedback objetivo. A assertividade evita ruído entre balcão, busca, rampa, transportadora e passageiro.\n\nMaterial de apoio da trilha\n\nExemplo prático: “Hoje temos 5 PIRs abertos, 2 são de voos internacionais. João, você rastreia no WorldTracer; Ana, atende no balcão. Alguma dúvida?”\n\nFeedback positivo e corretivo Positivo: Reforçar ações específicas (ex.: “Parabéns, Maria, sua organização no rastreio reduziu o tempo de resposta de um PIR de 72h para 24h”). \nCorretivo: Ser objetivo e construtivo (ex.: “Pedro, notei que você não registrou o PIR no sistema ontem. Vamos revisar o processo juntos para evitar isso?”). \nExemplo prático: Um colaborador esquece de atualizar o status de uma bagagem localizada. O líder aborda: “Entendo que estava corrido, mas atualizar o WorldTracer é essencial para o passageiro. Vamos treinar isso hoje?”\n\nMediação de conflitos no Lost and Found Conflitos comuns: Desentendimentos entre equipe de balcão e rampa (ex.: rampa culpa o balcão por não avisar sobre bagagem RUSH). \nPassos do líder: Ouvir ambas as partes sem interrupções. \nIdentificar a causa raiz (ex.: falta de comunicação via rádio). \nPropor uma solução (ex.: incluir um checklist de comunicação entre áreas). \nDocumentar o caso para evitar repetição.\n\nExemplo prático: Um passageiro reclama que a equipe entregou a mala errada. O líder ouve a equipe, verifica o PIR e implementa uma dupla checagem para entregas.\n\nAtividade Prática Simulação de conversa difícil: Cada participante deve simular o diálogo com um colaborador que constantemente esquece de atualizar o WorldTracer, usando a técnica de feedback corretivo (ex.: “Percebi que o PIR do voo 123 ficou sem atualização. Como posso te ajudar a incluir isso na rotina?”). \nRoteiro de atendimento: Criar frases padrão para explicar o processo de rastreio a passageiros, evitando jargões (ex.: “Estamos verificando sua mala em um sistema global que conecta todos os aeroportos. Entraremos em contato assim que houver novidades”).\n\n\"\n\" MÓDULO 3: Gestão de Equipes e Turnos Operacionais Objetivo\nGarantir a fluidez nas trocas de turno, a divisão justa de tarefas e o engajamento da equipe no setor de Lost and Found.Tópicos Detalhados Divisão justa de tarefas Tarefas principais: Atendimento no balcão, rastreio no WorldTracer, contato telefônico com passageiros, entregas externas. \nCritérios de divisão: Experiência do colaborador, volume de trabalho e rodízio para evitar sobrecarga (ex.: novatos no balcão com supervisão; veteranos no rastreio). \nExemplo prático: Em um turno com 10 PIRs abertos, o líder divide: 2 no balcão, 1 no rastreio, 1 na telefonia, e rotaciona a cada 2 horas para evitar desgaste.\n\nBriefing de troca de turno Estrutura sugerida: Resumo do turno anterior (ex.: “Atendemos 8 PIRs, 3 foram localizados, 1 está em trânsito”). \nPrioridades do próximo turno (ex.: “Foco no voo 1425, com bagagem RUSH chegando às 22h”). \nStatus de equipamentos (ex.: “Impressora do balcão está com falha, usem a reserva”).\n\nExemplo prático: “No último turno, resolvemos 5 PIRs, mas 2 estão pendentes há 48h. Priorizem o rastreio desses casos e verifiquem o WorldTracer a cada hora.”\n\nRodízio saudável e engajamento Rodízio: Evitar que os mesmos colaboradores fiquem em tarefas desgastantes (ex.: entregas externas em horários de pico). \nEngajamento: Reconhecer esforços (ex.: “O turno da madrugada localizou 3 bagagens em tempo recorde. Parabéns!”). \nExemplo prático: Criar um rodízio semanal onde todos passam por balcão, rastreio e entregas, com folgas equilibradas em datas comemorativas."},{"title":"Gestao de turnos","type":"Simulacao","duration":"24 min","content":"Gestão de turnos\n\nGestão de turnos envolve abertura e fechamento de plantão, conferência de casos pendentes, distribuição de responsabilidades, atualização de WorldTracer, acompanhamento de entregas, repasse para o próximo turno e organização do balcão.\n\nMaterial de apoio da trilha\n\nAtividade Prática Checklist de turno: Cada participante cria um modelo de checklist para abertura e fechamento do plantão, incluindo itens como: conferência do WorldTracer, status de PIRs pendentes, limpeza do balcão e teste de equipamentos (rádio, impressora). \nDinâmica de briefing: Simular uma troca de turno, onde o líder passa as informações críticas em 5 minutos, e a equipe faz perguntas para esclarecer dúvidas.\n\n\"\n\" MÓDULO 4: Tomada de Decisão Sob Pressão e AutonomiaObjetivo\nCapacitar o líder a tomar decisões rápidas e assertivas em cenários críticos, priorizando segurança, atendimento e eficiência.Tópicos Detalhados Organização de prioridades no Lost and Found Hierarquia de prioridades: Passageiros com necessidades especiais (PNAE) no balcão. \nBagagens RUSH ou de voos em conexão curta. \nCasos pendentes há mais de 48h. \nAtendimentos telefônicos ou e-mails.\n\nExemplo prático: Um passageiro PNAE reclama no balcão, o telefone toca com um caso urgente, e um novo PIR é aberto. O líder prioriza o PNAE, delega o telefone a um colega e registra o PIR após.\n\nCenários de decisão sob pressão Caso 1: Um passageiro ameaça acionar um advogado devido a uma bagagem extraviada há 5 dias. O líder ouve com calma, explica o processo de rastreio e oferece uma solução temporária (ex.: kit de itens essenciais, se aplicável). \nCaso 2: Uma bagagem chega danificada. O líder verifica o PIR, documenta o dano com fotos, registra no WorldTracer e orienta o passageiro sobre o processo de indenização. \nExemplo prático: Durante um pico, o líder decide pausar atendimentos telefônicos para focar em 3 PIRs de um voo internacional com passageiros esperando no balcão.\n\nInteração com áreas externas Quando acionar: Polícia Federal (PF) para bagagens suspeitas, ANAC para reclamações formais, companhia aérea para atualizações de rastreio. \nLinguagem: Formal e objetiva (ex.: “Prezados, informamos um PIR pendente no voo 1425, solicitamos atualização urgente no WorldTracer”). \nExemplo prático: Uma mala sem identificação é encontrada. O líder aciona a equipe para registrar no sistema.\n\nAtividade Prática Dinâmica de decisão: Simular um cenário com múltiplas ocorrências simultâneas (ex.: passageiro agressivo, bagagem RUSH chegando, sistema fora do ar). Cada participante decide a ordem de ação e justifica. \nMapa de prioridades: Criar um fluxograma para um plantão de sábado à noite, considerando menos staff e alta demanda (ex.: 2 no balcão, 1 no rastreio, 1 na telefonia).\n\n\"\n\" MÓDULO 5: Segurança da Informação e Padronização Objetivo\nGarantir que o líder proteja dados sensíveis, siga protocolos rigorosos e evite falhas administrativas no setor de Lost and Found.Tópicos Detalhados Proteção de dados do PIR Cuidados: Não deixar impressões de PIRs no balcão. \nEvitar compartilhar informações sensíveis por WhatsApp pessoal. \nConferir a identidade do passageiro antes da entrega (ex.: documento com foto).\n\nExemplo prático: Um passageiro reclama que outra pessoa retirou sua mala. O líder verifica que o colaborador não checou o documento,etiqueta da bagagem, reforça o treinamento e registra o caso."},{"title":"Decisao sob pressao","type":"Exercicio","duration":"22 min","content":"Decisão sob pressão\n\nDecisão sob pressão exige priorizar segurança, atendimento ao passageiro, prazos, evidências e impacto operacional. O líder deve decidir com base em procedimento, registrar justificativas e manter a equipe coordenada em cenários de alto volume ou conflito.\n\nMaterial de apoio da trilha\n\nPadronização de processos Entrega de bagagens: Sempre conferir tag da bagagem com o PIR e o documento do passageiro. \nRegistro no WorldTracer: Atualizar status imediatamente após qualquer mudança (ex.: “Bagagem localizada, em trânsito”). \nExemplo prático: Uma bagagem com dois nomes semelhantes é entregue. O líder implementa uma dupla checagem (ex.: um colega confirma a tag antes da entrega).\n\nSegurança operacional Itens suspeitos: Relatar imediatamente malas abandonadas ou com conteúdo duvidoso à segurança. \nInspeção visual: Checar balcões e áreas próximas no início e fim do turno. \nExemplo prático: O líder nota uma mala sem tag próxima ao balcão. confirma a origem,caso seja procedente da área ar com identificação,(sem tag,data,possível voo), registra no sistema e orienta a equipe a nunca mover itens suspeitos.\n\nAtividade Prática Roteiro de ação: Criar um protocolo para lidar com uma mala abandonada,conferir a origem,(bagagem sem tag documentada por GRUKR), incluindo passos como isolar a área, acionar segurança e registrar a ocorrência. \nSimulação de entrega: Cada participante simula a entrega de uma bagagem, conferindo tag, PIR e documento do passageiro, com um colega atuando como “observador” para identificar erros.\n\n\"\n\" MÓDULO 6: Indicadores, Relatórios e Melhorias Contínuas Objetivo\nCapacitar o líder a documentar operações, medir resultados e propor melhorias com base em dados concretos.Tópicos Detalhados Ferramentas de controle diário Indicadores principais: Total de PIRs abertos e fechados. \nTempo médio de localização de bagagens. \nPercentual de entregas realizadas no prazo. \nReclamações recebidas (de passageiros ou cias aéreas).\n\nExemplo prático: Um relatório diário mostra: 10 PIRs abertos, 6 localizados, 4 entregues, 1 reclamação por demora. O líder analisa e propõe reforçar o rastreio no WorldTracer.\n\nRelatórios para troca de turno Modelo sugerido (máximo 5 linhas): Voos críticos atendidos. \nPIRs pendentes e status. \nProblemas enfrentados (ex.: sistema fora do ar). \nSugestões de melhoria (ex.: treinar novatos no WorldTracer). \nStatus de equipamentos (ex.: rádio com bateria baixa).\n\nExemplo prático: “Turno 14h-22h: 8 PIRs abertos, 5 localizados, 3 entregues. Problema: impressora falhou. Sugestão: revisar checklist de equipamentos. Status: rádio ok.”\n\nMelhorias contínuas Identificar erros frequentes: Ex.: preenchimento incorreto de PIRs, demora em atualizações no WorldTracer. \nPropor soluções: Treinamentos rápidos (15 min) no início do turno, cartazes com lembretes no balcão. \nExemplo prático: O líder nota que 20% dos PIRs têm erros de preenchimento. Ele propõe um checklist visual no balcão e um treinamento semanal.\n\nAtividade Prática Modelo de relatório: Cada participante cria um relatório visual (ex.: gráfico ou tabela) para apresentar resultados semanais, incluindo PIRs abertos, localizados, entregues e pendentes. \nPlano de melhoria: Em grupos, identificar um problema recorrente no setor (ex.: demora no rastreio) e propor uma solução prática (ex.: turno extra no WorldTracer em horários de pico)."},{"title":"Etica e padronizacao","type":"Consulta","duration":"22 min","content":"Ética e padronização\n\nÉtica e padrão operacional protegem o passageiro, a equipe e a empresa. O líder deve evitar favorecimentos, improvisos sem registro, promessas indevidas e condutas que prejudiquem rastreabilidade. Padronização garante que todos executem o processo da mesma forma.\n\nMaterial de apoio da trilha\n\n\"\n\" Tópico: Ética e Moral na Liderança – O Verdadeiro Papel do Líder\nObjetivo do Módulo\nRefletir sobre a importância da ética e da moral na atuação de líderes, analisando comportamentos que comprometem a credibilidade da liderança e afetam o ambiente organizacional.\"\n\"️ 1. Ética e Moral: Fundamentos Inabaláveis da Liderança\nÉtica: Conjunto de princípios que regem o comportamento profissional.\n\nMoral: Conjunto de valores pessoais e sociais.\n\nUm líder ético é imparcial, transparente e justo nas decisões.\n\nA confiança da equipe nasce da coerência entre o discurso e a prática. Exemplo de Líder Ético:\nJoana, gerente de operações, sempre decide promoções com base em critérios claros: desempenho, resultados, postura profissional. Mesmo quando um amigo próximo concorre a uma vaga, ela mantém a imparcialidade e segue o processo.\n\nExemplo de conduta antiética:\nCarlos aprova licenças, folgas e viagens internacionais com base em afinidade pessoal, beneficiando sempre os mesmos colaboradores.\n\nReflexos no ambiente:\nA confiança aumenta quando todos são tratados com igualdade.\n\nRegras claras reduzem conflitos e boatos.\n\nConsequências da falta de ética:\nAmbiente de trabalho contaminado por desconfiança.\n\nColaboradores motivados deixam a empresa.\n\nCresce a sensação de injustiça e favorecimento.\n\n⭐ Como age um líder ético:\nAplica regras iguais para todos.\n\nAssume seus erros e compartilha acertos.\n\nBaseia decisões em fatos e dados, não em preferências.\"\n\"‍️ 2. Promoções por Amizade: Quando o Pessoal se Sobrepõe ao Profissional\nPromover por afinidade compromete a meritocracia.\n\nGera desmotivação em colaboradores mais capacitados.\n\nEstimula a cultura do “quem indica” em vez da competência.\n\nImpacto direto na performance da equipe e nos resultados. \nExemplo de má conduta:\nPaulo promoveu seu amigo de infância para uma vaga de supervisor, mesmo com outros três colaboradores mais preparados e com melhores resultados.\n\nReflexos no ambiente:\nEquipe perde a motivação ao perceber que mérito não é reconhecido.\n\nInstala-se um sentimento de injustiça e desvalorização.\n\nConsequências:\nTalentos deixam a empresa ou se tornam apáticos.\n\nA produtividade cai, junto com a confiança na liderança.\n\nO promovido pode não estar preparado e falhar no cargo.\n\nExemplo positivo:\nCamila, líder de equipe, é amiga de um dos analistas, mas se retira do processo de decisão para garantir imparcialidade. Isso fortalece sua imagem como justa e profissional.\n\n⭐ Como age um líder ético:\nSe afasta de decisões que envolvam amigos ou parentes.\n\nCria critérios objetivos de promoção e comunica à equipe.\n\nValoriza a meritocracia e estimula o crescimento por esforço.\"\n\" 3. Insegurança do Líder: Um Obstáculo Oculto ao Crescimento da Equipe\nLíderes inseguros evitam promover talentos por medo de serem ofuscados.\n\nEssa postura é contrária ao papel do líder: desenvolver pessoas.\n\nGrandes líderes formam outros líderes, não subordinados eternos.\n\nA insegurança gera estagnação, rotatividade e clima tóxico.\n\nExemplo de liderança insegura:\nRogério evita delegar tarefas mais complexas a um funcionário talentoso porque teme que ele \"\"brilhe demais\"\". Ele bloqueia treinamentos e promoções, centraliza tudo e sufoca a equipe."},{"title":"Indicadores e melhoria","type":"Gestao","duration":"20 min","content":"Indicadores e melhoria\n\nIndicadores ajudam a medir qualidade e melhoria contínua: quantidade de PIRs abertos, tempo de localização, tempo de entrega, reincidência por rota, reclamações, pendências por turno, casos encerrados e retrabalho. A liderança usa esses dados para corrigir falhas e treinar a equipe.\n\nMaterial de apoio da trilha\n\nReflexos no ambiente:\nColaboradores ficam estagnados e desmotivados.\n\nA inovação é sufocada por medo de ameaçar o ego do líder.\n\nA equipe sente que não há espaço para crescimento.\n\nConsequências:\nAlta rotatividade de talentos.\n\nEquipe dependente e sem autonomia.\n\nClima de medo e frustração constante.\n\nExemplo positivo:\nAndré identifica um analista promissor e o incentiva a assumir novos desafios, mesmo que isso o coloque em evidência. André enxerga o sucesso do time como o seu sucesso.\n\n⭐ Como age um líder ético:\nReconhece e incentiva o talento alheio.\n\nCapacita a equipe para que cresça com autonomia.\n\nNão se sente ameaçado pelo brilho dos outros.\"\n\" 4. Uso Indevido do Cargo: A Armadilha da Autopromoção\nLiderança não é palco para vaidade pessoal.\n\nUtilizar o cargo para autopromoção é antiético e destrói o respeito.\n\nO verdadeiro líder promove o time, compartilha conquistas e assume erros.\n\nA liderança é um serviço, não uma escada para interesses pessoais.\n\nExemplo de abuso de cargo:\nFernanda, coordenadora, se exibe em redes sociais com prêmios e conquistas que foram, na verdade, frutos do trabalho da equipe. Em reuniões, ela nunca divide os méritos.\n\nReflexos no ambiente:\nClima de ressentimento e descrédito.\n\nA equipe se sente usada, não reconhecida.\n\nConsequências:\nA equipe perde o entusiasmo.\n\nHá queda na entrega de resultados.\n\nPessoas evitam colaborar, já que o reconhecimento não é compartilhado.\n\nExemplo de conduta ética:\nMarcos, gerente de projetos, sempre apresenta os resultados destacando o papel da equipe. Em eventos, chama membros do time para falar e receber elogios junto com ele.\n\n⭐ Como age um líder ético:\nUsa o cargo para servir, não para se autopromover.\n\nDá visibilidade ao time, compartilha conquistas.\n\nEntende que sua missão é alavancar os outros.\n\n5. Reflexão Final\n“Liderar é influenciar com exemplo. A ética é o que diferencia chefes de verdadeiros líderes.”\n— Reflita: você inspira ou apenas manda?\""}]$json_lideranca_bagagem_extraviada$::jsonb, $mat_lideranca_bagagem_extraviada$Papel do lider LL

Slide
"CURSO PRÁTICO DE LIDERANÇA EM BAGAGEM EXTRAVIADA Objetivo Geral
Formar líderes proativos, assertivos e empáticos no setor de bagagem extraviada, capacitando-os para gerenciar operações críticas, atender passageiros com excelência e liderar equipes em cenários de alta pressão, garantindo segurança, eficiência e melhoria contínua.
"
"MÓDULO 1: Fundamentos da Liderança no Setor de Bagagem Extraviada Objetivo
Compreender o papel do líder no contexto específico do Lost and Found, destacando a importância de equilibrar operações, atendimento ao cliente e gestão de equipe.Tópicos Detalhados Diferença entre chefe e líder no Lost and Found Chefe: Foca em ordens diretas e cumprimento de metas (ex.: “Resolva esses PIRs até o fim do turno!”). 
Líder: Escuta a equipe, orienta com clareza e promove soluções colaborativas (ex.: “Vamos priorizar os PIRs de voos internacionais hoje. Quem pode assumir o rastreio?”). 
Exemplo prático: Um passageiro reclama no balcão enquanto o sistema WorldTracer está fora do ar. O chefe apenas cobra rapidez; o líder acalma o passageiro, divide tarefas e propõe uma solução temporária (como registrar manualmente e rastrear após o sistema voltar).

Estilos de liderança aplicados ao Lost and Found Autoritário: Útil em emergências, como um voo com múltiplos extravios simultâneos (ex.: “Dividam-se: dois no balcão, um no WorldTracer, agora!”). 
Democrático: Envolve a equipe em decisões, como criar um novo checklist de entrega de bagagens. 
Situacional: Adapta-se à experiência da equipe (ex.: com novatos, ser mais diretivo; com veteranos, delegar mais autonomia). 
Estudo de caso: Durante um pico de 15 PIRs abertos, o líder decide ser diretivo para organizar prioridades, mas usa o estilo democrático na troca de turno para ouvir sugestões de melhoria.

Líder como multiplicador da cultura organizacional Segurança: Priorizar a identificação correta de bagagens e relatar qualquer item suspeito (ex.: mala sem identificação próxima ao balcão). 
Pontualidade: Garantir que os prazos de resposta aos passageiros (ex.: 48h para localizar bagagens) sejam cumpridos. 
Padronização: Seguir protocolos do WorldTracer e da companhia aérea, evitando improvisos que gerem erros (ex.: entrega sem conferência de documentos). 
Exemplo prático: Um líder reforça a importância de verificar a identidade do passageiro antes de entregar uma mala, mesmo em horários de pico.

Atividade Prática Teste de autoconhecimento: Aplicar um questionário (ex.: DISC ou Situational Leadership) para identificar o estilo de liderança predominante de cada participante. Após o teste, realizar uma devolutiva em grupo com exemplos de como aplicar cada estilo no setor de Lost and Found (ex.: “Se você é mais diretivo, como lidaria com um novato que erra no preenchimento do PIR?”). 
Dinâmica: Listar 3 comportamentos de um líder ineficaz no setor (ex.: ignorar reclamações de passageiros, não checar relatórios do WorldTracer, delegar sem acompanhamento) e propor soluções para cada um.

"
"MÓDULO 2: Comunicação Assertiva e Atendimento Humanizado Objetivo
Desenvolver habilidades de comunicação clara e empática, equilibrando informações técnicas com um atendimento acolhedor, mesmo sob pressão.Tópicos Detalhados Condução de reuniões pré-turno Duração ideal: 5-7 minutos, com pauta clara. 
Estrutura sugerida: Informar voos críticos (ex.: “Hoje temos um voo internacional com 3 PIRs pendentes”). 
Definir prioridades (ex.: “Foco em rastrear bagagens do voo 1425 e atender passageiros no balcão”). 
Reforçar segurança (ex.: “Chequem as áreas para itens abandonados antes de liberar o balcão”).

---

Comunicacao assertiva

Comunicação assertiva

A liderança em bagagem extraviada depende de comunicação assertiva: transmitir prioridades, dividir tarefas, alinhar expectativas, orientar a equipe e dar feedback objetivo. A assertividade evita ruído entre balcão, busca, rampa, transportadora e passageiro.

Material de apoio da trilha

Exemplo prático: “Hoje temos 5 PIRs abertos, 2 são de voos internacionais. João, você rastreia no WorldTracer; Ana, atende no balcão. Alguma dúvida?”

Feedback positivo e corretivo Positivo: Reforçar ações específicas (ex.: “Parabéns, Maria, sua organização no rastreio reduziu o tempo de resposta de um PIR de 72h para 24h”). 
Corretivo: Ser objetivo e construtivo (ex.: “Pedro, notei que você não registrou o PIR no sistema ontem. Vamos revisar o processo juntos para evitar isso?”). 
Exemplo prático: Um colaborador esquece de atualizar o status de uma bagagem localizada. O líder aborda: “Entendo que estava corrido, mas atualizar o WorldTracer é essencial para o passageiro. Vamos treinar isso hoje?”

Mediação de conflitos no Lost and Found Conflitos comuns: Desentendimentos entre equipe de balcão e rampa (ex.: rampa culpa o balcão por não avisar sobre bagagem RUSH). 
Passos do líder: Ouvir ambas as partes sem interrupções. 
Identificar a causa raiz (ex.: falta de comunicação via rádio). 
Propor uma solução (ex.: incluir um checklist de comunicação entre áreas). 
Documentar o caso para evitar repetição.

Exemplo prático: Um passageiro reclama que a equipe entregou a mala errada. O líder ouve a equipe, verifica o PIR e implementa uma dupla checagem para entregas.

Atividade Prática Simulação de conversa difícil: Cada participante deve simular o diálogo com um colaborador que constantemente esquece de atualizar o WorldTracer, usando a técnica de feedback corretivo (ex.: “Percebi que o PIR do voo 123 ficou sem atualização. Como posso te ajudar a incluir isso na rotina?”). 
Roteiro de atendimento: Criar frases padrão para explicar o processo de rastreio a passageiros, evitando jargões (ex.: “Estamos verificando sua mala em um sistema global que conecta todos os aeroportos. Entraremos em contato assim que houver novidades”).

"
" MÓDULO 3: Gestão de Equipes e Turnos Operacionais Objetivo
Garantir a fluidez nas trocas de turno, a divisão justa de tarefas e o engajamento da equipe no setor de Lost and Found.Tópicos Detalhados Divisão justa de tarefas Tarefas principais: Atendimento no balcão, rastreio no WorldTracer, contato telefônico com passageiros, entregas externas. 
Critérios de divisão: Experiência do colaborador, volume de trabalho e rodízio para evitar sobrecarga (ex.: novatos no balcão com supervisão; veteranos no rastreio). 
Exemplo prático: Em um turno com 10 PIRs abertos, o líder divide: 2 no balcão, 1 no rastreio, 1 na telefonia, e rotaciona a cada 2 horas para evitar desgaste.

Briefing de troca de turno Estrutura sugerida: Resumo do turno anterior (ex.: “Atendemos 8 PIRs, 3 foram localizados, 1 está em trânsito”). 
Prioridades do próximo turno (ex.: “Foco no voo 1425, com bagagem RUSH chegando às 22h”). 
Status de equipamentos (ex.: “Impressora do balcão está com falha, usem a reserva”).

Exemplo prático: “No último turno, resolvemos 5 PIRs, mas 2 estão pendentes há 48h. Priorizem o rastreio desses casos e verifiquem o WorldTracer a cada hora.”

Rodízio saudável e engajamento Rodízio: Evitar que os mesmos colaboradores fiquem em tarefas desgastantes (ex.: entregas externas em horários de pico). 
Engajamento: Reconhecer esforços (ex.: “O turno da madrugada localizou 3 bagagens em tempo recorde. Parabéns!”). 
Exemplo prático: Criar um rodízio semanal onde todos passam por balcão, rastreio e entregas, com folgas equilibradas em datas comemorativas.

---

Gestao de turnos

Gestão de turnos

Gestão de turnos envolve abertura e fechamento de plantão, conferência de casos pendentes, distribuição de responsabilidades, atualização de WorldTracer, acompanhamento de entregas, repasse para o próximo turno e organização do balcão.

Material de apoio da trilha

Atividade Prática Checklist de turno: Cada participante cria um modelo de checklist para abertura e fechamento do plantão, incluindo itens como: conferência do WorldTracer, status de PIRs pendentes, limpeza do balcão e teste de equipamentos (rádio, impressora). 
Dinâmica de briefing: Simular uma troca de turno, onde o líder passa as informações críticas em 5 minutos, e a equipe faz perguntas para esclarecer dúvidas.

"
" MÓDULO 4: Tomada de Decisão Sob Pressão e AutonomiaObjetivo
Capacitar o líder a tomar decisões rápidas e assertivas em cenários críticos, priorizando segurança, atendimento e eficiência.Tópicos Detalhados Organização de prioridades no Lost and Found Hierarquia de prioridades: Passageiros com necessidades especiais (PNAE) no balcão. 
Bagagens RUSH ou de voos em conexão curta. 
Casos pendentes há mais de 48h. 
Atendimentos telefônicos ou e-mails.

Exemplo prático: Um passageiro PNAE reclama no balcão, o telefone toca com um caso urgente, e um novo PIR é aberto. O líder prioriza o PNAE, delega o telefone a um colega e registra o PIR após.

Cenários de decisão sob pressão Caso 1: Um passageiro ameaça acionar um advogado devido a uma bagagem extraviada há 5 dias. O líder ouve com calma, explica o processo de rastreio e oferece uma solução temporária (ex.: kit de itens essenciais, se aplicável). 
Caso 2: Uma bagagem chega danificada. O líder verifica o PIR, documenta o dano com fotos, registra no WorldTracer e orienta o passageiro sobre o processo de indenização. 
Exemplo prático: Durante um pico, o líder decide pausar atendimentos telefônicos para focar em 3 PIRs de um voo internacional com passageiros esperando no balcão.

Interação com áreas externas Quando acionar: Polícia Federal (PF) para bagagens suspeitas, ANAC para reclamações formais, companhia aérea para atualizações de rastreio. 
Linguagem: Formal e objetiva (ex.: “Prezados, informamos um PIR pendente no voo 1425, solicitamos atualização urgente no WorldTracer”). 
Exemplo prático: Uma mala sem identificação é encontrada. O líder aciona a equipe para registrar no sistema.

Atividade Prática Dinâmica de decisão: Simular um cenário com múltiplas ocorrências simultâneas (ex.: passageiro agressivo, bagagem RUSH chegando, sistema fora do ar). Cada participante decide a ordem de ação e justifica. 
Mapa de prioridades: Criar um fluxograma para um plantão de sábado à noite, considerando menos staff e alta demanda (ex.: 2 no balcão, 1 no rastreio, 1 na telefonia).

"
" MÓDULO 5: Segurança da Informação e Padronização Objetivo
Garantir que o líder proteja dados sensíveis, siga protocolos rigorosos e evite falhas administrativas no setor de Lost and Found.Tópicos Detalhados Proteção de dados do PIR Cuidados: Não deixar impressões de PIRs no balcão. 
Evitar compartilhar informações sensíveis por WhatsApp pessoal. 
Conferir a identidade do passageiro antes da entrega (ex.: documento com foto).

Exemplo prático: Um passageiro reclama que outra pessoa retirou sua mala. O líder verifica que o colaborador não checou o documento,etiqueta da bagagem, reforça o treinamento e registra o caso.

---

Decisao sob pressao

Decisão sob pressão

Decisão sob pressão exige priorizar segurança, atendimento ao passageiro, prazos, evidências e impacto operacional. O líder deve decidir com base em procedimento, registrar justificativas e manter a equipe coordenada em cenários de alto volume ou conflito.

Material de apoio da trilha

Padronização de processos Entrega de bagagens: Sempre conferir tag da bagagem com o PIR e o documento do passageiro. 
Registro no WorldTracer: Atualizar status imediatamente após qualquer mudança (ex.: “Bagagem localizada, em trânsito”). 
Exemplo prático: Uma bagagem com dois nomes semelhantes é entregue. O líder implementa uma dupla checagem (ex.: um colega confirma a tag antes da entrega).

Segurança operacional Itens suspeitos: Relatar imediatamente malas abandonadas ou com conteúdo duvidoso à segurança. 
Inspeção visual: Checar balcões e áreas próximas no início e fim do turno. 
Exemplo prático: O líder nota uma mala sem tag próxima ao balcão. confirma a origem,caso seja procedente da área ar com identificação,(sem tag,data,possível voo), registra no sistema e orienta a equipe a nunca mover itens suspeitos.

Atividade Prática Roteiro de ação: Criar um protocolo para lidar com uma mala abandonada,conferir a origem,(bagagem sem tag documentada por GRUKR), incluindo passos como isolar a área, acionar segurança e registrar a ocorrência. 
Simulação de entrega: Cada participante simula a entrega de uma bagagem, conferindo tag, PIR e documento do passageiro, com um colega atuando como “observador” para identificar erros.

"
" MÓDULO 6: Indicadores, Relatórios e Melhorias Contínuas Objetivo
Capacitar o líder a documentar operações, medir resultados e propor melhorias com base em dados concretos.Tópicos Detalhados Ferramentas de controle diário Indicadores principais: Total de PIRs abertos e fechados. 
Tempo médio de localização de bagagens. 
Percentual de entregas realizadas no prazo. 
Reclamações recebidas (de passageiros ou cias aéreas).

Exemplo prático: Um relatório diário mostra: 10 PIRs abertos, 6 localizados, 4 entregues, 1 reclamação por demora. O líder analisa e propõe reforçar o rastreio no WorldTracer.

Relatórios para troca de turno Modelo sugerido (máximo 5 linhas): Voos críticos atendidos. 
PIRs pendentes e status. 
Problemas enfrentados (ex.: sistema fora do ar). 
Sugestões de melhoria (ex.: treinar novatos no WorldTracer). 
Status de equipamentos (ex.: rádio com bateria baixa).

Exemplo prático: “Turno 14h-22h: 8 PIRs abertos, 5 localizados, 3 entregues. Problema: impressora falhou. Sugestão: revisar checklist de equipamentos. Status: rádio ok.”

Melhorias contínuas Identificar erros frequentes: Ex.: preenchimento incorreto de PIRs, demora em atualizações no WorldTracer. 
Propor soluções: Treinamentos rápidos (15 min) no início do turno, cartazes com lembretes no balcão. 
Exemplo prático: O líder nota que 20% dos PIRs têm erros de preenchimento. Ele propõe um checklist visual no balcão e um treinamento semanal.

Atividade Prática Modelo de relatório: Cada participante cria um relatório visual (ex.: gráfico ou tabela) para apresentar resultados semanais, incluindo PIRs abertos, localizados, entregues e pendentes. 
Plano de melhoria: Em grupos, identificar um problema recorrente no setor (ex.: demora no rastreio) e propor uma solução prática (ex.: turno extra no WorldTracer em horários de pico).

---

Etica e padronizacao

Ética e padronização

Ética e padrão operacional protegem o passageiro, a equipe e a empresa. O líder deve evitar favorecimentos, improvisos sem registro, promessas indevidas e condutas que prejudiquem rastreabilidade. Padronização garante que todos executem o processo da mesma forma.

Material de apoio da trilha

"
" Tópico: Ética e Moral na Liderança – O Verdadeiro Papel do Líder
Objetivo do Módulo
Refletir sobre a importância da ética e da moral na atuação de líderes, analisando comportamentos que comprometem a credibilidade da liderança e afetam o ambiente organizacional."
"️ 1. Ética e Moral: Fundamentos Inabaláveis da Liderança
Ética: Conjunto de princípios que regem o comportamento profissional.

Moral: Conjunto de valores pessoais e sociais.

Um líder ético é imparcial, transparente e justo nas decisões.

A confiança da equipe nasce da coerência entre o discurso e a prática. Exemplo de Líder Ético:
Joana, gerente de operações, sempre decide promoções com base em critérios claros: desempenho, resultados, postura profissional. Mesmo quando um amigo próximo concorre a uma vaga, ela mantém a imparcialidade e segue o processo.

Exemplo de conduta antiética:
Carlos aprova licenças, folgas e viagens internacionais com base em afinidade pessoal, beneficiando sempre os mesmos colaboradores.

Reflexos no ambiente:
A confiança aumenta quando todos são tratados com igualdade.

Regras claras reduzem conflitos e boatos.

Consequências da falta de ética:
Ambiente de trabalho contaminado por desconfiança.

Colaboradores motivados deixam a empresa.

Cresce a sensação de injustiça e favorecimento.

⭐ Como age um líder ético:
Aplica regras iguais para todos.

Assume seus erros e compartilha acertos.

Baseia decisões em fatos e dados, não em preferências."
"‍️ 2. Promoções por Amizade: Quando o Pessoal se Sobrepõe ao Profissional
Promover por afinidade compromete a meritocracia.

Gera desmotivação em colaboradores mais capacitados.

Estimula a cultura do “quem indica” em vez da competência.

Impacto direto na performance da equipe e nos resultados. 
Exemplo de má conduta:
Paulo promoveu seu amigo de infância para uma vaga de supervisor, mesmo com outros três colaboradores mais preparados e com melhores resultados.

Reflexos no ambiente:
Equipe perde a motivação ao perceber que mérito não é reconhecido.

Instala-se um sentimento de injustiça e desvalorização.

Consequências:
Talentos deixam a empresa ou se tornam apáticos.

A produtividade cai, junto com a confiança na liderança.

O promovido pode não estar preparado e falhar no cargo.

Exemplo positivo:
Camila, líder de equipe, é amiga de um dos analistas, mas se retira do processo de decisão para garantir imparcialidade. Isso fortalece sua imagem como justa e profissional.

⭐ Como age um líder ético:
Se afasta de decisões que envolvam amigos ou parentes.

Cria critérios objetivos de promoção e comunica à equipe.

Valoriza a meritocracia e estimula o crescimento por esforço."
" 3. Insegurança do Líder: Um Obstáculo Oculto ao Crescimento da Equipe
Líderes inseguros evitam promover talentos por medo de serem ofuscados.

Essa postura é contrária ao papel do líder: desenvolver pessoas.

Grandes líderes formam outros líderes, não subordinados eternos.

A insegurança gera estagnação, rotatividade e clima tóxico.

Exemplo de liderança insegura:
Rogério evita delegar tarefas mais complexas a um funcionário talentoso porque teme que ele ""brilhe demais"". Ele bloqueia treinamentos e promoções, centraliza tudo e sufoca a equipe.

---

Indicadores e melhoria

Indicadores e melhoria

Indicadores ajudam a medir qualidade e melhoria contínua: quantidade de PIRs abertos, tempo de localização, tempo de entrega, reincidência por rota, reclamações, pendências por turno, casos encerrados e retrabalho. A liderança usa esses dados para corrigir falhas e treinar a equipe.

Material de apoio da trilha

Reflexos no ambiente:
Colaboradores ficam estagnados e desmotivados.

A inovação é sufocada por medo de ameaçar o ego do líder.

A equipe sente que não há espaço para crescimento.

Consequências:
Alta rotatividade de talentos.

Equipe dependente e sem autonomia.

Clima de medo e frustração constante.

Exemplo positivo:
André identifica um analista promissor e o incentiva a assumir novos desafios, mesmo que isso o coloque em evidência. André enxerga o sucesso do time como o seu sucesso.

⭐ Como age um líder ético:
Reconhece e incentiva o talento alheio.

Capacita a equipe para que cresça com autonomia.

Não se sente ameaçado pelo brilho dos outros."
" 4. Uso Indevido do Cargo: A Armadilha da Autopromoção
Liderança não é palco para vaidade pessoal.

Utilizar o cargo para autopromoção é antiético e destrói o respeito.

O verdadeiro líder promove o time, compartilha conquistas e assume erros.

A liderança é um serviço, não uma escada para interesses pessoais.

Exemplo de abuso de cargo:
Fernanda, coordenadora, se exibe em redes sociais com prêmios e conquistas que foram, na verdade, frutos do trabalho da equipe. Em reuniões, ela nunca divide os méritos.

Reflexos no ambiente:
Clima de ressentimento e descrédito.

A equipe se sente usada, não reconhecida.

Consequências:
A equipe perde o entusiasmo.

Há queda na entrega de resultados.

Pessoas evitam colaborar, já que o reconhecimento não é compartilhado.

Exemplo de conduta ética:
Marcos, gerente de projetos, sempre apresenta os resultados destacando o papel da equipe. Em eventos, chama membros do time para falar e receber elogios junto com ele.

⭐ Como age um líder ético:
Usa o cargo para servir, não para se autopromover.

Dá visibilidade ao time, compartilha conquistas.

Entende que sua missão é alavancar os outros.

5. Reflexão Final
“Liderar é influenciar com exemplo. A ética é o que diferencia chefes de verdadeiros líderes.”
— Reflita: você inspira ou apenas manda?"$mat_lideranca_bagagem_extraviada$),
('atendimento-pcd', $json_atendimento_pcd$[{"title":"Atendimento inclusivo","type":"Aula","duration":"16 min","content":"Atendimento inclusivo PcD\n\nPcD significa pessoa com deficiência. O atendimento inclusivo PcD exige respeito à autonomia, comunicação acessível, pergunta antes da ajuda e aplicação correta dos recursos disponíveis, sem infantilizar ou expor o passageiro.\n\nAtendimento inclusivo\n\nObjetivo do Curso\nCapacitar agentes de atendimento, operadores de solo, agentes de check-in, supervisores e colaboradores da aviação civil para prestar um atendimento respeitoso, eficiente, empático e acessível a clientes com deficiência e/ou necessidades especiais, promovendo a inclusão plena no ambiente aeroportuário.\"\n\"\n\nAtendimento inclusivo significa tratar a pessoa com deficiência com respeito, autonomia, segurança e clareza, sem infantilizar e sem falar apenas com o acompanhante."},{"title":"Base legal","type":"Consulta","duration":"14 min","content":"Base legal\n\nLei Brasileira de Inclusão (Lei 13.146/2015)\n\nResolução ANAC 280/2013\n\nConvenção da ONU sobre os Direitos das Pessoas com Deficiência\n\nExemplo prático:\nUm passageiro cadeirante não quer ajuda para embarcar. O agente respeita, permanece disponível, e só age com permissão. Isso é\n\nA Lei Brasileira de Inclusão, a Resolução ANAC 280/2013 e a Convenção da ONU sobre os Direitos das Pessoas com Deficiência orientam acessibilidade, assistência e respeito à autonomia do passageiro."},{"title":"Tipos de necessidades","type":"Aula","duration":"22 min","content":"Tipos de necessidades\n\nTipos de PcDs e Necessidades Especiais\nTipo \nVisual\nCegos, baixa visão \nComo agir\nFale ao se aproximar, ofereça o braço, descreva o ambiente\n\nTipo \nMotora\nCadeirantes, amputados, baixa mobilidade \nComo agir\nEvitar carregar sem autorização, oferecer ajuda com discrição\n\nTipo \nAuditiva\nSurdos, baixa audição\nComo agir\nUse escrita, mímica, Libras se possível, fale de frente\n\nTipo\nIntelectual/TEA\nAutismo, síndrome de Down\nComo agir\nFale com calma, evite toque inesperado, seja previsível\n\nOutros\nIdosos, gestantes, obesos, pessoas com pânico\nComo agir \nMantenha empatia, escute com atenção\n\n\"\n\" 3.\n\nNecessidades podem envolver mobilidade reduzida, deficiência visual, deficiência auditiva, deficiência intelectual, TEA, limitações temporárias, idosos, gestantes e passageiros que precisam de apoio individualizado."},{"title":"Boas praticas","type":"Pratica","duration":"22 min","content":"Boas práticas com recursos de acessibilidade\n\nBoas práticas incluem reconhecer os recursos disponíveis, como cadeira de rodas, acompanhamento, comunicação escrita, Libras quando disponível, balcões acessíveis e Ambulift para embarque ou desembarque seguro quando a ponte não atende a necessidade.\n\nBoas práticas\n\nChecklist do Atendimento de Qualidade a PcDs\n( ) Falei diretamente com a pessoa?\n\n( ) Perguntei antes de ajudar?\n\n( ) Usei linguagem respeitosa e clara?\n\n( ) Respeitei o tempo da pessoa?\n\n( ) Ofereci os\n\nPergunte antes de ajudar. Fale diretamente com o passageiro. Use linguagem simples e clara. Respeite recusas de ajuda. Não toque na cadeira de rodas, bengala, cão-guia ou pertences sem autorização. Preserve privacidade e dignidade."},{"title":"Recursos e casos reais","type":"Simulacao","duration":"20 min","content":"Recursos e casos reais\n\nRecursos de Acessibilidade no Aeroporto\nRecurso Aplicação\nAmbulift Embarque/desembarque de cadeirantes em aeronaves\nCadeira de rodas Apoio dentro do terminal\nBalcões rebaixados Atendimento acessível\nSinalização tátil/visual Autonomia para deficientes visuais\nLibras / Pictogramas Comunicação com surdos ou autistas\"\n\" 6. Casos Reais e Atendimento Exemplar\nCaso 1: Atendimento com empatia\nUma passageira cega é recebida com descrição do local, conduzida com respeito, informada sobre os procedimentos e deixada no portão. Ao final, elogia o agente por ser “presente, mas não invasivo”.\n\nCaso 2: Falha evitável\nUm passageiro com TEA emite sons no embarque e é repreendido. A equipe, sem preparo, o afasta. A companhia é multada. Depois, passa a treinar agentes sobre autismo com linguagem acolhedora.\n\"\n\" 7. Conduta Profissional e Humanização\nSeja:\nPaciente\n\nDiscreto\n\nObjetivo\n\nAmável\n\nAtento\n\nNunca:\nPressione\n\nRidicularize\n\nDuvide da capacidade da pessoa\n\nFale por ela\n\n\"\n\" 8. Checklist do Atendimento de Qualidade a PcDs\n( ) Falei diretamente com a pessoa?\n\n( ) Perguntei antes de ajudar?\n\n( ) Usei linguagem respeitosa e clara?\n\n( ) Respeitei o tempo da pessoa?\n\n( ) Ofereci os recursos disponíveis com descrição?\n\n( ) Finalizei o atendimento com acolhimento?\n\"\n\" Conclusão\nO respeito, empatia e preparo no atendimento a passageiros PcD é um marco da excelência no serviço aeroportuário. Pequenas atitudes constroem uma experiência de viagem digna e segura para todos.\n\nO agente de atendimento é a ponte entre o aeroporto e o cliente – e deve estar sempre pronto para servir com humanidade.\"\n\nRecursos de acessibilidade incluem Ambulift, cadeira de rodas, balcões rebaixados, Libras, escrita, pictogramas, sinalização tátil/visual e acompanhamento por agente capacitado. Casos reais mostram que falhas de abordagem, pressão ou ridicularização podem gerar constrangimento, risco operacional e responsabilização da empresa."}]$json_atendimento_pcd$::jsonb, $mat_atendimento_pcd$Atendimento inclusivo

Atendimento inclusivo PcD

PcD significa pessoa com deficiência. O atendimento inclusivo PcD exige respeito à autonomia, comunicação acessível, pergunta antes da ajuda e aplicação correta dos recursos disponíveis, sem infantilizar ou expor o passageiro.

Atendimento inclusivo

Objetivo do Curso
Capacitar agentes de atendimento, operadores de solo, agentes de check-in, supervisores e colaboradores da aviação civil para prestar um atendimento respeitoso, eficiente, empático e acessível a clientes com deficiência e/ou necessidades especiais, promovendo a inclusão plena no ambiente aeroportuário."
"

Atendimento inclusivo significa tratar a pessoa com deficiência com respeito, autonomia, segurança e clareza, sem infantilizar e sem falar apenas com o acompanhante.

---

Base legal

Base legal

Lei Brasileira de Inclusão (Lei 13.146/2015)

Resolução ANAC 280/2013

Convenção da ONU sobre os Direitos das Pessoas com Deficiência

Exemplo prático:
Um passageiro cadeirante não quer ajuda para embarcar. O agente respeita, permanece disponível, e só age com permissão. Isso é

A Lei Brasileira de Inclusão, a Resolução ANAC 280/2013 e a Convenção da ONU sobre os Direitos das Pessoas com Deficiência orientam acessibilidade, assistência e respeito à autonomia do passageiro.

---

Tipos de necessidades

Tipos de necessidades

Tipos de PcDs e Necessidades Especiais
Tipo 
Visual
Cegos, baixa visão 
Como agir
Fale ao se aproximar, ofereça o braço, descreva o ambiente

Tipo 
Motora
Cadeirantes, amputados, baixa mobilidade 
Como agir
Evitar carregar sem autorização, oferecer ajuda com discrição

Tipo 
Auditiva
Surdos, baixa audição
Como agir
Use escrita, mímica, Libras se possível, fale de frente

Tipo
Intelectual/TEA
Autismo, síndrome de Down
Como agir
Fale com calma, evite toque inesperado, seja previsível

Outros
Idosos, gestantes, obesos, pessoas com pânico
Como agir 
Mantenha empatia, escute com atenção

"
" 3.

Necessidades podem envolver mobilidade reduzida, deficiência visual, deficiência auditiva, deficiência intelectual, TEA, limitações temporárias, idosos, gestantes e passageiros que precisam de apoio individualizado.

---

Boas praticas

Boas práticas com recursos de acessibilidade

Boas práticas incluem reconhecer os recursos disponíveis, como cadeira de rodas, acompanhamento, comunicação escrita, Libras quando disponível, balcões acessíveis e Ambulift para embarque ou desembarque seguro quando a ponte não atende a necessidade.

Boas práticas

Checklist do Atendimento de Qualidade a PcDs
( ) Falei diretamente com a pessoa?

( ) Perguntei antes de ajudar?

( ) Usei linguagem respeitosa e clara?

( ) Respeitei o tempo da pessoa?

( ) Ofereci os

Pergunte antes de ajudar. Fale diretamente com o passageiro. Use linguagem simples e clara. Respeite recusas de ajuda. Não toque na cadeira de rodas, bengala, cão-guia ou pertences sem autorização. Preserve privacidade e dignidade.

---

Recursos e casos reais

Recursos e casos reais

Recursos de Acessibilidade no Aeroporto
Recurso Aplicação
Ambulift Embarque/desembarque de cadeirantes em aeronaves
Cadeira de rodas Apoio dentro do terminal
Balcões rebaixados Atendimento acessível
Sinalização tátil/visual Autonomia para deficientes visuais
Libras / Pictogramas Comunicação com surdos ou autistas"
" 6. Casos Reais e Atendimento Exemplar
Caso 1: Atendimento com empatia
Uma passageira cega é recebida com descrição do local, conduzida com respeito, informada sobre os procedimentos e deixada no portão. Ao final, elogia o agente por ser “presente, mas não invasivo”.

Caso 2: Falha evitável
Um passageiro com TEA emite sons no embarque e é repreendido. A equipe, sem preparo, o afasta. A companhia é multada. Depois, passa a treinar agentes sobre autismo com linguagem acolhedora.
"
" 7. Conduta Profissional e Humanização
Seja:
Paciente

Discreto

Objetivo

Amável

Atento

Nunca:
Pressione

Ridicularize

Duvide da capacidade da pessoa

Fale por ela

"
" 8. Checklist do Atendimento de Qualidade a PcDs
( ) Falei diretamente com a pessoa?

( ) Perguntei antes de ajudar?

( ) Usei linguagem respeitosa e clara?

( ) Respeitei o tempo da pessoa?

( ) Ofereci os recursos disponíveis com descrição?

( ) Finalizei o atendimento com acolhimento?
"
" Conclusão
O respeito, empatia e preparo no atendimento a passageiros PcD é um marco da excelência no serviço aeroportuário. Pequenas atitudes constroem uma experiência de viagem digna e segura para todos.

O agente de atendimento é a ponte entre o aeroporto e o cliente – e deve estar sempre pronto para servir com humanidade."

Recursos de acessibilidade incluem Ambulift, cadeira de rodas, balcões rebaixados, Libras, escrita, pictogramas, sinalização tátil/visual e acompanhamento por agente capacitado. Casos reais mostram que falhas de abordagem, pressão ou ridicularização podem gerar constrangimento, risco operacional e responsabilização da empresa.$mat_atendimento_pcd$),
('interpretacao-etiqueta-bagagem', $json_interpretacao_etiqueta_bagagem$[{"title":"Funcao da etiqueta","type":"Aula","duration":"12 min","content":"Funcao da etiqueta\n\nObjetivo da trilha\nCompreender a funcao da etiqueta de bagagem no transporte aereo e sua importancia para rastreabilidade, despacho correto e tratativa de irregularidades.\n\nA etiqueta de bagagem e o principal documento operacional da mala. Sem uma etiqueta valida, a bagagem perde sua identificacao formal no fluxo aeroportuario e se torna muito mais dificil de rastrear. Ela e emitida no check-in para bagagens despachadas e acompanha a mala desde a entrega pelo passageiro ate a restituicao no destino.\n\nA etiqueta identifica a bagagem, orienta o sistema automatizado, apoia a leitura humana dos agentes e permite conectar a mala ao passageiro, ao voo, ao itinerario e aos registros de irregularidade. Tudo o que acontece com a mala - despacho, conexao, falha de carregamento, envio incorreto, extravio, localizacao ou devolucao - depende das informacoes impressas e registradas nessa etiqueta.\n\nNa operacao diaria, o agente deve entender que a etiqueta nao e apenas um adesivo. Ela e uma chave operacional. Uma leitura incorreta pode gerar despacho para destino errado, perda de conexao, criacao equivocada de AHL/OHD, demora na busca e insatisfacao do passageiro.\n\nPontos essenciais\n- A etiqueta identifica a bagagem despachada.\n- A etiqueta orienta a triagem e o carregamento.\n- A etiqueta permite rastreabilidade em sistemas de bagagem.\n- A etiqueta ajuda a comprovar origem, destino e conexoes.\n- A etiqueta deve ser protegida, lida e registrada corretamente.\n\nExemplo operacional\nUm passageiro desembarca e informa que sua mala nao chegou. Antes de qualquer conclusao, o agente confere o comprovante de bagagem, identifica o numero da etiqueta e usa esse dado como referencia principal para busca e abertura do registro de irregularidade."},{"title":"Estrutura da etiqueta","type":"Consulta","duration":"16 min","content":"Estrutura da etiqueta\n\nObjetivo da trilha\nIdentificar os principais campos de uma etiqueta de bagagem e compreender como cada informacao apoia a operacao.\n\nUma etiqueta de bagagem normalmente contem informacoes destinadas a leitura automatizada e leitura humana. O sistema de triagem utiliza o codigo de barras para direcionar a mala, enquanto os agentes utilizam campos impressos para conferencia visual, orientacao, reetiquetagem e investigacao.\n\nCampos principais\n- Codigo de barras: permite leitura automatizada no sistema de triagem.\n- LPN ou TN: numero unico de identificacao da bagagem.\n- Companhia emissora: indica quem emitiu a etiqueta.\n- Codigo IATA dos aeroportos: identifica origem, conexoes e destino.\n- Voo e data: ajudam a confirmar o trecho operacional.\n- Nome ou referencia do passageiro: quando disponivel, auxilia na associacao com a viagem.\n- Stub ou comprovante: parte entregue ao passageiro para conferencias futuras.\n\nA leitura deve ser feita com calma. Em momentos de pressa, e comum olhar apenas o destino mais visivel e ignorar conexoes. Esse erro pode direcionar a mala para um ponto intermediario ou fazer o agente interpretar destino final como origem.\n\nBoa pratica\nSempre confira tres elementos juntos: numero da etiqueta, rota e destino final. Se houver conexao, valide a sequencia completa antes de orientar, separar ou enviar a bagagem."},{"title":"LPN e rastreabilidade","type":"Aula","duration":"14 min","content":"LPN e rastreabilidade\n\nObjetivo da trilha\nEntender o papel do License Plate Number na identificacao unica da bagagem.\n\nLPN significa License Plate Number. Na pratica, e a placa de identificacao da mala dentro da operacao. Assim como um veiculo possui uma placa unica, a bagagem despachada possui um numero que permite rastrear eventos, localizar registros, abrir irregularidades e vincular a mala ao passageiro.\n\nO LPN pode aparecer junto ao codigo de barras e tambem em formato numerico ou alfanumerico, dependendo do padrao utilizado. Em muitos processos operacionais, ele tambem e chamado de TN, Bag Tag Number ou numero da etiqueta.\n\nPor que conferir o LPN\n- Evita abrir processo com numero errado.\n- Ajuda a localizar mensagens de encaminhamento.\n- Permite comparar AHL, OHD e registros de carregamento.\n- Reduz risco de entregar mala errada.\n- Ajuda em auditoria e historico operacional.\n\nSituacoes em que o LPN e essencial\n- Passageiro sem bagagem no desembarque.\n- Mala localizada sem passageiro.\n- Bagagem enviada por rush.\n- Reetiquetagem por falha, dano ou alteracao de rota.\n- Conferencia de entrega ao passageiro.\n\nErro comum\nCopiar apenas parte do numero ou confundir caracteres parecidos. Sempre confirme o numero com o comprovante, com a etiqueta fisica e com o sistema antes de salvar um processo."},{"title":"Codigos IATA de aeroporto","type":"Consulta","duration":"14 min","content":"Codigos IATA de aeroporto\n\nObjetivo da trilha\nReconhecer os codigos IATA impressos na etiqueta e interpretar sua funcao na rota.\n\nOs codigos IATA de aeroporto possuem tres letras e identificam aeroportos ou cidades na operacao aerea. Eles aparecem na etiqueta para indicar origem, conexoes e destino final. Exemplos comuns incluem GRU, GIG, REC, CWB, MIA, JFK, LHR e CDG.\n\nEsses codigos sao essenciais porque permitem leitura rapida por agentes, sistemas automatizados e equipes de rampa. Um erro de interpretacao pode levar a bagagem para aeroporto incorreto, causar atraso na conexao ou gerar abertura indevida de irregularidade.\n\nComo interpretar\n- Verifique todos os aeroportos impressos.\n- Identifique qual e a origem.\n- Localize conexoes intermediarias.\n- Confirme o destino final.\n- Compare a etiqueta com o itinerario do passageiro.\n\nExemplo\nUma etiqueta apresenta CWB, GRU e MIA. Se lida de forma correta, a sequencia indica que a bagagem saiu de CWB, conectou em GRU e tem destino final MIA. Se o agente ler de cima para baixo sem criterio, pode interpretar o destino como origem e direcionar a tratativa de forma errada.\n\nPonto de atencao\nAlguns aeroportos e cidades podem gerar confusao por siglas parecidas. Sempre confira a rota completa, nao apenas um codigo isolado."},{"title":"Leitura correta da rota","type":"Pratica guiada","duration":"18 min","content":"Leitura correta da rota\n\nObjetivo da trilha\nAplicar a regra operacional critica: a rota impressa na etiqueta deve ser lida de baixo para cima.\n\nA leitura correta da rota e uma das competencias mais importantes na interpretacao de etiqueta de bagagem. Em muitas etiquetas, a sequencia de aeroportos aparece verticalmente. A regra operacional e ler de baixo para cima.\n\nRegra pratica\n- Parte inferior: origem da bagagem.\n- Parte central: conexao ou conexoes.\n- Parte superior: destino final.\n\nEssa regra evita um dos erros mais comuns: ler a etiqueta de cima para baixo e inverter a rota. Quando isso acontece, o agente pode achar que a mala deveria ir para a origem, quando na verdade a origem esta na parte inferior da etiqueta.\n\nExemplo guiado\nSe a etiqueta apresenta, de cima para baixo:\nMIA\nGRU\nCWB\n\nA leitura correta e CWB/GRU/MIA. A mala saiu de CWB, conecta em GRU e segue para MIA.\n\nAplicacao no atendimento\nAo receber uma reclamação de bagagem, o agente deve comparar o itinerario informado pelo passageiro com a leitura de baixo para cima da etiqueta. Se houver divergencia, deve investigar antes de registrar conclusoes no sistema.\n\nPonto de atencao\nA excelencia operacional comeca na leitura correta da etiqueta. Quando a rota e compreendida corretamente, o agente melhora a busca, reduz retrabalho e orienta o passageiro com mais seguranca."},{"title":"Bagagem prioritaria, rush e reetiquetada","type":"Procedimento","duration":"16 min","content":"Bagagem prioritaria, rush e reetiquetada\n\nObjetivo da trilha\nIdentificar etiquetas em condicoes operacionais diferenciadas e entender os cuidados de conferencia.\n\nNem toda etiqueta representa uma bagagem em fluxo normal. Algumas malas recebem tratamento especial por prioridade, atraso, reenvio, reetiquetagem ou irregularidade. Esses casos exigem atencao redobrada, porque normalmente envolvem prazo curto, passageiro aguardando, conexao sensivel ou historico de falha anterior.\n\nBagagem prioritaria\nIndica necessidade de tratamento diferenciado, normalmente ligada ao perfil do passageiro, classe de servico, conexao ou processo operacional. Deve ser separada e carregada conforme regra local.\n\nBagagem rush\nE usada quando a bagagem nao seguiu no voo original ou precisa ser encaminhada posteriormente. A etiqueta rush deve estar associada a uma mensagem ou registro que justifique o envio, informando voo, rota, data e destino.\n\nBagagem reetiquetada\nOcorre quando a etiqueta original precisa ser substituida por dano, falha de leitura, alteracao de voo ou redirecionamento. A reetiquetagem deve preservar rastreabilidade e evitar duplicidade de informacao.\n\nBagagem irregular\nPode envolver etiqueta ilegivel, rota divergente, tag danificada, bagagem sem comprovante claro ou mala localizada fora do fluxo esperado. Nesses casos, o agente deve investigar antes de enviar ou entregar.\n\nChecklist rapido\n- Conferir LPN/TN.\n- Conferir rota de baixo para cima.\n- Confirmar destino final.\n- Validar voo/data.\n- Verificar se ha mensagem operacional relacionada.\n- Registrar qualquer divergencia no historico apropriado."},{"title":"Fluxo operacional da bagagem","type":"Simulacao","duration":"16 min","content":"Fluxo operacional da bagagem\n\nObjetivo da trilha\nVisualizar o caminho da bagagem desde o check-in ate a restituicao ao passageiro.\n\nO fluxo operacional da bagagem comeca no check-in, quando a mala e pesada, aceita e etiquetada. A partir desse momento, a etiqueta passa a orientar todas as etapas seguintes.\n\nEtapas do fluxo\n1. Check-in e emissao da etiqueta.\n2. Entrega da bagagem ao sistema de triagem.\n3. Leitura automatizada do codigo de barras.\n4. Separacao por voo, destino ou conexao.\n5. Transporte ate a aeronave correta.\n6. Carregamento no porao ou equipamento previsto.\n7. Transferencia em conexoes, quando houver.\n8. Descarregamento no destino.\n9. Restituicao ao passageiro.\n\nEm cada etapa, a etiqueta pode ser lida por sistema, agente ou equipe operacional. Por isso, a qualidade da impressao, fixacao e conferencia da etiqueta influencia diretamente o resultado final.\n\nRiscos operacionais\n- Codigo de barras danificado.\n- Etiqueta mal fixada.\n- Leitura incorreta da rota.\n- Bagagem separada no pier errado.\n- Perda de conexao por atraso no manuseio.\n- Falha de comunicacao entre areas.\n\nMensagem principal\nPor tras de cada mala entregue corretamente, existe uma cadeia de profissionais que interpretou e executou corretamente as informacoes da etiqueta."},{"title":"Boas praticas e erros comuns","type":"Exercicio","duration":"19 min","content":"Boas praticas e erros comuns\n\nObjetivo da trilha\nPadronizar condutas para reduzir falhas operacionais ligadas a leitura e registro de etiqueta.\n\nBoas praticas\n- Conferir sempre o destino final antes de despachar.\n- Ler a rota de baixo para cima.\n- Confirmar conexoes quando existirem.\n- Usar o LPN/TN como referencia principal.\n- Guardar e orientar o passageiro sobre o comprovante da bagagem.\n- Registrar corretamente o numero da etiqueta em AHL, OHD, DPR ou outro processo.\n- Investigar etiquetas ilegíveis, rasgadas ou divergentes antes de concluir a tratativa.\n\nErros comuns\n- Ler a rota de cima para baixo.\n- Copiar numero incompleto da etiqueta.\n- Confundir aeroporto de conexao com destino final.\n- Ignorar etiqueta rush ou reetiquetagem.\n- Entregar mala sem conferir etiqueta e documento.\n- Abrir processo sem validar o comprovante do passageiro.\n\nConduta esperada\nQuando houver duvida, o agente deve parar, conferir e registrar. A pressa nao pode substituir a verificacao. A etiqueta de bagagem concentra informacoes essenciais, e sua leitura correta protege o passageiro, a operacao e a credibilidade do atendimento.\n\nResumo final\nA correta interpretacao da etiqueta garante rastreabilidade, fluidez operacional e integridade do servico. O profissional que domina LPN, codigos IATA, leitura de rota e situacoes especiais reduz extravios e atua com mais seguranca."}]$json_interpretacao_etiqueta_bagagem$::jsonb, $mat_interpretacao_etiqueta_bagagem$Funcao da etiqueta

Funcao da etiqueta

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

---

Estrutura da etiqueta

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

---

LPN e rastreabilidade

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

---

Codigos IATA de aeroporto

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

---

Leitura correta da rota

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

---

Bagagem prioritaria, rush e reetiquetada

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

---

Fluxo operacional da bagagem

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

---

Boas praticas e erros comuns

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
A correta interpretacao da etiqueta garante rastreabilidade, fluidez operacional e integridade do servico. O profissional que domina LPN, codigos IATA, leitura de rota e situacoes especiais reduz extravios e atua com mais seguranca.$mat_interpretacao_etiqueta_bagagem$),
('gestao-pessoas-rampa', $json_gestao_pessoas_rampa$[{"title":"Fundamentos da gestao na rampa","type":"Aula","duration":"20 min","content":"Fundamentos da gestao na rampa\n\nObjetivo da trilha\nCompreender o papel do lider de rampa como facilitador, exemplo operacional e ponto de equilibrio entre pontualidade, seguranca e comportamento da equipe.\n\nA operacao de rampa exige lideranca presente. O lider nao atua apenas distribuindo tarefas: ele observa o ambiente, antecipa riscos, organiza prioridades, acompanha a execucao e garante que a equipe tenha condicoes reais de trabalhar com seguranca. Quando a lideranca esta distante, pequenos desvios se transformam em habitos, atrasos se repetem e a equipe perde referencia.\n\nImpacto da lideranca\nA postura do lider influencia diretamente pontualidade, seguranca operacional, uso correto dos equipamentos, cumprimento de padroes e clima da equipe. Uma equipe que percebe presenca, clareza e justica tende a responder melhor sob pressao.\n\nO lider como facilitador\nSer facilitador significa remover obstaculos para a equipe executar bem. Isso inclui conferir escala, checar equipamentos, confirmar prioridades do voo, organizar alocacao de pessoas, ouvir alertas da equipe e agir antes que o problema cresca.\n\nBons exemplos\n- Chegar antes do pico operacional, conferir escala, equipamentos e informacoes do voo.\n- Fazer briefing claro de 5 minutos antes da operacao.\n- Reconhecer um operador que agiu preventivamente e evitou incidente.\n- Distribuir tarefas de forma equilibrada, evitando sobrecarregar sempre as mesmas pessoas.\n- Acompanhar a operacao no patio, com gestao por presenca.\n\nMaus exemplos\n- Permanecer no escritorio sem acompanhar a operacao.\n- Dar ordens sem explicar prioridade, risco ou criterio.\n- Atribuir sempre tarefas pesadas para os mesmos colaboradores.\n- Ignorar sugestoes da equipe.\n- Cobrar resultado sem oferecer orientacao ou recursos.\n\nChecklist de lideranca antes da operacao\n- Escala conferida.\n- Equipamentos disponiveis e em condicao de uso.\n- Briefing realizado.\n- Riscos do turno comunicados.\n- Responsaveis por tarefas criticas definidos.\n- Canal de comunicacao confirmado.\n\nPratica recomendada\nAo iniciar o turno, o lider deve reunir a equipe rapidamente e responder: qual e o foco do turno, quais voos exigem atencao, quais riscos existem, quem faz cada tarefa e como comunicar desvios. Esse pequeno ritual reduz improviso e aumenta previsibilidade."},{"title":"Comunicacao assertiva no patio","type":"Pratica guiada","duration":"18 min","content":"Comunicacao assertiva no patio\n\nObjetivo da trilha\nAplicar comunicacao clara, curta e respeitosa em ambiente operacional de alta pressao, especialmente no uso de radio, orientacao de equipe e feedback imediato.\n\nAssertividade e comunicar com clareza e respeito. Na rampa, a comunicacao precisa ser objetiva, porque o ambiente envolve ruido, tempo curto, deslocamento de equipamentos, risco operacional e necessidade de resposta rapida. Ser assertivo nao e gritar; e dizer o que precisa ser feito, por quem, onde e em quanto tempo.\n\nRegra dos 3 Cs\n- Clareza: a mensagem deve dizer exatamente o que precisa acontecer.\n- Concisao: usar poucas palavras, sem explicacao longa no radio.\n- Confirmacao: garantir que o receptor entendeu e assumiu a acao.\n\nUso correto do radio\nMensagens por radio devem evitar ambiguidades. Uma mensagem vaga obriga o outro lado a adivinhar, aumenta retrabalho e pode gerar risco. Sempre que possivel, use identificacao da equipe, equipamento, posicao, acao e prazo.\n\nBom exemplo de mensagem\nEquipe 23, loader avariado. Mover para posicao 114 em 2 minutos.\n\nPor que funciona\nA mensagem informa quem deve agir, qual e o problema, qual e a acao esperada, para onde deve ir e em quanto tempo.\n\nMau exemplo de mensagem\nVai la ver o negocio no aviao.\n\nPor que falha\nNao informa equipe, problema, local exato, prioridade nem prazo. Em operacao real, esse tipo de mensagem gera atraso e confusao.\n\nFeedback imediato e construtivo\nQuando houver erro, o lider deve corrigir o comportamento e explicar o procedimento correto. O foco deve ser seguranca e padrao, nao humilhacao. Feedback assertivo combina fato, impacto e orientacao.\n\nModelo pratico\n- Fato: observei que o equipamento foi posicionado fora da area combinada.\n- Impacto: isso aumenta risco de interferencia na operacao.\n- Orientacao: reposicione para a area marcada e confirme pelo radio.\n\nCondutas que devem ser evitadas\n- Sarcasmo ou ironia.\n- Gritos sem orientacao.\n- Mensagens longas no radio.\n- Exposicao publica desnecessaria.\n- Frases como voces sempre fazem errado.\n\nPadronizacao de termos\nA equipe deve usar termos comuns para posicoes, equipamentos, atrasos, avarias e prioridades. Quando cada pessoa usa uma palavra diferente para o mesmo problema, o risco de interpretacao aumenta.\n\nExercicio de aplicacao\nTransforme mensagens vagas em mensagens assertivas. Exemplo: troque arruma isso ai por equipe de carregamento, conferir travamento do carrinho na posicao 2 e confirmar quando concluido."},{"title":"Mudanca de cultura e osmose operacional","type":"Aula","duration":"20 min","content":"Mudanca de cultura e osmose operacional\n\nObjetivo da trilha\nEntender como praticas erradas se espalham por repeticao e como o lider pode criar uma cultura operacional positiva, segura e padronizada.\n\nOsmose operacional e o aprendizado informal por convivencia. Um novo colaborador observa a equipe e tende a repetir aquilo que ve, mesmo quando o comportamento nao esta escrito em procedimento. Se ele ve atalho inseguro, comunicacao ruim ou improviso constante, pode entender que aquilo e o padrao aceito.\n\nPor que isso e perigoso\nA rampa e um ambiente em que pequenos desvios podem virar rotina. Uma pratica incorreta tolerada hoje pode ser ensinada sem querer para novos colaboradores amanha. Quando a lideranca nao corrige, a equipe interpreta o silencio como permissao.\n\nPapel do lider na cultura\nO lider deve ser filtro de comportamento. Isso significa reforcar boas praticas, corrigir desvios no momento certo, explicar o motivo do padrao e escolher mentores positivos para novos colaboradores.\n\nBons exemplos\n- Novo colaborador aprende posicionamento correto de cones desde o primeiro dia.\n- Lider corrige imediatamente manuseio incorreto de equipamento.\n- Mentor experiente demonstra o procedimento e explica o risco de atalhos.\n- Reuniao semanal reforca padroes observados no turno.\n- Boas praticas sao reconhecidas publicamente.\n\nMaus exemplos\n- Novo colaborador aprende atalho perigoso pela pista.\n- Lider ignora erro recorrente para evitar conversa dificil.\n- Colaborador antigo ensina que sempre foi feito assim.\n- A equipe valoriza velocidade mesmo quando o procedimento e quebrado.\n\nMentoria positiva\nA escolha de quem acompanha novos colaboradores e decisiva. Nem sempre o colaborador mais antigo e o melhor mentor. O mentor deve ter postura segura, paciencia, dominio do processo e compromisso com o padrao.\n\nComo corrigir sem desmotivar\nCorrecao imediata nao precisa ser agressiva. A melhor abordagem e parar o desvio, explicar o risco, demonstrar o padrao correto e acompanhar a proxima execucao.\n\nRoteiro de correcao\n1. Interrompa o comportamento inseguro.\n2. Explique o risco operacional.\n3. Mostre o procedimento correto.\n4. Peca confirmacao de entendimento.\n5. Acompanhe a repeticao correta.\n\nMensagem principal\nCultura operacional e construida em detalhes. O que o lider tolera, a equipe repete. O que o lider reforca, a equipe aprende."},{"title":"Desenvolvimento continuo na operacao","type":"Consulta","duration":"20 min","content":"Desenvolvimento continuo na operacao\n\nObjetivo da trilha\nCriar uma rotina de aprendizado constante na rampa, usando microtreinamentos, indicadores tecnicos e comportamentais, metas e acompanhamento de evolucao.\n\nDesenvolvimento continuo e a pratica de aprender e melhorar todos os dias. Na operacao, conhecimento parado vira risco. Procedimentos mudam, equipamentos variam, equipes se renovam e cenarios de pressao exigem preparo permanente.\n\nAprender na rotina\nTreinamento nao precisa ocorrer apenas em sala. A rampa permite microaprendizados: antes do turno, apos uma falha, durante uma reciclagem rapida ou em reunioes curtas. O importante e transformar ocorrencias reais em aprendizado.\n\nBons exemplos\n- Operador busca material para melhorar tecnica.\n- Supervisor oferece microtreinamento de 10 a 15 minutos antes de um pico.\n- Lider revisa um incidente e transforma em checklist.\n- Equipe acompanha indicador de atraso, retrabalho ou avaria.\n- Colaborador experiente compartilha pratica segura com novatos.\n\nMaus exemplos\n- Ja faco isso ha 10 anos, nao preciso aprender de novo.\n- Recusar reciclagem.\n- Ignorar indicador de falha recorrente.\n- Treinar apenas quando ocorre acidente ou auditoria.\n- Medir desempenho sem orientar melhoria.\n\nIndicadores tecnicos e comportamentais\nIndicadores ajudam o lider a enxergar fatos, nao apenas percepcoes. Alem de pontualidade, podem ser acompanhados: cumprimento de briefing, uso correto de EPI, reporte de riscos, retrabalho, avarias, absenteismo, participacao em treinamentos e aderencia a padroes.\n\nMetas trimestrais\nMetas curtas ajudam a equipe a visualizar evolucao. Exemplo: reduzir retrabalho de carregamento, aumentar reportes preventivos, melhorar cumprimento de checklist ou diminuir falhas de comunicacao no radio.\n\nPainel de KPIs\nUm painel simples e visivel pode mostrar resultado do turno, pendencias, pontos de atencao e evolucao. O objetivo nao e expor pessoas, mas orientar o time.\n\nMicrotreinamento sugerido\nTema: comunicacao por radio.\nDuracao: 10 minutos.\nAtividade: cada colaborador transforma uma mensagem vaga em mensagem assertiva.\nFechamento: padronizar 3 frases que a equipe passara a usar no turno.\n\nMensagem principal\nEquipe que aprende continuamente erra menos, comunica melhor e responde com mais maturidade em situacoes de pressao."},{"title":"Conflitos e seguranca psicologica","type":"Simulacao","duration":"22 min","content":"Conflitos e seguranca psicologica\n\nObjetivo da trilha\nGerenciar conflitos de forma construtiva e criar ambiente em que a equipe possa reportar riscos, duvidas e falhas sem medo de punicao injusta.\n\nConflitos na rampa podem surgir por pressao de tempo, distribuicao desigual de tarefas, falhas de comunicacao, cansaco, disputa por equipamento, divergencia entre setores ou percepcao de injustica. Ignorar conflito raramente resolve; normalmente ele reaparece em momento mais critico.\n\nMediacao construtiva\nO lider deve ouvir as partes, separar fato de interpretacao, identificar impacto operacional e propor encaminhamento. O objetivo nao e escolher um vencedor, mas restaurar cooperacao e proteger a operacao.\n\nSeguranca psicologica\nSeguranca psicologica significa que as pessoas se sentem autorizadas a falar sobre risco, erro, duvida ou sugestao sem medo de humilhacao ou punicao injusta. Isso nao elimina responsabilidade; pelo contrario, aumenta a chance de o risco ser comunicado cedo.\n\nBons exemplos\n- Lider intervem para redistribuir recursos e explica a decisao.\n- Colaborador reporta risco sem medo.\n- Equipe informa falha de equipamento antes de ocorrer incidente.\n- Lider agradece reporte preventivo e corrige o processo.\n- Feedback mensal permite falar de conflitos recorrentes.\n\nMaus exemplos\n- Lider ignora discussao no patio.\n- Punir quem reporta falha sem avaliar contexto.\n- Ridicularizar duvidas de novo colaborador.\n- Resolver conflito apenas com ameaca.\n- Permitir apelidos ou comentarios que desrespeitam a equipe.\n\nTecnica ouvir-entender-agir\nOuvir: deixe a pessoa relatar o fato sem interrupcao inicial.\nEntender: confirme o que aconteceu, onde, quando e qual impacto.\nAgir: defina a acao, responsavel e prazo.\n\nCanal seguro de reporte\nA equipe deve saber como comunicar problema de equipamento, desvio de seguranca, comportamento inadequado ou risco operacional. O canal pode ser uma rotina de briefing, formulario interno, lider do turno ou reuniao mensal.\n\nExercicio pratico\nSimule uma operacao com tres problemas simultaneos: equipamento indisponivel, atraso em voo critico e discussao entre colaboradores. O participante deve definir prioridade, mensagem ao time, acao imediata e registro necessario.\n\nMensagem principal\nConflito bem conduzido vira aprendizado. Conflito ignorado vira risco. Um lider assertivo protege pessoas, processo e seguranca."}]$json_gestao_pessoas_rampa$::jsonb, $mat_gestao_pessoas_rampa$Fundamentos da gestao na rampa

Fundamentos da gestao na rampa

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

---

Comunicacao assertiva no patio

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

---

Mudanca de cultura e osmose operacional

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

---

Desenvolvimento continuo na operacao

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

---

Conflitos e seguranca psicologica

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
Conflito bem conduzido vira aprendizado. Conflito ignorado vira risco. Um lider assertivo protege pessoas, processo e seguranca.$mat_gestao_pessoas_rampa$)
)
update public.academy_courses as c
set
    modules = u.modules,
    material = u.material
from course_content_update as u
where c.id = u.id;

-- Cursos neste lote:
-- lideranca-bagagem-extraviada
-- atendimento-pcd
-- interpretacao-etiqueta-bagagem
-- gestao-pessoas-rampa
