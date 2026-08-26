-- Lote 02: restaura conteudo completo dos cursos no Supabase.
-- Execute este arquivo no SQL Editor do Supabase.

with course_content_update(id, modules, material) as (
values
('manuseio-bagagem', $json_manuseio_bagagem$[{"title":"Integridade de bagagem","type":"Aula","duration":"16 min","content":"Manuseio de bagagem\n\" CURSO OPERACIONAL: PREVENÇÃO DE DANOS À BAGAGEM\nObjetivo: Capacitar os colaboradores que atuam no manuseio de bagagens para reduzir drasticamente os danos físicos aos volumes transportados, adotando padrões seguros de movimentação, empilhamento, transporte, carregamento e descarregamento. \"\n\" MÓDULO 1 – CONCEITOS BÁSICOS DE INTEGRIDADE DE BAGAGEM\n1.1 O que caracteriza um dano\nDano visível: rodinha quebrada, rasgo, rachadura, puxador arrancado, etiqueta destruída\n\nDano funcional: mala que não fecha, não roda ou não pode ser puxada\n\nDano oculto: conteúdo danificado por pressão ou impacto sem marca externa\n\n\"\n\" 1.2 Impacto operacional\nRedução na satisfação do cliente\n\nReclamações e processos judiciais\n\nCustos com reembolso e indenização\n\nNotificações da ANAC \"\n\" 1.3 Quem é o responsável?\nToda equipe que interage com a bagagem: check-in, inspeção, triagem, pista, esteira de restituição\n\"\n\"️ MÓDULO 2 – CAUSAS MAIS COMUNS DE DANOS\n2.1 Causas físicas\nCausa Situação comum Exemplo real\nQueda Mala despencando da esteira Volume caiu de 1,5 m sem proteção\nArremesso Lançar malas no porão ou esteira Quebra de puxador e amassado\nAtrito Arrastar no chão da pista Rasgos e desgaste no tecido\nEmpilhamento Excesso de malas sobre um volume frágil Tampa de mala rígida trincada\"\n\"️ 2.2 Causas ambientais\nExposição à chuva (mofo, odor, desbotamento)\n\nExposição prolongada ao sol (aquecimento, derretimento de partes plásticas)\n\nVazamento de líquidos de outras bagagens\"\n\"️ 2.3 Causas de identificação\nEtiqueta arrancada = extravio\n\nMala trocada por falha de leitura de etiqueta\n\"\n\" MÓDULO 3 – TIPOS DE BAGAGEM E CUIDADOS ESPECÍFICOS\n3.1 Mala rígida (ABS ou Policarbonato)\nNão tolera impacto lateral nem sobrepeso por cima"},{"title":"Causas comuns de dano","type":"Aula","duration":"18 min","content":"Causas comuns de dano\n\nAs causas mais comuns de dano incluem queda, arremesso, atrito, empilhamento incorreto, exposição à chuva ou sol, vazamento de líquidos e falhas de identificação. O arremesso é especialmente crítico porque provoca quebra de puxador, rodinhas, rachaduras, amassados e dano oculto ao conteúdo.\n\nO agente deve movimentar a bagagem com controle, usando alças reforçadas e evitando impacto direto no porão, esteira, reboque ou piso da pista.\n\nMaterial de apoio da trilha\n\nNunca empilhar mais de 2 malas pesadas sobre\n\nNunca arremessar com força – propaga trinca\n\nTransportar com a base para baixo e sem atrito\n\n3.3 Caixas e volumes não convencionais\nNecessitam de reforço e fixação adicional\n\nNão devem ser empilhadas diretamente\n\nAplicar etiquetas “CUIDADO – NÃO EMPILHAR”\n\n3.4 Transporte de animais\nRequer esteira especial, não deve ser empilhado\n\nNunca ficar abaixo de outros volumes\n\nÁrea ventilada, sombra e proteção contra ruído\n\n3.2 Mala de tecido\nFacilmente rasgada por cantos de escada, asfalto ou peças metálicas\n\nEvitar contato com superfícies quentes e sujas\n\nUsar bandejas em locais ásperos\"\n\" MÓDULO 4 – TÉCNICAS PRÁTICAS PARA EVITAR DANOS\n4.1 Estivagem segura no porão\nComece pela parte mais funda do porão \nOrganize por camadas horizontais (como se fosse jogo de Tetris)\n\nMalas pesadas na base\n\nNunca deixar espaço ocioso entre malas → use mantas\n\n4.2 Descarregamento adequado\nNão jogue a mala para fora do porão\n\nPosicione próximo à porta e retire com apoio de outro colaborador\n\nUse pranchas ou roletes para deslizar bagagens maiores\n\n4.3 Manuseio em tratores/reboques\nNão ultrapasse a capacidade máxima de carga (kg)\n\nNão ultrapasse a altura máxima permitida (1m ou 2 camadas)\n\nUse cinta de fixação, principalmente em reboques com portas laterais\n\nCubra bagagens com lona em dias de chuva\n\n️ 4.4 Proteção em condições adversas\nChuva: isolar bagagem molhada ou fornecer plástico protetor\n\nVazamentos: identificar e remover bagagem contaminada\n\nAltas temperaturas: não deixar ao sol por mais de 10 minutos\n\"\n\" ERROS OPERACIONAIS NO MANUSEIO DE BAGAGENS: IMPACTOS E CORREÇÕES\nO manuseio inadequado de bagagens por agentes de rampa é uma das principais causas de avarias físicas em volumes despachados, gerando prejuízos financeiros, atrasos operacionais e desgaste na relação com o cliente. Grande parte desses danos é resultado de hábitos incorretos e repetitivos, que podem ser evitados com conhecimento técnico e atenção ao detalhe.\"\n\" EXEMPLOS COMUNS DE MANUSEIO INCORRETO\n1. Segurar malas pelas rodinhas ou puxadores\nErro: O agente segura a bagagem por uma das rodinhas ou puxador retrátil para levantar ou arremessar o volume."},{"title":"Cuidados por tipo de volume","type":"Consulta","duration":"20 min","content":"Cuidados por tipo de volume\n\nCada tipo de volume exige cuidado específico. Mala rígida sofre com impacto lateral e excesso de peso por cima. Mala de tecido rasga com atrito em quinas, asfalto e partes metálicas. Caixas e volumes não convencionais precisam de reforço, fixação e avaliação de empilhamento. Bagagem frágil deve ser posicionada no topo ou próxima à porta do porão.\n\nO tipo de volume define como segurar, transportar, empilhar e proteger a bagagem durante toda a operação.\n\nMaterial de apoio da trilha\n\nConsequência: As rodinhas não são projetadas para tração ou impacto e se quebram facilmente, causando danos funcionais e reclamações do passageiro.\n\nCorreção: Segurar sempre pelas alças laterais ou superiores reforçadas, preferencialmente com luvas antiderrapantes para maior firmeza.\n\"\n\" 2. Arremessar malas para dentro ou fora do porão\nErro: Ao agilizar o carregamento ou descarregamento, o agente “lança” a mala para economizar tempo.\n\nConsequência: O impacto com o piso ou com outras malas provoca quebras, rachaduras e rompimentos estruturais.\n\nCorreção: Utilizar movimento controlado de empurrar ou deslizar, em pranchas, com apoio de outro agente.\n\n3. Empilhar sem critério de peso e fragilidade\nErro: Bagagens leves, frágeis ou moles são colocadas sob malas grandes e pesadas.\n\nConsequência: Deformações permanentes, ruptura de costura, quebra de frascos internos e contaminação de conteúdo.\n\nCorreção: Organizar por camadas, com as malas maiores e rígidas na base, e volumes frágeis ou leves no topo e na entrada do porão.\n\n4. Arrastar malas pelo chão\nErro: Ao movimentar malas para fora do reboque ou da esteira, o operador as arrasta no piso áspero da pista.\n\nConsequência: Rasgos em malas de tecido, desgaste em cantos, perda de cor e acúmulo de sujeira.\n\nCorreção: Usar prancha deslizante, esteira rolante ou bandeja, e sempre levantar pelas alças, com cuidado.\n\n5. Ignorar etiquetas de “FRÁGIL”\nErro: A bagagem com etiqueta de frágil é tratada como qualquer outra, ou fica no fundo da pilha.\n\nConsequência: Danos internos (computadores, garrafas, eletrônicos) sem sinais externos → indenização complexa.\n\nCorreção: Toda bagagem com etiqueta “FRÁGIL” deve ser separada e alocada próxima à porta do porão, no topo da carga.\n\n6. Falha na fixação durante transporte com reboque\nErro: Reboques com malas soltas, sem cinta ou rede de segurança."},{"title":"Estivagem e descarregamento","type":"Pratica guiada","duration":"24 min","content":"Estivagem e descarregamento\n\nEstivagem é a organização segura da carga no porão. A prática correta é distribuir peso por camadas, colocar malas pesadas na base, proteger volumes frágeis, usar mantas quando necessário e evitar espaços vazios que permitam deslocamento durante o voo.\n\nNo descarregamento, a bagagem não deve ser jogada para fora do porão. Use movimento controlado, apoio de outro colaborador, pranchas ou roletes para volumes maiores.\n\nMaterial de apoio da trilha\n\nConsequência: Volumes caem durante o trajeto, são arrastados ou expostos à chuva.\n\nCorreção: Usar sempre rede ou cinta de fixação, respeitar o limite de empilhamento (máx. 2 camadas) e cobrir com lona em tempo chuvoso.\n\nCONSIDERAÇÕES FINAIS\nCada bagagem representa um cliente que confiou seus pertences à companhia. O agente de rampa é o primeiro e último elo de contato físico com esse volume. Pequenas ações diárias, quando realizadas incorretamente, geram consequências grandes em escala: atrasos, indenizações, reputação da empresa e riscos à segurança do voo (caso de bagagens rompidas com líquidos, aerossóis ou eletrônicos danificados).\n\nA prevenção está nos detalhes operacionais:\n\nOnde você segura a mala.\n\nComo ela é posicionada no porão.\n\nSe foi protegida da chuva.\n\nSe o carregamento respeitou os limites.\n\nPromover uma cultura de respeito à bagagem do passageiro é fundamental para a excelência no serviço em solo.\"\n\" Mitigação de Aceitação de Bagagem Já Danificada\n1. Procedimentos no Check-in\nObjetivo: Evitar que a companhia aérea seja responsabilizada por avarias pré-existentes.\n\nAções recomendadas:\nInspeção visual obrigatória da mala no momento do despacho.\n\nVerificação dos seguintes pontos:\n\nQuebras em rodinhas, puxadores ou alças\n\nRachaduras em malas rígidas\n\nRasgos ou furos em malas de tecido\n\nZíperes danificados ou sem lacre de segurança\n\nComunicação clara ao passageiro:\nInformar de forma cordial que a bagagem apresenta avaria pré-existente.\n\nExplicar que a empresa não se responsabiliza por esse tipo de dano.\n\nOferecer a assinatura do termo Limited Release (LR).\n\"\n\"‍️ Fiscalização pelos Agentes de Rampa\nObjetivo: Garantir que bagagens já fragilizadas não sejam danificadas ainda mais durante o manuseio.\n\nBoas práticas:\nSeparar malas com etiqueta LR ao receber no porão."},{"title":"Limited Release","type":"Procedimento","duration":"18 min","content":"Evitar empilhar ou pressionar bagagens frágeis sobre outras.\n\nCaso identifique uma bagagem visivelmente danificada sem etiqueta de LR, reportar à supervisão imediatamente antes do embarque.\n\nSituações comuns:\nProblema identificado Ação recomendada\nMala com rodinha quebrada Não arrastar pela base; usar alça superior.\nMala com estrutura rachada Posicionar no topo das pilhas.\nBagagem envolta com plástico Evitar puxar pelo plástico; usar alças originais.\"\n\" Limited Release (LR) – Termo de Responsabilidade\nO que é?\nUm documento assinado pelo passageiro reconhecendo que a bagagem já possuía danos no momento da aceitação.\n\nQuando usar:\nBagagens com avarias aparentes\n\nEmbalagens improvisadas (sacolas, caixas de papelão)\n\nItens frágeis despachados sem embalagem protetora\n\nConteúdo mínimo do LR:\nNome e CPF do passageiro\n\nDescrição do dano observado\n\nAssinatura do passageiro\n\nAssinatura do agente de check-in\"\n\" Benefícios da Adoção Correta\nRedução de reclamações no balcão de achados e perdidos\n\nProteção legal para a companhia aérea\n\nRegistro claro do estado da bagagem\n\nResponsabilidade compartilhada com o passageiro\""}]$json_manuseio_bagagem$::jsonb, $mat_manuseio_bagagem$Integridade de bagagem

Manuseio de bagagem
" CURSO OPERACIONAL: PREVENÇÃO DE DANOS À BAGAGEM
Objetivo: Capacitar os colaboradores que atuam no manuseio de bagagens para reduzir drasticamente os danos físicos aos volumes transportados, adotando padrões seguros de movimentação, empilhamento, transporte, carregamento e descarregamento. "
" MÓDULO 1 – CONCEITOS BÁSICOS DE INTEGRIDADE DE BAGAGEM
1.1 O que caracteriza um dano
Dano visível: rodinha quebrada, rasgo, rachadura, puxador arrancado, etiqueta destruída

Dano funcional: mala que não fecha, não roda ou não pode ser puxada

Dano oculto: conteúdo danificado por pressão ou impacto sem marca externa

"
" 1.2 Impacto operacional
Redução na satisfação do cliente

Reclamações e processos judiciais

Custos com reembolso e indenização

Notificações da ANAC "
" 1.3 Quem é o responsável?
Toda equipe que interage com a bagagem: check-in, inspeção, triagem, pista, esteira de restituição
"
"️ MÓDULO 2 – CAUSAS MAIS COMUNS DE DANOS
2.1 Causas físicas
Causa Situação comum Exemplo real
Queda Mala despencando da esteira Volume caiu de 1,5 m sem proteção
Arremesso Lançar malas no porão ou esteira Quebra de puxador e amassado
Atrito Arrastar no chão da pista Rasgos e desgaste no tecido
Empilhamento Excesso de malas sobre um volume frágil Tampa de mala rígida trincada"
"️ 2.2 Causas ambientais
Exposição à chuva (mofo, odor, desbotamento)

Exposição prolongada ao sol (aquecimento, derretimento de partes plásticas)

Vazamento de líquidos de outras bagagens"
"️ 2.3 Causas de identificação
Etiqueta arrancada = extravio

Mala trocada por falha de leitura de etiqueta
"
" MÓDULO 3 – TIPOS DE BAGAGEM E CUIDADOS ESPECÍFICOS
3.1 Mala rígida (ABS ou Policarbonato)
Não tolera impacto lateral nem sobrepeso por cima

---

Causas comuns de dano

Causas comuns de dano

As causas mais comuns de dano incluem queda, arremesso, atrito, empilhamento incorreto, exposição à chuva ou sol, vazamento de líquidos e falhas de identificação. O arremesso é especialmente crítico porque provoca quebra de puxador, rodinhas, rachaduras, amassados e dano oculto ao conteúdo.

O agente deve movimentar a bagagem com controle, usando alças reforçadas e evitando impacto direto no porão, esteira, reboque ou piso da pista.

Material de apoio da trilha

Nunca empilhar mais de 2 malas pesadas sobre

Nunca arremessar com força – propaga trinca

Transportar com a base para baixo e sem atrito

3.3 Caixas e volumes não convencionais
Necessitam de reforço e fixação adicional

Não devem ser empilhadas diretamente

Aplicar etiquetas “CUIDADO – NÃO EMPILHAR”

3.4 Transporte de animais
Requer esteira especial, não deve ser empilhado

Nunca ficar abaixo de outros volumes

Área ventilada, sombra e proteção contra ruído

3.2 Mala de tecido
Facilmente rasgada por cantos de escada, asfalto ou peças metálicas

Evitar contato com superfícies quentes e sujas

Usar bandejas em locais ásperos"
" MÓDULO 4 – TÉCNICAS PRÁTICAS PARA EVITAR DANOS
4.1 Estivagem segura no porão
Comece pela parte mais funda do porão 
Organize por camadas horizontais (como se fosse jogo de Tetris)

Malas pesadas na base

Nunca deixar espaço ocioso entre malas → use mantas

4.2 Descarregamento adequado
Não jogue a mala para fora do porão

Posicione próximo à porta e retire com apoio de outro colaborador

Use pranchas ou roletes para deslizar bagagens maiores

4.3 Manuseio em tratores/reboques
Não ultrapasse a capacidade máxima de carga (kg)

Não ultrapasse a altura máxima permitida (1m ou 2 camadas)

Use cinta de fixação, principalmente em reboques com portas laterais

Cubra bagagens com lona em dias de chuva

️ 4.4 Proteção em condições adversas
Chuva: isolar bagagem molhada ou fornecer plástico protetor

Vazamentos: identificar e remover bagagem contaminada

Altas temperaturas: não deixar ao sol por mais de 10 minutos
"
" ERROS OPERACIONAIS NO MANUSEIO DE BAGAGENS: IMPACTOS E CORREÇÕES
O manuseio inadequado de bagagens por agentes de rampa é uma das principais causas de avarias físicas em volumes despachados, gerando prejuízos financeiros, atrasos operacionais e desgaste na relação com o cliente. Grande parte desses danos é resultado de hábitos incorretos e repetitivos, que podem ser evitados com conhecimento técnico e atenção ao detalhe."
" EXEMPLOS COMUNS DE MANUSEIO INCORRETO
1. Segurar malas pelas rodinhas ou puxadores
Erro: O agente segura a bagagem por uma das rodinhas ou puxador retrátil para levantar ou arremessar o volume.

---

Cuidados por tipo de volume

Cuidados por tipo de volume

Cada tipo de volume exige cuidado específico. Mala rígida sofre com impacto lateral e excesso de peso por cima. Mala de tecido rasga com atrito em quinas, asfalto e partes metálicas. Caixas e volumes não convencionais precisam de reforço, fixação e avaliação de empilhamento. Bagagem frágil deve ser posicionada no topo ou próxima à porta do porão.

O tipo de volume define como segurar, transportar, empilhar e proteger a bagagem durante toda a operação.

Material de apoio da trilha

Consequência: As rodinhas não são projetadas para tração ou impacto e se quebram facilmente, causando danos funcionais e reclamações do passageiro.

Correção: Segurar sempre pelas alças laterais ou superiores reforçadas, preferencialmente com luvas antiderrapantes para maior firmeza.
"
" 2. Arremessar malas para dentro ou fora do porão
Erro: Ao agilizar o carregamento ou descarregamento, o agente “lança” a mala para economizar tempo.

Consequência: O impacto com o piso ou com outras malas provoca quebras, rachaduras e rompimentos estruturais.

Correção: Utilizar movimento controlado de empurrar ou deslizar, em pranchas, com apoio de outro agente.

3. Empilhar sem critério de peso e fragilidade
Erro: Bagagens leves, frágeis ou moles são colocadas sob malas grandes e pesadas.

Consequência: Deformações permanentes, ruptura de costura, quebra de frascos internos e contaminação de conteúdo.

Correção: Organizar por camadas, com as malas maiores e rígidas na base, e volumes frágeis ou leves no topo e na entrada do porão.

4. Arrastar malas pelo chão
Erro: Ao movimentar malas para fora do reboque ou da esteira, o operador as arrasta no piso áspero da pista.

Consequência: Rasgos em malas de tecido, desgaste em cantos, perda de cor e acúmulo de sujeira.

Correção: Usar prancha deslizante, esteira rolante ou bandeja, e sempre levantar pelas alças, com cuidado.

5. Ignorar etiquetas de “FRÁGIL”
Erro: A bagagem com etiqueta de frágil é tratada como qualquer outra, ou fica no fundo da pilha.

Consequência: Danos internos (computadores, garrafas, eletrônicos) sem sinais externos → indenização complexa.

Correção: Toda bagagem com etiqueta “FRÁGIL” deve ser separada e alocada próxima à porta do porão, no topo da carga.

6. Falha na fixação durante transporte com reboque
Erro: Reboques com malas soltas, sem cinta ou rede de segurança.

---

Estivagem e descarregamento

Estivagem e descarregamento

Estivagem é a organização segura da carga no porão. A prática correta é distribuir peso por camadas, colocar malas pesadas na base, proteger volumes frágeis, usar mantas quando necessário e evitar espaços vazios que permitam deslocamento durante o voo.

No descarregamento, a bagagem não deve ser jogada para fora do porão. Use movimento controlado, apoio de outro colaborador, pranchas ou roletes para volumes maiores.

Material de apoio da trilha

Consequência: Volumes caem durante o trajeto, são arrastados ou expostos à chuva.

Correção: Usar sempre rede ou cinta de fixação, respeitar o limite de empilhamento (máx. 2 camadas) e cobrir com lona em tempo chuvoso.

CONSIDERAÇÕES FINAIS
Cada bagagem representa um cliente que confiou seus pertences à companhia. O agente de rampa é o primeiro e último elo de contato físico com esse volume. Pequenas ações diárias, quando realizadas incorretamente, geram consequências grandes em escala: atrasos, indenizações, reputação da empresa e riscos à segurança do voo (caso de bagagens rompidas com líquidos, aerossóis ou eletrônicos danificados).

A prevenção está nos detalhes operacionais:

Onde você segura a mala.

Como ela é posicionada no porão.

Se foi protegida da chuva.

Se o carregamento respeitou os limites.

Promover uma cultura de respeito à bagagem do passageiro é fundamental para a excelência no serviço em solo."
" Mitigação de Aceitação de Bagagem Já Danificada
1. Procedimentos no Check-in
Objetivo: Evitar que a companhia aérea seja responsabilizada por avarias pré-existentes.

Ações recomendadas:
Inspeção visual obrigatória da mala no momento do despacho.

Verificação dos seguintes pontos:

Quebras em rodinhas, puxadores ou alças

Rachaduras em malas rígidas

Rasgos ou furos em malas de tecido

Zíperes danificados ou sem lacre de segurança

Comunicação clara ao passageiro:
Informar de forma cordial que a bagagem apresenta avaria pré-existente.

Explicar que a empresa não se responsabiliza por esse tipo de dano.

Oferecer a assinatura do termo Limited Release (LR).
"
"‍️ Fiscalização pelos Agentes de Rampa
Objetivo: Garantir que bagagens já fragilizadas não sejam danificadas ainda mais durante o manuseio.

Boas práticas:
Separar malas com etiqueta LR ao receber no porão.

---

Limited Release

Evitar empilhar ou pressionar bagagens frágeis sobre outras.

Caso identifique uma bagagem visivelmente danificada sem etiqueta de LR, reportar à supervisão imediatamente antes do embarque.

Situações comuns:
Problema identificado Ação recomendada
Mala com rodinha quebrada Não arrastar pela base; usar alça superior.
Mala com estrutura rachada Posicionar no topo das pilhas.
Bagagem envolta com plástico Evitar puxar pelo plástico; usar alças originais."
" Limited Release (LR) – Termo de Responsabilidade
O que é?
Um documento assinado pelo passageiro reconhecendo que a bagagem já possuía danos no momento da aceitação.

Quando usar:
Bagagens com avarias aparentes

Embalagens improvisadas (sacolas, caixas de papelão)

Itens frágeis despachados sem embalagem protetora

Conteúdo mínimo do LR:
Nome e CPF do passageiro

Descrição do dano observado

Assinatura do passageiro

Assinatura do agente de check-in"
" Benefícios da Adoção Correta
Redução de reclamações no balcão de achados e perdidos

Proteção legal para a companhia aérea

Registro claro do estado da bagagem

Responsabilidade compartilhada com o passageiro"$mat_manuseio_bagagem$),
('ahl', $json_ahl$[{"title":"Quando abrir uma AHL","type":"Aula","duration":"10 min","content":"Bagagem extraviada\n\"DEFINIÇÃO\nBagagem despachada que não chegou no mesmo voo do passageiro, fcando caracterizado\no extravio. Delayed Bag - AHL (Advise If Hold) é uma sigla do sistema SITA WorldTracer\nDesktop.\nOs agentes do Serviço de Bagagem devem consultar previamente as m Bag - FWD recebidas por seu aeroporto, a fm de anunciar o nome de todos os passageiros\ncujas bagagens fcaram na origem ou conexão, evitando que aguardem na esteira\ndesnecessariamente.\n2.2. REGISTRO DE OCORRÊNCIA\nAbertura de uma Delayed Bag - AHL em voos nacionais e internacionais acontece somente\nno ato do desembarque do passageiro, ou seja, não são aceitas reclamações posteriores. O\nregistro da Delayed Bag - AHL deve ser de acordo com o nome que consta na etiqueta. Ou\nseja, se tivermos 3 malas extraviadas de uma mesma família ou grupo, e as bagagens\ndespachadas estão em nome de cada passageiro, devem ser registrados 03 Property\nIrregularity Report - PIR.\nO Contact Center companhia aérea pode informar ao cliente o status do caso, editar ou inserir\ninformações.\nCaso o passageiro necessite de alguma informação que não está disponível no sistema SITA\nWorldTracer Desktop, o Contact Center envia um e-mail ao aeroporto com a dúvida em\nquestão. O aeroporto deve responder o e-mail em no máximo 48h, para que o Contact\nCenter possa responder prontamente ao passageiro.\nO Agente do Serviço de Bagagem deverá seguir os passos abaixo: 1.3.0 POLÍTICA DE BAGAGEM\n1.3.1. Legislação aplicada\nPara registro é aplicada a Convenção de Montreal.\nÉ aplicado a Resolução 400 ANAC.\n\n1.3.2. Contrato de transporte de bagagem\nAs Normas do ‘Contrato de Transporte Aéreo’ estão disponíveis no site www.companhia aérea.com.\n1.3.3. Atendimento no Desembarque\nNa chegada de cada voo da companhia aérea, em qualquer aeroporto, deve haver um ou mais\n(dependendo da necessidade) Agentes do Serviço de Bagagem recepcionando e orientando\nos passageiros na área de restituição de bagagem:\n● O Agente deve efetuar um anúncio (speech), informando o número da esteira em que\nas bagagens serão disponibilizadas para cada voo;\n● O Agente que estiver recepcionando os passageiros deve estar munido de formulário\nProperty Irregularity Report - PIR, cartão de identifcação de bagagem, (Chart);\n● Deve também esclarecer, de forma educada e cortês, a Política Interna da companhia aérea\nque é baseada em legislações nacionais e internacionais;\n● Sempre que possível, avisar o passageiro sobre a falta da bagagem no momento do\nseu desembarque. Para isso, faça um anúncio no saguão de desembarque\nsolicitando que o passageiro entre em contato com funcionário da companhia aérea.\nSugerimos o seguinte speech:\n“Atenção, por favor, Sr. / Sra. [nome do passageiro] cliente companhia aérea do voo XXX vindo\nde XXX, por favor entre em contato com nossa equipe neste saguão de\ndesembarque. Muito obrigado”;\n● Dizer ao passageiro claramente o que será feito acerca do problema, não fazendo\npromessas que não possam ser cumpridas;\n● Explicar ao passageiro os prazos de busca ou tratativas para a resolução da\ndanifcação;\n● Fornecer o contato do Contact Center e incentivar o passageiro a utilizar o rastreador\n\nde bagagem, através do site da companhia aérea:\nhttps://www.portal operacional da companhia\nodifcar-informacao;\n● Voos origem Brasil operados pela companhia aérea em aeronaves narrow body: Nos\ncasos em que o CRS (child restraint system) é usado, a equipe do Serviço de\nPassageiros o entrega à equipe do Serviço de Bagagem, que é responsável por\ndevolvê-lo como \"\"RUSH\"\" à base que pertence no próximo voo disponível;\n● As etiquetas RUSH manuais devem ser guardadas em local seguro, pois sua\nutilização é permitida apenas para envio de bagagens desacompanhadas e somente\nem caso de falhas no sistema que impeçam a emissão de etiquetas RUSH\nautomatizadas. Não é permitido fornecer estas etiquetas a quaisquer pessoas que\nnão realizem a função de Serviço de Bagagem (LL).\n\"\n\" EXTRAVIO – DELAYED BAG - AHL 2. EXTRAVIO – DELAYED BAG - AHL\nDEFINIÇÃO\nBagagem despachada que não chegou no mesmo voo do passageiro, fcando caracterizado\no extravio. Delayed Bag - AHL (Advise If Hold) é uma sigla do sistema SITA WorldTracer\nDesktop.\nOs agentes do Serviço de Bagagem devem consultar previamente as mensagens Forward\nBag - FWD recebidas por seu aeroporto, a fm de anunciar o nome de todos os passageiros\ncujas bagagens fcaram na origem ou conexão, evitando que aguardem na esteira\ndesnecessariamente.\nREGISTRO DE OCORRÊNCIA\nAbertura de uma Delayed Bag - AHL em voos nacionais e internacionais acontece somente\nno ato do desembarque do passageiro, ou seja, não são aceitas reclamações posteriores. O\nregistro da Delayed Bag - AHL deve ser de acordo com o nome que consta na etiqueta. Ou\n\nseja, se tivermos 3 malas extraviadas de uma mesma família ou grupo, e as bagagens\ndespachadas estão em nome de cada passageiro, devem ser registrados 03 Property\nIrregularity Report - PIR.\nO Contact Center companhia aérea pode informar ao cliente o status do caso, editar ou inserir\ninformações.\nCaso o passageiro necessite de alguma informação que não está disponível no sistema SITA\nWorldTracer Desktop, o Contact Center envia um e-mail ao aeroporto com a dúvida em\nquestão. O aeroporto deve responder o e-mail em no máximo 48h, para que o Contact\nCenter possa responder prontamente ao passageiro.\nO Agente do Serviço de Bagagem deverá seguir os passos abaixo: Inserção de documento: todos os aeroportos companhia aérea deverão inserir no campo\nPassport Details - PP do sistema SITA WorldTracer Desktop a sigla + número do\ndocumento do passageiro.\nTIPO EXEMPLO\n\nPassport Details - PP CPF 12345678910 ou Passport Details - PP CPF 12345678910 ouort Details - PP RG 123456789\nDocumento de i- PP RG 123456789 ou Documento de identidade ou DNI\n( todas as nacionalidades);\nPassport Details - PP DI 123456\nPassaporte\n(todas as nacionalidades).\nPassport Details - PP PSPT FF123456\nAtendimento inicial do passageiro no desembarque\nQuando a bagagem do cliente for extraviada e já houver FWD (mensagem de envio) no\nsistema Worldtracer Desktop, devemos pesquisar informações da bagagem no sistema\nSabre e/ou no SmartSuite. Na sequência devemos procurar e anunciar o cliente no\ndesembarque e providenciarmos o registro do seu relatório o mais rápido possível, visando\nminimizar os impactos causados.\nCOLABORADOR: [Bom dia/boa tarde/boa noite], sr(a) [NOME DO CLIENTE]. Meu nome é\n[NOME DO COLABORADOR] e gostaria de informar que infelizmente a sua mala não chegou\nneste voo. Lamentamos o ocorrido e recebemos a informação de que a sua mala tem\nprevisão para chegar neste aeroporto no voo [XXXX], por volta de [YY] horas. Precisarei\ncoletar alguns dados para providenciar a entrega da sua bagagem.\nOuça atentamente o que o cliente tem a dizer. Questione o cliente se além da abertura do\nregistro, se tem mais algo que possa fazer para ajudá-lo.\nApós coletar todos os dados necessários e registrar o PIR no sistema, verifcar se o cliente\npossui fdelidade Black Signature, Black, Platinum ou viajou na cabine Premium Business ou\nPremium Economy, pois neste caso devemos oferecer auxílio emergencial de forma proativa.\n\nCOLABORADOR: Sr(a) [NOME DO CLIENTE], assim que a sua mala chegar neste aeroporto,\na companhia aérea entrará em contato por telefone, no número informado. Alinharemos com a\ntransportadora que nos atende para que sua bagagem seja entregue o mais rápido possível.\nVou pedir por gentileza, que fque atento(a) ao telefone, para que possamos atualizá-lo(a) de\nqualquer novidade ou mudança. O(a) senhor(a) gostaria de fornecer mais telefones de\ncontato?\nGostaríamos de pedir as mais sinceras desculpas e com o objetivo de melhorar nossos\nserviços, informo que será enviada para o e-mail informado uma pesquisa para avaliar nosso\natendimento. Confrmação de endereço, avaliação de experiência e verifcação de entrega da\nbagagem\nApós a chegada da bagagem no seu aeroporto, antes de realizar o contato com o cliente,\ndevemos verifcar a disponibilidade com a transportadora e considerar a logística do Serviço\nde Bagagem, a fm de garantir que a informação da previsão de entrega da bagagem possa\nser fornecida ao cliente durante o atendimento.\nCOLABORADOR: [Bom dia/Boa tarde/Boa noite!] Meu nome é [NOME DO\nCOLABORADOR] e represento o setor de bagagens do aeroporto [INFORMAR QUAL\nAEROPORTO REPRESENTA]. Eu gostaria de falar com o(a) [NOME DO CLIENTE] sobre a\nsua bagagem.\nNovamente, peço desculpas em nome da companhia aérea por qualquer inconveniente causado.\nInformo que sua bagagem já se encontra disponível no aeroporto [nome do o aeroporto que\nestá realizando a entrega]. Gostaríamos de confrmar seu endereço para coordenar a\nentrega de sua bagagem.\nApós o passageiro confrmar o endereço:\n\nCOLABORADOR: Verifquei com a transportadora e é possível realizar a entrega de sua\nmala entre [INFORMAR A JANELA DE HORÁRIO]. O senhor(a) estará no endereço este\nhorário ou haverá alguém que possa receber a bagagem no seu lugar? Posso agendar com\na transportadora?\nO agente deve assegurar de informar ao passageiro o horário de atendimento da prestadora\nde serviços de entrega de seu aeroporto, a fm de fornecer um atendimento assertivo e com\ninformações seguras:\nCOLABORADOR: Com o objetivo de melhorar nossos serviços, informo que a/o [Sr/Sra]\nreceberá uma pesquisa para avaliar sua experiência com o processo de sua bagagem.\nAgradecemos o seu tempo.\nAlgumas horas após a transportadora coletar a bagagem do cliente, será necessário\nconfrmar, via e-mail, se o passageiro recebeu a bagagem sem danos e/ou violações e que a\npesquisa de avaliação chegará em algumas horas. Para isso, utilize o modelo de mensagem\nabaixo, alterando os campos [PIR DO PASSAGEIRO] e [NOME] para os dados reais do\npassageiro:\"\n\" PROCESSO DE BUSCA POR EXCEÇÃO\nA busca de Delayed Bag - AHL por exceção ocorre somente por 5 dias. No 5º dia, o agente\ndeve entrar em contato com o passageiro e encerrar a Delayed Bag - AHL no sistema,\ninserindo todas as informações no Extra Information.\nQuando se registra um processo busca por exceção o agente deve entregar uma cópia do\nprocesso ao cliente e completar na máscara do Delayed Bag - AHL o elemento Message\nOptions de acordo com a solicitação do cliente.\nSerão considerados casos de busca por exceção as seguintes situações:"},{"title":"Campos principais","type":"Pratica guiada","duration":"25 min","content":"Campos principais da AHL\n\nA AHL deve reunir os campos que permitem localizar, comparar, comunicar e entregar a bagagem: TN, CT, BI, BW, FD, RT, FL, TK, LA, NM, IT, PP, CP, PN, TP, EA, PA, PC, PZ, CO, RL, FS, AG, PR e Description.\n\nFD identifica voo e data. RT identifica rota. TN identifica a etiqueta da bagagem. Dados de contato e endereço sustentam a comunicação com o passageiro e a entrega.\n\nMaterial de apoio da trilha\n\nPassageiros que não possuam etiqueta de bagagem e não possuam registro de\ndespacho de bagagem no sistema de check-in.\nCaso o passageiro não possua o comprovante de despacho, mas conste\ninformação no sistema, o agente de bagagem deve registrar o Delayed Bag - AHL\nnormalmente e anexar o registro de check-in.\nPassageiros que não fzeram alfândega no primeiro ponto alfandegário;\nPassageiros que reclamam posteriormente, mesmo com comprovante de bagagem;\nPassageiros com bilhetes separados;\nPassageiros que tiveram malas retidas na origem e ou conexão devido ter conteúdo\nnão permitido para embarque, as quais são aquelas mercadorias perigosas, podendo\nvariar em cada país, como por exemplo: Power bank, aerossóis, baterias, cigarros\neletrônicos, entre outros.\nExemplo: O passageiro realiza o trecho LIS/GIG com a TAP e GIG/SCL com a\ncompanhia aérea em bilhetes separados. Se o passageiro não retirar a bagagem em GIG,\ndeve-se abrir um Delayed Bag - AHL busca por exceção em SCL uma vez que a\nbagagem não estará registrada no sistema companhia aérea. Neste caso, deve ser\nconsiderado Reason for Loss - RL79 Fault Station - FS SCL.\nQuando a bagagem for retida pela Alfândega por responsabilidade do passageiro, e\ndeverá retirar a bagagem no aeroporto do destino. Nestes casos, deve-se conside\no Reason for Loss - RL73 e o Fault Station - FS o aeroporto em que a bagage\ndeveria ter sido retirada para fazer a alfândega.\nO agente deve inserir as informações no sistema SITA Worldtracer Desktop e, se\nno 5º dia a bagagem não for localizada, o processo deve ser encerrado sem\nindenização.\n\nSe a bagagem é localizada e foi comprovada a responsabilidade da companhia aérea, deve-se realizar\na entrega normalmente na residência do passageiro e, caso solicitado pelo passageiro,\nentregar o valor do auxílio emergencial.\nOperação companhia aérea, exceto Brasil: em caso de reporte de bagagem extraviada fora do\ndesembarque, a equipe do Contact Center não redireciona mais o passageiro para registrar o\nProperty Irregularity Report - PIR no aeroporto. Neste caso, o Contact Center irá solicitar ao\npassageiro a documentação necessária para registro do Property Irregularity Report - PIR e,\nassim que recebidos, os dados serão encaminhados para o aeroporto de destino do cliente.\"\n\"Com estas informações, o agente de bagagem deve registrar o Property Irregularity Report -\nPIR no sistema SITA WorldTracer Desktop como busca por exceção e realizar as buscas por\n5 dias. Se a bagagem não for localizada o caso deve ser encerrado no sistema, conforme\nprocedimento de busca por exceção.\nConsiderando que os relatórios criados como “busca por exceção” não são culpa\nda companhia aérea, estes não devem gerar custos. Ou seja, não devemos\nemitir compensação para auxílio emergencial, não realizamos a entrega da\nbagagem através de transportadora, não indenizamos o cliente em caso de\nextravio defnitivo, etc.\nNão há prazo para abertura do PIR de busca por exceção, apenas para\nencerramento (5º dia).\nCaso o cliente de um PIR de AHL - busca por exceção, tenha sua mala danifcada\ne/ou violada, devemos abrir o PIR de DPR para o cliente e oferecer as\ncompensações normalmente.\n\nOrientações para fechamento de PIRs BUSCA POR EXCEÇÃO\nQuando a mala for localizada: 2) Quando a mala NÃO for localizada:\nAssim que o cliente fzer a retirada no aeroporto, faça o BDO/Baggage Delivery\nOrder/Create Delivery Order com o DS/Delivery Service destinado a “retirada no\naeroporto”;\nAdicione o custo “D/Delivery” com valor “0” (zero);\nEncerre o PIR.\nEncerre o PIR dentro do prazo de 05 Adicione o custo “D/Delivery” com valor “0” (zero);\nNo momento do fechamento, no campo SI/Supplementary Information, insira a\ninformação “NOT LOC”.\"\n\"TIPOS DE EXTRAVIO\nPerecíveis\nO agente do Serviço de Bagagem deve encerrar o processo imediatamente após a\nlocalização da bagagem, utilizando Reason for Loss - RLe Fault Station - FS correspondentes\nao motivo do extravio e inserindo as informações no Extra Information.\nQuando um item perecível for localizado deteriorado, a indenização deverá ser feita\ndiretamente pelo aeroporto utilizando o Agente 360 ou Travel Voucher e de acordo com o\nlimite de sua autonomia. Caso o item não tenha sido localizado dentro nos primeiros 5 dias,\npassarão automaticamente para a equipe de busca secundária e, posteriormente, para\nindenização (Contact Center ou CUS).\nA indenização só se aplicará para perecíveis despachados dentro de caixa térmica ou isopor,\nmesmo que o verso da etiqueta esteja assinado.\nBagagens retidas na Alfândega\nPara as bagagens localizadas na alfândega, o processo deve ser encerrado após a sua\nlocalização, inserindo Reason for Loss - RL e Fault Station - FS correspondentes ao extravio\n\ne inserindo as informações no Extra Information. Porém, o agente deve auxiliar o passageiro\nquanto à liberação da bagagem até a resolução do processo.\nCaso seja necessária autorização do bilhete RIP para liberar a bagagem na\nalfândega, o aeroporto deve enviar um e-mail para CUS,\ngrp_equipaje_cus@sac.companhia aérea.com e para o Contact Center (BR) através do\nFormulário de Derivação. Não será autorizado Property Irregularity Report - PIR\npara passageiros com processo busca por exceção, ou seja, para passageiros que\nnão fzeram alfândega.\nBagagens retidas na origem/conexão por conteúdo não permitido (Mercadorias\nPerigosas)\nA tratativa para os casos em que as malas fcam retidas na origem ou conexão, por conteúdo\nnão permitido, deverão seguir os seguintes passos:\n● Property Irregularity Report - PIR será aberto normalmente e as buscas, serão\nexecutadas pelo aeroporto;\n● Casos confrmados de malas retidas por conteúdo não permitido para embarque, ou\ndevido a negação de retirada do item vetado pelo cliente, nas origem e/ou conexões,\nserão tratados como busca por exceção;\n● Os agentes deverão acompanhar e auxiliar o cliente para recuperar a mala,\nsolicitando via sistema ou e-mail (caso fque retida com a administradora do\naeroporto);\n● Quando a mala chegar ao destino, a base deverá solicitar ao cliente para retirar a\nbagagem no aeroporto e encerrar o caso com Reason for Loss - RL79 e o Fault\nStation - FS pertencerá à base que criou o Property Irregularity Report - PIR;\n● Os casos criados como busca por exceção devem seguir o procedimento e ser\n\nencerrado em 5 dias corridos a contar da data de abertura do processo no sistema.\"\n\"Armas de Fogo\nTodos os aeroportos devem verifcar obrigatoriamente o porão de todas as aeronaves,\nmesmo que não haja mensagem de despacho ou SSR para armas de fogo ou esportes.\nEm caso de extravio:\n● Voos domésticos no Brasil e voos de / para o Brasil. Se a arma e/ou as munições\nnão forem restituídas ao passageiro no prazo de 01 hora a contar da hora do pouso\nda aeronave, deve ser registrado o processo de extravio no sistema SITA WorldTracer\nDesktop.\n● O aeroporto de destino deve inserir no sistema SITA WorldTracer Desktop,\ndescriminar o tipo de objeto retido no campo Contents - CC do processo e inserir\nimediatamente o Reason for Loss - RL75 (Arma de Fogo);\n● O número a ser inserido no campo Tag Number - TN, é o número do Protocolo\n(canhoto do envelope);\n● O passageiro deve obrigatoriamente abrir um BO (Boletim de Ocorrência). Este\nprocedimento deve ser informado ao passageiro no ato da abertura do Property\nIrregularity Report - PIR.\nVoos domésticos no Brasil e voos de / para o Brasil, o extravio deverá ser comunicado via\ne-mail. Segue abaixo o padrão do e-mail a ser enviado:\nPara: Polícia Federal destino; Administrador Aeroportuário origem; Administrador\nAeroportuário destino; Segurança Corporativa\ncompanhia aérea(exchange_msg_dis_securitysaoqf@companhia-aerea.com).\nAssunto: Extravio de arma de fogo e/ou munições – Voo XXX-Data XXX\nNome do passageiro:\nData:\nVoo:\nRota:\nHora do pouso:\nBase que registrou o extravio:\nNúmero do processo:\nDescrição do objeto:\nNúmero da etiqueta o (n°do envelope):\n\nPrefxo da aeronave:\nRelato do extravio: Na ausência da Polícia Federal no aeroporto de origem ou destino, o extravio deverá ser\ncomunicado ao órgão de segurança pública substituto. Além de notifcar a Central de\nBagagens e a Central de Aeroportos.\nTodos os aeroportos (exceto domésticos BR) Aeroportos domésticos Brasil\nccpoperacional@companhia aérea.com\ngrp_centralbaggagecompanhiaaerea@companhia aérea.com\nDe segunda a sexta feira:\ngrp_centralbaggagecompanhiaaerea@companhia aérea.com\nFinais de semana:\nLocalização de arma de fogo:\nVoos domésticos no Brasil e voos de / para o Brasil:\nAo localizar a arma e/ou munições o Serviço de Bagagem deverá comunicar imediatamente\natravés de e-mail a Polícia Federal, os Administradores dos aeroportos de origem, conexão e\ndestino e a equipe de Segurança Corporativa companhia aérea.\nAo enviar um objeto retido desacompanhado, o aeroporto deve enviar mensagem Forward\nBag - FWD e um e-mail para os aeroportos envolvidos informando o nome e telefone do\npassageiro, rota do voo, número do voo, tipo do objeto e local em que o objeto está\nseguindo.\nDe acordo com a orientação do departamento Jurídico, é proibida a entrega de arma de\nfogo. Neste caso o passageiro deve retirar o objeto no próprio aeroporto.\nIndenização de arma de fogo:\nO agente deve encaminhar o orçamento para compra da arma de fogo, para análise do\nContact Center de acordo com o idioma de preferência do passageiro.\nNos casos em que a arma extraviada pertencer a algum Órgão do Governo e/ou União, será\nexigido um orçamento fornecido pela Autoridade Policial responsável."},{"title":"Mascara SITA","type":"Simulacao","duration":"35 min","content":"O aeroporto irá analisar e reembolsar os gastos de locomoção do passageiro mediante\napresentação de nota fiscal.\"\n\" AUXÍLIO EMERGENCIAL\nPara que o auxílio emergencial seja fornecido ao passageiro, deve-se respeitar as seguintes\nregras:\n● O passageiro solicitar;\n● O passageiro não residir na localidade;\n● O passageiro fcar uma noite sem bagagem.\nPara os passageiros que estiverem viajando em família ou em grupos e que\ntiverem suas bagagens extraviadas, o auxílio deve ser entregue de acordo com a\nquantidade dos passageiros afetados.\nExemplo 1: em uma família de 4 pessoas com 4 bagagens despachadas, o\ncheck-in despacha todas as bagagens apenas no nome de uma pessoa (Pai) e\nduas bagagens foram extraviadas. Deve ser registrado apenas 01 Property\nIrregularity Report - PIR de acordo com o nome que consta na etiqueta, porém\nduas pessoas foram afetadas (Pai e a Mãe) com o extravio. Nesse caso, os dois\npodem receber o valor do auxílio.\nExemplo 2: em um grupo de 10 pessoas viajando juntas, caso tenham 3 malas\nextraviadas, porém as bagagens despachadas em nome de cada passageiro.\nDevem ser registrados 03 Property Irregularity Report - PIR e entregue o valor do\nauxílio para cada passageiro afetado com o extravio. Se o check-in despachar\ntodas as bagagens apenas no nome de uma pessoa deve ser registrado apenas\n01 Property Irregularity Report - PIR, porém deve ser entregue o valor do auxílio\npara os passageiros que foram afetados com o extravio.\nExemplo 3: em um extravio de 01 bagagem, 02 passageiros foram prejudicados,\n\nneste caso os 02 clientes terão direito ao auxílio emergencial. Nesta situação,\ndeverão ser emitidas duas compensações de auxílio emergencial, sendo uma em\nnome do primeiro passageiro e a outra em nome do segundo passageiro.\nO formulário de auxílio emergencial deve ser preenchido, entregando uma cópia ao\npassageiro e anexando uma cópia  junto ao Property Irregularity Report - PIR.\nO valor autorizado ao passageiro deve ser informado no campo \"\"Extra Information\"\" do\nprocesso e inserido no campo \"\"Settlement Cost/Type - CS\"\" - código \"\"A\"\" (sistema SITA\nWorldTracer Desktop).\nA responsabilidade de inserir o custo \"\"A\"\" no processo é do aeroporto que autorizou o auxílio\nemergencial ao passageiro.\nO passageiro pode solicitar o reembolso dos gastos durante o tempo que fcou sem sua\nbagagem dentro de 21 dias após a entrega da bagagem. Para rota doméstica Argentina o\nprazo é de 10 dias. Tabela de Política de compensação\n\nAeroportos Brasil\nBAGAGEM ENTREGUE PASSAGEIRO STANDARD PASSAGEIRO PREFERENCIAL\nDia 0 Não se aplica R$300\nDia 1 R$75 R$300\nDia 2 R$75 Apresentação de nota fiscal\nDias 3 a 4 Apresentação de nota fscal Apresentação de nota fiscal\nPASSAGEIRO STANDARD\nDia 0 Dia 1 Dia 2\nA partir do terceiro Não deve ser entregue auxílio, pois o passageiro não passou\numa noite sem a bagagem.\nSe ​o passageiro solicitar, não residir na localidade e ​a bagagem ainda estiver\nextraviada, entregar USD 25/BRL 75.\nSe a bagagem ainda estiver extraviada entregar mais USD 25/BRL 75.\nDevem ser solicitadas as notas fiscais do período que ele ficou sem a bagagem e\nnegociar até a autonomia do PASSAGEIRO PREFERENCIAL\nDia 0 Dia 1 A partir do segundo dia Se o passageiro não residir na localidade, entregar\nproativamente USD 100 / BRL300.\nSe a bagagem ainda estiver extraviada, entregar mais USD100 / BRL 300.\nDevem ser solicitadas as notas fiscais do período que ele fcou sem a bagagem. Caso o valor\nultrapasse a autonomia do aeroporto, o agente deve encaminhar para análise do Contact Center através do\nFormulário de derivação\n* Passageiros preferenciais/preferentes: os que estão viajando na cabine Premium\nBusiness, Premium Economy, Black Signature, Black e Platinum\"\n\"ENTREGA DE BAGAGEM\nAs bagagens devem ser entregues diariamente, utilizando os meios de transporte mais\nbaratos. O agente do Serviço de Bagagem deve seguir os passos abaixo:\n● Quando necessário, entrar em contato com o passageiro para confrmar o\nendereço;\n● Colocar lacre na bagagem dos passageiros antes da entrega, mesmo que elas\n\npossuam cadeado. O número do lacre deve constar no recibo de entrega e no\nBaggage Delivery Order - Create Delivery Order - BDO (inserir campo\nSupplementary Information na máscara), para que possa ser confrontado com o\nlacre recebido pelo passageiro em caso de reclamações.\nEste procedimento visa evitar furtos durante o manuseio das prestadoras de\nentrega e é válido para todos os aeroportos com operação companhia aérea (dentro e fora\ndo Brasil).\n● No campo Supplementary Information também deve constar a informação se o\npassageiro é Standard ou Preferencial e o idioma do passageiro.\n● No Baggage Delivery Order - Create Delivery Order - BDO, no elemento Local\nDelivery Instructions destacar as informações de número da residência,\ncomplemento (se houver) e Bairro.\n● Preencher o Baggage Delivery Order - Create Delivery Order - BDO no sistema SITA\nWorldTracer Desktop obrigatoriamente para todas as entregas, inclusive as bagagens\nretiradas pelo passageiro no aeroporto. O relatório deve ser fechado assim que for\nfeito o Baggage Delivery Order - Create Delivery Order - BDO.\n● O recibo de entrega está disponível no site da Central de Bagagem.\n● Caso o recebedor se negue a assinar o mesmo, o prestador fará uma ressalva e a\nbagagem fcará em poder do passageiro.\nNos casos em que o passageiro residir em um aeroporto diferente do que abriu\no processo, a bagagem deve ser enviada para o aeroporto mais próximo da\nresidência e este irá fazer o Baggage Delivery Order - Create Delivery Order -BDO dentro do Property Irregularity Report - PIR original, somente adicionando\n\no prestador de entrega do seu aeroporto e solicitar assinatura do recibo de\nentrega.\nExemplo:\nDelayed Bag - AHL GRULA12345, porém passageiro reside em SCL O agente de\nGRU enviará a bagagem para SCL. A equipe de SCL efetuará a entrega,\ninserindo o Baggage Delivery Order - Create Delivery Order - BDO no Delayed\nBag - AHL GRULA12345 indicando no campo Create Delivery Order o entregador\nSCLLA01.\n● O aeroporto que efetuou a entrega (mesmo que o Property Irregularity Report - PIR\nseja de outro aeroporto ou que já esteja com a equipe de Busca Secundária) será\nresponsável pelo encerramento do relatório no sistema SITA WorldTracer Desktop,\nseguindo as instruções abaixo:\n● Entrar em contato com o passageiro para informar sobre a localização da bagagem e\nconfrmar o endereço de entrega.;\n● Registrar as informações no Extra Information; ● Inserir o Baggage Delivery Order - Create Delivery Order - BDO no sistema\n(obrigatório para todas as entregas);\n● Encerrar o relatório, inserindo custo de entrega (D/Delivery), Reason of Loss and Fault\nStation. O relatório deve ser fechado assim que for feito o Baggage Delivery Order -\nCreate Delivery Order - BDO.\"\n\"PRAZO PARA ENTREGA DE BAGAGEM LOCALIZADA\nTodas as bagagens localizadas deverão seguir o prazo para entrega ao passageiro após a\nchegada no aeroporto de destino.\nTIPO DE PASSAGEIRO ENTREGA DENTRO DA REGIÃO METROPOLITANA\nOU NA CIDADE ONDE O VOO POUSOU ENTREGA FORA DA REGIÃO METROPOLITANA OU FORA DA CIDADE ONDE O VOO POUSOU\nPassageiros Standard 24h 48h\nPassageiros Preferenciais 06h 12h\n\nSe a bagagem chegar fora do horário de funcionamento do fornecedor, o Aeroporto deve\nprovidenciar a entrega no primeiro horário.\nPara passageiros preferenciais, a entrega pode ser realizada por táxi para que o prazo seja\ncumprido, caso o fornecedor não esteja disponível no momento da entrega.\nSistema SITA WorldTracer Desktop\nAssim que a bagagem chegar no Aeroporto de entrega, o agente deve suspender o caso\n(Suspended) no e inserir no Extra Information o voo e data em que a bagagem chegou.\nPara que os prazos de entrega sejam cumpridos, os agentes deverão acionar os seus\nfornecedores o mais rápido possível, através da opção “Create Delivery Order”, ou seja,\nprovidenciando a ordem de entrega da bagagem.\nRotina de entrega de bagagens\nOs aeroportos precisam ter uma rotina defnida junto aos seus fornecedores de entrega, de\nforma a atender os prazos estabelecidos. O ideal é que exista pelo menos dois períodos de\nretirada de bagagens diariamente (por exemplo: manhã e tarde). Baggage Delivery Order - Create Delivery Order - BDO e encerramento de\nProperty Irregularity Report - PIR\nQuando a bagagem de uma Delayed Bag - AHL estiver disponível em seu aeroporto,\ndevemos contatar o cliente para confrmar o endereço de entrega e confeccionar o Baggage\nDelivery Order (Baggage Delivery Order - Create Delivery Order - BDO).\""}]$json_ahl$::jsonb, $mat_ahl$Quando abrir uma AHL

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

---

Campos principais

Campos principais da AHL

A AHL deve reunir os campos que permitem localizar, comparar, comunicar e entregar a bagagem: TN, CT, BI, BW, FD, RT, FL, TK, LA, NM, IT, PP, CP, PN, TP, EA, PA, PC, PZ, CO, RL, FS, AG, PR e Description.

FD identifica voo e data. RT identifica rota. TN identifica a etiqueta da bagagem. Dados de contato e endereço sustentam a comunicação com o passageiro e a entrega.

Material de apoio da trilha

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

Mascara SITA

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
Delivery Order (Baggage Delivery Order - Create Delivery Order - BDO)."$mat_ahl$),
('ohd', $json_ohd$[{"title":"Quando abrir um OHD","type":"Aula","duration":"10 min","content":"Definição de OHD\n\nBAGAGEM SOBRANTE - On-Hand Bag - OHD\n3.1. DEFINIÇÃO\nEntende-se como bagagem sobrante On-Hand Bag - OHD:\n● Bagagens etiquetadas que não são retirados pelos passageiros da esteira do\ndesembarque;\n● Bagagens localizadas sem etiqueta de bagagem.\nA bagagem desacompanhada normalmente ocorre quando a bagagem é devolvida ao\npassageiro após ter sido manuseada de maneira inadequada.\nEm alguns casos, por procedimento das autoridades locais e as restrições das\ncompanhias aéreas, a bagagem despachada para o trecho seguinte não pode\nser descarregada no caso de um erro de conexão.\n3.1.1. Esteira de bagagem de desembarque\nSe a esteira de bagagem estiver sobrecarregada com muitas bagagens, o agente deve\nremovê-las e colocá-las em segurança em um local que não represente um risco para a\nsegurança dos passageiros.\nUma vez que todas as bagagens tenham sido entregues no desembarque e os passageiros\ntenham deixado esta área, o agente deve revisar a esteira e remover as bagagens indicadas\ncomo RUSH e quaisquer malas não reclamadas ou esquecidas e levá-las a sala do LL para\nregistrar no sistema e realizar as devidas buscas.\n3.2."},{"title":"Conteudo e identificacao","type":"Pratica guiada","duration":"25 min","content":"Registro de OHD\n\nREGISTRO DE ON-HAND BAG - OHD\nAs bagagens sobrantes de aeroportos são inseridas no sistema SITA Worldtracer Desktop\natravés da máscara “On-Hand Bag - OHD”. Estas bagagens devem ser pesadas, lacradas e\nseus dados inseridos no sistema, campo Contents - CC, possibilitando a localização do\nproprietário com maior rapidez.\nDiante de situações excepcionais de falhas nas balanças (ex: falha elétrica) que não permita\nobter o peso real para entrada de bagagem com etiqueta rush, deve-se inserir o seguinte\npeso padrão de acordo com a rota:\nRota doméstica: 17 kgs\nRota Internacional: 20 kgs\nO Líder Operacional é responsável por gerenciar com a Administradora do Aeroporto que as\nbalanças sejam calibradas e funcionem da melhor forma possível. As balanças que fcam\ndentro das salas do Serviço de Bagagem e que não pertencem a administradora\naeroportuária devem ser calibradas através da abertura de chamado pelo Portal companhia aérea.\nQuando a bagagem for desembarcada indevidamente em seu aeroporto, porém consta o\ndestino na etiqueta, não se deve abrir On-Hand Bag - OHD. Neste caso, deve-se enviar a\nbagagem para o destino indicado na etiqueta, usando a etiqueta RUSH sob mensagem de\n\nO OHD deve conter características da bagagem, tag quando houver, conteúdo, local de guarda, descrição e informações complementares suficientes para permitir match com AHL."},{"title":"ROH e FOH","type":"Simulacao","duration":"30 min","content":"ROH, FOH e FLZ\n\nROH solicitando o envio da bagagem\n(On-Hand Bag - OHD) e indicando o melhor voo, se necessário.\n3.3.3. Envio de On-Hand Bag - OHD para outro aeroporto\nSempre que um On-Hand Bag - OHD for solicitado é obrigatório enviar a bagagem de\nimediato no voo solicitado, não esquecendo de anexar uma cópia do Forward On-Hand Bag\n- FOH na etiqueta RUSH.\nPriorizar sempre os voos companhia aérea, porém caso seja necessário enviar a bagagem com outras\nempresas.\nOs agentes de aeroportos do exterior devem enviar as bagagens extraviadas para o Brasil de\nacordo com a rota realizada pelo passageiro, para que as bagagens não fquem retidas na\nReceita Federal e o passageiro não precise se deslocar para outro estado/cidade para fazer a\nliberação.\nPor este motivo, mesmo que a bagagem possa ser enviada mais rápido em voos para outras\ncidades do Brasil, o envio deve ser feito de acordo com a rota original, evitando transtornos\nao passageiro.\nAntes de enviar o On-Hand Bag - OHD o agente deve conferir as informações nos campos\nValid Until Date - DV, Permanent Contact Information - PA, Temporary Contact Information -\nTA e Extra information - FF.\nExemplo:\nA equipe de JFK precisa enviar um On-Hand Bag - OHD pertencente a uma\nDelayed Bag - AHL de GIG. Mesmo que haja opções mais rápidas de voos com\ndestino GRU, a equipe deve aguardar e enviar a bagagem somente no voo\nJFK/GIG.\n3.3.4. Envio de On-Hand Bag - OHD para o depósito/LZ\nTodos os On-Hand Bag - OHD abertos devem impreterivelmente ser enviados para o\ndepósito de bagagens após o 5º dia de sua inserção no sistema SITA Worldtracer Desktop.\nAntes de enviar o On-Hand Bag - OHD, o agente deve conferir se as inserções dos dados da\nbagagem estão coerentes e checar os matches gerados através do comando Forward\nDelayed Bag / History - FAHIS/M. Também deve verifcar se existe alguma solicitação\n“Request On-Hand Bag File - ROH”.\nPara enviar as bagagens para o depósito usamos o comando “FLZ”. A bagagem deve estar\nembalada em um saco plástico protetor, lacrada, pesada, com relação de conteúdo\ndetalhado (apenas no sistema) e com etiqueta RUSH. O processo deve permanecer aberto\nno sistema. Deve-se colocar uma cópia do \"\"FLZ\"\" anexa à etiqueta RUSH.\nSe houver artigos perecíveis dentro da bagagem, o agente deve descartá-los\nantes de enviar ao depósito de bagagens e informar a diferença de peso no\nExtra Information - FF.\"\n\"Recebimento de On-Hand Bag - OHD\nAo receber uma bagagem sob etiqueta RUSH, é necessário conferir se o peso e o número do\nlacre conferem com o mencionado na mensagem de envio. Em caso de divergência, deve-se\navisar de imediato o aeroporto remetente.\nEm caso de recebimento de um On-Hand Bag - OHD que não pertença ao seu\naeroporto, não se deve devolver a bagagem. Um novo On-Hand Bag - OHD\ndeve ser criado e, caso não seja localizado em 5 dias, deve-se proceder com o\nenvio ao depósito de bagagens. O On-Hand Bag - OHD somente deve ser\ndevolvido se pertencer a outra empresa.\n3.3.6. Encerramento de On-Hand Bag - OHD\nO encerramento do On-Hand Bag - OHD no sistema SITA Worldtracer Desktop somente\npoderá acontecer nas situações abaixo:\n● Entregando a bagagem ao passageiro no próprio aeroporto efetuando o comando\nClose File - COH, e inserir no Extra Information o nome da pessoa a quem a\nbagagem está sendo entregue, telefone ou e-mail e número do documento;\n● Enviando a bagagem para outro aeroporto, utilizando o comando \"\"Forward On-Hand\nBag - FOH\"\", contendo as informações: número da etiqueta RUSH, rota, voo, peso e\nlacre da bagagem.\nNenhum On-Hand Bag - OHD (incluindo carrinhos de bebê, guarda-chuvas etc.) deve ser\nfechado sem que tenha sido entregue ao passageiro ou enviado para outro aeroporto\nNos casos onde o passageiro responsável pela bagagem é localizado, o On-Hand Bag -\nOHD deve ser encerrado, sendo estabelecido um prazo de no máximo 15 dias para que a\nbagagem seja retirada no aeroporto.\nCaso o prazo seja excedido, a bagagem deverá ser enviada ao depósito de bagagem. Todas\nas informações devem constar no Extra Information - FF.\"\n\nROH é a solicitação de envio de um OHD por uma base que identificou provável correspondência com um AHL. FOH é o envio do OHD para a base solicitante. FLZ é usado para encaminhamento ao depósito quando não há solicitação ativa e o prazo operacional foi atingido."}]$json_ohd$::jsonb, $mat_ohd$Quando abrir um OHD

Definição de OHD

BAGAGEM SOBRANTE - On-Hand Bag - OHD
3.1. DEFINIÇÃO
Entende-se como bagagem sobrante On-Hand Bag - OHD:
● Bagagens etiquetadas que não são retirados pelos passageiros da esteira do
desembarque;
● Bagagens localizadas sem etiqueta de bagagem.
A bagagem desacompanhada normalmente ocorre quando a bagagem é devolvida ao
passageiro após ter sido manuseada de maneira inadequada.
Em alguns casos, por procedimento das autoridades locais e as restrições das
companhias aéreas, a bagagem despachada para o trecho seguinte não pode
ser descarregada no caso de um erro de conexão.
3.1.1. Esteira de bagagem de desembarque
Se a esteira de bagagem estiver sobrecarregada com muitas bagagens, o agente deve
removê-las e colocá-las em segurança em um local que não represente um risco para a
segurança dos passageiros.
Uma vez que todas as bagagens tenham sido entregues no desembarque e os passageiros
tenham deixado esta área, o agente deve revisar a esteira e remover as bagagens indicadas
como RUSH e quaisquer malas não reclamadas ou esquecidas e levá-las a sala do LL para
registrar no sistema e realizar as devidas buscas.
3.2.

---

Conteudo e identificacao

Registro de OHD

REGISTRO DE ON-HAND BAG - OHD
As bagagens sobrantes de aeroportos são inseridas no sistema SITA Worldtracer Desktop
através da máscara “On-Hand Bag - OHD”. Estas bagagens devem ser pesadas, lacradas e
seus dados inseridos no sistema, campo Contents - CC, possibilitando a localização do
proprietário com maior rapidez.
Diante de situações excepcionais de falhas nas balanças (ex: falha elétrica) que não permita
obter o peso real para entrada de bagagem com etiqueta rush, deve-se inserir o seguinte
peso padrão de acordo com a rota:
Rota doméstica: 17 kgs
Rota Internacional: 20 kgs
O Líder Operacional é responsável por gerenciar com a Administradora do Aeroporto que as
balanças sejam calibradas e funcionem da melhor forma possível. As balanças que fcam
dentro das salas do Serviço de Bagagem e que não pertencem a administradora
aeroportuária devem ser calibradas através da abertura de chamado pelo Portal companhia aérea.
Quando a bagagem for desembarcada indevidamente em seu aeroporto, porém consta o
destino na etiqueta, não se deve abrir On-Hand Bag - OHD. Neste caso, deve-se enviar a
bagagem para o destino indicado na etiqueta, usando a etiqueta RUSH sob mensagem de

O OHD deve conter características da bagagem, tag quando houver, conteúdo, local de guarda, descrição e informações complementares suficientes para permitir match com AHL.

---

ROH e FOH

ROH, FOH e FLZ

ROH solicitando o envio da bagagem
(On-Hand Bag - OHD) e indicando o melhor voo, se necessário.
3.3.3. Envio de On-Hand Bag - OHD para outro aeroporto
Sempre que um On-Hand Bag - OHD for solicitado é obrigatório enviar a bagagem de
imediato no voo solicitado, não esquecendo de anexar uma cópia do Forward On-Hand Bag
- FOH na etiqueta RUSH.
Priorizar sempre os voos companhia aérea, porém caso seja necessário enviar a bagagem com outras
empresas.
Os agentes de aeroportos do exterior devem enviar as bagagens extraviadas para o Brasil de
acordo com a rota realizada pelo passageiro, para que as bagagens não fquem retidas na
Receita Federal e o passageiro não precise se deslocar para outro estado/cidade para fazer a
liberação.
Por este motivo, mesmo que a bagagem possa ser enviada mais rápido em voos para outras
cidades do Brasil, o envio deve ser feito de acordo com a rota original, evitando transtornos
ao passageiro.
Antes de enviar o On-Hand Bag - OHD o agente deve conferir as informações nos campos
Valid Until Date - DV, Permanent Contact Information - PA, Temporary Contact Information -
TA e Extra information - FF.
Exemplo:
A equipe de JFK precisa enviar um On-Hand Bag - OHD pertencente a uma
Delayed Bag - AHL de GIG. Mesmo que haja opções mais rápidas de voos com
destino GRU, a equipe deve aguardar e enviar a bagagem somente no voo
JFK/GIG.
3.3.4. Envio de On-Hand Bag - OHD para o depósito/LZ
Todos os On-Hand Bag - OHD abertos devem impreterivelmente ser enviados para o
depósito de bagagens após o 5º dia de sua inserção no sistema SITA Worldtracer Desktop.
Antes de enviar o On-Hand Bag - OHD, o agente deve conferir se as inserções dos dados da
bagagem estão coerentes e checar os matches gerados através do comando Forward
Delayed Bag / History - FAHIS/M. Também deve verifcar se existe alguma solicitação
“Request On-Hand Bag File - ROH”.
Para enviar as bagagens para o depósito usamos o comando “FLZ”. A bagagem deve estar
embalada em um saco plástico protetor, lacrada, pesada, com relação de conteúdo
detalhado (apenas no sistema) e com etiqueta RUSH. O processo deve permanecer aberto
no sistema. Deve-se colocar uma cópia do ""FLZ"" anexa à etiqueta RUSH.
Se houver artigos perecíveis dentro da bagagem, o agente deve descartá-los
antes de enviar ao depósito de bagagens e informar a diferença de peso no
Extra Information - FF."
"Recebimento de On-Hand Bag - OHD
Ao receber uma bagagem sob etiqueta RUSH, é necessário conferir se o peso e o número do
lacre conferem com o mencionado na mensagem de envio. Em caso de divergência, deve-se
avisar de imediato o aeroporto remetente.
Em caso de recebimento de um On-Hand Bag - OHD que não pertença ao seu
aeroporto, não se deve devolver a bagagem. Um novo On-Hand Bag - OHD
deve ser criado e, caso não seja localizado em 5 dias, deve-se proceder com o
envio ao depósito de bagagens. O On-Hand Bag - OHD somente deve ser
devolvido se pertencer a outra empresa.
3.3.6. Encerramento de On-Hand Bag - OHD
O encerramento do On-Hand Bag - OHD no sistema SITA Worldtracer Desktop somente
poderá acontecer nas situações abaixo:
● Entregando a bagagem ao passageiro no próprio aeroporto efetuando o comando
Close File - COH, e inserir no Extra Information o nome da pessoa a quem a
bagagem está sendo entregue, telefone ou e-mail e número do documento;
● Enviando a bagagem para outro aeroporto, utilizando o comando ""Forward On-Hand
Bag - FOH"", contendo as informações: número da etiqueta RUSH, rota, voo, peso e
lacre da bagagem.
Nenhum On-Hand Bag - OHD (incluindo carrinhos de bebê, guarda-chuvas etc.) deve ser
fechado sem que tenha sido entregue ao passageiro ou enviado para outro aeroporto
Nos casos onde o passageiro responsável pela bagagem é localizado, o On-Hand Bag -
OHD deve ser encerrado, sendo estabelecido um prazo de no máximo 15 dias para que a
bagagem seja retirada no aeroporto.
Caso o prazo seja excedido, a bagagem deverá ser enviada ao depósito de bagagem. Todas
as informações devem constar no Extra Information - FF."

ROH é a solicitação de envio de um OHD por uma base que identificou provável correspondência com um AHL. FOH é o envio do OHD para a base solicitante. FLZ é usado para encaminhamento ao depósito quando não há solicitação ativa e o prazo operacional foi atingido.$mat_ohd$),
('matches', $json_matches$[{"title":"Como o sistema compara","type":"Aula","duration":"10 min","content":"Como o sistema compara\n\nO módulo de matches compara AHLs e OHDs para indicar possíveis correspondências entre uma bagagem extraviada e uma bagagem localizada. A comparação considera todos os campos úteis disponíveis, incluindo tag, nome do passageiro, iniciais, tipo/cor da mala, marca, peso, rota, voo, conteúdo, endereço, telefone, e-mail e observações.\n\nA tag da bagagem tem maior peso porque é o identificador mais forte. Porém, quando não há tag, o sistema usa o conjunto de evidências: conteúdo parecido, descrição da mala, rota provável, nome ou iniciais, contato do passageiro e histórico operacional."},{"title":"Interpretando percentuais","type":"Exercicio","duration":"10 min","content":"Interpretando percentuais\n\nO percentual indica o grau de semelhança entre o AHL e o OHD. Matches abaixo de 50% não são destacados porque podem gerar ruído operacional. A partir de 50%, o agente deve revisar os dados antes de tomar decisão.\n\n50% a 69%: possível match, exige análise manual.\n70% a 89%: forte indicação, conferir campos críticos.\n90% a 100%: correspondência muito provável, ainda assim deve ser validada antes de ROH/FOH.\n\nO maior match permanece visível na lista, e os demais ficam no card expansivo para consulta."},{"title":"Solicitar e enviar bagagem","type":"Simulacao","duration":"15 min","content":"Solicitar e enviar bagagem\n\nQuando um AHL identifica um OHD compatível, a base do AHL pode solicitar o envio do OHD por ROH. O OHD não solicita AHL; ele apenas recebe a solicitação e, quando a base responsável decide enviar a bagagem, registra FOH.\n\nO histórico deve guardar as duas mensagens: ROH no AHL e no OHD, FOH no AHL e no OHD. Assim a comunicação fica mútua e auditável. Após FOH, o OHD pode ser encerrado automaticamente, enquanto o AHL permanece aberto até a entrega ao passageiro ou encerramento formal."}]$json_matches$::jsonb, $mat_matches$Como o sistema compara

Como o sistema compara

O módulo de matches compara AHLs e OHDs para indicar possíveis correspondências entre uma bagagem extraviada e uma bagagem localizada. A comparação considera todos os campos úteis disponíveis, incluindo tag, nome do passageiro, iniciais, tipo/cor da mala, marca, peso, rota, voo, conteúdo, endereço, telefone, e-mail e observações.

A tag da bagagem tem maior peso porque é o identificador mais forte. Porém, quando não há tag, o sistema usa o conjunto de evidências: conteúdo parecido, descrição da mala, rota provável, nome ou iniciais, contato do passageiro e histórico operacional.

---

Interpretando percentuais

Interpretando percentuais

O percentual indica o grau de semelhança entre o AHL e o OHD. Matches abaixo de 50% não são destacados porque podem gerar ruído operacional. A partir de 50%, o agente deve revisar os dados antes de tomar decisão.

50% a 69%: possível match, exige análise manual.
70% a 89%: forte indicação, conferir campos críticos.
90% a 100%: correspondência muito provável, ainda assim deve ser validada antes de ROH/FOH.

O maior match permanece visível na lista, e os demais ficam no card expansivo para consulta.

---

Solicitar e enviar bagagem

Solicitar e enviar bagagem

Quando um AHL identifica um OHD compatível, a base do AHL pode solicitar o envio do OHD por ROH. O OHD não solicita AHL; ele apenas recebe a solicitação e, quando a base responsável decide enviar a bagagem, registra FOH.

O histórico deve guardar as duas mensagens: ROH no AHL e no OHD, FOH no AHL e no OHD. Assim a comunicação fica mútua e auditável. Após FOH, o OHD pode ser encerrado automaticamente, enquanto o AHL permanece aberto até a entrega ao passageiro ou encerramento formal.$mat_matches$)
)
update public.academy_courses as c
set
    modules = u.modules,
    material = u.material
from course_content_update as u
where c.id = u.id;

-- Cursos neste lote:
-- manuseio-bagagem
-- ahl
-- ohd
-- matches
