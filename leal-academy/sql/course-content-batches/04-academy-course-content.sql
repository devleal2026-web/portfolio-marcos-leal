-- Lote 04: restaura conteudo completo dos cursos no Supabase.
-- Execute este arquivo no SQL Editor do Supabase.

with course_content_update(id, modules, material) as (
values
('bagagem-violada', $json_bagagem_violada$[{"title":"Definição e prazo","type":"Aula","duration":"16 min","content":"Bagagem violada\n\"VIOLAÇÃO\n6.1. DEFINIÇÃO\nQuando é identifcado uma violação na bagagem despachada. Damaged Bag - DPR\n(Damage Pilfer) é a sigla do sistema SITA WorldTracer Desktop.\n6.2. PRAZO PARA ACEITAÇÃO\nO passageiro tem 7 dias a contar da data da chegada do voo para fazer a reclamação em um\ndos seguintes canais: Serviço de Bagagem e Contact Center.\nEm caso de violações procedentes de extravios, o passageiro tem até 21 dias para efetuar a\nreclamação, a partir da data de recebimento da bagagem.\nTodas as violações devem ser registradas de imediato, é proibido orientar o passageiro a\nfazer a reclamação posteriormente ou em outro aeroporto ou no Contact Center.\n6.3. CRITÉRIOS PARA ACEITAÇÃO E REGISTRO DO PROPERTY\nIRREGULARITY REPORT - PIR\nO passageiro poderá reportar a violação através do Contact Center (conforme aplicável).\nTIPO DE OBJETO\nREGISTRO DE Property\nIrregularity Report - PIR\nINDENIZÁVEL\nObjetos de valor/eletrônicos\n(jóias, papéis negociáveis,\nremédios, chaves, câmaras\nfotográfcas, celulares,\nflmadoras, laptops, tablets,\ndinheiro em espécie e etc.)\nSIM NÃO\nConvencional\n(roupa,cosméticos, etc)\nSIM SIM\nPara casos em que existe a informação e/ou carta que a bagagem foi vistoriada pelo\nTSA (\"\"Transportation Security Administration\"\"), deve-se abrir Property Irregularity\nReport - PIR normalmente, porém não haverá compensação.\nAo entrar em contato com o Contact Center, o Property Irregularity Report - PIR será\nregistrado e entregue uma oferta. Se o passageiro fzer a reclamação através dos canais de\natendimento."},{"title":"Aceitacao e documentos","type":"Procedimento","duration":"20 min","content":"Aceitação, documentos e prazo de reclamação\n\nNa violação de bagagem, a aceitação do caso depende de prazo de reclamação, documentação mínima, evidências, fotos, etiqueta, dados do passageiro e coerência entre relato e ocorrência. Sem esses elementos, a tratativa perde força técnica.\n\nO Contact Center irá registrar o processo como CCELA.\nAssim que o passageiro entrar em contato com o Contact Center, ele verifcará toda a\ndocumentação necessária e realizará as análises assim como registrar o processo utilizando\no código CCE. Todos os processos de violação registrados pelo Contact Center serão\ncompensados e encerrados diretamente por eles. O aeroporto fcará responsável pela\ncompensação dos processos de violação criados na área do desembarque.\nNo campo Extra Information - FF, deve constar todas as informações de tratativa com o\ncliente. Os documentos para verifcar o número do voo e a entrada da bagagem no sistema são os\nseguintes:\n1. Cópia do documento de identifcação com foto;\n2. Cópia do cartão de embarque ou bilhete;\n3. Cópia da etiqueta de bagagem ou comprovante de despacho;\n4. Lista dos itens violados e nota fscal (se aplicável).\nCaso o passageiro não apresente os itens 3 e 4, o agente deve consultar se há informação\ndisponível no sistema de check-in. Se não houver forma de comprovar a viagem do\npassageiro e o despacho da bagagem, o Property Irregularity Report - PIR não poderá ser\nregistrado.\n6.4. PRAZO PARA ANÁLISE E RESOLUÇÃO\nPara caso de objetos de valor/eletrônicos, o agente deve encerrar os casos imediatamente\ncom Reason for Loss - RL 93 e Fault Station - FS aeroporto anterior ao destino e entregar\nCarta de Recusa ao passageiro. Para casos de objetos convencionais, o agente deve enviar\numa proposta até a autonomia do aeroporto e encerrar o processo apenas quando o\npassageiro aceitar a proposta de indenização."},{"title":"Objetos de valor","type":"Consulta","duration":"18 min","content":"Objetos de valor e eletrônicos\n\nEm violação de bagagem, objetos de valor e eletrônicos exigem atenção especial: joias, dinheiro, documentos, celulares, câmeras, laptops, tablets, medicamentos e papéis negociáveis podem ter regras restritivas de indenização. O agente deve registrar o relato, orientar documentação e evitar prometer compensação antes da análise.\n\nMaterial de apoio da trilha\n\nAs cartas de recusa e de oferecimento de proposta estão disponíveis no site da Central de\nBagagem. https://sites.google.com/lan.com/centralbaggageofce\nDepois de enviada a proposta e ao fnal de 30 dias da abertura do processo não for possível\nentrar em contato com o passageiro, inserir as tentativas de contato no FF e encerrar o\nprocesso com Reason for Loss - RL 93. O processo deve ser encerrado no sistema somente\nquando estiver solucionado, ou seja, após a negociação, o aceite da proposta pelo\npassageiro e a emissão da compensação fnanceira.\nSe o processo estiver encerrado por falta de contato e o passageiro solicitar\nandamento, devemos dar continuidade ao processo, inserindo todas as informações\nno sistema e alterando o Reason for Loss - RL para 91 ou 92 (não há necessidade\nde reabrir o processo).\n6.5. AUTONOMIA PARA INDENIZAÇÃO DE VIOLAÇÃO\nINDENIZAÇÃO\nOPERAÇÃO companhia aérea\n(EXCETO BRASIL)\nOPERAÇÃO companhia aérea\n(SOMENTE BRASIL)\nEnvio de Proposta\nAeroporto até\nUSD 600\nAeroporto até\nBRL 1.990\nCom nota fscal 100% 100%\nSem nota fscal\n(link ou orçamento)\n50% em Serviços companhia aérea\n25% em Transferência de\ndinheiro\n100 % Serviços companhia aérea\n100% em Transferência de\ndinheiro\nA compensação só deve ser paga com Agente 360 ou Travel Voucher; não são permitidas\ntransferências bancárias usando o fundo fxo do aeroporto. Caso o passageiro não aceite a proposta\nO Formulário de Derivação, deverá ser encaminhado para as áreas responsáveis de acordo\ncom o idioma do passageiro.\n6.6. (VIOLAÇÃO) EXCEÇÃO PARA MALAS DESPACHADAS NA PORTA DA\nAERONAVE\nTIPO DE OBJETO"},{"title":"RL e encerramento","type":"Simulacao","duration":"18 min","content":"RL e encerramento\n\nO encerramento de processo de violação deve considerar o RL correto, o histórico FF, as tentativas de contato, documentação recebida, proposta apresentada, aceite ou recusa do passageiro. O caso só deve ser encerrado quando a tratativa estiver registrada e tecnicamente justificada.\n\nMaterial de apoio da trilha\n\nREGISTRO DE Property\nIrregularity Report - PIR\nINDENIZÁVEL\nObjetos de valor (jóias,\npapéis\nnegociáveis,documentos,\ndinheiro em espécie)\nSIM NÃO\nObjetos eletrônicos, câmeras\nfotográfcas, celulares,\nflmadoras, laptops, tablets,\nSIM SIM\nConvencional (roupa,\ncosméticos, etc)\nSIM SIM\nComo uma forma de controle, devemos inserir o Reason for Loss - RL 95 para esses\ncasos.\""}]$json_bagagem_violada$::jsonb, $mat_bagagem_violada$Definição e prazo

Bagagem violada
"VIOLAÇÃO
6.1. DEFINIÇÃO
Quando é identifcado uma violação na bagagem despachada. Damaged Bag - DPR
(Damage Pilfer) é a sigla do sistema SITA WorldTracer Desktop.
6.2. PRAZO PARA ACEITAÇÃO
O passageiro tem 7 dias a contar da data da chegada do voo para fazer a reclamação em um
dos seguintes canais: Serviço de Bagagem e Contact Center.
Em caso de violações procedentes de extravios, o passageiro tem até 21 dias para efetuar a
reclamação, a partir da data de recebimento da bagagem.
Todas as violações devem ser registradas de imediato, é proibido orientar o passageiro a
fazer a reclamação posteriormente ou em outro aeroporto ou no Contact Center.
6.3. CRITÉRIOS PARA ACEITAÇÃO E REGISTRO DO PROPERTY
IRREGULARITY REPORT - PIR
O passageiro poderá reportar a violação através do Contact Center (conforme aplicável).
TIPO DE OBJETO
REGISTRO DE Property
Irregularity Report - PIR
INDENIZÁVEL
Objetos de valor/eletrônicos
(jóias, papéis negociáveis,
remédios, chaves, câmaras
fotográfcas, celulares,
flmadoras, laptops, tablets,
dinheiro em espécie e etc.)
SIM NÃO
Convencional
(roupa,cosméticos, etc)
SIM SIM
Para casos em que existe a informação e/ou carta que a bagagem foi vistoriada pelo
TSA (""Transportation Security Administration""), deve-se abrir Property Irregularity
Report - PIR normalmente, porém não haverá compensação.
Ao entrar em contato com o Contact Center, o Property Irregularity Report - PIR será
registrado e entregue uma oferta. Se o passageiro fzer a reclamação através dos canais de
atendimento.

---

Aceitacao e documentos

Aceitação, documentos e prazo de reclamação

Na violação de bagagem, a aceitação do caso depende de prazo de reclamação, documentação mínima, evidências, fotos, etiqueta, dados do passageiro e coerência entre relato e ocorrência. Sem esses elementos, a tratativa perde força técnica.

O Contact Center irá registrar o processo como CCELA.
Assim que o passageiro entrar em contato com o Contact Center, ele verifcará toda a
documentação necessária e realizará as análises assim como registrar o processo utilizando
o código CCE. Todos os processos de violação registrados pelo Contact Center serão
compensados e encerrados diretamente por eles. O aeroporto fcará responsável pela
compensação dos processos de violação criados na área do desembarque.
No campo Extra Information - FF, deve constar todas as informações de tratativa com o
cliente. Os documentos para verifcar o número do voo e a entrada da bagagem no sistema são os
seguintes:
1. Cópia do documento de identifcação com foto;
2. Cópia do cartão de embarque ou bilhete;
3. Cópia da etiqueta de bagagem ou comprovante de despacho;
4. Lista dos itens violados e nota fscal (se aplicável).
Caso o passageiro não apresente os itens 3 e 4, o agente deve consultar se há informação
disponível no sistema de check-in. Se não houver forma de comprovar a viagem do
passageiro e o despacho da bagagem, o Property Irregularity Report - PIR não poderá ser
registrado.
6.4. PRAZO PARA ANÁLISE E RESOLUÇÃO
Para caso de objetos de valor/eletrônicos, o agente deve encerrar os casos imediatamente
com Reason for Loss - RL 93 e Fault Station - FS aeroporto anterior ao destino e entregar
Carta de Recusa ao passageiro. Para casos de objetos convencionais, o agente deve enviar
uma proposta até a autonomia do aeroporto e encerrar o processo apenas quando o
passageiro aceitar a proposta de indenização.

---

Objetos de valor

Objetos de valor e eletrônicos

Em violação de bagagem, objetos de valor e eletrônicos exigem atenção especial: joias, dinheiro, documentos, celulares, câmeras, laptops, tablets, medicamentos e papéis negociáveis podem ter regras restritivas de indenização. O agente deve registrar o relato, orientar documentação e evitar prometer compensação antes da análise.

Material de apoio da trilha

As cartas de recusa e de oferecimento de proposta estão disponíveis no site da Central de
Bagagem. https://sites.google.com/lan.com/centralbaggageofce
Depois de enviada a proposta e ao fnal de 30 dias da abertura do processo não for possível
entrar em contato com o passageiro, inserir as tentativas de contato no FF e encerrar o
processo com Reason for Loss - RL 93. O processo deve ser encerrado no sistema somente
quando estiver solucionado, ou seja, após a negociação, o aceite da proposta pelo
passageiro e a emissão da compensação fnanceira.
Se o processo estiver encerrado por falta de contato e o passageiro solicitar
andamento, devemos dar continuidade ao processo, inserindo todas as informações
no sistema e alterando o Reason for Loss - RL para 91 ou 92 (não há necessidade
de reabrir o processo).
6.5. AUTONOMIA PARA INDENIZAÇÃO DE VIOLAÇÃO
INDENIZAÇÃO
OPERAÇÃO companhia aérea
(EXCETO BRASIL)
OPERAÇÃO companhia aérea
(SOMENTE BRASIL)
Envio de Proposta
Aeroporto até
USD 600
Aeroporto até
BRL 1.990
Com nota fscal 100% 100%
Sem nota fscal
(link ou orçamento)
50% em Serviços companhia aérea
25% em Transferência de
dinheiro
100 % Serviços companhia aérea
100% em Transferência de
dinheiro
A compensação só deve ser paga com Agente 360 ou Travel Voucher; não são permitidas
transferências bancárias usando o fundo fxo do aeroporto. Caso o passageiro não aceite a proposta
O Formulário de Derivação, deverá ser encaminhado para as áreas responsáveis de acordo
com o idioma do passageiro.
6.6. (VIOLAÇÃO) EXCEÇÃO PARA MALAS DESPACHADAS NA PORTA DA
AERONAVE
TIPO DE OBJETO

---

RL e encerramento

RL e encerramento

O encerramento de processo de violação deve considerar o RL correto, o histórico FF, as tentativas de contato, documentação recebida, proposta apresentada, aceite ou recusa do passageiro. O caso só deve ser encerrado quando a tratativa estiver registrada e tecnicamente justificada.

Material de apoio da trilha

REGISTRO DE Property
Irregularity Report - PIR
INDENIZÁVEL
Objetos de valor (jóias,
papéis
negociáveis,documentos,
dinheiro em espécie)
SIM NÃO
Objetos eletrônicos, câmeras
fotográfcas, celulares,
flmadoras, laptops, tablets,
SIM SIM
Convencional (roupa,
cosméticos, etc)
SIM SIM
Como uma forma de controle, devemos inserir o Reason for Loss - RL 95 para esses
casos."$mat_bagagem_violada$),
('bagagem-danificada', $json_bagagem_danificada$[{"title":"Definição e aceite","type":"Aula","duration":"18 min","content":"Bagagem danificada\n\"DANIFICAÇÃO - DAMAGED BAG - DPR\n4.1. DEFINIÇÃO\nDano na bagagem despachada. Damaged Bag - DPR (Damage Pilfer) é a sigla do sistema\nSITA Worldtracer Desktop.\nO agente deve ser capaz de identifcar a extensão do dano da bagagem, analisar seu preço\nde mercado e entregar a compensação fnanceira por Agente 360 ou Travel Voucher.\n4.2. PRAZO PARA ACEITAÇÃO\nO passageiro pode registrar a reclamação no desembarque ou em até 7 dias a contar da\ndata da chegada do voo.\nRota doméstica Argentina até 3 dias a contar da data da chegada do voo.\nQuando o passageiro informar a danifcação dentro da área de desembarque, o Property\nIrregularity Report - PIR deve ser aberto imediatamente.\nEm caso de danifcações procedentes de extravios, o passageiro tem até 21 dias\npara efetuar reclamação, a partir da data de recebimento da bagagem, incluindo\ncasos de Delayed Bag - AHL como busca por exceção. Em rota doméstica na\nArgentina, 10 dias desde o recebimento da bagagem.\nO objetivo é apresentar uma solução para o cliente no primeiro contato com a\ncompanhia aérea. O cliente tem direito de abrir o Property Irregularity Report - PIR de\nDamaged Bag - DPR (dano e/ou violação) em qualquer aeroporto com operação\ncompanhia aérea (mesmo que não faça parte de sua rota) ou no Contact Center.\n4.3. CRITÉRIOS PARA ACEITAÇÃO E REGISTRO DO PROPERTY\nIRREGULARITY REPORT - PIR FORA DO AEROPORTO\nAo entrar o passageiro em contato com Contact Center será orientado a enviar os seguintes\ndocumentos para comprovação do embarque:\n1. Cópia de seu documento de identifcação com foto;\n\n2. Cópia de seu cartão de embarque ou bilhete;\n3. Cópia da etiqueta de bagagem ou comprovante de despacho;\n4. Foto que comprove o dano.\nCaso o passageiro não apresente os itens 3 e 4, o agente deve consultar se há informação\ndisponível no sistema de check-in. Se não houver forma de comprovar a viagem do\npassageiro e o despacho da bagagem, o Property Irregularity Report - PIR não poderá ser\nregistrado.\"\n\" Contact Center\nAssim que o passageiro entra em contato com o Contact Center, a equipe verifca toda a\ndocumentação necessária, realiza as análises e registra o processo utilizando a sigla CCE.\nTodos os processos de danifcação registrados pelo Contact Center serão compensados e\nencerrados diretamente por eles. O aeroporto fcará responsável pela compensação dos\nprocessos de danifcação criados na área do desembarque ou na sala do Serviço de\nBagagem. No Extra Information deve constar todas as informações das tratativas feitas com\no passageiro.\nCaso o CCE abra o processo e coloque o Fault Station errado, o aeroporto poderá\nalterá-lo, sem ser necessário fazer contestação. Mas deve avisar a nova base do\nFault Station via e-mail, para que eles tenham ciência da alteração.\n4.4. INSERÇÃO NO SISTEMA SITA WORLDTRACER DESKTOP\nAs danifcações devem ser registradas no sistema SITA Worldtracer Desktop e todos os itens\nmandatórios devem ser preenchidos adequadamente.\n4.4.1. Códigos de danifcação\nO agente de bagagem deve identifcar no campo Damage/Location - TD do sistema SITA\nWorldtracer Desktop qual foi o tipo, a localização e a extensão do dano, conforme tabelas\nabaixo:\n\nELEMENTO LOCALIZAÇÃO EXTENSÃO DO DANO\nCÓDIGO DESCRIÇÃO CÓDIGO DESCRIÇÃO CÓDIGO DESCRIÇÃO\nTOP Superior 1 Alça/Puxador MI Desgaste por\nSIDE Lateral 2 Fechadura/Combinação MA Grande\nEND Onde fca o zíper 3 Buraco TL Total\nBOTT Inferior 4 Rasgo/Rachadura\n5 Arranhão\n6 Pé/ Rodas\n7 Zíper\n8 Tira/Cintas\n9 Armação\n10 Danifcação Total\n11 Mancha\n12 Fecho\n13 Dobradiças\n14 Amassado (Esmagado)\n15 Conteúdo\n16 Outros É obrigatório inserir no sistema SITA WorldTracer Desktop, o código e descrição\npor extenso do dano (campo 'Bag Details - BD'), assim como a marca, tamanho e\no tempo de uso da bagagem, os quais devem ser inseridos no campo Brand\nInformation.\"\n\"Atribuição de Fault Station - FS\nAo abrir um processo de danifcação no sistema, o agente deve preencher o Fault Station -\nFS e o Reason for Loss - RL do PIR:\n● Para voos diretos, o Fault Station será do aeroporto de origem;\n● Para voos com conexão, o Fault Station será o ponto de conexão anterior a base de\nabertura do Property Irregularity Report - PIR (não considerando escalas);\n● Para voos surface o Fault Station deverá ser considerado o anterior ao trecho\nefetuado via terrestre.\nExemplo: o passageiro fez MIA/GRU/CGH/SDUL (surface entre GRU e CGH) e foi\nao serviço de bagagens em CGH para registrar seu caso de dano. O Fault Station\nnesse caso é MIA.\nDESGASTE POR USO DANO MAIOR DANO TOTAL\nCorresponde ao desgaste\npor uso que, por sua\ndimensão ou\ncaracterística, é\nconsiderado consequência\nda manipulação e do\ntransporte normal da\nbagagem, não afetando\nsua funcionalidade.\n● Cantoneiras\n● Detalhes na bagagem\n● Cursor do zíper"},{"title":"Codigos TD","type":"Consulta","duration":"25 min","content":"Códigos TD\n\nOs códigos TD descrevem o dano pela composição de elemento, localização e extensão. Eles ajudam a padronizar registros de alça, roda, zíper, rasgo, buraco, amassado, arranhão, mancha, fecho, dobradiça, armação, conteúdo e outros danos. O TD deve ser compatível com a evidência visual e com o relato do passageiro.\n\nMaterial de apoio da trilha\n\n● Emblema/logomarca\n● Ausência/danifcação\ndo cadeado\n● Alça tiracolo\n● Cravo\n● Sujeira (esteira)\n● Arranhões\n● Pequenos Amassados\n● Capas em geral\n● Chaveiro\n● Pés de apoio\nCorresponde ao dano\nválido que afeta a\nfuncionalidade normal da\nbagagem:\n● Alça\n● Alça retrátil (Trip roll)\n● Rodas\n● Segredo\n● Rasgos que exponham\no conteúdo\n● Trilho do zíper\n● Amassado (até 20 cm)\n● Bagagem com mais de\ndois danos\n● Fibra rachada (até 20\ncm)\nCorresponde a danos\nestruturais:\n● Fibra rachada (acima de\n20 cm);\n● Rasgos (acima de 20\ncm);\n● Amassados (acima de\n20 cm) totalmente\ndestruídos. As ocorrências de desgaste por uso, frágil e bagagem previamente apresentada\nno check-in já danifcada, devem ser registradas somente no Formulário ANAC\nRESO 400, porém não haverá indenização e nenhuma área da companhia aérea fará\ncontato com o cliente. Após o colaborador preencher o formulário, o cliente\nreceberá um número de protocolo e a negativa de indenização. Para acessar o\nformulário.\nAs ocorrências de desgaste por uso, itens frágeis não compensados e​bagagem\npreviamente apresentada no check-in já danifcada serão registradas no\nFormulário de Dano para Bagagem e não haverá compensação.\"\n\"INFORMAÇÃO DA RESERVA E CHECK-IN\nAssim como no Delayed Bag (Delayed Bag - AHL) é obrigatório inserir na área MR dos\nprocessos de Damage Bag (Damaged Bag - DPR) o check-in, a reserva e o bilhete do\npassageiro. Vide procedimento no item 5. 2.4 de Extravio.\n4.7. TIPOS DE DANIFICAÇÃO\n4.7.1. Itens frágeis que devem ser compensados\nDeve-se registrar o Property Irregularity Report - PIR e indenizar os itens abaixo de\n\nacordo com a autonomia do aeroporto.  A compensação será sempre via A360 na\ncompanhia aérea Wallet ou Travel Voucher, SERVIÇOS ou CASH. Solicite ao cliente orçamento de\nconserto do item; caso o conserto não seja possível, solicite a nota fscal. Na ausência\nda nota fscal, solicite pelo menos 03 websites que possam comprovar o valor do item.\nCaso a indenização ultrapasse o valor da autonomia do aeroporto, deverá ser preenchido o\nformulário de derivação para fnalização pelo Contact Center.\n● Bicicleta;\n● Prancha de Surf, Stand Up Paddle, Snowboard;\n● TV ou monitor acima de 40 polegadas;\n● Violoncelo ou Tuba;\n● Ski, Bastões (neve ou aquático);\n● Arco e Flecha;\n● Hóquei;\n● Taco de Golfe;\n● Bodyboard;\n● Kitesurf/kiteboard;\n● Dardo;\n● Equipamento de Mergulho;\n● Pesca;\n● Paraquedas;\n● Contrabaixo;\n● Bumbo;\n● Cadeira de rodas;\n● Carrinho de Bebê ou cadeirinha;\n● Windsurf;\n● Wakeboard/ boogie board/ bodyboard;\n● Waveski;\"\n\" Itens frágeis que não devem ser compensados\nNão devemos registrar PIR para os itens da lista abaixo.\n● Perecível;\n● Caixa térmica;\n● Caixa de ferramenta;\n● Necessaire de maquiagem;\n● Porcelana, cerâmica;\n● Artigos de vidro (espelhos, cristais etc.);\n● Caixas de bebida;\n● Cases de instrumentos musicais;\n● Instrumentos musicais (violão, guitarra, violino, bateria, saxofone, harpa, teclado,\ntrombone, trompete, fauta etc.).\n● Artigos eletrônicos e mecânicos (rádio, amplifcadores, computadores etc.);\n● Equipamentos fotográfcos/cinematográfcos (câmeras fotográfcas, lentes, projetores\netc.);\n● Artigos de precisão (relógios, binóculos, microscópios etc.);\n\n● Skate convencional e elétrico;\n● Patins, patinetes;\n● Esculturas, pinturas, quadros, obras de arte;\n● Produtos Náuticos;\n● Eletrodomésticos (TV ou monitor abaixo de 40 polegadas, Frigobar, micro-ondas\netc.)\nPara os aeroportos do Brasil, o agente deve registrar a reclamação apenas no\nFormulário online Resolução 400 e não haverá compensação.\nPara os aeroportos da Colômbia e Peru, o agente deve registrar a reclamação no\nFormulário online Dano em Bagagem e não haverá compensação.\n4.7.3. Dano de conteúdo\nObjetos dentro da bagagem, não se deve abrir Property Irregularity Report - PIR para\nquaisquer objetos danifcados dentro da bagagem (Ex.: bebidas, shampoo, perfume,\neletrônicos etc.) uma vez que a empresa não se responsabiliza por danos no conteúdo.\n4.7.4. Dano ocasionado por outra bagagem\nNos casos em que a bagagem e/ou seu conteúdo forem molhados de vinho ou água de\npeixe (procedentes de bagagens de outros passageiros), o passageiro deve providenciar a\nlavagem junto a uma lavanderia e enviar a nota para o aeroporto providenciar o reembolso.\nCaso o dano não seja reparado, o aeroporto deve indenizar a(s) peça(s) de acordo com o\nvalor de mercado e a Gerência local deve estar ciente.\"\n\" Dano ocasionado por chuva\nSomente deve-se registrar ocorrência para bagagens molhadas de chuva, se todas as\ncondições abaixo forem atendidas:\n● Quando houver algum conteúdo da bagagem danifcado (ex.: roupas manchadas).\n● Quando o conteúdo danifcado não for caracterizado como eletrônico, visto que este tipo\nde objeto não pode ser transportado em bagagem despachada."},{"title":"Fault Station e RL","type":"Procedimento","duration":"20 min","content":"Fault Station e RL\n\nFault Station indica a estação responsável provável, enquanto RL indica o motivo operacional da perda, dano ou irregularidade. Em DPR, a análise deve observar rota, voo, local de constatação, Limited Release, evidências e histórico para atribuir FS e RL corretamente.\n\nMaterial de apoio da trilha\n\n4.7.6. Dano na bagagem e seu conteúdo\nNos casos em que a bagagem e seu conteúdo forem danifcados e não houver reparo (ex.:\nbagagem danifcada pelo trator), o aeroporto deve listar todo o conteúdo danifcado\n(quantidade, descrição e marca das peças) e informar em Property Irregularity Report - PIR\nmodelo e marca da bagagem.\nO aeroporto deve solucionar o caso aplicando os critérios de indenização por dano.\n4.7.7. Bagagem recebida danifcada\nCasos em que o verso da etiqueta esteja assinado ou a etiqueta amarela LR (Limited\nRelease), pois os colaboradores do check-in identifcaram que a bagagem foi recebida\npreviamente danifcada.\nSe a etiqueta estiver assinada com limited release, deve-se registrar a\nreclamação apenas no formulário online (Resolução ANAC 400) e não haverá\ncompensação.\nPara os aeroportos brasileiros, o agente deve registrar a reclamação apenas no\nFormulário online Resolução 400. Para os aeroportos da Colômbia e do Peru,\nvocê deve registrar a reclamação no Formulário de Danos à Bagagem\n4.7.8. Danifcação de cadeira de rodas e equipamentos de locomoção\nQuando constatada a danifcação na cadeira de rodas do passageiro, o agente deverá:\n● Disponibilizar uma cadeira de rodas da companhia aérea, para os casos em que o passageiro\nnão puder utilizar sua cadeira de rodas até sua residência;\n● Providenciar o aluguel de uma cadeira de rodas dentro de 48 horas, para que o\npassageiro possa utilizar enquanto providenciamos o reparo ou compra de uma\ncadeira de rodas nova;\n● Assim que a cadeira alugada for providenciada, o passageiro deve devolver a cadeira\nde rodas companhia aérea;\n\n● Em caso de conserto, solicitar ao passageiro o orçamento e reembolsar 100% até\nautonomia do aeroporto;\n● Em caso de compra, solicitar orçamento da nova cadeira de rodas;\n● Se o valor de compra ou conserto ultrapassar a autonomia do aeroporto, o aeroporto\ndeve encaminhar o processo para o Contact Center (conforme aplicável).\"\n\"DANIFICAÇÃO DE BAGAGEM DE TRIPULANTE A SERVIÇO\n4.8.1. companhia aérea\nDeve ser aberto Property Irregularity Report - PIR no sistema SITA WorldTracer Desktop e\nfornecer uma cópia ao tripulante para que o mesmo apresente no setor de UNIFORMES.\nÉ obrigatório descrever o tipo de dano como, por exemplo, rasgo na lateral, zíper e rodinha\ndanifcados.\n4.8.2. Voos operados por companhia aérea Brasil\nDeve ser aberto somente Property Irregularity Report - PIR manual e fornecer uma cópia ao\ntripulante para que o mesmo apresente no setor de UNIFORMES.\nÉ obrigatório descrever o tipo de dano como, por exemplo, rasgo na lateral, zíper e rodinha\ndanifcados.\nNão se deve abrir Property Irregularity Report - PIR para tripulantes em viagens pessoais\nque estejam utilizando a mala da companhia aérea, pois seu uso é exclusivo para quando estiver em\nserviço.\n4.9. PRAZO PARA RESOLUÇÃO DA DANIFICAÇÃO\nOs processos de danifcação devem ser solucionados diretamente no desembarque. Ao\nformalizar uma reclamação de danifcação no desembarque, o agente deverá imediatamente\noferecer a compensação conforme tabela por tipo de dano. Os processos devem ser\nencerrados no sistema somente quando estiverem solucionados, ou seja, após a negociação\n\ne emissão da compensação fnanceira, emitida no A360 ou PRS.\n4.10. TABELA DE COMPENSAÇÃO POR TIPO DE DANO\nA tabela deve ser utilizada apenas para bagagens convencionais.\nPRS (Travel Voucher) Agente 360 (companhia aérea Wallet)\nRL TIPO CASH SERVIÇOS CASH SERVIÇOS\nRL 81\nDano maior\n(agente)\n30 USD 40 USD 30 USD / 187 BRL 40 USD / 249 BRL\nDano maior\n(supervisor)\n50 USD 70 USD 50 USD / 312 BRL 70 USD / 436 BRL\nRL 82\nDano total\n(agente)\n60 USD 90 USD 60 USD / 374 BRL 90 USD / 561 BRL\nDano total\n(supervisor)\n120 USD 170 USD 120 USD / 748 BRL 170 USD / 1059 BRL Teto máximo para os aeroportos/Autonomia de Supervisor 600 USD/3737 BRL Não haverá distinção de ofertas para clientes HVC.\nIMPORTANTE: A emissão de qualquer tipo de compensação de bagagem, em\nbenefício próprio é proibido e acarretará investigação e medidas disciplinares severas.\nOu seja, o Staf que está em viagem a trabalho ou lazer, tem direito de abrir Property\nIrregularity Report - PIR e também tem direito de receber ofertas de compensação,\nporém este colaborador não poderá fazer a emissão da sua própria compensação.\n4.10.1. Oferta da compensação\n● Determinar o tipo de dano e oferecer a compensação correspondente;\n● As propostas podem ser feitas com CASH ou Serviços companhia aérea;\n● Se o cliente tiver mais de uma mala danifcada, o valor da oferta deve ser somado;\n● Somente a supervisão ou liderança poderá oferecer o valor da segunda oferta;\n● Caso o cliente não aceite a segunda oferta, o caso deverá ser derivado. Clique aqui,\npara acessar o Formulário derivação;"},{"title":"Limited Release","type":"Procedimento","duration":"20 min","content":"● Os processos devem ser encerrados somente quando estiverem solucionados.\nEm alguns casos, para emissão de compensação fnanceira via PRS (Travel Voucher),\nquando o cliente escolher a compensação em CASH, devemos emitir o TV com ambos os\ncampos, CASH e SERVIÇOS, preenchidos de acordo com a tabela. Por exemplo: o cliente\naceitou 30 USD em CASH, então na emissão do TV, fcará preenchido com 30 USD em\nCASH e 40 USD em SERVIÇOS. Já no sistema A360, devemos emitir a compensação\nfnanceira de forma específca, em relação ao valor e natureza. Ou seja, se o cliente aceitou\n30 USD em CASH, devemos fazer a emissão com esse valor e natureza, para que ele receba\nna sua companhia aérea Wallet. Veja abaixo alguns exemplos de emissão da compensação fnanceira:\nExemplo 1: o cliente apresenta uma bagagem com a alça danifcada (dano maior). O agente\noferece a primeira oferta (30 USD em CASH ou 40 USD em Serviços companhia aérea). O cliente aceita a\nprimeira oferta em CASH.\nAgente 360 (companhia aérea Wallet) PRS (Travel Voucher)\nO agente deve emitir a compensação fnanceira\nde 30 USD em CASH, de acordo com a\nescolha do cliente.\nO agente deve imediatamente emitir o Travel\nVoucher, inserindo no campo 30 USD em\nCASH e 40 USD no campo SERVIÇOS.\nExemplo 2: o cliente apresenta uma bagagem com fbra rachada (dano total). O agente oferece\na primeira oferta (60 USD em CASH ou 90 USD em SERVIÇO). O cliente recusa a oferta. O\nagente então aciona o supervisor/líder, que analisa e entende que pelo valor da bagagem\ncorresponde entregar a segunda oferta (120 USD em CASH ou 170 USD em SERVIÇO). O\n\ncliente aceita a segunda oferta em SERVIÇOS (170 USD).\nAgente 360 (companhia aérea Wallet) PRS (Travel Voucher)\nO agente deve emitir a compensação fnanceira\nde 170 USD em SERVIÇOS, de acordo com a\nescolha do cliente.\nO agente deve imediatamente emitir o Travel\nVoucher, inserindo 1 USD no campo CASH170\nUSD no campo SERVIÇOS.\"\n\"LIMITED RELEASE\nCom o objetivo de unifcar o processo de registro de Limited Release, as posições de\ncheck-in dos aeroportos de origem passarão a registrar no sistema BRS (SmartSuite) todas\nas bagagens que forem entregues já danifcadas pelo cliente (etiqueta Limited Release), seja\nno autoatendimento ou nos balcões de check-in.\n1) Foto (nítida) da etiqueta com o dano assinalado e assinada pelo passageiro:\n2) Foto (nítida) do dano da bagagem:\nAs fotos fcarão registradas no sistema BRS (SmartSuite) e podem ser visualizadas por todos\nos aeroportos e canais de atendimento.\"\n\"CRITÉRIOS PARA ACEITAÇÃO E REGISTRO DO PROPERTY\nIRREGULARITY REPORT - PIR\nAntes de registrar uma reclamação de dano no sistema SITA WorldTracer Desktop, o agente\ndeve consultar o número da etiqueta de bagagem no sistema BRS (SmartSuite). A pesquisa\ntambém pode ser feita pelo PNR (código da reserva) ou nome do cliente.\nVeja abaixo o passo a passo:\n1. Consulta da bagagem no Global Search: Ao confrmar que o dano registrado em Limited Release se trata do mesmo reclamado\npelo passageiro, o agente deverá clicar, na parte superior da tela, em “Ações” e depois em\n“Negar Compensação”.\nCom a versão 20 do sistema Smartsuite, essa nova funcionalidade (válida desde 05 de\n\ndezembro de 2024) servirá como indicador para mensurar a nossa efcácia no registro de\nLimited Release e também para que outros aeroportos e demais áreas tenham o histórico de\nnegativa de compensação.\n4. Selecione o aeroporto no ponto de registro da informação: 5. Clique em “Negar Compensação”:\nAo concluir a ação o sistema deverá apresentar a mensagem de “Compensação negada com\nsucesso”. A ação será registrada no histórico da etiqueta e fcará visível para as demais áreas.\nApós consultar o BRS, se houver a foto da etiqueta (com sinalização do dano) assinada\ne do dano na bagagem, o Property Irregularity Report - PIR não deverá ser registrado.\nAlém do procedimento de “negar compensação” no sistema Smartsuite, deve ser feito:\nA) No Brasil, poderá ser aberta uma reclamação no formulário da Resolução 400;\nB) Colômbia e Peru, \"\"formulário online de daños en equipajes\"\" (sem\ncompensação).\nExemplo 01: o agente de bagagem ao consultar a etiqueta no sistema SmartSuite,\nidentifca o registro de Limited Release, porém para um dano diferente do reclamado\npelo passageiro. Nesse caso não se deve considerar a ação de “Negar\nCompensação” e o agente deve seguir com o registro de danifcação no sistema\nWorldTracer (ou seja, registra o PIR).\nExemplo 02: o agente de bagagem ao consultar a etiqueta no sistema SmartSuite,\nidentifca o registro de Limited Release para o mesmo dano que está reclamando o\npassageiro. Nesse caso se deve considerar a ação “Negar Compensação”, a fm de\nque fque registrada a negativa de abertura de reclamação, além de não se\nconsiderar o registro no WorldTracer."},{"title":"Compensacao","type":"Simulacao","duration":"24 min","content":"Exemplo 03: o agente de bagagem ao consultar a etiqueta no sistema SmartSuite,\nnão identifca registro de Limited Release para aquela etiqueta. Nesse caso, o agente\nnão deve utilizar a ação “Negar Compensação” e deve prosseguir com a abertura de\nregistro de danifcação no sistema WorldTracer (ou seja, registra o PIR).\""}]$json_bagagem_danificada$::jsonb, $mat_bagagem_danificada$Definição e aceite

Bagagem danificada
"DANIFICAÇÃO - DAMAGED BAG - DPR
4.1. DEFINIÇÃO
Dano na bagagem despachada. Damaged Bag - DPR (Damage Pilfer) é a sigla do sistema
SITA Worldtracer Desktop.
O agente deve ser capaz de identifcar a extensão do dano da bagagem, analisar seu preço
de mercado e entregar a compensação fnanceira por Agente 360 ou Travel Voucher.
4.2. PRAZO PARA ACEITAÇÃO
O passageiro pode registrar a reclamação no desembarque ou em até 7 dias a contar da
data da chegada do voo.
Rota doméstica Argentina até 3 dias a contar da data da chegada do voo.
Quando o passageiro informar a danifcação dentro da área de desembarque, o Property
Irregularity Report - PIR deve ser aberto imediatamente.
Em caso de danifcações procedentes de extravios, o passageiro tem até 21 dias
para efetuar reclamação, a partir da data de recebimento da bagagem, incluindo
casos de Delayed Bag - AHL como busca por exceção. Em rota doméstica na
Argentina, 10 dias desde o recebimento da bagagem.
O objetivo é apresentar uma solução para o cliente no primeiro contato com a
companhia aérea. O cliente tem direito de abrir o Property Irregularity Report - PIR de
Damaged Bag - DPR (dano e/ou violação) em qualquer aeroporto com operação
companhia aérea (mesmo que não faça parte de sua rota) ou no Contact Center.
4.3. CRITÉRIOS PARA ACEITAÇÃO E REGISTRO DO PROPERTY
IRREGULARITY REPORT - PIR FORA DO AEROPORTO
Ao entrar o passageiro em contato com Contact Center será orientado a enviar os seguintes
documentos para comprovação do embarque:
1. Cópia de seu documento de identifcação com foto;

2. Cópia de seu cartão de embarque ou bilhete;
3. Cópia da etiqueta de bagagem ou comprovante de despacho;
4. Foto que comprove o dano.
Caso o passageiro não apresente os itens 3 e 4, o agente deve consultar se há informação
disponível no sistema de check-in. Se não houver forma de comprovar a viagem do
passageiro e o despacho da bagagem, o Property Irregularity Report - PIR não poderá ser
registrado."
" Contact Center
Assim que o passageiro entra em contato com o Contact Center, a equipe verifca toda a
documentação necessária, realiza as análises e registra o processo utilizando a sigla CCE.
Todos os processos de danifcação registrados pelo Contact Center serão compensados e
encerrados diretamente por eles. O aeroporto fcará responsável pela compensação dos
processos de danifcação criados na área do desembarque ou na sala do Serviço de
Bagagem. No Extra Information deve constar todas as informações das tratativas feitas com
o passageiro.
Caso o CCE abra o processo e coloque o Fault Station errado, o aeroporto poderá
alterá-lo, sem ser necessário fazer contestação. Mas deve avisar a nova base do
Fault Station via e-mail, para que eles tenham ciência da alteração.
4.4. INSERÇÃO NO SISTEMA SITA WORLDTRACER DESKTOP
As danifcações devem ser registradas no sistema SITA Worldtracer Desktop e todos os itens
mandatórios devem ser preenchidos adequadamente.
4.4.1. Códigos de danifcação
O agente de bagagem deve identifcar no campo Damage/Location - TD do sistema SITA
Worldtracer Desktop qual foi o tipo, a localização e a extensão do dano, conforme tabelas
abaixo:

ELEMENTO LOCALIZAÇÃO EXTENSÃO DO DANO
CÓDIGO DESCRIÇÃO CÓDIGO DESCRIÇÃO CÓDIGO DESCRIÇÃO
TOP Superior 1 Alça/Puxador MI Desgaste por
SIDE Lateral 2 Fechadura/Combinação MA Grande
END Onde fca o zíper 3 Buraco TL Total
BOTT Inferior 4 Rasgo/Rachadura
5 Arranhão
6 Pé/ Rodas
7 Zíper
8 Tira/Cintas
9 Armação
10 Danifcação Total
11 Mancha
12 Fecho
13 Dobradiças
14 Amassado (Esmagado)
15 Conteúdo
16 Outros É obrigatório inserir no sistema SITA WorldTracer Desktop, o código e descrição
por extenso do dano (campo 'Bag Details - BD'), assim como a marca, tamanho e
o tempo de uso da bagagem, os quais devem ser inseridos no campo Brand
Information."
"Atribuição de Fault Station - FS
Ao abrir um processo de danifcação no sistema, o agente deve preencher o Fault Station -
FS e o Reason for Loss - RL do PIR:
● Para voos diretos, o Fault Station será do aeroporto de origem;
● Para voos com conexão, o Fault Station será o ponto de conexão anterior a base de
abertura do Property Irregularity Report - PIR (não considerando escalas);
● Para voos surface o Fault Station deverá ser considerado o anterior ao trecho
efetuado via terrestre.
Exemplo: o passageiro fez MIA/GRU/CGH/SDUL (surface entre GRU e CGH) e foi
ao serviço de bagagens em CGH para registrar seu caso de dano. O Fault Station
nesse caso é MIA.
DESGASTE POR USO DANO MAIOR DANO TOTAL
Corresponde ao desgaste
por uso que, por sua
dimensão ou
característica, é
considerado consequência
da manipulação e do
transporte normal da
bagagem, não afetando
sua funcionalidade.
● Cantoneiras
● Detalhes na bagagem
● Cursor do zíper

---

Codigos TD

Códigos TD

Os códigos TD descrevem o dano pela composição de elemento, localização e extensão. Eles ajudam a padronizar registros de alça, roda, zíper, rasgo, buraco, amassado, arranhão, mancha, fecho, dobradiça, armação, conteúdo e outros danos. O TD deve ser compatível com a evidência visual e com o relato do passageiro.

Material de apoio da trilha

● Emblema/logomarca
● Ausência/danifcação
do cadeado
● Alça tiracolo
● Cravo
● Sujeira (esteira)
● Arranhões
● Pequenos Amassados
● Capas em geral
● Chaveiro
● Pés de apoio
Corresponde ao dano
válido que afeta a
funcionalidade normal da
bagagem:
● Alça
● Alça retrátil (Trip roll)
● Rodas
● Segredo
● Rasgos que exponham
o conteúdo
● Trilho do zíper
● Amassado (até 20 cm)
● Bagagem com mais de
dois danos
● Fibra rachada (até 20
cm)
Corresponde a danos
estruturais:
● Fibra rachada (acima de
20 cm);
● Rasgos (acima de 20
cm);
● Amassados (acima de
20 cm) totalmente
destruídos. As ocorrências de desgaste por uso, frágil e bagagem previamente apresentada
no check-in já danifcada, devem ser registradas somente no Formulário ANAC
RESO 400, porém não haverá indenização e nenhuma área da companhia aérea fará
contato com o cliente. Após o colaborador preencher o formulário, o cliente
receberá um número de protocolo e a negativa de indenização. Para acessar o
formulário.
As ocorrências de desgaste por uso, itens frágeis não compensados e​bagagem
previamente apresentada no check-in já danifcada serão registradas no
Formulário de Dano para Bagagem e não haverá compensação."
"INFORMAÇÃO DA RESERVA E CHECK-IN
Assim como no Delayed Bag (Delayed Bag - AHL) é obrigatório inserir na área MR dos
processos de Damage Bag (Damaged Bag - DPR) o check-in, a reserva e o bilhete do
passageiro. Vide procedimento no item 5. 2.4 de Extravio.
4.7. TIPOS DE DANIFICAÇÃO
4.7.1. Itens frágeis que devem ser compensados
Deve-se registrar o Property Irregularity Report - PIR e indenizar os itens abaixo de

acordo com a autonomia do aeroporto.  A compensação será sempre via A360 na
companhia aérea Wallet ou Travel Voucher, SERVIÇOS ou CASH. Solicite ao cliente orçamento de
conserto do item; caso o conserto não seja possível, solicite a nota fscal. Na ausência
da nota fscal, solicite pelo menos 03 websites que possam comprovar o valor do item.
Caso a indenização ultrapasse o valor da autonomia do aeroporto, deverá ser preenchido o
formulário de derivação para fnalização pelo Contact Center.
● Bicicleta;
● Prancha de Surf, Stand Up Paddle, Snowboard;
● TV ou monitor acima de 40 polegadas;
● Violoncelo ou Tuba;
● Ski, Bastões (neve ou aquático);
● Arco e Flecha;
● Hóquei;
● Taco de Golfe;
● Bodyboard;
● Kitesurf/kiteboard;
● Dardo;
● Equipamento de Mergulho;
● Pesca;
● Paraquedas;
● Contrabaixo;
● Bumbo;
● Cadeira de rodas;
● Carrinho de Bebê ou cadeirinha;
● Windsurf;
● Wakeboard/ boogie board/ bodyboard;
● Waveski;"
" Itens frágeis que não devem ser compensados
Não devemos registrar PIR para os itens da lista abaixo.
● Perecível;
● Caixa térmica;
● Caixa de ferramenta;
● Necessaire de maquiagem;
● Porcelana, cerâmica;
● Artigos de vidro (espelhos, cristais etc.);
● Caixas de bebida;
● Cases de instrumentos musicais;
● Instrumentos musicais (violão, guitarra, violino, bateria, saxofone, harpa, teclado,
trombone, trompete, fauta etc.).
● Artigos eletrônicos e mecânicos (rádio, amplifcadores, computadores etc.);
● Equipamentos fotográfcos/cinematográfcos (câmeras fotográfcas, lentes, projetores
etc.);
● Artigos de precisão (relógios, binóculos, microscópios etc.);

● Skate convencional e elétrico;
● Patins, patinetes;
● Esculturas, pinturas, quadros, obras de arte;
● Produtos Náuticos;
● Eletrodomésticos (TV ou monitor abaixo de 40 polegadas, Frigobar, micro-ondas
etc.)
Para os aeroportos do Brasil, o agente deve registrar a reclamação apenas no
Formulário online Resolução 400 e não haverá compensação.
Para os aeroportos da Colômbia e Peru, o agente deve registrar a reclamação no
Formulário online Dano em Bagagem e não haverá compensação.
4.7.3. Dano de conteúdo
Objetos dentro da bagagem, não se deve abrir Property Irregularity Report - PIR para
quaisquer objetos danifcados dentro da bagagem (Ex.: bebidas, shampoo, perfume,
eletrônicos etc.) uma vez que a empresa não se responsabiliza por danos no conteúdo.
4.7.4. Dano ocasionado por outra bagagem
Nos casos em que a bagagem e/ou seu conteúdo forem molhados de vinho ou água de
peixe (procedentes de bagagens de outros passageiros), o passageiro deve providenciar a
lavagem junto a uma lavanderia e enviar a nota para o aeroporto providenciar o reembolso.
Caso o dano não seja reparado, o aeroporto deve indenizar a(s) peça(s) de acordo com o
valor de mercado e a Gerência local deve estar ciente."
" Dano ocasionado por chuva
Somente deve-se registrar ocorrência para bagagens molhadas de chuva, se todas as
condições abaixo forem atendidas:
● Quando houver algum conteúdo da bagagem danifcado (ex.: roupas manchadas).
● Quando o conteúdo danifcado não for caracterizado como eletrônico, visto que este tipo
de objeto não pode ser transportado em bagagem despachada.

---

Fault Station e RL

Fault Station e RL

Fault Station indica a estação responsável provável, enquanto RL indica o motivo operacional da perda, dano ou irregularidade. Em DPR, a análise deve observar rota, voo, local de constatação, Limited Release, evidências e histórico para atribuir FS e RL corretamente.

Material de apoio da trilha

4.7.6. Dano na bagagem e seu conteúdo
Nos casos em que a bagagem e seu conteúdo forem danifcados e não houver reparo (ex.:
bagagem danifcada pelo trator), o aeroporto deve listar todo o conteúdo danifcado
(quantidade, descrição e marca das peças) e informar em Property Irregularity Report - PIR
modelo e marca da bagagem.
O aeroporto deve solucionar o caso aplicando os critérios de indenização por dano.
4.7.7. Bagagem recebida danifcada
Casos em que o verso da etiqueta esteja assinado ou a etiqueta amarela LR (Limited
Release), pois os colaboradores do check-in identifcaram que a bagagem foi recebida
previamente danifcada.
Se a etiqueta estiver assinada com limited release, deve-se registrar a
reclamação apenas no formulário online (Resolução ANAC 400) e não haverá
compensação.
Para os aeroportos brasileiros, o agente deve registrar a reclamação apenas no
Formulário online Resolução 400. Para os aeroportos da Colômbia e do Peru,
você deve registrar a reclamação no Formulário de Danos à Bagagem
4.7.8. Danifcação de cadeira de rodas e equipamentos de locomoção
Quando constatada a danifcação na cadeira de rodas do passageiro, o agente deverá:
● Disponibilizar uma cadeira de rodas da companhia aérea, para os casos em que o passageiro
não puder utilizar sua cadeira de rodas até sua residência;
● Providenciar o aluguel de uma cadeira de rodas dentro de 48 horas, para que o
passageiro possa utilizar enquanto providenciamos o reparo ou compra de uma
cadeira de rodas nova;
● Assim que a cadeira alugada for providenciada, o passageiro deve devolver a cadeira
de rodas companhia aérea;

● Em caso de conserto, solicitar ao passageiro o orçamento e reembolsar 100% até
autonomia do aeroporto;
● Em caso de compra, solicitar orçamento da nova cadeira de rodas;
● Se o valor de compra ou conserto ultrapassar a autonomia do aeroporto, o aeroporto
deve encaminhar o processo para o Contact Center (conforme aplicável)."
"DANIFICAÇÃO DE BAGAGEM DE TRIPULANTE A SERVIÇO
4.8.1. companhia aérea
Deve ser aberto Property Irregularity Report - PIR no sistema SITA WorldTracer Desktop e
fornecer uma cópia ao tripulante para que o mesmo apresente no setor de UNIFORMES.
É obrigatório descrever o tipo de dano como, por exemplo, rasgo na lateral, zíper e rodinha
danifcados.
4.8.2. Voos operados por companhia aérea Brasil
Deve ser aberto somente Property Irregularity Report - PIR manual e fornecer uma cópia ao
tripulante para que o mesmo apresente no setor de UNIFORMES.
É obrigatório descrever o tipo de dano como, por exemplo, rasgo na lateral, zíper e rodinha
danifcados.
Não se deve abrir Property Irregularity Report - PIR para tripulantes em viagens pessoais
que estejam utilizando a mala da companhia aérea, pois seu uso é exclusivo para quando estiver em
serviço.
4.9. PRAZO PARA RESOLUÇÃO DA DANIFICAÇÃO
Os processos de danifcação devem ser solucionados diretamente no desembarque. Ao
formalizar uma reclamação de danifcação no desembarque, o agente deverá imediatamente
oferecer a compensação conforme tabela por tipo de dano. Os processos devem ser
encerrados no sistema somente quando estiverem solucionados, ou seja, após a negociação

e emissão da compensação fnanceira, emitida no A360 ou PRS.
4.10. TABELA DE COMPENSAÇÃO POR TIPO DE DANO
A tabela deve ser utilizada apenas para bagagens convencionais.
PRS (Travel Voucher) Agente 360 (companhia aérea Wallet)
RL TIPO CASH SERVIÇOS CASH SERVIÇOS
RL 81
Dano maior
(agente)
30 USD 40 USD 30 USD / 187 BRL 40 USD / 249 BRL
Dano maior
(supervisor)
50 USD 70 USD 50 USD / 312 BRL 70 USD / 436 BRL
RL 82
Dano total
(agente)
60 USD 90 USD 60 USD / 374 BRL 90 USD / 561 BRL
Dano total
(supervisor)
120 USD 170 USD 120 USD / 748 BRL 170 USD / 1059 BRL Teto máximo para os aeroportos/Autonomia de Supervisor 600 USD/3737 BRL Não haverá distinção de ofertas para clientes HVC.
IMPORTANTE: A emissão de qualquer tipo de compensação de bagagem, em
benefício próprio é proibido e acarretará investigação e medidas disciplinares severas.
Ou seja, o Staf que está em viagem a trabalho ou lazer, tem direito de abrir Property
Irregularity Report - PIR e também tem direito de receber ofertas de compensação,
porém este colaborador não poderá fazer a emissão da sua própria compensação.
4.10.1. Oferta da compensação
● Determinar o tipo de dano e oferecer a compensação correspondente;
● As propostas podem ser feitas com CASH ou Serviços companhia aérea;
● Se o cliente tiver mais de uma mala danifcada, o valor da oferta deve ser somado;
● Somente a supervisão ou liderança poderá oferecer o valor da segunda oferta;
● Caso o cliente não aceite a segunda oferta, o caso deverá ser derivado. Clique aqui,
para acessar o Formulário derivação;

---

Limited Release

● Os processos devem ser encerrados somente quando estiverem solucionados.
Em alguns casos, para emissão de compensação fnanceira via PRS (Travel Voucher),
quando o cliente escolher a compensação em CASH, devemos emitir o TV com ambos os
campos, CASH e SERVIÇOS, preenchidos de acordo com a tabela. Por exemplo: o cliente
aceitou 30 USD em CASH, então na emissão do TV, fcará preenchido com 30 USD em
CASH e 40 USD em SERVIÇOS. Já no sistema A360, devemos emitir a compensação
fnanceira de forma específca, em relação ao valor e natureza. Ou seja, se o cliente aceitou
30 USD em CASH, devemos fazer a emissão com esse valor e natureza, para que ele receba
na sua companhia aérea Wallet. Veja abaixo alguns exemplos de emissão da compensação fnanceira:
Exemplo 1: o cliente apresenta uma bagagem com a alça danifcada (dano maior). O agente
oferece a primeira oferta (30 USD em CASH ou 40 USD em Serviços companhia aérea). O cliente aceita a
primeira oferta em CASH.
Agente 360 (companhia aérea Wallet) PRS (Travel Voucher)
O agente deve emitir a compensação fnanceira
de 30 USD em CASH, de acordo com a
escolha do cliente.
O agente deve imediatamente emitir o Travel
Voucher, inserindo no campo 30 USD em
CASH e 40 USD no campo SERVIÇOS.
Exemplo 2: o cliente apresenta uma bagagem com fbra rachada (dano total). O agente oferece
a primeira oferta (60 USD em CASH ou 90 USD em SERVIÇO). O cliente recusa a oferta. O
agente então aciona o supervisor/líder, que analisa e entende que pelo valor da bagagem
corresponde entregar a segunda oferta (120 USD em CASH ou 170 USD em SERVIÇO). O

cliente aceita a segunda oferta em SERVIÇOS (170 USD).
Agente 360 (companhia aérea Wallet) PRS (Travel Voucher)
O agente deve emitir a compensação fnanceira
de 170 USD em SERVIÇOS, de acordo com a
escolha do cliente.
O agente deve imediatamente emitir o Travel
Voucher, inserindo 1 USD no campo CASH170
USD no campo SERVIÇOS."
"LIMITED RELEASE
Com o objetivo de unifcar o processo de registro de Limited Release, as posições de
check-in dos aeroportos de origem passarão a registrar no sistema BRS (SmartSuite) todas
as bagagens que forem entregues já danifcadas pelo cliente (etiqueta Limited Release), seja
no autoatendimento ou nos balcões de check-in.
1) Foto (nítida) da etiqueta com o dano assinalado e assinada pelo passageiro:
2) Foto (nítida) do dano da bagagem:
As fotos fcarão registradas no sistema BRS (SmartSuite) e podem ser visualizadas por todos
os aeroportos e canais de atendimento."
"CRITÉRIOS PARA ACEITAÇÃO E REGISTRO DO PROPERTY
IRREGULARITY REPORT - PIR
Antes de registrar uma reclamação de dano no sistema SITA WorldTracer Desktop, o agente
deve consultar o número da etiqueta de bagagem no sistema BRS (SmartSuite). A pesquisa
também pode ser feita pelo PNR (código da reserva) ou nome do cliente.
Veja abaixo o passo a passo:
1. Consulta da bagagem no Global Search: Ao confrmar que o dano registrado em Limited Release se trata do mesmo reclamado
pelo passageiro, o agente deverá clicar, na parte superior da tela, em “Ações” e depois em
“Negar Compensação”.
Com a versão 20 do sistema Smartsuite, essa nova funcionalidade (válida desde 05 de

dezembro de 2024) servirá como indicador para mensurar a nossa efcácia no registro de
Limited Release e também para que outros aeroportos e demais áreas tenham o histórico de
negativa de compensação.
4. Selecione o aeroporto no ponto de registro da informação: 5. Clique em “Negar Compensação”:
Ao concluir a ação o sistema deverá apresentar a mensagem de “Compensação negada com
sucesso”. A ação será registrada no histórico da etiqueta e fcará visível para as demais áreas.
Após consultar o BRS, se houver a foto da etiqueta (com sinalização do dano) assinada
e do dano na bagagem, o Property Irregularity Report - PIR não deverá ser registrado.
Além do procedimento de “negar compensação” no sistema Smartsuite, deve ser feito:
A) No Brasil, poderá ser aberta uma reclamação no formulário da Resolução 400;
B) Colômbia e Peru, ""formulário online de daños en equipajes"" (sem
compensação).
Exemplo 01: o agente de bagagem ao consultar a etiqueta no sistema SmartSuite,
identifca o registro de Limited Release, porém para um dano diferente do reclamado
pelo passageiro. Nesse caso não se deve considerar a ação de “Negar
Compensação” e o agente deve seguir com o registro de danifcação no sistema
WorldTracer (ou seja, registra o PIR).
Exemplo 02: o agente de bagagem ao consultar a etiqueta no sistema SmartSuite,
identifca o registro de Limited Release para o mesmo dano que está reclamando o
passageiro. Nesse caso se deve considerar a ação “Negar Compensação”, a fm de
que fque registrada a negativa de abertura de reclamação, além de não se
considerar o registro no WorldTracer.

---

Compensacao

Exemplo 03: o agente de bagagem ao consultar a etiqueta no sistema SmartSuite,
não identifca registro de Limited Release para aquela etiqueta. Nesse caso, o agente
não deve utilizar a ação “Negar Compensação” e deve prosseguir com a abertura de
registro de danifcação no sistema WorldTracer (ou seja, registra o PIR)."$mat_bagagem_danificada$),
('tratativa-rl-mct', $json_tratativa_rl_mct$[{"title":"Conceito de RL","type":"Aula","duration":"18 min","content":"O que é tratativa de bagagem\n\nTratativa de bagagem é o conjunto de análises, decisões e registros feitos depois que uma irregularidade é identificada: extravio, atraso, conexão perdida, bagagem sem etiqueta, danificação, violação ou falha operacional. A tratativa correta não é apenas escolher um código. Ela exige entender o fato gerador, identificar a área envolvida, registrar evidências, orientar o passageiro e manter o processo tecnicamente consistente até o encerramento.\n\nO que é o RL (Reason for Loss) no WorldTracer?\nO RL (Reason for Loss) é um código numérico padronizado internacionalmente utilizado no sistema WorldTracer para indicar a causa do extravio, atraso ou dano de uma bagagem. Cada código RL ajuda a classificar corretamente a ocorrência e direcionar as ações de investigação e tratativa da bagagem.\n\nEsses códigos são essenciais para:\n\n1) Identificação rápida da causa do problema.\n\n2) Adoção de ações corretivas específicas.\n\n3) Análise estatística de causas recorrentes.\n\n4) Melhor atendimento ao passageiro.\"\n\"\n\nComo o agente deve usar o RL na prática\n\nO RL deve ser escolhido após a leitura completa do cenário operacional. Antes de selecionar o código, o agente precisa verificar: rota do passageiro, voo e data, etiqueta de bagagem, tempo de conexão, mensagens do WorldTracer, histórico da ocorrência, informações de rampa, eventual reitineração, registros de triagem, retenção por autoridade ou conteúdo não permitido, e se houve dano ou violação.\n\nO objetivo da tratativa é responder três perguntas:\n\n1. Onde a falha provavelmente ocorreu?\n2. Qual área ou etapa operacional está relacionada ao fato?\n3. Qual ação deve ser tomada para localizar, encaminhar, compensar, encerrar ou corrigir o processo?\n\nBoas práticas de registro\n\nUse informações objetivas no histórico do processo. Evite conclusões sem evidência. Registre contatos com passageiro, mensagens enviadas, consultas realizadas, respostas de outras bases, tentativa de localização, decisão de encerramento e motivo do RL aplicado. Um processo bem registrado facilita a continuidade por outro agente e reduz erro de tratativa."},{"title":"Grupos de RL","type":"Consulta","duration":"30 min","content":"Grupos de RL como consulta operacional\n\nOs grupos 10, 20, 30, 40, 50, 60, 70, 80 e 90 organizam causas semelhantes. Eles não são, por si só, o RL final. O primeiro número indica o grupo, e o segundo número indica o motivo específico. Esta trilha funciona como consulta completa para selecionar o código correto conforme a causa identificada.\n\nExplicações dos códigos de cada Reason for Loss - RL\n\nCÓDIGO\n\nDEFINIÇÃO, EXPLICAÇÃO E EXEMPLO\nOs códigos 10, 20, 30, 40, 50, 60, 70, 80 e 90, não são RLs.\nSão agrupamentos de RLs com a natureza parecida.\nO primeiro número de cada RL, indica a que grupo pertence.\n\n10 GRUPO DE RL: BASE DE ORIGEM – CHECK‐IN ÁREA\nRL11 ETIQUETA AUTOMATIZADA IMPRESSA INCORRETAMENTE, BORRADA OU INCOMPLETA (Responsabilidade base responsável pelo check-in) Etiqueta automatizada, impressa para outro voo ou destino, ou quando\nas informações na etiqueta não estão ilegíveis.\nA etiqueta automatizada foi emitida no check-in do aeroporto A, porém\nestá borrada, rasurada ou ilegível. Por este motivo, a bagagem não foi\ncarregada para o aeroporto B ou acabou sendo carregada para o\naeroporto C (que não está na rota do cliente).\n\nRL12 ETIQUETA AUTOMATIZADA IMPRESSA SEM O DESTINO FINAL (Responsabilidade base responsável pelo check-in)\nEtiqueta automatizada, quando o passageiro voava no trecho A/B/C,\n\nporém se etiquetada somente até B.\n\nO passageiro está embarcando do aeroporto A, com conexão no\naeroporto B e destino final aeroporto C. Portanto, a rota seria A/B/C,\nporém a etiqueta automatizada foi emitida somente A/B.\nRL13 ETIQUETA AUTOMATIZADA, IMPRESSA ATÉ O DESTINO FINAL, PORÉM PARA CONTRATOS/TICKETS SEPARADOS (Responsabilidade base responsável pelo check-in)\nO passageiro possuía 1o bilhete no trecho A/B e 2o bilhete no trecho\nB/C. A bagagem foi despachada com etiqueta automatizada de A para\nC, quando deveria ter sido despachada somente até B.\nO passageiro comprou um bilhete com a companhia aérea, do aeroporto A até o\nB. Porém, o cliente tinha outro bilhete com a companhia aérea XYZ, do\naeroporto B até C. Por um erro de sistema ou humano, a etiqueta foi\nemitida com a rota completa A/B/C. Quando o passageiro se\napresentou no aeroporto B, para retirar sua mala e redespachar,\nconforme o seu bilhete da companhia aérea, a bagagem não foi localizada, pois\njá havia sido repassada para a companhia aérea XYZ, ocasionando o\n\nextravio da bagagem\n\nRL15 ETIQUETA AUTOMATIZADA ANEXADA EM BAGAGEM ERRADA NO ATO DO CHECK-IN (Responsabilidade base responsável pelo check-in)\n\nQuando a etiqueta automatizada anexada na bagagem está em nome\n\nde outro passageiro.\n\nQuando o agente reimprime erroneamente a etiqueta automatizada e\nduas bagagens ficam com o mesmo número de etiqueta.\nO passageiro JOSE fez check-in para o aeroporto A. Na hora de\ndespachar a sua bagagem, o colaborador se confundiu e despachou a\nmala em nome de outro cliente, com outro destino.\nUm colaborador de check-in estava atendendo um cliente no balcão e\na impressora parou de funcionar. Quando a impressora voltou a\nfuncionar, ao invés de emitir a etiqueta do cliente que estava sendo atendido, ela reimprimiu a etiqueta do cliente anterior. Além de existir\nduas bagagens diferentes, com a mesma numeração de etiqueta, o\ncliente teve a sua bagagem etiquetada em nome de outro passageiro.\"\n\"RL16 BAGAGEM DESCEU PELA ESTEIRA APÓS ENCERRAMENTO DO CHECK-IN, COM ETIQUETA AUTOMATIZADA (Responsabilidade base responsável pelo check-in)\n\nQuando a bagagem é deixada no check-in, embora corretamente\n\netiquetada.\n\nO passageiro JOSE fez o seu check-in e despachou a sua bagagem às\n09h. O colaborador que fez o seu atendimento, deixou a sua bagagem\nseparada no check-in, mas acabou se esquecendo que o horário de\nencerramento deste voo era 09h15 e acabou enviando a sua bagagem\npela esteira às 09h17. Quando a equipe de rampa recebeu esta\nbagagem, o voo já estava encerrado e o porão da aeronave estava\n\nfechado.\n\nRL17 ETIQUETA AUTOMATIZADA ANTIGA NÃO REMOVIDA DA BAGAGEM (Responsabilidade base responsável pelo check-in)\n\nQuando se etiqueta uma bagagem e não remove a etiqueta antiga.\nO passageiro JOSE foi atendido e a sua bagagem foi despachada,\nporém quando a sua bagagem foi enviada pela esteira, ao chegar na\nárea de triagem, um colaborador percebeu que a sua mala tinha duas\netiquetas com destinos diferentes e datas diferentes. Com essa\ndivergência, a equipe de check-in foi acionada para verificar, porém\nquando conseguiram verificar qual era a etiqueta correta o voo já havia\n\nsido encerrado.\n\n20 GRUPO DE RL: BASE DE ORIGEM – CARREGAMENTO\nRL21 DEIXADA NA ORIGEM EMBORA CORRETAMENTE ETIQUETADA (Responsabilidade base responsável pela rampa)\n\nA bagagem é deixada na área de rampa embora tenha sido\ncorretamente etiquetada pelo check-in.\n\nA bagagem do passageiro foi etiquetada corretamente, do aeroporto A\npara B. Porém, depois de ser enviada pela esteira e passar pela\ntriagem, foi deixada separada para seguir para a aeronave no horário\ncorreto. A mala acabou sendo esquecida com a equipe de rampa,\napesar de ter sido etiquetada corretamente e ter sido enviada para\n\ntriagem no horário correto.\n\nRL23 BAGAGEM STAND-BY NÃO EMBARCADA S. Pax (Responsabilidade base responsável pelo check-in)\nO embarque de um passageiro stand-by é autorizado e a bagagem\n\nstand-by não é embarcada.\n\nO passageiro que antecipa o voo e a bagagem é deixado com uma\n\netiqueta de stand-by.\n\nO passageiro staff JOSE despachou a sua bagagem no aeroporto A\ncom destino ao aeroporto B. Sua bagagem recebeu uma etiqueta de\nSTAND-BY no check-in e ficou separada. Antes do horário de\nencerramento do voo, o embarque do passageiro staff foi autorizado e\no carregamento da bagagem também, porém a bagagem acabou\nficando no aeroporto A, o que gerou um relatório de extravio no\n\naeroporto B.\n\nO passageiro staff JOSE, iria embarcar do aeroporto A para B no voo\nLA02, porém conseguiu antecipar o seu voo para o voo LA01. Ele notificou a equipe de check-in sobre a sua mudança de voo, porém\nquando chegou no aeroporto B, recebeu a notícia de que a sua\nbagagem ficou no aeroporto A (origem).\"\n\"RL25 ETIQUETA GATE/MANUAL/OFFLINE OCASIONOU O EXTRAVIO DA BAGAGEM (Responsabilidade base responsável pelo check-in)\n\nQuando as dimensões da bagagem de mão estão acima do permitido e\na bagagem recebe etiqueta gate, manual ou offline. Se a etiqueta foi\nmal preenchida; ou a não inserção desta etiqueta prejudicou a\nvisibilidade da bagagem na documentação de carregamento do avião,\n\neste RL deve ser utilizado no PIR.\n\nO passageiro JOSE está no embarque do seu voo, mas a sua bagagem\nde mão precisou ser despachada. A bagagem recebeu uma etiqueta\ngate, manual ou offline. (I) Houve um problema e a bagagem do\npassageiro JOSE não foi carregada na aeronave; (II) houve um erro no\npreenchimento da etiqueta e isso ocasionou o extravio da bagagem; (III)\na falta de inserção dessa etiqueta no sistema, acabou ocasionando o\n\nextravio da bagagem do passageiro JOSE.\nRL27 PASSAGEIRO REITINERADO E BAGAGEM NÃO REITINERADA (ORIGEM) (Responsabilidade base responsável pelo check-in)\n\nQuando um passageiro é reitinerado na origem, porém a bagagem não\n\né reitinerada.\n\nO passageiro JOSE está no aeroporto A, embarcando para o aeroporto\nB. Despachou a sua bagagem no voo LA02, porém posteriormente a\natendente de check-in informou ao passageiro que iria antecipar o seu\nvoo para o LA01, porém não etiquetou a sua mala para o novo voo.\nQuando o passageiro chegou no destino final no aeroporto B,\nconstatou que a sua mala não estava na esteira e abriu um PIR de\n\nextravio.\n\nRL28 PASSAGEIRO ENDOSSADO E BAGAGEM NÃO TRANSFERIDA (Responsabilidade base responsável pelo check-in)\nQuando aceitamos endosso de outras companhias, porém a bagagem\n\nnão é transferida.\n\nA companhia aérea XYZ procurou a companhia aérea e repassou o cliente JOSE.\nO cliente endossado embarcou em nosso voo do aeroporto A para o B,\nporém ao chegar no destino final a sua bagagem não chegou. Foi\nverificado que a bagagem ficou na origem com a companhia XYZ e o\nPIR foi aberto normalmente com a etiqueta da outra empresa.\nRL30 GRUPO DE RL: QUALQUER BASE – CARREGAMENTO E DESCARREGAMENTO\n\nRL31 BAGAGEM CARREGADA EM AERONAVE ERRADA OU TRIAGEM ERRÔNEA (Responsabilidade base responsável pela rampa)\n\nQuando a bagagem é carregada em um voo diferente do passageiro.\nA passageiro JOSE com a rota A/B, chegou no destino final, porém a\nsua bagagem não foi localizada no aeroporto B. A mala do cliente foi\ncarregada erroneamente para o aeroporto C.\n\nRL32 BAGAGEM DESCARREGADA ERRONEAMENTE (Responsabilidade base responsável pela rampa)\nQuando serviço ao passageiro solicita a retirada de uma bagagem e a\nrampa erroneamente descarrega outra bagagem. Quando a bagagem deveria permanecer no porão, porém é\n\ndescarregada erroneamente.\n\nA equipe de embarque do aeroporto A, sinalizou para a equipe de\nrampa que a bagagem LA010101 deveria ser retirada do porão da\naeronave, pois o cliente não havia embarcado. A equipe de rampa\nretirou do porão da aeronave a bagagem de etiqueta LA010102, ou\n\nseja, a bagagem errada.\n\nA equipe de rampa do aeroporto A, descarrega erronamente uma\nbagagem com destino ao aeroporto B. O passageiro, dono da\nbagagem, chega no aeroporto B e percebe que a sua bagagem não\n\nchegou e abre um relatório de extravio.\"\n\"RL33 BAGAGEM NÃO DESCARREGADA (Responsabilidade base responsável pela rampa)\nBagagem não descarregada no destino indicado pela etiqueta.\nQuando serviço ao passageiro solicita a retirada de uma bagagem e a\nrampa não descarrega a bagagem. Porém, é necessário definir quais\n\nevidências serão utilizadas.\n\nUma bagagem foi despachada com rota A/B. Quando a aeronave de\nprefixo PRPR chegou ao aeroporto B, a equipe de rampa não\ndescarregou essa bagagem. A aeronave PRPR assumiu outro voo,\nseguindo para o aeroporto C, onde a bagagem foi localizada. O equipe\nde Serviço de Bagagem do aeroporto C recebeu a bagagem e fez as\ntratativas para que a bagagem fosse embarca com RUSH e FWD para\no aeroporto B, que abriu um PIR para o cliente.\nA equipe de Serviço de Passageiro do aeroporto A, solicitou para a\nequipe de rampa que retirasse a bagagem LA010101 do porão da\naeronave, porém a equipe de rampa não localizou essa bagagem e o\nporão da aeronave foi fechado, para que o voo seguisse para o destino\n\nfinal.\n\nRL34 BAGAGEM NÃO EMBARCADA, DEVIDO ERRO OPERACIONAL DE\nÁREAS PRÓPRIAS companhia aérea (DOT, COT, EOP, ETC)\nEste código é utilizado quando uma área própria da companhia aérea (DOT, COT,\nEOP, etc), com poder de decisão, solicita a paralisação de\ncarregamento de uma bagagem ou solicita a retirada da mala\n\nerroneamente.\n\nA bagagem do cliente foi despachada corretamente, porém um\ncolaborador da companhia aérea que faz parte da equipe de rampa como DOT,\nCOT ou EOP, solicitou que a bagagem não fosse carregada na\naeronave ou solicitou o descarregamento desta bagagem, porém o\ncliente chegou no destino final B e abriu um relatório de extravio.\nRL35 CARREGADA EM PORÃO ERRADO, ATRÁS DE CARGA OU EM CONTAINER ERRADO (Responsabilidade base responsável pela rampa)\n\nQuando a bagagem é carregada em um porão ou container diferente da instrução de carregamento. A bagagem foi despachada no aeroporto A, com destino ao aeroporto\nB. Na documentação de carregamento do voo, havia a informação de\nque as bagagens com destino final aeroporto B, seriam carregadas em\nporão específico. No aeroporto B, o porão indicado foi descarregado,\nporém ficou faltando uma bagagem. O Serviço de Bagagem do\naeroporto B, abriu um PIR para o cliente. Posteriormente, a equipe de\nrampa do aeroporto B localiza a bagagem do cliente em porão diferente\ndo que havia sido indicado na documentação do voo\nA bagagem foi despachada no aeroporto A, com destino ao aeroporto\nB. Na documentação de carregamento do voo, havia a informação de\nque as bagagens com destino final aeroporto B, seriam carregadas em\nporão específico. No aeroporto B, o porão indicado foi descarregado,\nporém ficou faltando uma bagagem. O Serviço de Bagagem do\naeroporto B, abriu um PIR para o cliente. A aeronave assumiu um voo\ndo aeroporto B para o C. Quando a aeronave pousou no aeroporto C, a\nequipe de rampa deste aeroporto localizou a bagagem e apontou o\nporão no qual ela foi localizada. O Serviço de Bagagem do aeroporto C,\nfez a mensagem de envio da bagagem, registrando que a mala foi\n\ncarregada no porão incorreto.\"\n\"40 GRUPO DE RL: BASE DE DESTINO\nRL41 ENTREGUE EM ÁREA DE DESCARREGAMENTO ERRADA (Responsabilidade base responsável pela rampa)\nQuando a bagagem é disponibilizada na esteira errada como, por\n\nexemplo, em outro terminal.\n\nA bagagem foi despachada do aeroporto A para o B e o voo deste\npassageiro, teve suas malas restituídas na esteira 01 do desembarque.\nO passageiro dono da bagagem, ficou aguardando a sua bagagem na\nesteira 01. Porém, o colaborador de rampa se confundiu durante a\nrestituição de bagagem e colocou a bagagem na esteira 05.\n\nRL42 DEMORA NA ENTREGA DA BAGAGEM NO DESEMBARQUE (Responsabilidade base responsável pela rampa)\nQuando a bagagem é entregue no desembarque fora do horário\n\nprevisto.\n\nO passageiro JOSE chegou no aeroporto de destino e está aguardando\na sua bagagem no desembarque. Porém, todos os outros clientes do\nseu voo já localizaram suas bagagens e deixaram o desembarque. O sr\nJOSE procurou um colaborador no desembarque, que acionou o time\nde rampa que descarregou a aeronave, para verificar sobre essa\nbagagem faltante. A bagagem foi localizada, porém está no terminal de\ncargas e vai demorar mais 1h para chegar no desembarque. O\npassageiro JOSE não pode aguardar, pois tem um compromisso.\nRL44 RAZÃO NÃO DETECTADA, BAGAGEM LOCALIZADA (Responsabilidade base responsável pelo serviço de bagagem)\nQuando a bagagem é localizada, porém o motivo do extravio não pode\nser detectado devido à falta de informação no processo (Ex.: voo e porão em que a bagagem chegou).\n\nO passageiro JOSE abriu um relatório de extravio de bagagem. Porém,\napós alguns minutos a sua bagagem foi localizada. Não foi possível\nobter informação no sistema e também de algum colaborador, de como e onde essa bagagem foi localizada.\n\nRL45 PASSAGEIRO NÃO DÁ CONTINUIDADE AO PROCESSO AHL (SEM CONTATO) (Responsabilidade base responsável pelo serviço de bagagem) Exclusivo HDQ/CBT: quando o passageiro não entra em contato\ndurante todo o período de buscas e indenização. Somente pode ser\nutilizado depois que uma comunicação escrita é enviada ao\n\npassageiro.\n\nO passageiro JOSE abriu um relatório de extravio de bagagem no\naeroporto, porém a mala não foi localizada. A equipe de busca\nsecundária começou a fazer as buscas e por algum motivo o cliente\nnão responde os contatos. Somente a equipe HDQ/CBT (Central de\nBagagem) pode encerrar um PIR com este RL.\"\n\"50 GRUPO DE RL: BASE DE CONEXÃO\nRL51 PASSAGEIRO REITINERADO, BAGAGEM NÃO REITINERADA (CONEXÃO) (Responsabilidade base responsável pelo check-in)\n\nQuando um passageiro é reitinerado na conexão, porém a bagagem\n\nnão é reitinerada.\n\nO passageiro JOSE está no aeroporto A, com conexão no aeroporto B\ne com destino ao aeroporto C. Durante a conexão no aeroporto B, o\npassageiro foi acomodado em outro voo. Ao chegar no aeroporto de\ndestino (C), a sua mala não foi localizada. Posteriormente, o\ncolaborador que estava atendendo o cliente verifica no sistema que a\nsua bagagem não foi tratada no novo voo do cliente e vai chegar no\n\nvoo original.\n\nRL53 BAGAGEM NÃO CONECTADA (CONGÊNERE/companhia aérea) - FORA DO MCT (Responsabilidade base responsável pelo check-in)\n\nQuando a bagagem não é conectada devido atraso do voo da\ncongênere, tornando o MCT insuficiente.\n\nO passageiro JOSE tem a rota A/B/C. Do aeroporto A até B, com a\ncompanhia aérea XYZ e do aeroporto B até C, com a companhia aérea. O\nprimeiro voo do passageiro chegou com atraso no aeroporto B e isso\nprejudicou a possibilidade de conectar a bagagem até o aeroporto C. O\naeroporto B tem um MCT (Minimum Connection Time) de 40 minutos e\nsó havia 35 minutos para conectar a bagagem. Por este motivo, o\ntempo de conexão estava fora (abaixo) do MCT, o que acabou\nocasionando o extravio da bagagem. Nos RLs 53 e 54, a bagagem\nchegou no ponto onde as companhias aéreas parceiras se encontram,\n\nporém a mala não foi conectada.\n\nRL54 BAGAGEM NÃO CONECTADA (CONGÊNERE/companhia aérea) - DENTRO DO MCT (Responsabilidade base responsável pelo check-in)\n\nQuando a congênere não disponibiliza a bagagem no local pré acordado.\n\nO passageiro JOSE tem a rota A/B/C. Do aeroporto A até B, com a\ncompanhia aérea XYZ e do aeroporto B até C, com a companhia aérea. O\naeroporto B tem um MCT (Minimum Connection Time) de 40 miutos e o\nprimeiro voo do passageiro chegou com mais de 3 horas de conexão,\nou seja, dentro do MCT (acima do tempo mínimo de conexão). No\naeroporto B (de conexão), a companhia aérea XYZ acabou cometendo\numa falha e não repassou a bagagem para a companhia aérea em tempo hábil,\nocasionando o extravio da bagagem. Nos RLs 53 e 54, a bagagem\nchegou no ponto onde as companhias aéreas parceiras se encontram,porém a mala não foi conectada.\"\n\"RL55 BAGAGEM NÃO CONECTADA (companhia aérea/companhia aérea) - DENTRO DO MCT (Responsabilidade base responsável pela rampa) Quando a bagagem não é conectada em voos companhia aérea para companhia aérea,\n\nembora esteja dentro do MCT.\n\nO passageiro JOSE tem a rota A/B/C e todos os voos serão operados\npela companhia aérea. O aeroporto B tem um MCT (Minimum Connection Time)\nde 40 minutos e como o voo do passageiro chegou no voo horário,\nhavia um tempo de conexão superior a 3 horas, ou seja, uma conexão\ndentro do MCT (acima do tempo mínimo mínimo de conexão). Porém,\npor uma falha da equipe de rampa, a bagagem não foi conectada do\naeroporto B para o C, ocasionando o extravio da bagagem do\n\npassageiro JOSE.\n\nRL56 BAGAGEM NÃO CONECTADA (companhia aérea/companhia aérea) - FORA DO MCT (Responsabilidade base responsável pela rampa)\nQuando a bagagem não é conectada em voos companhia aérea para companhia aérea,\n\npois está fora do MCT.\n\nO passageiro JOSE tem a rota A/B/C e todos os voos serão operados\npela companhia aérea. O aeroporto B tem um MCT (Minimum Connection Time)\nde 40 minutos e como o voo do passageiro chegou com atraso, o\ntempo de conexão era de 30 minutos, ou seja, fora do MCT (abaixo do\ntempo mínimo mínimo de conexão). A bagagem não foi conectada do\naeroporto B para o C, ocasionando o extravio da bagagem do passageiro JOSE.\n60 GRUPO DE RL: AEROPORTOS GERAL\nRL61 BAGAGEM NÃO EMBARCADA DEVIDO A FALHAS NÃO GERENCIÁVEIS (Ex: Greve) (Responsabilidade base responsável pelo check-in)\n\nQuando há qualquer tipo de greve que impeça os passageiros de\nreceberem sua bagagem no destino final.\n\nPara aeroportos onde se aplicam problemas severos de meteorologia.\nQuando há manutenção não programada e / ou manutenção\nprogramada e o passageiro é alterado de voo sem bagagem.\nQuando não é possível abrir os porões, devido à contingência\n\noperacional.\nCaída de sistema generalizada.\n\nO passageiro JOSE chegou no aeroporto de destino final, porém a sua\nbagagem ficou em outro aeroporto, pois estava ocorrendo uma greve\nde colaboradores, que impediu que a sua mala chegasse junto com ele.\nA bagagem do passageiro JOSE não pode ser restituída no aeroporto\nde destino final, pois estava nevando muito no aeroporto de origem, o\nque impediu que a sua bagagem fosse carregada no avião.\nO passageiro JOSE estava dentro da aeronave, porém foi anunciado\nque por uma manutenção na aeronave (seja programada ou não), não\nseria possível carregar as bagagens de todos os clientes. Por este\nmotivo, ao chegar no destino final, o passageiro JOSE precisou abrir\n\num relatório de extravio.\n\nA bagagem do passageiro JOSE foi carregada no porão da aeronave,\nporém ao chegar no destino final, havia uma contingência operacional que impediu que a sua bagagem fosse retirada do porão e restituída na\n\nesteira do desembarque.\n\nO passageiro JOSE fez o seu check-in no aeroporto A e embarcou na\naeronave, porém houve uma queda de sistema em todo o aeroporto o\nque impediu que várias bagagens fosse separadas para os voos\ncorretos. Por este motivo, a bagagem do JOSE ficou no aeroporto de\n\norigem.\"\n\"RL63 SEGURANÇA AEROPORTUÁRIA (Responsabilidade base responsável pelo check-in)\nQuando a bagagem não chega ao destino final devido à retenção por\n\nórgão de segurança (Ex.: TSA).\n\nO passageiro JOSE despachou a sua bagagem, porém ao chegar na\nárea de rampa um colaborador sentiu que ela estava vibrando. Por este\nmotivo, acionou a equipe de segurança do aeroporto e relatou o\nocorrido. Essa bagagem foi isolada e posteriormente um agente da\npolícia local pegou essa bagagem, realizou várias procedimentos\nprévios de segurança e foi autorizado a abrir a bagagem. Dentro da\nbagagem foi localizada uma escova de dentes elétrica. Todo o\nprocedimento de segurança demorou mais 3 horas, por este motivo, ao\nchegar no destino final, foi aberto um relatório de bagagem extraviada.\nRL64 FALHAS DE INFRAESTRUTURA (Ex: Esteiras de bagagem, raio-x,etc) (Responsabilidade base responsável pelo check-in)\n\nQuando há falhas de infraestrutura que impedem o embarque das bagagens.\n\nO passageiro JOSE despachou a sua bagagem, porém o sistema de\nesteiras de bagagem, que transporta as malas dos balcões de check-in\naté a área de triagem para embarque na aeronave, apresentou uma\nfalha técnica. Por este motivo, ao chegar no destino final o passageiro\n\nprecisou abrir um relatório de extravio.\n\nRL65 BAGAGEM NÃO EMBARCADA POR RESTRIÇÃO DE PESO E/OU ESPAÇO (CUBAGEM) (Responsabilidade base responsável pelo check-in)\n\nQuando a bagagem não pode ser carregada devido à restrição de peso\n\ne/ou espaço na aeronave/porão.\n\nAo sair a documentação do voo LA01, havia a informação de que a\naeronave estava acima do peso para pousar na pista do aeroporto B.\nPor este motivo, foi solicitado o descarregamento de 500kg de\nbagagem da aeronave. Esta medida ocasionou o extravio de bagagem\n\nde vários passageiros.\n\nRL67 POLICIA FEDERAL, IMIGRAÇÃO (Ex: Passageiro deportado) (Responsabilidade base responsável pelo check-in)\n\nQuando há retenção da bagagem por estes órgãos, incluindo\npassageiros inadmitidos ou deportados.\n\nUm passageiro embarcou em um voo internacional, porém ao chegar\nno aeroporto B, as autoridades locais de imigração não permitiram a\nentrega deste cliente. O passageiro foi acomodado no próximo voo de\nretorno, porém não foi possível conectar a sua bagagem.\nUm passageiro embarcou do aeroporto A para o aeroporto B, mas ao\nchegar no destino final a sua bagagem não foi localizada e abriu um\nrelatório de extravio. Mais tarde, a equipe de Serviço de Bagagem do\naeroporto B inseriu uma informação no sistema informando que, a bagagem do passageiro foi retida pela autoridade policial do aeroporto\nde origem, alegando que havia algo ilícito ou perigoso dentro da\n\nbagagem.\"\n\"70 GRUPO DE RL: MISCELÂNEA\nRL72 PAX DESEMBARCADO DA AERONAVE, PORÉM BAGAGEM NÃO (SEGURANÇA MANDATÓRIA) (Responsabilidade base responsável pelo check-in)\n\nQuando o cliente não embarca no voo, porém a bagagem não é descarregada.\n\nO passageiro JOSE passou mal antes do embarque do seu voo e não\nconseguiu entrar na aeronave. Ao procurar um colaborador da\ncompanhia aérea, foi possível verificar que a bagagem do passageiro\nnão foi retirada da aeronave. O passageiro precisou abrir um relatório\nde extravio de bagagem, pois informou que não vai seguir viagem para seu destino em outro voo.\n\nO passageiro JOSE chegou no seu destino final, porém a sua bagagem\nnão foi localizada. Ao procurar um colaborador da companhia aérea do\naeroporto destino, foi verificado que o cliente não estava embarcado no\nsistema. Por este motivo, no aeroporto de origem, a equipe de Serviço\nao Passageiro solicitou a retirada da sua bagagem. O passageiro abriu\num relatório de extravio no aeroporto de destino.\nRL73 BUSCA POR EXCEÇÃO - BAGAGEM NÃO RETIRADA PELO PASSAGEIRO ONDE NECESSÁRIO (Responsabilidade base responsável pelo serviço de bagagem)\n\nQuando o passageiro não retirar a bagagem onde necessário, por\nexemplo, (I) quando cliente não retira a sua bagagem para passar pela\nalfândega ou em (II) casos de rota com trecho \"\"\"\"surface\"\"\"\".\n* Surface: troca de aeroporto com um trecho terrestre entre eles, como no caso de AEP e EZE; CGH e GRU.\n\n* Considerando que os relatórios criados como “busca por exceção”\nnão são culpa da companhia aérea, estes não devem gerar custos. Ou\nseja, não devemos emitir compensação para auxílio emergencial, não\nrealizamos a entrega da bagagem através de transportadora, não\nindenizamos o cliente em caso de extravio definitivo, etc.\nO passageiro JOSE tem um voo de SCL/GRU/FLN. No primeiro\naeroporto dentro do Brasil, o passageiro tem a responsabilidade de\npegar a sua mala na esteira e fazer o procedimento alfandegário.\nPorém, JOSE esquece de retirar a sua mala e segue para o destino\nfinal. Ao chegar em FLN, procura um colaborador da companhia aérea\npara relatar que a sua mala não foi restituída na esteira do voo\nGRU/FLN. O colaborador questionou o passageiro se ele retirou a sua\n\nmala em GRU e JOSE responde que não.\n\nO passageiro JOSE tem um voo BEL/GRU - CGH/POA, ou seja, em\nSão Paulo há uma troca de aeroporto via terrestre (\"\"surface\"\"). Neste\ncaso, o cliente precisa pegar a bagagem dele na esteira em GRU, pegar\num transporte terrestre até CGH e redespachar a sua bagagem. Porém,\no passageiro JOSE não realiza esse procedimento. Ao chegar em POA,\nprocura um colaborador da companhia aérea para relatar que a sua\nmala não foi restituída na esteira do voo CGH/POA. O colaborador\nquestionou o passageiro se ele retirou a sua mala em GRU e\nredespachou em CGH, porém JOSE responde que não.\"\n\"RL74 TROCA DE BAGAGEM PELO PASSAGEIRO (Responsabilidade base responsável pelo serviço de bagagem)\nQuando o passageiro leva a bagagem que pertence a outro cliente.\nO passageiro JOSE, ao chegar no aeroporto de destino final, fica\naguardando a restituição de bagagem na esteira do seu voo, porém a\nsua bagagem não chegou. JOSE abriu um relatório de extravio de\nbagagem. Mais tarde, um colaborador do Serviço de Bagagem atendeu\num cliente que informou ter retirado uma bagagem que não é sua.\nQuando o colaborador verificou as informações na etiqueta, foi possível\nidentificar que é a bagagem do passageiro JOSE.\n\n75 ARMA DE FOGO (OU ESPADAS MILITARES) (Responsabilidade base responsável pelo check-in)\nQuando ocorrer extravio de armas de fogo ou espadas militares.\nO passageiro JOSE despachou a sua arma de fogo, mediante todos os\nprocedimentos necessários. Porém, ao chegar no aeroporto de destino\n\nfinal, sua arma de fogo não chegou.\n\nRL76 BAGAGEM ENCONTRADA SEM ETIQUETA (OHD) (Responsabilidade base responsável pela rampa)\nQuando a bagagem é encontrada sem etiqueta e o Fault Station - FS é\nsempre designado para o aeroporto onde a bagagem é encontrada.\nO passageiro JOSE despachou a sua bagagem, porém essa não\nchegou ao destino final. Mais tarde foi possível um colaborador verificar\nno sistema, de que havia uma mala com características externas\nparecidas com a mala do JOSE. O colaborador entrou em contato com\no passageiro e relatou alguns conteúdos da bagagem, que foi\nlocalizada sem etiqueta em outro aeroporto. JOSE confirmou que é a sua bagagem.\n\nRL77 FALHA DE ETIQUETAGEM DE COMPANHIA AÉREA PARCEIRA OU\nQUANDO A BAGAGEM NÃO É CARREGADA PELA COMPANHIA AÉREA PARCEIRA E FICA NA ORIGEM (Responsabilidade base responsável pelo check-in)\n\nQuando a bagagem é extraviada devido a (I) erros de etiquetagem de\noutra empresa ou (II) quando a bagagem não sai do aeroporto de\norigem, ou seja, continua em posse da companhia aérea parceira. Para\neste RL, como \"\"Fault Station\"\" (FS) deve ser apontado o primeiro\naeroporto companhia aérea envolvido na rota do passageiro.\nA passageiro JOSE vai viajar pela rota A/B/C. O voo do aeroporto A até\no aeroporto B, é operado pela companhia aérea XYZ; e o voo do\naeroporto B até o aeroporto C, é operado pela companhia aérea. A bagagem do\nJOSE não chegou no destino final. Após as etapas de busca da\nbagagem, foi possível verificar que a sua bagagem não foi conectada\naté o destino final, pois (I) a etiqueta foi emitida pela companhia aérea\nXYZ de forma incorreta ou; (II) a bagagem ficou na origem da sua\nviagem, em posse da companhia aérea XYZ.\n\nRL78 RAZÃO NÃO DETECTADA, BAGAGEM NÃO LOCALIZADA (Responsabilidade base responsável pelo serviço de bagagem)\nExclusivo HDQ/CBT: quando o processo está em busca secundária ou indenização.\n\nA bagagem do passageiro não foi localizada e o relatório está sob\nresponsabilidade da equipe de \"\"busca secundária\"\", por este motivo,\ndeve receber o RL 78 e o FS será o aeroporto da máscara do relatório.\nCaso a equipe de \"\"busca secundária\"\" não localize a bagagem, o\nrelatório será repassado para a equipe de indenização do Contact Center.\"\n\"RL79 BUSCA POR EXCEÇÃO - PROCESSO AHL CRIADO\nERRONEAMENTE, SEM O COMPROVANTE OU FORA DO PRAZO (Responsabilidade base responsável pelo serviço de bagagem)\n\n-\n1. Passageiros que não possuam etiqueta de bagagem e não possuam\nregistro de despacho de bagagem no sistema de check-in;\n2. Passageiros que não fizeram alfândega no primeiro ponto alfandegário;\n\n3. Passageiros que reclamam posteriormente, mesmo com comprovante de bagagem;\n4. Passageiros com bilhetes separados;\n\n5. Passageiros que tiveram malas retidas na origem e ou conexão\ndevido ter conteúdo não permitido para embarque, as quais são\naquelas mercadorias perigosas, podendo variar em cada país, como\npor exemplo: power bank, aerossóis, baterias, cigarros eletrônicos,entre outros.\n\nObs: a busca de bagagem deve ser feita por 5 dias e se a bagagem\nnão for localizada, o processo deve ser encerrado no sistema.\n* Considerando que os relatórios criados como “busca por exceção”\nnão são culpa da companhia aérea, estes não devem gerar custos. Ou\nseja, não devemos emitir compensação para auxílio emergencial, não\nrealizamos a entrega da bagagem através de transportadora, não\nindenizamos o cliente em caso de extravio definitivo, etc.\n1. O passageiro JOSE não achou a sua bagagem no aeroporto de\ndestino final e procurou um colaborador da companhia aérea. O\ncolaborador pediu a etiqueta da bagagem para o passageiro, porém o\npassageiro informou não ter localizado. O colaborador verificou nos\nsistemas e não localizou nenhuma etiqueta de despacho de bagagem,vinculada a reserva do cliente.\n\n2. O passageiro JOSE tem um voo de SCL/GRU/FLN. No primeiro\naeroporto dentro do Brasil, o passageiro tem a responsabilidade de\npegar a sua mala na esteira e fazer o procedimento alfandegário.\nPorém, JOSE esquece de retirar a sua mala e segue para o destino\nfinal. Ao chegar em FLN, procura um colaborador da companhia aérea\npara relatar que a sua mala não foi restituída na esteira do voo\nGRU/FLN. O colaborador questionou o passageiro se ele retirou a sua\nmala em GRU e JOSE responde que não. O PIR é aberto como busca\npor exceção e no encerramento, deve receber o RL 73 e FS \"\"aeroporto onde o cliente deveria ter feito a alfândega\"\".\n\n3. O passageiro desembarcou, verificou que a sua mala não chegou no\ndestino final, mas deixou a área de desembarque para tomar um\nlanche. Após 1h30min o passageiro procurou o Serviço de Bagagem e\npediu para abrir um PIR de extravio de bagagem.\n4. O passageiro tem um ticket 001, com rota SCL/GRU e um outro\nticket 002, com rota GRU/FRA. Ao chegar no aeroporto de FRA,\nverificou que a sua mala não estava disponível na esteira e solicitou atendimento da companhia aérea. \nnão foi carregada, pois havia um \"\"power bank\"\" dentro. 5. O passageiro JOSE colocou dentro de sua mala um \"\"power bank\"\"\n(carregador portátil) e despachou a sua bagagem. Ao chegar no\naeroporto de destino final, verificou que a sua mala não chegou e foi\natendido pela companhia aérea. Algumas horas após a abertura do PIR,\no aeroporto de origem inseriu no sistema, a informação de que a mala\"\n\"80 GRUPO DE RL: DANIFICAÇÃO\nRL81 DANO MAIOR (Responsabilidade base responsável pela rampa)\nQuando a bagagem danificada apresentaria possibilidade de conserto.\n\nEx: roda, alça, puxador e etc.\n\nSe aplica a todos os casos de dano maior, independente da forma em\nque o cliente foi compensado: compensação financeira, conserto, etc.\nEnquanto um passageiro retirava a sua bagagem na esteira do\ndesembarque, percebeu um dano, de uma forma que comprometia a\nfuncionalidade ou descaracterizava a bagagem. O passageiro procurou\natendimento da companhia aérea e recebeu uma compensação\n\nfinanceira.\n\nRL82 DANO TOTAL (Responsabilidade base responsável pela rampa)\nQuando a bagagem danificada não apresentar possibilidade de\nconserto, será necessário comprar/indenizar uma nova bagagem ao passageiro.\n\nSe aplica a todos os casos de dano total, independente da forma em\nque da forma em que o passageiro foi compensado: compensação financeira, reposição, etc.\n\nEnquanto um passageiro retirava a sua bagagem na esteira do\ndesembarque, percebeu que a sua mala estava com um dano que não\npoderia ser reparado. O passageiro procurou atendimento da\ncompanhia aérea e recebeu uma compensação financeira.\nRL83 PASSAGEIRO NÃO DÁ CONTINUIDADE AO PROCESSO DE DANIFICAÇÃO (SEM CONTATO) (Responsabilidade base responsável pela rampa)\n\nQuando não é possível o contato com o cliente para resolução do caso.\nFoi aberto um PIR para o cliente, que estava com pressa e pediu para\nque o Serviço de Bagagem entrasse em contato com ele\nposteriormente, para oferecer uma compensação financeira. Após\ndiversas tentativas de contato, o PIR foi encerrado sem resolução.\nRL84 PROCESSO DPR CRIADO ERRONEAMENTE, SEM CONFERÊNCIA DO LIMITED RELEASE NO BRS (Responsabilidade base responsável pelo check-in)\n\nProcesso aberto sem conferência de Limited Release no BRS para\nconfirmar se a mala foi despachada danificada\nUm passageiro despachou a sua bagagem danificada no aeroporto de\norigem. O colaborador registrou o dano através do procedimento de\nLIMITED RELEASE e tirou fotos da etiqueta e da bagagem danificada,\npara registrar no sistema BRS. O aeroporto de destino final, abriu o PIR\nsem verificar o sistema BRS. Mediante contestação, o aeroporto de\norigem enviou um e-mail para os aeroportos envolvidos e foi possível\nalterar o RL para 84 e o FS para o aeroporto de destino final.\"\n\"90 GRUPO DE RL: VIOLAÇÃO RL91 VIOLAÇÃO E DANIFICAÇÃO (Responsabilidade base responsável pela rampa)\nQuando a bagagem é danificada e violada. As duas ocorrências podem\nter ocorrido na mesma bagagem ou em bagagens diferentes, do mesmo passageiro, no mesmo PIR.\n\nAo desembarcar, um passageiro retirou a sua bagagem na esteira e\nverificou que a sua mala estava aberta, com o zíper danificado e\ntambém notou falta de algumas peças de roupa.\n\nRL92 VIOLAÇÃO (Responsabilidade base responsável pela rampa)\nQuando o passageiro alega perceber conteúdo faltante em sua bagagem.\n\nAo desembarcar, um passageiro retirou a sua bagagem na esteira e ao\nverificar o conteúdo, alegou estar faltando algumas peças de roupa.\nRL93 PASSAGEIRO NÃO DÁ CONTINUIDADE AO PROCESSO DE VIOLAÇÃO (SEM CONTATO) (Responsabilidade base responsável pela rampa)\n\nExclusivo HDQ/CBT: quando o passageiro não entra em contato\ndurante o período de indenização. Somente pode ser utilizado depois\nque uma comunicação escrita é enviada ao passageiro.\nPara identificar objetos eletrônicos e/ou de valor que não serão indenizados.\n\nO passageiro abriu o PIR no aeroporto e foi derivado para o Contact\nCenter ou este foi aberto diretamente pelo Contact Center. O cliente\nnão respondeu nenhuma tentativa de contato.\n\nO passageiro alegou itens faltantes em sua bagagem, como eletrônicos\ne/ou de valor. O PIR foi aberto para o cliente, porém de acordo com o\nprocedimento a companhia aérea não prossegue com uma\n\ncompensação financeira.\n\nRL94 PROCESSO DPR CRIADO ERRONEAMENTE - (Responsabilidade base responsável pelo serviço de bagagem)\nQuando o PIR de Damaged Bag - DPR é criado erroneamente\nQuando o colaborador do Serviço de Bagagem insere um PIR em duplicidade.\n\nRL95 VIOLAÇÃO DE BAGAGEM RETIDA NO PORTÃO DE EMBARQUE (Responsabilidade base responsável pela rampa)\nQuando a mala de mão é retida na porta da aeronave, despachada\npara o porão e constatada violação de itens eletrônicos.\nO cliente apresentou uma etiqueta gate/manual/offline e procurou a\ncompanhia aérea para abrir um PIR de violação, alegando falta de (I)\nitens comuns (roupas, tênis, perfume) ou (II) itens eletrônicos.\"\n\""},{"title":"MCT operacional","type":"Pratica","duration":"24 min","content":"MCT operacional e impacto na tratativa\n\nMCT significa Minimum Connection Time, ou tempo mínimo de conexão. Na tratativa de bagagem, ele ajuda a avaliar se havia tempo suficiente para a mala ser transferida entre voos. Quando o tempo é insuficiente ou crítico, o RL usado precisa refletir essa condição operacional.\n\nTABELA DE CÁLCULO MCT companhia aérea RL51\nTipo de Conexão Tempo\nDOM x DOM 0 min a 34 min\nDOM x INTER 0 min a 39 min\nINTER x INTER 0 min a 39 min RL56\nTipo de Conexão Tempo\nDOM x DOM 35 min a 44 min\nDOM x INTER 40 min a 1h14 min\nINTER x INTER 40 min a 59 min RL55\nTipo de Conexão Tempo\nDOM x DOM Acima de 45 min\nDOM x INTER Acima de 1h15 min\nINTER x INTER Acima de 60 min \n\"\n\" O que é MCT?\nMCT significa Minimum Connection Time (Tempo Mínimo de Conexão).\nÉ o tempo mínimo necessário entre dois voos para garantir que a bagagem seja transferida corretamente entre eles. Cada tipo de conexão (doméstico-doméstico, doméstico-internacional ou internacional-internacional) exige um tempo mínimo diferente, dependendo também da complexidade da operação.\n\nA companhia aérea classifica os atrasos no manuseio de bagagens conforme esses tempos mínimos, utilizando os códigos RL (Reason for Loss – Motivo da Perda). Os RLs permitem identificar se o problema ocorreu por tempo insuficiente de conexão.\n\nComo funcionam as métricas da tabela:\nA tabela está dividida em três blocos, de acordo com os códigos RL51, RL56 e RL55:\n\nRL51 – Tempo de conexão abaixo do mínimo aceitável\nDOM x DOM: 0 a 34 minutos\n\nDOM x INTER: 0 a 39 minutos\n\nINTER x INTER: 0 a 39 minutos\n️ Nessas faixas, a conexão é considerada inviável, pois o tempo está abaixo do mínimo recomendado.\n\nRL56 – Tempo de conexão considerado crítico\nDOM x DOM: 35 a 44 minutos\n\nDOM x INTER: 40 min a 1h14 min\n\nINTER x INTER: 40 a 59 minutos\n️ Nessas faixas, a conexão é tecnicamente possível, mas ainda existe alto risco de perda de bagagem, sendo necessário monitoramento.\n\nRL55 – Tempo de conexão adequado\nDOM x DOM: Acima de 45 minutos\n\nDOM x INTER: Acima de 1h15 minutos\n\nINTER x INTER: Acima de 60 minutos\n️ Nessas faixas, o tempo é suficiente para garantir a transferência da bagagem, sem risco operacional, salvo exceções.\n\nObs:Não existe MCT no trecho INTER X DOM devido o cliente ter que efetuar alfândega,neste caso é iniciado um novo trecho doméstico. Esse controle ajuda a entender e prevenir perdas de bagagem por conexões apertadas, além de apoiar melhorias operacionais e ajustes de malha aérea. \"\n\"\n\nComo interpretar o MCT\n\nRL51 indica tempo abaixo do mínimo aceitável. A conexão é considerada inviável para transferência segura da bagagem.\n\nRL56 indica conexão crítica. A transferência é tecnicamente possível, mas existe risco alto e a operação precisa ser monitorada.\n\nRL55 indica tempo adequado. Em regra, havia tempo suficiente para transferência, então se a bagagem não chegou, a causa pode estar em outra etapa operacional.\n\nPonto de atenção\n\nNão existe MCT para conexão internacional x doméstica quando o passageiro precisa fazer alfândega e iniciar novo trecho doméstico. Nessa situação, a análise deve considerar retirada, alfândega, redespacho e nova aceitação da bagagem."},{"title":"Areas de transferencia","type":"Simulacao","duration":"24 min","content":"Áreas de transferência e fluxo de análise\n\nA análise de tratativa precisa considerar onde a bagagem deveria passar fisicamente. A mesma rota pode envolver áreas diferentes, como transferência doméstica, sala ATI, recheck-in, área ar, área terra, triagem, rampa e restituição. O RL fica mais preciso quando o agente identifica em qual ponto o processo quebrou.\n\nPrincipais Áreas de Transferência de Bagagem e Aplicação dos RLs\nOs RLs (Reason for Loss) como RL51, RL56 e RL55 são aplicados principalmente em operações de conexão de bagagens entre voos, onde o tempo é um fator crítico para garantir que as malas cheguem corretamente ao destino final. Esses códigos são utilizados para analisar falhas e riscos nas áreas abaixo:\n\n1. ÁREA DE TRANSFERÊNCIA DOMÉSTICO x DOMÉSTICO (DOM x DOM)\nQuando o passageiro chega de um voo doméstico e embarca em outro voo doméstico.(Local de tratativa Lonado,caso a babagem tenha sido desembarcada)\nExemplo: Porto Alegre → São Paulo → Salvador\nAplicação dos RLs:\n\nConexão menor que 34 min (RL51)\n\nConexão crítica entre 35 e 44 min (RL56)\n\nIdeal acima de 45 min (RL55)\n\n2. ÁREA DE TRANSFERÊNCIA DOMÉSTICO x INTERNACIONAL (DOM x INTER)\nQuando o passageiro chega de um voo nacional e embarca em um voo internacional.(Locais de tratativa:Sala ATI(Área ar) e Recheck-in (área terra)\nExemplo: Curitiba → São Paulo → Miami\nAplicação dos RLs:\n\nTempo abaixo de 39 min (RL51)\n\nTempo crítico entre 40 min e 1h14 (RL56)\n\nIdeal acima de 1h15 (RL55)\n\n3. ÁREA DE TRANSFERÊNCIA INTERNACIONAL x INTERNACIONAL (INTER x INTER)\nQuando o passageiro faz conexão entre dois voos internacionais.(Locais de tratativa:Sala ATI(Área ar) e Recheck-in (área terra)\nExemplo: Buenos Aires → São Paulo → Londres\nAplicação dos RLs:\n\nConexão menor que 39 min (RL51)\n\nConexão crítica entre 40 e 59 min (RL56)\n\nIdeal acima de 60 min (RL55)\n\nEssas áreas de conexão são monitoradas continuamente para identificar gargalos e reduzir o índice de bagagens extraviadas. O uso correto dos RLs ajuda na análise de performance operacional e na prevenção de falhas logísticas.\"\n\"\n\nFluxo sugerido de análise\n\n1. Confirme a rota real do passageiro e da etiqueta.\n2. Verifique se houve conexão e qual era o tempo disponível.\n3. Identifique se o trecho era doméstico, internacional ou misto.\n4. Confirme se havia obrigação de retirada para alfândega ou redespacho.\n5. Consulte se há mensagens de encaminhamento, rush, FWD, ROH/FOH ou registro de localização.\n6. Só depois escolha o RL e o FS.\n\nExemplo de raciocínio\n\nSe a mala tinha conexão doméstica para doméstica com tempo abaixo do mínimo, o foco da tratativa será MCT e risco operacional de conexão. Se a bagagem estava corretamente etiquetada e havia tempo adequado, mas ficou na origem, a análise se desloca para carregamento, triagem ou rampa."},{"title":"Casos praticos de RL","type":"Exercicio","duration":"30 min","content":"Casos práticos e aplicação correta\n\nEsta trilha reúne o guia prático do material para consolidar a escolha dos RLs com exemplos. Use como apoio para comparação entre cenários parecidos.\n\nGuia Prático: Utilização Correta dos Códigos RL (Reason for Loss) - companhia aérea\n\nEste guia tem como objetivo explicar de forma clara, objetiva e com exemplos, quando e como utilizar corretamente cada código RL (Reason for Loss) relacionado a extravio, falhas operacionais ou desvios no manuseio de bagagens na malha companhia aérea.\n\nGRUPO RL 10: Base de Origem - Check-in\n\nRL 11 - Etiqueta impressa incorretamente (borrada ou incompleta)\n\nQuando a etiqueta automatizada está ilegível, rasurada ou apresenta falhas na impressão.\nEx: Bagagem etiquetada para GRU mas impressão ficou ilegível, sendo enviada para o destino errado.\n\nRL 12 - Etiqueta sem destino final\n\nQuando a etiqueta é emitida apenas até um ponto intermediário.\nEx: Passageiro voa A/B/C, mas etiqueta foi emitida apenas A/B.\n\nRL 13 - Contratos/tickets separados\n\nQuando a bagagem é etiquetada até o destino final mesmo com bilhetes de companhias diferentes.\nEx: companhia aérea (A/B) e conexão com outra companhia (B/C), e bagagem segue até C, sem transferência formal.\n\nRL 15 - Etiqueta anexada em bagagem errada\n\nErro de atendente ao colar etiqueta de um passageiro na mala de outro.\n\nRL 16 - Bagagem despachada após o encerramento do check-in\n\nA mala entra na esteira fora do tempo hábil, mesmo estando correta.\n\nRL 17 - Etiqueta antiga não removida\n\nQuando uma mala possui etiquetas antigas que geram confusão na triagem.\n\nGRUPO RL 20: Base de Origem - Carregamento\n\nRL 21 - Deixada na origem, embora corretamente etiquetada\n\nErro da equipe de rampa em não carregar a bagagem.\n\nRL 23 - Bagagem stand-by não embarcada\n\nPassageiro antecipado, mas mala com etiqueta stand-by não foi embarcada.\n\nRL 25 - Etiqueta manual/gate/offline causou extravio\n\nUso incorreto ou falha no preenchimento de etiqueta feita na porta de embarque.\n\nRL 27 - Pax reitinerado na ORIGEM e mala não \n\nMudança de voo não acompanhada pela reetiquetagem da bagagem.\n\nRL 28 - Passageiro endossado e bagagem não transferida\n\nPassageiro de outra companhia voa com companhia aérea, mas mala fica com a anterior.\n\nGRUPO RL 30: Qualquer base - Carregamento/Descarregamento\n\nRL 31 - Bagagem carregada em voo errado\n\nErro na triagem/carregamento. Ex: bagagem vai para C ao invés de B.\n\nRL 32 - Descarregada erroneamente\n\nBagagem retirada do porão sem necessidade ou de outro passageiro.\n\nRL 33 - Não descarregada\n\nA mala seguiu para outro destino por não ter sido retirada da aeronave.\n\nRL 34 - Falha operacional companhia aérea (DOT, COT, EOP)\n\nBagagem retirada ou bloqueada por decisão interna da companhia.\n\nRL 35 - Carregada em porão/container errado\n\nA bagagem foi colocada em local diferente do indicado na documentação.\n\nGRUPO RL 40: Base de Destino\n\nRL 41 - Entregue em área errada\n\nEx: esteira ou terminal diferente do correto.\n\nRL 42 - Demora na entrega da bagagem\n\nRestituição fora do tempo previsto, impactando o cliente.\n\nRL 44 - Razão não detectada (bagagem localizada)\n\nQuando se encontra a bagagem, mas não se identifica a causa do erro.\n\nRL 45 - Pax não dá continuidade ao AHL\n\nUsado apenas pela central HDQ/CBT após falta de contato do cliente.\n\nGRUPO RL 50: Base de Conexão\n\nRL 51 - Pax reitinerado na CONEXÃO e mala não \n\nBagagem continua na rota original, sem alteração.\n\nRL 53 - Não conectada (Congênere/companhia aérea) - fora do MCT\n\nAtraso da primeira perna impossibilita conexão da mala.\n\nRL 54 - Não conectada (Congênere/companhia aérea) - dentro do MCT\n\nCompanhia parceira falha em entregar a mala mesmo com tempo hábil.\n\nRL 55 - Não conectada (companhia aérea/companhia aérea) - dentro do MCT\n\nFalha da companhia aérea em conexão dentro do tempo mínimo.\n\nRL 56 - Não conectada (companhia aérea/companhia aérea) - fora do MCT\n\nAtraso inviabiliza a conexão da bagagem.\n\nGRUPO RL 60: Aeroportos Geral\n\nRL 61 - Falhas não gerenciáveis (Ex: greve)\n\nEventos externos que impedem o carregamento/restituição.\n\nRL 63 - Segurança aeroportuária\n\nBagagem retida para inspeção (ex: objeto suspeito).\n\nRL 64 - Falhas de infraestrutura\n\nEsteiras paradas, raio-X fora de operação, etc.\n\nRL 65 - Restrição de peso e/ou cubagem\n\nQuando a aeronave não comporta todas as malas por peso ou volume.\n\nRL 67 - PF/Imigração\n\nBagagens de passageiros deportados ou retidos por órgãos oficiais.\n\n\"\n\nComo fechar a tratativa com qualidade\n\nAo finalizar um processo, o agente deve garantir que o histórico explique o caminho tomado: qual evidência foi consultada, por que aquele RL foi escolhido, qual FS foi atribuído, que orientação foi dada ao passageiro e qual ação operacional ficou pendente ou concluída.\n\nCritérios para não errar\n\nNunca escolha RL apenas pelo efeito percebido pelo passageiro. Uma mala não localizada pode ter causa em check-in, rampa, conexão, alfândega, autoridade, conteúdo proibido, falha de parceiro ou razão não detectada. A tratativa correta nasce da causa provável, não apenas do sintoma.\n\nQuando houver dúvida, registre a análise no histórico e mantenha o processo rastreável para supervisão ou continuidade operacional."}]$json_tratativa_rl_mct$::jsonb, $mat_tratativa_rl_mct$Conceito de RL

O que é tratativa de bagagem

Tratativa de bagagem é o conjunto de análises, decisões e registros feitos depois que uma irregularidade é identificada: extravio, atraso, conexão perdida, bagagem sem etiqueta, danificação, violação ou falha operacional. A tratativa correta não é apenas escolher um código. Ela exige entender o fato gerador, identificar a área envolvida, registrar evidências, orientar o passageiro e manter o processo tecnicamente consistente até o encerramento.

O que é o RL (Reason for Loss) no WorldTracer?
O RL (Reason for Loss) é um código numérico padronizado internacionalmente utilizado no sistema WorldTracer para indicar a causa do extravio, atraso ou dano de uma bagagem. Cada código RL ajuda a classificar corretamente a ocorrência e direcionar as ações de investigação e tratativa da bagagem.

Esses códigos são essenciais para:

1) Identificação rápida da causa do problema.

2) Adoção de ações corretivas específicas.

3) Análise estatística de causas recorrentes.

4) Melhor atendimento ao passageiro."
"

Como o agente deve usar o RL na prática

O RL deve ser escolhido após a leitura completa do cenário operacional. Antes de selecionar o código, o agente precisa verificar: rota do passageiro, voo e data, etiqueta de bagagem, tempo de conexão, mensagens do WorldTracer, histórico da ocorrência, informações de rampa, eventual reitineração, registros de triagem, retenção por autoridade ou conteúdo não permitido, e se houve dano ou violação.

O objetivo da tratativa é responder três perguntas:

1. Onde a falha provavelmente ocorreu?
2. Qual área ou etapa operacional está relacionada ao fato?
3. Qual ação deve ser tomada para localizar, encaminhar, compensar, encerrar ou corrigir o processo?

Boas práticas de registro

Use informações objetivas no histórico do processo. Evite conclusões sem evidência. Registre contatos com passageiro, mensagens enviadas, consultas realizadas, respostas de outras bases, tentativa de localização, decisão de encerramento e motivo do RL aplicado. Um processo bem registrado facilita a continuidade por outro agente e reduz erro de tratativa.

---

Grupos de RL

Grupos de RL como consulta operacional

Os grupos 10, 20, 30, 40, 50, 60, 70, 80 e 90 organizam causas semelhantes. Eles não são, por si só, o RL final. O primeiro número indica o grupo, e o segundo número indica o motivo específico. Esta trilha funciona como consulta completa para selecionar o código correto conforme a causa identificada.

Explicações dos códigos de cada Reason for Loss - RL

CÓDIGO

DEFINIÇÃO, EXPLICAÇÃO E EXEMPLO
Os códigos 10, 20, 30, 40, 50, 60, 70, 80 e 90, não são RLs.
São agrupamentos de RLs com a natureza parecida.
O primeiro número de cada RL, indica a que grupo pertence.

10 GRUPO DE RL: BASE DE ORIGEM – CHECK‐IN ÁREA
RL11 ETIQUETA AUTOMATIZADA IMPRESSA INCORRETAMENTE, BORRADA OU INCOMPLETA (Responsabilidade base responsável pelo check-in) Etiqueta automatizada, impressa para outro voo ou destino, ou quando
as informações na etiqueta não estão ilegíveis.
A etiqueta automatizada foi emitida no check-in do aeroporto A, porém
está borrada, rasurada ou ilegível. Por este motivo, a bagagem não foi
carregada para o aeroporto B ou acabou sendo carregada para o
aeroporto C (que não está na rota do cliente).

RL12 ETIQUETA AUTOMATIZADA IMPRESSA SEM O DESTINO FINAL (Responsabilidade base responsável pelo check-in)
Etiqueta automatizada, quando o passageiro voava no trecho A/B/C,

porém se etiquetada somente até B.

O passageiro está embarcando do aeroporto A, com conexão no
aeroporto B e destino final aeroporto C. Portanto, a rota seria A/B/C,
porém a etiqueta automatizada foi emitida somente A/B.
RL13 ETIQUETA AUTOMATIZADA, IMPRESSA ATÉ O DESTINO FINAL, PORÉM PARA CONTRATOS/TICKETS SEPARADOS (Responsabilidade base responsável pelo check-in)
O passageiro possuía 1o bilhete no trecho A/B e 2o bilhete no trecho
B/C. A bagagem foi despachada com etiqueta automatizada de A para
C, quando deveria ter sido despachada somente até B.
O passageiro comprou um bilhete com a companhia aérea, do aeroporto A até o
B. Porém, o cliente tinha outro bilhete com a companhia aérea XYZ, do
aeroporto B até C. Por um erro de sistema ou humano, a etiqueta foi
emitida com a rota completa A/B/C. Quando o passageiro se
apresentou no aeroporto B, para retirar sua mala e redespachar,
conforme o seu bilhete da companhia aérea, a bagagem não foi localizada, pois
já havia sido repassada para a companhia aérea XYZ, ocasionando o

extravio da bagagem

RL15 ETIQUETA AUTOMATIZADA ANEXADA EM BAGAGEM ERRADA NO ATO DO CHECK-IN (Responsabilidade base responsável pelo check-in)

Quando a etiqueta automatizada anexada na bagagem está em nome

de outro passageiro.

Quando o agente reimprime erroneamente a etiqueta automatizada e
duas bagagens ficam com o mesmo número de etiqueta.
O passageiro JOSE fez check-in para o aeroporto A. Na hora de
despachar a sua bagagem, o colaborador se confundiu e despachou a
mala em nome de outro cliente, com outro destino.
Um colaborador de check-in estava atendendo um cliente no balcão e
a impressora parou de funcionar. Quando a impressora voltou a
funcionar, ao invés de emitir a etiqueta do cliente que estava sendo atendido, ela reimprimiu a etiqueta do cliente anterior. Além de existir
duas bagagens diferentes, com a mesma numeração de etiqueta, o
cliente teve a sua bagagem etiquetada em nome de outro passageiro."
"RL16 BAGAGEM DESCEU PELA ESTEIRA APÓS ENCERRAMENTO DO CHECK-IN, COM ETIQUETA AUTOMATIZADA (Responsabilidade base responsável pelo check-in)

Quando a bagagem é deixada no check-in, embora corretamente

etiquetada.

O passageiro JOSE fez o seu check-in e despachou a sua bagagem às
09h. O colaborador que fez o seu atendimento, deixou a sua bagagem
separada no check-in, mas acabou se esquecendo que o horário de
encerramento deste voo era 09h15 e acabou enviando a sua bagagem
pela esteira às 09h17. Quando a equipe de rampa recebeu esta
bagagem, o voo já estava encerrado e o porão da aeronave estava

fechado.

RL17 ETIQUETA AUTOMATIZADA ANTIGA NÃO REMOVIDA DA BAGAGEM (Responsabilidade base responsável pelo check-in)

Quando se etiqueta uma bagagem e não remove a etiqueta antiga.
O passageiro JOSE foi atendido e a sua bagagem foi despachada,
porém quando a sua bagagem foi enviada pela esteira, ao chegar na
área de triagem, um colaborador percebeu que a sua mala tinha duas
etiquetas com destinos diferentes e datas diferentes. Com essa
divergência, a equipe de check-in foi acionada para verificar, porém
quando conseguiram verificar qual era a etiqueta correta o voo já havia

sido encerrado.

20 GRUPO DE RL: BASE DE ORIGEM – CARREGAMENTO
RL21 DEIXADA NA ORIGEM EMBORA CORRETAMENTE ETIQUETADA (Responsabilidade base responsável pela rampa)

A bagagem é deixada na área de rampa embora tenha sido
corretamente etiquetada pelo check-in.

A bagagem do passageiro foi etiquetada corretamente, do aeroporto A
para B. Porém, depois de ser enviada pela esteira e passar pela
triagem, foi deixada separada para seguir para a aeronave no horário
correto. A mala acabou sendo esquecida com a equipe de rampa,
apesar de ter sido etiquetada corretamente e ter sido enviada para

triagem no horário correto.

RL23 BAGAGEM STAND-BY NÃO EMBARCADA S. Pax (Responsabilidade base responsável pelo check-in)
O embarque de um passageiro stand-by é autorizado e a bagagem

stand-by não é embarcada.

O passageiro que antecipa o voo e a bagagem é deixado com uma

etiqueta de stand-by.

O passageiro staff JOSE despachou a sua bagagem no aeroporto A
com destino ao aeroporto B. Sua bagagem recebeu uma etiqueta de
STAND-BY no check-in e ficou separada. Antes do horário de
encerramento do voo, o embarque do passageiro staff foi autorizado e
o carregamento da bagagem também, porém a bagagem acabou
ficando no aeroporto A, o que gerou um relatório de extravio no

aeroporto B.

O passageiro staff JOSE, iria embarcar do aeroporto A para B no voo
LA02, porém conseguiu antecipar o seu voo para o voo LA01. Ele notificou a equipe de check-in sobre a sua mudança de voo, porém
quando chegou no aeroporto B, recebeu a notícia de que a sua
bagagem ficou no aeroporto A (origem)."
"RL25 ETIQUETA GATE/MANUAL/OFFLINE OCASIONOU O EXTRAVIO DA BAGAGEM (Responsabilidade base responsável pelo check-in)

Quando as dimensões da bagagem de mão estão acima do permitido e
a bagagem recebe etiqueta gate, manual ou offline. Se a etiqueta foi
mal preenchida; ou a não inserção desta etiqueta prejudicou a
visibilidade da bagagem na documentação de carregamento do avião,

este RL deve ser utilizado no PIR.

O passageiro JOSE está no embarque do seu voo, mas a sua bagagem
de mão precisou ser despachada. A bagagem recebeu uma etiqueta
gate, manual ou offline. (I) Houve um problema e a bagagem do
passageiro JOSE não foi carregada na aeronave; (II) houve um erro no
preenchimento da etiqueta e isso ocasionou o extravio da bagagem; (III)
a falta de inserção dessa etiqueta no sistema, acabou ocasionando o

extravio da bagagem do passageiro JOSE.
RL27 PASSAGEIRO REITINERADO E BAGAGEM NÃO REITINERADA (ORIGEM) (Responsabilidade base responsável pelo check-in)

Quando um passageiro é reitinerado na origem, porém a bagagem não

é reitinerada.

O passageiro JOSE está no aeroporto A, embarcando para o aeroporto
B. Despachou a sua bagagem no voo LA02, porém posteriormente a
atendente de check-in informou ao passageiro que iria antecipar o seu
voo para o LA01, porém não etiquetou a sua mala para o novo voo.
Quando o passageiro chegou no destino final no aeroporto B,
constatou que a sua mala não estava na esteira e abriu um PIR de

extravio.

RL28 PASSAGEIRO ENDOSSADO E BAGAGEM NÃO TRANSFERIDA (Responsabilidade base responsável pelo check-in)
Quando aceitamos endosso de outras companhias, porém a bagagem

não é transferida.

A companhia aérea XYZ procurou a companhia aérea e repassou o cliente JOSE.
O cliente endossado embarcou em nosso voo do aeroporto A para o B,
porém ao chegar no destino final a sua bagagem não chegou. Foi
verificado que a bagagem ficou na origem com a companhia XYZ e o
PIR foi aberto normalmente com a etiqueta da outra empresa.
RL30 GRUPO DE RL: QUALQUER BASE – CARREGAMENTO E DESCARREGAMENTO

RL31 BAGAGEM CARREGADA EM AERONAVE ERRADA OU TRIAGEM ERRÔNEA (Responsabilidade base responsável pela rampa)

Quando a bagagem é carregada em um voo diferente do passageiro.
A passageiro JOSE com a rota A/B, chegou no destino final, porém a
sua bagagem não foi localizada no aeroporto B. A mala do cliente foi
carregada erroneamente para o aeroporto C.

RL32 BAGAGEM DESCARREGADA ERRONEAMENTE (Responsabilidade base responsável pela rampa)
Quando serviço ao passageiro solicita a retirada de uma bagagem e a
rampa erroneamente descarrega outra bagagem. Quando a bagagem deveria permanecer no porão, porém é

descarregada erroneamente.

A equipe de embarque do aeroporto A, sinalizou para a equipe de
rampa que a bagagem LA010101 deveria ser retirada do porão da
aeronave, pois o cliente não havia embarcado. A equipe de rampa
retirou do porão da aeronave a bagagem de etiqueta LA010102, ou

seja, a bagagem errada.

A equipe de rampa do aeroporto A, descarrega erronamente uma
bagagem com destino ao aeroporto B. O passageiro, dono da
bagagem, chega no aeroporto B e percebe que a sua bagagem não

chegou e abre um relatório de extravio."
"RL33 BAGAGEM NÃO DESCARREGADA (Responsabilidade base responsável pela rampa)
Bagagem não descarregada no destino indicado pela etiqueta.
Quando serviço ao passageiro solicita a retirada de uma bagagem e a
rampa não descarrega a bagagem. Porém, é necessário definir quais

evidências serão utilizadas.

Uma bagagem foi despachada com rota A/B. Quando a aeronave de
prefixo PRPR chegou ao aeroporto B, a equipe de rampa não
descarregou essa bagagem. A aeronave PRPR assumiu outro voo,
seguindo para o aeroporto C, onde a bagagem foi localizada. O equipe
de Serviço de Bagagem do aeroporto C recebeu a bagagem e fez as
tratativas para que a bagagem fosse embarca com RUSH e FWD para
o aeroporto B, que abriu um PIR para o cliente.
A equipe de Serviço de Passageiro do aeroporto A, solicitou para a
equipe de rampa que retirasse a bagagem LA010101 do porão da
aeronave, porém a equipe de rampa não localizou essa bagagem e o
porão da aeronave foi fechado, para que o voo seguisse para o destino

final.

RL34 BAGAGEM NÃO EMBARCADA, DEVIDO ERRO OPERACIONAL DE
ÁREAS PRÓPRIAS companhia aérea (DOT, COT, EOP, ETC)
Este código é utilizado quando uma área própria da companhia aérea (DOT, COT,
EOP, etc), com poder de decisão, solicita a paralisação de
carregamento de uma bagagem ou solicita a retirada da mala

erroneamente.

A bagagem do cliente foi despachada corretamente, porém um
colaborador da companhia aérea que faz parte da equipe de rampa como DOT,
COT ou EOP, solicitou que a bagagem não fosse carregada na
aeronave ou solicitou o descarregamento desta bagagem, porém o
cliente chegou no destino final B e abriu um relatório de extravio.
RL35 CARREGADA EM PORÃO ERRADO, ATRÁS DE CARGA OU EM CONTAINER ERRADO (Responsabilidade base responsável pela rampa)

Quando a bagagem é carregada em um porão ou container diferente da instrução de carregamento. A bagagem foi despachada no aeroporto A, com destino ao aeroporto
B. Na documentação de carregamento do voo, havia a informação de
que as bagagens com destino final aeroporto B, seriam carregadas em
porão específico. No aeroporto B, o porão indicado foi descarregado,
porém ficou faltando uma bagagem. O Serviço de Bagagem do
aeroporto B, abriu um PIR para o cliente. Posteriormente, a equipe de
rampa do aeroporto B localiza a bagagem do cliente em porão diferente
do que havia sido indicado na documentação do voo
A bagagem foi despachada no aeroporto A, com destino ao aeroporto
B. Na documentação de carregamento do voo, havia a informação de
que as bagagens com destino final aeroporto B, seriam carregadas em
porão específico. No aeroporto B, o porão indicado foi descarregado,
porém ficou faltando uma bagagem. O Serviço de Bagagem do
aeroporto B, abriu um PIR para o cliente. A aeronave assumiu um voo
do aeroporto B para o C. Quando a aeronave pousou no aeroporto C, a
equipe de rampa deste aeroporto localizou a bagagem e apontou o
porão no qual ela foi localizada. O Serviço de Bagagem do aeroporto C,
fez a mensagem de envio da bagagem, registrando que a mala foi

carregada no porão incorreto."
"40 GRUPO DE RL: BASE DE DESTINO
RL41 ENTREGUE EM ÁREA DE DESCARREGAMENTO ERRADA (Responsabilidade base responsável pela rampa)
Quando a bagagem é disponibilizada na esteira errada como, por

exemplo, em outro terminal.

A bagagem foi despachada do aeroporto A para o B e o voo deste
passageiro, teve suas malas restituídas na esteira 01 do desembarque.
O passageiro dono da bagagem, ficou aguardando a sua bagagem na
esteira 01. Porém, o colaborador de rampa se confundiu durante a
restituição de bagagem e colocou a bagagem na esteira 05.

RL42 DEMORA NA ENTREGA DA BAGAGEM NO DESEMBARQUE (Responsabilidade base responsável pela rampa)
Quando a bagagem é entregue no desembarque fora do horário

previsto.

O passageiro JOSE chegou no aeroporto de destino e está aguardando
a sua bagagem no desembarque. Porém, todos os outros clientes do
seu voo já localizaram suas bagagens e deixaram o desembarque. O sr
JOSE procurou um colaborador no desembarque, que acionou o time
de rampa que descarregou a aeronave, para verificar sobre essa
bagagem faltante. A bagagem foi localizada, porém está no terminal de
cargas e vai demorar mais 1h para chegar no desembarque. O
passageiro JOSE não pode aguardar, pois tem um compromisso.
RL44 RAZÃO NÃO DETECTADA, BAGAGEM LOCALIZADA (Responsabilidade base responsável pelo serviço de bagagem)
Quando a bagagem é localizada, porém o motivo do extravio não pode
ser detectado devido à falta de informação no processo (Ex.: voo e porão em que a bagagem chegou).

O passageiro JOSE abriu um relatório de extravio de bagagem. Porém,
após alguns minutos a sua bagagem foi localizada. Não foi possível
obter informação no sistema e também de algum colaborador, de como e onde essa bagagem foi localizada.

RL45 PASSAGEIRO NÃO DÁ CONTINUIDADE AO PROCESSO AHL (SEM CONTATO) (Responsabilidade base responsável pelo serviço de bagagem) Exclusivo HDQ/CBT: quando o passageiro não entra em contato
durante todo o período de buscas e indenização. Somente pode ser
utilizado depois que uma comunicação escrita é enviada ao

passageiro.

O passageiro JOSE abriu um relatório de extravio de bagagem no
aeroporto, porém a mala não foi localizada. A equipe de busca
secundária começou a fazer as buscas e por algum motivo o cliente
não responde os contatos. Somente a equipe HDQ/CBT (Central de
Bagagem) pode encerrar um PIR com este RL."
"50 GRUPO DE RL: BASE DE CONEXÃO
RL51 PASSAGEIRO REITINERADO, BAGAGEM NÃO REITINERADA (CONEXÃO) (Responsabilidade base responsável pelo check-in)

Quando um passageiro é reitinerado na conexão, porém a bagagem

não é reitinerada.

O passageiro JOSE está no aeroporto A, com conexão no aeroporto B
e com destino ao aeroporto C. Durante a conexão no aeroporto B, o
passageiro foi acomodado em outro voo. Ao chegar no aeroporto de
destino (C), a sua mala não foi localizada. Posteriormente, o
colaborador que estava atendendo o cliente verifica no sistema que a
sua bagagem não foi tratada no novo voo do cliente e vai chegar no

voo original.

RL53 BAGAGEM NÃO CONECTADA (CONGÊNERE/companhia aérea) - FORA DO MCT (Responsabilidade base responsável pelo check-in)

Quando a bagagem não é conectada devido atraso do voo da
congênere, tornando o MCT insuficiente.

O passageiro JOSE tem a rota A/B/C. Do aeroporto A até B, com a
companhia aérea XYZ e do aeroporto B até C, com a companhia aérea. O
primeiro voo do passageiro chegou com atraso no aeroporto B e isso
prejudicou a possibilidade de conectar a bagagem até o aeroporto C. O
aeroporto B tem um MCT (Minimum Connection Time) de 40 minutos e
só havia 35 minutos para conectar a bagagem. Por este motivo, o
tempo de conexão estava fora (abaixo) do MCT, o que acabou
ocasionando o extravio da bagagem. Nos RLs 53 e 54, a bagagem
chegou no ponto onde as companhias aéreas parceiras se encontram,

porém a mala não foi conectada.

RL54 BAGAGEM NÃO CONECTADA (CONGÊNERE/companhia aérea) - DENTRO DO MCT (Responsabilidade base responsável pelo check-in)

Quando a congênere não disponibiliza a bagagem no local pré acordado.

O passageiro JOSE tem a rota A/B/C. Do aeroporto A até B, com a
companhia aérea XYZ e do aeroporto B até C, com a companhia aérea. O
aeroporto B tem um MCT (Minimum Connection Time) de 40 miutos e o
primeiro voo do passageiro chegou com mais de 3 horas de conexão,
ou seja, dentro do MCT (acima do tempo mínimo de conexão). No
aeroporto B (de conexão), a companhia aérea XYZ acabou cometendo
uma falha e não repassou a bagagem para a companhia aérea em tempo hábil,
ocasionando o extravio da bagagem. Nos RLs 53 e 54, a bagagem
chegou no ponto onde as companhias aéreas parceiras se encontram,porém a mala não foi conectada."
"RL55 BAGAGEM NÃO CONECTADA (companhia aérea/companhia aérea) - DENTRO DO MCT (Responsabilidade base responsável pela rampa) Quando a bagagem não é conectada em voos companhia aérea para companhia aérea,

embora esteja dentro do MCT.

O passageiro JOSE tem a rota A/B/C e todos os voos serão operados
pela companhia aérea. O aeroporto B tem um MCT (Minimum Connection Time)
de 40 minutos e como o voo do passageiro chegou no voo horário,
havia um tempo de conexão superior a 3 horas, ou seja, uma conexão
dentro do MCT (acima do tempo mínimo mínimo de conexão). Porém,
por uma falha da equipe de rampa, a bagagem não foi conectada do
aeroporto B para o C, ocasionando o extravio da bagagem do

passageiro JOSE.

RL56 BAGAGEM NÃO CONECTADA (companhia aérea/companhia aérea) - FORA DO MCT (Responsabilidade base responsável pela rampa)
Quando a bagagem não é conectada em voos companhia aérea para companhia aérea,

pois está fora do MCT.

O passageiro JOSE tem a rota A/B/C e todos os voos serão operados
pela companhia aérea. O aeroporto B tem um MCT (Minimum Connection Time)
de 40 minutos e como o voo do passageiro chegou com atraso, o
tempo de conexão era de 30 minutos, ou seja, fora do MCT (abaixo do
tempo mínimo mínimo de conexão). A bagagem não foi conectada do
aeroporto B para o C, ocasionando o extravio da bagagem do passageiro JOSE.
60 GRUPO DE RL: AEROPORTOS GERAL
RL61 BAGAGEM NÃO EMBARCADA DEVIDO A FALHAS NÃO GERENCIÁVEIS (Ex: Greve) (Responsabilidade base responsável pelo check-in)

Quando há qualquer tipo de greve que impeça os passageiros de
receberem sua bagagem no destino final.

Para aeroportos onde se aplicam problemas severos de meteorologia.
Quando há manutenção não programada e / ou manutenção
programada e o passageiro é alterado de voo sem bagagem.
Quando não é possível abrir os porões, devido à contingência

operacional.
Caída de sistema generalizada.

O passageiro JOSE chegou no aeroporto de destino final, porém a sua
bagagem ficou em outro aeroporto, pois estava ocorrendo uma greve
de colaboradores, que impediu que a sua mala chegasse junto com ele.
A bagagem do passageiro JOSE não pode ser restituída no aeroporto
de destino final, pois estava nevando muito no aeroporto de origem, o
que impediu que a sua bagagem fosse carregada no avião.
O passageiro JOSE estava dentro da aeronave, porém foi anunciado
que por uma manutenção na aeronave (seja programada ou não), não
seria possível carregar as bagagens de todos os clientes. Por este
motivo, ao chegar no destino final, o passageiro JOSE precisou abrir

um relatório de extravio.

A bagagem do passageiro JOSE foi carregada no porão da aeronave,
porém ao chegar no destino final, havia uma contingência operacional que impediu que a sua bagagem fosse retirada do porão e restituída na

esteira do desembarque.

O passageiro JOSE fez o seu check-in no aeroporto A e embarcou na
aeronave, porém houve uma queda de sistema em todo o aeroporto o
que impediu que várias bagagens fosse separadas para os voos
corretos. Por este motivo, a bagagem do JOSE ficou no aeroporto de

origem."
"RL63 SEGURANÇA AEROPORTUÁRIA (Responsabilidade base responsável pelo check-in)
Quando a bagagem não chega ao destino final devido à retenção por

órgão de segurança (Ex.: TSA).

O passageiro JOSE despachou a sua bagagem, porém ao chegar na
área de rampa um colaborador sentiu que ela estava vibrando. Por este
motivo, acionou a equipe de segurança do aeroporto e relatou o
ocorrido. Essa bagagem foi isolada e posteriormente um agente da
polícia local pegou essa bagagem, realizou várias procedimentos
prévios de segurança e foi autorizado a abrir a bagagem. Dentro da
bagagem foi localizada uma escova de dentes elétrica. Todo o
procedimento de segurança demorou mais 3 horas, por este motivo, ao
chegar no destino final, foi aberto um relatório de bagagem extraviada.
RL64 FALHAS DE INFRAESTRUTURA (Ex: Esteiras de bagagem, raio-x,etc) (Responsabilidade base responsável pelo check-in)

Quando há falhas de infraestrutura que impedem o embarque das bagagens.

O passageiro JOSE despachou a sua bagagem, porém o sistema de
esteiras de bagagem, que transporta as malas dos balcões de check-in
até a área de triagem para embarque na aeronave, apresentou uma
falha técnica. Por este motivo, ao chegar no destino final o passageiro

precisou abrir um relatório de extravio.

RL65 BAGAGEM NÃO EMBARCADA POR RESTRIÇÃO DE PESO E/OU ESPAÇO (CUBAGEM) (Responsabilidade base responsável pelo check-in)

Quando a bagagem não pode ser carregada devido à restrição de peso

e/ou espaço na aeronave/porão.

Ao sair a documentação do voo LA01, havia a informação de que a
aeronave estava acima do peso para pousar na pista do aeroporto B.
Por este motivo, foi solicitado o descarregamento de 500kg de
bagagem da aeronave. Esta medida ocasionou o extravio de bagagem

de vários passageiros.

RL67 POLICIA FEDERAL, IMIGRAÇÃO (Ex: Passageiro deportado) (Responsabilidade base responsável pelo check-in)

Quando há retenção da bagagem por estes órgãos, incluindo
passageiros inadmitidos ou deportados.

Um passageiro embarcou em um voo internacional, porém ao chegar
no aeroporto B, as autoridades locais de imigração não permitiram a
entrega deste cliente. O passageiro foi acomodado no próximo voo de
retorno, porém não foi possível conectar a sua bagagem.
Um passageiro embarcou do aeroporto A para o aeroporto B, mas ao
chegar no destino final a sua bagagem não foi localizada e abriu um
relatório de extravio. Mais tarde, a equipe de Serviço de Bagagem do
aeroporto B inseriu uma informação no sistema informando que, a bagagem do passageiro foi retida pela autoridade policial do aeroporto
de origem, alegando que havia algo ilícito ou perigoso dentro da

bagagem."
"70 GRUPO DE RL: MISCELÂNEA
RL72 PAX DESEMBARCADO DA AERONAVE, PORÉM BAGAGEM NÃO (SEGURANÇA MANDATÓRIA) (Responsabilidade base responsável pelo check-in)

Quando o cliente não embarca no voo, porém a bagagem não é descarregada.

O passageiro JOSE passou mal antes do embarque do seu voo e não
conseguiu entrar na aeronave. Ao procurar um colaborador da
companhia aérea, foi possível verificar que a bagagem do passageiro
não foi retirada da aeronave. O passageiro precisou abrir um relatório
de extravio de bagagem, pois informou que não vai seguir viagem para seu destino em outro voo.

O passageiro JOSE chegou no seu destino final, porém a sua bagagem
não foi localizada. Ao procurar um colaborador da companhia aérea do
aeroporto destino, foi verificado que o cliente não estava embarcado no
sistema. Por este motivo, no aeroporto de origem, a equipe de Serviço
ao Passageiro solicitou a retirada da sua bagagem. O passageiro abriu
um relatório de extravio no aeroporto de destino.
RL73 BUSCA POR EXCEÇÃO - BAGAGEM NÃO RETIRADA PELO PASSAGEIRO ONDE NECESSÁRIO (Responsabilidade base responsável pelo serviço de bagagem)

Quando o passageiro não retirar a bagagem onde necessário, por
exemplo, (I) quando cliente não retira a sua bagagem para passar pela
alfândega ou em (II) casos de rota com trecho """"surface"""".
* Surface: troca de aeroporto com um trecho terrestre entre eles, como no caso de AEP e EZE; CGH e GRU.

* Considerando que os relatórios criados como “busca por exceção”
não são culpa da companhia aérea, estes não devem gerar custos. Ou
seja, não devemos emitir compensação para auxílio emergencial, não
realizamos a entrega da bagagem através de transportadora, não
indenizamos o cliente em caso de extravio definitivo, etc.
O passageiro JOSE tem um voo de SCL/GRU/FLN. No primeiro
aeroporto dentro do Brasil, o passageiro tem a responsabilidade de
pegar a sua mala na esteira e fazer o procedimento alfandegário.
Porém, JOSE esquece de retirar a sua mala e segue para o destino
final. Ao chegar em FLN, procura um colaborador da companhia aérea
para relatar que a sua mala não foi restituída na esteira do voo
GRU/FLN. O colaborador questionou o passageiro se ele retirou a sua

mala em GRU e JOSE responde que não.

O passageiro JOSE tem um voo BEL/GRU - CGH/POA, ou seja, em
São Paulo há uma troca de aeroporto via terrestre (""surface""). Neste
caso, o cliente precisa pegar a bagagem dele na esteira em GRU, pegar
um transporte terrestre até CGH e redespachar a sua bagagem. Porém,
o passageiro JOSE não realiza esse procedimento. Ao chegar em POA,
procura um colaborador da companhia aérea para relatar que a sua
mala não foi restituída na esteira do voo CGH/POA. O colaborador
questionou o passageiro se ele retirou a sua mala em GRU e
redespachou em CGH, porém JOSE responde que não."
"RL74 TROCA DE BAGAGEM PELO PASSAGEIRO (Responsabilidade base responsável pelo serviço de bagagem)
Quando o passageiro leva a bagagem que pertence a outro cliente.
O passageiro JOSE, ao chegar no aeroporto de destino final, fica
aguardando a restituição de bagagem na esteira do seu voo, porém a
sua bagagem não chegou. JOSE abriu um relatório de extravio de
bagagem. Mais tarde, um colaborador do Serviço de Bagagem atendeu
um cliente que informou ter retirado uma bagagem que não é sua.
Quando o colaborador verificou as informações na etiqueta, foi possível
identificar que é a bagagem do passageiro JOSE.

75 ARMA DE FOGO (OU ESPADAS MILITARES) (Responsabilidade base responsável pelo check-in)
Quando ocorrer extravio de armas de fogo ou espadas militares.
O passageiro JOSE despachou a sua arma de fogo, mediante todos os
procedimentos necessários. Porém, ao chegar no aeroporto de destino

final, sua arma de fogo não chegou.

RL76 BAGAGEM ENCONTRADA SEM ETIQUETA (OHD) (Responsabilidade base responsável pela rampa)
Quando a bagagem é encontrada sem etiqueta e o Fault Station - FS é
sempre designado para o aeroporto onde a bagagem é encontrada.
O passageiro JOSE despachou a sua bagagem, porém essa não
chegou ao destino final. Mais tarde foi possível um colaborador verificar
no sistema, de que havia uma mala com características externas
parecidas com a mala do JOSE. O colaborador entrou em contato com
o passageiro e relatou alguns conteúdos da bagagem, que foi
localizada sem etiqueta em outro aeroporto. JOSE confirmou que é a sua bagagem.

RL77 FALHA DE ETIQUETAGEM DE COMPANHIA AÉREA PARCEIRA OU
QUANDO A BAGAGEM NÃO É CARREGADA PELA COMPANHIA AÉREA PARCEIRA E FICA NA ORIGEM (Responsabilidade base responsável pelo check-in)

Quando a bagagem é extraviada devido a (I) erros de etiquetagem de
outra empresa ou (II) quando a bagagem não sai do aeroporto de
origem, ou seja, continua em posse da companhia aérea parceira. Para
este RL, como ""Fault Station"" (FS) deve ser apontado o primeiro
aeroporto companhia aérea envolvido na rota do passageiro.
A passageiro JOSE vai viajar pela rota A/B/C. O voo do aeroporto A até
o aeroporto B, é operado pela companhia aérea XYZ; e o voo do
aeroporto B até o aeroporto C, é operado pela companhia aérea. A bagagem do
JOSE não chegou no destino final. Após as etapas de busca da
bagagem, foi possível verificar que a sua bagagem não foi conectada
até o destino final, pois (I) a etiqueta foi emitida pela companhia aérea
XYZ de forma incorreta ou; (II) a bagagem ficou na origem da sua
viagem, em posse da companhia aérea XYZ.

RL78 RAZÃO NÃO DETECTADA, BAGAGEM NÃO LOCALIZADA (Responsabilidade base responsável pelo serviço de bagagem)
Exclusivo HDQ/CBT: quando o processo está em busca secundária ou indenização.

A bagagem do passageiro não foi localizada e o relatório está sob
responsabilidade da equipe de ""busca secundária"", por este motivo,
deve receber o RL 78 e o FS será o aeroporto da máscara do relatório.
Caso a equipe de ""busca secundária"" não localize a bagagem, o
relatório será repassado para a equipe de indenização do Contact Center."
"RL79 BUSCA POR EXCEÇÃO - PROCESSO AHL CRIADO
ERRONEAMENTE, SEM O COMPROVANTE OU FORA DO PRAZO (Responsabilidade base responsável pelo serviço de bagagem)

-
1. Passageiros que não possuam etiqueta de bagagem e não possuam
registro de despacho de bagagem no sistema de check-in;
2. Passageiros que não fizeram alfândega no primeiro ponto alfandegário;

3. Passageiros que reclamam posteriormente, mesmo com comprovante de bagagem;
4. Passageiros com bilhetes separados;

5. Passageiros que tiveram malas retidas na origem e ou conexão
devido ter conteúdo não permitido para embarque, as quais são
aquelas mercadorias perigosas, podendo variar em cada país, como
por exemplo: power bank, aerossóis, baterias, cigarros eletrônicos,entre outros.

Obs: a busca de bagagem deve ser feita por 5 dias e se a bagagem
não for localizada, o processo deve ser encerrado no sistema.
* Considerando que os relatórios criados como “busca por exceção”
não são culpa da companhia aérea, estes não devem gerar custos. Ou
seja, não devemos emitir compensação para auxílio emergencial, não
realizamos a entrega da bagagem através de transportadora, não
indenizamos o cliente em caso de extravio definitivo, etc.
1. O passageiro JOSE não achou a sua bagagem no aeroporto de
destino final e procurou um colaborador da companhia aérea. O
colaborador pediu a etiqueta da bagagem para o passageiro, porém o
passageiro informou não ter localizado. O colaborador verificou nos
sistemas e não localizou nenhuma etiqueta de despacho de bagagem,vinculada a reserva do cliente.

2. O passageiro JOSE tem um voo de SCL/GRU/FLN. No primeiro
aeroporto dentro do Brasil, o passageiro tem a responsabilidade de
pegar a sua mala na esteira e fazer o procedimento alfandegário.
Porém, JOSE esquece de retirar a sua mala e segue para o destino
final. Ao chegar em FLN, procura um colaborador da companhia aérea
para relatar que a sua mala não foi restituída na esteira do voo
GRU/FLN. O colaborador questionou o passageiro se ele retirou a sua
mala em GRU e JOSE responde que não. O PIR é aberto como busca
por exceção e no encerramento, deve receber o RL 73 e FS ""aeroporto onde o cliente deveria ter feito a alfândega"".

3. O passageiro desembarcou, verificou que a sua mala não chegou no
destino final, mas deixou a área de desembarque para tomar um
lanche. Após 1h30min o passageiro procurou o Serviço de Bagagem e
pediu para abrir um PIR de extravio de bagagem.
4. O passageiro tem um ticket 001, com rota SCL/GRU e um outro
ticket 002, com rota GRU/FRA. Ao chegar no aeroporto de FRA,
verificou que a sua mala não estava disponível na esteira e solicitou atendimento da companhia aérea. 
não foi carregada, pois havia um ""power bank"" dentro. 5. O passageiro JOSE colocou dentro de sua mala um ""power bank""
(carregador portátil) e despachou a sua bagagem. Ao chegar no
aeroporto de destino final, verificou que a sua mala não chegou e foi
atendido pela companhia aérea. Algumas horas após a abertura do PIR,
o aeroporto de origem inseriu no sistema, a informação de que a mala"
"80 GRUPO DE RL: DANIFICAÇÃO
RL81 DANO MAIOR (Responsabilidade base responsável pela rampa)
Quando a bagagem danificada apresentaria possibilidade de conserto.

Ex: roda, alça, puxador e etc.

Se aplica a todos os casos de dano maior, independente da forma em
que o cliente foi compensado: compensação financeira, conserto, etc.
Enquanto um passageiro retirava a sua bagagem na esteira do
desembarque, percebeu um dano, de uma forma que comprometia a
funcionalidade ou descaracterizava a bagagem. O passageiro procurou
atendimento da companhia aérea e recebeu uma compensação

financeira.

RL82 DANO TOTAL (Responsabilidade base responsável pela rampa)
Quando a bagagem danificada não apresentar possibilidade de
conserto, será necessário comprar/indenizar uma nova bagagem ao passageiro.

Se aplica a todos os casos de dano total, independente da forma em
que da forma em que o passageiro foi compensado: compensação financeira, reposição, etc.

Enquanto um passageiro retirava a sua bagagem na esteira do
desembarque, percebeu que a sua mala estava com um dano que não
poderia ser reparado. O passageiro procurou atendimento da
companhia aérea e recebeu uma compensação financeira.
RL83 PASSAGEIRO NÃO DÁ CONTINUIDADE AO PROCESSO DE DANIFICAÇÃO (SEM CONTATO) (Responsabilidade base responsável pela rampa)

Quando não é possível o contato com o cliente para resolução do caso.
Foi aberto um PIR para o cliente, que estava com pressa e pediu para
que o Serviço de Bagagem entrasse em contato com ele
posteriormente, para oferecer uma compensação financeira. Após
diversas tentativas de contato, o PIR foi encerrado sem resolução.
RL84 PROCESSO DPR CRIADO ERRONEAMENTE, SEM CONFERÊNCIA DO LIMITED RELEASE NO BRS (Responsabilidade base responsável pelo check-in)

Processo aberto sem conferência de Limited Release no BRS para
confirmar se a mala foi despachada danificada
Um passageiro despachou a sua bagagem danificada no aeroporto de
origem. O colaborador registrou o dano através do procedimento de
LIMITED RELEASE e tirou fotos da etiqueta e da bagagem danificada,
para registrar no sistema BRS. O aeroporto de destino final, abriu o PIR
sem verificar o sistema BRS. Mediante contestação, o aeroporto de
origem enviou um e-mail para os aeroportos envolvidos e foi possível
alterar o RL para 84 e o FS para o aeroporto de destino final."
"90 GRUPO DE RL: VIOLAÇÃO RL91 VIOLAÇÃO E DANIFICAÇÃO (Responsabilidade base responsável pela rampa)
Quando a bagagem é danificada e violada. As duas ocorrências podem
ter ocorrido na mesma bagagem ou em bagagens diferentes, do mesmo passageiro, no mesmo PIR.

Ao desembarcar, um passageiro retirou a sua bagagem na esteira e
verificou que a sua mala estava aberta, com o zíper danificado e
também notou falta de algumas peças de roupa.

RL92 VIOLAÇÃO (Responsabilidade base responsável pela rampa)
Quando o passageiro alega perceber conteúdo faltante em sua bagagem.

Ao desembarcar, um passageiro retirou a sua bagagem na esteira e ao
verificar o conteúdo, alegou estar faltando algumas peças de roupa.
RL93 PASSAGEIRO NÃO DÁ CONTINUIDADE AO PROCESSO DE VIOLAÇÃO (SEM CONTATO) (Responsabilidade base responsável pela rampa)

Exclusivo HDQ/CBT: quando o passageiro não entra em contato
durante o período de indenização. Somente pode ser utilizado depois
que uma comunicação escrita é enviada ao passageiro.
Para identificar objetos eletrônicos e/ou de valor que não serão indenizados.

O passageiro abriu o PIR no aeroporto e foi derivado para o Contact
Center ou este foi aberto diretamente pelo Contact Center. O cliente
não respondeu nenhuma tentativa de contato.

O passageiro alegou itens faltantes em sua bagagem, como eletrônicos
e/ou de valor. O PIR foi aberto para o cliente, porém de acordo com o
procedimento a companhia aérea não prossegue com uma

compensação financeira.

RL94 PROCESSO DPR CRIADO ERRONEAMENTE - (Responsabilidade base responsável pelo serviço de bagagem)
Quando o PIR de Damaged Bag - DPR é criado erroneamente
Quando o colaborador do Serviço de Bagagem insere um PIR em duplicidade.

RL95 VIOLAÇÃO DE BAGAGEM RETIDA NO PORTÃO DE EMBARQUE (Responsabilidade base responsável pela rampa)
Quando a mala de mão é retida na porta da aeronave, despachada
para o porão e constatada violação de itens eletrônicos.
O cliente apresentou uma etiqueta gate/manual/offline e procurou a
companhia aérea para abrir um PIR de violação, alegando falta de (I)
itens comuns (roupas, tênis, perfume) ou (II) itens eletrônicos."
"

---

MCT operacional

MCT operacional e impacto na tratativa

MCT significa Minimum Connection Time, ou tempo mínimo de conexão. Na tratativa de bagagem, ele ajuda a avaliar se havia tempo suficiente para a mala ser transferida entre voos. Quando o tempo é insuficiente ou crítico, o RL usado precisa refletir essa condição operacional.

TABELA DE CÁLCULO MCT companhia aérea RL51
Tipo de Conexão Tempo
DOM x DOM 0 min a 34 min
DOM x INTER 0 min a 39 min
INTER x INTER 0 min a 39 min RL56
Tipo de Conexão Tempo
DOM x DOM 35 min a 44 min
DOM x INTER 40 min a 1h14 min
INTER x INTER 40 min a 59 min RL55
Tipo de Conexão Tempo
DOM x DOM Acima de 45 min
DOM x INTER Acima de 1h15 min
INTER x INTER Acima de 60 min 
"
" O que é MCT?
MCT significa Minimum Connection Time (Tempo Mínimo de Conexão).
É o tempo mínimo necessário entre dois voos para garantir que a bagagem seja transferida corretamente entre eles. Cada tipo de conexão (doméstico-doméstico, doméstico-internacional ou internacional-internacional) exige um tempo mínimo diferente, dependendo também da complexidade da operação.

A companhia aérea classifica os atrasos no manuseio de bagagens conforme esses tempos mínimos, utilizando os códigos RL (Reason for Loss – Motivo da Perda). Os RLs permitem identificar se o problema ocorreu por tempo insuficiente de conexão.

Como funcionam as métricas da tabela:
A tabela está dividida em três blocos, de acordo com os códigos RL51, RL56 e RL55:

RL51 – Tempo de conexão abaixo do mínimo aceitável
DOM x DOM: 0 a 34 minutos

DOM x INTER: 0 a 39 minutos

INTER x INTER: 0 a 39 minutos
️ Nessas faixas, a conexão é considerada inviável, pois o tempo está abaixo do mínimo recomendado.

RL56 – Tempo de conexão considerado crítico
DOM x DOM: 35 a 44 minutos

DOM x INTER: 40 min a 1h14 min

INTER x INTER: 40 a 59 minutos
️ Nessas faixas, a conexão é tecnicamente possível, mas ainda existe alto risco de perda de bagagem, sendo necessário monitoramento.

RL55 – Tempo de conexão adequado
DOM x DOM: Acima de 45 minutos

DOM x INTER: Acima de 1h15 minutos

INTER x INTER: Acima de 60 minutos
️ Nessas faixas, o tempo é suficiente para garantir a transferência da bagagem, sem risco operacional, salvo exceções.

Obs:Não existe MCT no trecho INTER X DOM devido o cliente ter que efetuar alfândega,neste caso é iniciado um novo trecho doméstico. Esse controle ajuda a entender e prevenir perdas de bagagem por conexões apertadas, além de apoiar melhorias operacionais e ajustes de malha aérea. "
"

Como interpretar o MCT

RL51 indica tempo abaixo do mínimo aceitável. A conexão é considerada inviável para transferência segura da bagagem.

RL56 indica conexão crítica. A transferência é tecnicamente possível, mas existe risco alto e a operação precisa ser monitorada.

RL55 indica tempo adequado. Em regra, havia tempo suficiente para transferência, então se a bagagem não chegou, a causa pode estar em outra etapa operacional.

Ponto de atenção

Não existe MCT para conexão internacional x doméstica quando o passageiro precisa fazer alfândega e iniciar novo trecho doméstico. Nessa situação, a análise deve considerar retirada, alfândega, redespacho e nova aceitação da bagagem.

---

Areas de transferencia

Áreas de transferência e fluxo de análise

A análise de tratativa precisa considerar onde a bagagem deveria passar fisicamente. A mesma rota pode envolver áreas diferentes, como transferência doméstica, sala ATI, recheck-in, área ar, área terra, triagem, rampa e restituição. O RL fica mais preciso quando o agente identifica em qual ponto o processo quebrou.

Principais Áreas de Transferência de Bagagem e Aplicação dos RLs
Os RLs (Reason for Loss) como RL51, RL56 e RL55 são aplicados principalmente em operações de conexão de bagagens entre voos, onde o tempo é um fator crítico para garantir que as malas cheguem corretamente ao destino final. Esses códigos são utilizados para analisar falhas e riscos nas áreas abaixo:

1. ÁREA DE TRANSFERÊNCIA DOMÉSTICO x DOMÉSTICO (DOM x DOM)
Quando o passageiro chega de um voo doméstico e embarca em outro voo doméstico.(Local de tratativa Lonado,caso a babagem tenha sido desembarcada)
Exemplo: Porto Alegre → São Paulo → Salvador
Aplicação dos RLs:

Conexão menor que 34 min (RL51)

Conexão crítica entre 35 e 44 min (RL56)

Ideal acima de 45 min (RL55)

2. ÁREA DE TRANSFERÊNCIA DOMÉSTICO x INTERNACIONAL (DOM x INTER)
Quando o passageiro chega de um voo nacional e embarca em um voo internacional.(Locais de tratativa:Sala ATI(Área ar) e Recheck-in (área terra)
Exemplo: Curitiba → São Paulo → Miami
Aplicação dos RLs:

Tempo abaixo de 39 min (RL51)

Tempo crítico entre 40 min e 1h14 (RL56)

Ideal acima de 1h15 (RL55)

3. ÁREA DE TRANSFERÊNCIA INTERNACIONAL x INTERNACIONAL (INTER x INTER)
Quando o passageiro faz conexão entre dois voos internacionais.(Locais de tratativa:Sala ATI(Área ar) e Recheck-in (área terra)
Exemplo: Buenos Aires → São Paulo → Londres
Aplicação dos RLs:

Conexão menor que 39 min (RL51)

Conexão crítica entre 40 e 59 min (RL56)

Ideal acima de 60 min (RL55)

Essas áreas de conexão são monitoradas continuamente para identificar gargalos e reduzir o índice de bagagens extraviadas. O uso correto dos RLs ajuda na análise de performance operacional e na prevenção de falhas logísticas."
"

Fluxo sugerido de análise

1. Confirme a rota real do passageiro e da etiqueta.
2. Verifique se houve conexão e qual era o tempo disponível.
3. Identifique se o trecho era doméstico, internacional ou misto.
4. Confirme se havia obrigação de retirada para alfândega ou redespacho.
5. Consulte se há mensagens de encaminhamento, rush, FWD, ROH/FOH ou registro de localização.
6. Só depois escolha o RL e o FS.

Exemplo de raciocínio

Se a mala tinha conexão doméstica para doméstica com tempo abaixo do mínimo, o foco da tratativa será MCT e risco operacional de conexão. Se a bagagem estava corretamente etiquetada e havia tempo adequado, mas ficou na origem, a análise se desloca para carregamento, triagem ou rampa.

---

Casos praticos de RL

Casos práticos e aplicação correta

Esta trilha reúne o guia prático do material para consolidar a escolha dos RLs com exemplos. Use como apoio para comparação entre cenários parecidos.

Guia Prático: Utilização Correta dos Códigos RL (Reason for Loss) - companhia aérea

Este guia tem como objetivo explicar de forma clara, objetiva e com exemplos, quando e como utilizar corretamente cada código RL (Reason for Loss) relacionado a extravio, falhas operacionais ou desvios no manuseio de bagagens na malha companhia aérea.

GRUPO RL 10: Base de Origem - Check-in

RL 11 - Etiqueta impressa incorretamente (borrada ou incompleta)

Quando a etiqueta automatizada está ilegível, rasurada ou apresenta falhas na impressão.
Ex: Bagagem etiquetada para GRU mas impressão ficou ilegível, sendo enviada para o destino errado.

RL 12 - Etiqueta sem destino final

Quando a etiqueta é emitida apenas até um ponto intermediário.
Ex: Passageiro voa A/B/C, mas etiqueta foi emitida apenas A/B.

RL 13 - Contratos/tickets separados

Quando a bagagem é etiquetada até o destino final mesmo com bilhetes de companhias diferentes.
Ex: companhia aérea (A/B) e conexão com outra companhia (B/C), e bagagem segue até C, sem transferência formal.

RL 15 - Etiqueta anexada em bagagem errada

Erro de atendente ao colar etiqueta de um passageiro na mala de outro.

RL 16 - Bagagem despachada após o encerramento do check-in

A mala entra na esteira fora do tempo hábil, mesmo estando correta.

RL 17 - Etiqueta antiga não removida

Quando uma mala possui etiquetas antigas que geram confusão na triagem.

GRUPO RL 20: Base de Origem - Carregamento

RL 21 - Deixada na origem, embora corretamente etiquetada

Erro da equipe de rampa em não carregar a bagagem.

RL 23 - Bagagem stand-by não embarcada

Passageiro antecipado, mas mala com etiqueta stand-by não foi embarcada.

RL 25 - Etiqueta manual/gate/offline causou extravio

Uso incorreto ou falha no preenchimento de etiqueta feita na porta de embarque.

RL 27 - Pax reitinerado na ORIGEM e mala não 

Mudança de voo não acompanhada pela reetiquetagem da bagagem.

RL 28 - Passageiro endossado e bagagem não transferida

Passageiro de outra companhia voa com companhia aérea, mas mala fica com a anterior.

GRUPO RL 30: Qualquer base - Carregamento/Descarregamento

RL 31 - Bagagem carregada em voo errado

Erro na triagem/carregamento. Ex: bagagem vai para C ao invés de B.

RL 32 - Descarregada erroneamente

Bagagem retirada do porão sem necessidade ou de outro passageiro.

RL 33 - Não descarregada

A mala seguiu para outro destino por não ter sido retirada da aeronave.

RL 34 - Falha operacional companhia aérea (DOT, COT, EOP)

Bagagem retirada ou bloqueada por decisão interna da companhia.

RL 35 - Carregada em porão/container errado

A bagagem foi colocada em local diferente do indicado na documentação.

GRUPO RL 40: Base de Destino

RL 41 - Entregue em área errada

Ex: esteira ou terminal diferente do correto.

RL 42 - Demora na entrega da bagagem

Restituição fora do tempo previsto, impactando o cliente.

RL 44 - Razão não detectada (bagagem localizada)

Quando se encontra a bagagem, mas não se identifica a causa do erro.

RL 45 - Pax não dá continuidade ao AHL

Usado apenas pela central HDQ/CBT após falta de contato do cliente.

GRUPO RL 50: Base de Conexão

RL 51 - Pax reitinerado na CONEXÃO e mala não 

Bagagem continua na rota original, sem alteração.

RL 53 - Não conectada (Congênere/companhia aérea) - fora do MCT

Atraso da primeira perna impossibilita conexão da mala.

RL 54 - Não conectada (Congênere/companhia aérea) - dentro do MCT

Companhia parceira falha em entregar a mala mesmo com tempo hábil.

RL 55 - Não conectada (companhia aérea/companhia aérea) - dentro do MCT

Falha da companhia aérea em conexão dentro do tempo mínimo.

RL 56 - Não conectada (companhia aérea/companhia aérea) - fora do MCT

Atraso inviabiliza a conexão da bagagem.

GRUPO RL 60: Aeroportos Geral

RL 61 - Falhas não gerenciáveis (Ex: greve)

Eventos externos que impedem o carregamento/restituição.

RL 63 - Segurança aeroportuária

Bagagem retida para inspeção (ex: objeto suspeito).

RL 64 - Falhas de infraestrutura

Esteiras paradas, raio-X fora de operação, etc.

RL 65 - Restrição de peso e/ou cubagem

Quando a aeronave não comporta todas as malas por peso ou volume.

RL 67 - PF/Imigração

Bagagens de passageiros deportados ou retidos por órgãos oficiais.

"

Como fechar a tratativa com qualidade

Ao finalizar um processo, o agente deve garantir que o histórico explique o caminho tomado: qual evidência foi consultada, por que aquele RL foi escolhido, qual FS foi atribuído, que orientação foi dada ao passageiro e qual ação operacional ficou pendente ou concluída.

Critérios para não errar

Nunca escolha RL apenas pelo efeito percebido pelo passageiro. Uma mala não localizada pode ter causa em check-in, rampa, conexão, alfândega, autoridade, conteúdo proibido, falha de parceiro ou razão não detectada. A tratativa correta nasce da causa provável, não apenas do sintoma.

Quando houver dúvida, registre a análise no histórico e mantenha o processo rastreável para supervisão ou continuidade operacional.$mat_tratativa_rl_mct$),
('bagagem-sem-etiqueta-ohd', $json_bagagem_sem_etiqueta_ohd$[{"title":"Definição de OHD","type":"Aula","duration":"14 min","content":"Definição de OHD\n\nBAGAGEM SOBRANTE - On-Hand Bag - OHD\n3.1. DEFINIÇÃO\nEntende-se como bagagem sobrante On-Hand Bag - OHD:\n● Bagagens etiquetadas que não são retirados pelos passageiros da esteira do\ndesembarque;\n● Bagagens localizadas sem etiqueta de bagagem.\nA bagagem desacompanhada normalmente ocorre quando a bagagem é devolvida ao\npassageiro após ter sido manuseada de maneira inadequada.\nEm alguns casos, por procedimento das autoridades locais e as restrições das\ncompanhias aéreas, a bagagem despachada para o trecho seguinte não pode\nser descarregada no caso de um erro de conexão.\n3.1.1. Esteira de bagagem de desembarque\nSe a esteira de bagagem estiver sobrecarregada com muitas bagagens, o agente deve\nremovê-las e colocá-las em segurança em um local que não represente um risco para a\nsegurança dos passageiros.\nUma vez que todas as bagagens tenham sido entregues no desembarque e os passageiros\ntenham deixado esta área, o agente deve revisar a esteira e remover as bagagens indicadas\ncomo RUSH e quaisquer malas não reclamadas ou esquecidas e levá-las a sala do LL para\nregistrar no sistema e realizar as devidas buscas.\n3.2."},{"title":"QOH temporario","type":"Procedimento","duration":"16 min","content":"QOH temporário, conteúdo e CC\n\nO QOH temporário deve preservar informação suficiente até a criação ou regularização do OHD. Conteúdo e CC precisam ser descritos com detalhes em inglês, evitando termos genéricos quando houver itens diferenciados.\n\nQOH temporário\n\nREGISTRO DE QUICK ON-HAND BAG - QOH\nÉ a inserção de bagagens sobrantes que tenham etiqueta de bagagem anexada. O Quick\nOn-Hand Bag - QOH é usado para situações onde não há tempo hábil para inserir um\nOn-Hand Bag - OHD completo, ou seja, é uma solução temporária.\nÉ obrigatório inserir o número da etiqueta no campo Tag Number - Local Delivery\nInstructions. Apenas uma linha de FI (Further Information) é permitida e o registro deste\ncampo é obrigatório com informações complementares, como nome do passageiro, voo,\ndata e modelo da bagagem. O Quick On-Hand Bag - QOH fca ativo no sistema por apenas\n24hrs. É extremamente importante que o On-Hand Bag - OHD seja feito antes deste período.\"\n\".\n\nO QOH é temporário e deve ser convertido em OHD completo antes do fim do prazo. Ele serve para garantir registro inicial quando não há tempo hábil para preencher todos os dados."},{"title":"Registro de OHD","type":"Pratica","duration":"22 min","content":"Registro de OHD, ROH e FOH\n\nO registro de OHD deve permitir comparação com AHL e eventual comunicação operacional. ROH solicita o envio de uma bagagem on-hand; FOH confirma o envio do OHD para a base solicitante, com voo, data, agente e observação.\n\nRegistro de OHD\n\nREGISTRO DE ON-HAND BAG - OHD\nAs bagagens sobrantes de aeroportos são inseridas no sistema SITA Worldtracer Desktop\natravés da máscara “On-Hand Bag - OHD”. Estas bagagens devem ser pesadas, lacradas e\nseus dados inseridos no sistema, campo Contents - CC, possibilitando a localização do\nproprietário com maior rapidez.\nDiante de situações excepcionais de falhas nas balanças (ex: falha elétrica) que não permita\nobter o peso real para entrada de bagagem com etiqueta rush, deve-se inserir o seguinte\npeso padrão de acordo com a rota:\nRota doméstica: 17 kgs\nRota Internacional: 20 kgs\nO Líder Operacional é responsável por gerenciar com a Administradora do Aeroporto que as\nbalanças sejam calibradas e funcionem da melhor forma possível. As balanças que fcam\ndentro das salas do Serviço de Bagagem e que não pertencem a administradora\naeroportuária devem ser calibradas através da abertura de chamado pelo Portal companhia aérea.\nQuando a bagagem for desembarcada indevidamente em seu aeroporto, porém consta o\ndestino na etiqueta, não se deve abrir On-Hand Bag - OHD. Neste caso, deve-se enviar a\nbagagem para o destino indicado na etiqueta, usando a etiqueta RUSH sob mensagem de\n\nO OHD deve conter características da bagagem, tag quando houver, conteúdo, local de guarda, descrição e informações complementares suficientes para permitir match com AHL."},{"title":"ROH, FOH e FLZ","type":"Simulacao","duration":"24 min","content":"ROH, FOH e FLZ\n\nROH solicitando o envio da bagagem\n(On-Hand Bag - OHD) e indicando o melhor voo, se necessário.\n3.3.3. Envio de On-Hand Bag - OHD para outro aeroporto\nSempre que um On-Hand Bag - OHD for solicitado é obrigatório enviar a bagagem de\nimediato no voo solicitado, não esquecendo de anexar uma cópia do Forward On-Hand Bag\n- FOH na etiqueta RUSH.\nPriorizar sempre os voos companhia aérea, porém caso seja necessário enviar a bagagem com outras\nempresas.\nOs agentes de aeroportos do exterior devem enviar as bagagens extraviadas para o Brasil de\nacordo com a rota realizada pelo passageiro, para que as bagagens não fquem retidas na\nReceita Federal e o passageiro não precise se deslocar para outro estado/cidade para fazer a\nliberação.\nPor este motivo, mesmo que a bagagem possa ser enviada mais rápido em voos para outras\ncidades do Brasil, o envio deve ser feito de acordo com a rota original, evitando transtornos\nao passageiro.\nAntes de enviar o On-Hand Bag - OHD o agente deve conferir as informações nos campos\nValid Until Date - DV, Permanent Contact Information - PA, Temporary Contact Information -\nTA e Extra information - FF.\nExemplo:\nA equipe de JFK precisa enviar um On-Hand Bag - OHD pertencente a uma\nDelayed Bag - AHL de GIG. Mesmo que haja opções mais rápidas de voos com\ndestino GRU, a equipe deve aguardar e enviar a bagagem somente no voo\nJFK/GIG.\n3.3.4. Envio de On-Hand Bag - OHD para o depósito/LZ\nTodos os On-Hand Bag - OHD abertos devem impreterivelmente ser enviados para o\ndepósito de bagagens após o 5º dia de sua inserção no sistema SITA Worldtracer Desktop.\nAntes de enviar o On-Hand Bag - OHD, o agente deve conferir se as inserções dos dados da\nbagagem estão coerentes e checar os matches gerados através do comando Forward\nDelayed Bag / History - FAHIS/M. Também deve verifcar se existe alguma solicitação\n“Request On-Hand Bag File - ROH”.\nPara enviar as bagagens para o depósito usamos o comando “FLZ”. A bagagem deve estar\nembalada em um saco plástico protetor, lacrada, pesada, com relação de conteúdo\ndetalhado (apenas no sistema) e com etiqueta RUSH. O processo deve permanecer aberto\nno sistema. Deve-se colocar uma cópia do \"\"FLZ\"\" anexa à etiqueta RUSH.\nSe houver artigos perecíveis dentro da bagagem, o agente deve descartá-los\nantes de enviar ao depósito de bagagens e informar a diferença de peso no\nExtra Information - FF.\"\n\"Recebimento de On-Hand Bag - OHD\nAo receber uma bagagem sob etiqueta RUSH, é necessário conferir se o peso e o número do\nlacre conferem com o mencionado na mensagem de envio. Em caso de divergência, deve-se\navisar de imediato o aeroporto remetente.\nEm caso de recebimento de um On-Hand Bag - OHD que não pertença ao seu\naeroporto, não se deve devolver a bagagem. Um novo On-Hand Bag - OHD\ndeve ser criado e, caso não seja localizado em 5 dias, deve-se proceder com o\nenvio ao depósito de bagagens. O On-Hand Bag - OHD somente deve ser\ndevolvido se pertencer a outra empresa.\n3.3.6. Encerramento de On-Hand Bag - OHD\nO encerramento do On-Hand Bag - OHD no sistema SITA Worldtracer Desktop somente\npoderá acontecer nas situações abaixo:\n● Entregando a bagagem ao passageiro no próprio aeroporto efetuando o comando\nClose File - COH, e inserir no Extra Information o nome da pessoa a quem a\nbagagem está sendo entregue, telefone ou e-mail e número do documento;\n● Enviando a bagagem para outro aeroporto, utilizando o comando \"\"Forward On-Hand\nBag - FOH\"\", contendo as informações: número da etiqueta RUSH, rota, voo, peso e\nlacre da bagagem.\nNenhum On-Hand Bag - OHD (incluindo carrinhos de bebê, guarda-chuvas etc.) deve ser\nfechado sem que tenha sido entregue ao passageiro ou enviado para outro aeroporto\nNos casos onde o passageiro responsável pela bagagem é localizado, o On-Hand Bag -\nOHD deve ser encerrado, sendo estabelecido um prazo de no máximo 15 dias para que a\nbagagem seja retirada no aeroporto.\nCaso o prazo seja excedido, a bagagem deverá ser enviada ao depósito de bagagem. Todas\nas informações devem constar no Extra Information - FF.\"\n\nROH é a solicitação de envio de um OHD por uma base que identificou provável correspondência com um AHL. FOH é o envio do OHD para a base solicitante. FLZ é usado para encaminhamento ao depósito quando não há solicitação ativa e o prazo operacional foi atingido."},{"title":"Recebimento e encerramento","type":"Procedimento","duration":"18 min","content":"Recebimento, entrega e encerramento\n\nO OHD pode ser encerrado após entrega correta ao passageiro, envio confirmado a outro aeroporto ou tratativa operacional concluída. A entrega precisa estar documentada, com identificação, evidência e histórico suficiente.\n\nRecebimento e encerramento\n\nAo receber uma bagagem enviada, a base deve conferir etiqueta Rush, lacre, peso, integridade, referência do OHD e vínculo com AHL quando houver. O OHD só deve ser encerrado quando for entregue ao passageiro, enviado formalmente para outra base ou encaminhado conforme procedimento.\n\nAntes de encaminhar ao depósito, verifique se existe solicitação ROH ativa. Se houver ROH, a prioridade é responder à base solicitante com FOH ou registrar a justificativa operacional."}]$json_bagagem_sem_etiqueta_ohd$::jsonb, $mat_bagagem_sem_etiqueta_ohd$Definição de OHD

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

QOH temporario

QOH temporário, conteúdo e CC

O QOH temporário deve preservar informação suficiente até a criação ou regularização do OHD. Conteúdo e CC precisam ser descritos com detalhes em inglês, evitando termos genéricos quando houver itens diferenciados.

QOH temporário

REGISTRO DE QUICK ON-HAND BAG - QOH
É a inserção de bagagens sobrantes que tenham etiqueta de bagagem anexada. O Quick
On-Hand Bag - QOH é usado para situações onde não há tempo hábil para inserir um
On-Hand Bag - OHD completo, ou seja, é uma solução temporária.
É obrigatório inserir o número da etiqueta no campo Tag Number - Local Delivery
Instructions. Apenas uma linha de FI (Further Information) é permitida e o registro deste
campo é obrigatório com informações complementares, como nome do passageiro, voo,
data e modelo da bagagem. O Quick On-Hand Bag - QOH fca ativo no sistema por apenas
24hrs. É extremamente importante que o On-Hand Bag - OHD seja feito antes deste período."
".

O QOH é temporário e deve ser convertido em OHD completo antes do fim do prazo. Ele serve para garantir registro inicial quando não há tempo hábil para preencher todos os dados.

---

Registro de OHD

Registro de OHD, ROH e FOH

O registro de OHD deve permitir comparação com AHL e eventual comunicação operacional. ROH solicita o envio de uma bagagem on-hand; FOH confirma o envio do OHD para a base solicitante, com voo, data, agente e observação.

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

ROH, FOH e FLZ

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

ROH é a solicitação de envio de um OHD por uma base que identificou provável correspondência com um AHL. FOH é o envio do OHD para a base solicitante. FLZ é usado para encaminhamento ao depósito quando não há solicitação ativa e o prazo operacional foi atingido.

---

Recebimento e encerramento

Recebimento, entrega e encerramento

O OHD pode ser encerrado após entrega correta ao passageiro, envio confirmado a outro aeroporto ou tratativa operacional concluída. A entrega precisa estar documentada, com identificação, evidência e histórico suficiente.

Recebimento e encerramento

Ao receber uma bagagem enviada, a base deve conferir etiqueta Rush, lacre, peso, integridade, referência do OHD e vínculo com AHL quando houver. O OHD só deve ser encerrado quando for entregue ao passageiro, enviado formalmente para outra base ou encaminhado conforme procedimento.

Antes de encaminhar ao depósito, verifique se existe solicitação ROH ativa. Se houver ROH, a prioridade é responder à base solicitante com FOH ou registrar a justificativa operacional.$mat_bagagem_sem_etiqueta_ohd$)
)
update public.academy_courses as c
set
    modules = u.modules,
    material = u.material
from course_content_update as u
where c.id = u.id;

-- Cursos neste lote:
-- bagagem-violada
-- bagagem-danificada
-- tratativa-rl-mct
-- bagagem-sem-etiqueta-ohd
