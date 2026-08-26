-- Lote 08: restaura conteudo completo dos cursos no Supabase.
-- Execute este arquivo no SQL Editor do Supabase.

with course_content_update(id, modules, material) as (
values
('comunicacao-operacional-aeroportuaria', $json_comunicacao_operacional_aeroportuaria$[{"title":"Princípios da comunicação operacional","type":"Aula","duration":"12 min","content":"Princípios da comunicação operacional\n\nObjetivo da trilha\nEntender como a comunicação reduz erro, aumenta coordenação entre áreas e fortalece a segurança operacional.\n\nComunicação operacional é a troca estruturada de informações necessárias para que a operação aeroportuária aconteça com segurança, pontualidade e rastreabilidade. Ela conecta atendimento, check-in, gate, rampa, BHS, restituição, manutenção, segurança, coordenação, supervisão e demais áreas envolvidas no voo.\n\nUma comunicação boa não é apenas falar rápido. Ela precisa ser clara, objetiva, confirmada e útil para decisão. Em ambiente aeroportuário, uma informação incompleta pode gerar atraso, bagagem fora do voo, passageiro sem assistência, falha de carregamento, conflito no portão ou risco de segurança.\n\nPrincípios essenciais\n- Clareza: usar palavras simples e diretas.\n- Precisão: informar voo, local, horário, item, responsável e impacto.\n- Confirmação: garantir que a outra área recebeu e entendeu.\n- Rastreabilidade: registrar o que precisa permanecer como histórico.\n- Prioridade: diferenciar informação crítica de informação rotineira.\n- Respeito: manter tom profissional mesmo sob pressão.\n\nO que uma mensagem deve responder\nQuem está informando? O que aconteceu? Onde aconteceu? Qual voo ou processo está envolvido? Qual é o impacto? O que precisa ser feito? Quem é responsável pela próxima ação? Até quando?\n\nErros comuns\n- Mensagens vagas: “deu problema no voo”.\n- Falta de identificação: não informar voo, horário ou local.\n- Promessa sem confirmação: “já vai sair”.\n- Boato operacional: repassar informação sem fonte.\n- Falta de retorno: pedir ação e não confirmar conclusão.\n\nMensagem principal\nComunicação operacional não é conversa paralela. É ferramenta de segurança, continuidade e controle."},{"title":"Briefing e alinhamento do turno","type":"Procedimento","duration":"12 min","content":"Briefing e alinhamento do turno\n\nObjetivo da trilha\nOrganizar a equipe antes da operação, alinhando prioridades, riscos, mudanças e responsabilidades.\n\nO briefing é o momento em que a equipe constrói uma visão comum do turno. Ele deve ser curto, objetivo e orientado à ação. Sem briefing, cada pessoa começa o trabalho com informações diferentes, e a operação perde coordenação logo nos primeiros eventos críticos.\n\nTemas do briefing\n- Voos do turno e horários críticos.\n- Picos de passageiros e bagagens.\n- Equipamentos indisponíveis ou restrições de infraestrutura.\n- Mudanças de gate, esteira, sala, posição ou procedimento.\n- Passageiros com assistência especial ou casos sensíveis.\n- Bagagens especiais, conexões críticas ou volumes prioritários.\n- Ocorrências abertas do turno anterior.\n- Condições meteorológicas ou restrições operacionais.\n- Distribuição de funções e responsáveis.\n- Canal de comunicação e forma de escalonamento.\n\nBriefing eficiente\nUm briefing eficiente não precisa ser longo. O importante é que todos saiam sabendo o que merece atenção, quem decide, quem executa, onde buscar informação confiável e quando reportar desvio.\n\nModelo simples\n1. Situação do turno: volume, voos e riscos.\n2. Recursos: equipe, equipamentos e áreas disponíveis.\n3. Pendências: o que vem do turno anterior.\n4. Prioridades: o que não pode falhar.\n5. Comunicação: canais, responsáveis e escalonamento.\n6. Confirmação: espaço para dúvidas rápidas.\n\nPapel da liderança\nA liderança deve transformar informação em direção prática. Um bom briefing não é leitura de lista; é alinhamento para execução. Se houver mudança durante o turno, a equipe deve receber atualização com a mesma clareza.\n\nMensagem principal\nBriefing reduz improviso. Uma equipe alinhada antes do voo responde melhor quando a operação aperta."},{"title":"Passagem de turno e continuidade","type":"Checklist","duration":"12 min","content":"Passagem de turno e continuidade\n\nObjetivo da trilha\nGarantir que informações importantes não se percam quando uma equipe substitui outra.\n\nA passagem de turno é uma das etapas mais sensíveis da operação. Muitas falhas acontecem não porque ninguém sabia resolver, mas porque a informação ficou com quem saiu do turno. O objetivo é transferir contexto, pendências e próximos passos com precisão.\n\nO que deve ser transferido\n- Voos ainda em andamento.\n- Passageiros aguardando solução.\n- Bagagens pendentes, localizadas, retidas ou aguardando envio.\n- Casos de AHL, OHD, DPR, RFP ou entrega com ação pendente.\n- Solicitações abertas de outras bases ou setores.\n- Equipamentos indisponíveis ou com restrição.\n- Ocorrências de segurança ou quase falhas.\n- Decisões tomadas e responsáveis já acionados.\n- Prazos próximos e horários combinados.\n\nFormato recomendado\nA passagem deve combinar registro escrito com conversa objetiva. O registro garante rastreabilidade; a conversa permite esclarecer contexto. Se houver apenas conversa, a informação pode se perder. Se houver apenas registro sem explicação, a equipe pode não entender a urgência.\n\nPerguntas para validar a passagem\n- O que ainda precisa ser feito?\n- Quem está responsável?\n- Qual é o prazo?\n- Qual foi a última ação tomada?\n- Quem já foi informado?\n- O passageiro ou setor aguarda retorno?\n- Existe risco operacional se nada for feito?\n\nFalhas comuns\n- Escrever “pendente” sem explicar pendência.\n- Não informar contato feito com passageiro.\n- Não registrar horário da última atualização.\n- Transferir apenas parte do caso.\n- Deixar informação em mensagens pessoais sem registro formal.\n\nMensagem principal\nPassagem de turno boa evita que o passageiro conte a história de novo e evita que a operação recomece do zero."},{"title":"Mensagens em tempo real","type":"Prática guiada","duration":"13 min","content":"Mensagens em tempo real\n\nObjetivo da trilha\nConstruir mensagens operacionais curtas, acionáveis e confirmáveis durante a operação.\n\nDurante a operação, a equipe precisa tomar decisões em movimento. Portão muda, bagagem atrasa, voo troca posição, passageiro precisa de assistência, rampa solicita informação, restituição identifica volume sem dono. A mensagem em tempo real deve permitir ação rápida sem gerar interpretação errada.\n\nEstrutura de uma boa mensagem\n- Identificação: quem envia e de qual área.\n- Referência: voo, processo, etiqueta, gate, esteira ou posição.\n- Fato: o que aconteceu, sem julgamento desnecessário.\n- Impacto: atraso, passageiro aguardando, bagagem crítica, segurança, conexão.\n- Ação solicitada: o que precisa ser feito.\n- Prazo: quando precisa de retorno.\n- Confirmação: quem recebeu e assumiu.\n\nExemplo fraco\n“Tem uma mala aqui com problema.”\n\nExemplo melhor\n“Restituição informa: bagagem sem etiqueta na esteira 03, chegada do voo 1234, cor preta rígida, passageiro não identificado. Solicito apoio para verificação de leitura/BHS e orientação se abre OHD.”\n\nCanais de comunicação\nCada operação pode ter canais próprios: rádio, telefone, sistema, grupo operacional ou registro interno. O canal deve ser adequado ao tipo de informação. Mensagem crítica não deve depender de canal que ninguém monitora.\n\nConfirmação de recebimento\nA confirmação não é burocracia. Ela mostra que a mensagem chegou a alguém responsável. Em situações críticas, deve haver retorno da ação: recebido, em atendimento, concluído, sem condição, escalonado.\n\nMensagem principal\nMensagem operacional boa é aquela que permite agir. Se o receptor precisa adivinhar, a mensagem falhou."},{"title":"Registro e rastreabilidade","type":"Procedimento","duration":"13 min","content":"Registro e rastreabilidade\n\nObjetivo da trilha\nTransformar decisões e comunicações importantes em histórico verificável.\n\nNem toda conversa precisa virar relatório, mas toda decisão operacional relevante precisa deixar rastro. Registro é o que permite continuidade, auditoria, investigação, defesa do atendimento e melhoria. Sem registro, a operação depende da memória individual.\n\nO que registrar\n- Decisões que afetam passageiro, bagagem, voo ou segurança.\n- Mudanças de procedimento durante o turno.\n- Assistência concedida ou recusada.\n- Contatos feitos e tentativas de contato.\n- Ocorrências, incidentes, quase falhas e desvios.\n- Bagagens ou itens com tratamento especial.\n- Solicitações entre áreas ou bases.\n- Promessas feitas ao passageiro e prazos informados.\n- Motivos de recusa ou impossibilidade operacional.\n\nQualidade do registro\nUm registro deve ser objetivo, datado, compreensível e livre de julgamento pessoal. Ele deve indicar fato, ação e resultado. Evite textos ofensivos, suposições, abreviações desconhecidas e frases vagas.\n\nExemplo fraco\n“Passageiro reclamou muito.”\n\nExemplo melhor\n“Passageiro informado às 14:20 sobre atraso de entrega da bagagem. Endereço confirmado. Nova previsão enviada ao fornecedor às 14:35. Próximo retorno previsto até 16:00.”\n\nRastreabilidade entre áreas\nQuando uma área registra corretamente, outra consegue continuar. Isso é essencial em casos de bagagem, assistência especial, irregularidade de voo, item perigoso, dano, objeto encontrado ou conexão crítica.\n\nCultura justa\nRegistro não deve ser usado apenas para procurar culpados. Ele deve ajudar a identificar perigo, corrigir processo e aprender. A cultura de reporte melhora quando a equipe percebe que registrar ajuda a operação e protege todos.\n\nMensagem principal\nO que não fica registrado desaparece da operação. O registro certo transforma conversa em continuidade."},{"title":"Comunicação em contingência","type":"Simulação","duration":"13 min","content":"Comunicação em contingência\n\nObjetivo da trilha\nManter informação confiável e coordenação quando a operação sai da normalidade.\n\nContingência é qualquer situação que rompe o fluxo normal: atraso em cadeia, cancelamento, queda de sistema, restrição meteorológica, fila crítica, falha de equipamento, indisponibilidade de esteira, conflito no portão, bagagem não localizada em volume relevante ou ocorrência de segurança.\n\nRisco da comunicação em crise\nQuando há pressão, surgem boatos, mensagens contraditórias e promessas apressadas. O passageiro escuta uma coisa no balcão, outra no gate e outra na restituição. A equipe também se perde, porque cada área toma decisão com informação diferente.\n\nFonte única de informação\nA liderança deve definir uma fonte confiável para atualização. Essa fonte pode ser coordenação, supervisão ou sistema operacional. O importante é que todos saibam onde confirmar a informação antes de comunicar ao passageiro ou executar ação relevante.\n\nRitmo de atualização\nMesmo quando não há solução final, a equipe precisa atualizar. Dizer “ainda estamos verificando e retornaremos em novo horário” é melhor do que deixar silêncio. A atualização reduz ansiedade e evita acúmulo de perguntas individuais.\n\nEscalonamento\nNem tudo pode ser decidido pelo primeiro atendimento. Situações com risco de segurança, conflito, mídia, passageiro vulnerável, falha sistêmica, impacto em muitos voos ou exceção à regra devem ser escalonadas rapidamente.\n\nPlano de comunicação\n1. Definir fonte oficial de informação.\n2. Separar mensagens para equipe e para passageiros.\n3. Padronizar linguagem.\n4. Atualizar em intervalos definidos.\n5. Registrar decisões críticas.\n6. Encerrar a contingência com debriefing.\n\nMensagem principal\nEm contingência, comunicação é controle operacional. Sem mensagem única, a crise se multiplica."}]$json_comunicacao_operacional_aeroportuaria$::jsonb, $mat_comunicacao_operacional_aeroportuaria$Princípios da comunicação operacional

Princípios da comunicação operacional

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

---

Briefing e alinhamento do turno

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

---

Passagem de turno e continuidade

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

---

Mensagens em tempo real

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

---

Registro e rastreabilidade

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

---

Comunicação em contingência

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
Em contingência, comunicação é controle operacional. Sem mensagem única, a crise se multiplica.$mat_comunicacao_operacional_aeroportuaria$),
('contestacao-operacional-aviacao', $json_contestacao_operacional_aviacao$[{"title":"Conceito de contestação","type":"Aula","duration":"12 min","content":"Conceito de contestação\n\nObjetivo da trilha\nEntender contestação como análise técnica, documental e responsável de uma reclamação, cobrança ou imputação operacional.\n\nContestação operacional é o processo de verificar se uma reclamação, custo, responsabilização ou pedido de compensação procede. Ela não existe para negar o passageiro ou proteger uma área a qualquer custo. Existe para separar fato comprovado, alegação, responsabilidade, exceção, falha de processo e decisão final.\n\nOnde aparece\nA contestação pode ocorrer em casos de bagagem danificada, bagagem violada, extravio, atraso de entrega, assistência material, reembolso, custo entre bases, fault station, reason for loss, objeto encontrado, atendimento considerado inadequado ou divergência entre registros de áreas diferentes.\n\nTrês resultados possíveis\n- Procedente: a análise confirma a reclamação ou responsabilidade.\n- Parcialmente procedente: parte do que foi reclamado é confirmada e parte não é comprovada ou não tem vínculo operacional.\n- Improcedente: as evidências disponíveis não confirmam a reclamação ou indicam ausência de responsabilidade operacional.\n\nO que contestação não é\n- Não é resposta automática negativa.\n- Não é opinião pessoal do agente.\n- Não é apagar histórico desfavorável.\n- Não é procurar culpado sem evidência.\n- Não é tratar o passageiro como adversário.\n\nPerguntas iniciais\nO que foi reclamado? Quando ocorreu? Qual voo, processo ou serviço está envolvido? Há vínculo com o transporte aéreo? O prazo foi respeitado? Existem documentos mínimos? Há evidência do fato? Há registro anterior? Há duplicidade?\n\nMensagem principal\nContestação boa é técnica e respeitosa. Ela protege o passageiro, a operação e a qualidade da decisão."},{"title":"Coleta de evidências","type":"Checklist","duration":"14 min","content":"Coleta de evidências\n\nObjetivo da trilha\nIdentificar quais documentos e registros sustentam uma contestação confiável.\n\nUma contestação sem evidência vira opinião. A força da análise depende de dados objetivos que possam ser conferidos por outra pessoa. O agente deve buscar fontes primárias: sistema, histórico, fotos, recibos, etiquetas, horários, mensagens, relatórios, comprovantes e documentos apresentados pelo passageiro.\n\nEvidências comuns em bagagem\n- Número da etiqueta e comprovante de despacho.\n- Fotos da bagagem no ato do recebimento ou reclamação.\n- Registro de dano pré-existente ou limitação de responsabilidade.\n- Histórico de AHL, OHD, DPR, RFP ou entrega.\n- Data e hora de abertura do processo.\n- Voo, rota e esteira de restituição.\n- Recibo de entrega e confirmação de endereço.\n- Mensagens entre bases, rampa, BHS ou fornecedor.\n- Relato objetivo do passageiro e da equipe.\n\nEvidências em atendimento ou voo\n- Protocolo de atendimento.\n- Cartão de embarque, bilhete ou reserva.\n- Horário de chegada, embarque, cancelamento ou alteração.\n- Alternativas oferecidas.\n- Assistência concedida ou recusada.\n- Mensagens de supervisão ou coordenação.\n- Registro de contato e tentativa de contato.\n\nQualidade da evidência\nA evidência deve ter vínculo com o caso, data, origem e conteúdo legível. Foto sem data, print cortado, mensagem sem identificação ou relato sem contexto enfraquece a contestação. Se a evidência não for suficiente, a resposta deve reconhecer a limitação da análise.\n\nOrganização do dossiê\n1. Separar dados do passageiro e do processo.\n2. Montar linha do tempo.\n3. Anexar documentos por tipo.\n4. Destacar registros que comprovam decisão.\n5. Apontar lacunas de informação.\n6. Concluir com base no conjunto de evidências.\n\nMensagem principal\nQuem contesta precisa provar. Evidência organizada evita resposta frágil e reduz retrabalho."},{"title":"Prazos e admissibilidade","type":"Procedimento","duration":"13 min","content":"Prazos e admissibilidade\n\nObjetivo da trilha\nVerificar se a reclamação pode ser analisada e quais condições mínimas precisam estar presentes antes do mérito.\n\nAntes de discutir se a reclamação procede, é preciso verificar admissibilidade. Isso significa confirmar se a demanda tem relação com o transporte aéreo, se foi apresentada por pessoa legitimada, se há documentos mínimos, se não há duplicidade e se o prazo aplicável foi observado.\n\nPontos de admissibilidade\n- A reclamação tem relação com serviço aéreo prestado?\n- O passageiro ou representante tem legitimidade?\n- O processo se refere ao mesmo fato de uma demanda já aberta?\n- Há documento, bilhete, etiqueta, protocolo ou informação mínima para localizar o caso?\n- O prazo de reclamação aplicável foi respeitado?\n- A demanda exige complemento antes da análise?\n\nPrazos\nPrazos variam conforme o tipo de ocorrência, legislação aplicável, rota, canal e política operacional. Por isso, o agente deve consultar a regra vigente antes de concluir. Em plataformas regulatórias, também podem existir prazos específicos para resposta e para interação posterior do passageiro.\n\nDuplicidade\nDuas reclamações sobre o mesmo fato podem gerar confusão, respostas divergentes e duplicidade de compensação. Quando houver duplicidade, deve-se identificar o processo principal, registrar vínculo e orientar a continuidade no canal correto.\n\nComplementação\nSe faltar informação essencial, a equipe deve pedir complementação de forma objetiva. O pedido deve dizer exatamente o que falta: etiqueta, foto, documento, data, voo, recibo, protocolo ou autorização de representação. Pedidos genéricos atrasam o caso.\n\nQuando seguir para o mérito\nA análise de mérito começa quando há elementos mínimos para comparar alegação, registros e regra aplicável. Se o caso não for admissível, a resposta deve explicar o motivo sem linguagem hostil.\n\nMensagem principal\nAdmissibilidade vem antes do mérito. Uma contestação técnica começa confirmando se o caso pode ser analisado."},{"title":"Procedência e responsabilidade","type":"Prática guiada","duration":"14 min","content":"Procedência e responsabilidade\n\nObjetivo da trilha\nAvaliar se há responsabilidade operacional, nexo causal e base documental para aceitar, negar ou aceitar parcialmente a reclamação.\n\nProcedência é a conclusão sobre o mérito da reclamação. Ela deve resultar da comparação entre o relato do passageiro, os registros operacionais, documentos apresentados, prazos, regras aplicáveis e evidências internas.\n\nNexo causal\nNexo causal é a relação comprovável entre o fato ocorrido e o dano, custo ou reclamação. Por exemplo: uma bagagem foi entregue com dano, há foto no desembarque, não havia registro de dano pré-existente e o processo foi aberto dentro do prazo. Nesse caso, há elementos para analisar responsabilidade. Sem nexo, a contestação fica mais forte para improcedência ou procedência parcial.\n\nResponsabilidade operacional\nA responsabilidade pode estar associada ao atendimento, check-in, rampa, BHS, restituição, entrega, base de origem, base de conexão, base de destino, fornecedor ou situação externa. A análise deve evitar conclusões por aparência. É preciso olhar horários, rota, manipulação conhecida, registros e exceções.\n\nDano pré-existente e limitação\nQuando há registro anterior de dano, embalagem inadequada, item frágil mal acondicionado ou limitação aceita pelo passageiro, a decisão pode mudar. Mas isso só é válido se o registro for claro, vinculado ao volume correto e feito antes do evento reclamado.\n\nProcedência parcial\nA procedência parcial é comum. Um atraso pode ser confirmado, mas o valor pedido pode não ter comprovação. Um dano pode existir, mas parte do item reclamado pode não ter relação com transporte. Uma assistência pode ter sido devida por determinado período, mas não por todo o valor solicitado.\n\nChecklist de decisão\n- O fato ocorreu?\n- O prazo foi respeitado?\n- Há evidência suficiente?\n- Existe nexo causal?\n- Há registro prévio que limite responsabilidade?\n- Há custo comprovado?\n- A regra aplicável permite a solução solicitada?\n- A resposta aborda todos os pontos?\n\nMensagem principal\nContestação técnica decide com base em fatos, não em impressão. Procedência exige prova, regra e coerência."},{"title":"Resposta técnica ao passageiro","type":"Simulação","duration":"14 min","content":"Resposta técnica ao passageiro\n\nObjetivo da trilha\nConstruir respostas claras, respeitosas e completas para demandas procedentes, parcialmente procedentes ou improcedentes.\n\nA resposta é a face visível da contestação. Mesmo quando a decisão é negativa, o passageiro deve compreender que houve análise. Uma resposta genérica aumenta conflito; uma resposta técnica e humana reduz dúvida e melhora confiança no processo.\n\nCaracterísticas de uma boa resposta\n- Cumprimenta e identifica o caso.\n- Resume o que foi analisado.\n- Informa documentos e registros considerados.\n- Responde todos os pontos da demanda.\n- Explica a decisão com linguagem clara.\n- Indica solução, negativa ou complementação necessária.\n- Evita termos ofensivos, culpabilização e jargão excessivo.\n- Orienta próximo passo quando existir.\n\nResposta procedente\nQuando a reclamação procede, a resposta deve reconhecer o ponto confirmado, informar a solução aplicável, prazo de execução e canal de acompanhamento. Se houver ação corretiva interna, ela pode ser registrada sem expor detalhes sensíveis.\n\nResposta parcialmente procedente\nNesse caso, explique o que foi reconhecido e o que não foi comprovado. A clareza evita percepção de contradição. Exemplo: “Foi confirmada a demora na entrega; porém, os itens adicionais informados não possuem comprovação documental suficiente para análise de ressarcimento.”\n\nResposta improcedente\nA improcedência deve ser fundamentada. Evite apenas “não procede”. Explique quais registros foram consultados e por que eles não confirmam responsabilidade ou nexo causal. Se faltou documento essencial, informe isso de forma objetiva.\n\nTom adequado\nA resposta deve ser firme sem ser defensiva. O objetivo não é vencer o passageiro; é concluir a análise com respeito, transparência e base documental.\n\nMensagem principal\nBoa resposta não é longa; é completa. Ela mostra o que foi analisado, qual foi a decisão e por quê."},{"title":"Indicadores e prevenção","type":"Checklist","duration":"13 min","content":"Indicadores e prevenção\n\nObjetivo da trilha\nUsar as contestações para identificar falhas recorrentes e melhorar a operação.\n\nCada contestação revela algo sobre o processo. Se muitas reclamações são improcedentes por falta de documentação, talvez o passageiro esteja sendo mal orientado. Se muitas são procedentes por falha de registro, o problema está no fluxo interno. Se uma base concentra custos contestados, talvez exista falha de manuseio, comunicação ou entrega.\n\nIndicadores úteis\n- Quantidade de contestações por tema.\n- Percentual procedente, improcedente e parcialmente procedente.\n- Tempo médio de resposta.\n- Reclamações por base, voo, rota ou fornecedor.\n- Principais documentos ausentes.\n- Custos contestados e custos confirmados.\n- Reincidência por tipo de dano, atraso ou atendimento.\n- Falhas de registro encontradas durante a análise.\n\nPrevenção\nA melhor contestação é aquela que não precisa acontecer porque o processo foi bem executado desde o início. Fotos corretas, histórico claro, recibo preenchido, comunicação entre áreas e orientação ao passageiro reduzem conflitos futuros.\n\nAções corretivas\n- Treinar equipe em registro de evidências.\n- Padronizar fotos e descrições de dano.\n- Melhorar passagem de turno.\n- Revisar campos obrigatórios em processos de bagagem.\n- Criar checklist para casos sensíveis.\n- Monitorar fornecedores de entrega.\n- Reforçar comunicação em atrasos e irregularidades.\n\nCuidado com cultura defensiva\nSe a equipe enxerga contestação apenas como disputa, perde-se aprendizado. O ideal é usar dados para melhorar o processo, reduzir reclamações e responder com mais qualidade.\n\nMensagem principal\nContestação não termina na resposta. Ela deve gerar melhoria, reduzir reincidência e fortalecer a operação."}]$json_contestacao_operacional_aviacao$::jsonb, $mat_contestacao_operacional_aviacao$Conceito de contestação

Conceito de contestação

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

---

Coleta de evidências

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

---

Prazos e admissibilidade

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

---

Procedência e responsabilidade

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

---

Resposta técnica ao passageiro

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

---

Indicadores e prevenção

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
Contestação não termina na resposta. Ela deve gerar melhoria, reduzir reincidência e fortalecer a operação.$mat_contestacao_operacional_aviacao$),
('gestao-crise-aeroporto', $json_gestao_crise_aeroporto$[{"title":"Conceito de crise aeroportuária","type":"Aula","duration":"13 min","content":"Conceito de crise aeroportuária\n\nObjetivo da trilha\nEntender o que transforma uma ocorrência operacional em crise aeroportuária e quais são os primeiros cuidados para manter controle, segurança e comunicação.\n\nUma crise aeroportuária é uma situação que ultrapassa a rotina normal da operação e exige coordenação rápida entre áreas. Pode envolver acidente, ameaça, falha sistêmica, indisponibilidade de terminal, evento meteorológico severo, cancelamentos em massa, filas críticas, conflito com passageiros, interrupção de esteiras, pane em sistemas de atendimento, indisponibilidade de equipes ou qualquer evento com impacto amplo em segurança, continuidade e imagem institucional.\n\nDiferença entre ocorrência e crise\nUma ocorrência é um desvio pontual que pode ser tratado pelo fluxo normal. Uma crise surge quando o desvio afeta várias pessoas, áreas ou processos, quando há risco à segurança, quando a decisão precisa ser escalonada ou quando a comunicação passa a exigir fonte oficial. A mesma falha pode ser pequena ou crítica dependendo de horário, volume de passageiros, exposição, recursos disponíveis e risco envolvido.\n\nElementos de uma crise\n- Evento fora da normalidade.\n- Impacto em segurança, continuidade, atendimento ou reputação.\n- Necessidade de coordenação entre áreas.\n- Informação incompleta ou em rápida mudança.\n- Pressão de tempo.\n- Necessidade de registro e rastreabilidade.\n- Possibilidade de passageiros vulneráveis afetados.\n\nPrimeiras ações\nA primeira resposta deve priorizar segurança das pessoas, preservação de informações, acionamento correto e comunicação controlada. O agente não precisa resolver tudo sozinho; precisa identificar o risco, acionar a liderança, seguir procedimento local, registrar fatos e evitar divulgar informação não confirmada.\n\nCultura de segurança\nA gestão de crise se conecta ao Sistema de Gerenciamento da Segurança Operacional, que trabalha com identificação de perigos, gestão de riscos, ações corretivas, treinamento, comunicação e melhoria contínua. Uma crise deve gerar aprendizado, não apenas encerramento administrativo.\n\nMensagem principal\nCrise não é apenas evento grande. É qualquer situação em que a operação perde previsibilidade e precisa recuperar controle com método, comunicação e responsabilidade."},{"title":"Comando e papéis","type":"Procedimento","duration":"14 min","content":"Comando e papéis\n\nObjetivo da trilha\nCompreender como responsabilidades claras reduzem improviso e evitam conflito de decisão durante uma crise.\n\nDurante uma crise, a operação precisa de comando definido. Isso não significa centralizar todas as tarefas em uma pessoa, mas estabelecer quem valida informação, quem decide, quem executa, quem comunica, quem registra e quem acompanha pendências. Quando todos tentam decidir ao mesmo tempo, surgem mensagens contraditórias, atrasos e retrabalho.\n\nPapéis essenciais\n- Coordenação ou liderança: define prioridade, valida informações e autoriza decisões fora da rotina.\n- Atendimento: orienta passageiros, identifica necessidades especiais e registra interações relevantes.\n- Rampa e bagagem: informam impactos operacionais, restrições, recursos e andamento de serviços.\n- Segurança: atua em risco físico, acesso, isolamento e acionamentos previstos.\n- Comunicação: padroniza mensagens internas e externas conforme orientação oficial.\n- Suporte administrativo: apoia registros, listas, contatos e documentação.\n\nEscalonamento\nO agente deve escalonar quando houver risco à segurança, mídia, conflito, passageiro vulnerável, exceção à regra, custo relevante, decisão sem precedente ou impacto em vários voos. Escalonar não é abandonar o caso; é levar a decisão para o nível correto.\n\nBriefing de crise\nUm briefing curto ajuda a alinhar: o que aconteceu, qual impacto, quais áreas envolvidas, quais ações já foram feitas, quem é responsável por cada frente, quando será a próxima atualização e qual mensagem pode ser comunicada.\n\nRegistro de responsabilidade\nDecisões precisam deixar rastro. Quem autorizou? Em qual horário? Qual ação foi determinada? Qual área assumiu? Qual foi o resultado? Esse histórico permite continuidade quando há troca de turno e apoia análise posterior.\n\nErro comum\nUm erro frequente é confundir boa vontade com coordenação. Muitas pessoas tentando ajudar sem comando claro podem bloquear passagem, duplicar contato, prometer soluções diferentes ou deixar tarefas críticas sem dono.\n\nMensagem principal\nEm crise, clareza de papéis é tão importante quanto rapidez. A equipe age melhor quando sabe exatamente quem decide e quem executa."},{"title":"Comunicação de crise","type":"Prática guiada","duration":"14 min","content":"Comunicação de crise\n\nObjetivo da trilha\nAprender a comunicar com precisão, regularidade e empatia quando a operação está sob pressão.\n\nA comunicação é uma das principais ferramentas de controle em crise. Se a informação circula sem validação, a crise cresce. Passageiros recebem versões diferentes, equipes executam ações conflitantes e a liderança perde visão do que está acontecendo. Por isso, a comunicação deve ter fonte oficial, linguagem clara, frequência definida e registro das decisões.\n\nFonte única de informação\nA liderança deve indicar onde a equipe confirmará informações: coordenação, sistema, grupo operacional autorizado, rádio ou sala de crise. A fonte única evita que prints, boatos e mensagens soltas conduzam a operação.\n\nMensagem para equipe\nA equipe precisa de informação objetiva: fato confirmado, impacto, ação esperada, responsável, prazo e próxima atualização. Exemplo: “Sistema de bagagem com instabilidade. Atendimento deve orientar passageiros que a entrega poderá atrasar. Rampa informará primeira previsão em 15 minutos. Não prometer horário final sem confirmação.”\n\nMensagem para passageiros\nA comunicação ao passageiro deve ser humana e direta. Deve explicar o que é possível confirmar, o que está sendo feito e quando haverá nova atualização. Quando não houver previsão, é melhor dizer que a previsão ainda está em apuração do que criar expectativa falsa.\n\nPeriodicidade\nMesmo sem solução final, a equipe deve atualizar em intervalos definidos. Silêncio prolongado aumenta ansiedade e provoca deslocamento de passageiros para balcões, portões e restituição. Informação curta e frequente reduz tensão.\n\nO que evitar\n- Culpar outra área em público.\n- Usar termos técnicos sem explicação.\n- Prometer solução não confirmada.\n- Divulgar causa antes de validação.\n- Responder com ironia ou irritação.\n- Enviar mensagens diferentes para públicos diferentes.\n\nMensagem principal\nComunicação de crise não é improviso. É disciplina para dizer a verdade disponível, no momento certo, com linguagem que permite ação."},{"title":"Atendimento humanizado","type":"Aula","duration":"15 min","content":"Atendimento humanizado\n\nObjetivo da trilha\nAplicar empatia, prioridade e clareza no atendimento de passageiros afetados por eventos críticos.\n\nToda crise operacional atinge pessoas. Passageiros podem estar cansados, com crianças, idosos, deficiência, conexão perdida, compromisso médico, luto, viagem internacional, barreira de idioma ou limitação financeira. O agente precisa unir regra e humanidade para reduzir sofrimento sem prometer o que não pode cumprir.\n\nEscuta ativa\nAntes de responder, o agente deve ouvir o problema real. Muitas vezes a necessidade do passageiro não é apenas saber “quando resolve”, mas entender onde aguardar, como receber atualização, se terá assistência, se precisa remarcar, como proteger bagagem ou como registrar contato.\n\nPrioridades\nPassageiros com deficiência, mobilidade reduzida, idosos, gestantes, crianças desacompanhadas e pessoas em situação de vulnerabilidade devem receber atenção especial conforme procedimento aplicável. Prioridade não significa descumprir segurança; significa ajustar suporte à necessidade.\n\nLinguagem adequada\nUse frases simples e objetivas: “Estamos verificando”, “A próxima atualização será às...”, “Seu caso foi registrado”, “Esta é a orientação disponível agora”. Evite frases como “não posso fazer nada”, “a culpa não é nossa” ou “aguarde sem previsão” quando houver possibilidade de explicar o fluxo.\n\nControle emocional\nO agente não deve absorver a agressividade do momento. Deve manter postura profissional, voz calma e foco em solução. Se houver ameaça, discriminação, risco físico ou descontrole, a situação deve ser escalonada conforme procedimento de segurança.\n\nRegistro do atendimento\nContatos, promessas, recusas, assistência oferecida e orientações relevantes devem ser registradas. Isso evita que o passageiro precise repetir tudo e protege a continuidade do atendimento.\n\nMensagem principal\nAtendimento humanizado em crise não é ceder a tudo. É tratar pessoas com dignidade enquanto a operação busca a solução possível."},{"title":"Continuidade operacional","type":"Simulação","duration":"15 min","content":"Continuidade operacional\n\nObjetivo da trilha\nOrganizar recursos e prioridades para manter ou restabelecer serviços essenciais durante a crise.\n\nContinuidade operacional é a capacidade de manter funções críticas funcionando, mesmo com restrição. Em aeroporto, algumas atividades não podem simplesmente parar: segurança, atendimento essencial, embarque, desembarque, bagagem, assistência especial, comunicação, suporte a passageiros e coordenação com áreas operacionais.\n\nServiços críticos\n- Segurança de pessoas e aeronaves.\n- Comunicação entre áreas.\n- Atendimento a passageiros vulneráveis.\n- Controle de filas e fluxo.\n- Gestão de bagagens e itens críticos.\n- Registro de ocorrências.\n- Reacomodação ou orientação quando aplicável.\n- Atualização de voos e portões.\n\nPriorização\nQuando não há recurso para tudo, a equipe deve priorizar risco e impacto. Um passageiro com assistência especial, uma esteira parada em horário de pico, um voo com conexão crítica ou uma área bloqueada podem exigir ação antes de tarefas administrativas comuns.\n\nPlanos alternativos\nA continuidade depende de alternativas: outro balcão, outra esteira, comunicação manual, reforço de equipe, redistribuição de filas, acionamento de suporte, separação de casos críticos e atualização frequente. Alternativa deve ser simples, conhecida e autorizada.\n\nPassagem de turno\nCrises frequentemente atravessam turnos. A passagem deve informar: situação atual, decisões tomadas, pendências, responsáveis, próximos horários, passageiros críticos, documentos e contatos. Sem passagem adequada, a operação recomeça do zero.\n\nRetomada\nEncerrar a crise não é apenas “voltar ao normal”. É confirmar que pendências foram tratadas, passageiros orientados, registros feitos, áreas liberadas, indicadores atualizados e lições coletadas.\n\nMensagem principal\nContinuidade operacional é manter o essencial sob controle. O objetivo é reduzir dano, proteger pessoas e recuperar previsibilidade."},{"title":"Exercícios e lições aprendidas","type":"Checklist","duration":"14 min","content":"Exercícios e lições aprendidas\n\nObjetivo da trilha\nUsar simulações, treinamentos e revisão pós-evento para fortalecer a resposta da equipe.\n\nA resposta a crises melhora quando a equipe treina antes. Exercícios permitem testar comunicação, papéis, recursos, tempo de resposta, fluxo de escalonamento e registro. O objetivo não é encenar perfeição; é encontrar fragilidades enquanto ainda há tempo de corrigir.\n\nTipos de exercício\n- Discussão de cenário em sala.\n- Simulação de comunicação interna.\n- Exercício de atendimento a passageiros afetados.\n- Teste de contato e escalonamento.\n- Simulação de indisponibilidade de sistema.\n- Exercício integrado com várias áreas.\n\nComo conduzir\nUm bom exercício define cenário, objetivos, participantes, tempo, papéis, critérios de avaliação e forma de registro. Após o exercício, a equipe deve realizar debriefing para comparar o que era esperado com o que aconteceu.\n\nLições aprendidas\nDepois de uma crise real ou simulada, registre: o que funcionou, o que atrasou, onde houve conflito de informação, quais recursos faltaram, quais decisões foram difíceis, que comunicação falhou e qual ação corretiva será implementada.\n\nPlano de ação pós-evento\nCada lição precisa virar ação. Ação sem responsável e prazo vira intenção. O plano deve indicar responsável, prazo, evidência de conclusão e forma de verificar se a melhoria funcionou.\n\nCultura justa\nA revisão deve buscar causas e melhoria, não apenas culpados. O reporte de erro, quase falha e vulnerabilidade precisa ser tratado como fonte de prevenção. Isso fortalece segurança operacional e maturidade da equipe.\n\nMensagem principal\nA crise revela o preparo da operação. Treinamento, simulação e debriefing transformam reação em competência."}]$json_gestao_crise_aeroporto$::jsonb, $mat_gestao_crise_aeroporto$Conceito de crise aeroportuária

Conceito de crise aeroportuária

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

---

Comando e papéis

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

---

Comunicação de crise

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

---

Atendimento humanizado

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

---

Continuidade operacional

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

---

Exercícios e lições aprendidas

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
A crise revela o preparo da operação. Treinamento, simulação e debriefing transformam reação em competência.$mat_gestao_crise_aeroporto$),
('qualidade-indicadores-operacionais', $json_qualidade_indicadores_operacionais$[{"title":"Conceito de qualidade operacional","type":"Aula","duration":"12 min","content":"Conceito de qualidade operacional\n\nObjetivo da trilha\nCompreender qualidade como entrega consistente, segura, rastreável e orientada por melhoria contínua.\n\nQualidade operacional é a capacidade de executar processos de forma padronizada e confiável, entregando o nível de serviço esperado com segurança, clareza e controle. Em aeroporto, qualidade aparece no atendimento, check-in, portão, rampa, bagagem, restituição, comunicação, registro e solução de irregularidades.\n\nQualidade não é apenas simpatia\nUm atendimento cordial é importante, mas não substitui precisão operacional. A qualidade exige que dados estejam corretos, prazos sejam monitorados, procedimentos sejam cumpridos e desvios sejam tratados com ação. Um processo pode parecer agradável e ainda assim falhar se gera extravio, atraso, registro incompleto ou informação incorreta.\n\nDimensões de qualidade\n- Segurança: evitar danos, riscos e violações de procedimento.\n- Pontualidade: cumprir tempos e SLAs.\n- Confiabilidade: entregar o que foi prometido.\n- Rastreabilidade: registrar ações e decisões.\n- Clareza: comunicar sem ambiguidade.\n- Melhoria: aprender com desvios.\n\nIndicadores e gestão\nA qualidade precisa ser medida. Sem indicador, a equipe depende de percepção. Indicadores mostram se o processo está melhorando, piorando ou oscilando. Eles também ajudam a priorizar recursos e justificar ações corretivas.\n\nExemplo operacional\nSe a restituição de bagagem atrasa com frequência em determinado horário, a percepção pode culpar a equipe. Um indicador bem construído pode mostrar que o gargalo está em posição remota, falta de equipamento, conflito de esteira ou dimensionamento de pessoal.\n\nMensagem principal\nQualidade operacional é transformar rotina em padrão confiável. O passageiro percebe o resultado, mas a gestão precisa enxergar o processo."},{"title":"Construção de indicadores","type":"Procedimento","duration":"14 min","content":"Construção de indicadores\n\nObjetivo da trilha\nAprender a criar indicadores úteis, mensuráveis e conectados à decisão operacional.\n\nUm indicador operacional deve responder a uma pergunta clara. Exemplo: “Estamos entregando bagagem dentro do tempo esperado?”, “Quantos processos foram abertos com dados incompletos?”, “Quais causas geram mais atrasos?”, “Qual etapa do atendimento concentra desvios?”. Se o indicador não ajuda a decidir, ele vira número decorativo.\n\nElementos de um indicador\n- Nome do indicador.\n- Objetivo ou pergunta que ele responde.\n- Meta ou limite aceitável.\n- Natureza do indicador: segurança, qualidade, prazo, produtividade ou satisfação.\n- Unidade de medida: percentual, quantidade, minutos, taxa ou índice.\n- Fonte dos dados.\n- Fórmula de cálculo.\n- Periodicidade de medição.\n- Periodicidade de revisão.\n- Responsável pelo acompanhamento.\n\nExemplo de indicador\nNome: Voos com restituição dentro do SLA.\nObjetivo: medir cumprimento do tempo de entrega de bagagem.\nFórmula: quantidade de voos dentro do SLA dividido pelo total de voos avaliados.\nUnidade: percentual.\nFonte: registros operacionais de horários.\nPeriodicidade: diária, semanal e mensal.\nResponsável: supervisão operacional.\n\nMeta\nA meta precisa ser realista e desafiadora. Meta sem base histórica pode ser injusta; meta muito fácil não promove melhoria. Quando o processo muda, a meta pode precisar de revisão documentada.\n\nCuidado com indicador mal definido\nSe cada área mede “atraso” de forma diferente, o indicador perde valor. Definições devem deixar claro início, fim, exceções e fonte oficial.\n\nMensagem principal\nIndicador bom é simples, consistente e acionável. Ele mostra onde agir e como saber se a ação funcionou."},{"title":"Coleta e confiabilidade dos dados","type":"Prática guiada","duration":"13 min","content":"Coleta e confiabilidade dos dados\n\nObjetivo da trilha\nGarantir que os dados usados em indicadores sejam íntegros, rastreáveis e comparáveis.\n\nDados operacionais passam por várias etapas: coleta, limpeza, validação, integração, padronização e preparação para análise. Se qualquer etapa falhar, o dashboard pode mostrar uma realidade falsa. Uma decisão baseada em dado ruim pode piorar o processo.\n\nColeta\nA coleta deve ocorrer perto do fato. Horários, status, ocorrências, fotos, processos, contatos e encerramentos devem ser registrados no momento correto. Registro feito depois, por memória, tende a erro.\n\nValidação\nValidar é conferir se o dado faz sentido. Um voo não pode ter entrega final antes da chegada. Um processo não deve aparecer como concluído sem ação final. Uma ocorrência não deve ter campo obrigatório em branco. A validação reduz distorções.\n\nPadronização\nUse nomes, códigos, horários e categorias de forma padronizada. Se uma equipe registra “atraso bagagem”, outra “bag atrasada” e outra “demora esteira”, a análise fica fragmentada. Padronizar aumenta comparabilidade.\n\nRastreabilidade\nTodo dado importante deve poder ser explicado: de onde veio, quem registrou, quando foi alterado e qual regra foi usada. Rastreabilidade protege a equipe e permite auditoria.\n\nQualidade e confidencialidade\nDados podem conter informações pessoais e operacionais sensíveis. A análise deve respeitar acesso autorizado, necessidade operacional e proteção de dados. Nem todo painel deve ser aberto para todos.\n\nMensagem principal\nIndicador confiável começa no registro. Não existe dashboard bom com dado fraco."},{"title":"Análise de causa e tendência","type":"Aula","duration":"14 min","content":"Análise de causa e tendência\n\nObjetivo da trilha\nInterpretar indicadores para descobrir padrões, causas prováveis e riscos emergentes.\n\nAnalisar indicador não é apenas dizer se está verde ou vermelho. É entender o motivo do resultado. Um desvio pode vir de falha de processo, equipamento, treinamento, comunicação, sistema, clima, volume, conexão crítica, fornecedor ou regra mal aplicada.\n\nTipos de análise\n- Descritiva: o que aconteceu?\n- Diagnóstica: por que aconteceu?\n- Preditiva: o que pode acontecer se a tendência continuar?\n- Prescritiva: qual ação deve ser tomada?\n\nTendência\nTendência mostra comportamento ao longo do tempo. Um mês ruim pode ser exceção; três meses de piora indicam risco. A análise deve comparar períodos, turnos, áreas, voos, rotas e tipos de ocorrência.\n\nPareto\nO Pareto ajuda a identificar poucas causas que geram grande parte dos problemas. Se 70% dos atrasos de restituição estão em voos remotos, o plano de ação deve focar nesse fluxo antes de tentar corrigir tudo ao mesmo tempo.\n\nCausa raiz\nCausa raiz é o fator que originou ou contribuiu de forma relevante para o desvio. Cuidado para não parar no sintoma. “Bagagem atrasou” é efeito. A causa pode ser falta de trator, esteira indisponível, porão liberado tarde, documentação incompleta ou prioridade mal definida.\n\nPerguntas úteis\nO desvio é recorrente? Em qual turno? Com qual rota? Qual etapa demora mais? Houve mudança de processo? A equipe foi treinada? O dado é confiável? A meta é adequada?\n\nMensagem principal\nAnálise boa transforma número em ação. O indicador mostra o sinal; a investigação mostra o caminho."},{"title":"Dashboards e tomada de decisão","type":"Simulação","duration":"13 min","content":"Dashboards e tomada de decisão\n\nObjetivo da trilha\nConstruir painéis que apoiem decisões rápidas, claras e baseadas em prioridade.\n\nDashboard operacional deve facilitar leitura. Ele precisa mostrar o que está acontecendo, o que exige atenção e qual ação deve ser tomada. Painel bonito, mas sem decisão, não melhora a operação.\n\nElementos de um bom dashboard\n- Indicador principal.\n- Meta ou limite.\n- Status atual.\n- Tendência.\n- Comparativo com período anterior.\n- Segmentação por área, turno, rota ou processo.\n- Alertas de desvio.\n- Responsável ou próximo passo.\n\nCores e contraste\nCores devem apoiar interpretação: verde para dentro do esperado, amarelo para atenção, vermelho para desvio crítico. Mas a cor não deve ser a única informação. Texto, números e legenda precisam deixar o status compreensível.\n\nNíveis de painel\nPainel executivo: mostra visão geral, tendência e riscos principais.\nPainel operacional: mostra filas, voos, pendências, SLA, alertas e responsáveis.\nPainel analítico: permite investigar causa, histórico e detalhe.\n\nTomada de decisão\nO dashboard deve responder: qual problema exige ação agora? Quem é responsável? Qual impacto? Há tendência de piora? A ação anterior funcionou? O risco está controlado?\n\nCuidado com excesso\nMuitos indicadores na mesma tela confundem. É melhor ter poucos indicadores bem escolhidos, com filtros claros, do que dezenas de números sem prioridade.\n\nMensagem principal\nDashboard é instrumento de decisão. Se ninguém age ao olhar o painel, ele precisa ser redesenhado."},{"title":"Plano de ação e melhoria contínua","type":"Checklist","duration":"14 min","content":"Plano de ação e melhoria contínua\n\nObjetivo da trilha\nTransformar desvios identificados em ações corretivas acompanhadas até resultado comprovado.\n\nQuando um indicador aponta falha, o próximo passo é agir. A ação deve ser específica, responsável e verificável. Frases como “melhorar comunicação” ou “reforçar atenção” são insuficientes se não indicam o que muda na prática.\n\nEstrutura do plano de ação\n- Desvio identificado.\n- Causa provável ou causa raiz.\n- Ação corretiva ou preventiva.\n- Responsável.\n- Prazo.\n- Recursos necessários.\n- Evidência de conclusão.\n- Indicador de acompanhamento.\n- Data de revisão.\n\nExemplo prático\nDesvio: aumento de processos de bagagem com campo obrigatório incompleto.\nCausa provável: falta de checklist no atendimento.\nAção: inserir checklist antes de salvar o processo e treinar equipe.\nResponsável: supervisão.\nPrazo: 10 dias.\nVerificação: percentual de processos completos por semana.\n\nAção corretiva e preventiva\nAção corretiva trata desvio que já ocorreu. Ação preventiva reduz chance de repetição. Em operações maduras, a equipe usa indicadores para agir antes que a falha vire crise.\n\nRevisão de eficácia\nConcluir uma ação não significa que ela funcionou. É preciso medir depois. Se o indicador não melhora, a causa pode estar errada, a ação pode ser fraca ou a execução pode não ter ocorrido como planejado.\n\nCultura de melhoria\nA melhoria contínua depende de dados, disciplina e abertura para aprender. O objetivo não é criar culpa, mas reduzir risco, aumentar eficiência e melhorar experiência do passageiro.\n\nMensagem principal\nMedição sem ação é relatório. Ação sem verificação é tentativa. Melhoria contínua exige fechar o ciclo."}]$json_qualidade_indicadores_operacionais$::jsonb, $mat_qualidade_indicadores_operacionais$Conceito de qualidade operacional

Conceito de qualidade operacional

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

---

Construção de indicadores

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

---

Coleta e confiabilidade dos dados

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

---

Análise de causa e tendência

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

---

Dashboards e tomada de decisão

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

---

Plano de ação e melhoria contínua

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
Medição sem ação é relatório. Ação sem verificação é tentativa. Melhoria contínua exige fechar o ciclo.$mat_qualidade_indicadores_operacionais$)
)
update public.academy_courses as c
set
    modules = u.modules,
    material = u.material
from course_content_update as u
where c.id = u.id;

-- Cursos neste lote:
-- comunicacao-operacional-aeroportuaria
-- contestacao-operacional-aviacao
-- gestao-crise-aeroporto
-- qualidade-indicadores-operacionais
