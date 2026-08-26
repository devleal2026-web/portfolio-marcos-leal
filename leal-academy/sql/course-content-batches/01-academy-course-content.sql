-- Lote 01: restaura conteudo completo dos cursos no Supabase.
-- Execute este arquivo no SQL Editor do Supabase.

with course_content_update(id, modules, material) as (
values
('fundamentos', $json_fundamentos$[{"title":"Atendimento ao passageiro","type":"Aula","duration":"12 min","content":"Slide\n\" MÓDULO 1 – Fundamentos do Atendimento ao Cliente\n1.1. Conceito de Atendimento ao Cliente \nO que é atendimento ao cliente?\nExplicação:\nAtendimento ao cliente é o conjunto de ações e interações que uma empresa realiza para atender, auxiliar, resolver problemas e oferecer uma experiência satisfatória ao seu público. Na aviação, isso inclui desde o check-in até o desembarque e até mesmo contatos após o voo.\n\nExemplo prático:\nUm passageiro chega ao balcão com dúvidas sobre o portão de embarque e regras de bagagem. O atendente escuta, fornece as informações com clareza e oferece ajuda para despachar a mala, demonstrando proatividade e cordialidade.\n\nO que é atendimento ao cliente?\n\nDiferença entre atendimento, suporte e acolhimento\n\nAtendimento como diferencial competitivo no setor aéreo\n\n1.2. Importância do Atendimento no Setor de Aviação\nExplicação:\nNo transporte aéreo, o atendimento ao cliente é um dos principais diferenciais competitivos. Em um mercado onde as tarifas são parecidas, a experiência é o que fideliza o cliente.\n\nExemplo prático:\nDuas companhias oferecem voos similares. O passageiro escolhe sempre aquela que oferece uma equipe mais prestativa, que se lembra do nome dele e resolve suas solicitações com rapidez.\n\n1.3. Experiência do Cliente (Customer Experience – CX)\nExplicação:\nA Experiência do Cliente engloba todas as interações com a empresa. Uma boa experiência depende da percepção do cliente sobre cada etapa da jornada, incluindo atendimento, conforto, segurança e soluções de problemas.\n\nExemplo prático:\nUm passageiro esqueceu um item no avião. Ele liga para a companhia, é atendido com agilidade e em 30 minutos o objeto é encontrado e entregue. Esse atendimento rápido e eficiente transforma uma possível frustração em uma experiência positiva.\n\n1.4. Cliente Interno x Cliente Externo\nExplicação:\nCliente externo é o passageiro. Cliente interno são os colegas de trabalho, de outras áreas ou turnos. Um bom atendimento interno reflete diretamente na experiência externa do passageiro.\n\nExemplo prático:\nA equipe do check-in depende da equipe de bagagens para saber se houve carregamento especial. Uma falha de comunicação pode fazer o atendente repassar informação errada ao passageiro — por isso, atender bem também quem trabalha com você é essencial.\n\n.1.5. Comunicação Positiva e Eficiente\nExplicação:\nUsar uma linguagem amigável, clara e propositiva faz toda a diferença. Evitar termos negativos e adotar uma postura acolhedora ajuda a criar confiança.\n\nExemplo prático:\n“Esse voo já está fechado, você chegou tarde.”\n“Infelizmente o embarque foi encerrado, mas vou verificar as opções disponíveis para ajudá-lo da melhor forma.”\"\n\"2.1. Passageiros Frequentes x Ocasional\nExplicação:\nPassageiros frequentes têm familiaridade com os procedimentos e geralmente buscam agilidade. Já os passageiros ocasionais podem ter dúvidas e inseguranças, exigindo mais orientação.\n\nExemplo:\nUm passageiro frequente faz o check-in pelo app e só precisa saber o portão. Um passageiro ocasional chega confuso ao balcão e pergunta onde é feito o check-in. O atendente deve adaptar o atendimento para cada um.\n2.2. Passageiros Corporativos\nExplicação:\nCostumam estar com o tempo contado, valorizam eficiência, pontualidade e discrição. Podem exigir alterações de última hora ou upgrades.\n\nExemplo:\nUm executivo chega atrasado para o embarque. O atendente, ao identificar o perfil, agiliza o processo e solicita via rádio prioridade no embarque, mantendo um tom respeitoso e eficiente.\n\n2.3. Passageiros com Crianças\nExplicação:\nDemandam paciência, ajuda com bagagem, carrinhos e compreensão com comportamentos imprevisíveis das crianças.\n\nExemplo:\nUma mãe está com bebê no colo e mala nas mãos. O funcionário oferece ajuda para despachar a bagagem e solicita cadeira de rodas para facilitar o deslocamento."},{"title":"Prioridades e assistencias","type":"Aula","duration":"14 min","content":"Postura em prioridades e assistências\n\nEsta trilha liga prioridade operacional com postura de atendimento. O agente deve organizar fila, embarque e conexão com cordialidade, atenção visual, linguagem clara e respeito às necessidades de cada passageiro. Prioridade não é apenas rapidez: é postura profissional aplicada a idosos, gestantes, PcDs, crianças, passageiros com conexão curta e clientes em situação sensível.\n\n2.4. Passageiros Idosos e Gestantes\nExplicação:\nExigem prioridade e atenção especial à saúde e mobilidade. Devem ser tratados com paciência e linguagem clara.\n\nExemplo:\nUma gestante solicita um assento próximo ao banheiro. O atendente verifica a disponibilidade e faz a alteração com cortesia, explicando as opções disponíveis.\n\n2.5. Passageiros Estrangeiros\nExplicação:\nPodem enfrentar barreiras linguísticas e culturais. O atendimento deve ser mais visual, pausado e adaptado.\n\nExemplo:\nUm passageiro chinês pergunta onde embarcar. O atendente aponta o portão no painel, mostra o cartão de embarque e gesticula, garantindo compreensão sem constrangimento.\n\n2.6. Passageiros em Estresse ou Crise\nExplicação:\nPassageiros que enfrentam atrasos, perdas, emergências familiares ou luto podem reagir com irritação ou apatia.\n\nExemplo:\nUm passageiro grita após saber que o voo foi cancelado. O atendente mantém a calma, escuta sem interromper e diz: “Entendo sua frustração, vamos buscar uma solução agora.”\n\n\"\n\" MÓDULO 3 – Atendimento Humanizado\n3.1. O que é Atendimento Humanizado\nExplicação:\nVai além de seguir regras. É acolher com empatia, demonstrar atenção e tratar o cliente como indivíduo.\n\nExemplo:\nUma senhora está nervosa para voar sozinha pela primeira vez. O atendente oferece um acompanhante até o portão e conversa com ela até se sentir segura.3.2. A Empatia como Pilar do Atendimento\nExplicação:\nÉ se colocar no lugar do outro, entendendo sentimentos e necessidades, mesmo sem concordar com tudo.\n\nExemplo:\nMesmo que o erro tenha sido do passageiro ao perder o voo, o atendente escuta, evita julgamentos e busca alternativas, dizendo: “Vamos ver o que conseguimos fazer por você.”3.3. Escuta Ativa e Comunicação Acolhedora\nExplicação:\nConsiste em ouvir com atenção plena, demonstrando interesse real, sem interromper ou rebater.\n\nExemplo:\nDurante uma reclamação, o atendente mantém contato visual, acena com a cabeça e só responde após o cliente terminar, reforçando: “Agradeço por relatar. Vamos resolver.”3.4. Personalização do Atendimento\nExplicação:\nChamar pelo nome, lembrar histórico ou preferências torna o atendimento mais humano e valorizado.\n\nExemplo:\n“Senhor Paulo, vi que o senhor já viajou conosco semana passada. Deseja o mesmo assento na janela?”\n\n\"\n\" MÓDULO 4 – Acessibilidade e Atendimento a PNAE\n4.1. Legislação e Normas\nExplicação:\nA Resolução ANAC 280 assegura direitos de acessibilidade. Conhecê-la evita erros e garante atendimento digno.\n\nExemplo:\nUm passageiro surdo tem o direito de embarcar com acompanhante gratuitamente. O atendente deve informar corretamente e registrar o acompanhante no sistema.4.2. Tipos de Deficiência\nVisual:\nNecessita de orientação física e verbal clara.\nEx: “Senhor, pegarei seu braço pelo cotovelo. Vamos até o embarque.”\n\nAuditiva:\nUsar escrita ou Libras, se souber.\nEx: Escreve: “Seu portão é o 6. Precisa de ajuda para ir até lá?”\n\nMotora:\nPrecisa de auxílio com locomoção e priorização.\nEx: Providenciar cadeira de rodas e guia.\n\nIntelectual/Neurológica:\nDemandam linguagem simples e ambiente previsível.\nEx: Explicar o passo a passo com calma a uma pessoa com autismo.\n\n4.3. Atendimento Inclusivo\nExplicação:\nTratar com respeito, autonomia e sem infantilizar. Atender com dignidade e considerar suas limitações.\n\nExemplo:\nFalar diretamente com o passageiro com deficiência, não apenas com o acompanhante.\n\n4.4. Recursos de Apoio\nExplicação:\nUsar todos os meios disponíveis: intérpretes, cadeiras, guias, sinalização adaptada, etc.\n\nExemplo:\nUm cego chega desacompanhado. O atendente oferece um colaborador guia até o portão, e comunica a equipe de solo para acompanhamento no desembarque.\n\n4.5. Embarque Assistido\nExplicação:\nPessoas com deficiência ou mobilidade reduzida têm direito a prioridade e apoio no embarque."},{"title":"Codigos AIRIMP","type":"Consulta","duration":"19 min","content":"Códigos AIRIMP\n\nOs códigos AIRIMP padronizam solicitações, condições especiais e necessidades operacionais entre empresas aéreas, aeroportos e equipes de atendimento. Eles ajudam o agente a registrar corretamente uma assistência e evitam falhas de comunicação entre check-in, embarque, rampa, tripulação e destino.\n\nCódigos de assistência\n\nCódigos AIRIMP padronizam solicitações e condições especiais entre empresas aéreas e aeroportos.\n\n- BLND: passageiro com deficiência visual.\n- DEAF: passageiro com deficiência auditiva.\n- WCHR: cadeira de rodas para longas distâncias.\n- WCHS: assistência em escadas.\n- WCHC: assistência integral até o assento.\n- UMNR: menor desacompanhado.\n- MAAS: máxima assistência.\n\nServiços especiais\n\nAlguns códigos sinalizam serviços adicionais, alimentação, animais, oxigênio, armas ou equipamentos especiais.\n\n- PETC: animal transportado na cabine.\n- AVIH: animal vivo transportado no porão.\n- SVAN: animal de serviço.\n- ESAN: animal de suporte emocional, conforme regra da companhia.\n- WEAP: arma de fogo ou desportiva.\n- SPEQ: equipamento especial.\n- BBML, CHML, DBML, VGML: refeições especiais.\n\nAtendimento a passageiros com assistência\n\nO atendimento especial deve preservar segurança, autonomia e dignidade do passageiro.\n\n- Fale diretamente com o passageiro.\n- Pergunte antes de ajudar.\n- Em cadeira de rodas, conduza com cuidado em rampas, portas e áreas de circulação.\n- Em deficiência visual, ofereça o braço e antecipe obstáculos.\n- Em deficiência auditiva, fale de frente e use escrita se necessário.\n\nMenor desacompanhado\n\nO serviço UMNR acompanha menores viajando sem responsável legal, conforme idade, rota e política da empresa.\n\n- Confirmar idade e regra da companhia.\n- Verificar documentação e autorização quando aplicável.\n- Registrar dados dos responsáveis na origem e destino.\n- Não aceitar situações incompatíveis com segurança ou assistência necessária.\n\nTransporte de animais\n\nAnimais podem ser transportados como PETC ou AVIH, conforme porte, peso, documentação e regra da companhia.\n\n- Verificar vacinação e documentação.\n- Conferir dimensões e condições do kennel.\n- Avaliar restrições de raça, saúde e ventilação.\n- Confirmar se o serviço é cabine, porão, animal de serviço ou suporte.\n\nTransporte de arma de fogo\n\nArmas exigem procedimento específico, apresentação prévia, documentação e autorização pelos órgãos competentes.\n\n- Encaminhar conforme procedimento da companhia e autoridade aeroportuária.\n- Conferir formulário aplicável.\n- Garantir que a arma esteja desmuniciada quando despachada.\n- Informar restrições e condições operacionais ao passageiro.\n\nComo aplicar no atendimento\n\n1. Identifique a necessidade real do passageiro antes de lançar o código.\n2. Confirme se o serviço depende de documentação, reserva prévia, limitação operacional ou autorização da companhia.\n3. Registre o código correto no sistema de atendimento/check-in.\n4. Informe os setores envolvidos: embarque, rampa, tripulação, conexão e destino.\n5. Evite usar códigos genéricos quando há código específico.\n\nCódigos essenciais para memorização\n\nBLND: passageiro com deficiência visual.\nDEAF: passageiro com deficiência auditiva.\nWCHR: passageiro consegue subir/descer escadas e caminhar curtas distâncias, mas precisa de cadeira para percurso longo.\nWCHS: passageiro não consegue subir/descer escadas, mas consegue chegar ao assento.\nWCHC: passageiro precisa de assistência completa até o assento.\nUMNR: menor desacompanhado.\nMAAS: passageiro que precisa de máxima assistência.\nPETC: animal na cabine.\nAVIH: animal no porão.\nSVAN: animal de serviço.\nESAN: animal de suporte emocional, quando aplicável pela regra vigente.\nWEAP: arma de fogo/desportiva sob procedimento específico.\nSPEQ: equipamento especial.\nBBML, CHML, DBML e VGML: refeições especiais.\n\nPonto de atenção\n\nO código correto não substitui o atendimento humanizado. O passageiro deve ser orientado com clareza, respeito e previsibilidade, principalmente quando envolve mobilidade, deficiência, menor desacompanhado, animal ou item controlado."}]$json_fundamentos$::jsonb, $mat_fundamentos$Atendimento ao passageiro

Slide
" MÓDULO 1 – Fundamentos do Atendimento ao Cliente
1.1. Conceito de Atendimento ao Cliente 
O que é atendimento ao cliente?
Explicação:
Atendimento ao cliente é o conjunto de ações e interações que uma empresa realiza para atender, auxiliar, resolver problemas e oferecer uma experiência satisfatória ao seu público. Na aviação, isso inclui desde o check-in até o desembarque e até mesmo contatos após o voo.

Exemplo prático:
Um passageiro chega ao balcão com dúvidas sobre o portão de embarque e regras de bagagem. O atendente escuta, fornece as informações com clareza e oferece ajuda para despachar a mala, demonstrando proatividade e cordialidade.

O que é atendimento ao cliente?

Diferença entre atendimento, suporte e acolhimento

Atendimento como diferencial competitivo no setor aéreo

1.2. Importância do Atendimento no Setor de Aviação
Explicação:
No transporte aéreo, o atendimento ao cliente é um dos principais diferenciais competitivos. Em um mercado onde as tarifas são parecidas, a experiência é o que fideliza o cliente.

Exemplo prático:
Duas companhias oferecem voos similares. O passageiro escolhe sempre aquela que oferece uma equipe mais prestativa, que se lembra do nome dele e resolve suas solicitações com rapidez.

1.3. Experiência do Cliente (Customer Experience – CX)
Explicação:
A Experiência do Cliente engloba todas as interações com a empresa. Uma boa experiência depende da percepção do cliente sobre cada etapa da jornada, incluindo atendimento, conforto, segurança e soluções de problemas.

Exemplo prático:
Um passageiro esqueceu um item no avião. Ele liga para a companhia, é atendido com agilidade e em 30 minutos o objeto é encontrado e entregue. Esse atendimento rápido e eficiente transforma uma possível frustração em uma experiência positiva.

1.4. Cliente Interno x Cliente Externo
Explicação:
Cliente externo é o passageiro. Cliente interno são os colegas de trabalho, de outras áreas ou turnos. Um bom atendimento interno reflete diretamente na experiência externa do passageiro.

Exemplo prático:
A equipe do check-in depende da equipe de bagagens para saber se houve carregamento especial. Uma falha de comunicação pode fazer o atendente repassar informação errada ao passageiro — por isso, atender bem também quem trabalha com você é essencial.

.1.5. Comunicação Positiva e Eficiente
Explicação:
Usar uma linguagem amigável, clara e propositiva faz toda a diferença. Evitar termos negativos e adotar uma postura acolhedora ajuda a criar confiança.

Exemplo prático:
“Esse voo já está fechado, você chegou tarde.”
“Infelizmente o embarque foi encerrado, mas vou verificar as opções disponíveis para ajudá-lo da melhor forma.”"
"2.1. Passageiros Frequentes x Ocasional
Explicação:
Passageiros frequentes têm familiaridade com os procedimentos e geralmente buscam agilidade. Já os passageiros ocasionais podem ter dúvidas e inseguranças, exigindo mais orientação.

Exemplo:
Um passageiro frequente faz o check-in pelo app e só precisa saber o portão. Um passageiro ocasional chega confuso ao balcão e pergunta onde é feito o check-in. O atendente deve adaptar o atendimento para cada um.
2.2. Passageiros Corporativos
Explicação:
Costumam estar com o tempo contado, valorizam eficiência, pontualidade e discrição. Podem exigir alterações de última hora ou upgrades.

Exemplo:
Um executivo chega atrasado para o embarque. O atendente, ao identificar o perfil, agiliza o processo e solicita via rádio prioridade no embarque, mantendo um tom respeitoso e eficiente.

2.3. Passageiros com Crianças
Explicação:
Demandam paciência, ajuda com bagagem, carrinhos e compreensão com comportamentos imprevisíveis das crianças.

Exemplo:
Uma mãe está com bebê no colo e mala nas mãos. O funcionário oferece ajuda para despachar a bagagem e solicita cadeira de rodas para facilitar o deslocamento.

---

Prioridades e assistencias

Postura em prioridades e assistências

Esta trilha liga prioridade operacional com postura de atendimento. O agente deve organizar fila, embarque e conexão com cordialidade, atenção visual, linguagem clara e respeito às necessidades de cada passageiro. Prioridade não é apenas rapidez: é postura profissional aplicada a idosos, gestantes, PcDs, crianças, passageiros com conexão curta e clientes em situação sensível.

2.4. Passageiros Idosos e Gestantes
Explicação:
Exigem prioridade e atenção especial à saúde e mobilidade. Devem ser tratados com paciência e linguagem clara.

Exemplo:
Uma gestante solicita um assento próximo ao banheiro. O atendente verifica a disponibilidade e faz a alteração com cortesia, explicando as opções disponíveis.

2.5. Passageiros Estrangeiros
Explicação:
Podem enfrentar barreiras linguísticas e culturais. O atendimento deve ser mais visual, pausado e adaptado.

Exemplo:
Um passageiro chinês pergunta onde embarcar. O atendente aponta o portão no painel, mostra o cartão de embarque e gesticula, garantindo compreensão sem constrangimento.

2.6. Passageiros em Estresse ou Crise
Explicação:
Passageiros que enfrentam atrasos, perdas, emergências familiares ou luto podem reagir com irritação ou apatia.

Exemplo:
Um passageiro grita após saber que o voo foi cancelado. O atendente mantém a calma, escuta sem interromper e diz: “Entendo sua frustração, vamos buscar uma solução agora.”

"
" MÓDULO 3 – Atendimento Humanizado
3.1. O que é Atendimento Humanizado
Explicação:
Vai além de seguir regras. É acolher com empatia, demonstrar atenção e tratar o cliente como indivíduo.

Exemplo:
Uma senhora está nervosa para voar sozinha pela primeira vez. O atendente oferece um acompanhante até o portão e conversa com ela até se sentir segura.3.2. A Empatia como Pilar do Atendimento
Explicação:
É se colocar no lugar do outro, entendendo sentimentos e necessidades, mesmo sem concordar com tudo.

Exemplo:
Mesmo que o erro tenha sido do passageiro ao perder o voo, o atendente escuta, evita julgamentos e busca alternativas, dizendo: “Vamos ver o que conseguimos fazer por você.”3.3. Escuta Ativa e Comunicação Acolhedora
Explicação:
Consiste em ouvir com atenção plena, demonstrando interesse real, sem interromper ou rebater.

Exemplo:
Durante uma reclamação, o atendente mantém contato visual, acena com a cabeça e só responde após o cliente terminar, reforçando: “Agradeço por relatar. Vamos resolver.”3.4. Personalização do Atendimento
Explicação:
Chamar pelo nome, lembrar histórico ou preferências torna o atendimento mais humano e valorizado.

Exemplo:
“Senhor Paulo, vi que o senhor já viajou conosco semana passada. Deseja o mesmo assento na janela?”

"
" MÓDULO 4 – Acessibilidade e Atendimento a PNAE
4.1. Legislação e Normas
Explicação:
A Resolução ANAC 280 assegura direitos de acessibilidade. Conhecê-la evita erros e garante atendimento digno.

Exemplo:
Um passageiro surdo tem o direito de embarcar com acompanhante gratuitamente. O atendente deve informar corretamente e registrar o acompanhante no sistema.4.2. Tipos de Deficiência
Visual:
Necessita de orientação física e verbal clara.
Ex: “Senhor, pegarei seu braço pelo cotovelo. Vamos até o embarque.”

Auditiva:
Usar escrita ou Libras, se souber.
Ex: Escreve: “Seu portão é o 6. Precisa de ajuda para ir até lá?”

Motora:
Precisa de auxílio com locomoção e priorização.
Ex: Providenciar cadeira de rodas e guia.

Intelectual/Neurológica:
Demandam linguagem simples e ambiente previsível.
Ex: Explicar o passo a passo com calma a uma pessoa com autismo.

4.3. Atendimento Inclusivo
Explicação:
Tratar com respeito, autonomia e sem infantilizar. Atender com dignidade e considerar suas limitações.

Exemplo:
Falar diretamente com o passageiro com deficiência, não apenas com o acompanhante.

4.4. Recursos de Apoio
Explicação:
Usar todos os meios disponíveis: intérpretes, cadeiras, guias, sinalização adaptada, etc.

Exemplo:
Um cego chega desacompanhado. O atendente oferece um colaborador guia até o portão, e comunica a equipe de solo para acompanhamento no desembarque.

4.5. Embarque Assistido
Explicação:
Pessoas com deficiência ou mobilidade reduzida têm direito a prioridade e apoio no embarque.

---

Codigos AIRIMP

Códigos AIRIMP

Os códigos AIRIMP padronizam solicitações, condições especiais e necessidades operacionais entre empresas aéreas, aeroportos e equipes de atendimento. Eles ajudam o agente a registrar corretamente uma assistência e evitam falhas de comunicação entre check-in, embarque, rampa, tripulação e destino.

Códigos de assistência

Códigos AIRIMP padronizam solicitações e condições especiais entre empresas aéreas e aeroportos.

- BLND: passageiro com deficiência visual.
- DEAF: passageiro com deficiência auditiva.
- WCHR: cadeira de rodas para longas distâncias.
- WCHS: assistência em escadas.
- WCHC: assistência integral até o assento.
- UMNR: menor desacompanhado.
- MAAS: máxima assistência.

Serviços especiais

Alguns códigos sinalizam serviços adicionais, alimentação, animais, oxigênio, armas ou equipamentos especiais.

- PETC: animal transportado na cabine.
- AVIH: animal vivo transportado no porão.
- SVAN: animal de serviço.
- ESAN: animal de suporte emocional, conforme regra da companhia.
- WEAP: arma de fogo ou desportiva.
- SPEQ: equipamento especial.
- BBML, CHML, DBML, VGML: refeições especiais.

Atendimento a passageiros com assistência

O atendimento especial deve preservar segurança, autonomia e dignidade do passageiro.

- Fale diretamente com o passageiro.
- Pergunte antes de ajudar.
- Em cadeira de rodas, conduza com cuidado em rampas, portas e áreas de circulação.
- Em deficiência visual, ofereça o braço e antecipe obstáculos.
- Em deficiência auditiva, fale de frente e use escrita se necessário.

Menor desacompanhado

O serviço UMNR acompanha menores viajando sem responsável legal, conforme idade, rota e política da empresa.

- Confirmar idade e regra da companhia.
- Verificar documentação e autorização quando aplicável.
- Registrar dados dos responsáveis na origem e destino.
- Não aceitar situações incompatíveis com segurança ou assistência necessária.

Transporte de animais

Animais podem ser transportados como PETC ou AVIH, conforme porte, peso, documentação e regra da companhia.

- Verificar vacinação e documentação.
- Conferir dimensões e condições do kennel.
- Avaliar restrições de raça, saúde e ventilação.
- Confirmar se o serviço é cabine, porão, animal de serviço ou suporte.

Transporte de arma de fogo

Armas exigem procedimento específico, apresentação prévia, documentação e autorização pelos órgãos competentes.

- Encaminhar conforme procedimento da companhia e autoridade aeroportuária.
- Conferir formulário aplicável.
- Garantir que a arma esteja desmuniciada quando despachada.
- Informar restrições e condições operacionais ao passageiro.

Como aplicar no atendimento

1. Identifique a necessidade real do passageiro antes de lançar o código.
2. Confirme se o serviço depende de documentação, reserva prévia, limitação operacional ou autorização da companhia.
3. Registre o código correto no sistema de atendimento/check-in.
4. Informe os setores envolvidos: embarque, rampa, tripulação, conexão e destino.
5. Evite usar códigos genéricos quando há código específico.

Códigos essenciais para memorização

BLND: passageiro com deficiência visual.
DEAF: passageiro com deficiência auditiva.
WCHR: passageiro consegue subir/descer escadas e caminhar curtas distâncias, mas precisa de cadeira para percurso longo.
WCHS: passageiro não consegue subir/descer escadas, mas consegue chegar ao assento.
WCHC: passageiro precisa de assistência completa até o assento.
UMNR: menor desacompanhado.
MAAS: passageiro que precisa de máxima assistência.
PETC: animal na cabine.
AVIH: animal no porão.
SVAN: animal de serviço.
ESAN: animal de suporte emocional, quando aplicável pela regra vigente.
WEAP: arma de fogo/desportiva sob procedimento específico.
SPEQ: equipamento especial.
BBML, CHML, DBML e VGML: refeições especiais.

Ponto de atenção

O código correto não substitui o atendimento humanizado. O passageiro deve ser orientado com clareza, respeito e previsibilidade, principalmente quando envolve mobilidade, deficiência, menor desacompanhado, animal ou item controlado.$mat_fundamentos$),
('bagagem-extraviada', $json_bagagem_extraviada$[{"title":"Definição e registro","type":"Aula","duration":"18 min","content":"Bagagem extraviada\n\"DEFINIÇÃO\nBagagem despachada que não chegou no mesmo voo do passageiro, fcando caracterizado\no extravio. Delayed Bag - AHL (Advise If Hold) é uma sigla do sistema SITA WorldTracer\nDesktop.\nOs agentes do Serviço de Bagagem devem consultar previamente as m Bag - FWD recebidas por seu aeroporto, a fm de anunciar o nome de todos os passageiros\ncujas bagagens fcaram na origem ou conexão, evitando que aguardem na esteira\ndesnecessariamente.\n2.2. REGISTRO DE OCORRÊNCIA\nAbertura de uma Delayed Bag - AHL em voos nacionais e internacionais acontece somente\nno ato do desembarque do passageiro, ou seja, não são aceitas reclamações posteriores. O\nregistro da Delayed Bag - AHL deve ser de acordo com o nome que consta na etiqueta. Ou\nseja, se tivermos 3 malas extraviadas de uma mesma família ou grupo, e as bagagens\ndespachadas estão em nome de cada passageiro, devem ser registrados 03 Property\nIrregularity Report - PIR.\nO Contact Center companhia aérea pode informar ao cliente o status do caso, editar ou inserir\ninformações.\nCaso o passageiro necessite de alguma informação que não está disponível no sistema SITA\nWorldTracer Desktop, o Contact Center envia um e-mail ao aeroporto com a dúvida em\nquestão. O aeroporto deve responder o e-mail em no máximo 48h, para que o Contact\nCenter possa responder prontamente ao passageiro.\nO Agente do Serviço de Bagagem deverá seguir os passos abaixo: 1.3.0 POLÍTICA DE BAGAGEM\n1.3.1. Legislação aplicada\nPara registro é aplicada a Convenção de Montreal.\nÉ aplicado a Resolução 400 ANAC.\n\n1.3.2. Contrato de transporte de bagagem\nAs Normas do ‘Contrato de Transporte Aéreo’ estão disponíveis no site www.companhia aérea.com.\n1.3.3. Atendimento no Desembarque\nNa chegada de cada voo da companhia aérea, em qualquer aeroporto, deve haver um ou mais\n(dependendo da necessidade) Agentes do Serviço de Bagagem recepcionando e orientando\nos passageiros na área de restituição de bagagem:\n● O Agente deve efetuar um anúncio (speech), informando o número da esteira em que\nas bagagens serão disponibilizadas para cada voo;\n● O Agente que estiver recepcionando os passageiros deve estar munido de formulário\nProperty Irregularity Report - PIR, cartão de identifcação de bagagem, (Chart);\n● Deve também esclarecer, de forma educada e cortês, a Política Interna da companhia aérea\nque é baseada em legislações nacionais e internacionais;\n● Sempre que possível, avisar o passageiro sobre a falta da bagagem no momento do\nseu desembarque. Para isso, faça um anúncio no saguão de desembarque\nsolicitando que o passageiro entre em contato com funcionário da companhia aérea.\nSugerimos o seguinte speech:\n“Atenção, por favor, Sr. / Sra. [nome do passageiro] cliente companhia aérea do voo XXX vindo\nde XXX, por favor entre em contato com nossa equipe neste saguão de\ndesembarque. Muito obrigado”;\n● Dizer ao passageiro claramente o que será feito acerca do problema, não fazendo\npromessas que não possam ser cumpridas;\n● Explicar ao passageiro os prazos de busca ou tratativas para a resolução da\ndanifcação;\n● Fornecer o contato do Contact Center e incentivar o passageiro a utilizar o rastreador\n\nde bagagem, através do site da companhia aérea:\nhttps://www.portal operacional da companhia\nodifcar-informacao;\n● Voos origem Brasil operados pela companhia aérea em aeronaves narrow body: Nos\ncasos em que o CRS (child restraint system) é usado, a equipe do Serviço de\nPassageiros o entrega à equipe do Serviço de Bagagem, que é responsável por\ndevolvê-lo como \"\"RUSH\"\" à base que pertence no próximo voo disponível;\n● As etiquetas RUSH manuais devem ser guardadas em local seguro, pois sua\nutilização é permitida apenas para envio de bagagens desacompanhadas e somente\nem caso de falhas no sistema que impeçam a emissão de etiquetas RUSH\nautomatizadas. Não é permitido fornecer estas etiquetas a quaisquer pessoas que\nnão realizem a função de Serviço de Bagagem (LL).\n\"\n\" EXTRAVIO – DELAYED BAG - AHL 2. EXTRAVIO – DELAYED BAG - AHL\nDEFINIÇÃO\nBagagem despachada que não chegou no mesmo voo do passageiro, fcando caracterizado\no extravio. Delayed Bag - AHL (Advise If Hold) é uma sigla do sistema SITA WorldTracer\nDesktop.\nOs agentes do Serviço de Bagagem devem consultar previamente as mensagens Forward\nBag - FWD recebidas por seu aeroporto, a fm de anunciar o nome de todos os passageiros\ncujas bagagens fcaram na origem ou conexão, evitando que aguardem na esteira\ndesnecessariamente.\nREGISTRO DE OCORRÊNCIA\nAbertura de uma Delayed Bag - AHL em voos nacionais e internacionais acontece somente\nno ato do desembarque do passageiro, ou seja, não são aceitas reclamações posteriores. O\nregistro da Delayed Bag - AHL deve ser de acordo com o nome que consta na etiqueta. Ou\n\nseja, se tivermos 3 malas extraviadas de uma mesma família ou grupo, e as bagagens\ndespachadas estão em nome de cada passageiro, devem ser registrados 03 Property\nIrregularity Report - PIR.\nO Contact Center companhia aérea pode informar ao cliente o status do caso, editar ou inserir\ninformações.\nCaso o passageiro necessite de alguma informação que não está disponível no sistema SITA\nWorldTracer Desktop, o Contact Center envia um e-mail ao aeroporto com a dúvida em\nquestão. O aeroporto deve responder o e-mail em no máximo 48h, para que o Contact\nCenter possa responder prontamente ao passageiro.\nO Agente do Serviço de Bagagem deverá seguir os passos abaixo: Inserção de documento: todos os aeroportos companhia aérea deverão inserir no campo\nPassport Details - PP do sistema SITA WorldTracer Desktop a sigla + número do\ndocumento do passageiro.\nTIPO EXEMPLO\n\nPassport Details - PP CPF 12345678910 ou Passport Details - PP CPF 12345678910 ouort Details - PP RG 123456789\nDocumento de i- PP RG 123456789 ou Documento de identidade ou DNI\n( todas as nacionalidades);\nPassport Details - PP DI 123456\nPassaporte\n(todas as nacionalidades).\nPassport Details - PP PSPT FF123456\nAtendimento inicial do passageiro no desembarque\nQuando a bagagem do cliente for extraviada e já houver FWD (mensagem de envio) no\nsistema Worldtracer Desktop, devemos pesquisar informações da bagagem no sistema\nSabre e/ou no SmartSuite. Na sequência devemos procurar e anunciar o cliente no\ndesembarque e providenciarmos o registro do seu relatório o mais rápido possível, visando\nminimizar os impactos causados.\nCOLABORADOR: [Bom dia/boa tarde/boa noite], sr(a) [NOME DO CLIENTE]. Meu nome é\n[NOME DO COLABORADOR] e gostaria de informar que infelizmente a sua mala não chegou\nneste voo. Lamentamos o ocorrido e recebemos a informação de que a sua mala tem\nprevisão para chegar neste aeroporto no voo [XXXX], por volta de [YY] horas. Precisarei\ncoletar alguns dados para providenciar a entrega da sua bagagem.\nOuça atentamente o que o cliente tem a dizer. Questione o cliente se além da abertura do\nregistro, se tem mais algo que possa fazer para ajudá-lo.\nApós coletar todos os dados necessários e registrar o PIR no sistema, verifcar se o cliente\npossui fdelidade Black Signature, Black, Platinum ou viajou na cabine Premium Business ou\nPremium Economy, pois neste caso devemos oferecer auxílio emergencial de forma proativa."},{"title":"Atendimento no desembarque","type":"Procedimento","duration":"22 min","content":"COLABORADOR: Sr(a) [NOME DO CLIENTE], assim que a sua mala chegar neste aeroporto,\na companhia aérea entrará em contato por telefone, no número informado. Alinharemos com a\ntransportadora que nos atende para que sua bagagem seja entregue o mais rápido possível.\nVou pedir por gentileza, que fque atento(a) ao telefone, para que possamos atualizá-lo(a) de\nqualquer novidade ou mudança. O(a) senhor(a) gostaria de fornecer mais telefones de\ncontato?\nGostaríamos de pedir as mais sinceras desculpas e com o objetivo de melhorar nossos\nserviços, informo que será enviada para o e-mail informado uma pesquisa para avaliar nosso\natendimento. Confrmação de endereço, avaliação de experiência e verifcação de entrega da\nbagagem\nApós a chegada da bagagem no seu aeroporto, antes de realizar o contato com o cliente,\ndevemos verifcar a disponibilidade com a transportadora e considerar a logística do Serviço\nde Bagagem, a fm de garantir que a informação da previsão de entrega da bagagem possa\nser fornecida ao cliente durante o atendimento.\nCOLABORADOR: [Bom dia/Boa tarde/Boa noite!] Meu nome é [NOME DO\nCOLABORADOR] e represento o setor de bagagens do aeroporto [INFORMAR QUAL\nAEROPORTO REPRESENTA]. Eu gostaria de falar com o(a) [NOME DO CLIENTE] sobre a\nsua bagagem.\nNovamente, peço desculpas em nome da companhia aérea por qualquer inconveniente causado.\nInformo que sua bagagem já se encontra disponível no aeroporto [nome do o aeroporto que\nestá realizando a entrega]. Gostaríamos de confrmar seu endereço para coordenar a\nentrega de sua bagagem.\nApós o passageiro confrmar o endereço:\n\nCOLABORADOR: Verifquei com a transportadora e é possível realizar a entrega de sua\nmala entre [INFORMAR A JANELA DE HORÁRIO]. O senhor(a) estará no endereço este\nhorário ou haverá alguém que possa receber a bagagem no seu lugar? Posso agendar com\na transportadora?\nO agente deve assegurar de informar ao passageiro o horário de atendimento da prestadora\nde serviços de entrega de seu aeroporto, a fm de fornecer um atendimento assertivo e com\ninformações seguras:\nCOLABORADOR: Com o objetivo de melhorar nossos serviços, informo que a/o [Sr/Sra]\nreceberá uma pesquisa para avaliar sua experiência com o processo de sua bagagem.\nAgradecemos o seu tempo.\nAlgumas horas após a transportadora coletar a bagagem do cliente, será necessário\nconfrmar, via e-mail, se o passageiro recebeu a bagagem sem danos e/ou violações e que a\npesquisa de avaliação chegará em algumas horas. Para isso, utilize o modelo de mensagem\nabaixo, alterando os campos [PIR DO PASSAGEIRO] e [NOME] para os dados reais do\npassageiro:\"\n\" PROCESSO DE BUSCA POR EXCEÇÃO\nA busca de Delayed Bag - AHL por exceção ocorre somente por 5 dias. No 5º dia, o agente\ndeve entrar em contato com o passageiro e encerrar a Delayed Bag - AHL no sistema,\ninserindo todas as informações no Extra Information.\nQuando se registra um processo busca por exceção o agente deve entregar uma cópia do\nprocesso ao cliente e completar na máscara do Delayed Bag - AHL o elemento Message\nOptions de acordo com a solicitação do cliente.\nSerão considerados casos de busca por exceção as seguintes situações:\n\nPassageiros que não possuam etiqueta de bagagem e não possuam registro de\ndespacho de bagagem no sistema de check-in.\nCaso o passageiro não possua o comprovante de despacho, mas conste\ninformação no sistema, o agente de bagagem deve registrar o Delayed Bag - AHL\nnormalmente e anexar o registro de check-in.\nPassageiros que não fzeram alfândega no primeiro ponto alfandegário;\nPassageiros que reclamam posteriormente, mesmo com comprovante de bagagem;\nPassageiros com bilhetes separados;\nPassageiros que tiveram malas retidas na origem e ou conexão devido ter conteúdo\nnão permitido para embarque, as quais são aquelas mercadorias perigosas, podendo\nvariar em cada país, como por exemplo: Power bank, aerossóis, baterias, cigarros\neletrônicos, entre outros.\nExemplo: O passageiro realiza o trecho LIS/GIG com a TAP e GIG/SCL com a\ncompanhia aérea em bilhetes separados. Se o passageiro não retirar a bagagem em GIG,\ndeve-se abrir um Delayed Bag - AHL busca por exceção em SCL uma vez que a\nbagagem não estará registrada no sistema companhia aérea. Neste caso, deve ser\nconsiderado Reason for Loss - RL79 Fault Station - FS SCL.\nQuando a bagagem for retida pela Alfândega por responsabilidade do passageiro, e\ndeverá retirar a bagagem no aeroporto do destino. Nestes casos, deve-se conside\no Reason for Loss - RL73 e o Fault Station - FS o aeroporto em que a bagage\ndeveria ter sido retirada para fazer a alfândega.\nO agente deve inserir as informações no sistema SITA Worldtracer Desktop e, se\nno 5º dia a bagagem não for localizada, o processo deve ser encerrado sem\nindenização.\n\nSe a bagagem é localizada e foi comprovada a responsabilidade da companhia aérea, deve-se realizar\na entrega normalmente na residência do passageiro e, caso solicitado pelo passageiro,\nentregar o valor do auxílio emergencial.\nOperação companhia aérea, exceto Brasil: em caso de reporte de bagagem extraviada fora do\ndesembarque, a equipe do Contact Center não redireciona mais o passageiro para registrar o\nProperty Irregularity Report - PIR no aeroporto. Neste caso, o Contact Center irá solicitar ao\npassageiro a documentação necessária para registro do Property Irregularity Report - PIR e,\nassim que recebidos, os dados serão encaminhados para o aeroporto de destino do cliente.\"\n\"Com estas informações, o agente de bagagem deve registrar o Property Irregularity Report -\nPIR no sistema SITA WorldTracer Desktop como busca por exceção e realizar as buscas por\n5 dias. Se a bagagem não for localizada o caso deve ser encerrado no sistema, conforme\nprocedimento de busca por exceção.\nConsiderando que os relatórios criados como “busca por exceção” não são culpa\nda companhia aérea, estes não devem gerar custos. Ou seja, não devemos\nemitir compensação para auxílio emergencial, não realizamos a entrega da\nbagagem através de transportadora, não indenizamos o cliente em caso de\nextravio defnitivo, etc.\nNão há prazo para abertura do PIR de busca por exceção, apenas para\nencerramento (5º dia).\nCaso o cliente de um PIR de AHL - busca por exceção, tenha sua mala danifcada\ne/ou violada, devemos abrir o PIR de DPR para o cliente e oferecer as\ncompensações normalmente."},{"title":"Documentos e dados obrigatorios","type":"Pratica guiada","duration":"20 min","content":"Documentos e dados obrigatórios\n\nEsta trilha trata da conferência dos dados essenciais para abertura e manutenção de uma AHL/PIR. O agente deve validar documento do passageiro, telefone, e-mail, endereço, etiqueta TN, rota RT, voo/data FD, nome NM, iniciais IT, cor/tipo CT, marca BI, peso BW, Reason for Loss RL, Fault Station FS e observações em FF.\n\nEndereço e contato são críticos porque orientam entrega, comunicação e registro de tentativas. Quando houver divergência entre passageiro, etiqueta e reserva, registre a evidência no histórico antes de seguir com a tratativa.\n\nMaterial de apoio da trilha\n\nOrientações para fechamento de PIRs BUSCA POR EXCEÇÃO\nQuando a mala for localizada: 2) Quando a mala NÃO for localizada:\nAssim que o cliente fzer a retirada no aeroporto, faça o BDO/Baggage Delivery\nOrder/Create Delivery Order com o DS/Delivery Service destinado a “retirada no\naeroporto”;\nAdicione o custo “D/Delivery” com valor “0” (zero);\nEncerre o PIR.\nEncerre o PIR dentro do prazo de 05 Adicione o custo “D/Delivery” com valor “0” (zero);\nNo momento do fechamento, no campo SI/Supplementary Information, insira a\ninformação “NOT LOC”.\"\n\"TIPOS DE EXTRAVIO\nPerecíveis\nO agente do Serviço de Bagagem deve encerrar o processo imediatamente após a\nlocalização da bagagem, utilizando Reason for Loss - RLe Fault Station - FS correspondentes\nao motivo do extravio e inserindo as informações no Extra Information.\nQuando um item perecível for localizado deteriorado, a indenização deverá ser feita\ndiretamente pelo aeroporto utilizando o Agente 360 ou Travel Voucher e de acordo com o\nlimite de sua autonomia. Caso o item não tenha sido localizado dentro nos primeiros 5 dias,\npassarão automaticamente para a equipe de busca secundária e, posteriormente, para\nindenização (Contact Center ou CUS).\nA indenização só se aplicará para perecíveis despachados dentro de caixa térmica ou isopor,\nmesmo que o verso da etiqueta esteja assinado.\nBagagens retidas na Alfândega\nPara as bagagens localizadas na alfândega, o processo deve ser encerrado após a sua\nlocalização, inserindo Reason for Loss - RL e Fault Station - FS correspondentes ao extravio\n\ne inserindo as informações no Extra Information. Porém, o agente deve auxiliar o passageiro\nquanto à liberação da bagagem até a resolução do processo.\nCaso seja necessária autorização do bilhete RIP para liberar a bagagem na\nalfândega, o aeroporto deve enviar um e-mail para CUS,\ngrp_equipaje_cus@sac.companhia aérea.com e para o Contact Center (BR) através do\nFormulário de Derivação. Não será autorizado Property Irregularity Report - PIR\npara passageiros com processo busca por exceção, ou seja, para passageiros que\nnão fzeram alfândega.\nBagagens retidas na origem/conexão por conteúdo não permitido (Mercadorias\nPerigosas)\nA tratativa para os casos em que as malas fcam retidas na origem ou conexão, por conteúdo\nnão permitido, deverão seguir os seguintes passos:\n● Property Irregularity Report - PIR será aberto normalmente e as buscas, serão\nexecutadas pelo aeroporto;\n● Casos confrmados de malas retidas por conteúdo não permitido para embarque, ou\ndevido a negação de retirada do item vetado pelo cliente, nas origem e/ou conexões,\nserão tratados como busca por exceção;\n● Os agentes deverão acompanhar e auxiliar o cliente para recuperar a mala,\nsolicitando via sistema ou e-mail (caso fque retida com a administradora do\naeroporto);\n● Quando a mala chegar ao destino, a base deverá solicitar ao cliente para retirar a\nbagagem no aeroporto e encerrar o caso com Reason for Loss - RL79 e o Fault\nStation - FS pertencerá à base que criou o Property Irregularity Report - PIR;\n● Os casos criados como busca por exceção devem seguir o procedimento e ser\n\nencerrado em 5 dias corridos a contar da data de abertura do processo no sistema.\"\n\"Armas de Fogo\nTodos os aeroportos devem verifcar obrigatoriamente o porão de todas as aeronaves,\nmesmo que não haja mensagem de despacho ou SSR para armas de fogo ou esportes.\nEm caso de extravio:\n● Voos domésticos no Brasil e voos de / para o Brasil. Se a arma e/ou as munições\nnão forem restituídas ao passageiro no prazo de 01 hora a contar da hora do pouso\nda aeronave, deve ser registrado o processo de extravio no sistema SITA WorldTracer\nDesktop.\n● O aeroporto de destino deve inserir no sistema SITA WorldTracer Desktop,\ndescriminar o tipo de objeto retido no campo Contents - CC do processo e inserir\nimediatamente o Reason for Loss - RL75 (Arma de Fogo);\n● O número a ser inserido no campo Tag Number - TN, é o número do Protocolo\n(canhoto do envelope);\n● O passageiro deve obrigatoriamente abrir um BO (Boletim de Ocorrência). Este\nprocedimento deve ser informado ao passageiro no ato da abertura do Property\nIrregularity Report - PIR.\nVoos domésticos no Brasil e voos de / para o Brasil, o extravio deverá ser comunicado via\ne-mail. Segue abaixo o padrão do e-mail a ser enviado:\nPara: Polícia Federal destino; Administrador Aeroportuário origem; Administrador\nAeroportuário destino; Segurança Corporativa\ncompanhia aérea(exchange_msg_dis_securitysaoqf@companhia-aerea.com).\nAssunto: Extravio de arma de fogo e/ou munições – Voo XXX-Data XXX\nNome do passageiro:\nData:\nVoo:\nRota:\nHora do pouso:\nBase que registrou o extravio:\nNúmero do processo:\nDescrição do objeto:\nNúmero da etiqueta o (n°do envelope):\n\nPrefxo da aeronave:\nRelato do extravio: Na ausência da Polícia Federal no aeroporto de origem ou destino, o extravio deverá ser\ncomunicado ao órgão de segurança pública substituto. Além de notifcar a Central de\nBagagens e a Central de Aeroportos.\nTodos os aeroportos (exceto domésticos BR) Aeroportos domésticos Brasil\nccpoperacional@companhia aérea.com\ngrp_centralbaggagecompanhiaaerea@companhia aérea.com\nDe segunda a sexta feira:\ngrp_centralbaggagecompanhiaaerea@companhia aérea.com\nFinais de semana:\nLocalização de arma de fogo:\nVoos domésticos no Brasil e voos de / para o Brasil:\nAo localizar a arma e/ou munições o Serviço de Bagagem deverá comunicar imediatamente\natravés de e-mail a Polícia Federal, os Administradores dos aeroportos de origem, conexão e\ndestino e a equipe de Segurança Corporativa companhia aérea.\nAo enviar um objeto retido desacompanhado, o aeroporto deve enviar mensagem Forward\nBag - FWD e um e-mail para os aeroportos envolvidos informando o nome e telefone do\npassageiro, rota do voo, número do voo, tipo do objeto e local em que o objeto está\nseguindo.\nDe acordo com a orientação do departamento Jurídico, é proibida a entrega de arma de\nfogo. Neste caso o passageiro deve retirar o objeto no próprio aeroporto.\nIndenização de arma de fogo:\nO agente deve encaminhar o orçamento para compra da arma de fogo, para análise do\nContact Center de acordo com o idioma de preferência do passageiro.\nNos casos em que a arma extraviada pertencer a algum Órgão do Governo e/ou União, será\nexigido um orçamento fornecido pela Autoridade Policial responsável."},{"title":"Busca por excecao e casos especiais","type":"Consulta","duration":"24 min","content":"Busca por exceção e casos especiais\n\nBusca por exceção ocorre quando a análise foge do fluxo normal de extravio: passageiro sem comprovante, bilhetes separados, reclamação posterior, bagagem retida em alfândega, conteúdo não permitido, conexão fora do fluxo ou situação em que a responsabilidade operacional precisa ser avaliada com cautela.\n\nEm casos de alfândega, o agente deve identificar onde o passageiro deveria retirar a bagagem, registrar o motivo no histórico e orientar o passageiro sem prometer indenização automática. A tratativa deve ser documentada com RL e FS compatíveis.\n\nMaterial de apoio da trilha\n\nO aeroporto irá analisar e reembolsar os gastos de locomoção do passageiro mediante\napresentação de nota fiscal.\"\n\" AUXÍLIO EMERGENCIAL\nPara que o auxílio emergencial seja fornecido ao passageiro, deve-se respeitar as seguintes\nregras:\n● O passageiro solicitar;\n● O passageiro não residir na localidade;\n● O passageiro fcar uma noite sem bagagem.\nPara os passageiros que estiverem viajando em família ou em grupos e que\ntiverem suas bagagens extraviadas, o auxílio deve ser entregue de acordo com a\nquantidade dos passageiros afetados.\nExemplo 1: em uma família de 4 pessoas com 4 bagagens despachadas, o\ncheck-in despacha todas as bagagens apenas no nome de uma pessoa (Pai) e\nduas bagagens foram extraviadas. Deve ser registrado apenas 01 Property\nIrregularity Report - PIR de acordo com o nome que consta na etiqueta, porém\nduas pessoas foram afetadas (Pai e a Mãe) com o extravio. Nesse caso, os dois\npodem receber o valor do auxílio.\nExemplo 2: em um grupo de 10 pessoas viajando juntas, caso tenham 3 malas\nextraviadas, porém as bagagens despachadas em nome de cada passageiro.\nDevem ser registrados 03 Property Irregularity Report - PIR e entregue o valor do\nauxílio para cada passageiro afetado com o extravio. Se o check-in despachar\ntodas as bagagens apenas no nome de uma pessoa deve ser registrado apenas\n01 Property Irregularity Report - PIR, porém deve ser entregue o valor do auxílio\npara os passageiros que foram afetados com o extravio.\nExemplo 3: em um extravio de 01 bagagem, 02 passageiros foram prejudicados,\n\nneste caso os 02 clientes terão direito ao auxílio emergencial. Nesta situação,\ndeverão ser emitidas duas compensações de auxílio emergencial, sendo uma em\nnome do primeiro passageiro e a outra em nome do segundo passageiro.\nO formulário de auxílio emergencial deve ser preenchido, entregando uma cópia ao\npassageiro e anexando uma cópia  junto ao Property Irregularity Report - PIR.\nO valor autorizado ao passageiro deve ser informado no campo \"\"Extra Information\"\" do\nprocesso e inserido no campo \"\"Settlement Cost/Type - CS\"\" - código \"\"A\"\" (sistema SITA\nWorldTracer Desktop).\nA responsabilidade de inserir o custo \"\"A\"\" no processo é do aeroporto que autorizou o auxílio\nemergencial ao passageiro.\nO passageiro pode solicitar o reembolso dos gastos durante o tempo que fcou sem sua\nbagagem dentro de 21 dias após a entrega da bagagem. Para rota doméstica Argentina o\nprazo é de 10 dias. Tabela de Política de compensação\n\nAeroportos Brasil\nBAGAGEM ENTREGUE PASSAGEIRO STANDARD PASSAGEIRO PREFERENCIAL\nDia 0 Não se aplica R$300\nDia 1 R$75 R$300\nDia 2 R$75 Apresentação de nota fiscal\nDias 3 a 4 Apresentação de nota fscal Apresentação de nota fiscal\nPASSAGEIRO STANDARD\nDia 0 Dia 1 Dia 2\nA partir do terceiro Não deve ser entregue auxílio, pois o passageiro não passou\numa noite sem a bagagem.\nSe ​o passageiro solicitar, não residir na localidade e ​a bagagem ainda estiver\nextraviada, entregar USD 25/BRL 75.\nSe a bagagem ainda estiver extraviada entregar mais USD 25/BRL 75.\nDevem ser solicitadas as notas fiscais do período que ele ficou sem a bagagem e\nnegociar até a autonomia do PASSAGEIRO PREFERENCIAL\nDia 0 Dia 1 A partir do segundo dia Se o passageiro não residir na localidade, entregar\nproativamente USD 100 / BRL300.\nSe a bagagem ainda estiver extraviada, entregar mais USD100 / BRL 300.\nDevem ser solicitadas as notas fiscais do período que ele fcou sem a bagagem. Caso o valor\nultrapasse a autonomia do aeroporto, o agente deve encaminhar para análise do Contact Center através do\nFormulário de derivação\n* Passageiros preferenciais/preferentes: os que estão viajando na cabine Premium\nBusiness, Premium Economy, Black Signature, Black e Platinum\"\n\"ENTREGA DE BAGAGEM\nAs bagagens devem ser entregues diariamente, utilizando os meios de transporte mais\nbaratos. O agente do Serviço de Bagagem deve seguir os passos abaixo:\n● Quando necessário, entrar em contato com o passageiro para confrmar o\nendereço;\n● Colocar lacre na bagagem dos passageiros antes da entrega, mesmo que elas\n\npossuam cadeado. O número do lacre deve constar no recibo de entrega e no\nBaggage Delivery Order - Create Delivery Order - BDO (inserir campo\nSupplementary Information na máscara), para que possa ser confrontado com o\nlacre recebido pelo passageiro em caso de reclamações.\nEste procedimento visa evitar furtos durante o manuseio das prestadoras de\nentrega e é válido para todos os aeroportos com operação companhia aérea (dentro e fora\ndo Brasil).\n● No campo Supplementary Information também deve constar a informação se o\npassageiro é Standard ou Preferencial e o idioma do passageiro.\n● No Baggage Delivery Order - Create Delivery Order - BDO, no elemento Local\nDelivery Instructions destacar as informações de número da residência,\ncomplemento (se houver) e Bairro.\n● Preencher o Baggage Delivery Order - Create Delivery Order - BDO no sistema SITA\nWorldTracer Desktop obrigatoriamente para todas as entregas, inclusive as bagagens\nretiradas pelo passageiro no aeroporto. O relatório deve ser fechado assim que for\nfeito o Baggage Delivery Order - Create Delivery Order - BDO.\n● O recibo de entrega está disponível no site da Central de Bagagem.\n● Caso o recebedor se negue a assinar o mesmo, o prestador fará uma ressalva e a\nbagagem fcará em poder do passageiro.\nNos casos em que o passageiro residir em um aeroporto diferente do que abriu\no processo, a bagagem deve ser enviada para o aeroporto mais próximo da\nresidência e este irá fazer o Baggage Delivery Order - Create Delivery Order -BDO dentro do Property Irregularity Report - PIR original, somente adicionando\n\no prestador de entrega do seu aeroporto e solicitar assinatura do recibo de\nentrega.\nExemplo:\nDelayed Bag - AHL GRULA12345, porém passageiro reside em SCL O agente de\nGRU enviará a bagagem para SCL. A equipe de SCL efetuará a entrega,\ninserindo o Baggage Delivery Order - Create Delivery Order - BDO no Delayed\nBag - AHL GRULA12345 indicando no campo Create Delivery Order o entregador\nSCLLA01.\n● O aeroporto que efetuou a entrega (mesmo que o Property Irregularity Report - PIR\nseja de outro aeroporto ou que já esteja com a equipe de Busca Secundária) será\nresponsável pelo encerramento do relatório no sistema SITA WorldTracer Desktop,\nseguindo as instruções abaixo:\n● Entrar em contato com o passageiro para informar sobre a localização da bagagem e\nconfrmar o endereço de entrega.;\n● Registrar as informações no Extra Information; ● Inserir o Baggage Delivery Order - Create Delivery Order - BDO no sistema\n(obrigatório para todas as entregas);\n● Encerrar o relatório, inserindo custo de entrega (D/Delivery), Reason of Loss and Fault\nStation. O relatório deve ser fechado assim que for feito o Baggage Delivery Order -\nCreate Delivery Order - BDO.\"\n\"PRAZO PARA ENTREGA DE BAGAGEM LOCALIZADA\nTodas as bagagens localizadas deverão seguir o prazo para entrega ao passageiro após a\nchegada no aeroporto de destino.\nTIPO DE PASSAGEIRO ENTREGA DENTRO DA REGIÃO METROPOLITANA\nOU NA CIDADE ONDE O VOO POUSOU ENTREGA FORA DA REGIÃO METROPOLITANA OU FORA DA CIDADE ONDE O VOO POUSOU\nPassageiros Standard 24h 48h\nPassageiros Preferenciais 06h 12h"},{"title":"Entrega e encerramento","type":"Simulacao","duration":"26 min","content":"Se a bagagem chegar fora do horário de funcionamento do fornecedor, o Aeroporto deve\nprovidenciar a entrega no primeiro horário.\nPara passageiros preferenciais, a entrega pode ser realizada por táxi para que o prazo seja\ncumprido, caso o fornecedor não esteja disponível no momento da entrega.\nSistema SITA WorldTracer Desktop\nAssim que a bagagem chegar no Aeroporto de entrega, o agente deve suspender o caso\n(Suspended) no e inserir no Extra Information o voo e data em que a bagagem chegou.\nPara que os prazos de entrega sejam cumpridos, os agentes deverão acionar os seus\nfornecedores o mais rápido possível, através da opção “Create Delivery Order”, ou seja,\nprovidenciando a ordem de entrega da bagagem.\nRotina de entrega de bagagens\nOs aeroportos precisam ter uma rotina defnida junto aos seus fornecedores de entrega, de\nforma a atender os prazos estabelecidos. O ideal é que exista pelo menos dois períodos de\nretirada de bagagens diariamente (por exemplo: manhã e tarde). Baggage Delivery Order - Create Delivery Order - BDO e encerramento de\nProperty Irregularity Report - PIR\nQuando a bagagem de uma Delayed Bag - AHL estiver disponível em seu aeroporto,\ndevemos contatar o cliente para confrmar o endereço de entrega e confeccionar o Baggage\nDelivery Order (Baggage Delivery Order - Create Delivery Order - BDO).\""}]$json_bagagem_extraviada$::jsonb, $mat_bagagem_extraviada$Definição e registro

Bagagem extraviada
"DEFINIÇÃO
Bagagem despachada que não chegou no mesmo voo do passageiro, fcando caracterizado
o extravio. Delayed Bag - AHL (Advise If Hold) é uma sigla do sistema SITA WorldTracer
Desktop.
Os agentes do Serviço de Bagagem devem consultar previamente as m Bag - FWD recebidas por seu aeroporto, a fm de anunciar o nome de todos os passageiros
cujas bagagens fcaram na origem ou conexão, evitando que aguardem na esteira
desnecessariamente.
2.2. REGISTRO DE OCORRÊNCIA
Abertura de uma Delayed Bag - AHL em voos nacionais e internacionais acontece somente
no ato do desembarque do passageiro, ou seja, não são aceitas reclamações posteriores. O
registro da Delayed Bag - AHL deve ser de acordo com o nome que consta na etiqueta. Ou
seja, se tivermos 3 malas extraviadas de uma mesma família ou grupo, e as bagagens
despachadas estão em nome de cada passageiro, devem ser registrados 03 Property
Irregularity Report - PIR.
O Contact Center companhia aérea pode informar ao cliente o status do caso, editar ou inserir
informações.
Caso o passageiro necessite de alguma informação que não está disponível no sistema SITA
WorldTracer Desktop, o Contact Center envia um e-mail ao aeroporto com a dúvida em
questão. O aeroporto deve responder o e-mail em no máximo 48h, para que o Contact
Center possa responder prontamente ao passageiro.
O Agente do Serviço de Bagagem deverá seguir os passos abaixo: 1.3.0 POLÍTICA DE BAGAGEM
1.3.1. Legislação aplicada
Para registro é aplicada a Convenção de Montreal.
É aplicado a Resolução 400 ANAC.

1.3.2. Contrato de transporte de bagagem
As Normas do ‘Contrato de Transporte Aéreo’ estão disponíveis no site www.companhia aérea.com.
1.3.3. Atendimento no Desembarque
Na chegada de cada voo da companhia aérea, em qualquer aeroporto, deve haver um ou mais
(dependendo da necessidade) Agentes do Serviço de Bagagem recepcionando e orientando
os passageiros na área de restituição de bagagem:
● O Agente deve efetuar um anúncio (speech), informando o número da esteira em que
as bagagens serão disponibilizadas para cada voo;
● O Agente que estiver recepcionando os passageiros deve estar munido de formulário
Property Irregularity Report - PIR, cartão de identifcação de bagagem, (Chart);
● Deve também esclarecer, de forma educada e cortês, a Política Interna da companhia aérea
que é baseada em legislações nacionais e internacionais;
● Sempre que possível, avisar o passageiro sobre a falta da bagagem no momento do
seu desembarque. Para isso, faça um anúncio no saguão de desembarque
solicitando que o passageiro entre em contato com funcionário da companhia aérea.
Sugerimos o seguinte speech:
“Atenção, por favor, Sr. / Sra. [nome do passageiro] cliente companhia aérea do voo XXX vindo
de XXX, por favor entre em contato com nossa equipe neste saguão de
desembarque. Muito obrigado”;
● Dizer ao passageiro claramente o que será feito acerca do problema, não fazendo
promessas que não possam ser cumpridas;
● Explicar ao passageiro os prazos de busca ou tratativas para a resolução da
danifcação;
● Fornecer o contato do Contact Center e incentivar o passageiro a utilizar o rastreador

de bagagem, através do site da companhia aérea:
https://www.portal operacional da companhia
odifcar-informacao;
● Voos origem Brasil operados pela companhia aérea em aeronaves narrow body: Nos
casos em que o CRS (child restraint system) é usado, a equipe do Serviço de
Passageiros o entrega à equipe do Serviço de Bagagem, que é responsável por
devolvê-lo como ""RUSH"" à base que pertence no próximo voo disponível;
● As etiquetas RUSH manuais devem ser guardadas em local seguro, pois sua
utilização é permitida apenas para envio de bagagens desacompanhadas e somente
em caso de falhas no sistema que impeçam a emissão de etiquetas RUSH
automatizadas. Não é permitido fornecer estas etiquetas a quaisquer pessoas que
não realizem a função de Serviço de Bagagem (LL).
"
" EXTRAVIO – DELAYED BAG - AHL 2. EXTRAVIO – DELAYED BAG - AHL
DEFINIÇÃO
Bagagem despachada que não chegou no mesmo voo do passageiro, fcando caracterizado
o extravio. Delayed Bag - AHL (Advise If Hold) é uma sigla do sistema SITA WorldTracer
Desktop.
Os agentes do Serviço de Bagagem devem consultar previamente as mensagens Forward
Bag - FWD recebidas por seu aeroporto, a fm de anunciar o nome de todos os passageiros
cujas bagagens fcaram na origem ou conexão, evitando que aguardem na esteira
desnecessariamente.
REGISTRO DE OCORRÊNCIA
Abertura de uma Delayed Bag - AHL em voos nacionais e internacionais acontece somente
no ato do desembarque do passageiro, ou seja, não são aceitas reclamações posteriores. O
registro da Delayed Bag - AHL deve ser de acordo com o nome que consta na etiqueta. Ou

seja, se tivermos 3 malas extraviadas de uma mesma família ou grupo, e as bagagens
despachadas estão em nome de cada passageiro, devem ser registrados 03 Property
Irregularity Report - PIR.
O Contact Center companhia aérea pode informar ao cliente o status do caso, editar ou inserir
informações.
Caso o passageiro necessite de alguma informação que não está disponível no sistema SITA
WorldTracer Desktop, o Contact Center envia um e-mail ao aeroporto com a dúvida em
questão. O aeroporto deve responder o e-mail em no máximo 48h, para que o Contact
Center possa responder prontamente ao passageiro.
O Agente do Serviço de Bagagem deverá seguir os passos abaixo: Inserção de documento: todos os aeroportos companhia aérea deverão inserir no campo
Passport Details - PP do sistema SITA WorldTracer Desktop a sigla + número do
documento do passageiro.
TIPO EXEMPLO

Passport Details - PP CPF 12345678910 ou Passport Details - PP CPF 12345678910 ouort Details - PP RG 123456789
Documento de i- PP RG 123456789 ou Documento de identidade ou DNI
( todas as nacionalidades);
Passport Details - PP DI 123456
Passaporte
(todas as nacionalidades).
Passport Details - PP PSPT FF123456
Atendimento inicial do passageiro no desembarque
Quando a bagagem do cliente for extraviada e já houver FWD (mensagem de envio) no
sistema Worldtracer Desktop, devemos pesquisar informações da bagagem no sistema
Sabre e/ou no SmartSuite. Na sequência devemos procurar e anunciar o cliente no
desembarque e providenciarmos o registro do seu relatório o mais rápido possível, visando
minimizar os impactos causados.
COLABORADOR: [Bom dia/boa tarde/boa noite], sr(a) [NOME DO CLIENTE]. Meu nome é
[NOME DO COLABORADOR] e gostaria de informar que infelizmente a sua mala não chegou
neste voo. Lamentamos o ocorrido e recebemos a informação de que a sua mala tem
previsão para chegar neste aeroporto no voo [XXXX], por volta de [YY] horas. Precisarei
coletar alguns dados para providenciar a entrega da sua bagagem.
Ouça atentamente o que o cliente tem a dizer. Questione o cliente se além da abertura do
registro, se tem mais algo que possa fazer para ajudá-lo.
Após coletar todos os dados necessários e registrar o PIR no sistema, verifcar se o cliente
possui fdelidade Black Signature, Black, Platinum ou viajou na cabine Premium Business ou
Premium Economy, pois neste caso devemos oferecer auxílio emergencial de forma proativa.

---

Atendimento no desembarque

COLABORADOR: Sr(a) [NOME DO CLIENTE], assim que a sua mala chegar neste aeroporto,
a companhia aérea entrará em contato por telefone, no número informado. Alinharemos com a
transportadora que nos atende para que sua bagagem seja entregue o mais rápido possível.
Vou pedir por gentileza, que fque atento(a) ao telefone, para que possamos atualizá-lo(a) de
qualquer novidade ou mudança. O(a) senhor(a) gostaria de fornecer mais telefones de
contato?
Gostaríamos de pedir as mais sinceras desculpas e com o objetivo de melhorar nossos
serviços, informo que será enviada para o e-mail informado uma pesquisa para avaliar nosso
atendimento. Confrmação de endereço, avaliação de experiência e verifcação de entrega da
bagagem
Após a chegada da bagagem no seu aeroporto, antes de realizar o contato com o cliente,
devemos verifcar a disponibilidade com a transportadora e considerar a logística do Serviço
de Bagagem, a fm de garantir que a informação da previsão de entrega da bagagem possa
ser fornecida ao cliente durante o atendimento.
COLABORADOR: [Bom dia/Boa tarde/Boa noite!] Meu nome é [NOME DO
COLABORADOR] e represento o setor de bagagens do aeroporto [INFORMAR QUAL
AEROPORTO REPRESENTA]. Eu gostaria de falar com o(a) [NOME DO CLIENTE] sobre a
sua bagagem.
Novamente, peço desculpas em nome da companhia aérea por qualquer inconveniente causado.
Informo que sua bagagem já se encontra disponível no aeroporto [nome do o aeroporto que
está realizando a entrega]. Gostaríamos de confrmar seu endereço para coordenar a
entrega de sua bagagem.
Após o passageiro confrmar o endereço:

COLABORADOR: Verifquei com a transportadora e é possível realizar a entrega de sua
mala entre [INFORMAR A JANELA DE HORÁRIO]. O senhor(a) estará no endereço este
horário ou haverá alguém que possa receber a bagagem no seu lugar? Posso agendar com
a transportadora?
O agente deve assegurar de informar ao passageiro o horário de atendimento da prestadora
de serviços de entrega de seu aeroporto, a fm de fornecer um atendimento assertivo e com
informações seguras:
COLABORADOR: Com o objetivo de melhorar nossos serviços, informo que a/o [Sr/Sra]
receberá uma pesquisa para avaliar sua experiência com o processo de sua bagagem.
Agradecemos o seu tempo.
Algumas horas após a transportadora coletar a bagagem do cliente, será necessário
confrmar, via e-mail, se o passageiro recebeu a bagagem sem danos e/ou violações e que a
pesquisa de avaliação chegará em algumas horas. Para isso, utilize o modelo de mensagem
abaixo, alterando os campos [PIR DO PASSAGEIRO] e [NOME] para os dados reais do
passageiro:"
" PROCESSO DE BUSCA POR EXCEÇÃO
A busca de Delayed Bag - AHL por exceção ocorre somente por 5 dias. No 5º dia, o agente
deve entrar em contato com o passageiro e encerrar a Delayed Bag - AHL no sistema,
inserindo todas as informações no Extra Information.
Quando se registra um processo busca por exceção o agente deve entregar uma cópia do
processo ao cliente e completar na máscara do Delayed Bag - AHL o elemento Message
Options de acordo com a solicitação do cliente.
Serão considerados casos de busca por exceção as seguintes situações:

Passageiros que não possuam etiqueta de bagagem e não possuam registro de
despacho de bagagem no sistema de check-in.
Caso o passageiro não possua o comprovante de despacho, mas conste
informação no sistema, o agente de bagagem deve registrar o Delayed Bag - AHL
normalmente e anexar o registro de check-in.
Passageiros que não fzeram alfândega no primeiro ponto alfandegário;
Passageiros que reclamam posteriormente, mesmo com comprovante de bagagem;
Passageiros com bilhetes separados;
Passageiros que tiveram malas retidas na origem e ou conexão devido ter conteúdo
não permitido para embarque, as quais são aquelas mercadorias perigosas, podendo
variar em cada país, como por exemplo: Power bank, aerossóis, baterias, cigarros
eletrônicos, entre outros.
Exemplo: O passageiro realiza o trecho LIS/GIG com a TAP e GIG/SCL com a
companhia aérea em bilhetes separados. Se o passageiro não retirar a bagagem em GIG,
deve-se abrir um Delayed Bag - AHL busca por exceção em SCL uma vez que a
bagagem não estará registrada no sistema companhia aérea. Neste caso, deve ser
considerado Reason for Loss - RL79 Fault Station - FS SCL.
Quando a bagagem for retida pela Alfândega por responsabilidade do passageiro, e
deverá retirar a bagagem no aeroporto do destino. Nestes casos, deve-se conside
o Reason for Loss - RL73 e o Fault Station - FS o aeroporto em que a bagage
deveria ter sido retirada para fazer a alfândega.
O agente deve inserir as informações no sistema SITA Worldtracer Desktop e, se
no 5º dia a bagagem não for localizada, o processo deve ser encerrado sem
indenização.

Se a bagagem é localizada e foi comprovada a responsabilidade da companhia aérea, deve-se realizar
a entrega normalmente na residência do passageiro e, caso solicitado pelo passageiro,
entregar o valor do auxílio emergencial.
Operação companhia aérea, exceto Brasil: em caso de reporte de bagagem extraviada fora do
desembarque, a equipe do Contact Center não redireciona mais o passageiro para registrar o
Property Irregularity Report - PIR no aeroporto. Neste caso, o Contact Center irá solicitar ao
passageiro a documentação necessária para registro do Property Irregularity Report - PIR e,
assim que recebidos, os dados serão encaminhados para o aeroporto de destino do cliente."
"Com estas informações, o agente de bagagem deve registrar o Property Irregularity Report -
PIR no sistema SITA WorldTracer Desktop como busca por exceção e realizar as buscas por
5 dias. Se a bagagem não for localizada o caso deve ser encerrado no sistema, conforme
procedimento de busca por exceção.
Considerando que os relatórios criados como “busca por exceção” não são culpa
da companhia aérea, estes não devem gerar custos. Ou seja, não devemos
emitir compensação para auxílio emergencial, não realizamos a entrega da
bagagem através de transportadora, não indenizamos o cliente em caso de
extravio defnitivo, etc.
Não há prazo para abertura do PIR de busca por exceção, apenas para
encerramento (5º dia).
Caso o cliente de um PIR de AHL - busca por exceção, tenha sua mala danifcada
e/ou violada, devemos abrir o PIR de DPR para o cliente e oferecer as
compensações normalmente.

---

Documentos e dados obrigatorios

Documentos e dados obrigatórios

Esta trilha trata da conferência dos dados essenciais para abertura e manutenção de uma AHL/PIR. O agente deve validar documento do passageiro, telefone, e-mail, endereço, etiqueta TN, rota RT, voo/data FD, nome NM, iniciais IT, cor/tipo CT, marca BI, peso BW, Reason for Loss RL, Fault Station FS e observações em FF.

Endereço e contato são críticos porque orientam entrega, comunicação e registro de tentativas. Quando houver divergência entre passageiro, etiqueta e reserva, registre a evidência no histórico antes de seguir com a tratativa.

Material de apoio da trilha

Orientações para fechamento de PIRs BUSCA POR EXCEÇÃO
Quando a mala for localizada: 2) Quando a mala NÃO for localizada:
Assim que o cliente fzer a retirada no aeroporto, faça o BDO/Baggage Delivery
Order/Create Delivery Order com o DS/Delivery Service destinado a “retirada no
aeroporto”;
Adicione o custo “D/Delivery” com valor “0” (zero);
Encerre o PIR.
Encerre o PIR dentro do prazo de 05 Adicione o custo “D/Delivery” com valor “0” (zero);
No momento do fechamento, no campo SI/Supplementary Information, insira a
informação “NOT LOC”."
"TIPOS DE EXTRAVIO
Perecíveis
O agente do Serviço de Bagagem deve encerrar o processo imediatamente após a
localização da bagagem, utilizando Reason for Loss - RLe Fault Station - FS correspondentes
ao motivo do extravio e inserindo as informações no Extra Information.
Quando um item perecível for localizado deteriorado, a indenização deverá ser feita
diretamente pelo aeroporto utilizando o Agente 360 ou Travel Voucher e de acordo com o
limite de sua autonomia. Caso o item não tenha sido localizado dentro nos primeiros 5 dias,
passarão automaticamente para a equipe de busca secundária e, posteriormente, para
indenização (Contact Center ou CUS).
A indenização só se aplicará para perecíveis despachados dentro de caixa térmica ou isopor,
mesmo que o verso da etiqueta esteja assinado.
Bagagens retidas na Alfândega
Para as bagagens localizadas na alfândega, o processo deve ser encerrado após a sua
localização, inserindo Reason for Loss - RL e Fault Station - FS correspondentes ao extravio

e inserindo as informações no Extra Information. Porém, o agente deve auxiliar o passageiro
quanto à liberação da bagagem até a resolução do processo.
Caso seja necessária autorização do bilhete RIP para liberar a bagagem na
alfândega, o aeroporto deve enviar um e-mail para CUS,
grp_equipaje_cus@sac.companhia aérea.com e para o Contact Center (BR) através do
Formulário de Derivação. Não será autorizado Property Irregularity Report - PIR
para passageiros com processo busca por exceção, ou seja, para passageiros que
não fzeram alfândega.
Bagagens retidas na origem/conexão por conteúdo não permitido (Mercadorias
Perigosas)
A tratativa para os casos em que as malas fcam retidas na origem ou conexão, por conteúdo
não permitido, deverão seguir os seguintes passos:
● Property Irregularity Report - PIR será aberto normalmente e as buscas, serão
executadas pelo aeroporto;
● Casos confrmados de malas retidas por conteúdo não permitido para embarque, ou
devido a negação de retirada do item vetado pelo cliente, nas origem e/ou conexões,
serão tratados como busca por exceção;
● Os agentes deverão acompanhar e auxiliar o cliente para recuperar a mala,
solicitando via sistema ou e-mail (caso fque retida com a administradora do
aeroporto);
● Quando a mala chegar ao destino, a base deverá solicitar ao cliente para retirar a
bagagem no aeroporto e encerrar o caso com Reason for Loss - RL79 e o Fault
Station - FS pertencerá à base que criou o Property Irregularity Report - PIR;
● Os casos criados como busca por exceção devem seguir o procedimento e ser

encerrado em 5 dias corridos a contar da data de abertura do processo no sistema."
"Armas de Fogo
Todos os aeroportos devem verifcar obrigatoriamente o porão de todas as aeronaves,
mesmo que não haja mensagem de despacho ou SSR para armas de fogo ou esportes.
Em caso de extravio:
● Voos domésticos no Brasil e voos de / para o Brasil. Se a arma e/ou as munições
não forem restituídas ao passageiro no prazo de 01 hora a contar da hora do pouso
da aeronave, deve ser registrado o processo de extravio no sistema SITA WorldTracer
Desktop.
● O aeroporto de destino deve inserir no sistema SITA WorldTracer Desktop,
descriminar o tipo de objeto retido no campo Contents - CC do processo e inserir
imediatamente o Reason for Loss - RL75 (Arma de Fogo);
● O número a ser inserido no campo Tag Number - TN, é o número do Protocolo
(canhoto do envelope);
● O passageiro deve obrigatoriamente abrir um BO (Boletim de Ocorrência). Este
procedimento deve ser informado ao passageiro no ato da abertura do Property
Irregularity Report - PIR.
Voos domésticos no Brasil e voos de / para o Brasil, o extravio deverá ser comunicado via
e-mail. Segue abaixo o padrão do e-mail a ser enviado:
Para: Polícia Federal destino; Administrador Aeroportuário origem; Administrador
Aeroportuário destino; Segurança Corporativa
companhia aérea(exchange_msg_dis_securitysaoqf@companhia-aerea.com).
Assunto: Extravio de arma de fogo e/ou munições – Voo XXX-Data XXX
Nome do passageiro:
Data:
Voo:
Rota:
Hora do pouso:
Base que registrou o extravio:
Número do processo:
Descrição do objeto:
Número da etiqueta o (n°do envelope):

Prefxo da aeronave:
Relato do extravio: Na ausência da Polícia Federal no aeroporto de origem ou destino, o extravio deverá ser
comunicado ao órgão de segurança pública substituto. Além de notifcar a Central de
Bagagens e a Central de Aeroportos.
Todos os aeroportos (exceto domésticos BR) Aeroportos domésticos Brasil
ccpoperacional@companhia aérea.com
grp_centralbaggagecompanhiaaerea@companhia aérea.com
De segunda a sexta feira:
grp_centralbaggagecompanhiaaerea@companhia aérea.com
Finais de semana:
Localização de arma de fogo:
Voos domésticos no Brasil e voos de / para o Brasil:
Ao localizar a arma e/ou munições o Serviço de Bagagem deverá comunicar imediatamente
através de e-mail a Polícia Federal, os Administradores dos aeroportos de origem, conexão e
destino e a equipe de Segurança Corporativa companhia aérea.
Ao enviar um objeto retido desacompanhado, o aeroporto deve enviar mensagem Forward
Bag - FWD e um e-mail para os aeroportos envolvidos informando o nome e telefone do
passageiro, rota do voo, número do voo, tipo do objeto e local em que o objeto está
seguindo.
De acordo com a orientação do departamento Jurídico, é proibida a entrega de arma de
fogo. Neste caso o passageiro deve retirar o objeto no próprio aeroporto.
Indenização de arma de fogo:
O agente deve encaminhar o orçamento para compra da arma de fogo, para análise do
Contact Center de acordo com o idioma de preferência do passageiro.
Nos casos em que a arma extraviada pertencer a algum Órgão do Governo e/ou União, será
exigido um orçamento fornecido pela Autoridade Policial responsável.

---

Busca por excecao e casos especiais

Busca por exceção e casos especiais

Busca por exceção ocorre quando a análise foge do fluxo normal de extravio: passageiro sem comprovante, bilhetes separados, reclamação posterior, bagagem retida em alfândega, conteúdo não permitido, conexão fora do fluxo ou situação em que a responsabilidade operacional precisa ser avaliada com cautela.

Em casos de alfândega, o agente deve identificar onde o passageiro deveria retirar a bagagem, registrar o motivo no histórico e orientar o passageiro sem prometer indenização automática. A tratativa deve ser documentada com RL e FS compatíveis.

Material de apoio da trilha

O aeroporto irá analisar e reembolsar os gastos de locomoção do passageiro mediante
apresentação de nota fiscal."
" AUXÍLIO EMERGENCIAL
Para que o auxílio emergencial seja fornecido ao passageiro, deve-se respeitar as seguintes
regras:
● O passageiro solicitar;
● O passageiro não residir na localidade;
● O passageiro fcar uma noite sem bagagem.
Para os passageiros que estiverem viajando em família ou em grupos e que
tiverem suas bagagens extraviadas, o auxílio deve ser entregue de acordo com a
quantidade dos passageiros afetados.
Exemplo 1: em uma família de 4 pessoas com 4 bagagens despachadas, o
check-in despacha todas as bagagens apenas no nome de uma pessoa (Pai) e
duas bagagens foram extraviadas. Deve ser registrado apenas 01 Property
Irregularity Report - PIR de acordo com o nome que consta na etiqueta, porém
duas pessoas foram afetadas (Pai e a Mãe) com o extravio. Nesse caso, os dois
podem receber o valor do auxílio.
Exemplo 2: em um grupo de 10 pessoas viajando juntas, caso tenham 3 malas
extraviadas, porém as bagagens despachadas em nome de cada passageiro.
Devem ser registrados 03 Property Irregularity Report - PIR e entregue o valor do
auxílio para cada passageiro afetado com o extravio. Se o check-in despachar
todas as bagagens apenas no nome de uma pessoa deve ser registrado apenas
01 Property Irregularity Report - PIR, porém deve ser entregue o valor do auxílio
para os passageiros que foram afetados com o extravio.
Exemplo 3: em um extravio de 01 bagagem, 02 passageiros foram prejudicados,

neste caso os 02 clientes terão direito ao auxílio emergencial. Nesta situação,
deverão ser emitidas duas compensações de auxílio emergencial, sendo uma em
nome do primeiro passageiro e a outra em nome do segundo passageiro.
O formulário de auxílio emergencial deve ser preenchido, entregando uma cópia ao
passageiro e anexando uma cópia  junto ao Property Irregularity Report - PIR.
O valor autorizado ao passageiro deve ser informado no campo ""Extra Information"" do
processo e inserido no campo ""Settlement Cost/Type - CS"" - código ""A"" (sistema SITA
WorldTracer Desktop).
A responsabilidade de inserir o custo ""A"" no processo é do aeroporto que autorizou o auxílio
emergencial ao passageiro.
O passageiro pode solicitar o reembolso dos gastos durante o tempo que fcou sem sua
bagagem dentro de 21 dias após a entrega da bagagem. Para rota doméstica Argentina o
prazo é de 10 dias. Tabela de Política de compensação

Aeroportos Brasil
BAGAGEM ENTREGUE PASSAGEIRO STANDARD PASSAGEIRO PREFERENCIAL
Dia 0 Não se aplica R$300
Dia 1 R$75 R$300
Dia 2 R$75 Apresentação de nota fiscal
Dias 3 a 4 Apresentação de nota fscal Apresentação de nota fiscal
PASSAGEIRO STANDARD
Dia 0 Dia 1 Dia 2
A partir do terceiro Não deve ser entregue auxílio, pois o passageiro não passou
uma noite sem a bagagem.
Se ​o passageiro solicitar, não residir na localidade e ​a bagagem ainda estiver
extraviada, entregar USD 25/BRL 75.
Se a bagagem ainda estiver extraviada entregar mais USD 25/BRL 75.
Devem ser solicitadas as notas fiscais do período que ele ficou sem a bagagem e
negociar até a autonomia do PASSAGEIRO PREFERENCIAL
Dia 0 Dia 1 A partir do segundo dia Se o passageiro não residir na localidade, entregar
proativamente USD 100 / BRL300.
Se a bagagem ainda estiver extraviada, entregar mais USD100 / BRL 300.
Devem ser solicitadas as notas fiscais do período que ele fcou sem a bagagem. Caso o valor
ultrapasse a autonomia do aeroporto, o agente deve encaminhar para análise do Contact Center através do
Formulário de derivação
* Passageiros preferenciais/preferentes: os que estão viajando na cabine Premium
Business, Premium Economy, Black Signature, Black e Platinum"
"ENTREGA DE BAGAGEM
As bagagens devem ser entregues diariamente, utilizando os meios de transporte mais
baratos. O agente do Serviço de Bagagem deve seguir os passos abaixo:
● Quando necessário, entrar em contato com o passageiro para confrmar o
endereço;
● Colocar lacre na bagagem dos passageiros antes da entrega, mesmo que elas

possuam cadeado. O número do lacre deve constar no recibo de entrega e no
Baggage Delivery Order - Create Delivery Order - BDO (inserir campo
Supplementary Information na máscara), para que possa ser confrontado com o
lacre recebido pelo passageiro em caso de reclamações.
Este procedimento visa evitar furtos durante o manuseio das prestadoras de
entrega e é válido para todos os aeroportos com operação companhia aérea (dentro e fora
do Brasil).
● No campo Supplementary Information também deve constar a informação se o
passageiro é Standard ou Preferencial e o idioma do passageiro.
● No Baggage Delivery Order - Create Delivery Order - BDO, no elemento Local
Delivery Instructions destacar as informações de número da residência,
complemento (se houver) e Bairro.
● Preencher o Baggage Delivery Order - Create Delivery Order - BDO no sistema SITA
WorldTracer Desktop obrigatoriamente para todas as entregas, inclusive as bagagens
retiradas pelo passageiro no aeroporto. O relatório deve ser fechado assim que for
feito o Baggage Delivery Order - Create Delivery Order - BDO.
● O recibo de entrega está disponível no site da Central de Bagagem.
● Caso o recebedor se negue a assinar o mesmo, o prestador fará uma ressalva e a
bagagem fcará em poder do passageiro.
Nos casos em que o passageiro residir em um aeroporto diferente do que abriu
o processo, a bagagem deve ser enviada para o aeroporto mais próximo da
residência e este irá fazer o Baggage Delivery Order - Create Delivery Order -BDO dentro do Property Irregularity Report - PIR original, somente adicionando

o prestador de entrega do seu aeroporto e solicitar assinatura do recibo de
entrega.
Exemplo:
Delayed Bag - AHL GRULA12345, porém passageiro reside em SCL O agente de
GRU enviará a bagagem para SCL. A equipe de SCL efetuará a entrega,
inserindo o Baggage Delivery Order - Create Delivery Order - BDO no Delayed
Bag - AHL GRULA12345 indicando no campo Create Delivery Order o entregador
SCLLA01.
● O aeroporto que efetuou a entrega (mesmo que o Property Irregularity Report - PIR
seja de outro aeroporto ou que já esteja com a equipe de Busca Secundária) será
responsável pelo encerramento do relatório no sistema SITA WorldTracer Desktop,
seguindo as instruções abaixo:
● Entrar em contato com o passageiro para informar sobre a localização da bagagem e
confrmar o endereço de entrega.;
● Registrar as informações no Extra Information; ● Inserir o Baggage Delivery Order - Create Delivery Order - BDO no sistema
(obrigatório para todas as entregas);
● Encerrar o relatório, inserindo custo de entrega (D/Delivery), Reason of Loss and Fault
Station. O relatório deve ser fechado assim que for feito o Baggage Delivery Order -
Create Delivery Order - BDO."
"PRAZO PARA ENTREGA DE BAGAGEM LOCALIZADA
Todas as bagagens localizadas deverão seguir o prazo para entrega ao passageiro após a
chegada no aeroporto de destino.
TIPO DE PASSAGEIRO ENTREGA DENTRO DA REGIÃO METROPOLITANA
OU NA CIDADE ONDE O VOO POUSOU ENTREGA FORA DA REGIÃO METROPOLITANA OU FORA DA CIDADE ONDE O VOO POUSOU
Passageiros Standard 24h 48h
Passageiros Preferenciais 06h 12h

---

Entrega e encerramento

Se a bagagem chegar fora do horário de funcionamento do fornecedor, o Aeroporto deve
providenciar a entrega no primeiro horário.
Para passageiros preferenciais, a entrega pode ser realizada por táxi para que o prazo seja
cumprido, caso o fornecedor não esteja disponível no momento da entrega.
Sistema SITA WorldTracer Desktop
Assim que a bagagem chegar no Aeroporto de entrega, o agente deve suspender o caso
(Suspended) no e inserir no Extra Information o voo e data em que a bagagem chegou.
Para que os prazos de entrega sejam cumpridos, os agentes deverão acionar os seus
fornecedores o mais rápido possível, através da opção “Create Delivery Order”, ou seja,
providenciando a ordem de entrega da bagagem.
Rotina de entrega de bagagens
Os aeroportos precisam ter uma rotina defnida junto aos seus fornecedores de entrega, de
forma a atender os prazos estabelecidos. O ideal é que exista pelo menos dois períodos de
retirada de bagagens diariamente (por exemplo: manhã e tarde). Baggage Delivery Order - Create Delivery Order - BDO e encerramento de
Property Irregularity Report - PIR
Quando a bagagem de uma Delayed Bag - AHL estiver disponível em seu aeroporto,
devemos contatar o cliente para confrmar o endereço de entrega e confeccionar o Baggage
Delivery Order (Baggage Delivery Order - Create Delivery Order - BDO)."$mat_bagagem_extraviada$),
('objetos-esquecidos', $json_objetos_esquecidos$[{"title":"Definição e responsabilidade","type":"Aula","duration":"16 min","content":"Definição e responsabilidade\n\nObjetos esquecidos abordo\n\"OBJETOS ESQUECIDOS\nDEFINIÇÃO\nObjetos pessoais dos passageiros encontrados em nossas aeronaves ou nas instalações da\nCompanhia. No Aeroporto, também é considerado válido o setor de balcão companhia aérea.\nEstes objetos serão registrados e armazenados pelo Serviço de Bagagem com objetivo de\ngerenciar a entrega aos seus proprietários.\nOs objetos esquecidos devem ser encaminhados para o depósito de bagagens em São Paulo\nComo registrar objetos esquecidos no WorldTracer Desktop\n1. Lost and Found Property > Create\n2. Os campos mandatórios são: Category (categoria), Date Found (data que foi\nlocalizado o objeto), porém devemos preencher outros campos:\n● Detailed Description - detalhar o objeto encontrado preferencialmente em\ninglês.\n● Supplementary Information - dados do local e a data onde o item foi\nencontrado, preferencialmente em inglês.\n● Storage Location - informar em qual local do aeroporto o item está armazenada.\n3. O sistema permite inserir até 10 itens de uma única vez.\n4. Ao terminar, o sistema nos retornará uma máscara já com os números de\n\nObjetos esquecidos são itens pessoais encontrados em aeronaves, balcões, áreas de atendimento ou dependências sob responsabilidade operacional. O objetivo do registro é garantir rastreabilidade, guarda correta, identificação do proprietário e devolução segura.\n\nResponsabilidades do agente\n\n- Receber o item e preservar suas características.\n- Registrar a ocorrência no sistema apropriado.\n- Evitar exposição desnecessária de valores, documentos ou dados pessoais.\n- Armazenar o objeto conforme orientação local.\n- Orientar o passageiro com informação objetiva, sem prometer localização antes da confirmação."},{"title":"Cadastro no WorldTracer","type":"Pratica guiada","duration":"22 min","content":"Cadastro no WorldTracer RFP\n\nWorldTracer Desktop\n1. Lost and Found Property > Create\n2. Os campos mandatórios são: Category (categoria), Date Found (data que foi\nlocalizado o objeto), porém devemos preencher outros campos:\n● Detailed Description - detalhar o objeto encontrado preferencialmente em\ninglês.\n● Supplementary Information - dados do local e a data onde o item foi\nencontrado, preferencialmente em inglês.\n● Storage Location - informar em qual local do aeroporto o item está armazenada.\n3. O sistema permite inserir até 10 itens de uma única vez.\n4. Ao terminar, o sistema nos retornará uma máscara já com os números de registros\nalocados para cada objeto em ID.\n\"\n\"REGRAS\nO agente do Serviço de Bagagem terá o prazo máximo de 12 horas a partir do horário de\nchegada do voo, para receber o objeto das equipes de Serviço ao Passageiro e inserir as\ninformações no sistema SITA WorldTracer Desktop.\nA entrega destes artigos ao pessoal companhia aérea de Aeroporto (Serviço ao Passageiro, Security ou Rampa) deve sempre cumprir com os regulamentos\nlocais, em relação, a quem está autorizado a receber estes objetos.\nCaso o passageiro informe que um objeto de sua propriedade fcou travado no assento da\naeronave, o agente de Serviço ao Passageiro deverá solicitar apoio para o pessoal de\nManutenção local.\nResponsabilidades de Serviço de Bagagem\n● Deve gerenciar como \"\"Objeto Localizado\"\" e ingressar o caso no sistema SITA\nWorldTracer Desktop;\n● Os objetos devem ser ingressados no sistema SITA WorldTracer Desktop através da\ntransação Lost and Found Property - RFP;\n● A cópia impressa do relatório ingressado no sistema SITA WorldTracer Desktop é o\nrecibo formal do objeto;\n● Os objetos esquecidos permanecem com Serviço de Bagagem por 30 dias. Se não\nforem retirados neste período, devem ser encaminhados para o depósito de\nbagagem em São Paulo.\n● Sempre que o passageiro for retirar seu objeto esquecido no aeroporto ele deve\napresentar a cópia do cartão de embarque ou o comprovante de compra da\npassagem. Caso, ele não tenha o documento, o agente deve consultar no sistema se\no passageiro voou na data em que o objeto foi localizado.\n● Após a confrmação, o agente pode entregar o objeto e o passageiro deve assinar o\nrecibo de entrega do objeto esquecido.\nDocumentos\n● Todos os documentos pessoais válidos para viagens ou não, esquecidos pelos\nnossos Passageiros em dependências companhia aérea, devem ser encaminhados para o\nsetor LL da localidade.\n● O agente do Serviço de Bagagem deve registrar os documentos esquecidos no\nsistema SITA WorldTracer Desktop de acordo com as descrições acima.\n● Os documentos sem reclamação em 30 dias devem ser encaminhados para o\ndepósito de bagagem em São Paulo.\"\n\"\n\nA transação utilizada para registrar objetos esquecidos é Lost and Found Property - RFP. O cadastro deve conter categoria e data em que o objeto foi encontrado. A descrição detalhada deve ser preferencialmente em inglês, com características que permitam diferenciar o item de outros semelhantes.\n\nCampos importantes\n\nCategory: categoria do objeto encontrado.\nDate Found: data em que o objeto foi localizado.\nDetailed Description: descrição completa, preferencialmente em inglês.\nStorage/Local: local onde o objeto ficará guardado.\nFlight/Date: voo e data, quando o item for localizado a bordo.\nPassenger contact: contatos do passageiro quando houver reclamação associada.\n\nBoas práticas de descrição\n\nEvite registrar apenas “phone”, “bag”, “book” ou “documents”. Prefira descrição objetiva: marca, cor, modelo, detalhe visual, embalagem, número parcial quando permitido e local de localização."},{"title":"Prazo, guarda e descarte","type":"Procedimento","duration":"18 min","content":"Prazo, armazenamento, guarda e descarte\n\nA trilha trata do armazenamento seguro do objeto esquecido, do prazo de guarda, da identificação física do item e da decisão correta entre devolução, envio, descarte orientado ou depósito. O controle evita perda de rastreabilidade e protege o agente, o passageiro e a companhia.\n\nPrazo, guarda e descarte\n\n12 horas a partir do horário de\nchegada do voo, para receber o objeto das equipes de Serviço ao Passageiro e inserir as\ninformações no sistema SITA WorldTracer Desktop.\nA entrega destes artigos ao pessoal companhia aérea de Aeroporto (Serviço ao Passageiro, Security ou Rampa) deve sempre cumprir com os regulamentos\nlocais, em relação, a quem está autorizado a receber estes objetos.\nCaso o passageiro informe que um objeto de sua propriedade fcou travado no assento da\naeronave, o agente de Serviço ao Passageiro deverá solicitar apoio para o pessoal de\nManutenção local.\nResponsabilidades de Serviço de Bagagem\n● Deve gerenciar como \"\"Objeto Localizado\"\" e ingressar o caso no sistema SITA\nWorldTracer Desktop;\n● Os objetos devem ser ingressados no sistema SITA WorldTracer Desktop através da\ntransação Lost and Found Property - RFP;\n● A cópia impressa do relatório ingressado no sistema SITA WorldTracer Desktop é o\nrecibo formal do objeto;\n● Os objetos esquecidos permanecem com Serviço de Bagagem por 30 dias. Se não\nforem retirados neste período, devem ser encaminhados para o depósito de\nbagagem em São Paulo.\n● Sempre que o passageiro for retirar seu objeto esquecido no aeroporto ele deve\napresentar a cópia do cartão de embarque ou o comprovante de compra da\npassagem. Caso, ele não tenha o documento, o agente deve consultar no sistema se\no passageiro voou na data em que o objeto foi localizado.\n● Após a confrmação, o agente pode entregar o objeto e o passageiro deve assinar o\nrecibo de entrega do objeto esquecido.\nDocumentos\n● Todos os documentos pessoais válidos para viagens ou não, esquecidos pelos\nnossos Passageiros em dependências companhia aérea, devem ser encaminhados para o\nsetor LL da localidade.\n● O agente do Serviço de Bagagem deve registrar os documentos esquecidos no\nsistema SITA WorldTracer Desktop de acordo com as descrições acima.\n● Os documentos sem reclamação em 30 dias devem ser encaminhados para o\ndepósito de bagagem em São Paulo.\"\n\" Dinheiro(Valores)\n● O Serviço de Bagagem deve registrar o dinheiro no sistema SITA WorldTracer\nDesktop como Lost and Found Property - RFP e enviar um e-mail ao Gerente do\nAeroporto informando o valor do dinheiro encontrado.\n● Por segurança, em SITA WorldTracer Desktop, deve ser registrado a informação\n\"\"Valores\"\", sem especifcar a quantia. O e-mail encaminhado ao Gerente e o número\ndo Lost and Found Property - RFP deverão ser anexados aos objetos esquecidos.\n● Nos casos de valores encontrados em bagagens sob On-Hand Bag - OHD, estes\ndeverão seguir o procedimento padrão de envio de On-Hand Bag - OHD ao depósito\nde bagagem em São Paulo.\n\nO registro deve ocorrer dentro do prazo operacional definido, garantindo que o item seja rastreável no sistema. Objetos não retirados dentro do prazo devem seguir para o depósito definido pela operação, respeitando exceções locais e itens que não podem ser encaminhados.\n\nItens sensíveis\n\nDocumentos: devem seguir o fluxo específico definido pela base.\nDinheiro/valores: registrar de forma segura, evitando exposição desnecessária do montante quando a regra assim determinar.\nPowerbanks e itens com bateria: seguir orientação local de descarte ou restrição, pois podem não ser aceitos para envio.\nPerecíveis: avaliar descarte conforme condição, risco sanitário e regra local.\n\nComunicação com passageiro\n\nSe o objeto ainda não chegou ao Serviço de Bagagem, o passageiro não deve receber confirmação de disponibilidade. O correto é informar que as buscas estão em andamento e coletar contatos para retorno."},{"title":"Transporte entre aeroportos","type":"Procedimento","duration":"20 min","content":"Transporte entre aeroportos\n\nAo enviar um item para outra base:\n\nArquivar a folha com:\n\n●Informações do voo\n\n●Número da RUSH\n\n●Realizar o amend no sistema WorldTracer\"\n\nO transporte de objeto esquecido entre aeroportos deve ser feito com controle e rastreabilidade. O objeto não deve ser entregue informalmente à tripulação nem seguir sem identificação.\n\nProcedimento recomendado\n\n1. Confirmar que o objeto corresponde à reclamação do passageiro.\n2. Embalar em caixa ou envelope lacrado, conforme natureza do item.\n3. Emitir etiqueta Rush quando aplicável.\n4. Registrar no campo AI02 ou equivalente o voo, a data e o número da etiqueta Rush.\n5. Informar a base de destino sobre o envio.\n6. Atualizar o histórico do RFP com a mensagem de encaminhamento.\n\nPonto de atenção\n\nO envio deve permitir auditoria posterior. Quem enviou, quando enviou, em qual voo, com qual lacre/etiqueta e para qual base são informações essenciais."},{"title":"Entrega ao passageiro","type":"Simulacao","duration":"14 min","content":"Entrega ao passageiro\n\nAo entregar o item ao passageiro o passageiro deve assinar o formulário que DEVERÁ ser arquivado na pasta correspondente\n\n6-Realizar o amend no sistema WorldTracer\n\nAo enviar um item para outra base:\n\nArquivar a folha com:\n\n●Informações do voo\n\n●Número da RUSH\n\n●Realizar o amend no sistema WorldTracer\"\n\nQuando o objeto é localizado e entregue ao passageiro, a entrega deve ser formalizada. O passageiro deve apresentar documento e assinar recibo contendo CPF, RG ou passaporte, conforme procedimento local.\n\nFluxo de entrega\n\n1. Confirmar a identidade do passageiro ou autorizado.\n2. Conferir os dados do objeto e da reclamação.\n3. Coletar assinatura no recibo de entrega.\n4. Arquivar a documentação junto ao registro.\n5. Atualizar o sistema informando que o objeto foi entregue.\n\nO relatório impresso ou recibo formal deve permanecer junto ao processo ou ao objeto enquanto estiver armazenado, facilitando identificação, conferência e controle interno."}]$json_objetos_esquecidos$::jsonb, $mat_objetos_esquecidos$Definição e responsabilidade

Definição e responsabilidade

Objetos esquecidos abordo
"OBJETOS ESQUECIDOS
DEFINIÇÃO
Objetos pessoais dos passageiros encontrados em nossas aeronaves ou nas instalações da
Companhia. No Aeroporto, também é considerado válido o setor de balcão companhia aérea.
Estes objetos serão registrados e armazenados pelo Serviço de Bagagem com objetivo de
gerenciar a entrega aos seus proprietários.
Os objetos esquecidos devem ser encaminhados para o depósito de bagagens em São Paulo
Como registrar objetos esquecidos no WorldTracer Desktop
1. Lost and Found Property > Create
2. Os campos mandatórios são: Category (categoria), Date Found (data que foi
localizado o objeto), porém devemos preencher outros campos:
● Detailed Description - detalhar o objeto encontrado preferencialmente em
inglês.
● Supplementary Information - dados do local e a data onde o item foi
encontrado, preferencialmente em inglês.
● Storage Location - informar em qual local do aeroporto o item está armazenada.
3. O sistema permite inserir até 10 itens de uma única vez.
4. Ao terminar, o sistema nos retornará uma máscara já com os números de

Objetos esquecidos são itens pessoais encontrados em aeronaves, balcões, áreas de atendimento ou dependências sob responsabilidade operacional. O objetivo do registro é garantir rastreabilidade, guarda correta, identificação do proprietário e devolução segura.

Responsabilidades do agente

- Receber o item e preservar suas características.
- Registrar a ocorrência no sistema apropriado.
- Evitar exposição desnecessária de valores, documentos ou dados pessoais.
- Armazenar o objeto conforme orientação local.
- Orientar o passageiro com informação objetiva, sem prometer localização antes da confirmação.

---

Cadastro no WorldTracer

Cadastro no WorldTracer RFP

WorldTracer Desktop
1. Lost and Found Property > Create
2. Os campos mandatórios são: Category (categoria), Date Found (data que foi
localizado o objeto), porém devemos preencher outros campos:
● Detailed Description - detalhar o objeto encontrado preferencialmente em
inglês.
● Supplementary Information - dados do local e a data onde o item foi
encontrado, preferencialmente em inglês.
● Storage Location - informar em qual local do aeroporto o item está armazenada.
3. O sistema permite inserir até 10 itens de uma única vez.
4. Ao terminar, o sistema nos retornará uma máscara já com os números de registros
alocados para cada objeto em ID.
"
"REGRAS
O agente do Serviço de Bagagem terá o prazo máximo de 12 horas a partir do horário de
chegada do voo, para receber o objeto das equipes de Serviço ao Passageiro e inserir as
informações no sistema SITA WorldTracer Desktop.
A entrega destes artigos ao pessoal companhia aérea de Aeroporto (Serviço ao Passageiro, Security ou Rampa) deve sempre cumprir com os regulamentos
locais, em relação, a quem está autorizado a receber estes objetos.
Caso o passageiro informe que um objeto de sua propriedade fcou travado no assento da
aeronave, o agente de Serviço ao Passageiro deverá solicitar apoio para o pessoal de
Manutenção local.
Responsabilidades de Serviço de Bagagem
● Deve gerenciar como ""Objeto Localizado"" e ingressar o caso no sistema SITA
WorldTracer Desktop;
● Os objetos devem ser ingressados no sistema SITA WorldTracer Desktop através da
transação Lost and Found Property - RFP;
● A cópia impressa do relatório ingressado no sistema SITA WorldTracer Desktop é o
recibo formal do objeto;
● Os objetos esquecidos permanecem com Serviço de Bagagem por 30 dias. Se não
forem retirados neste período, devem ser encaminhados para o depósito de
bagagem em São Paulo.
● Sempre que o passageiro for retirar seu objeto esquecido no aeroporto ele deve
apresentar a cópia do cartão de embarque ou o comprovante de compra da
passagem. Caso, ele não tenha o documento, o agente deve consultar no sistema se
o passageiro voou na data em que o objeto foi localizado.
● Após a confrmação, o agente pode entregar o objeto e o passageiro deve assinar o
recibo de entrega do objeto esquecido.
Documentos
● Todos os documentos pessoais válidos para viagens ou não, esquecidos pelos
nossos Passageiros em dependências companhia aérea, devem ser encaminhados para o
setor LL da localidade.
● O agente do Serviço de Bagagem deve registrar os documentos esquecidos no
sistema SITA WorldTracer Desktop de acordo com as descrições acima.
● Os documentos sem reclamação em 30 dias devem ser encaminhados para o
depósito de bagagem em São Paulo."
"

A transação utilizada para registrar objetos esquecidos é Lost and Found Property - RFP. O cadastro deve conter categoria e data em que o objeto foi encontrado. A descrição detalhada deve ser preferencialmente em inglês, com características que permitam diferenciar o item de outros semelhantes.

Campos importantes

Category: categoria do objeto encontrado.
Date Found: data em que o objeto foi localizado.
Detailed Description: descrição completa, preferencialmente em inglês.
Storage/Local: local onde o objeto ficará guardado.
Flight/Date: voo e data, quando o item for localizado a bordo.
Passenger contact: contatos do passageiro quando houver reclamação associada.

Boas práticas de descrição

Evite registrar apenas “phone”, “bag”, “book” ou “documents”. Prefira descrição objetiva: marca, cor, modelo, detalhe visual, embalagem, número parcial quando permitido e local de localização.

---

Prazo, guarda e descarte

Prazo, armazenamento, guarda e descarte

A trilha trata do armazenamento seguro do objeto esquecido, do prazo de guarda, da identificação física do item e da decisão correta entre devolução, envio, descarte orientado ou depósito. O controle evita perda de rastreabilidade e protege o agente, o passageiro e a companhia.

Prazo, guarda e descarte

12 horas a partir do horário de
chegada do voo, para receber o objeto das equipes de Serviço ao Passageiro e inserir as
informações no sistema SITA WorldTracer Desktop.
A entrega destes artigos ao pessoal companhia aérea de Aeroporto (Serviço ao Passageiro, Security ou Rampa) deve sempre cumprir com os regulamentos
locais, em relação, a quem está autorizado a receber estes objetos.
Caso o passageiro informe que um objeto de sua propriedade fcou travado no assento da
aeronave, o agente de Serviço ao Passageiro deverá solicitar apoio para o pessoal de
Manutenção local.
Responsabilidades de Serviço de Bagagem
● Deve gerenciar como ""Objeto Localizado"" e ingressar o caso no sistema SITA
WorldTracer Desktop;
● Os objetos devem ser ingressados no sistema SITA WorldTracer Desktop através da
transação Lost and Found Property - RFP;
● A cópia impressa do relatório ingressado no sistema SITA WorldTracer Desktop é o
recibo formal do objeto;
● Os objetos esquecidos permanecem com Serviço de Bagagem por 30 dias. Se não
forem retirados neste período, devem ser encaminhados para o depósito de
bagagem em São Paulo.
● Sempre que o passageiro for retirar seu objeto esquecido no aeroporto ele deve
apresentar a cópia do cartão de embarque ou o comprovante de compra da
passagem. Caso, ele não tenha o documento, o agente deve consultar no sistema se
o passageiro voou na data em que o objeto foi localizado.
● Após a confrmação, o agente pode entregar o objeto e o passageiro deve assinar o
recibo de entrega do objeto esquecido.
Documentos
● Todos os documentos pessoais válidos para viagens ou não, esquecidos pelos
nossos Passageiros em dependências companhia aérea, devem ser encaminhados para o
setor LL da localidade.
● O agente do Serviço de Bagagem deve registrar os documentos esquecidos no
sistema SITA WorldTracer Desktop de acordo com as descrições acima.
● Os documentos sem reclamação em 30 dias devem ser encaminhados para o
depósito de bagagem em São Paulo."
" Dinheiro(Valores)
● O Serviço de Bagagem deve registrar o dinheiro no sistema SITA WorldTracer
Desktop como Lost and Found Property - RFP e enviar um e-mail ao Gerente do
Aeroporto informando o valor do dinheiro encontrado.
● Por segurança, em SITA WorldTracer Desktop, deve ser registrado a informação
""Valores"", sem especifcar a quantia. O e-mail encaminhado ao Gerente e o número
do Lost and Found Property - RFP deverão ser anexados aos objetos esquecidos.
● Nos casos de valores encontrados em bagagens sob On-Hand Bag - OHD, estes
deverão seguir o procedimento padrão de envio de On-Hand Bag - OHD ao depósito
de bagagem em São Paulo.

O registro deve ocorrer dentro do prazo operacional definido, garantindo que o item seja rastreável no sistema. Objetos não retirados dentro do prazo devem seguir para o depósito definido pela operação, respeitando exceções locais e itens que não podem ser encaminhados.

Itens sensíveis

Documentos: devem seguir o fluxo específico definido pela base.
Dinheiro/valores: registrar de forma segura, evitando exposição desnecessária do montante quando a regra assim determinar.
Powerbanks e itens com bateria: seguir orientação local de descarte ou restrição, pois podem não ser aceitos para envio.
Perecíveis: avaliar descarte conforme condição, risco sanitário e regra local.

Comunicação com passageiro

Se o objeto ainda não chegou ao Serviço de Bagagem, o passageiro não deve receber confirmação de disponibilidade. O correto é informar que as buscas estão em andamento e coletar contatos para retorno.

---

Transporte entre aeroportos

Transporte entre aeroportos

Ao enviar um item para outra base:

Arquivar a folha com:

●Informações do voo

●Número da RUSH

●Realizar o amend no sistema WorldTracer"

O transporte de objeto esquecido entre aeroportos deve ser feito com controle e rastreabilidade. O objeto não deve ser entregue informalmente à tripulação nem seguir sem identificação.

Procedimento recomendado

1. Confirmar que o objeto corresponde à reclamação do passageiro.
2. Embalar em caixa ou envelope lacrado, conforme natureza do item.
3. Emitir etiqueta Rush quando aplicável.
4. Registrar no campo AI02 ou equivalente o voo, a data e o número da etiqueta Rush.
5. Informar a base de destino sobre o envio.
6. Atualizar o histórico do RFP com a mensagem de encaminhamento.

Ponto de atenção

O envio deve permitir auditoria posterior. Quem enviou, quando enviou, em qual voo, com qual lacre/etiqueta e para qual base são informações essenciais.

---

Entrega ao passageiro

Entrega ao passageiro

Ao entregar o item ao passageiro o passageiro deve assinar o formulário que DEVERÁ ser arquivado na pasta correspondente

6-Realizar o amend no sistema WorldTracer

Ao enviar um item para outra base:

Arquivar a folha com:

●Informações do voo

●Número da RUSH

●Realizar o amend no sistema WorldTracer"

Quando o objeto é localizado e entregue ao passageiro, a entrega deve ser formalizada. O passageiro deve apresentar documento e assinar recibo contendo CPF, RG ou passaporte, conforme procedimento local.

Fluxo de entrega

1. Confirmar a identidade do passageiro ou autorizado.
2. Conferir os dados do objeto e da reclamação.
3. Coletar assinatura no recibo de entrega.
4. Arquivar a documentação junto ao registro.
5. Atualizar o sistema informando que o objeto foi entregue.

O relatório impresso ou recibo formal deve permanecer junto ao processo ou ao objeto enquanto estiver armazenado, facilitando identificação, conferência e controle interno.$mat_objetos_esquecidos$),
('avsec', $json_avsec$[{"title":"Conceito de AVSEC","type":"Aula","duration":"14 min","content":"Conceito de AVSEC\n\nDefinição\nA Segurança da Aviação Civil refere-se ao conjunto de medidas, normas e procedimentos destinados a proteger aeronaves, aeroportos, passageiros, tripulação e instalações contra atos de interferência ilícita, como sabotagem, sequestro, terrorismo, invasão de áreas restritas e transporte ilegal de substâncias perigosas.\"\n\"\n\nAVSEC significa Segurança da Aviação Civil. O foco é proteger aeronaves, aeroportos, passageiros, tripulantes, funcionários, cargas, bagagens e instalações contra atos de interferência ilícita."},{"title":"Legislacao e entidades","type":"Consulta","duration":"18 min","content":"Legislação, entidades, ameaças e interferência ilícita\n\nA base legal da segurança da aviação existe para prevenir ameaças e atos de interferência ilícita. ANAC, OACI/ICAO, RBAC e normas locais orientam o controle de acesso, inspeção, resposta a bagagem suspeita e proteção de passageiros, aeronaves, tripulações e instalações aeroportuárias.\n\nLegislação e entidades\n\nLegislação e Regulamentação\nAnexo 17 da OACI (ICAO) – base internacional para a segurança da aviação.\n\nLei nº 7.565/86 (Código Brasileiro de Aeronáutica).\n\nRBAC 107, 108 e 110 – ANAC.\n\nResoluções da CONAERO e Polícia Federal.\n\nExemplo: O RBAC 108 determina os requisitos de segurança para operadores aéreos, incluindo inspeção de passageiros e bagagens.\"\n\"\n\nEntidades envolvidas\n\nPapel das Entidades\nOACI (ICAO): Define normas internacionais.\n\nANAC: Regula e fiscaliza operadores e aeroportos.\n\nDECEA / INFRAERO: Administram e operam aeroportos.\n\nPolícia Federal: Atua na segurança e repressão de crimes aeroportuários.\n\nEmpresas aéreas: Implementam planos de segurança operacional.\n\"\n\"\n\nO agente deve conhecer o papel de cada órgão para acionar corretamente a resposta operacional e respeitar os limites de atuação de cada área."},{"title":"Ameacas comuns","type":"Aula","duration":"14 min","content":"Ameaças comuns, bagagem suspeita e isolamento\n\nEsta trilha aborda ameaças como sabotagem, sequestro, invasão de área restrita, transporte ilegal de substâncias perigosas e bagagem suspeita. Ao identificar item suspeito, o procedimento correto é não abrir, não mover, isolar a área e acionar a cadeia de segurança definida.\n\nAmeaças comuns\n\nAmeaças Comuns\nSequestro de aeronaves.\n\nEntrada não autorizada em áreas restritas.\n\nColocação de artefatos explosivos em bagagens.\n\nAtos de sabotagem contra infraestrutura aeroportuária.\n\nExemplo: O atentado de Lockerbie (1988), causado por explosivo em bagagem despachada.\n\"\n\"\n\nAmeaças incluem sequestro de aeronaves, sabotagem, terrorismo, artefatos explosivos em bagagens, invasão de áreas restritas, transporte irregular de substâncias perigosas e comportamento suspeito em áreas operacionais."},{"title":"Medidas de prevencao","type":"Procedimento","duration":"20 min","content":"Medidas de prevenção\n\nMedidas de Prevenção\nControle de acesso a áreas restritas.\n\nRastreio de bagagens e cargas com raio-X e EDS.\n\nInspeção pessoal e de objetos dos passageiros.\n\nVerificação de antecedentes de funcionários.\n\nCães farejadores, câmeras de segurança e vigilância armada.\n\nExemplo: Inspeção 100% de bagagem de mão nos aeroportos brasileiros antes do embarque.\n\"\n\"\n\nPrevenir exige controle de acesso, inspeção de pessoas e bagagens, vigilância, rastreio por raio-X/EDS, identificação de funcionários, proteção de áreas restritas e comunicação imediata de situações suspeitas."},{"title":"Resposta a situacoes criticas","type":"Simulacao","duration":"14 min","content":"Resposta crítica, RBAC e ANAC\n\nEm situações críticas, o agente deve seguir o plano de segurança, respeitar RBAC, acionar responsáveis e preservar evidências. A ANAC define requisitos de segurança e fiscalização; por isso, improviso, exposição desnecessária e comunicação informal podem aumentar o risco operacional.\n\nResposta a situações críticas\n\nSituações Críticas e Respostas\nAeronave sequestrada: Código 7500 transponder; protocolo de comunicação com torre.\n\nBagagem suspeita: Isolamento da área, acionamento de esquadrão antibombas.\n\nAcesso não autorizado: Intervenção da segurança armada e PF, verificação de identidade.\"\n\"\n\nAo identificar bagagem suspeita, o agente não deve abrir, mover ou manipular o item. O procedimento correto é isolar a área, acionar a segurança competente, preservar distância e seguir orientação da autoridade responsável.\n\nEm acesso não autorizado, a equipe deve comunicar segurança e supervisão, evitando confronto desnecessário. Em qualquer suspeita de interferência ilícita, a prioridade é proteção de vidas e preservação da operação."}]$json_avsec$::jsonb, $mat_avsec$Conceito de AVSEC

Conceito de AVSEC

Definição
A Segurança da Aviação Civil refere-se ao conjunto de medidas, normas e procedimentos destinados a proteger aeronaves, aeroportos, passageiros, tripulação e instalações contra atos de interferência ilícita, como sabotagem, sequestro, terrorismo, invasão de áreas restritas e transporte ilegal de substâncias perigosas."
"

AVSEC significa Segurança da Aviação Civil. O foco é proteger aeronaves, aeroportos, passageiros, tripulantes, funcionários, cargas, bagagens e instalações contra atos de interferência ilícita.

---

Legislacao e entidades

Legislação, entidades, ameaças e interferência ilícita

A base legal da segurança da aviação existe para prevenir ameaças e atos de interferência ilícita. ANAC, OACI/ICAO, RBAC e normas locais orientam o controle de acesso, inspeção, resposta a bagagem suspeita e proteção de passageiros, aeronaves, tripulações e instalações aeroportuárias.

Legislação e entidades

Legislação e Regulamentação
Anexo 17 da OACI (ICAO) – base internacional para a segurança da aviação.

Lei nº 7.565/86 (Código Brasileiro de Aeronáutica).

RBAC 107, 108 e 110 – ANAC.

Resoluções da CONAERO e Polícia Federal.

Exemplo: O RBAC 108 determina os requisitos de segurança para operadores aéreos, incluindo inspeção de passageiros e bagagens."
"

Entidades envolvidas

Papel das Entidades
OACI (ICAO): Define normas internacionais.

ANAC: Regula e fiscaliza operadores e aeroportos.

DECEA / INFRAERO: Administram e operam aeroportos.

Polícia Federal: Atua na segurança e repressão de crimes aeroportuários.

Empresas aéreas: Implementam planos de segurança operacional.
"
"

O agente deve conhecer o papel de cada órgão para acionar corretamente a resposta operacional e respeitar os limites de atuação de cada área.

---

Ameacas comuns

Ameaças comuns, bagagem suspeita e isolamento

Esta trilha aborda ameaças como sabotagem, sequestro, invasão de área restrita, transporte ilegal de substâncias perigosas e bagagem suspeita. Ao identificar item suspeito, o procedimento correto é não abrir, não mover, isolar a área e acionar a cadeia de segurança definida.

Ameaças comuns

Ameaças Comuns
Sequestro de aeronaves.

Entrada não autorizada em áreas restritas.

Colocação de artefatos explosivos em bagagens.

Atos de sabotagem contra infraestrutura aeroportuária.

Exemplo: O atentado de Lockerbie (1988), causado por explosivo em bagagem despachada.
"
"

Ameaças incluem sequestro de aeronaves, sabotagem, terrorismo, artefatos explosivos em bagagens, invasão de áreas restritas, transporte irregular de substâncias perigosas e comportamento suspeito em áreas operacionais.

---

Medidas de prevencao

Medidas de prevenção

Medidas de Prevenção
Controle de acesso a áreas restritas.

Rastreio de bagagens e cargas com raio-X e EDS.

Inspeção pessoal e de objetos dos passageiros.

Verificação de antecedentes de funcionários.

Cães farejadores, câmeras de segurança e vigilância armada.

Exemplo: Inspeção 100% de bagagem de mão nos aeroportos brasileiros antes do embarque.
"
"

Prevenir exige controle de acesso, inspeção de pessoas e bagagens, vigilância, rastreio por raio-X/EDS, identificação de funcionários, proteção de áreas restritas e comunicação imediata de situações suspeitas.

---

Resposta a situacoes criticas

Resposta crítica, RBAC e ANAC

Em situações críticas, o agente deve seguir o plano de segurança, respeitar RBAC, acionar responsáveis e preservar evidências. A ANAC define requisitos de segurança e fiscalização; por isso, improviso, exposição desnecessária e comunicação informal podem aumentar o risco operacional.

Resposta a situações críticas

Situações Críticas e Respostas
Aeronave sequestrada: Código 7500 transponder; protocolo de comunicação com torre.

Bagagem suspeita: Isolamento da área, acionamento de esquadrão antibombas.

Acesso não autorizado: Intervenção da segurança armada e PF, verificação de identidade."
"

Ao identificar bagagem suspeita, o agente não deve abrir, mover ou manipular o item. O procedimento correto é isolar a área, acionar a segurança competente, preservar distância e seguir orientação da autoridade responsável.

Em acesso não autorizado, a equipe deve comunicar segurança e supervisão, evitando confronto desnecessário. Em qualquer suspeita de interferência ilícita, a prioridade é proteção de vidas e preservação da operação.$mat_avsec$)
)
update public.academy_courses as c
set
    modules = u.modules,
    material = u.material
from course_content_update as u
where c.id = u.id;

-- Cursos neste lote:
-- fundamentos
-- bagagem-extraviada
-- objetos-esquecidos
-- avsec
