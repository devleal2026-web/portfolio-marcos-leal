-- Lote 07: restaura conteudo completo dos cursos no Supabase.
-- Execute este arquivo no SQL Editor do Supabase.

with course_content_update(id, modules, material) as (
values
('irregularidades-voo', $json_irregularidades_voo$[{"title":"Tipos de irregularidade","type":"Aula","duration":"12 min","content":"Tipos de irregularidade\n\nObjetivo da trilha\nReconhecer os principais tipos de irregularidade de voo e entender como cada uma afeta a jornada do passageiro.\n\nIrregularidade de voo é qualquer evento que altera a execução normal da viagem e impacta o passageiro. Pode ocorrer antes do embarque, durante a conexão, depois do embarque ou até após a chegada, quando há reflexo em bagagem, transporte, acomodação ou continuidade da viagem.\n\nTipos mais comuns\n- Atraso: o voo não parte ou não chega no horário previsto.\n- Cancelamento: o voo deixa de ser realizado.\n- Interrupção: a viagem é interrompida antes do destino final.\n- Alteração programada: mudança feita antes da data do voo, como horário, rota ou aeroporto.\n- Perda de conexão: passageiro perde o próximo trecho por atraso, mudança operacional ou tempo insuficiente.\n- Preterição de embarque: passageiro apto não embarca por motivo operacional, como indisponibilidade de assento.\n- Mudança de portão ou aeronave: altera fluxo, tempo de deslocamento ou capacidade.\n- Contingência sistêmica: falha de sistema, fila extensa, queda de comunicação ou operação manual.\n\nImpacto na jornada\nPara o passageiro, a irregularidade gera incerteza. Ele quer saber o que aconteceu, quanto tempo vai esperar, quais opções possui, quem pagará assistência, onde retirar bagagem e como continuará a viagem. O agente deve transformar incerteza em orientação.\n\nDiferença entre causa e efeito\nA causa pode ser manutenção, meteorologia, restrição de tráfego aéreo, tripulação, segurança, infraestrutura, sistema ou malha aérea. O efeito é o que o passageiro vive: espera, perda de conexão, remarcação, pernoite, reembolso, mudança de rota ou impossibilidade de embarque.\n\nConduta inicial\n1. Confirmar o status do voo em fonte confiável.\n2. Identificar passageiros impactados.\n3. Separar casos simples e casos sensíveis.\n4. Verificar alternativas permitidas.\n5. Comunicar com clareza e atualizar sempre que houver nova informação.\n6. Registrar orientações e decisões relevantes.\n\nMensagem principal\nIrregularidade de voo não é apenas atraso. É uma ruptura na jornada que exige informação, alternativa, assistência e registro."},{"title":"Informação ao passageiro","type":"Procedimento","duration":"12 min","content":"Informação ao passageiro\n\nObjetivo da trilha\nComunicar atrasos, cancelamentos e mudanças operacionais de forma clara, tempestiva e segura.\n\nA informação é a primeira assistência ao passageiro. Em uma irregularidade, silêncio aumenta tensão, boatos e conflito. Mesmo quando ainda não existe solução definitiva, o passageiro precisa saber que a situação está sendo acompanhada, qual é o status atual e quando haverá nova atualização.\n\nPrincípios de comunicação\n- Clareza: usar linguagem simples e direta.\n- Atualização: informar sempre que houver mudança relevante.\n- Transparência: não esconder incerteza nem inventar previsão.\n- Coerência: garantir que balcão, portão, aplicativo e alto-falante não transmitam mensagens conflitantes.\n- Empatia: reconhecer o impacto na vida do passageiro.\n- Registro: documentar orientação dada em casos sensíveis.\n\nO que informar\n- Status atual do voo.\n- Motivo quando estiver disponível e autorizado.\n- Previsão de nova atualização.\n- Alternativas possíveis, quando confirmadas.\n- Assistência material aplicável.\n- Local de atendimento.\n- Orientações para conexões, bagagens e passageiros especiais.\n\nComo falar quando não há previsão\nNão é correto inventar horário para acalmar a fila. A melhor prática é dizer que ainda não há previsão confirmada, explicar que a equipe está acompanhando e informar quando a próxima atualização será dada. Promessa falsa piora a experiência e fragiliza a operação.\n\nExemplo de comunicação adequada\n“Senhores passageiros do voo informado, ainda aguardamos confirmação operacional para nova previsão. A equipe está acompanhando a situação e retornaremos com atualização assim que houver informação segura. Passageiros com conexão ou necessidade de assistência podem procurar a equipe no balcão.”\n\nComunicação individual\nAlguns passageiros precisam de abordagem individual: PNAE, idosos, gestantes, menores desacompanhados, passageiros com conexão curta, passageiros com compromisso médico ou situações emocionais sensíveis. A comunicação individual reduz risco e melhora a percepção de cuidado.\n\nMensagem principal\nBoa comunicação não elimina a irregularidade, mas reduz incerteza, conflito e sensação de abandono."},{"title":"Assistência material","type":"Consulta","duration":"14 min","content":"Assistência material\n\nObjetivo da trilha\nAplicar a assistência material de acordo com tempo de espera, necessidade do passageiro e cenário operacional.\n\nA assistência material existe para reduzir o impacto da espera em atrasos, cancelamentos, interrupções ou preterições, conforme regra aplicável. Ela deve ser oferecida de forma proporcional ao tempo de espera e às condições do passageiro. No Brasil, a regra de referência estabelece assistência progressiva em marcos de tempo, sem prejuízo de políticas internas mais protetivas.\n\nMarcos práticos de assistência\n- A partir de 1 hora: facilidades de comunicação, como acesso a telefone ou internet quando aplicável.\n- A partir de 2 horas: alimentação adequada, conforme meios disponíveis no aeroporto.\n- A partir de 4 horas: acomodação ou hospedagem, quando necessário, e transporte entre aeroporto e local de acomodação quando aplicável.\n\nPontos de atenção\nA assistência deve considerar a situação concreta. Um passageiro residente na cidade pode receber tratamento diferente de passageiro em trânsito sem apoio local. Passageiros com deficiência, mobilidade reduzida, idosos, gestantes, menores desacompanhados e pessoas em situação sensível exigem acompanhamento mais próximo.\n\nO que não fazer\n- Esperar o passageiro reclamar para informar direitos.\n- Prometer hotel sem disponibilidade confirmada.\n- Distribuir voucher sem critério ou registro.\n- Tratar passageiros especiais como se tivessem as mesmas condições de espera dos demais.\n- Informar horários sem fonte confiável.\n\nFluxo recomendado\n1. Confirmar tempo estimado de espera.\n2. Verificar marco de assistência aplicável.\n3. Identificar passageiros com necessidade especial.\n4. Organizar distribuição por ordem e prioridade operacional.\n5. Registrar assistência concedida.\n6. Atualizar passageiro sobre próximos passos.\n\nExemplo prático\nUm voo sofre atraso superior a 2 horas. A equipe organiza alimentação conforme disponibilidade local, prioriza passageiros com necessidades especiais, registra distribuição e mantém atualização sobre nova previsão.\n\nMensagem principal\nAssistência material é direito operacionalizado. Ela precisa ser entregue com controle, critério e respeito."},{"title":"Reacomodação e reembolso","type":"Prática guiada","duration":"16 min","content":"Reacomodação e reembolso\n\nObjetivo da trilha\nOrientar passageiros sobre alternativas em atraso relevante, cancelamento, interrupção ou perda de conexão.\n\nQuando a viagem não acontece como contratado, o passageiro pode ter direito a alternativas. O agente deve apresentar opções permitidas conforme o caso, disponibilidade e regra aplicável. A comunicação precisa ser objetiva: o que pode ser feito, quais prazos existem, como a bagagem será tratada e quais impactos haverá na jornada.\n\nAlternativas comuns\n- Reacomodação em outro voo próprio ou de terceiro quando aplicável.\n- Remarcação para data e horário de conveniência do passageiro, dentro das regras do caso.\n- Execução do serviço por outra modalidade de transporte, quando cabível.\n- Reembolso conforme condições da irregularidade e escolha do passageiro.\n- Retorno ao aeroporto de origem, quando a viagem foi interrompida.\n\nComo orientar\nO passageiro deve entender a diferença entre esperar o próximo voo, remarcar, cancelar, receber reembolso ou seguir por outra rota. A opção mais rápida nem sempre é a melhor para todos. Passageiros com conexão, bagagem despachada, documentação internacional ou compromissos urgentes exigem análise cuidadosa.\n\nBagagem em reacomodação\nSempre que houver alteração de voo, a bagagem precisa ser considerada. O agente deve verificar se a bagagem foi carregada, retirada, reetiquetada ou se seguirá fluxo separado. Não adianta reacomodar o passageiro e deixar a mala em rota incompatível.\n\nRegistro da escolha\nA escolha do passageiro deve ser registrada quando a situação exigir. O histórico deve indicar a alternativa oferecida, a alternativa aceita, horário, responsável e qualquer orientação sobre bagagem ou assistência.\n\nExemplo prático\nUm cancelamento afeta passageiros com destinos diferentes. Alguns preferem reacomodação no próximo voo; outros solicitam reembolso; passageiros em conexão precisam de rota alternativa. O agente segmenta os casos e evita uma solução única para todos.\n\nMensagem principal\nReacomodação boa é aquela que combina direito do passageiro, disponibilidade real e controle operacional."},{"title":"Preterição de embarque","type":"Simulação","duration":"15 min","content":"Preterição de embarque\n\nObjetivo da trilha\nEntender preterição de embarque e aplicar atendimento correto quando passageiro apto não puder embarcar por motivo operacional.\n\nPreterição ocorre quando o passageiro se apresenta para embarque, cumpre requisitos aplicáveis e, ainda assim, não embarca por motivo operacional. Pode ocorrer por indisponibilidade de assento, troca de aeronave, restrição operacional, balanceamento ou outra razão que impeça o embarque apesar da aptidão do passageiro.\n\nConduta inicial\n- Confirmar que o passageiro estava apto e dentro do prazo.\n- Confirmar motivo operacional da não aceitação.\n- Acionar supervisão ou coordenação.\n- Buscar voluntários quando o procedimento permitir.\n- Explicar alternativas de forma transparente.\n- Aplicar compensação e assistência quando cabível.\n- Registrar todo o processo.\n\nVoluntários\nQuando houver necessidade de reduzir passageiros, pode ser feita busca por voluntários, conforme regra aplicável. A proposta deve ser clara: benefício, novo voo, assistência, prazos e condições. O passageiro precisa aceitar de forma consciente.\n\nPreterição involuntária\nQuando não há voluntários suficientes ou o passageiro é impedido de embarcar contra sua vontade por motivo operacional, o tratamento deve ser cuidadoso. O agente deve evitar frases que culpem o passageiro e deve aplicar o fluxo previsto de compensação, assistência e reacomodação.\n\nComunicação recomendada\n“Seu embarque foi impactado por uma restrição operacional do voo. Vamos registrar o caso, apresentar as alternativas disponíveis e providenciar a assistência aplicável.”\n\nO que evitar\n- Dizer que o passageiro perdeu o voo se ele estava apto.\n- Retirar passageiro sem explicação.\n- Prometer solução sem confirmar disponibilidade.\n- Deixar a bagagem sem tratamento compatível.\n- Não registrar a ocorrência.\n\nMensagem principal\nPreterição é uma situação sensível. O tratamento deve ser transparente, documentado e orientado por regra."},{"title":"Registro e postura em crise","type":"Checklist","duration":"16 min","content":"Registro e postura em crise\n\nObjetivo da trilha\nManter qualidade de atendimento e rastreabilidade durante contingências com muitos passageiros impactados.\n\nIrregularidades grandes testam a maturidade da operação. Quando há atraso longo, cancelamento em massa, falha sistêmica, fila extensa ou passageiros irritados, a equipe precisa de método. Sem coordenação, cada agente fala uma coisa, a fila perde confiança e o conflito aumenta.\n\nPostura do agente\n- Manter calma e tom respeitoso.\n- Escutar sem interromper agressivamente.\n- Validar a frustração do passageiro sem assumir culpa pessoal.\n- Explicar o que já se sabe e o que ainda está sendo confirmado.\n- Evitar promessas sem respaldo.\n- Direcionar casos prioritários.\n- Acionar liderança quando necessário.\n\nOrganização da contingência\nA liderança deve definir uma fonte única de informação, dividir tarefas e criar fluxo. Um grupo pode atender remarcações, outro assistência material, outro passageiros especiais e outro comunicação geral. Essa divisão reduz fila e evita retrabalho.\n\nRegistros essenciais\n- Voo e data.\n- Tipo de irregularidade.\n- Horário da comunicação ao passageiro.\n- Assistência concedida.\n- Alternativa oferecida e escolhida.\n- Passageiros com prioridade ou necessidade especial.\n- Reclamações críticas ou conflito.\n- Acionamento de supervisão, segurança ou áreas parceiras.\n\nLinguagem em crise\nA linguagem deve ser firme e humana. Frases como “não posso fazer nada” devem ser substituídas por “vou verificar as opções disponíveis para este caso”. A equipe deve informar limites, mas sem abandonar o passageiro.\n\nDebriefing\nApós a contingência, a equipe deve revisar o que funcionou, onde houve falha, quais informações demoraram, quais assistências foram insuficientes e quais registros precisam ser melhorados. A crise deve virar aprendizado.\n\nMensagem principal\nEm irregularidade, o passageiro lembra de duas coisas: se recebeu informação e se foi tratado com respeito. O registro garante que a operação também aprenda com o evento."}]$json_irregularidades_voo$::jsonb, $mat_irregularidades_voo$Tipos de irregularidade

Tipos de irregularidade

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

---

Informação ao passageiro

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

---

Assistência material

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

---

Reacomodação e reembolso

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

---

Preterição de embarque

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

---

Registro e postura em crise

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
Em irregularidade, o passageiro lembra de duas coisas: se recebeu informação e se foi tratado com respeito. O registro garante que a operação também aprenda com o evento.$mat_irregularidades_voo$),
('conexoes-mct', $json_conexoes_mct$[{"title":"Conceito de conexão e MCT","type":"Aula","duration":"12 min","content":"Conceito de conexão e MCT\n\nObjetivo da trilha\nCompreender o que é conexão, o que significa MCT e por que esse tempo é decisivo para passageiros e bagagens.\n\nConexão é a continuidade da viagem por meio de dois ou mais voos. O passageiro chega a um aeroporto intermediário e precisa seguir para outro voo até o destino final. A bagagem também pode precisar ser transferida entre aeronaves, terminais, sistemas de triagem ou áreas de carregamento.\n\nMCT significa Minimum Connection Time, ou tempo mínimo de conexão. Ele representa o menor intervalo operacional aceitável para que o passageiro e, quando aplicável, sua bagagem consigam seguir para o próximo trecho em condições normais de operação. Esse tempo não é um detalhe comercial; ele é uma referência operacional usada para avaliar viabilidade de conexão.\n\nPor que o MCT importa\n- Ajuda a evitar venda ou aceitação de conexões inviáveis.\n- Reduz risco de passageiro perder o próximo voo.\n- Reduz risco de bagagem não ser transferida a tempo.\n- Orienta priorização de passageiros e bagagens em conexão curta.\n- Apoia análise de falhas quando ocorre extravio ou misconnection.\n\nMCT não é garantia absoluta\nMesmo uma conexão dentro do MCT pode falhar se houver atraso de chegada, troca de terminal, controle migratório demorado, esteira distante, congestionamento no BHS, baixa disponibilidade de equipe ou restrição operacional. Por outro lado, uma conexão muito curta pode até funcionar em circunstâncias favoráveis, mas não deve ser tratada como padrão seguro.\n\nTipos de conexão\nDoméstica para doméstica: normalmente envolve menor complexidade documental e migratória.\nDoméstica para internacional: pode exigir controle documental, segurança e fluxo específico.\nInternacional para doméstica: pode envolver imigração, alfândega, retirada e redespacho de bagagem conforme regra local.\nInternacional para internacional: pode envolver controle de trânsito, segurança e terminal específico.\n\nMensagem principal\nMCT é uma ferramenta de prevenção. Ele ajuda a operação a identificar risco antes que passageiro e bagagem se percam no fluxo."},{"title":"Leitura de itinerário","type":"Prática guiada","duration":"12 min","content":"Leitura de itinerário\n\nObjetivo da trilha\nLer corretamente um itinerário com conexão e identificar pontos de risco para atendimento, portão, rampa e bagagem.\n\nA leitura de itinerário exige olhar a viagem inteira, não apenas o próximo voo. O agente deve compreender origem, conexão, destino final, horários, terminais, tipo de voo, companhia operadora quando houver, bagagem despachada e necessidade de retirada ou redespacho.\n\nElementos a conferir\n- Aeroporto de origem.\n- Aeroporto de conexão.\n- Destino final.\n- Número e data de cada voo.\n- Horário de chegada do primeiro trecho.\n- Horário de partida do próximo trecho.\n- Tempo disponível entre chegada e partida.\n- Terminal ou área de embarque/desembarque.\n- Necessidade de imigração, alfândega ou nova inspeção de segurança.\n- Status da bagagem: etiquetada até o destino final ou até a conexão.\n\nComo calcular a conexão\nO tempo de conexão não deve ser visto apenas como diferença entre horário de chegada e saída. Na prática, o passageiro precisa desembarcar, deslocar-se, passar por controles quando existirem e chegar ao portão dentro do horário de embarque. A bagagem precisa sair da aeronave, ser lida, transferida, direcionada e carregada no próximo voo.\n\nPontos de atenção\n- Chegada em posição remota.\n- Partida em terminal diferente.\n- Passageiro com mobilidade reduzida.\n- Criança desacompanhada.\n- Grupo grande.\n- Bagagem especial ou fora do padrão.\n- Voo internacional com controle documental.\n- Atraso do primeiro trecho.\n\nExemplo prático\nUm passageiro chega de voo doméstico e segue em voo internacional. Além do tempo entre voos, o agente precisa considerar deslocamento até o terminal internacional, controle de segurança, eventual conferência documental e horário real de encerramento do embarque.\n\nMensagem principal\nItinerário bem lido evita orientação errada. A conexão deve ser analisada como fluxo de pessoa e de bagagem, não como simples diferença de horários."},{"title":"Risco para passageiro e bagagem","type":"Aula","duration":"13 min","content":"Risco para passageiro e bagagem\n\nObjetivo da trilha\nIdentificar como conexões curtas ou complexas podem gerar perda de conexão e irregularidade de bagagem.\n\nA conexão envolve dois fluxos paralelos: passageiro e bagagem. O passageiro pode conseguir chegar ao portão e a bagagem não, ou a bagagem pode seguir e o passageiro não embarcar. Ambas as situações exigem controle, comunicação e registro.\n\nRiscos para o passageiro\n- Desembarque demorado.\n- Portão distante.\n- Mudança de terminal.\n- Controle migratório ou de segurança com fila.\n- Falta de informação sobre próximo portão.\n- Necessidade de assistência especial.\n- Atraso do voo de chegada.\n- Última chamada já iniciada ao chegar na conexão.\n\nRiscos para a bagagem\n- Descarga tardia do primeiro voo.\n- Falha de leitura no BHS.\n- Bagagem separada para destino incorreto.\n- Tempo insuficiente de transferência.\n- Falta de prioridade para conexão crítica.\n- Etiqueta com destino incorreto.\n- Volume especial que exige manuseio manual.\n- Passageiro reacomodado sem tratamento compatível da bagagem.\n\nCenários comuns\nPassageiro embarca sem bagagem: gera extravio no destino e possível abertura de AHL.\nBagagem segue sem passageiro: exige avaliação de reconciliação e segurança.\nPassageiro perde conexão: exige reacomodação e avaliação da bagagem.\nBagagem perde conexão, passageiro segue: exige envio posterior e comunicação ao destino.\n\nComo reduzir risco\n- Identificar conexões críticas antes da chegada.\n- Comunicar gate e rampa.\n- Priorizar descarga e transferência quando possível.\n- Orientar passageiro sobre caminho e horário.\n- Verificar bagagens com destino final correto.\n- Registrar exceções e causas quando ocorrer falha.\n\nMensagem principal\nConexão crítica não é só problema de passageiro. É risco integrado de atendimento, rampa, BHS, portão e serviço de bagagem."},{"title":"Priorização operacional","type":"Procedimento","duration":"13 min","content":"Priorização operacional\n\nObjetivo da trilha\nOrganizar ações preventivas para conexões críticas antes que a falha aconteça.\n\nPriorização operacional é agir antes que a conexão seja perdida. O objetivo não é privilegiar um passageiro sem critério, mas proteger a continuidade da viagem quando existe risco real identificado por tempo, rota, atraso, terminal, bagagem ou condição especial.\n\nQuando priorizar\n- Tempo de conexão próximo ao mínimo aplicável.\n- Voo de chegada atrasado.\n- Próximo voo com encerramento iminente.\n- Passageiro com mobilidade reduzida ou assistência especial.\n- Menor desacompanhado.\n- Grupo grande em conexão curta.\n- Bagagem com transferência sensível.\n- Voo internacional com controles adicionais.\n\nAções para passageiros\n- Informar portão e caminho mais direto.\n- Acionar assistência quando necessário.\n- Comunicar o gate do próximo voo.\n- Orientar sobre documentação à mão.\n- Evitar que o passageiro perca tempo em filas indevidas.\n- Atualizar em caso de mudança de portão.\n\nAções para bagagens\n- Identificar volumes de conexão crítica.\n- Comunicar rampa e BHS.\n- Priorizar descarga quando possível.\n- Verificar leitura e direcionamento.\n- Confirmar se a etiqueta está correta para o destino final.\n- Registrar quando a bagagem não puder seguir no mesmo voo.\n\nComunicação entre áreas\nA priorização só funciona se check-in, conexão, portão, rampa, BHS e serviço de bagagem compartilham a mesma informação. Mensagem solta e tardia raramente resolve conexão crítica.\n\nExemplo prático\nUm voo chega com atraso e possui passageiros para uma conexão com pouco tempo. A equipe identifica os passageiros, orienta deslocamento, comunica o próximo gate e informa a rampa sobre bagagens prioritárias. Mesmo que nem todos consigam embarcar, a operação atuou com método e registro.\n\nMensagem principal\nConexão crítica precisa de antecipação. Quando a equipe espera o passageiro reclamar, o tempo já foi perdido."},{"title":"Perda de conexão","type":"Simulação","duration":"13 min","content":"Perda de conexão\n\nObjetivo da trilha\nAtender corretamente passageiro e bagagem quando a conexão não acontece.\n\nA perda de conexão, também chamada de misconnection em muitos contextos operacionais, ocorre quando o passageiro ou a bagagem não segue no trecho previsto. A resposta deve ser rápida, clara e documentada, porque o passageiro costuma estar sob pressão e precisa entender como continuará a viagem.\n\nPrimeiras verificações\n- Qual voo foi perdido?\n- Qual foi a causa provável?\n- O passageiro estava dentro do fluxo previsto?\n- Houve atraso no voo anterior?\n- Existe alternativa de reacomodação?\n- A bagagem foi carregada, ficou na conexão ou seguiu sem o passageiro?\n- Há passageiro com assistência especial?\n- Há necessidade de assistência material?\n\nTratamento do passageiro\nO agente deve explicar a situação, apresentar alternativas permitidas, orientar sobre novo horário e registrar a solução. Se houver espera relevante, assistência material deve ser analisada conforme regra aplicável. Passageiros em viagem internacional podem precisar de atenção adicional por documentação, conexão posterior ou hospedagem.\n\nTratamento da bagagem\nA bagagem precisa ser rastreada. Se ainda está na conexão, deve ser reetiquetada ou direcionada para o novo voo. Se seguiu sem o passageiro, o destino precisa ser comunicado e a reconciliação deve seguir procedimento. Se não for localizada, o caso pode evoluir para irregularidade de bagagem.\n\nComunicação com o passageiro\nEvite frases vagas como “sua mala vai automaticamente”. O correto é informar o que foi verificado e, se ainda não houver confirmação, dizer que a equipe está rastreando.\n\nExemplo prático\nO passageiro perde a conexão por atraso do voo anterior. O atendimento reacomoda no próximo voo disponível, confirma se a bagagem foi transferida, orienta sobre novo portão e registra a ocorrência. Se a bagagem não seguir, o destino recebe informação para atendimento adequado.\n\nMensagem principal\nPerda de conexão exige duas frentes: continuar a viagem do passageiro e controlar o destino da bagagem."},{"title":"Indicadores e melhoria","type":"Checklist","duration":"12 min","content":"Indicadores e melhoria\n\nObjetivo da trilha\nUsar dados de conexão para reduzir falhas recorrentes e melhorar a coordenação operacional.\n\nConexões geram aprendizado quando são medidas. Sem indicadores, a operação trata cada falha como caso isolado. Com indicadores, é possível identificar horários críticos, rotas problemáticas, terminais com maior risco, voos que chegam atrasados com frequência e etapas em que bagagens deixam de conectar.\n\nIndicadores recomendados\n- Quantidade de passageiros que perderam conexão.\n- Quantidade de bagagens não conectadas.\n- Percentual de conexão dentro e fora do MCT.\n- Tempo médio disponível entre voos.\n- Causas recorrentes de perda de conexão.\n- Rotas com maior reincidência.\n- Turnos com maior volume de falhas.\n- Tempo de transferência de bagagem por terminal ou área.\n- Casos de passageiro embarcado sem bagagem.\n- Casos de bagagem encaminhada sem passageiro.\n\nAnálise de causa\nA causa pode estar no atraso do voo de chegada, no MCT insuficiente, no deslocamento entre terminais, em falha de orientação, em congestionamento no BHS, em etiqueta incorreta, em falha de priorização ou em falta de comunicação entre áreas. A ação corretiva depende de identificar a causa certa.\n\nPlanos de melhoria\n- Mapear conexões críticas do dia.\n- Criar alerta pré-chegada para voos sensíveis.\n- Padronizar comunicação entre rampa, BHS e gate.\n- Melhorar sinalização e orientação ao passageiro.\n- Ajustar equipe em horários de pico.\n- Registrar bagagens não conectadas com causa provável.\n- Revisar rotas recorrentes com alto índice de falha.\n\nGovernança\nA gestão deve revisar dados periodicamente e transformar falhas em ação. Se uma mesma conexão falha várias vezes, o problema não é acaso; é padrão operacional que precisa de intervenção.\n\nMensagem principal\nMCT bem gerido reduz extravio, reduz conflito e melhora a continuidade da viagem. O que se mede com qualidade pode ser melhorado."}]$json_conexoes_mct$::jsonb, $mat_conexoes_mct$Conceito de conexão e MCT

Conceito de conexão e MCT

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

---

Leitura de itinerário

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

---

Risco para passageiro e bagagem

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

---

Priorização operacional

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

---

Perda de conexão

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

---

Indicadores e melhoria

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
MCT bem gerido reduz extravio, reduz conflito e melhora a continuidade da viagem. O que se mede com qualidade pode ser melhorado.$mat_conexoes_mct$),
('bagagens-especiais', $json_bagagens_especiais$[{"title":"Conceito e classificação","type":"Aula","duration":"12 min","content":"Conceito e classificação\n\nObjetivo da trilha\nReconhecer quando uma bagagem deixa de ser tratada como volume comum e passa a exigir aceite, identificação e manuseio diferenciado.\n\nBagagens especiais são volumes que apresentam alguma característica fora do fluxo padrão. O motivo pode estar no peso, dimensão, formato, fragilidade, valor declarado, finalidade, necessidade assistiva do passageiro, conteúdo sujeito a restrição ou condição de transporte. O ponto central é entender que o risco operacional acompanha o volume desde o atendimento até a entrega.\n\nExemplos comuns\n- Cadeira de rodas, andador, muletas, próteses e outros recursos assistivos.\n- Carrinho de bebê e dispositivos de apoio à mobilidade.\n- Pranchas, bicicletas, equipamentos de golfe, pesca, mergulho ou esqui.\n- Instrumentos musicais em estojo rígido ou embalagem própria.\n- Volumes frágeis, obras, equipamentos sensíveis e itens de alto valor operacional.\n- Animais transportados conforme regra aplicável e cão-guia como recurso de acessibilidade.\n\nPrimeira análise do agente\nO agente deve identificar o tipo de item, conferir se há regra de aceitação, avaliar embalagem, peso, dimensões, documentação quando aplicável, destino, conexões, restrições de aeronave e necessidade de registro adicional. A orientação ao passageiro deve ser clara antes do despacho.\n\nDiferença entre aceitar e transportar com segurança\nAceitar o volume no balcão não encerra a responsabilidade operacional. O item ainda passará por etiquetagem, inspeção, triagem, transporte interno, carregamento, descarregamento e restituição. Cada etapa precisa preservar identificação e integridade.\n\nConduta recomendada\n1. Perguntar qual é o item e como está embalado.\n2. Conferir regra de aceitação aplicável.\n3. Verificar peso, dimensão e condição aparente.\n4. Orientar riscos e limitações antes do despacho.\n5. Registrar informações relevantes.\n6. Identificar corretamente o volume.\n7. Comunicar áreas envolvidas quando o item exigir cuidado especial.\n\nMensagem principal\nBagagem especial não é problema; é um volume que precisa de tratamento operacional compatível com o risco."},{"title":"Equipamentos assistivos","type":"Procedimento","duration":"14 min","content":"Equipamentos assistivos\n\nObjetivo da trilha\nAplicar cuidado operacional a equipamentos que garantem mobilidade, autonomia e dignidade do passageiro.\n\nEquipamentos assistivos incluem cadeira de rodas manual ou motorizada, andadores, bengalas, muletas, próteses, órteses e outros recursos usados pelo passageiro para se deslocar ou manter autonomia. O tratamento desses itens deve unir acessibilidade, segurança e rastreabilidade.\n\nPor que o cuidado é crítico\nDiferente de uma mala comum, um equipamento assistivo pode ser indispensável para que o passageiro consiga desembarcar, circular no aeroporto e seguir viagem. Dano, atraso ou perda desse equipamento gera impacto direto na dignidade e na segurança da pessoa.\n\nAtendimento no check-in\nO agente deve confirmar se o passageiro precisa usar o equipamento até a porta da aeronave, se há bateria, peças removíveis, modo de dobragem, freio, joystick, apoio de pés ou partes frágeis. Sempre que houver cadeira motorizada, é necessário observar as regras aplicáveis a baterias e segurança do transporte.\n\nRegistro e identificação\n- Etiquetar de forma visível e resistente.\n- Registrar condição aparente quando necessário.\n- Identificar peças removíveis.\n- Orientar o passageiro sobre retirada ou proteção de acessórios soltos.\n- Informar ponto de devolução previsto.\n- Comunicar equipe de embarque, rampa e chegada quando aplicável.\n\nManuseio\nA equipe não deve forçar dobragens, puxar por partes sensíveis, empilhar peso sobre o equipamento ou movimentar cadeira motorizada sem entender o procedimento básico. Quando houver dúvida, deve-se pedir orientação ao passageiro ou acionar equipe responsável.\n\nDevolução\nA devolução deve ocorrer de forma controlada, no ponto adequado e com conferência de integridade aparente. Se houver dano ou atraso, o passageiro deve receber atendimento prioritário e registro formal.\n\nMensagem principal\nEquipamento assistivo é extensão da autonomia do passageiro. O cuidado operacional precisa refletir essa importância."},{"title":"Itens esportivos e instrumentos","type":"Prática guiada","duration":"13 min","content":"Itens esportivos e instrumentos\n\nObjetivo da trilha\nTratar equipamentos esportivos e instrumentos musicais com atenção a embalagem, dimensão, fragilidade e rastreabilidade.\n\nItens esportivos e instrumentos musicais costumam ter formatos diferentes, partes sensíveis e valor afetivo ou profissional. Bicicletas, pranchas, tacos, varas, equipamentos de mergulho, estojos de violão, teclado, saxofone e outros instrumentos não devem ser conduzidos como mala comum sem avaliação.\n\nAceite operacional\nAntes do despacho, o agente deve conferir se o item está embalado de forma adequada, se cabe no fluxo de esteiras e equipamentos, se precisa seguir como volume especial, se há restrição por aeronave ou aeroporto, se existe cobrança aplicável e se o passageiro foi orientado sobre riscos de embalagem inadequada.\n\nEmbalagem\nUma boa embalagem reduz danos. O ideal é usar estojo rígido, proteção interna, travamento de partes móveis e identificação externa. Sacos frágeis, caixas abertas, capa fina, fita solta ou embalagem improvisada aumentam risco e devem gerar orientação e registro quando aplicável.\n\nPontos de atenção\n- Instrumento musical com caixa rígida ou proteção adequada.\n- Bicicleta com guidão, pedal e pneus tratados conforme regra operacional.\n- Prancha protegida contra impacto em extremidades.\n- Equipamento de mergulho sem cilindro pressurizado fora da regra permitida.\n- Itens de esporte com partes pontiagudas protegidas.\n- Peso e dimensões compatíveis com transporte.\n\nComunicação entre áreas\nSe o item não puder seguir por esteira comum, deve ser direcionado ao canal correto. A rampa precisa reconhecer que se trata de volume sensível e o setor de restituição precisa saber onde o passageiro retirará o item.\n\nMensagem principal\nO item especial precisa chegar inteiro e identificável. A prevenção começa no aceite e continua até a restituição."},{"title":"Animais e cão-guia","type":"Aula","duration":"14 min","content":"Animais e cão-guia\n\nObjetivo da trilha\nDiferenciar o transporte de animais sujeitos a regras específicas do atendimento ao cão-guia como recurso de acessibilidade.\n\nO transporte de animais no ambiente aéreo exige avaliação documental, condição do animal, recipiente, rota, conexão, temperatura, aeronave, restrição do destino e regra do operador. O agente deve seguir normas aplicáveis e nunca improvisar aceite sem confirmação.\n\nAnimais de estimação\nQuando o transporte é permitido, é necessário confirmar documentação sanitária, recipiente adequado, ventilação, segurança, identificação, peso, rota e condição aparente do animal. O passageiro deve ser orientado sobre limites de aceite, local de apresentação, tempo de antecedência e eventuais restrições.\n\nAnimais no porão ou cabine\nA regra pode variar conforme tipo de animal, tamanho, recipiente, destino e aeronave. O agente deve confirmar se o animal seguirá na cabine ou no porão conforme procedimento aplicável. O foco é segurança do passageiro, do animal e da operação.\n\nCão-guia\nCão-guia não deve ser tratado como bagagem comum. Ele é recurso de acessibilidade vinculado à autonomia do passageiro com deficiência visual. O atendimento deve preservar respeito, espaço, prioridade e orientação adequada. O agente deve falar com o passageiro, não apenas com acompanhante, e evitar tocar ou distrair o cão sem autorização.\n\nConduta recomendada\n- Conferir documentação exigida para o tipo de transporte.\n- Confirmar recipiente, identificação e destino.\n- Orientar o passageiro de forma antecipada.\n- Registrar informações relevantes.\n- Respeitar cão-guia como assistência essencial.\n- Acionar supervisão em caso de dúvida ou restrição.\n\nMensagem principal\nAnimais exigem regra e cuidado. Cão-guia exige, além disso, respeito à acessibilidade e à autonomia do passageiro."},{"title":"Frágeis, valor e restrições","type":"Checklist","duration":"13 min","content":"Frágeis, valor e restrições\n\nObjetivo da trilha\nOrientar corretamente volumes frágeis, itens de valor e conteúdos que podem exigir restrição, recusa ou registro de limitação.\n\nNem todo item deve ser despachado da mesma forma. Objetos frágeis, eletrônicos, itens de valor, documentos, medicamentos, dinheiro, joias, equipamentos sensíveis, líquidos, perecíveis e materiais sujeitos a regra de segurança precisam ser avaliados antes do aceite. O agente deve orientar o passageiro sem assumir responsabilidade indevida nem omitir risco.\n\nItens frágeis\nFragilidade pode estar no material, na embalagem ou na função do item. Um objeto pode parecer bem embalado e ainda assim ser sensível a impacto, pressão ou variação de posição. Quando a embalagem é inadequada, o passageiro deve ser orientado e o registro de limitação deve ser utilizado quando previsto.\n\nItens de valor\nItens de valor ou de uso essencial devem ser preferencialmente mantidos sob controle do passageiro quando permitidos. O agente deve evitar instruções que incentivem o despacho de documentos, dinheiro, joias, eletrônicos essenciais, medicamentos indispensáveis ou itens sem reposição simples.\n\nConteúdos restritos\nAlguns conteúdos podem ser proibidos, limitados ou exigir condição específica de transporte. A análise deve considerar segurança da aviação, mercadorias perigosas, baterias, líquidos, aerossóis, equipamentos pressurizados e legislação local. Em caso de dúvida, a equipe deve consultar referência operacional e supervisão.\n\nRegistro de limitação\nO registro de limitação de responsabilidade ou aceite condicionado não é ferramenta para negar atendimento; é forma de deixar claro que o passageiro foi orientado sobre condição pré-existente, embalagem inadequada ou risco conhecido. O registro deve ser objetivo e vinculado ao volume correto.\n\nMensagem principal\nOrientar antes do despacho evita conflito depois da chegada. Fragilidade, valor e restrição precisam ser tratados com clareza e registro."},{"title":"Rastreabilidade e entrega","type":"Simulação","duration":"14 min","content":"Rastreabilidade e entrega\n\nObjetivo da trilha\nGarantir que bagagens especiais sejam acompanhadas até a devolução correta ao passageiro ou ao setor responsável.\n\nRastreabilidade é a capacidade de saber qual item foi recebido, de quem é, para onde deve ir, por qual voo segue, em que condição aparente estava e onde foi entregue. Em bagagens especiais, essa rastreabilidade é ainda mais importante porque muitos itens não entram no fluxo comum ou exigem devolução em ponto específico.\n\nDados essenciais\n- Nome do passageiro e vínculo com a reserva quando disponível.\n- Número da etiqueta ou identificação equivalente.\n- Tipo de item.\n- Voo, data, origem, conexão e destino.\n- Condição aparente no aceite.\n- Registro de limitação ou orientação quando aplicável.\n- Área responsável pelo manuseio.\n- Ponto de retirada na chegada.\n\nDurante o fluxo\nO volume especial pode passar por balcão, área de itens fora de medida, inspeção, BHS, rampa, porão, descarga e restituição. Em cada etapa, a equipe precisa preservar etiqueta, evitar separação de partes, comunicar exceções e registrar falhas.\n\nEntrega ao passageiro\nA devolução deve confirmar que o item pertence ao passageiro correto. Em itens assistivos, a prioridade é devolver o mais próximo possível do ponto necessário para mobilidade. Em itens esportivos ou instrumentos, o passageiro deve ser direcionado ao local correto de retirada.\n\nQuando ocorre irregularidade\nSe houver dano, extravio ou atraso de bagagem especial, o atendimento deve ser formal, rápido e documentado. O histórico precisa descrever o item, condição observada, último ponto conhecido, ações realizadas e orientação dada ao passageiro.\n\nMelhoria contínua\nA operação deve acompanhar quais itens especiais mais geram ocorrência, em quais rotas, horários e etapas. A melhoria pode envolver treinamento de rampa, ajustes de sinalização, revisão de aceitação no check-in ou reforço de comunicação com restituição.\n\nMensagem principal\nBagagem especial bem rastreada reduz dano, extravio e conflito. O processo termina quando o item certo é entregue à pessoa certa."}]$json_bagagens_especiais$::jsonb, $mat_bagagens_especiais$Conceito e classificação

Conceito e classificação

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

---

Equipamentos assistivos

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

---

Itens esportivos e instrumentos

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

---

Animais e cão-guia

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

---

Frágeis, valor e restrições

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

---

Rastreabilidade e entrega

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
Bagagem especial bem rastreada reduz dano, extravio e conflito. O processo termina quando o item certo é entregue à pessoa certa.$mat_bagagens_especiais$),
('mercadorias-perigosas-atendimento', $json_mercadorias_perigosas_atendimento$[{"title":"Fundamentos de DGR","type":"Aula","duration":"13 min","content":"Fundamentos de DGR\n\nObjetivo da trilha\nCompreender o conceito de mercadorias perigosas e o papel do atendimento ao passageiro na prevenção do transporte indevido.\n\nMercadorias perigosas, também chamadas de artigos perigosos ou DGR, são artigos ou substâncias que podem oferecer risco à saúde, à segurança, à aeronave, às pessoas, aos bens ou ao meio ambiente durante o transporte aéreo. O risco pode estar em explosão, fogo, gás, pressão, corrosão, toxicidade, radiação, reação química, contaminação ou aquecimento.\n\nO transporte aéreo possui restrições porque a aeronave é um ambiente pressurizado, fechado, com variação de temperatura, vibração e limitação de resposta durante o voo. Um item aparentemente comum pode se tornar perigoso se estiver mal embalado, danificado, superaquecido, vazando ou colocado no local errado.\n\nResponsabilidade no atendimento\nO agente de atendimento não precisa atuar como expedidor técnico de carga, mas precisa reconhecer sinais de risco e impedir que itens não permitidos entrem no fluxo de bagagem. Essa prevenção começa nas perguntas de segurança, na observação da bagagem, na escuta das respostas do passageiro e no acionamento do procedimento correto quando houver dúvida.\n\nCategorias de risco que o agente deve reconhecer\n- Explosivos, munições e fogos de artifício.\n- Gases comprimidos ou inflamáveis.\n- Líquidos inflamáveis, solventes e combustíveis.\n- Sólidos inflamáveis e materiais de ignição fácil.\n- Oxidantes e peróxidos orgânicos.\n- Substâncias tóxicas ou infectantes.\n- Materiais radioativos.\n- Corrosivos.\n- Baterias de lítio e equipamentos alimentados por bateria.\n- Outros itens perigosos, como gelo seco ou motores com combustível residual.\n\nRegra de ouro\nSe o agente não tem certeza de que o item pode ser transportado, ele não deve aceitar por improviso. Deve consultar a referência operacional, acionar supervisão ou área responsável e manter o item fora do fluxo até decisão segura.\n\nMensagem principal\nDGR no atendimento é prevenção. Uma pergunta feita no balcão pode evitar um risco dentro da aeronave."},{"title":"Reconhecimento no atendimento","type":"Prática guiada","duration":"14 min","content":"Reconhecimento no atendimento\n\nObjetivo da trilha\nIdentificar sinais de mercadorias perigosas durante check-in, despacho de bagagem, atendimento no gate e contato com o passageiro.\n\nMercadorias perigosas nem sempre chegam com etiqueta de perigo visível. Muitas aparecem como itens do dia a dia: bateria, aerossol, tinta, cola, produto de limpeza, cosmético, equipamento eletrônico, ferramenta, isqueiro, cilindro, material de camping ou produto químico. O agente precisa desenvolver atenção para descrições e sinais indiretos.\n\nPerguntas de segurança\nAs perguntas de segurança devem ser feitas com naturalidade e objetividade. O passageiro precisa entender que a finalidade é proteger o voo, não criar dificuldade. Perguntas úteis investigam se há baterias sobressalentes, líquidos inflamáveis, cilindros, aerossóis, produtos químicos, armas, munições, ferramentas com combustível, itens de camping ou equipamentos danificados.\n\nSinais visuais e comportamentais\n- Caixa com símbolo de inflamável, corrosivo, tóxico ou gás comprimido.\n- Embalagem industrial sem identificação clara.\n- Odor forte de combustível, solvente ou químico.\n- Vazamento, umidade, manchas ou ruído interno.\n- Passageiro inseguro sobre o conteúdo.\n- Resposta contraditória ou genérica demais.\n- Volume muito pesado para o tamanho.\n- Equipamento com bateria grande, drone ou ferramenta elétrica.\n\nDescrições de alerta\nPalavras como bateria extra, power bank, spray, tinta, querosene, gasolina, fluido, solvente, cilindro, gás, munição, fogos, produto para piscina, inseticida, corrosivo, ácido, alvejante, gelo seco, motor, gerador e equipamento de mergulho devem acender atenção.\n\nFluxo quando houver suspeita\n1. Interromper o aceite do volume.\n2. Perguntar de forma objetiva sobre o conteúdo.\n3. Solicitar embalagem ou documentação quando aplicável.\n4. Consultar regra ou responsável competente.\n5. Orientar o passageiro sobre aceite, remoção, recusa ou alternativa.\n6. Registrar a ocorrência quando o procedimento exigir.\n\nMensagem principal\nReconhecer DGR é combinar pergunta, observação e prudência. A pressa nunca deve vencer a segurança."},{"title":"Baterias, power banks e smart bags","type":"Procedimento","duration":"15 min","content":"Baterias, power banks e smart bags\n\nObjetivo da trilha\nTratar corretamente baterias de lítio, baterias de íon de sódio, power banks, smart bags, eletrônicos, drones, vapes e dispositivos com risco de aquecimento ou curto-circuito.\n\nBaterias estão presentes em celulares, notebooks, tablets, câmeras, drones, cigarros eletrônicos, brinquedos, ferramentas elétricas, equipamentos médicos portáteis, rastreadores, smart bags e power banks. Em condições normais são seguras, mas podem representar risco se estiverem danificadas, expostas a curto-circuito, esmagadas, superaquecidas, instaladas de forma inadequada ou transportadas fora das condições permitidas.\n\nAtualização constante\nA lista de itens permitidos, restritos ou proibidos muda com atualizações da OACI, IATA, ANAC, autoridade local e operador aéreo. Em 2026, a IATA destaca atualização relacionada a power banks transportados por passageiros ou tripulantes. Por isso, o treinamento não deve congelar uma lista definitiva; o agente deve consultar a tabela/lista vigente antes de liberar itens sensíveis.\n\nDiferença importante\nBateria instalada no equipamento é diferente de bateria sobressalente. Bateria instalada costuma ter menor risco de curto-circuito quando o aparelho está protegido contra acionamento acidental. Bateria sobressalente exige proteção dos terminais e, em muitos casos, deve permanecer na bagagem de mão, conforme regra aplicável.\n\nPower banks\nPower banks são tratados como baterias sobressalentes porque sua finalidade é fornecer energia para outro equipamento. Devem receber atenção especial quanto a quantidade, capacidade, proteção contra curto-circuito, local de transporte e restrições de uso ou recarga a bordo. O passageiro deve ser orientado conforme a lista vigente e a política operacional em vigor.\n\nSmart bags\nSmart bags podem conter baterias, rastreadores, balanças eletrônicas, travas e módulos de carregamento. Se a bateria não puder ser removida ou se exceder condição permitida, a bagagem pode ser proibida. Quando a bagagem for despachada e a regra exigir remoção da bateria, a bateria deve permanecer com o passageiro na cabine, conforme procedimento vigente.\n\nBagagem despachada no gate\nQuando uma bagagem de mão vai para o porão por falta de espaço, o agente deve lembrar o passageiro de remover power banks, baterias sobressalentes e dispositivos sujeitos a transporte somente na cabine. Essa etapa é crítica porque o passageiro pode ter passado pelo check-in com a bagagem como item de cabine.\n\nEquipamento danificado\nEletrônico ou bateria danificada, inchada, quente, com cheiro estranho, vazamento ou sinal de queda severa deve ser tratado como risco. Não se deve colocar esse item no fluxo comum sem avaliação.\n\nCigarros eletrônicos e vaporizadores\nEsses dispositivos possuem bateria e podem ter restrições de uso, recarga e transporte. O agente deve seguir regra aplicável e orientar o passageiro sem permitir uso indevido a bordo ou transporte em local incorreto.\n\nMensagem principal\nBaterias exigem controle de lista vigente, local, condição e proteção. O risco principal é curto-circuito, aquecimento e fogo."},{"title":"Aerossóis, líquidos e químicos","type":"Checklist","duration":"14 min","content":"Aerossóis, líquidos e químicos\n\nObjetivo da trilha\nReconhecer produtos químicos, aerossóis, líquidos inflamáveis e outros itens que podem ser restritos ou proibidos no transporte aéreo.\n\nNem todo líquido é perigoso, mas muitos líquidos e aerossóis podem oferecer risco. A diferença está na composição, quantidade, finalidade, pressão interna, inflamabilidade, corrosividade, toxicidade e embalagem. Produtos domésticos, cosméticos, ferramentas, itens automotivos e materiais de manutenção podem conter substâncias sujeitas a restrição.\n\nAerossóis\nAerossóis são recipientes pressurizados. Alguns podem ser permitidos em condições específicas e outros podem ser proibidos, especialmente se forem inflamáveis, industriais, tóxicos ou destinados a uso não pessoal. O agente deve observar rótulo, finalidade, quantidade e regra aplicável.\n\nLíquidos inflamáveis\nCombustíveis, solventes, tintas, removedores, colas, vernizes, querosene, álcool em alta concentração e produtos semelhantes podem ser incompatíveis com o transporte como bagagem. O risco é agravado por vazamento, vapores inflamáveis e ignição.\n\nCorrosivos e oxidantes\nProdutos como ácidos, bases fortes, alvejantes concentrados, produtos para piscina, baterias não protegidas e alguns limpadores podem corroer materiais, reagir com outras substâncias ou liberar gases. O agente deve recusar ou acionar avaliação conforme regra aplicável.\n\nCilindros e gases\nCilindros pressurizados, cartuchos de gás, botijões, sprays industriais e certos equipamentos de mergulho ou camping merecem atenção. Pressão interna e gás inflamável ou oxidante representam risco operacional.\n\nPerguntas práticas\n- O produto é inflamável?\n- Está pressurizado?\n- É produto químico industrial ou doméstico concentrado?\n- Tem símbolo de risco no rótulo?\n- Pode vazar ou reagir?\n- Foi usado em motor, ferramenta ou equipamento com combustível?\n\nMensagem principal\nProduto comum fora de contexto pode ser perigoso. Rótulo, finalidade e condição da embalagem devem orientar a decisão."},{"title":"Recusa e orientação ao passageiro","type":"Simulação","duration":"14 min","content":"Recusa e orientação ao passageiro\n\nObjetivo da trilha\nComunicar a recusa de transporte de item perigoso com clareza, respeito e firmeza operacional.\n\nRecusar um item não é falha de atendimento. É ação de segurança. O agente deve explicar que a restrição existe para proteger passageiros, tripulação, aeronave e operação. A comunicação precisa ser objetiva, sem discussão técnica excessiva e sem exposição pública desnecessária do passageiro.\n\nComo comunicar\nUse linguagem simples: “Este item não pode seguir nesta condição porque oferece risco no transporte aéreo. Vou verificar a alternativa permitida ou orientar a retirada do item.” Evite frases como “isso é problema seu” ou “sempre passa”. A regra deve ser apresentada como procedimento de segurança.\n\nAlternativas possíveis\nDependendo do item e da regra aplicável, pode haver alternativas: remover o item da bagagem, transportar em local diferente, proteger terminais de bateria, descartar o produto, entregar a acompanhante fora da área restrita, reembalar adequadamente ou acionar procedimento específico. Quando não houver alternativa permitida, a recusa deve ser mantida.\n\nQuando acionar supervisão\n- Passageiro discorda da recusa.\n- Item não é claramente identificado.\n- Há suspeita de artigo proibido ou não declarado.\n- Há risco imediato, vazamento, cheiro forte ou aquecimento.\n- O item envolve arma, munição, bateria grande, produto químico ou cilindro.\n- O agente não localiza regra aplicável.\n\nRegistro\nO registro deve conter item, orientação dada, decisão tomada, responsável acionado e eventual retirada ou recusa. Registros protegem o passageiro, a equipe e a operação.\n\nPostura\nO agente deve ser firme e respeitoso. Segurança não é negociada, mas a pessoa deve ser tratada com dignidade. Uma recusa bem explicada reduz conflito e aumenta confiança no procedimento.\n\nMensagem principal\nA melhor recusa é clara, documentada e acompanhada de orientação possível."},{"title":"Incidente e comunicação","type":"Procedimento","duration":"15 min","content":"Incidente e comunicação\n\nObjetivo da trilha\nResponder corretamente a suspeita, vazamento, fumaça, aquecimento ou identificação tardia de artigo perigoso.\n\nIncidente com artigo perigoso exige ação imediata e coordenada. O agente não deve tentar resolver sozinho, abrir embalagens suspeitas sem orientação ou recolocar o item no fluxo comum. A prioridade é preservar pessoas, isolar o risco e comunicar as áreas responsáveis.\n\nSituações críticas\n- Fumaça, calor, estalo ou cheiro de queimado vindo de equipamento eletrônico.\n- Bateria inchada, danificada ou vazando.\n- Produto químico vazando dentro ou fora da bagagem.\n- Odor de combustível ou solvente.\n- Aerossol rompido ou recipiente pressurizado danificado.\n- Passageiro declara item proibido após despacho.\n- Bagagem com símbolo de risco identificada tardiamente.\n\nPrimeiras ações\n1. Manter pessoas afastadas do item.\n2. Evitar manuseio desnecessário.\n3. Acionar supervisão, segurança operacional ou área definida no procedimento local.\n4. Informar local, tipo de item, condição observada e se há pessoas expostas.\n5. Seguir orientação de isolamento, remoção ou contenção conforme responsável competente.\n6. Registrar a ocorrência.\n\nComunicação operacional\nA comunicação deve ser curta e precisa: local, item suspeito, condição, risco aparente, passageiro vinculado quando houver, voo, bagagem, horário e ações já tomadas. Informação incompleta atrasa resposta; informação exagerada causa alarme desnecessário.\n\nDepois do evento\nApós a contenção, a equipe deve revisar causa, ponto de falha, pergunta de segurança, orientação dada, registro e necessidade de reforço de treinamento. Incidentes reais e quase incidentes são fonte de melhoria.\n\nMensagem principal\nCom DGR, a resposta certa é rápida, coordenada e registrada. Nunca normalize vazamento, fumaça, aquecimento ou item não declarado."}]$json_mercadorias_perigosas_atendimento$::jsonb, $mat_mercadorias_perigosas_atendimento$Fundamentos de DGR

Fundamentos de DGR

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

---

Reconhecimento no atendimento

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

---

Baterias, power banks e smart bags

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

---

Aerossóis, líquidos e químicos

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

---

Recusa e orientação ao passageiro

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

---

Incidente e comunicação

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
Com DGR, a resposta certa é rápida, coordenada e registrada. Nunca normalize vazamento, fumaça, aquecimento ou item não declarado.$mat_mercadorias_perigosas_atendimento$)
)
update public.academy_courses as c
set
    modules = u.modules,
    material = u.material
from course_content_update as u
where c.id = u.id;

-- Cursos neste lote:
-- irregularidades-voo
-- conexoes-mct
-- bagagens-especiais
-- mercadorias-perigosas-atendimento
