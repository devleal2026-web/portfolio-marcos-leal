-- Lote 06: restaura conteudo completo dos cursos no Supabase.
-- Execute este arquivo no SQL Editor do Supabase.

with course_content_update(id, modules, material) as (
values
('restituicao-bagagem-sla', $json_restituicao_bagagem_sla$[{"title":"Objetivo da restituição","type":"Aula","duration":"14 min","content":"Objetivo da restituição\n\nObjetivo da trilha\nCompreender o que é restituição de bagagem, por que o SLA existe e como o tempo de entrega afeta a experiência do passageiro.\n\nRestituição de bagagem é o conjunto de etapas que começa após a chegada da aeronave e termina quando a bagagem é disponibilizada na esteira correta para retirada pelo passageiro. A operação envolve descarga do porão, separação dos volumes, transporte por tratores e carretas, entrada no BHS ou área de triagem, direcionamento para a esteira e acompanhamento até a entrega.\n\nO passageiro percebe o resultado da operação pela espera na área de restituição. Mesmo que a descarga tenha sido eficiente, se o transporte, o BHS ou a esteira demorarem, a percepção será de falha. Por isso, o SLA não pode ser visto apenas como um número contratual. Ele é um indicador direto de fluidez operacional, previsibilidade e qualidade de atendimento.\n\nO que deve ser controlado\n- Horário de chegada da aeronave.\n- Início e fim da descarga.\n- Saída da primeira carreta ou equipamento equivalente.\n- Chegada das bagagens ao BHS ou ponto de restituição.\n- Início da entrega na esteira.\n- Interrupções, congestionamentos e mudança de esteira.\n- Horário de encerramento da restituição.\n\nResponsabilidades integradas\nA restituição depende de rampa, BHS, serviço de bagagem, supervisão, centro de controle e atendimento ao passageiro. Quando cada área atua isoladamente, o tempo se perde em transições. Quando existe coordenação pré-chegada, a operação ganha minutos importantes.\n\nConduta esperada do agente\nO agente deve acompanhar o status da chegada, manter contato com a operação, orientar passageiros quando houver atraso e registrar informações relevantes. A comunicação deve ser objetiva: informar que a equipe está atuando, evitar promessas sem confirmação e atualizar quando houver mudança real.\n\nExemplo operacional\nUm voo chega em posição próxima, com baixa demanda e esteira livre. O risco de atraso é baixo. Outro voo chega em posição distante, em horário de pico e com esteiras ocupadas. Mesmo com a mesma quantidade de bagagens, o segundo voo exige plano especial para cumprir o SLA.\n\nMensagem principal\nRestituição eficiente não acontece por acaso. Ela depende de preparação, leitura de risco, início rápido do transporte e registro fiel dos tempos."},{"title":"Distância, percurso e risco","type":"Procedimento","duration":"16 min","content":"Distância, percurso e risco\n\nObjetivo da trilha\nRelacionar distância operacional, tempo médio de percurso e risco de descumprimento do SLA.\n\nO tempo de restituição é diretamente afetado pela distância entre a posição da aeronave e a entrada do BHS ou ponto de entrega. Em aeroportos de médio e grande porte, duas aeronaves podem pousar no mesmo horário, mas gerar riscos completamente diferentes porque uma está próxima da restituição e outra em uma posição remota ou em píer distante.\n\nClassificação genérica de percurso\n- Percurso curto: normalmente baixo risco, com alta previsibilidade.\n- Percurso médio: risco moderado, sensível a atraso de descarga ou trânsito interno.\n- Percurso médio/longo: risco crescente, principalmente se houver congestionamento de vias internas.\n- Percurso longo: alto risco, exigindo início imediato do transporte e maior disponibilidade de equipamentos.\n- Percurso muito longo: risco crítico, pois pode comprometer o SLA mesmo quando a descarga é eficiente.\n\nVariáveis que alteram o risco\nA distância física é apenas uma parte do problema. O risco aumenta quando existem filas de equipamentos, cruzamento de fluxos, restrição de via, baixa disponibilidade de carretas, equipe reduzida, aeronave com grande volume de bagagem, chegada simultânea de voos e esteiras ocupadas.\n\nAplicação prática\nAntes da chegada, a supervisão deve identificar a posição prevista da aeronave e estimar o risco. Se a posição for distante, o time deve preparar equipamento, alinhar prioridade, liberar rota interna quando possível e evitar que o primeiro transporte seja iniciado tarde.\n\nExemplo de leitura operacional\nUm voo em posição próxima pode ter percurso médio de 5 a 9 minutos. Um voo em extremidade ou posição remota pode exigir 15 a 22 minutos apenas de deslocamento. Se a descarga consumir 20 minutos e o BHS/esteira consumir mais 5 minutos, o voo distante já fica muito próximo de um SLA de 45 minutos.\n\nPonto de atenção\nPercurso longo não significa falha. A falha ocorre quando o risco conhecido não é tratado com antecedência.\n\nMensagem principal\nQuanto maior a distância, maior deve ser a antecipação. O tempo perdido antes da primeira carreta raramente é recuperado no fim do processo."},{"title":"Classificação operacional","type":"Consulta","duration":"16 min","content":"Classificação operacional\n\nObjetivo da trilha\nAprender a classificar voos por risco e aplicar ações proporcionais antes da não conformidade acontecer.\n\nA classificação operacional transforma dados simples em decisão. Em vez de tratar todos os voos da mesma forma, a equipe classifica cada chegada conforme risco de descumprimento do SLA. Isso ajuda a priorizar pessoas, equipamentos e comunicação.\n\nNíveis de risco\nBaixo risco: posição próxima, percurso curto, operação simples, baixa interferência e esteira disponível.\n\nRisco moderado: percurso médio, operação estável, mas sensível a atraso de descarga, volume de bagagens ou pequeno congestionamento.\n\nRisco crescente: distância média/longa, possibilidade de fila interna, necessidade de coordenação e acompanhamento mais próximo.\n\nAlto risco: posição distante, percurso longo, pico operacional, alto volume de bagagem ou necessidade de mais carretas.\n\nRisco crítico: posição muito distante, congestionamento, muitas chegadas simultâneas, voos internacionais ou qualquer combinação que deixe pouca margem para erro.\n\nCritérios de avaliação\n- Posição da aeronave.\n- Tipo de voo e volume estimado de bagagens.\n- Quantidade de equipamentos disponíveis.\n- Quantidade de colaboradores no turno.\n- Tempo médio de percurso até o BHS.\n- Esteira prevista e ocupação das esteiras.\n- Existência de voos críticos no mesmo intervalo.\n- Histórico de atrasos daquele período.\n\nComo usar a classificação\nA classificação deve ser usada antes da chegada. Voos de alto risco precisam de alerta operacional, confirmação de equipamento, acompanhamento da primeira carreta e plano de contingência. Voos de baixo risco podem seguir fluxo padrão, mantendo monitoramento normal.\n\nRecomendações para alto risco\n- Aumentar disponibilidade de carretas ou viagens.\n- Iniciar transporte assim que houver volume viável.\n- Designar acompanhamento de supervisão.\n- Confirmar esteira antes da chegada das primeiras bagagens.\n- Comunicar o serviço de bagagem em caso de atraso provável.\n\nMensagem principal\nClassificar risco é transformar informação em ação. O objetivo é agir antes que o SLA seja perdido."},{"title":"Composição do SLA","type":"Prática guiada","duration":"18 min","content":"Composição do SLA\n\nObjetivo da trilha\nEntender que o SLA de restituição é formado pela soma de etapas e que cada minuto deve ser protegido.\n\nO SLA de restituição não depende de uma única área. Ele é resultado da soma de várias etapas. Quando uma etapa atrasa, as próximas precisam compensar; quando todas consomem tempo demais, a não conformidade é inevitável.\n\nEtapas que compõem o SLA\n1. Chegada e liberação operacional da aeronave.\n2. Posicionamento de equipe e equipamentos.\n3. Abertura de porão e início da descarga.\n4. Separação e acomodação dos volumes nas carretas.\n5. Transporte até o BHS ou área de restituição.\n6. Entrada das bagagens no sistema ou ponto de entrega.\n7. Direcionamento à esteira correta.\n8. Início da disponibilização ao passageiro.\n9. Encerramento da restituição.\n\nExemplo prático de limite\nConsidere uma operação com SLA máximo de 45 minutos. Se a descarga levar 20 minutos, o percurso consumir 20 minutos e o BHS/esteira consumir 5 minutos, o total chega exatamente ao limite. Nesse cenário, qualquer desvio - equipamento indisponível, esteira ocupada, parada no trajeto ou falha de comunicação - gera descumprimento.\n\nMargem operacional\nA gestão deve trabalhar com margem, não com o limite. Se a previsão mostra que o voo chegará perto de 45 minutos, ele deve ser tratado como crítico antes do atraso acontecer.\n\nPerguntas de controle\n- A equipe estava posicionada antes da chegada?\n- O equipamento estava disponível e em condição de uso?\n- O primeiro transporte saiu cedo o suficiente?\n- A esteira estava liberada?\n- Houve espera para entrada no BHS?\n- O passageiro foi informado quando houve atraso relevante?\n\nBoas práticas\nMantenha uma linha do tempo simples para cada voo crítico. Registrar horários permite descobrir se a perda ocorreu na descarga, no percurso, no BHS ou na esteira. Sem linha do tempo, a discussão vira opinião.\n\nMensagem principal\nSLA é soma de tempos. Melhorar restituição exige medir cada etapa, não apenas olhar o horário final."},{"title":"Monitoramento por turno","type":"Análise","duration":"18 min","content":"Monitoramento por turno\n\nObjetivo da trilha\nAnalisar violações de SLA por turno e identificar padrões de volume, severidade e causa provável.\n\nA análise por turno permite enxergar onde o problema se concentra. Alguns turnos podem ter poucas ocorrências, mas atrasos severos. Outros podem ter grande volume de violações menores. Há também turnos com longas janelas sem restituição, especialmente quando há acúmulo de voos, esteiras saturadas ou falha de registro.\n\nComo interpretar os turnos\nTurno com baixo volume e alta severidade: exige investigação pontual, pois poucos voos geram grande impacto quando falham.\n\nTurno com alto volume de violações: exige revisão de dimensionamento, fluxo, priorização e capacidade de esteiras.\n\nTurno com eventos longos e concentrados: geralmente indica atraso de início, falha de acompanhamento ou falta de registro em tempo real.\n\nTurno com muitos voos internacionais ou de grande volume: exige governança mais forte, porque descarga, inspeção, distância e esteiras podem consumir mais tempo.\n\nIndicadores úteis\n- Quantidade de voos acima do SLA.\n- Tempo médio de atraso por turno.\n- Maior atraso registrado.\n- Percentual de voos críticos por turno.\n- Motivos recorrentes.\n- Esteiras mais impactadas.\n- Intervalos sem restituição.\n- Volume de voos no mesmo horário.\n\nAção por perfil de turno\nSe o turno apresenta alto volume, a prioridade é dimensionamento e fluxo. Se apresenta longas janelas sem restituição, a prioridade é controle, governança e acompanhamento. Se apresenta falhas de registro, a prioridade é padronização de apontamento e treinamento.\n\nExemplo genérico\nUm turno de pico concentra muitos voos próximos, múltiplas esteiras ocupadas e alta demanda de equipamentos. Mesmo que cada atraso seja moderado, o volume acumulado compromete a experiência do passageiro. Já um turno noturno pode ter menos voos, mas falhas pontuais graves por equipe reduzida ou atraso de acionamento.\n\nMensagem principal\nMétrica por turno mostra onde agir primeiro. Sem essa leitura, a gestão distribui esforço igualmente para problemas que não têm o mesmo peso."},{"title":"Pareto e priorização","type":"Gestão","duration":"16 min","content":"Pareto e priorização\n\nObjetivo da trilha\nAplicar a lógica 80/20 para priorizar os pontos que concentram maior impacto na restituição de bagagem.\n\nPareto é uma ferramenta de gestão que ajuda a identificar quais causas, turnos, posições ou horários concentram a maior parte do problema. Na restituição de bagagem, é comum que poucos períodos ou fluxos sejam responsáveis por grande parte das violações de SLA.\n\nComo aplicar\n1. Liste as violações por turno, área, posição, esteira ou tipo de voo.\n2. Some a quantidade de ocorrências e a severidade de cada grupo.\n3. Ordene do maior impacto para o menor.\n4. Identifique os grupos que concentram a maior parte das violações.\n5. Priorize ações nesses grupos antes de espalhar esforço por toda a operação.\n\nLeitura gerencial\nSe dois turnos concentram aproximadamente 70% das violações, atuar neles primeiro pode reduzir a maior parte do impacto. Se três turnos concentram mais de 90%, a operação tem um problema localizado e mensurável. Se todos os turnos têm comportamento semelhante, o problema é estrutural e exige revisão ampla do processo.\n\nTipos de impacto\nVolume: quantidade de voos fora do SLA.\nSeveridade: quanto tempo cada voo ultrapassou o limite.\nRecorrência: repetição do problema em dias diferentes.\nExperiência: número de passageiros afetados e tempo de espera percebido.\n\nDecisão com Pareto\nA gestão deve evitar tratar casos residuais como prioridade principal quando há grupos que concentram grande impacto. Isso não significa ignorar pequenos desvios, mas sim usar energia onde o retorno operacional será maior.\n\nExemplo genérico\nSe um turno representa o maior número de violações e outro apresenta os atrasos mais longos, as ações podem ser diferentes: no primeiro, reforçar fluxo e equipamentos; no segundo, melhorar governança, comunicação e resposta a exceções.\n\nMensagem principal\nPareto transforma dados em foco. A operação melhora mais rápido quando ataca primeiro o que mais pesa."},{"title":"Plano de ação operacional","type":"Simulação","duration":"17 min","content":"Plano de ação operacional\n\nObjetivo da trilha\nCriar ações práticas para reduzir atrasos de restituição e proteger o SLA em voos críticos.\n\nUm plano de ação eficaz começa antes da chegada do voo. A restituição não deve esperar o passageiro reclamar para ser gerenciada. O time precisa antecipar riscos, preparar recursos e acompanhar o fluxo até que as bagagens estejam na esteira.\n\nAções pré-chegada\n- Verificar posição prevista da aeronave.\n- Classificar risco conforme distância e pico operacional.\n- Confirmar equipe e equipamentos.\n- Identificar esteira prevista e possíveis conflitos.\n- Alinhar prioridade com rampa, BHS e serviço de bagagem.\n- Preparar comunicação para voos com risco de atraso.\n\nAções durante a operação\n- Acompanhar início da descarga.\n- Garantir saída rápida da primeira carreta.\n- Evitar espera desnecessária para completar carga quando o SLA está sensível.\n- Monitorar trânsito interno e entrada no BHS.\n- Confirmar abertura correta da esteira.\n- Atualizar o atendimento se houver atraso relevante.\n\nAções pós-operação\n- Registrar horários reais.\n- Identificar etapa onde ocorreu perda de tempo.\n- Classificar causa provável.\n- Comparar com histórico do turno.\n- Definir correção para próxima ocorrência.\n\nPlano para risco alto\nVoos de alto risco devem ter supervisão dedicada, equipamento dimensionado, comunicação ativa e prioridade no primeiro transporte. Em alguns casos, vale dividir volumes em viagens menores para iniciar restituição mais cedo.\n\nPlano para risco moderado\nVoos moderados precisam de acompanhamento padrão com atenção à descarga e à disponibilidade de esteira. Pequenos atrasos devem ser sinalizados cedo para evitar acúmulo.\n\nPlano para baixo risco\nFluxo padrão, mantendo registro e monitoramento. Baixo risco não significa ausência de controle.\n\nMensagem principal\nPlano de ação bom é simples, executável e medido. Se a equipe não sabe quem faz, quando faz e como registra, o plano ainda não está pronto."},{"title":"Governança e registros","type":"Procedimento","duration":"15 min","content":"Governança e registros\n\nObjetivo da trilha\nPadronizar registros, indicadores e rituais de acompanhamento para sustentar a melhoria da restituição de bagagem.\n\nGovernança é o conjunto de regras, rotinas e responsabilidades que mantém a operação sob controle. Sem governança, a restituição depende de esforço individual. Com governança, a equipe sabe o que medir, quando agir e como aprender com cada desvio.\n\nRegistros essenciais\n- Voo e data.\n- Posição da aeronave.\n- Esteira utilizada.\n- Horário de chegada.\n- Início e fim da descarga.\n- Saída do primeiro transporte.\n- Chegada ao BHS ou ponto de restituição.\n- Início da entrega na esteira.\n- Encerramento da entrega.\n- Motivo de atraso, quando houver.\n- Ação corretiva adotada.\n\nIndicadores recomendados\n- Percentual de voos dentro do SLA.\n- Quantidade de violações por turno.\n- Tempo médio até a primeira bagagem.\n- Tempo médio até a última bagagem.\n- Voos críticos por posição ou terminal.\n- Tempo médio de percurso por área.\n- Ocorrências por esteira.\n- Causas recorrentes.\n\nRituais de acompanhamento\nBriefing pré-turno: revisar voos críticos, equipe, equipamentos e riscos.\nMonitoramento em tempo real: acompanhar chegadas com maior risco.\nDebriefing pós-turno: registrar principais desvios, causas e ações.\nRevisão semanal: analisar Pareto e definir prioridades.\n\nComunicação com atendimento\nQuando houver atraso, o atendimento deve receber informação objetiva para orientar passageiros. O ideal é informar status real, evitar promessas e atualizar quando a previsão mudar. O silêncio aumenta tensão na área de restituição.\n\nCultura de melhoria\nA governança não deve ser usada para culpar pessoas, mas para entender processo. Um atraso pode ter causa em posição distante, congestionamento, falha de equipamento, dimensionamento insuficiente ou comunicação tardia. O registro correto protege a equipe e permite melhorar.\n\nMensagem principal\nO que não é medido vira percepção. O que é medido com qualidade vira gestão."}]$json_restituicao_bagagem_sla$::jsonb, $mat_restituicao_bagagem_sla$Objetivo da restituição

Objetivo da restituição

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

---

Distância, percurso e risco

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

---

Classificação operacional

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

---

Composição do SLA

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

---

Monitoramento por turno

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

---

Pareto e priorização

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

---

Plano de ação operacional

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

---

Governança e registros

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
O que não é medido vira percepção. O que é medido com qualidade vira gestão.$mat_restituicao_bagagem_sla$),
('siga-gestao-aeroportuaria', $json_siga_gestao_aeroportuaria$[{"title":"Conceito e finalidade","type":"Aula","duration":"12 min","content":"Conceito e finalidade\n\nObjetivo da trilha\nCompreender o papel de uma plataforma integrada de gestão aeroportuária e como ela apoia a operação em tempo real.\n\nUm sistema integrado de gestão aeroportuária reúne informações de diferentes áreas em uma única interface operacional. Ele pode apoiar equipes de atendimento, rampa, bagagem, coordenação, supervisão e gestão em atividades como acompanhamento de voos, publicações internas, alertas, incidentes, mudanças operacionais e comunicação entre equipes.\n\nA principal finalidade é reduzir dispersão de informações. Em uma operação aeroportuária, muitos eventos acontecem ao mesmo tempo: chegada de aeronaves, mudanças de portão, atrasos, passageiros que precisam de assistência, demandas de bagagem, retenção de equipe, incidentes e ajustes de processo. Quando cada informação fica em um canal diferente, a chance de erro aumenta.\n\nBenefícios esperados\n- Centralização de dados operacionais.\n- Visão em tempo real de eventos críticos.\n- Redução de retrabalho e ruído de comunicação.\n- Melhor coordenação entre áreas.\n- Rastreabilidade das ações tomadas.\n- Apoio à tomada de decisão por supervisores.\n- Registro histórico para melhoria contínua.\n\nComo o sistema deve ser entendido\nEle não substitui o procedimento operacional. Ele organiza a informação para que o procedimento seja executado com mais rapidez e segurança. O usuário ainda precisa interpretar dados, confirmar informações relevantes e registrar ações corretamente.\n\nExemplo operacional\nUma mudança de portão é publicada no sistema. O atendimento visualiza a alteração, a rampa ajusta posicionamento de equipe, o setor de bagagem confirma impacto no fluxo e a supervisão acompanha a execução. Todos trabalham com a mesma informação.\n\nMensagem principal\nUma plataforma integrada só gera valor quando as áreas registram e consultam informações com disciplina operacional."},{"title":"Acesso seguro","type":"Procedimento","duration":"10 min","content":"Acesso seguro\n\nObjetivo da trilha\nEntender como acessar o sistema com segurança e proteger dados operacionais e pessoais.\n\nO acesso a sistemas aeroportuários deve ser individual, controlado e rastreável. Cada usuário deve entrar com sua própria credencial, sem compartilhar login ou senha. Isso permite identificar quem registrou uma ação, quando ela foi feita e qual informação foi alterada.\n\nBoas práticas de acesso\n- Usar canal oficial autorizado pela empresa ou operador aeroportuário.\n- Utilizar credencial individual.\n- Criar senha forte, com letras, números e caracteres especiais quando aplicável.\n- Ativar autenticação em dois fatores quando disponível.\n- Encerrar sessão ao sair do equipamento.\n- Não salvar senha em computadores compartilhados.\n- Não enviar prints com dados sensíveis em canais inadequados.\n\nSegurança da informação\nSistemas operacionais podem conter dados de voo, informações de passageiros, incidentes, nomes de colaboradores, horários, portões, registros de bagagem e ações internas. O uso inadequado pode expor dados sensíveis e comprometer a operação.\n\nCondutas proibidas\n- Compartilhar usuário e senha.\n- Acessar o sistema por curiosidade, sem necessidade operacional.\n- Alterar dados sem confirmação.\n- Publicar informações em grupos informais sem autorização.\n- Usar conta de outro colaborador.\n- Deixar sessão aberta em equipamento público.\n\nPrimeiro acesso\nNo primeiro acesso, o usuário deve conferir seu perfil, nome, área, permissões e menus disponíveis. Se o perfil estiver incorreto, deve acionar o canal responsável antes de iniciar registros operacionais.\n\nMensagem principal\nAcesso seguro protege o usuário, a operação e o passageiro. Em sistema rastreável, cada ação precisa ter dono."},{"title":"Dashboard operacional","type":"Aula","duration":"12 min","content":"Dashboard operacional\n\nObjetivo da trilha\nAprender a interpretar os principais elementos do dashboard e usá-lo como ponto inicial de acompanhamento.\n\nO dashboard é a tela inicial de gestão operacional. Ele deve apresentar uma visão rápida do estado da operação, combinando informações de tempo, publicações recentes, atualizações, avisos, alertas e atalhos para módulos de trabalho.\n\nElementos comuns do dashboard\n- Data e hora local.\n- Horário UTC, quando aplicável.\n- Identificação do usuário logado.\n- Menu lateral ou superior.\n- Publicações recentes.\n- Atualizações operacionais.\n- Avisos críticos.\n- Alertas pendentes.\n- Incidentes ou comunicações abertas.\n\nPor que hora local e UTC importam\nOperações aéreas usam referência de tempo com frequência. A hora local ajuda a equipe do aeroporto; a hora UTC facilita comunicação com outras bases, sistemas e áreas que operam em fusos diferentes. A divergência de horário pode causar erro de registro se o agente não observar a referência correta.\n\nLeitura das publicações\nPublicações podem tratar de mudanças de procedimento, ajustes de fluxo, retenção de equipes, atualizações de capacidade, alertas temporários ou orientações de segurança. O usuário deve ler, interpretar impacto e aplicar ao seu turno.\n\nRotina recomendada ao abrir o dashboard\n1. Confirmar usuário e perfil.\n2. Verificar data/hora.\n3. Ler avisos e atualizações recentes.\n4. Identificar alertas pendentes.\n5. Acessar módulos relevantes para o turno.\n6. Registrar ciência ou ação quando solicitado.\n\nMensagem principal\nO dashboard deve ser o primeiro ponto de leitura do turno. Ele reduz surpresa operacional e ajuda a alinhar a equipe."},{"title":"Controle de voos","type":"Prática guiada","duration":"14 min","content":"Controle de voos\n\nObjetivo da trilha\nUsar o módulo de controle de voos para acompanhar operação, status e impactos nos serviços de solo.\n\nO controle de voos permite consultar voos por número, data, aeroporto, horário ou status. Ele centraliza informações de chegada, partida, embarque, atraso, mudança de portão, posição de aeronave e eventos que impactam a operação.\n\nInformações importantes\n- Número do voo.\n- Data operacional.\n- Origem e destino.\n- Horário programado e estimado.\n- Status do voo.\n- Portão ou posição.\n- Atrasos e motivos quando disponíveis.\n- Serviços associados: bagagem, limpeza, atendimento, assistência, rampa ou conexão.\n\nStatus comuns\nEm planejamento: voo previsto, aguardando preparação.\nEm atendimento: equipes atuando em alguma etapa.\nEmbarque: passageiros em processo de embarque.\nAtrasado: horário alterado ou impacto operacional identificado.\nMudança de portão: local de embarque ou desembarque alterado.\nConcluído: etapa finalizada e registrada.\n\nIntegração operacional\nO controle de voos deve conversar com a operação real. Se o sistema informa um status, mas a área informa situação diferente, o usuário deve confirmar antes de publicar ou tomar decisão. O sistema apoia, mas a validação operacional continua necessária.\n\nExemplo prático\nUm voo tem alteração de portão pouco antes do embarque. O agente consulta o controle de voos, confirma a mudança, atualiza equipes envolvidas e registra a ação. Esse registro evita que outra área trabalhe com portão antigo.\n\nMensagem principal\nControle de voo bem utilizado reduz falhas de comunicação entre atendimento, rampa, bagagem e supervisão."},{"title":"Atualizações operacionais","type":"Consulta","duration":"12 min","content":"Atualizações operacionais\n\nObjetivo da trilha\nEntender como ler, aplicar e registrar atualizações que impactam a operação diária.\n\nAtualizações operacionais podem envolver mudança de capacidade, alteração de voo, ajuste de gate, retenção de equipe, mudança de processo, informação de contingência ou orientação temporária. Elas precisam ser lidas com atenção, porque podem alterar a rotina do turno.\n\nTipos de atualização\n- Mudança de horário de voo.\n- Alteração de portão ou posição.\n- Retenção ou redistribuição de equipe.\n- Ajuste de fluxo de passageiros.\n- Mudança de esteira ou área de entrega.\n- Procedimento temporário de atendimento.\n- Orientação sobre passageiros especiais.\n- Restrição operacional em determinada área.\n\nComo aplicar uma atualização\n1. Leia o conteúdo completo.\n2. Identifique quais áreas são afetadas.\n3. Confirme se a atualização vale para seu aeroporto, turno ou voo.\n4. Comunique a equipe diretamente impactada.\n5. Registre ciência ou ação, se o sistema solicitar.\n6. Monitore se a mudança foi aplicada corretamente.\n\nRefresh e leitura ativa\nAtualizar a tela não basta. O usuário deve observar se novos avisos surgiram, se houve alteração em publicações antigas e se algum alerta pede resposta. A leitura ativa evita que a equipe trabalhe com informação vencida.\n\nRisco de não aplicar\nUma atualização ignorada pode gerar equipe no local errado, passageiro orientado incorretamente, perda de prazo, atraso de atendimento, duplicidade de ação ou conflito entre áreas.\n\nMensagem principal\nAtualização operacional é comando de contexto. Quem lê tarde, age tarde."},{"title":"Avisos, alertas e incidentes","type":"Procedimento","duration":"14 min","content":"Avisos, alertas e incidentes\n\nObjetivo da trilha\nSaber responder a avisos, alertas e incidentes com registro, ação e acompanhamento.\n\nAvisos e alertas existem para destacar situações que exigem atenção. Podem envolver passageiros com assistência especial, leitura de etapas, incidentes operacionais, falha sistêmica, ocorrência em voo, irregularidade de bagagem, restrição de área ou necessidade de resposta imediata.\n\nTipos de alerta\nGeral: comunicado amplo para ciência ou orientação.\nOperacional: exige ação de equipe ou atualização de processo.\nAssistência especial: envolve passageiros que precisam de suporte diferenciado.\nIncidente: registra falha, risco, erro ou evento fora do padrão.\nFollow-up: pede acompanhamento posterior até encerramento.\n\nComo responder\n- Abra o alerta e leia o conteúdo completo.\n- Verifique se a ação é sua ou de outra área.\n- Execute ou encaminhe conforme responsabilidade.\n- Registre ação tomada.\n- Evite duplicidade verificando histórico anterior.\n- Acompanhe até conclusão quando necessário.\n\nRegistro de etapas\nQuando um alerta envolve várias etapas, cada etapa deve ser registrada. Isso permite saber o que já foi feito, quem fez e o que ainda falta. Sem esse controle, duas equipes podem executar a mesma ação ou nenhuma executar.\n\nExemplo prático\nUm alerta informa passageiro com assistência especial chegando em conexão. O atendimento confirma chegada, a equipe de apoio é acionada, o embarque é informado e cada etapa fica registrada. Se houver troca de turno, a próxima equipe entende o status sem depender de explicação verbal.\n\nMensagem principal\nAlerta sem registro vira ruído. Alerta com ação registrada vira controle operacional."},{"title":"Colaboração e feedback","type":"Simulação","duration":"12 min","content":"Colaboração e feedback\n\nObjetivo da trilha\nUsar recursos de colaboração para reportar erros, comunicar incidências e melhorar a qualidade da informação.\n\nSistemas integrados normalmente possuem área de incidências, feedback ou suporte. Essa funcionalidade existe para que o usuário reporte falhas, inconsistências, dados incorretos, dificuldade de uso ou oportunidade de melhoria.\n\nQuando reportar\n- Informação de voo divergente.\n- Status incorreto.\n- Alerta duplicado.\n- Publicação com erro.\n- Menu indisponível.\n- Falha de acesso.\n- Dado operacional desatualizado.\n- Dificuldade recorrente de uso.\n\nComo reportar bem\nUm bom reporte deve ser claro e objetivo. Inclua módulo, voo ou processo afetado, data/hora, print quando permitido, descrição do erro, impacto operacional e ação esperada. Evite mensagens genéricas como sistema não funciona sem explicar o que aconteceu.\n\nModelo de reporte\nMódulo: Controle de voos.\nEvento: status de voo divergente.\nData/hora: informar horário local.\nImpacto: equipe recebeu informação conflitante.\nAção solicitada: verificar atualização do status.\nObservação: incluir evidência quando permitido.\n\nColaboração entre áreas\nA colaboração deve ocorrer em fonte única de informação. Se o feedback é registrado no sistema, as equipes conseguem acompanhar evolução e evitar conversas paralelas sem histórico.\n\nMensagem principal\nReportar erro não é reclamar: é proteger a operação e melhorar o sistema."},{"title":"Boas práticas de uso","type":"Checklist","duration":"14 min","content":"Boas práticas de uso\n\nObjetivo da trilha\nConsolidar condutas para usar o sistema de forma segura, útil e confiável durante o turno.\n\nO uso correto de um sistema integrado depende de disciplina. A ferramenta só é confiável quando os usuários consultam, atualizam, registram e conferem informações de forma padronizada.\n\nBoas práticas essenciais\n- Iniciar o turno verificando o dashboard.\n- Ler avisos recentes antes de acessar módulos específicos.\n- Confirmar informações críticas antes de publicar.\n- Registrar ações realizadas.\n- Evitar duplicidade de follow-up.\n- Usar linguagem objetiva e profissional.\n- Manter informações atualizadas em tempo real.\n- Encerrar pendências quando forem resolvidas.\n- Reportar erro pelo canal correto.\n- Encerrar sessão ao finalizar o uso.\n\nO que evitar\n- Publicar dados sem validação.\n- Usar abreviações não padronizadas.\n- Criar alertas duplicados.\n- Deixar incidentes sem status.\n- Compartilhar credenciais.\n- Registrar ação em nome de outro usuário.\n- Usar canais paralelos sem atualizar o sistema.\n\nChecklist rápido para o usuário\n1. Entrei com minha credencial?\n2. Li os avisos do turno?\n3. Consultei o voo ou alerta correto?\n4. Confirmei a informação antes de agir?\n5. Registrei o que foi feito?\n6. Há pendência para outra área?\n7. O próximo turno entenderá o histórico?\n\nCultura de fonte única\nQuando todos usam a mesma fonte, a operação ganha clareza. Quando cada área trabalha por prints, mensagens soltas e memória individual, o risco de erro aumenta.\n\nMensagem principal\nSistema integrado não é apenas tecnologia. É disciplina operacional aplicada à informação."}]$json_siga_gestao_aeroportuaria$::jsonb, $mat_siga_gestao_aeroportuaria$Conceito e finalidade

Conceito e finalidade

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

---

Acesso seguro

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

---

Dashboard operacional

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

---

Controle de voos

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

---

Atualizações operacionais

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

---

Avisos, alertas e incidentes

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

---

Colaboração e feedback

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

---

Boas práticas de uso

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
Sistema integrado não é apenas tecnologia. É disciplina operacional aplicada à informação.$mat_siga_gestao_aeroportuaria$),
('checkin-operacional', $json_checkin_operacional$[{"title":"Função do check-in","type":"Aula","duration":"10 min","content":"Função do check-in\n\nObjetivo da trilha\nCompreender o papel do check-in dentro da jornada do passageiro e da operação aeroportuária.\n\nO check-in operacional é a etapa em que o passageiro, sua reserva, seus documentos, seus serviços contratados e sua bagagem são preparados para o voo. A função do agente não é apenas emitir cartão de embarque. O agente valida se a pessoa pode viajar, se está no voo correto, se possui documentação compatível, se a bagagem pode ser transportada e se há alguma necessidade especial que precise ser comunicada às demais áreas.\n\nO check-in é um ponto de prevenção. Quando o atendimento é feito com atenção, muitos problemas deixam de chegar ao portão, à rampa, ao serviço de bagagem ou ao destino. Um documento incorreto, uma bagagem etiquetada para destino errado, uma assistência não registrada ou um item restrito aceito indevidamente podem gerar impacto operacional e prejuízo ao passageiro.\n\nResponsabilidades principais\n- Confirmar reserva, voo, data, trecho e status do passageiro.\n- Conferir documento de identificação conforme rota e perfil do passageiro.\n- Verificar requisitos de viagem quando aplicáveis.\n- Aceitar bagagem despachada conforme franquia, peso, dimensão e regras de segurança.\n- Orientar sobre bagagem de mão, itens proibidos e itens restritos.\n- Registrar serviços especiais e necessidades de assistência.\n- Emitir cartão de embarque e comprovante de bagagem.\n- Encaminhar o passageiro com informação clara sobre portão, horário e próximos passos.\n\nPostura operacional\nO agente deve unir cortesia e precisão. Um atendimento simpático, mas sem conferência técnica, é frágil. Uma conferência correta, mas comunicada de forma ríspida, gera conflito. O padrão ideal é acolher, conferir, orientar e registrar.\n\nExemplo prático\nUm passageiro se apresenta no balcão para voo com conexão. O agente confere nome, documento, destino final, horário, franquia e necessidade de assistência. Ao perceber conexão curta, reforça o portão, orienta sobre deslocamento e garante que a bagagem esteja etiquetada corretamente. Essa ação reduz risco de perda de conexão e extravio.\n\nMensagem principal\nCheck-in bem executado protege a experiência do passageiro e reduz falhas em toda a cadeia operacional."},{"title":"Documentos e identificação","type":"Procedimento","duration":"12 min","content":"Documentos e identificação\n\nObjetivo da trilha\nAplicar uma conferência documental segura, coerente com a rota e com o perfil do passageiro.\n\nA validação de documentos é uma das responsabilidades mais sensíveis do check-in. O agente deve confirmar se o documento apresentado identifica corretamente o passageiro e se atende às exigências do tipo de viagem. A regra pode variar conforme voo doméstico, internacional, idade do passageiro, nacionalidade, destino, trânsito, autorização de menor e exigências migratórias.\n\nPontos de conferência\n- Nome do passageiro no documento e na reserva.\n- Foto, quando aplicável, e compatibilidade visual com o passageiro.\n- Validade do documento.\n- Documento aceito para a rota.\n- Requisitos de visto, autorização, formulário ou comprovante quando aplicáveis.\n- Documentação de menores, incluindo autorização de viagem quando exigida.\n- Divergências de sobrenome, ordem do nome, acentuação ou abreviações relevantes.\n\nViagem doméstica\nEm regra, o agente deve validar documento oficial aceito para identificação do passageiro. A conferência precisa ser objetiva e respeitosa, observando nome, documento e requisitos aplicáveis à rota. Em caso de menor, a autorização e os responsáveis devem ser verificados conforme regra vigente.\n\nViagem internacional\nAlém da identificação, pode haver necessidade de passaporte, visto, autorização eletrônica, comprovante sanitário, autorização de menor, validade mínima e regras específicas do país de destino ou trânsito. O agente não deve presumir que o passageiro está apto apenas porque possui passagem comprada.\n\nDivergências documentais\nNem toda divergência impede a viagem, mas toda divergência relevante precisa ser analisada. O agente deve seguir procedimento interno, acionar supervisão quando necessário e evitar promessas sem confirmação.\n\nExemplo prático\nUma passageira apresenta reserva com sobrenome de casada e documento com sobrenome anterior. O agente verifica documentação complementar e procedimento aplicável antes de aceitar. Se houver dúvida, aciona supervisão e registra a orientação.\n\nMensagem principal\nDocumento não é formalidade. É requisito de segurança, conformidade e proteção do passageiro."},{"title":"Aceitação de bagagem","type":"Prática guiada","duration":"14 min","content":"Aceitação de bagagem\n\nObjetivo da trilha\nRealizar a aceitação de bagagem despachada com segurança, rastreabilidade e orientação adequada.\n\nA aceitação de bagagem começa antes da etiqueta. O agente deve observar se a bagagem está apta ao transporte, se respeita peso e dimensões, se a franquia permite despacho, se há itens restritos ou proibidos e se a condição física exige registro. A etiqueta correta é o vínculo entre passageiro, voo, rota e bagagem.\n\nEtapas recomendadas\n1. Confirmar quantidade de volumes permitidos.\n2. Conferir peso e dimensão.\n3. Verificar destino final e conexões.\n4. Questionar sobre itens proibidos ou restritos quando aplicável.\n5. Observar condição externa da bagagem.\n6. Registrar dano pré-existente quando o procedimento exigir.\n7. Emitir etiqueta correta.\n8. Entregar comprovante ao passageiro.\n9. Orientar sobre retirada no destino ou conexão quando necessário.\n\nCondição da bagagem\nBagagens com alças quebradas, zíper danificado, rodas ausentes, embalagem frágil, excesso de volume ou dano aparente podem exigir registro de limitação de responsabilidade ou recusa, conforme procedimento. O objetivo é evitar que dano pré-existente seja tratado como dano ocorrido no transporte.\n\nItens restritos\nBaterias de lítio, powerbanks, produtos inflamáveis, químicos, aerossóis fora das condições permitidas, ferramentas perigosas, armas, munições e outros artigos controlados devem ser tratados conforme regras de segurança e transporte de artigos perigosos. O agente deve orientar sem improvisar.\n\nEtiqueta de bagagem\nA etiqueta deve refletir a rota aceita. Em viagens com conexão, a leitura de destino final e pontos de transferência é essencial. Uma etiqueta emitida para destino incorreto pode gerar extravio mesmo quando todo o restante do atendimento foi correto.\n\nExemplo prático\nUm passageiro despacha uma mala com roda quebrada e conexão internacional. O agente registra a condição conforme procedimento, confirma se a etiqueta segue até o destino correto, entrega o comprovante e orienta sobre retirada ou redespacho se houver exigência alfandegária.\n\nMensagem principal\nAceitar bagagem é assumir responsabilidade operacional. Peso, rota, condição e segurança precisam estar corretos antes do volume seguir para o sistema."},{"title":"Passageiros especiais e SSR","type":"Aula","duration":"12 min","content":"Passageiros especiais e SSR\n\nObjetivo da trilha\nIdentificar, registrar e comunicar necessidades especiais de atendimento de forma correta.\n\nPassageiros especiais exigem atenção técnica e humana. O agente deve reconhecer necessidades de assistência sem constranger o passageiro, registrar o serviço correto e garantir comunicação com as áreas envolvidas. A assistência pode envolver mobilidade reduzida, deficiência visual, deficiência auditiva, deficiência intelectual, transtorno do espectro autista, gestantes, idosos, menor desacompanhado, passageiro com condição médica, animal de assistência ou transporte de equipamento de mobilidade.\n\nPrincípios de atendimento\n- Falar diretamente com o passageiro, não apenas com acompanhante.\n- Perguntar antes de ajudar.\n- Respeitar autonomia e privacidade.\n- Usar linguagem simples e objetiva.\n- Evitar exposição pública da condição do passageiro.\n- Confirmar o tipo de assistência necessário.\n- Registrar o serviço correto no sistema.\n- Informar portão, rampa, tripulação e destino quando aplicável.\n\nSSR e comunicação operacional\nCódigos de serviço especial ajudam a padronizar a comunicação entre áreas. O código, porém, não substitui a orientação humana. Se um passageiro precisa de cadeira de rodas até o assento, a equipe precisa saber o nível de assistência. Se o passageiro usa equipamento de mobilidade próprio, o tratamento do equipamento deve ser rastreado.\n\nMenor desacompanhado\nO menor desacompanhado depende de idade, regra do operador, rota, documentação, dados do responsável na origem, dados do responsável no destino e acompanhamento durante as etapas. Não deve haver improviso nem entrega a pessoa não autorizada.\n\nAnimais e casos médicos\nAnimais de companhia, animais de assistência e condições médicas possuem regras próprias. O agente deve conferir documentação exigida, reserva do serviço, condições de transporte, limites operacionais e orientação ao passageiro.\n\nExemplo prático\nUm passageiro solicita cadeira de rodas, mas informa que consegue caminhar pequenas distâncias. O agente registra a assistência adequada, orienta sobre o fluxo, comunica a equipe de apoio e garante que o destino receba a informação.\n\nMensagem principal\nA assistência correta começa no check-in. Registro incompleto gera falha de atendimento no portão, na conexão ou no destino."},{"title":"Fechamento e no-show","type":"Simulação","duration":"10 min","content":"Fechamento e no-show\n\nObjetivo da trilha\nEntender a importância do fechamento do check-in e da comunicação com as áreas envolvidas.\n\nO fechamento do check-in organiza a transição entre atendimento, embarque, rampa e coordenação. A partir desse momento, a operação precisa saber quem está aceito, quem embarcou, quem não compareceu, quais bagagens foram despachadas, quais passageiros exigem assistência e quais pendências ainda existem.\n\nElementos do fechamento\n- Passageiros aceitos.\n- Passageiros não apresentados.\n- Bagagens despachadas.\n- Passageiros com assistência especial.\n- Pendências documentais ou operacionais.\n- Bagagens retiradas ou não embarcadas quando aplicável.\n- Informações relevantes para portão e rampa.\n\nNo-show\nNo-show é a situação em que o passageiro não se apresenta dentro do prazo operacional. O tratamento deve seguir procedimento, evitando decisões isoladas. A bagagem de passageiro que não embarca exige atenção especial, pois regras de segurança podem impedir o transporte sem reconciliação adequada.\n\nLate show\nPassageiros atrasados devem ser atendidos com clareza. O agente deve explicar o prazo operacional, verificar alternativas permitidas e evitar prometer embarque quando a aceitação depende de autorização de portão, coordenação ou segurança operacional.\n\nComunicação com o portão\nO portão precisa receber informações relevantes antes do embarque: passageiros com assistência, menores desacompanhados, pendências, passageiros em conexão crítica e alterações relevantes. A comunicação deve ser objetiva e rastreável.\n\nExemplo prático\nUm passageiro aceito no check-in não chega ao portão. A equipe precisa confirmar status de embarque e bagagem, aplicar procedimento de reconciliação e registrar a ação. O objetivo é proteger a segurança do voo e evitar irregularidade de bagagem.\n\nMensagem principal\nFechar o check-in não é apenas encerrar balcão. É garantir que a operação siga com informação correta."},{"title":"Conformidade e registros","type":"Checklist","duration":"12 min","content":"Conformidade e registros\n\nObjetivo da trilha\nRegistrar exceções e decisões de forma profissional, rastreável e útil para continuidade operacional.\n\nA conformidade no check-in depende de procedimento, registro e comunicação. Muitas decisões são simples quando tudo está regular, mas situações fora do padrão exigem histórico claro. Sem registro, uma decisão correta pode parecer erro; com registro ruim, uma ocorrência fica difícil de explicar.\n\nO que registrar\n- Divergência documental relevante.\n- Recusa de transporte ou aceitação condicionada.\n- Dano pré-existente de bagagem.\n- Passageiro com assistência especial.\n- Menor desacompanhado.\n- Itens restritos identificados.\n- Bagagem retirada ou não embarcada.\n- Autorização recebida de supervisão.\n- Reclamação ou conflito no atendimento.\n- Orientação dada ao passageiro.\n\nQualidade do registro\nUm bom registro responde: o que aconteceu, quando aconteceu, quem participou, qual decisão foi tomada, qual regra foi aplicada e qual área foi comunicada. Comentários vagos como problema resolvido ou passageiro orientado não ajudam em auditoria, continuidade ou defesa operacional.\n\nPrivacidade\nDados pessoais devem ser tratados com cuidado. O agente deve registrar somente o necessário para a operação e evitar exposição indevida de documentos, condições de saúde, contatos ou informações sensíveis.\n\nComunicação profissional\nEm situações de tensão, o agente deve manter postura calma, explicar limites operacionais e acionar supervisão quando necessário. O objetivo não é vencer discussão, mas aplicar procedimento com respeito e segurança.\n\nChecklist final\n1. O passageiro foi identificado corretamente?\n2. A rota e o voo foram confirmados?\n3. A bagagem foi aceita conforme regra?\n4. Serviços especiais foram registrados?\n5. Pendências foram comunicadas?\n6. Exceções ficaram registradas?\n7. O próximo setor consegue entender o histórico?\n\nMensagem principal\nRegistro bom é parte do atendimento. Ele protege a operação, o passageiro e o agente."}]$json_checkin_operacional$::jsonb, $mat_checkin_operacional$Função do check-in

Função do check-in

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

---

Documentos e identificação

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

---

Aceitação de bagagem

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

---

Passageiros especiais e SSR

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

---

Fechamento e no-show

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

---

Conformidade e registros

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
Registro bom é parte do atendimento. Ele protege a operação, o passageiro e o agente.$mat_checkin_operacional$),
('embarque-controle-portao', $json_embarque_controle_portao$[{"title":"Preparação do portão","type":"Aula","duration":"10 min","content":"Preparação do portão\n\nObjetivo da trilha\nPreparar o portão de embarque com antecedência, garantindo que equipe, informações e recursos estejam alinhados antes da primeira chamada.\n\nO embarque começa antes do passageiro formar fila. A equipe de portão precisa chegar com tempo suficiente para conferir voo, horário, aeronave, posição, portão, status operacional, passageiros especiais, eventuais mudanças e recursos necessários. A falta de preparação faz o atendimento começar atrasado e cria pressão desnecessária na equipe.\n\nConferências iniciais\n- Número do voo e destino.\n- Horário previsto de embarque e partida.\n- Portão correto e eventuais alterações.\n- Status da aeronave e disponibilidade para embarque.\n- Lista de passageiros aceitos.\n- Passageiros com assistência especial.\n- Menores desacompanhados e casos sensíveis.\n- Bagagens de mão em excesso ou voo com ocupação alta.\n- Equipamentos do portão e comunicação com rampa.\n\nOrganização do espaço\nO portão deve permitir fluxo claro. Passageiros precisam entender onde aguardar, onde formar fila, qual grupo será chamado, onde ficam prioridades e como proceder em caso de dúvida. Um ambiente confuso aumenta conflito e torna o embarque mais lento.\n\nComunicação inicial\nAntes da chamada, a equipe deve alinhar linguagem, sequência e responsabilidades. Quem faz anúncio, quem controla fila, quem confere documentos, quem trata exceções e quem comunica rampa. Esse alinhamento evita mensagens contraditórias.\n\nExemplo prático\nO voo está cheio e há previsão de excesso de bagagem de mão. Antes do embarque, a equipe identifica risco, prepara etiquetas de gate bag, define local de abordagem e alinha com rampa. Quando o fluxo começa, a ação já está organizada.\n\nMensagem principal\nPortão preparado reduz atraso, conflito e improviso. O embarque bom começa antes da chamada."},{"title":"Sequência de embarque","type":"Procedimento","duration":"10 min","content":"Sequência de embarque\n\nObjetivo da trilha\nAplicar uma sequência de embarque organizada, segura e compreensível para passageiros e equipe.\n\nA sequência de embarque serve para ordenar o fluxo de passageiros até a aeronave. Ela precisa respeitar prioridades legais e operacionais, assistências especiais, famílias quando aplicável, grupos definidos no cartão de embarque, passageiros com conexão sensível e limitações de infraestrutura.\n\nPrioridades\nPassageiros com necessidade de assistência, pessoas com mobilidade reduzida, idosos, gestantes, pessoas com crianças de colo e outros perfis previstos em regra aplicável devem receber atendimento adequado. Prioridade não significa pressa desorganizada; significa fluxo protegido e comunicação respeitosa.\n\nChamada por grupos\nA chamada por grupos reduz congestionamento no portão, na ponte, no corredor e dentro da aeronave. Quando todos são chamados ao mesmo tempo, a fila aumenta, a conferência perde qualidade e o embarque pode atrasar.\n\nBoas práticas de anúncio\n- Informar voo, destino e grupo chamado.\n- Usar frases curtas e claras.\n- Repetir informação essencial quando houver ruído.\n- Evitar termos técnicos sem explicação.\n- Orientar documentos e cartão de embarque à mão.\n- Atualizar passageiros quando houver espera.\n\nControle de fila\nA fila deve ser organizada sem confronto. O agente deve orientar com firmeza e educação, reposicionando passageiros fora do grupo chamado quando necessário. A mensagem deve explicar o motivo: segurança, fluidez e sequência operacional.\n\nExemplo prático\nAo chamar passageiros com assistência, a equipe garante apoio e tempo de deslocamento. Em seguida chama grupos conforme organização prevista. Passageiros de outros grupos são orientados a aguardar, evitando acúmulo na entrada da aeronave.\n\nMensagem principal\nSequência de embarque é gestão de fluxo. Quando a fila entende o processo, a operação fica mais rápida e menos tensa."},{"title":"Conferência e conciliação","type":"Prática guiada","duration":"12 min","content":"Conferência e conciliação\n\nObjetivo da trilha\nControlar embarque com conferência correta de passageiro, cartão, voo, trecho e status.\n\nO portão é uma barreira operacional de controle. Antes de entrar na aeronave, o passageiro precisa estar aceito para aquele voo e trecho. A conferência pode envolver cartão de embarque, documento quando aplicável, status no sistema, autorização especial e eventuais alertas.\n\nPontos de conferência\n- Nome e voo.\n- Origem e destino do trecho.\n- Data e horário.\n- Grupo de embarque quando aplicável.\n- Documento exigido pela rota.\n- Status aceito, embarcado, pendente ou cancelado.\n- Alertas de assistência ou caso especial.\n\nConciliação\nConciliação é comparar a lista de passageiros aceitos com os passageiros efetivamente embarcados. Ao final do processo, a equipe precisa saber quem embarcou, quem está ausente, quem foi retirado, quem foi reacomodado e se há bagagem associada a passageiro não embarcado.\n\nRiscos de falha\n- Passageiro entra no voo errado.\n- Passageiro embarca sem estar aceito.\n- Passageiro aceito não embarca e sua bagagem segue indevidamente.\n- Informação de no-show chega tarde à rampa.\n- Tripulação recebe dado incorreto.\n\nTratamento de pendências\nQuando o sistema aponta impedimento, alerta ou divergência, o agente não deve liberar por pressão. Deve pausar, conferir, acionar supervisão se necessário e registrar a decisão.\n\nExemplo prático\nUm passageiro apresenta cartão de embarque antigo após reacomodação. O leitor indica divergência. O agente verifica o novo voo, explica ao passageiro e evita embarque incorreto.\n\nMensagem principal\nConferência no portão protege a segurança do voo e a rastreabilidade de passageiros e bagagens."},{"title":"Bagagem no portão","type":"Aula","duration":"12 min","content":"Bagagem no portão\n\nObjetivo da trilha\nTratar bagagem de mão e volumes despachados no portão com segurança, rastreabilidade e comunicação com rampa.\n\nBagagem no portão é uma das fontes mais comuns de atraso e conflito. Em voos cheios, aeronaves menores ou quando há volumes fora do padrão, parte da bagagem de mão pode precisar ser despachada no portão. Esse processo exige etiqueta, orientação e controle.\n\nBagagem de mão fora do padrão\nVolumes acima de dimensão, peso ou quantidade permitida devem ser tratados conforme regra operacional. A abordagem deve ser clara e respeitosa, explicando que a limitação existe por segurança, espaço e conforto a bordo.\n\nGate bag\nQuando a bagagem é despachada no portão, precisa receber identificação correta e seguir fluxo seguro até a aeronave. O passageiro deve ser informado sobre onde retirará o volume: destino final, conexão, ponte ou outro ponto definido pelo procedimento.\n\nComunicação com rampa\nA equipe de rampa precisa saber que há volumes de portão, onde estão, quantos são e para qual destino seguem. A falta de comunicação pode gerar volume não carregado, envio incorreto ou atraso no fechamento da porta.\n\nCuidados com itens restritos\nAntes de retirar bagagem de mão da cabine, o passageiro deve ser orientado a remover itens que não podem seguir no porão, como baterias sobressalentes, powerbanks, eletrônicos essenciais, documentos, medicamentos e objetos de valor.\n\nExemplo prático\nO voo está com ocupação alta e a tripulação informa limitação de espaço. A equipe de gate seleciona volumes maiores, etiqueta corretamente, orienta passageiros a retirar itens essenciais e comunica a rampa sobre quantidade e localização.\n\nMensagem principal\nDespachar bagagem no portão sem controle cria risco. O processo precisa de etiqueta, orientação e comunicação."},{"title":"Irregularidades no gate","type":"Simulação","duration":"11 min","content":"Irregularidades no gate\n\nObjetivo da trilha\nAtuar em situações fora do padrão no portão sem comprometer segurança, rastreabilidade e experiência do passageiro.\n\nO portão concentra pressão de tempo e expectativa do passageiro. Atrasos, troca de portão, divergência documental, passageiro atrasado, overbooking, assistência não registrada, comportamento agressivo e impedimento de embarque podem ocorrer em poucos minutos. A resposta do agente precisa ser técnica e calma.\n\nTipos comuns de irregularidade\n- Passageiro late show.\n- Passageiro em voo ou trecho incorreto.\n- Documento pendente.\n- Bagagem de mão fora do padrão.\n- Passageiro com assistência não prevista.\n- Menor desacompanhado com pendência.\n- Overbooking ou preterição.\n- Mudança de portão.\n- Atraso operacional sem previsão definitiva.\n- Conflito ou comportamento disruptivo.\n\nConduta profissional\n1. Escutar e identificar o problema real.\n2. Conferir informação no sistema ou com área responsável.\n3. Explicar o limite operacional com clareza.\n4. Oferecer alternativa quando disponível.\n5. Acionar supervisão em caso sensível.\n6. Registrar ocorrência e orientação dada.\n\nOverbooking e preterição\nQuando há mais passageiros aptos do que assentos disponíveis, a situação deve ser tratada conforme regra aplicável, com transparência, busca de voluntários quando prevista, alternativas e registro. O agente não deve improvisar promessa ou ocultar informação.\n\nConflito no portão\nEm conflito, a equipe deve manter distância segura, tom calmo, linguagem objetiva e apoio de supervisão ou segurança quando necessário. A prioridade é proteger pessoas e operação.\n\nMensagem principal\nIrregularidade no gate exige método: conferir, comunicar, resolver ou escalar, sempre registrando."},{"title":"Fechamento do voo","type":"Checklist","duration":"10 min","content":"Fechamento do voo\n\nObjetivo da trilha\nFinalizar o embarque com conciliação correta, informação completa às áreas e liberação operacional segura.\n\nO fechamento do voo é a etapa em que o portão confirma que o embarque foi concluído e que as áreas envolvidas podem seguir para fechamento operacional. Um fechamento apressado ou sem conciliação pode gerar passageiro ausente com bagagem a bordo, informação incorreta para tripulação ou atraso de partida.\n\nChecklist de fechamento\n- Passageiros embarcados confirmados.\n- Ausentes identificados.\n- Pendências resolvidas ou escaladas.\n- Bagagens de passageiros ausentes tratadas conforme procedimento.\n- Gate bags informadas e carregadas.\n- Passageiros especiais comunicados à tripulação quando aplicável.\n- Documentação final conferida.\n- Horário de fechamento registrado.\n- Informações relevantes repassadas à coordenação.\n\nComunicação final\nA comunicação precisa ser objetiva: número de passageiros embarcados, ausentes, casos especiais, volumes de portão, pendências e autorização para fechamento. Mensagens incompletas atrasam a tomada de decisão.\n\nRastreabilidade\nTudo que foge do fluxo padrão deve ter registro. Passageiro retirado, recusa de embarque, alteração de portão, bagagem retirada, conflito, assistência não prevista e late show devem ficar documentados de forma clara.\n\nExemplo prático\nApós última chamada, dois passageiros permanecem ausentes. O portão informa coordenação e rampa, verifica existência de bagagem despachada, aguarda orientação e registra o resultado. Só depois o voo é fechado.\n\nMensagem principal\nFechamento correto é segurança operacional. O voo só deve ser liberado quando passageiros, bagagens e informações estiverem conciliados."}]$json_embarque_controle_portao$::jsonb, $mat_embarque_controle_portao$Preparação do portão

Preparação do portão

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

---

Sequência de embarque

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

---

Conferência e conciliação

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

---

Bagagem no portão

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

---

Irregularidades no gate

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

---

Fechamento do voo

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
Fechamento correto é segurança operacional. O voo só deve ser liberado quando passageiros, bagagens e informações estiverem conciliados.$mat_embarque_controle_portao$)
)
update public.academy_courses as c
set
    modules = u.modules,
    material = u.material
from course_content_update as u
where c.id = u.id;

-- Cursos neste lote:
-- restituicao-bagagem-sla
-- siga-gestao-aeroportuaria
-- checkin-operacional
-- embarque-controle-portao
