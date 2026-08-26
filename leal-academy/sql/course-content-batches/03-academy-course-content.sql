-- Lote 03: restaura conteudo completo dos cursos no Supabase.
-- Execute este arquivo no SQL Editor do Supabase.

with course_content_update(id, modules, material) as (
values
('dpr', $json_dpr$[{"title":"Quando abrir DPR","type":"Aula","duration":"12 min","content":"Bagagem danificada\n\"DANIFICAÇÃO - DAMAGED BAG - DPR\n4.1. DEFINIÇÃO\nDano na bagagem despachada. Damaged Bag - DPR (Damage Pilfer) é a sigla do sistema\nSITA Worldtracer Desktop.\nO agente deve ser capaz de identifcar a extensão do dano da bagagem, analisar seu preço\nde mercado e entregar a compensação fnanceira por Agente 360 ou Travel Voucher.\n4.2. PRAZO PARA ACEITAÇÃO\nO passageiro pode registrar a reclamação no desembarque ou em até 7 dias a contar da\ndata da chegada do voo.\nRota doméstica Argentina até 3 dias a contar da data da chegada do voo.\nQuando o passageiro informar a danifcação dentro da área de desembarque, o Property\nIrregularity Report - PIR deve ser aberto imediatamente.\nEm caso de danifcações procedentes de extravios, o passageiro tem até 21 dias\npara efetuar reclamação, a partir da data de recebimento da bagagem, incluindo\ncasos de Delayed Bag - AHL como busca por exceção. Em rota doméstica na\nArgentina, 10 dias desde o recebimento da bagagem.\nO objetivo é apresentar uma solução para o cliente no primeiro contato com a\ncompanhia aérea. O cliente tem direito de abrir o Property Irregularity Report - PIR de\nDamaged Bag - DPR (dano e/ou violação) em qualquer aeroporto com operação\ncompanhia aérea (mesmo que não faça parte de sua rota) ou no Contact Center.\n4.3. CRITÉRIOS PARA ACEITAÇÃO E REGISTRO DO PROPERTY\nIRREGULARITY REPORT - PIR FORA DO AEROPORTO\nAo entrar o passageiro em contato com Contact Center será orientado a enviar os seguintes\ndocumentos para comprovação do embarque:\n1. Cópia de seu documento de identifcação com foto;\n\n2. Cópia de seu cartão de embarque ou bilhete;\n3. Cópia da etiqueta de bagagem ou comprovante de despacho;\n4. Foto que comprove o dano.\nCaso o passageiro não apresente os itens 3 e 4, o agente deve consultar se há informação\ndisponível no sistema de check-in. Se não houver forma de comprovar a viagem do\npassageiro e o despacho da bagagem, o Property Irregularity Report - PIR não poderá ser\nregistrado.\"\n\" Contact Center\nAssim que o passageiro entra em contato com o Contact Center, a equipe verifca toda a\ndocumentação necessária, realiza as análises e registra o processo utilizando a sigla CCE.\nTodos os processos de danifcação registrados pelo Contact Center serão compensados e\nencerrados diretamente por eles. O aeroporto fcará responsável pela compensação dos\nprocessos de danifcação criados na área do desembarque ou na sala do Serviço de\nBagagem. No Extra Information deve constar todas as informações das tratativas feitas com\no passageiro.\nCaso o CCE abra o processo e coloque o Fault Station errado, o aeroporto poderá\nalterá-lo, sem ser necessário fazer contestação. Mas deve avisar a nova base do\nFault Station via e-mail, para que eles tenham ciência da alteração.\n4.4. INSERÇÃO NO SISTEMA SITA WORLDTRACER DESKTOP\nAs danifcações devem ser registradas no sistema SITA Worldtracer Desktop e todos os itens\nmandatórios devem ser preenchidos adequadamente.\n4.4.1. Códigos de danifcação\nO agente de bagagem deve identifcar no campo Damage/Location - TD do sistema SITA\nWorldtracer Desktop qual foi o tipo, a localização e a extensão do dano, conforme tabelas\nabaixo:\n\nELEMENTO LOCALIZAÇÃO EXTENSÃO DO DANO\nCÓDIGO DESCRIÇÃO CÓDIGO DESCRIÇÃO CÓDIGO DESCRIÇÃO\nTOP Superior 1 Alça/Puxador MI Desgaste por\nSIDE Lateral 2 Fechadura/Combinação MA Grande\nEND Onde fca o zíper 3 Buraco TL Total\nBOTT Inferior 4 Rasgo/Rachadura\n5 Arranhão\n6 Pé/ Rodas\n7 Zíper\n8 Tira/Cintas\n9 Armação\n10 Danifcação Total\n11 Mancha\n12 Fecho\n13 Dobradiças\n14 Amassado (Esmagado)\n15 Conteúdo\n16 Outros É obrigatório inserir no sistema SITA WorldTracer Desktop, o código e descrição\npor extenso do dano (campo 'Bag Details - BD'), assim como a marca, tamanho e\no tempo de uso da bagagem, os quais devem ser inseridos no campo Brand\nInformation.\"\n\"Atribuição de Fault Station - FS\nAo abrir um processo de danifcação no sistema, o agente deve preencher o Fault Station -\nFS e o Reason for Loss - RL do PIR:\n● Para voos diretos, o Fault Station será do aeroporto de origem;\n● Para voos com conexão, o Fault Station será o ponto de conexão anterior a base de\nabertura do Property Irregularity Report - PIR (não considerando escalas);\n● Para voos surface o Fault Station deverá ser considerado o anterior ao trecho\nefetuado via terrestre.\nExemplo: o passageiro fez MIA/GRU/CGH/SDUL (surface entre GRU e CGH) e foi\nao serviço de bagagens em CGH para registrar seu caso de dano. O Fault Station\nnesse caso é MIA.\nDESGASTE POR USO DANO MAIOR DANO TOTAL\nCorresponde ao desgaste\npor uso que, por sua\ndimensão ou\ncaracterística, é\nconsiderado consequência\nda manipulação e do\ntransporte normal da\nbagagem, não afetando\nsua funcionalidade.\n● Cantoneiras\n● Detalhes na bagagem\n● Cursor do zíper\n\n● Emblema/logomarca\n● Ausência/danifcação\ndo cadeado\n● Alça tiracolo\n● Cravo\n● Sujeira (esteira)\n● Arranhões\n● Pequenos Amassados\n● Capas em geral\n● Chaveiro\n● Pés de apoio\nCorresponde ao dano\nválido que afeta a\nfuncionalidade normal da\nbagagem:\n● Alça\n● Alça retrátil (Trip roll)\n● Rodas\n● Segredo\n● Rasgos que exponham\no conteúdo\n● Trilho do zíper\n● Amassado (até 20 cm)\n● Bagagem com mais de\ndois danos\n● Fibra rachada (até 20\ncm)\nCorresponde a danos\nestruturais:\n● Fibra rachada (acima de\n20 cm);\n● Rasgos (acima de 20\ncm);\n● Amassados (acima de\n20 cm) totalmente\ndestruídos. As ocorrências de desgaste por uso, frágil e bagagem previamente apresentada\nno check-in já danifcada, devem ser registradas somente no Formulário ANAC\nRESO 400, porém não haverá indenização e nenhuma área da companhia aérea fará\ncontato com o cliente. Após o colaborador preencher o formulário, o cliente\nreceberá um número de protocolo e a negativa de indenização. Para acessar o\nformulário.\nAs ocorrências de desgaste por uso, itens frágeis não compensados e​bagagem\npreviamente apresentada no check-in já danifcada serão registradas no\nFormulário de Dano para Bagagem e não haverá compensação.\"\n\"INFORMAÇÃO DA RESERVA E CHECK-IN\nAssim como no Delayed Bag (Delayed Bag - AHL) é obrigatório inserir na área MR dos\nprocessos de Damage Bag (Damaged Bag - DPR) o check-in, a reserva e o bilhete do\npassageiro. Vide procedimento no item 5. 2.4 de Extravio.\n4.7. TIPOS DE DANIFICAÇÃO\n4.7.1. Itens frágeis que devem ser compensados\nDeve-se registrar o Property Irregularity Report - PIR e indenizar os itens abaixo de\n\nacordo com a autonomia do aeroporto.  A compensação será sempre via A360 na\ncompanhia aérea Wallet ou Travel Voucher, SERVIÇOS ou CASH. Solicite ao cliente orçamento de\nconserto do item; caso o conserto não seja possível, solicite a nota fscal. Na ausência\nda nota fscal, solicite pelo menos 03 websites que possam comprovar o valor do item.\nCaso a indenização ultrapasse o valor da autonomia do aeroporto, deverá ser preenchido o\nformulário de derivação para fnalização pelo Contact Center.\n● Bicicleta;\n● Prancha de Surf, Stand Up Paddle, Snowboard;\n● TV ou monitor acima de 40 polegadas;\n● Violoncelo ou Tuba;\n● Ski, Bastões (neve ou aquático);\n● Arco e Flecha;\n● Hóquei;\n● Taco de Golfe;\n● Bodyboard;\n● Kitesurf/kiteboard;\n● Dardo;\n● Equipamento de Mergulho;\n● Pesca;\n● Paraquedas;\n● Contrabaixo;\n● Bumbo;\n● Cadeira de rodas;\n● Carrinho de Bebê ou cadeirinha;\n● Windsurf;\n● Wakeboard/ boogie board/ bodyboard;\n● Waveski;\"\n\" Itens frágeis que não devem ser compensados\nNão devemos registrar PIR para os itens da lista abaixo.\n● Perecível;\n● Caixa térmica;\n● Caixa de ferramenta;\n● Necessaire de maquiagem;\n● Porcelana, cerâmica;\n● Artigos de vidro (espelhos, cristais etc.);\n● Caixas de bebida;\n● Cases de instrumentos musicais;\n● Instrumentos musicais (violão, guitarra, violino, bateria, saxofone, harpa, teclado,\ntrombone, trompete, fauta etc.).\n● Artigos eletrônicos e mecânicos (rádio, amplifcadores, computadores etc.);\n● Equipamentos fotográfcos/cinematográfcos (câmeras fotográfcas, lentes, projetores\netc.);\n● Artigos de precisão (relógios, binóculos, microscópios etc.);"},{"title":"Codigos de dano","type":"Consulta","duration":"18 min","content":"Códigos de dano TD\n\nA trilha de códigos TD apresenta a combinação entre elemento da mala, localização e extensão do dano. O código deve indicar onde ocorreu o dano e qual parte foi afetada. Exemplos de localização incluem TOP, SIDE, END e BOTT; exemplos de elementos incluem alça, fechadura, buraco, rasgo, rodas, zíper, tira, armação, mancha, fecho, dobradiça e amassado.\n\nRegistrar o TD corretamente evita compensação indevida e melhora a análise do DPR.\n\nMaterial de apoio da trilha\n\n● Skate convencional e elétrico;\n● Patins, patinetes;\n● Esculturas, pinturas, quadros, obras de arte;\n● Produtos Náuticos;\n● Eletrodomésticos (TV ou monitor abaixo de 40 polegadas, Frigobar, micro-ondas\netc.)\nPara os aeroportos do Brasil, o agente deve registrar a reclamação apenas no\nFormulário online Resolução 400 e não haverá compensação.\nPara os aeroportos da Colômbia e Peru, o agente deve registrar a reclamação no\nFormulário online Dano em Bagagem e não haverá compensação.\n4.7.3. Dano de conteúdo\nObjetos dentro da bagagem, não se deve abrir Property Irregularity Report - PIR para\nquaisquer objetos danifcados dentro da bagagem (Ex.: bebidas, shampoo, perfume,\neletrônicos etc.) uma vez que a empresa não se responsabiliza por danos no conteúdo.\n4.7.4. Dano ocasionado por outra bagagem\nNos casos em que a bagagem e/ou seu conteúdo forem molhados de vinho ou água de\npeixe (procedentes de bagagens de outros passageiros), o passageiro deve providenciar a\nlavagem junto a uma lavanderia e enviar a nota para o aeroporto providenciar o reembolso.\nCaso o dano não seja reparado, o aeroporto deve indenizar a(s) peça(s) de acordo com o\nvalor de mercado e a Gerência local deve estar ciente.\"\n\" Dano ocasionado por chuva\nSomente deve-se registrar ocorrência para bagagens molhadas de chuva, se todas as\ncondições abaixo forem atendidas:\n● Quando houver algum conteúdo da bagagem danifcado (ex.: roupas manchadas).\n● Quando o conteúdo danifcado não for caracterizado como eletrônico, visto que este tipo\nde objeto não pode ser transportado em bagagem despachada.\n\n4.7.6. Dano na bagagem e seu conteúdo\nNos casos em que a bagagem e seu conteúdo forem danifcados e não houver reparo (ex.:\nbagagem danifcada pelo trator), o aeroporto deve listar todo o conteúdo danifcado\n(quantidade, descrição e marca das peças) e informar em Property Irregularity Report - PIR\nmodelo e marca da bagagem.\nO aeroporto deve solucionar o caso aplicando os critérios de indenização por dano.\n4.7.7. Bagagem recebida danifcada\nCasos em que o verso da etiqueta esteja assinado ou a etiqueta amarela LR (Limited\nRelease), pois os colaboradores do check-in identifcaram que a bagagem foi recebida\npreviamente danifcada.\nSe a etiqueta estiver assinada com limited release, deve-se registrar a\nreclamação apenas no formulário online (Resolução ANAC 400) e não haverá\ncompensação.\nPara os aeroportos brasileiros, o agente deve registrar a reclamação apenas no\nFormulário online Resolução 400. Para os aeroportos da Colômbia e do Peru,\nvocê deve registrar a reclamação no Formulário de Danos à Bagagem\n4.7.8. Danifcação de cadeira de rodas e equipamentos de locomoção\nQuando constatada a danifcação na cadeira de rodas do passageiro, o agente deverá:\n● Disponibilizar uma cadeira de rodas da companhia aérea, para os casos em que o passageiro\nnão puder utilizar sua cadeira de rodas até sua residência;\n● Providenciar o aluguel de uma cadeira de rodas dentro de 48 horas, para que o\npassageiro possa utilizar enquanto providenciamos o reparo ou compra de uma\ncadeira de rodas nova;\n● Assim que a cadeira alugada for providenciada, o passageiro deve devolver a cadeira\nde rodas companhia aérea;\n\n● Em caso de conserto, solicitar ao passageiro o orçamento e reembolsar 100% até\nautonomia do aeroporto;\n● Em caso de compra, solicitar orçamento da nova cadeira de rodas;\n● Se o valor de compra ou conserto ultrapassar a autonomia do aeroporto, o aeroporto\ndeve encaminhar o processo para o Contact Center (conforme aplicável).\"\n\"DANIFICAÇÃO DE BAGAGEM DE TRIPULANTE A SERVIÇO\n4.8.1. companhia aérea\nDeve ser aberto Property Irregularity Report - PIR no sistema SITA WorldTracer Desktop e\nfornecer uma cópia ao tripulante para que o mesmo apresente no setor de UNIFORMES.\nÉ obrigatório descrever o tipo de dano como, por exemplo, rasgo na lateral, zíper e rodinha\ndanifcados.\n4.8.2. Voos operados por companhia aérea Brasil\nDeve ser aberto somente Property Irregularity Report - PIR manual e fornecer uma cópia ao\ntripulante para que o mesmo apresente no setor de UNIFORMES.\nÉ obrigatório descrever o tipo de dano como, por exemplo, rasgo na lateral, zíper e rodinha\ndanifcados.\nNão se deve abrir Property Irregularity Report - PIR para tripulantes em viagens pessoais\nque estejam utilizando a mala da companhia aérea, pois seu uso é exclusivo para quando estiver em\nserviço.\n4.9. PRAZO PARA RESOLUÇÃO DA DANIFICAÇÃO\nOs processos de danifcação devem ser solucionados diretamente no desembarque. Ao\nformalizar uma reclamação de danifcação no desembarque, o agente deverá imediatamente\noferecer a compensação conforme tabela por tipo de dano. Os processos devem ser\nencerrados no sistema somente quando estiverem solucionados, ou seja, após a negociação\n\ne emissão da compensação fnanceira, emitida no A360 ou PRS.\n4.10. TABELA DE COMPENSAÇÃO POR TIPO DE DANO\nA tabela deve ser utilizada apenas para bagagens convencionais.\nPRS (Travel Voucher) Agente 360 (companhia aérea Wallet)\nRL TIPO CASH SERVIÇOS CASH SERVIÇOS\nRL 81\nDano maior\n(agente)\n30 USD 40 USD 30 USD / 187 BRL 40 USD / 249 BRL\nDano maior\n(supervisor)\n50 USD 70 USD 50 USD / 312 BRL 70 USD / 436 BRL\nRL 82\nDano total\n(agente)\n60 USD 90 USD 60 USD / 374 BRL 90 USD / 561 BRL\nDano total\n(supervisor)\n120 USD 170 USD 120 USD / 748 BRL 170 USD / 1059 BRL Teto máximo para os aeroportos/Autonomia de Supervisor 600 USD/3737 BRL Não haverá distinção de ofertas para clientes HVC.\nIMPORTANTE: A emissão de qualquer tipo de compensação de bagagem, em\nbenefício próprio é proibido e acarretará investigação e medidas disciplinares severas.\nOu seja, o Staf que está em viagem a trabalho ou lazer, tem direito de abrir Property\nIrregularity Report - PIR e também tem direito de receber ofertas de compensação,\nporém este colaborador não poderá fazer a emissão da sua própria compensação.\n4.10.1. Oferta da compensação\n● Determinar o tipo de dano e oferecer a compensação correspondente;\n● As propostas podem ser feitas com CASH ou Serviços companhia aérea;\n● Se o cliente tiver mais de uma mala danifcada, o valor da oferta deve ser somado;\n● Somente a supervisão ou liderança poderá oferecer o valor da segunda oferta;\n● Caso o cliente não aceite a segunda oferta, o caso deverá ser derivado. Clique aqui,\npara acessar o Formulário derivação;\n\n● Os processos devem ser encerrados somente quando estiverem solucionados.\nEm alguns casos, para emissão de compensação fnanceira via PRS (Travel Voucher),\nquando o cliente escolher a compensação em CASH, devemos emitir o TV com ambos os\ncampos, CASH e SERVIÇOS, preenchidos de acordo com a tabela. Por exemplo: o cliente\naceitou 30 USD em CASH, então na emissão do TV, fcará preenchido com 30 USD em\nCASH e 40 USD em SERVIÇOS. Já no sistema A360, devemos emitir a compensação\nfnanceira de forma específca, em relação ao valor e natureza. Ou seja, se o cliente aceitou\n30 USD em CASH, devemos fazer a emissão com esse valor e natureza, para que ele receba\nna sua companhia aérea Wallet. Veja abaixo alguns exemplos de emissão da compensação fnanceira:\nExemplo 1: o cliente apresenta uma bagagem com a alça danifcada (dano maior). O agente\noferece a primeira oferta (30 USD em CASH ou 40 USD em Serviços companhia aérea). O cliente aceita a\nprimeira oferta em CASH.\nAgente 360 (companhia aérea Wallet) PRS (Travel Voucher)\nO agente deve emitir a compensação fnanceira\nde 30 USD em CASH, de acordo com a\nescolha do cliente.\nO agente deve imediatamente emitir o Travel\nVoucher, inserindo no campo 30 USD em\nCASH e 40 USD no campo SERVIÇOS.\nExemplo 2: o cliente apresenta uma bagagem com fbra rachada (dano total). O agente oferece\na primeira oferta (60 USD em CASH ou 90 USD em SERVIÇO). O cliente recusa a oferta. O\nagente então aciona o supervisor/líder, que analisa e entende que pelo valor da bagagem\ncorresponde entregar a segunda oferta (120 USD em CASH ou 170 USD em SERVIÇO). O"},{"title":"Mascara DPR","type":"Simulacao","duration":"20 min","content":"Máscara DPR\n\nA máscara DPR no WorldTracer organiza os dados de passageiro, bagagem, voo, rota, dano, localização, extensão, RL, FS e observações. O agente deve preencher a máscara com informações consistentes, porque ela será a base para análise, compensação, histórico e encerramento.\n\nA máscara deve refletir o fato observado: dano, violação ou ambos, sempre com descrição clara e registros complementares.\n\nMaterial de apoio da trilha\n\ncliente aceita a segunda oferta em SERVIÇOS (170 USD).\nAgente 360 (companhia aérea Wallet) PRS (Travel Voucher)\nO agente deve emitir a compensação fnanceira\nde 170 USD em SERVIÇOS, de acordo com a\nescolha do cliente.\nO agente deve imediatamente emitir o Travel\nVoucher, inserindo 1 USD no campo CASH170\nUSD no campo SERVIÇOS.\"\n\"LIMITED RELEASE\nCom o objetivo de unifcar o processo de registro de Limited Release, as posições de\ncheck-in dos aeroportos de origem passarão a registrar no sistema BRS (SmartSuite) todas\nas bagagens que forem entregues já danifcadas pelo cliente (etiqueta Limited Release), seja\nno autoatendimento ou nos balcões de check-in.\n1) Foto (nítida) da etiqueta com o dano assinalado e assinada pelo passageiro:\n2) Foto (nítida) do dano da bagagem:\nAs fotos fcarão registradas no sistema BRS (SmartSuite) e podem ser visualizadas por todos\nos aeroportos e canais de atendimento.\"\n\"CRITÉRIOS PARA ACEITAÇÃO E REGISTRO DO PROPERTY\nIRREGULARITY REPORT - PIR\nAntes de registrar uma reclamação de dano no sistema SITA WorldTracer Desktop, o agente\ndeve consultar o número da etiqueta de bagagem no sistema BRS (SmartSuite). A pesquisa\ntambém pode ser feita pelo PNR (código da reserva) ou nome do cliente.\nVeja abaixo o passo a passo:\n1. Consulta da bagagem no Global Search: Ao confrmar que o dano registrado em Limited Release se trata do mesmo reclamado\npelo passageiro, o agente deverá clicar, na parte superior da tela, em “Ações” e depois em\n“Negar Compensação”.\nCom a versão 20 do sistema Smartsuite, essa nova funcionalidade (válida desde 05 de\n\ndezembro de 2024) servirá como indicador para mensurar a nossa efcácia no registro de\nLimited Release e também para que outros aeroportos e demais áreas tenham o histórico de\nnegativa de compensação.\n4. Selecione o aeroporto no ponto de registro da informação: 5. Clique em “Negar Compensação”:\nAo concluir a ação o sistema deverá apresentar a mensagem de “Compensação negada com\nsucesso”. A ação será registrada no histórico da etiqueta e fcará visível para as demais áreas.\nApós consultar o BRS, se houver a foto da etiqueta (com sinalização do dano) assinada\ne do dano na bagagem, o Property Irregularity Report - PIR não deverá ser registrado.\nAlém do procedimento de “negar compensação” no sistema Smartsuite, deve ser feito:\nA) No Brasil, poderá ser aberta uma reclamação no formulário da Resolução 400;\nB) Colômbia e Peru, \"\"formulário online de daños en equipajes\"\" (sem\ncompensação).\nExemplo 01: o agente de bagagem ao consultar a etiqueta no sistema SmartSuite,\nidentifca o registro de Limited Release, porém para um dano diferente do reclamado\npelo passageiro. Nesse caso não se deve considerar a ação de “Negar\nCompensação” e o agente deve seguir com o registro de danifcação no sistema\nWorldTracer (ou seja, registra o PIR).\nExemplo 02: o agente de bagagem ao consultar a etiqueta no sistema SmartSuite,\nidentifca o registro de Limited Release para o mesmo dano que está reclamando o\npassageiro. Nesse caso se deve considerar a ação “Negar Compensação”, a fm de\nque fque registrada a negativa de abertura de reclamação, além de não se\nconsiderar o registro no WorldTracer.\n\nExemplo 03: o agente de bagagem ao consultar a etiqueta no sistema SmartSuite,\nnão identifca registro de Limited Release para aquela etiqueta. Nesse caso, o agente\nnão deve utilizar a ação “Negar Compensação” e deve prosseguir com a abertura de\nregistro de danifcação no sistema WorldTracer (ou seja, registra o PIR).\""}]$json_dpr$::jsonb, $mat_dpr$Quando abrir DPR

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

---

Codigos de dano

Códigos de dano TD

A trilha de códigos TD apresenta a combinação entre elemento da mala, localização e extensão do dano. O código deve indicar onde ocorreu o dano e qual parte foi afetada. Exemplos de localização incluem TOP, SIDE, END e BOTT; exemplos de elementos incluem alça, fechadura, buraco, rasgo, rodas, zíper, tira, armação, mancha, fecho, dobradiça e amassado.

Registrar o TD corretamente evita compensação indevida e melhora a análise do DPR.

Material de apoio da trilha

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

---

Mascara DPR

Máscara DPR

A máscara DPR no WorldTracer organiza os dados de passageiro, bagagem, voo, rota, dano, localização, extensão, RL, FS e observações. O agente deve preencher a máscara com informações consistentes, porque ela será a base para análise, compensação, histórico e encerramento.

A máscara deve refletir o fato observado: dano, violação ou ambos, sempre com descrição clara e registros complementares.

Material de apoio da trilha

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

Exemplo 03: o agente de bagagem ao consultar a etiqueta no sistema SmartSuite,
não identifca registro de Limited Release para aquela etiqueta. Nesse caso, o agente
não deve utilizar a ação “Negar Compensação” e deve prosseguir com a abertura de
registro de danifcação no sistema WorldTracer (ou seja, registra o PIR)."$mat_dpr$),
('worldtracer-completo', $json_worldtracer_completo$[{"title":"Mapa de transacoes","type":"Aula","duration":"25 min","content":"Mapa de transações WorldTracer\n\nEsta trilha organiza as principais transações do WorldTracer: Create, Display File, Close File, AHL, OHD, DPR, RFP, BDO, FWD, ROH, FOH, FLZ, Action File e relatórios. O objetivo é entender para que serve cada transação e em qual momento operacional ela deve ser usada.\n\nMaterial de apoio da trilha\n\nCurso de World tracer completo\n\"World Tracer WEB HELP\nClose and Create Damaged (CFD)\nFechamento de relatório de extravio e abertura de Danificação\ne/ou Violação\nClose File (CAH/COH/CDP) Fechamento de relatórios\nCreate Criação de relatórios\nCreate Delivery Order (BDO) Ordem de entrega de bagagem\nCustom Pages (DST) Área de visualização dos dados da base\nDamaged Bag (DPR) Relatório de danificação e violação\nDelayed Bag (AHL) Relatório de bagagem extraviada\nDisplay File (DAH/DOH/DDP) Visualização do Relatório\nDisplay OHD and Forwarding Files\n(DOF)\nLista de registros de bagagem sobrantes e mensagens de envio\nForward Bag (FWD) Mensagem de envio de bagagem\nForward Bag to Headquarters\n(FLZ)\nEnvio de bagagem para a central de bagagens\nForward Delayed Bag (FAH)\nEnvio de bagagens pertencentes à relatórios de extravio (AHL)\nde sua base\nForward On-Hand Bag (FOH) Envio de bagagem sobrante\nLost & Found Property (RFP) Inserção de objetos localizados a bordo\nManage Visualização pelo número do registro\nNew Message Ler mensagens do Station Inbox\nOn-Hand Bag (OHD) Registro de bagagem sobrante\nQuick On-Hand Bag (QOH) Registro rápido de bagagem sobrante\nPast Date File (PDI) Visualizar relatórios que estão inativos no sistema\nRecreate File (RCB) Reabertura de relatório fechado\nReinstate File (RIT) Reativar relatórios\nRequest On-Hand Bag (ROH) Solicitar bagagem sobrante\nSearch Busca de registros\nStation Box (CXF) Área de armazenamento de mensagens\nSuspend File (SUS) Suspender relatórios de extravio ou bagagem sobrante\n\nUpdate File (AAH/AOH/ADP) Incluir, apagar ou alterar informações nos relatórios\"\n\"Tradução dos Campos por Ordem Alfabética\nAdditional Destination Address: Informações da base de destino\nAddress Line: Endereço\nAirline: Código da Cia Aérea\nAmount :Valor gasto\nBag Details: Detalhe do dano da bagagem (Damaged Bag)\nBag Routing: Rota da bagagem\nBag Tag Number: Número da etiqueta de bagagem\nBrand Information: Marca da bagagem\nCategory: Categoria do item da bagagem\nClaim Amount: Valor que o cliente alega custar a bag danif/item violado\nClass of Service/Status: Cabine de serviço\nCell Phone: Telefone celular\nCity :Cidade\nCode :Código do dano\nColor: Cor da bagagem\nComments on Loss: Comentário do Reason for Loss\nCost Remarks: Observação sobre o custo\nCountry: País\nCurrency: Moeda\nDamaged Contents: Conteúdo danificado\nDate :Data\nDate Bag Received: Data e hora do recebimento da bagagem no LL\nDate Found: Data da localização do objeto esquecido a bordo\nDelayed Bag: Reference Número do relatório de extravio\nDelivery Date: Data da entrega da bagagem\nDelivery Information: Informações da entrega da bagagem\nDelivery Service: Prestadora de serviço de entrega de bagagem\nDelivery Station: Base/Aeroporto que está entregando a bagagem\nDetails on Bag: Endereço que consta identificação da bagagem\nDetailed Description: Descrição do item\nDescription 1: Descrição do item da bagagem 1\nDescriptive Element(s): Elementos da bagagem\nDestination: Base de destino\nEmail :E-mail do cliente\nEmail Address Endereço de email\nExtra Information: Texto livre\nFamily Name :Sobrenome\n\nFault Station (FS): Base responsável pela falha\nFile Reference: Número do relatório\nFile Status: Status do relatório (aberto, fechado, todos, suspenso)\nFile Type :Tipo de relatório\nFlight :Voo\nForward Bag Reference: Número do relatório\nFrequent Flyer Number :Número do programa de fidelização do cliente\nFurther Information: Informações adicionais\nGiven Name: Nome\"\n\"Initials :Iniciais do nome do cliente\nLiability Information: Informações do Limited Released\nLocation: Local do dano\nMessage Options: Opção de mensagem\nMissing Bag(s) :Total de bagagem extraviada\nOn-Hand Bag File Reference :Número do registro da sobra de bagagem\nOrigin: Base de origem\nOrigin Address :Informações da base de origem\nOrigin Station: Base que está enviando a bagagem\nOriginal Routing: Rota original da bagagem\nOriginal Tag Number: Número da etiqueta original\nPassport Details: Número do documento (CPF/Passaporte/RG)\nPassenger Routing :Rota do passageiro\nPermanent Contact Information: Informações do endereço permanente\nPilfered Contents: Conteúdo faltante\nPNR Number: Localizador/Reserva\nPostal Code: Cep do endereço\nPreferred Language: Idioma\nRequesting Airline: Cia Aérea solicitante\nRequesting Station: Base/Aeroporto solicitante\nReport Language: Idioma do relatório\nReason for Loss (RL): Código de extravio, danificação ou violação\nRemarks: Acessórios/detalhes da bagagem (Delayed Bag)\nRouting :Rota\nRush Tag: Number Número da etiqueta rush\nSettlement: Cost Valor gasto\nSeverity: Extensão do dano\nState: Estado\nStation :Base/Aeroporto\nStorage Location: Local de armazenamento\n\nSupplementary Information :Informações suplementares\nTag Number :Número da etiqueta da bagagem\nTemporary Contact Information: Informações do endereço temporário\nTicket Number :Número do bilhete ou do e-ticket\nTitle: Título do passageiro\nTotal Delivery Weight of Bag(s) :Peso do volume entregue ao passageiro\nTotal Weight of Bag(s): Peso total dos volumes despachados no check-in\nTotal Weight of Missing Bag(s) :Peso da bagagem extraviada\nTravel Month/Year :Mês/Ano que o relatório foi criado\nType :Tipo de bagagem\nValid Until Date: Data limite de entrega no endereço temporário\"\n\"Em “Manage Files”, você terá:\nPassenger Processing : Registro de relatórios de extravio (Delayed Bag) e danificação e/ou\nviolação (Damaged Bag) e sua navegação.\nBag Processing : Registro de sobra de bagagem (On-Hand Bag e Quick On-Hand Bag) e\nenvio de mensagem para outra base (Forward Bag).\nStation Inbox : Caixa de mensagens do WorldTracer (Action File).\nOther : Registro de objetos esquecidos (Lost & Found Property) e Past Date File, para\nvisualizar os relatórios que já não estão ativos no sistema.\"\n\"Em “Reports & Statistics”, você poderá extrair dados sobre o atendimento, performance\nda base, quantidade de transações realizadas, custos e entre outros:\nStation : Quantidade de relatórios por base, atendimento, custos e etc.\nFault Station : Análise de desempenho do aeroporto por ocorrência.\nFlight : Relatórios por voo.\nActivity : Relatórios de performance como gestão de processos e transações, quantas\nvezes uma ação foi feita por um agente.\nCost : Relatórios por custos.\nOther : Relatórios diversos.\n\nE em “Administration”, você encontrará informações sobre as bases companhia aérea como telefone,\ne-mail, endereço, quais são as bases ativas, tabela de Reason for Loss (RL) e entre outros.\nStation : Informações do aeroporto\nAirline/Handler : Informações da companhia aérea\nPontos de atenção!\n! : Note que quando os itens tem a ‘!’\nsignifica que tem algum dado obrigatório\nque deve ser preenchido.\n: Note que quando os itens tem o ‘’\nsignifica que todos os dados obrigatórios\nestão preenchidos.\n: Note que quando as linhas tem um\ndestaque ‘azul’ significa que é um campo\nmandatório ou obrigatório pelo sistema ou\nda companhia aérea.\"\n\" Delayed Bag (AHL)\nO Delayed Bag é o registro do relatório de bagagem extraviada, conhecido também como\nAHL.\nPara o preenchimento do relatório é necessário completar os campos nela contida com o\nmáximo de informações possíveis. Sendo alguns desses campos mandatórios, isto é, o\npreenchimento é obrigatório. Sem eles o sistema não deixará criar o relatório.\nOs campos mandatórios para a abertura do relatório de extravio são: Family Name\n(sobrenome), Given Name (nome), Preferred Language (idioma), Country (país), City\n(cidade), Address Line (endereço residência), Home/Business Phone (telefone fixo), Color\n(cor), Type (tipo), Descriptive Element(s) (elementos da bagagem), Flight (voo), Date\n(data), Origin (origem) e Destination (destino).\nPara realizar o registro do relatório, devemos clicar em:\nDELAYED BAG > CREATE\nAbrirá a aba do Passenger (dados do passageiro) para ser preenchida Aba do Passenger com o mínimo de informações necessárias:\n\nAba da Bag (informações da bagagem) para ser preenchida: Aba da Bag com o mínimo de informações necessárias:\nAba do Flight (informações do voo, data e rota do passageiro) para ser preenchido:\nAba do Flight com o mínimo de informações necessárias: Uma vez preenchido os campos com todas as informações mandatórias, o sistema\ninformará um número de referência para esse relatório de extravio em:\nFile Reference Number: XRMLA10483\nA partir deste momento, o WorldTracer irá procurar bagagens com as mesmas\ncaracterísticas que estejam sobrando em qualquer companhia aérea do mundo que tenha\num sistema de busca.\nNota\n1. Todos os campos mandatórios devem ser preenchidos.\n2. Campos não mandatórios deverão ser deixados em branco quando não houver\ninformações sobre eles.\n3. O relatório de extravio aceita até 10 bagagens. 4. Qualquer informação que possa auxiliar na localização das bagagens deve ser\ninserida no relatório. Mesmo por mais banal que possa parecer.\n5. Não poderá ser usado abreviações como Av. ou R. acompanhados de “.”.\n6. Os campos Brand Information (marca da bagagem) não poderão ultrapassar a\nquantidade de bagagens informadas no campo Color e Type (cor e tipo). O mesmo\nacontece para o campo Tag Number (etiqueta).\n7. Para preencher o campo Color, Type e Descriptive Element(s) devemos verificar o\ncharter de bagagem da IATA. O preenchimento destes campos tem a seguinte\nformatação: Os dois primeiros caracteres são para a cor, os dois seguintes para o\ntipo do volume e os três últimos para as descrições, quando não houver descrição,\n\ncompleta-se com X. Para ver as descrições também verificamos o charter de\nbagagem da IATA.\n8. O sistema associa o primeiro Tag Number com o primeiro Color, Type e o primeiro\nBrand Information, e assim sucessivamente.\n9. No campos Flight e Date, se a data informada for mais do que 20 dias antes do dia\nda inserção no sistema ou 2 dias após o mesmo, o sistema aceitará o relatório, mas\npedirá a você que verifique se a data do voo está correta.\n10. O Bag Routing serve para informar o voo para o qual a bagagem foi etiquetada,\ncaso este seja diferente do voo do passageiro.\n11. Na aba Claim, no campo Passport Details, deve ser inserido o tipo de documento do\npassageiro e o seu número. Ex.: PSPT FL334455.\n12. No campo Extra Information, devemos descrever o que foi combinado com o\ncliente. Aceita até 99 linhas de texto livre.\n13. O cliente receberá uma mensagem com o status da bagagem via SMS e/ou por\ne-mail quando o campo Message Options for selecionado da seguinte maneira:\n● Do not receive message : para não receber mensagens\n● Receive both SMS & email: para receber via e-mail e SMS\n● Receive SMS messages : para receber apenas via SMS\n● Receive email: para receber apenas via e-mail\nO idioma dessa mensagem pode ser definido através do elemento Preferred Language, que\ndeve ser preenchido: PO (português), EN (inglês), SP (espanhol), FR (francês), GE\n(alemão), IT (italiano) ou TU (turco).\"\n\" Inserção do Conteúdo no Delayed Bag\nPara inserir o conteúdo em um Delayed Bag, basta preencher na aba Bag > Additional Bag\n1 Information > Contents (conteúdo), como no exemplo abaixo:\nNota"},{"title":"Campos e traducoes","type":"Consulta","duration":"25 min","content":"Campos, códigos e traduções\n\nOs campos e códigos do WorldTracer padronizam a comunicação entre bases. O agente deve compreender siglas, traduções, elementos obrigatórios, campos de histórico e campos de identificação para evitar erros na abertura, atualização e encerramento de processos.\n\nMaterial de apoio da trilha\n\n1. O conteúdo tem necessariamente que ser preenchido em INGLÊS.\n2. Pode-se inserir no máximo 12 categorias por bagagem.\n3. Muito cuidado ao eleger as categorias, pois elas serão muito importantes para o\nsistema gerar as mensagens de comparação (MATCHES) entre a bagagem faltante\nem sua base com os volumes sobrantes em outras bases e cias. aéreas.\n4. Caso haja algum conteúdo que não se encaixe em nenhuma das opções de\ncategorias, pode-se inserir uma categoria desde que ela exista no sistema, essas\ncategorias são: BELT, SAMPLES, TIE, COLLECTION, KEY, UNDERWEAR.\nImportante: Não se deve criar categorias!\"\n\" Damaged Bag (DPR)\nEsta é a transação usada para relatórios de danificação e / ou violação, conhecida também\ncomo DPR.\nO relatório é gerado com número de referência, para armazenamento das informações já\nque o sistema não precisará fazer a busca dessa bagagem.\nOs campos mandatórios são: Family Name (sobrenome), Given Name (nome), Country\n(país), City (cidade), Address Line (endereço residência), Home/Business Phone (telefone\nfixo), Reason for Loss (razão do registro), Color (cor), Type (tipo), Descriptive Element(s)\n(elementos da bagagem), Bag Details (detalhe do dano), Flight (voo), Date (data), Origin\n(origem) e Destination (destino).\nPara realizar o registro do relatório, devemos clicar em:\nDAMAGED BAG > CREATE\nHabilitará as abas: Passenger, Bags, Flight para serem preenchidos: Aba do Passenger (dados do passageiro) com o mínimo de informações necessárias:\n\nAba da Bag (informações da bagagem) com o mínimo de informações necessárias: Aba do Flight (dados do voo, data e rota do passageiro):\nUma vez preenchido os campos com todas as informações mandatórias, o sistema\ninformará um número de referência para esse relatório de danificação e/ou violação em:\nFile Reference Number: XRMLA10475 Nota\n1. É permitido preencher as informações em português, uma vez que o sistema não\nfará busca da bagagem.\n2. Preencher os campos de acordo com a orientação abaixo:\nPilfered Contents – É onde vamos informar o que o passageiro alega estar faltando em sua\nbagagem. Quando inserido o Reason for Loss 90-99 o torna mandatório.\nBag Details – É onde informaremos os detalhes do dano da bagagem. Caso não tenha dano,\ninserir: SEM DANO.\nBrand Information– É onde informamos a marca da bagagem, o tamanho e o tempo de uso\nDamaged Contents – É onde informaremos o conteúdo que foi danificado. Texto livre,\napenas uma linha.\nReason for Loss – É onde identificaremos para o sistema se este relatório é de\ndanificação, violação ou ambos.\nDamage #1 > Location - Onde está o dano na bagagem\nDamage #1 > Code - Qual é o dano\nDamage #1 > Severity - Tamanho do dano\n3. Em um Damaged Bag pode-se inserir até 10 bagagens.\"\n\" Quick On-Hand Bag (QOH)\nEsta transação é extremamente simples, rápida e útil. Ela permite que o agente crie até\n10 registros de bagagens sobrantes em sua base de uma só vez, apenas pela etiqueta. O\nTag Number (etiqueta da bagagem) e o Further Information (informações adicionais) são os\n\núnicos campos permitidos nessa transação. O Quick On-Hand Bag, conhecido também como\nQOH, não gera número de registro.\nEla é usada para aqueles momentos em que não há condições de se inserir um On-Hand\nBag (OHD - registro de bagagem sobrante) completo devido à grande quantidade de serviço\na se fazer ou de passageiros para atender. Mas ATENÇÃO, esta é apenas uma solução\ntemporária, assim que possível o On-Hand Bag (OHD) DEVE ser feito.\nPara inserir o Quick On-Hand Bag (QOH) de etiquetas da mesma Cia. Aérea em sequência,\ndevemos clicar em:\nQUICK ON-HAND BAG > CREATE\nHabilitará a aba Bag (informações da bagagem) para ser preenchido:\nAba da Bag preenchida: Nota\n1. O Tag Number (número da etiqueta) é mandatório.\n2. O Quick On-Hand Bag (QOH) gera match com o Delayed Bag (AHL).\n3. O Quick On-Hand Bag (QOH) fica ativo no sistema por apenas 24hs. É importante\nque seja feito o On-Hand Bag (OHD) antes desse período.\n4. Ao inserir o On-Hand Bag (OHD) ou enviar uma mensagem de Forward (FWD) com a\netiqueta exatamente igual, o sistema automaticamente cancela o Quick On-Hand\nBag (QOH).\n5. Podem ser inseridos até 10 números de etiquetas por comando.\"\n\" On-Hand Bag (OHD)\nEsta é a transação utilizada quando há uma bagagem sobrando no aeroporto, por estar sem\netiqueta ou até mesmo etiquetada, porém não retirada da esteira pelo passageiro,\ntambém conhecida como OHD.\nPara bagagens etiquetadas que não embarcaram em nosso aeroporto ou que tenham\ndesembarcado por engano não são feitos On-Hand Bag (OHD).\nÉ de extrema importância que os On-Hand Bag (OHD) sejam inseridos no sistema o mais\n\nrápido possível, pois assim a bagagem poderá ser localizada pelo sistema no menor tempo.\nÉ muito importante também que se seja o mais fiel que puder na descrição do volume, e\nque o conteúdo relatado seja de fácil identificação por agentes de outras bases.\nInformações como: MANCLO / WOCLO / CLOTHES, SEVERAL, não devem ser inseridas.\nUma vez que os On-Hand Bag (OHD) de sua base irão gerar coincidências (matches) com\nDelayed Bag (AHL) de diversas bases e cias. Aéreas do mundo, o conteúdo, ou melhor,\ntodas as informações têm que estar em INGLÊS.\nPara inserir o On-Hand Bag (OHD), devemos clicar em:\nON-HAND BAG > CREATE\nHabilitará as abas: Bag, Flight, Passenger para serem preenchidas: Aba Bag (informações da bagagem) com o mínimo de informações necessárias:\nAba Flight (dados do voo, data e rota do passageiro):\nUma vez preenchido os campos com todas as informações mandatórias, o sistema\ninformará um número de referência para esse registro de bagagem sobrante:\nFile Reference Number: XRMLA10483 Nota\n1. Os campos mandatórios do OHD são: Color (cor), Type (tipo), Descriptive\nElement(s) (elementos da bagagem), Flight (voo), Date (data), Origin (origem) e\nDestination (destino).\n2. O OHD aceita somente uma bagagem por inserção.\n3. Os campos Flight e Date (voo e data), aceitam até 4 conexões.\n4. No Flight (voo), caso o voo seja desconhecido, completar com dois Ys.\n5. Se a bagagem não tiver etiqueta, deixar o campo Tag Number (etiqueta) EM\nBRANCO.\n6. Caso a rota seja desconhecida, preencher somente com a sua base.\n\n7. As regras para inserir o conteúdo são exatamente iguais às do Delayed Bag (AHL).\n8. No campo Family Name (sobrenome) e Given Name (nome), quando este for\ndesconhecido, deixar EM BRANCO, não preencher com: UNK, NIL, UNKNOWN,\nNONAME, NONE, etc.\n9. Se a bagagem possuir características ou acessórios externos, inserir a informação\nno campo Remarks (observações) em inglês. Ex.: RED RIBBON.\"\n\"Mensagens de Envio\n6.1. Envio de Bagagem Sobrante para Outra Base (FWD)\nO Forward Bag permite ao agente mandar uma mensagem de envio de bagagem para outra\nbase, conhecida também como FWD.\nEla deve ser usada para informar outras bases sobre volumes que por algum motivo não\nembarcaram no voo correto ou que tenham desembarcado da aeronave erroneamente.\nEsta transação NÃO é utilizada para envio de On-Hand Bag (OHD).\nNela também temos campos mandatórios, que são: Rush Tag (etiqueta rush), Flight (voo\nque será enviado), Date (data do envio), Destination (destino), Airline to Notify (cia aérea\nque será notificada), Reason for Loss (razão da falha), Fault Station (base que falhou).\nPara enviar o Forward Bag (FWD), devemos clicar em:\nFORWARD BAG > CREATE\nHabilitará as abas: Bag e Flight para serem preenchidas:\nAba Bag (informações da bagagem) com o mínimo de informações necessárias: Aba Flight (voo e data) com o mínimo de informações necessárias:\nAba More (informações adicionais) com o mínimo de informações necessárias:\nUma vez preenchido os campos com todas as informações mandatórias, o sistema\ninformará a base copiada sobre a falta da bagagem: Nota\n\n1. Na área Origin Address, são as informações da base que irá enviar o volume, isto é\n2. O campo Tag Number, é usado para anotar as etiquetas originais, e o sistema aceita\naté 18 etiquetas em uma mesma mensagem.\n3. O elemento Rush Tag é usado para as etiquetas RUSH, e também são aceitas até 18\netiquetas.\n4. No campo Family Name (sobrenome) podem ser informados até 10 nomes de\npassageiros.\n5. Os campos Flight (voo) e Date (data) da área Rush Routing é para informar o voo e\na data em que os volumes estão seguindo e na área Origin Routing é para o voo em\nque as bagagens deveriam ter seguido.\n6. O campo Supplementary Information (informações suplementares) tem até 3 linhas\nde texto livre para, caso necessário, o agente colocar informações adicionais.\n7. Uma vez inserido, o Forward Bag (FWD) fica ativo no sistema por um prazo de 10\ndias, podendo ser visualizado durante este período.\n8. Caso já se tenha o número do Delayed Bag (AHL), podemos inserir em File\nReference e o sistema automaticamente anexará esta mensagem na área Matching\n(MCH) deste Delayed Bag (AHL), e será visto por quem visualizar o relatório de\nextravio. *Pode ser usado para o Damaged Bag (DPR) também.\"\n\" Envio da Bagagem Sobrante (FOH)\nÉ a transação utilizada para mandar uma mensagem de envio referente a um On-Hand Bag\n(OHD) aberto em sua base para outra que tenha, ou não, solicitado essa bagagem. E para\nisso usamos a transação Forward On-Hand Bag, conhecida também como FOH, que é a\ntransação específica para enviar os On-Hand Bag (OHD).\n\nAo localizar o registro On-Hand Bag (OHD), clique em Forward On-Hand Bag nos três\npontos:\nPreencha os campos mandatórios na aba Bag como: Rush Tag Number (etiqueta RUSH), o\nnúmero do relatório Delayed Bag (AHL) em Related Delayed Bag File Reference available:\nE na aba Flight, preencha os campos Flight (voo que será enviado a bagagem) e Date (data\ndo envio): Nota\n1. Na aba More (mais informações), caso haja necessidade, é possível inserir\ninformações adicionais no campo Supplementary Information.\n2. Podemos em uma mesma transação enviar até 5 OHDs, desde que todos pertençam\nao mesmo AHL.\n3. Podemos fazer o Forward On-Hand Bag (FOH), mesmo que o On-Hand Bag (OHD)\nnão tenha sido solicitado via Request Bag (ROH), ou mesmo que ainda não tenha\nsido inserido o Delayed Bag (AHL). Para isso, é só completar o número de\nreferência do Delayed Bag (AHL) com 5 zeros, e preencher normalmente os\ncampos. A única diferença é que o sistema não anexará uma cópia da mensagem no\nDelayed Bag (AHL), pois este é desconhecido.\n4. Outra maneira de enviar a mensagem Forward On-Hand Bag (FOH) é através do\nStation Inbox, quando checarmos a área Action Messages (AA) e houver uma\nmensagem de Request Bag (ROH), solicitando um On-Hand Bag (OHD), clique em\nForward On-Hand nos três pontos.\nUma vez os campos preenchidos e a mensagem transmitida, o sistema\nautomaticamente toma as seguintes providências:\n→ Envia uma mensagem para a área Action Messages (AA) da base que solicitou o On-Hand\n→ Anexa uma cópia do FOH (Forward On-Hand Bag) na área Matching File (MCH) do\nOn-Hand Bag (OHD) da sua base."},{"title":"AHL, conteudo e matches","type":"Pratica guiada","duration":"35 min","content":"→ Anexa uma cópia do FOH (Forward On-Hand Bag) na área Matching File (MCH) do AHL\n(Delayed Bag) da base que solicitou o OHD (On-Hand Bag).\n→ Fecha o On-Hand Bag (OHD).\"\n\" Envio de Bagagem Pertencentes ao Relatório de\nExtravio (AHL) de sua Base (FAH)\nÉ uma mensagem de envio usada quando nossa base tem um relatório de extravio (AHL), o\nvolume foi localizado, mas o passageiro não está mais na cidade onde foi aberto o\nrelatório, e você terá que enviar a bagagem para outra base para que ela providencie a\ndevolução ao proprietário.\nÉ aí que entra o Forward Delayed Bag, conhecido também como FAH. Esse tipo de\nmensagem de envio informa as instruções para entrega, os detalhes do local para entrega,\nou seja, já inclui todos os dados necessários.\nPara enviar a mensagem, após localizar o relatório de extravio, clique em Forward Delayed\nBag nos três pontos:\nNa solicitação da máscara, já virá preenchido o Sobrenome do passageiro (Family Name), o\nendereço Permanente (Permanent Contact Information), ou se for o caso o endereço\ntemporário (Temporary Contact Information), o telefone para contato e qualquer tipo de\ninformação suplementar que tenha sido inserida no elemento Supplementary\nInformation.\nNesta mensagem é necessário preencher os seguintes campos:\nAba bag > Rush Tag Number - etiqueta RUSH\nAba Flight > Origin Address - base e cia aérea que está enviando o volume.\nAba Flight > Rush Routing - voo, data e a base para onde está sendo enviado\"\n\" Envio de Bagagem para o Depósito de Bagagens (FLZ)\nO Forward Bag to Headquarters, conhecido como FLZ é a mensagem específica para os\n\nvolumes sobrantes On-Hand Bag (OHD) que deverão ser encaminhados ao Depósito de\nBagagem (SAOLZ) da companhia.\nTodos os volumes sobrantes em nosso porto, que não tenham sido reclamados em 5 dias,\ndevem ser enviados para esta central, que prosseguirá na tentativa de localização do\nproprietário por mais 45 dias.\nA sigla de endereçamento de toda central de bagagens extraviadas é HDQ (headquarter)\nindependente de a mesma estar localizada em algum aeroporto.\nPara enviar a mensagem, após localizar o registro da bagagem, clique em Forward Bag to\nHeadquarters nos três pontos:\nOs elementos que já estiverem preenchidos no OHD, já aparecerão na máscara.\nObs: Em Additional Destination Address, o campo Station já virá preenchido com a sigla\nda central de bagagens HDQ.\nDeve-se também enviar uma cópia da mensagem para CGHLA, encarregado de receber o\nvolume e repassá-lo para o SAOLZ. As bases que não tem voos para CGH enviam a cópia\npara GRULA. O sistema irá avisar a base que o prazo de procura pelo LL já está expirando e que o\nvolume deve ser encaminhado à central com 24hs de antecedência. Esta mensagem\naparecerá na área System Prompt do Station Inbox. Portanto o Forward Bag to\nHeadquarters (FLZ) e a preparação da bagagem para envio deverá ser feita apenas no\nsegundo dia após o recebimento do alerta.\nPode-se também enviar até 5 On-Hand Bag (OHD) em uma mesma mensagem de FLZ,\nindependente de serem ou não do mesmo passageiro. Neste caso o campo Family Name\nnão aparecerá, mesmo que tenha sido preenchido nos OHDs.\nNota\n1. Os campos mandatórios do Forward Bag to Headquarters (FLZ) são:\n\nAba bag > Rush Tag Number - etiqueta RUSH\nAba Flight > Origin Address - base e cia aérea que está enviando o volume.\nAba Flight > Rush Routing - voo, data e a base para onde está sendo enviado\n2. O sistema anexará uma cópia do envio na área Matching File (MCH) do OHD\n(On-Hand Bag).\n3. A mensagem aparecerá no Station Inbox do HDQ.\nAtenção: O sistema não fecha nem suspende o OHD (On-Hand Bag) quando é feito o\nForward Bag to Headquarters (FLZ), pois ele necessita ficar aberto para que o HDQ possa\nfazer as buscas secundárias.\"\n\"Visualização do Relatório (DAH | DOH | DDP)\nEstas transações são utilizadas quando precisamos visualizar um Delayed Bag, um On-Hand\nBag ou um Damaged Bag, conhecidos também como DAH (visualizar a AHL), DOH (visualizar\no OHD) e DDP (visualizar a DPR).\nPara ler um relatório de extravio de bagagens, por exemplo, devemos clicar em:\nDELAYED BAG > MANAGE\nMostrará o campo Delayed Bag Reference, onde você deverá inserir o número do relatório:\nApós inserir o número do relatório e clicar em Display File, o sistema passa a mostrar na\ntela todas as informações referentes a este relatório: Temos ainda muitas outras opções para conseguir puxar um relatório dos arquivos do\nsistema.\nPodemos solicitar um relatório por um Bag Tag Number (etiqueta de bagagem), ou Family\nName (sobrenome), ou Frequent Flyer Number (número do programa de fidelização):\nDELAYED BAG > SEARCH > BASIC\nAo abrir a página, devemos preencher os campos: Bag Tag Number (etiqueta de bagagem),\nou Family Name (sobrenome), ou Frequent Flyer Number (número do programa de\nfidelização).\n\nPodemos adicionar outros filtros para agilizar nas buscas como: Missing Station (base que\ngerou o registro), Missing Airline (cia aérea), o File Status (status do relatório) caso queira\nprocurar por todos os relatórios (abertos e fechados) ou somente os abertos e dentro de\num período, preenchendo os campos From Date (a partir de) e To Date (data final).\n7.1. Tempo de Visualização dos Relatórios\nOs relatórios só podem ser visualizados pelo Manage (DAH/DOH/DDP) enquanto estiverem\nativos no sistema.\nUm Delayed Bag (AHL) pode ser visualizado por 180 dias ou por 60 dias após a data do\nfechamento, o que vier primeiro.\nUm On-Hand Bag (OHD) e Damaged Bag (DRP) pode ser visualizado por 180 dias ou por 45\ndias após a data do fechamento, o que vier primeiro.\nApós estas datas, para visualizarmos um relatório temos que usar o Past Date File (PDI),\nonde teremos acesso aos relatórios das datas acima até completarem um ano da data do\núltimo voo informado no elemento Flight e Date (FD). Após extrair a informação, para visualizar o relatório, clique em Display File:\nResposta do sistema:\"\n\" Past Date File (PDI)\nO Past Date File, conhecido também como PDI, é usado para podermos visualizar relatórios\nque já não estejam mais ativos no sistema, isto é, já ultrapassaram os prazos de\narmazenagem de 180 dias desde que ainda abertos ou 60 dias para Delayed Bag (AHL) e 45\npara On-Hand Bag (OHD) / Damaged Bag (DPR) a partir da data do fechamento, e por este\nmotivo não conseguimos mais visualizá-los através do Manage (DAH / DOH / DDP).\nPara visualizar, devemos clicar em:\nPAST DATE FILE > SEARCH & MANAGE\n\nUma vez que o agente possui o número do relatório, devemos preencher alguns campos\nmandatórios como: File Type (tipo de relatório), Travel Month/Year e selecionar File\nReference Number (número do relatório).\nCaso o número de referência do relatório seja desconhecido, podemos localizá-lo\ninformando o nome do passageiro em Family Name, Station (aeroporto) e Airline (cia\naérea).\nUma vez o relatório tendo acesso somente através do Paste Date File (PDI), torna-se\nimpossível fechá-lo. Pode-se apenas modificá-lo em Search & Manage > Update File (PDE).\"\n\"Visualização das mensagens de envio, OHDs\ne QOH (DOF)\nO On-Hand Bag > Search > Basic faz com que o sistema nos responda uma lista com as\nmensagens de envio como Forward Bag (FWD), Forward On-Hand Bag (FOH), Forward Delay\nBag (FAH) e Forward Bag to Headquarters (FLZ), conhecido também como DOF (display\nOHDs, QOHs e mensagens de envio).\nPara visualizar, devemos clicar em:\nON-HAND BAG > SEARCH > BASIC\nPara incluir todas as informações, é necessário selecionar em Include forwarded bags a\nopção Yes.\nAo abrir a página, você tem a opção de buscar a informação inserindo a Bag Tag Number\n(etiqueta) ou Family Name (sobrenome) e para restringimos a busca, poderá ser utilizado\nos filtros disponíveis:\"\n\" Lista dos Relatórios (RAF/ROF/RDF)\nO Search > Advanced nos mostra uma listagem de todos os Delayed Bag (AHL), On-Hand\nBag (OHD) e Damaged Bag (DPR) inseridos no sistema conhecidos também como RAF (lista\ndas AHL), ROF (lista dos OHD) e RDF (lista das DPR). E como nas outras transações há\nvárias maneiras de solicitá-las.\n\nPara visualizar a lista dos relatórios Delayed Bag (AHL), devemos clicar em:\nDELAYED BAG > SEARCH > ADVANCED\nPodemos visualizar a lista preenchendo somente o campo Requesting Station (base da\nabertura), porém a opção Missing Station/Airline deve estar selecionada.\nResposta do sistema:\nvocê tem a opção de buscar a informação inserindo a Bag Tag Number (etiqueta) ou Family\nName (sobrenome) e para restringimos a busca, poderá ser utilizado os filtros disponíveis:\nPara visualizar a lista dos relatórios Damaged Bag (DPR), devemos clicar em:\nDAMAGED BAG > SEARCH > ADVANCED\nE para visualizar a lista dos On-Hand Bag (OHD), devemos clicar em:\nON-HAND BAG > SEARCH > ADVANCED\nÉ possível utilizar o filtro File Status (status do relatório) caso queira procurar por todos os\nrelatórios (abertos e fechados) ou somente os abertos e dentro de um período,\npreenchendo os campos From Date (a partir de) e To Date (data final).\nO sistema sempre mostrará a lista dos relatórios abertos no dia e também dos últimos 4\ndia Nota\n1. Podem-se usar os filtros disponíveis misturados para restringir mais a procura.\n2. As opções de voos (Flight), não podem ultrapassar 5 dias.\n3. A sequência de datas não pode ultrapassar 7 dias nos últimos 100 dias.\n4. Somente os relatórios fechados nos últimos 7 dias aparecem na listagem.\n5. Para relatórios anteriores a 7 dias, deve-se informar a data desejada no campo\nFrom Date e To Date, podendo-se solicitar uma sequência de datas de até um\nmáximo de sete dias. Porém neste caso, mesmo solicitando a opção All (todos), o\nsistema só mostrará os relatórios ainda abertos.\n\n6. Ao extrair a lista das bagagens sobrantes, além dos On-Hand Bags (OHD), o sistema\nmostra também uma relação dos Quick On-Hand Bag (QOH) inseridos nas últimas\nON-HAND BAG > SEARCH > ADVANCED\nPara visualizar o relatório, clique nos 3 pontos e selecione a opção Display File. No caso de Objetos esquecidos, devemos clicar em:\nLOST & FOUND PROPERTY > SEARCH & MANAGE\nDevemos preencher obrigatoriamente o campo Station (base que registrou o objeto) e o\ncampo Airline/Handler (cia aérea).\nResposta do sistema:\nAssim como em outros relatórios, é possível utilizar os filtros disponíveis para restringir a\nbusca.\n\"\n\"Atualização de Relatórios (AAH/AOH/ADP)\nO Update File é usado para podermos incluir, apagar ou modificar informações nos\nrelatórios de Delayed Bag (AHL), On-Hand Bag (OHD) e Damaged Bag (DPR), conhecidos\ntambém como AAH (atualização de AHL), AOH (atualização de OHD) e ADP (atualização de\nPorém há algumas regras para isso.\nCampos mandatórios não podem ser apagados, somente modificados.\nO primeiro nome inserido em um Delayed Bag (AHL) ou Damaged Bag (DPR) não pode ser\nmodificado, a não ser por uma senha.\nOs campos Costs/Payments (CS) / Fault Station (FS) / Reason for Loss (RL) não podem ser\napagados de relatórios já fechados.\nNão há limites de campos para se incluir, modificar ou apagar de uma só vez.\nPara realizar as edições nos relatórios, basta clicar em Update File nos três pontos, após\nlocalizar o registro:\nNota\n1. O Family Name (sobrenome) e o Given Name (nome) não podem ser nem apagados\nnem modificados, a não ser por uma senha usada pelo HDQ."},{"title":"DPR, OHD e QOH","type":"Simulacao","duration":"40 min","content":"2. Todas as ações, informações passada ao passageiro devem ser inseridas no Extra\nInformation (FF)\n3. Pode-se inserir até 5 Coust (CSs) nos relatórios de Delayed Bag (AHL) e Damaged\nBag (DPR), e apenas um em On-Hand Bag (OHD).\n4. Todas as mudanças feitas são registradas no History (histórico) dos relatórios e de\nlá não podem ser apagadas.\n5. Para fazer inclusão, exclusão ou alteração em relatórios que já expiraram o prazo\nde visualização, ver Update Past Date File (PDE).\"\n\"Solicitação de Bagagem Sobrante (ROH)\nO Request Bag é usado para solicitarmos um On-Hand Bag (OHD) que está sobrando em\noutra base e que tenha gerado uma mensagem de match na área System Matches do\nStation Inbox, conhecido também como ROH.\nAo solicitar a bagagem sobrante, clique em Request Bag (ROH) nos três pontos:\nO sistema já trará o campo File Reference preenchido com o número de registro da\nbagagem sobrante na outra base.\nPodemos inserir informações adicionais no campo Supplementary Information como,\norientação de envio da bagagem no próximo voo. Ao realizar a solicitação, é possível verificar no relatório de extravio (Delayed Bag) o\ncomando ROH (Request Bag) na área Matching File:\nUma vez transmitido, o sistema automaticamente envia a mensagem para:\n→ A área Action Messages (AA) do Station Inbox da base que mantém o On-Hand Bag\n(OHD).\n→ Uma cópia da mensagem para a área Matching File (MCH)) do seu Delayed Bag (AHL).\n→ Uma cópia da mensagem para a área Matching File (MCH) do On-Hand Bag (OHD) da\noutra base.\nAinda, se os relatórios se mantiverem abertos, o sistema envia uma mensagem para:\n\n→ A área System Prompts (SP) da base que mantém o On-Hand Bag (OHD) informando que\no volume já foi solicitado. Para checar se foi enviado ou não. Após 12hs.\n→ A área System Prompts (SP) da base que mantém o Delayed Bag (AHL) informando para\nchecar se o volume chegou ou não. Após 24 e 48hs.\nNota\n1. Podemos solicitar até 5 On-Hand Bag (OHD) em uma mesma transação. Desde que\ntodas as bagagens pertençam ao mesmo Delayed Bag (AHL).\n2. É possível solicitar um Quick On-Hand Bag (QOH), clicando na opção Request Bag e\nalterar a opção para Quick On-Hand Bag (QOH)\"\n\" Suspender o Relatório (SUS)\nUsamos o Suspend File (SUS) para suspender a busca de uma ou mais bagagem e só\npodemos suspender relatórios de extravio de registros de bagagem sobrantes.\nA busca pode ser interrompida uma vez que já tivermos a bagagem na base e a certeza de\nque pertence ao cliente.\nAo localizar o relatório, clique em Suspend File nos três pontos:\nEm relatórios de extravio em que haja mais do que uma bagagem, mas nem todas foram\nlocalizadas, podemos suspender o relatório parcialmente.\nAo clicar em Suspend, o sistema mostrará o pop-up perguntando se deve suspender todas\nas bagagens, neste momento, selecione a informações como o número da etiqueta e cor e\ntipo da bagagem localizada:\nAo suspender, aparecerá o ícone de pausa:\nA partir do momento em que inserimos este comando, o sistema para de procurar a\nbagagem e consequentemente de enviar mensagens de match para a área System Matches\n(WM) do seu Station Inbox, evitando assim que o agente tenha que ler matches\n\ndesnecessariamente. Além disso, enquanto o relatório estiver suspenso, a companhia não\né cobrada pela SITA.\"\n\" Reativar o Relatório (RIT)\nO Reinstate File, conhecido como RIT, é usado para reativar no sistema um relatório de\nextravio ou sobra de bagagem que tenha sido suspenso.\nAs opções são exatamente as mesmas das já vistas no SUS (Suspend File).\nAo localizar o relatório, clique em Reinstate File nos três pontos:\nAo clicar em Reinstate, o sistema mostrará o pop-up perguntando se deve reativar todas as\nbagagens, neste momento, selecione a informações como o número da etiqueta e cor e\ntipo da bagagem localizada:\nAtenção: Deve-se sempre informar no Extra Information o motivo da reativação do\nrelatório.\"\n\" Entrega da Bagagem (BDO)\nO Create Delivery Order, conhecido como BDO, é um formulário de entrega via\nWorldTracer.\nEle tem duas funções: anexar ao relatório as informações de entrega e fornecer a cópia a\nser impressa para que o passageiro assine o recebimento do volume (2 VIAS).\nPara se conseguir a informação é necessário antes o preenchimento do DSB (Display Station\nBaggage), que é onde serão registradas as informações da transportadora, porém isso será\nfeito pelo LZ, ou talvez pelo supervisor de sua base, sob autorização da central de\nbagagem.\nAo localizar o relatório, clique em Create Delivery Order nos três pontos:\nAo abrir a página, devemos inserir o Delivery Date (data da entrega da bagagem),\nselecionar no Delivery Service (a prestadora de serviço), selecionar no Delivery\nInformation em qual endereço deve ser entregue a bagagem e inserir o custo da entrega\n\nem Delivery Cost. Após preencher os campos e clicar em Create, o sistema pergunta se você deseja encerrar\no relatório, caso positivo, clique em OK.\nAo transmitir, o sistema automaticamente anexará uma cópia do BDO no relatório, na área\nDelivery Information.\"\n\" Fechamento de Relatórios (CAH/COH/CDP)\nO Close File é usado para fechar os relatórios de Delayed Bag (AHL), Damaged Bag (DPR) e\nOn-Hand Bag (OHD), conhecidos também como CAH (encerramento de Delayed Bag), COH\n(encerramento de On-Hand Bag) e CDP (encerramento de Damaged Bag).\nTodo relatório resolvido deve ser fechado, por questões estatísticas, econômicas e de\ngerenciamento.\nPara fechar um relatório de extravio (Delayed Bag), devemos inserir o Reason for Loss (RL)\ne o Fault Station (FS) na aba Bag:\nE na aba Claim, devemos inserir o valor da entrega de bagagem e se houve outros custos\nque devem ser inseridos neste momento: Tipos de custos:\n1 – Advance : AUXÍLIO EMERGENCIAL\n2 – Delivery : ENTREGA DE BAGAGEM\n3 – Final : TRAVEL VOUCHER (INDENIZAÇÃO DE DPR OU AHL)\nPara encerrar, após visualizar o registro, clique em Close File nos três pontos:\nRelatório encerrado com sucesso.\nNota\n1. Todos os campos que já estiverem sido incluídos na abertura dos registros, já\naparecerão preenchidos.\n2. Os campos mandatórios são Reason for Loss (RL) e o Fault Station (FS).\n3. O Settlement Cost deverá sempre ser preenchido. Caso em algum relatório não\ntenha havido custo, preenchemos o Currency com BRL e o Amount com ZERO.\n4. Fault Station (FS) – É a estação que cometeu o erro. Este campo tem a função\n\nestatística de informar quais bases estão cometendo mais falhas, e com isso poder\nser tomadas decisões no sentido de corrigi-las. Neste campo deve-se inserir apenas\na base, sem identificar companhia, ou seja, inserimos XSA e não XSALA.\n5. O sistema não aceita também bases onde a companhia aérea não opere.\n6. Reason for Loss (RL) – É onde vamos informar ao sistema qual tipo de falha foi\ncometido. Usaremos os códigos de 10 a 79. (VER RELAÇÃO DE CÓDIGOS DE ERRO no\nMSB)\n7. Comments on Loss deve ser informado o motivo da inserção do Reason for Loss (RL)\ne Fault Station (FS).\"\n\" Reabertura do Relatório Fechado (RCB)\nSe por algum motivo, o relatório precisar ser reaberto, após já ter sido fechado, devemos\nusar o Recreate File (reabrir o relatório), conhecido como RCB.\nUma vez localizado o relatório, clique em Recreate File nos três pontos:\nAo clicar em Recreate, o sistema mostrará um pop-up. No campo Station inserimos a sua\nbase e em Airline a cia aérea.\nLogo em seguida, o sistema pergunta se é para aplicar para todas as informações da\nbagagem como Etiqueta, Cor e Tipo e Marca, se houver ou você pode selecionar os itens\nespecíficos que queira reaproveitar para a reabertura do relatório.\nNa realidade o sistema não reabre o relatório, ele cria outro exatamente igual, mas com o\npróximo número sequencial da base. Isso significa que o sistema fará um novo\nrastreamento para localizar a bagagem. A resposta do sistema será um OK. Porém o sistema irá criar outro número de referência\npara o relatório.\nNota\n1. O sistema irá mostrar no elemento Associated File e no History o relatório antigo.\n\nIsso em ambos os relatórios.\n2. Todas as informações do relatório antigo migrarão para o novo, exceção feita aos\nelementos do Settlement Cost (custos) e Fault Information (razão do extravio).\n3. Não podemos recriar relatórios de outras cias. aéreas.\n4. Se já houver algum Associated File no relatório antigo, ele será apagado para que a\nnova informação apareça. Porém ambos ficam registrados no History.\n5. Podemos usar essa transação quando por algum motivo necessitamos reabrir um\nregistro de outra base na nossa ou vice versa, realizamos esta transação para caso\nreceba uma bagagem sobrante solicitada porém ao conferir junto ao cliente, não\npertence ao mesmo.\n6. Não é possível reabrir (RCB) para Damaged Bag (DPR), somente para Delayed bag\n(AHL) e On-Hand Bag (OHD).\nObs.: O mesmo relatório só poderá ser reaberto uma vez. Caso tente-se fazer um RCB do\nmesmo relatório mais de uma vez, o sistema retornará esta mensagem:\"\n\"Abertura de Danifcação e/ou Violação (CFD)\nO Close and Create Damaged, conhecido também como CFD, é uma transação que permite\nao agente fechar um AHL (Delayed Bag) e abrir um DPR (Damaged Bag) ao mesmo tempo,\nou melhor, com apenas um comando. Pois as duas máscaras terão de ser preenchidas, a do\nCAH (Close File), porque o volume foi localizado e sequencialmente a do DPR (Damaged\nBag), caso o volume tenha sido danificado ou violado. Os elementos que são comuns nos\ndois relatórios, já aparecem preenchidos no DPR.\nPara realizar esta transação, após visualizar o registro, clique em Close and Create\nDamaged nos três pontos:\n\nAo realizar esta ação, o sistema solicita inserir as informações do Fault Information (razão\ndo extravio) e Settlement Cost (custos):\nApós preencher os campos, ao clicar em Close, o sistema traz o pop-up Enter Dates para\ninserir a data que a bagagem chegou em seu aeroporto e a data da entrega da bagagem ao passageiro Ao clicar em Uptade & Close, o sistema pergunta se deve ser utilizado todas as\ninformações da bagagem, caso positivo, clique em Convert.\nO sistema trará a máscara do Damaged Bag (DPR) para ser preenchida. Insira as\ninformações da bagagem danificada na aba Bag, como: Reason for Loss (RL), Fault Station\n(FS), Bag Details (detalhes do dano), Location (onde está o dano na mala), Code (código do\ndano), Severity (níveis do dano).\nImportante! Devemos inserir os acordos realizados com o cliente em Extra Information (FF)\ndisponível na aba More. Nota\n1. Para os elementos aparecerem preenchidos, o relatório tem que ser de apenas uma\nbagagem, e não pode estar suspenso.\n2. Se o Delayed Bag estiver suspenso a máscara aparecerá em branco e aí terá que ser\npreenchido também os campos da Bagagem como Cor e Tipo.\n3. Os elementos Family Name (sobrenome), Given Name (nome) e Associated File\nsempre aparecerão preenchidos.\nObs.: Pode-se também fazer CFD de um Delayed Bag já fechado, neste caso aparecerá\ndireto a máscara do Damaged Bag, e é só preencher normalmente.\nPode-se também fazer um CFD para apenas um volume, sem a necessidade de fechar o\nDelayed Bag (AHL). Para o caso de um relatório com mais de uma bagagem em que apenas"},{"title":"Action File e relatorios","type":"Consulta","duration":"30 min","content":"Qualidade de registro em relatórios e Action File\n\nAction File, relatórios e histórico dependem de qualidade no registro. Toda mensagem deve ser objetiva, datada, rastreável e coerente com a ocorrência. A qualidade do texto no WorldTracer facilita auditoria, resposta ao passageiro e continuidade entre turnos.\n\num volume foi localizado, e a bagagem que chegou está danificada ou violada.\nNeste caso também, o sistema mostrará direto a máscara do Damaged Bag, pois o Delayed\nBag ainda não pode ser fechado.\n4. Os elementos da bagagem, aparecerão suspensos (SUS) quando visualizar o\nrelatório de extravio.\"\n\" Objetos Esquecidos\n19.1. Registro de Objetos Esquecidos\nUtilizamos a transação abaixo para criarmos um registro dos objetos encontrados a bordo,\nconhecido também como RFP.\nPara realizar o registro do objeto esquecido, devemos clicar em:\nLOST & FOUND PROPERTY > CREATE\nAbrirá a aba do Item para ser preenchida:\nOs campos mandatórios são: Category (categoria), Date Found (data que foi localizado o\nobjeto), porém devemos preencher outros campos:\nDetailed Description - detalhar o objeto encontrado preferencialmente em inglês.\nSupplementary Information - dados do local e a data onde o item foi encontrado,\npreferencialmente em inglês.\nStorage Location - informar em qual local do aeroporto o item está armazenada.\nO sistema permite inserir até 10 itens de uma única vez.\nQuando transmitirmos, o sistema nos retornará uma máscara já com os números de\nregistros alocados para cada objeto em ID.\"\n\" Visualização do Registro do Objeto Esquecido (DFP)\nUma vez inseridos os objetos, para podermos fazer uma procura, devemos clicar em:\nLOST & FOUND PROPERTY > SEARCH & MANAGE\nPreencha os campos mandatórios como Station (base) e Airline/Handler (cia aérea):\nHá diversas maneiras de tentar achar um objeto registrado, como por data específica, por\n\num período de datas, pelo número do registro e pela categoria do objeto. Pode-se usar\ntambém uma mistura de comandos, como por exemplo, um objeto específico e uma data\nespecífica.\nSegue o exemplo visualizando pelo número do registro: Nota\n1. Temos acesso aos objetos registrados em todas as estações de nossa empresa, e à\nde qualquer companhia aérea. Por este motivo é que as informações têm que estar\nem inglês.\n2. Este registro ficará no sistema por um prazo máximo de 90 dias.\n3. 24hs antes de sair do sistema uma mensagem será enviada à área System Prompt\n(SP) do Station Inbox da base.\n4. Após 30 dias os objetos deverão ser enviados para o Depósito de Bagagens.\nObs.: Malas e sacolas esquecidas a bordo devem ser registradas como RFP (Lost & Found) e\nnão como On-Hand Bag (OHD).\nAtenção: Devemos registrar somente objetos esquecidos dentro das aeronaves ou em\ndependências da Cia. objetos esquecidos em áreas comuns devem ser entregues à\nadministração do aeroporto.\"\n\" Atualização do Registro do Objeto Esquecido (AFP)\nPara atualizar as informações no registro do objeto esquecido, devemos utilizar o Update\nconhecido como AFP. Se o entregamos ao proprietário, enviamos para outra base ou se o\nenviamos para o Depósito de Bagagens é necessário informar no sistema.\nAo visualizar o registro do objeto, devemos clicar em Update:\nNo campo Disposal (DO), insira a data que o objeto foi entregue ou enviado e no campo\nComments descreva a ação.\"\n\"Action File (CXF)\nO Action File, é uma espécie de gerenciador de correio eletrônico, é nele que ficam\n\narmazenadas todas as mensagens enviadas para a sua base, exceção feita às mensagens\nrecebidas via teletipo. Nele aparecem as mensagens de Forward, Request Bag (ROH),\nForward ON-Hand Bag (FOH), Forward Delayed Bag (FAH), os matches, todos os alertas do\nsistema, etc.\nÉ no Action File que nos baseamos para saber o quanto de trabalho teremos no dia.\nCada base tem seu próprio Action File, e ele pode ser visto e lido por qualquer outra base\nou cia. Aérea.\nPara checarmos o Action File, devemos clicar em:\nSTATION INBOX > MANAGE\nDay 1 significa dia 1, Day 2 dia 2 e assim por diante até o Day 7.\nTodas as mensagens que entram no Action File entram no Day 1. Portanto Day 1 é o dia de\nhoje. Quando for 00hs GMT (Greenwich Meridian Time) 21hs horário local, se a mensagem\nainda estiver lá ela passa para o Day 2. Após 24 hs, se ela não for apagada, passa para o\nDay 3. E assim sucessivamente até o Day 7. Após esse período, o sistema apagará\nautomaticamente.\nObs: Só aparecem na tela as áreas que tiverem pelo menos uma mensagem entre o Day 1 e\no Day 7. As áreas do Action File são:\nForward Messages (FW): É a área onde ficam armazenadas as informações de envio de\nenvio (FWD).\nAction Messages (AA): É a área de ação. É nela que aparecem as solicitações de envio de\nOn-Hand Bag que estão em sua base (ROH), ou envios de On-Hand Bag que estão em outras\nbases e foram solicitados por você (FOH). Aparecem também, mensagens de FAH (Forward\nDelayed Bag).\nSystem Matches (WM): É onde ficam as mensagens de comparação, feitas pelo sistema,\n\ndos seus Delayed Bag (AHLs) com os On-Hand Bag (OHDs) que estão inseridos pelo mundo\nafora.\nSystem Prompts (SP): São os alertas do sistema, avisando que alguma ação deve ser\ntomada.\nAdditional Prompts (AP): Esta área é como uma espécie de e-mail. Onde outras bases\nenviam mensagens em geral. Pode-se usá-la também como um diário de serviço, deixando\nmensagens para outros turnos sobre tarefas a serem realizadas.\nPurged/Retired Items (PR): Mostra todos os Quick On-Hand Bag (QOHs) que já tiveram o\nprazo de 24hs expirados.\nEmail Correspondence (EC): Área onde fica armazenada o email enviado pelo cliente\nvia Internet.\nLocal Manager (LM): Área de mensagens enviadas pela central (HDQ) às bases.\nCada dia e cada área têm capacidade para armazenar um total de 999 mensagens.\nSe este total for ultrapassado, as 100 mensagens mais antigas são enviadas para a\nimpressora, independentemente do dia em que elas se encontrem.\nATENÇÃO: DEVEMOS CHECAR O ACTION FILE CONSTANTEMENTE. Funções no station inbox:\nÍcone para criar nova mensagem.\nCom uma mensagem selecionada ou aberta, o ícone é utilizado para copiá-la.\nÍcone para transferir a informação da mensagem para dentro de um relatório.\nÍcone para excluir a mensagem.\nÍcone para impressão da mensagem.\nCampo para pesquisar uma informação (nome, número do\nprocesso, etc.) entre as mensagens que estão na caixa de\nentrada.\nO símbolo de três pontos são atalhos para algumas funções que estão no menu,\ncomo: copiar, transferir, excluir e imprimir.\nMensagens da área Forward Messages (FW):\n\nAo clicar em cima da mensagem, ela expandirá e você poderá verificar a informação\ncompleta da mensagem:\nAo clicar no checkbox em destaque, habilita o campos de impressão, exclusão,\nencaminhamento e transferência. Mensagens da área System Matches (WM):\nAo clicar em cima da mensagem, ela se expandirá e você poderá verificar a informação\ncompleta da mensagem.\nO sistema mostrará as informações de comparações entre a bagagem sobrante e os dados\nque estão no relatório de extravio.\nClique no ícone em destaque para visualizar as comparações: Se a comparação selecionada estiver de acordo com o caso, clique em Transfer no final da\npágina para enviar essa comparação para dentro do relatório.\nMensagens da área System Prompts (SP):\nAo clicar em cima da mensagem, ela se expandirá e você poderá verificar a informação\ncompleta da mensagem e a ação a ser realizada:\"\n\"Relatórios (Reports & Statistics)\nNesta sessão, o sistema traz os dados sobre o atendimento, performance da base,\nquantidade de transações, custos e entre outros relacionados aos relatórios de bagagem na\ncompanhia.\nStation: relatórios das ações de um aeroporto como quantidade de relatórios,\natendimento, custo e entre outros.\nFile Reference List (FRR): Lista de relatórios (número dos casos) criados pela base\nselecionada.\nStation Log (MSL): Lista detalhada dos relatórios de dano, extravio, forward e bagagem\nsobrante.\nStation Performance (MSP): Apresenta a produtividade do aeroporto relacionado ao\ntempo de conclusão de um caso.\nActivity: Apresenta relatórios de performance como, gestão de processos e\n\ntransações, quantas vezes uma ação foi feita por um agente e entre outros.\nActivity Status (MRS): Mostra um resumo das atividades do aeroporto que estão ainda\ndisponíveis no banco de dados, sejam elas processos abertos, fechados ou suspensos.\nManagement Inputs (MRI): Mostra o número de relatórios criados por tipo (dano, extravio\ne bagagem sobrante), as mensagens de envio de bagagem e a quantidade de transações\nexecutadas pelo aeroporto. Fault Station: Mostra uma análise de desempenho do aeroporto por ocorrência.\nFault Station Log (MSF): Mostra as falhas (Tabela de RLs) como extravio, danificação e/ou\nviolação com bagagens que ocorreram na base.\nMishandled Connections (MXR): Lista os voos com as bagagens que não foram conectadas\nno aeroporto envolvido, desde os voos com as ocorrências mais graves até aqueles com\nmenor número de problemas.\nPerformance by File (MFK): Mostra o desempenho por relatório e código de motivo.\nPerformance by Bag (MRK): Mostra o desempenho por bagagem e código de motivo.\nFault Station Cost (MRP): Apresenta o custo do aeroporto nas operações de bagagens\nextraviadas e danos.\nCost: Traz os custos associados a cada relatório.\nConvert Currency: É um conversor de moeda.\nPayment/Cost (MCS): Extrai os relatórios de custos total de um caso.\nAverage Cost Performance (MAV): Permissões de extrair relatório de curso médio de caso. Flight: Traz a lista de relatórios por voo.\nFlight/Date (MFD): Mostra uma lista de casos criados em um período específico.\nFault/Flight (MFF): Mostra quais voos estão envolvidos em ocorrências e suas frequências,\nassociados a uma base.\n\nWorst Flight (MWF): Mostra um resumo dos voos com mais ocorrências.\nOther: Relatórios diversos.\nDamaged/Pilfered List (MDP): Lista das bagagens danificadas e violadas em um aeroporto.\nType of Damage (MRD): Principais tipos de dano ocorridos em um aeroporto.\nBaggage Delivery (MBD): Lista de bagagens entregues no aeroporto selecionado do\nrelatório.\""}]$json_worldtracer_completo$::jsonb, $mat_worldtracer_completo$Mapa de transacoes

Mapa de transações WorldTracer

Esta trilha organiza as principais transações do WorldTracer: Create, Display File, Close File, AHL, OHD, DPR, RFP, BDO, FWD, ROH, FOH, FLZ, Action File e relatórios. O objetivo é entender para que serve cada transação e em qual momento operacional ela deve ser usada.

Material de apoio da trilha

Curso de World tracer completo
"World Tracer WEB HELP
Close and Create Damaged (CFD)
Fechamento de relatório de extravio e abertura de Danificação
e/ou Violação
Close File (CAH/COH/CDP) Fechamento de relatórios
Create Criação de relatórios
Create Delivery Order (BDO) Ordem de entrega de bagagem
Custom Pages (DST) Área de visualização dos dados da base
Damaged Bag (DPR) Relatório de danificação e violação
Delayed Bag (AHL) Relatório de bagagem extraviada
Display File (DAH/DOH/DDP) Visualização do Relatório
Display OHD and Forwarding Files
(DOF)
Lista de registros de bagagem sobrantes e mensagens de envio
Forward Bag (FWD) Mensagem de envio de bagagem
Forward Bag to Headquarters
(FLZ)
Envio de bagagem para a central de bagagens
Forward Delayed Bag (FAH)
Envio de bagagens pertencentes à relatórios de extravio (AHL)
de sua base
Forward On-Hand Bag (FOH) Envio de bagagem sobrante
Lost & Found Property (RFP) Inserção de objetos localizados a bordo
Manage Visualização pelo número do registro
New Message Ler mensagens do Station Inbox
On-Hand Bag (OHD) Registro de bagagem sobrante
Quick On-Hand Bag (QOH) Registro rápido de bagagem sobrante
Past Date File (PDI) Visualizar relatórios que estão inativos no sistema
Recreate File (RCB) Reabertura de relatório fechado
Reinstate File (RIT) Reativar relatórios
Request On-Hand Bag (ROH) Solicitar bagagem sobrante
Search Busca de registros
Station Box (CXF) Área de armazenamento de mensagens
Suspend File (SUS) Suspender relatórios de extravio ou bagagem sobrante

Update File (AAH/AOH/ADP) Incluir, apagar ou alterar informações nos relatórios"
"Tradução dos Campos por Ordem Alfabética
Additional Destination Address: Informações da base de destino
Address Line: Endereço
Airline: Código da Cia Aérea
Amount :Valor gasto
Bag Details: Detalhe do dano da bagagem (Damaged Bag)
Bag Routing: Rota da bagagem
Bag Tag Number: Número da etiqueta de bagagem
Brand Information: Marca da bagagem
Category: Categoria do item da bagagem
Claim Amount: Valor que o cliente alega custar a bag danif/item violado
Class of Service/Status: Cabine de serviço
Cell Phone: Telefone celular
City :Cidade
Code :Código do dano
Color: Cor da bagagem
Comments on Loss: Comentário do Reason for Loss
Cost Remarks: Observação sobre o custo
Country: País
Currency: Moeda
Damaged Contents: Conteúdo danificado
Date :Data
Date Bag Received: Data e hora do recebimento da bagagem no LL
Date Found: Data da localização do objeto esquecido a bordo
Delayed Bag: Reference Número do relatório de extravio
Delivery Date: Data da entrega da bagagem
Delivery Information: Informações da entrega da bagagem
Delivery Service: Prestadora de serviço de entrega de bagagem
Delivery Station: Base/Aeroporto que está entregando a bagagem
Details on Bag: Endereço que consta identificação da bagagem
Detailed Description: Descrição do item
Description 1: Descrição do item da bagagem 1
Descriptive Element(s): Elementos da bagagem
Destination: Base de destino
Email :E-mail do cliente
Email Address Endereço de email
Extra Information: Texto livre
Family Name :Sobrenome

Fault Station (FS): Base responsável pela falha
File Reference: Número do relatório
File Status: Status do relatório (aberto, fechado, todos, suspenso)
File Type :Tipo de relatório
Flight :Voo
Forward Bag Reference: Número do relatório
Frequent Flyer Number :Número do programa de fidelização do cliente
Further Information: Informações adicionais
Given Name: Nome"
"Initials :Iniciais do nome do cliente
Liability Information: Informações do Limited Released
Location: Local do dano
Message Options: Opção de mensagem
Missing Bag(s) :Total de bagagem extraviada
On-Hand Bag File Reference :Número do registro da sobra de bagagem
Origin: Base de origem
Origin Address :Informações da base de origem
Origin Station: Base que está enviando a bagagem
Original Routing: Rota original da bagagem
Original Tag Number: Número da etiqueta original
Passport Details: Número do documento (CPF/Passaporte/RG)
Passenger Routing :Rota do passageiro
Permanent Contact Information: Informações do endereço permanente
Pilfered Contents: Conteúdo faltante
PNR Number: Localizador/Reserva
Postal Code: Cep do endereço
Preferred Language: Idioma
Requesting Airline: Cia Aérea solicitante
Requesting Station: Base/Aeroporto solicitante
Report Language: Idioma do relatório
Reason for Loss (RL): Código de extravio, danificação ou violação
Remarks: Acessórios/detalhes da bagagem (Delayed Bag)
Routing :Rota
Rush Tag: Number Número da etiqueta rush
Settlement: Cost Valor gasto
Severity: Extensão do dano
State: Estado
Station :Base/Aeroporto
Storage Location: Local de armazenamento

Supplementary Information :Informações suplementares
Tag Number :Número da etiqueta da bagagem
Temporary Contact Information: Informações do endereço temporário
Ticket Number :Número do bilhete ou do e-ticket
Title: Título do passageiro
Total Delivery Weight of Bag(s) :Peso do volume entregue ao passageiro
Total Weight of Bag(s): Peso total dos volumes despachados no check-in
Total Weight of Missing Bag(s) :Peso da bagagem extraviada
Travel Month/Year :Mês/Ano que o relatório foi criado
Type :Tipo de bagagem
Valid Until Date: Data limite de entrega no endereço temporário"
"Em “Manage Files”, você terá:
Passenger Processing : Registro de relatórios de extravio (Delayed Bag) e danificação e/ou
violação (Damaged Bag) e sua navegação.
Bag Processing : Registro de sobra de bagagem (On-Hand Bag e Quick On-Hand Bag) e
envio de mensagem para outra base (Forward Bag).
Station Inbox : Caixa de mensagens do WorldTracer (Action File).
Other : Registro de objetos esquecidos (Lost & Found Property) e Past Date File, para
visualizar os relatórios que já não estão ativos no sistema."
"Em “Reports & Statistics”, você poderá extrair dados sobre o atendimento, performance
da base, quantidade de transações realizadas, custos e entre outros:
Station : Quantidade de relatórios por base, atendimento, custos e etc.
Fault Station : Análise de desempenho do aeroporto por ocorrência.
Flight : Relatórios por voo.
Activity : Relatórios de performance como gestão de processos e transações, quantas
vezes uma ação foi feita por um agente.
Cost : Relatórios por custos.
Other : Relatórios diversos.

E em “Administration”, você encontrará informações sobre as bases companhia aérea como telefone,
e-mail, endereço, quais são as bases ativas, tabela de Reason for Loss (RL) e entre outros.
Station : Informações do aeroporto
Airline/Handler : Informações da companhia aérea
Pontos de atenção!
! : Note que quando os itens tem a ‘!’
significa que tem algum dado obrigatório
que deve ser preenchido.
: Note que quando os itens tem o ‘’
significa que todos os dados obrigatórios
estão preenchidos.
: Note que quando as linhas tem um
destaque ‘azul’ significa que é um campo
mandatório ou obrigatório pelo sistema ou
da companhia aérea."
" Delayed Bag (AHL)
O Delayed Bag é o registro do relatório de bagagem extraviada, conhecido também como
AHL.
Para o preenchimento do relatório é necessário completar os campos nela contida com o
máximo de informações possíveis. Sendo alguns desses campos mandatórios, isto é, o
preenchimento é obrigatório. Sem eles o sistema não deixará criar o relatório.
Os campos mandatórios para a abertura do relatório de extravio são: Family Name
(sobrenome), Given Name (nome), Preferred Language (idioma), Country (país), City
(cidade), Address Line (endereço residência), Home/Business Phone (telefone fixo), Color
(cor), Type (tipo), Descriptive Element(s) (elementos da bagagem), Flight (voo), Date
(data), Origin (origem) e Destination (destino).
Para realizar o registro do relatório, devemos clicar em:
DELAYED BAG > CREATE
Abrirá a aba do Passenger (dados do passageiro) para ser preenchida Aba do Passenger com o mínimo de informações necessárias:

Aba da Bag (informações da bagagem) para ser preenchida: Aba da Bag com o mínimo de informações necessárias:
Aba do Flight (informações do voo, data e rota do passageiro) para ser preenchido:
Aba do Flight com o mínimo de informações necessárias: Uma vez preenchido os campos com todas as informações mandatórias, o sistema
informará um número de referência para esse relatório de extravio em:
File Reference Number: XRMLA10483
A partir deste momento, o WorldTracer irá procurar bagagens com as mesmas
características que estejam sobrando em qualquer companhia aérea do mundo que tenha
um sistema de busca.
Nota
1. Todos os campos mandatórios devem ser preenchidos.
2. Campos não mandatórios deverão ser deixados em branco quando não houver
informações sobre eles.
3. O relatório de extravio aceita até 10 bagagens. 4. Qualquer informação que possa auxiliar na localização das bagagens deve ser
inserida no relatório. Mesmo por mais banal que possa parecer.
5. Não poderá ser usado abreviações como Av. ou R. acompanhados de “.”.
6. Os campos Brand Information (marca da bagagem) não poderão ultrapassar a
quantidade de bagagens informadas no campo Color e Type (cor e tipo). O mesmo
acontece para o campo Tag Number (etiqueta).
7. Para preencher o campo Color, Type e Descriptive Element(s) devemos verificar o
charter de bagagem da IATA. O preenchimento destes campos tem a seguinte
formatação: Os dois primeiros caracteres são para a cor, os dois seguintes para o
tipo do volume e os três últimos para as descrições, quando não houver descrição,

completa-se com X. Para ver as descrições também verificamos o charter de
bagagem da IATA.
8. O sistema associa o primeiro Tag Number com o primeiro Color, Type e o primeiro
Brand Information, e assim sucessivamente.
9. No campos Flight e Date, se a data informada for mais do que 20 dias antes do dia
da inserção no sistema ou 2 dias após o mesmo, o sistema aceitará o relatório, mas
pedirá a você que verifique se a data do voo está correta.
10. O Bag Routing serve para informar o voo para o qual a bagagem foi etiquetada,
caso este seja diferente do voo do passageiro.
11. Na aba Claim, no campo Passport Details, deve ser inserido o tipo de documento do
passageiro e o seu número. Ex.: PSPT FL334455.
12. No campo Extra Information, devemos descrever o que foi combinado com o
cliente. Aceita até 99 linhas de texto livre.
13. O cliente receberá uma mensagem com o status da bagagem via SMS e/ou por
e-mail quando o campo Message Options for selecionado da seguinte maneira:
● Do not receive message : para não receber mensagens
● Receive both SMS & email: para receber via e-mail e SMS
● Receive SMS messages : para receber apenas via SMS
● Receive email: para receber apenas via e-mail
O idioma dessa mensagem pode ser definido através do elemento Preferred Language, que
deve ser preenchido: PO (português), EN (inglês), SP (espanhol), FR (francês), GE
(alemão), IT (italiano) ou TU (turco)."
" Inserção do Conteúdo no Delayed Bag
Para inserir o conteúdo em um Delayed Bag, basta preencher na aba Bag > Additional Bag
1 Information > Contents (conteúdo), como no exemplo abaixo:
Nota

---

Campos e traducoes

Campos, códigos e traduções

Os campos e códigos do WorldTracer padronizam a comunicação entre bases. O agente deve compreender siglas, traduções, elementos obrigatórios, campos de histórico e campos de identificação para evitar erros na abertura, atualização e encerramento de processos.

Material de apoio da trilha

1. O conteúdo tem necessariamente que ser preenchido em INGLÊS.
2. Pode-se inserir no máximo 12 categorias por bagagem.
3. Muito cuidado ao eleger as categorias, pois elas serão muito importantes para o
sistema gerar as mensagens de comparação (MATCHES) entre a bagagem faltante
em sua base com os volumes sobrantes em outras bases e cias. aéreas.
4. Caso haja algum conteúdo que não se encaixe em nenhuma das opções de
categorias, pode-se inserir uma categoria desde que ela exista no sistema, essas
categorias são: BELT, SAMPLES, TIE, COLLECTION, KEY, UNDERWEAR.
Importante: Não se deve criar categorias!"
" Damaged Bag (DPR)
Esta é a transação usada para relatórios de danificação e / ou violação, conhecida também
como DPR.
O relatório é gerado com número de referência, para armazenamento das informações já
que o sistema não precisará fazer a busca dessa bagagem.
Os campos mandatórios são: Family Name (sobrenome), Given Name (nome), Country
(país), City (cidade), Address Line (endereço residência), Home/Business Phone (telefone
fixo), Reason for Loss (razão do registro), Color (cor), Type (tipo), Descriptive Element(s)
(elementos da bagagem), Bag Details (detalhe do dano), Flight (voo), Date (data), Origin
(origem) e Destination (destino).
Para realizar o registro do relatório, devemos clicar em:
DAMAGED BAG > CREATE
Habilitará as abas: Passenger, Bags, Flight para serem preenchidos: Aba do Passenger (dados do passageiro) com o mínimo de informações necessárias:

Aba da Bag (informações da bagagem) com o mínimo de informações necessárias: Aba do Flight (dados do voo, data e rota do passageiro):
Uma vez preenchido os campos com todas as informações mandatórias, o sistema
informará um número de referência para esse relatório de danificação e/ou violação em:
File Reference Number: XRMLA10475 Nota
1. É permitido preencher as informações em português, uma vez que o sistema não
fará busca da bagagem.
2. Preencher os campos de acordo com a orientação abaixo:
Pilfered Contents – É onde vamos informar o que o passageiro alega estar faltando em sua
bagagem. Quando inserido o Reason for Loss 90-99 o torna mandatório.
Bag Details – É onde informaremos os detalhes do dano da bagagem. Caso não tenha dano,
inserir: SEM DANO.
Brand Information– É onde informamos a marca da bagagem, o tamanho e o tempo de uso
Damaged Contents – É onde informaremos o conteúdo que foi danificado. Texto livre,
apenas uma linha.
Reason for Loss – É onde identificaremos para o sistema se este relatório é de
danificação, violação ou ambos.
Damage #1 > Location - Onde está o dano na bagagem
Damage #1 > Code - Qual é o dano
Damage #1 > Severity - Tamanho do dano
3. Em um Damaged Bag pode-se inserir até 10 bagagens."
" Quick On-Hand Bag (QOH)
Esta transação é extremamente simples, rápida e útil. Ela permite que o agente crie até
10 registros de bagagens sobrantes em sua base de uma só vez, apenas pela etiqueta. O
Tag Number (etiqueta da bagagem) e o Further Information (informações adicionais) são os

únicos campos permitidos nessa transação. O Quick On-Hand Bag, conhecido também como
QOH, não gera número de registro.
Ela é usada para aqueles momentos em que não há condições de se inserir um On-Hand
Bag (OHD - registro de bagagem sobrante) completo devido à grande quantidade de serviço
a se fazer ou de passageiros para atender. Mas ATENÇÃO, esta é apenas uma solução
temporária, assim que possível o On-Hand Bag (OHD) DEVE ser feito.
Para inserir o Quick On-Hand Bag (QOH) de etiquetas da mesma Cia. Aérea em sequência,
devemos clicar em:
QUICK ON-HAND BAG > CREATE
Habilitará a aba Bag (informações da bagagem) para ser preenchido:
Aba da Bag preenchida: Nota
1. O Tag Number (número da etiqueta) é mandatório.
2. O Quick On-Hand Bag (QOH) gera match com o Delayed Bag (AHL).
3. O Quick On-Hand Bag (QOH) fica ativo no sistema por apenas 24hs. É importante
que seja feito o On-Hand Bag (OHD) antes desse período.
4. Ao inserir o On-Hand Bag (OHD) ou enviar uma mensagem de Forward (FWD) com a
etiqueta exatamente igual, o sistema automaticamente cancela o Quick On-Hand
Bag (QOH).
5. Podem ser inseridos até 10 números de etiquetas por comando."
" On-Hand Bag (OHD)
Esta é a transação utilizada quando há uma bagagem sobrando no aeroporto, por estar sem
etiqueta ou até mesmo etiquetada, porém não retirada da esteira pelo passageiro,
também conhecida como OHD.
Para bagagens etiquetadas que não embarcaram em nosso aeroporto ou que tenham
desembarcado por engano não são feitos On-Hand Bag (OHD).
É de extrema importância que os On-Hand Bag (OHD) sejam inseridos no sistema o mais

rápido possível, pois assim a bagagem poderá ser localizada pelo sistema no menor tempo.
É muito importante também que se seja o mais fiel que puder na descrição do volume, e
que o conteúdo relatado seja de fácil identificação por agentes de outras bases.
Informações como: MANCLO / WOCLO / CLOTHES, SEVERAL, não devem ser inseridas.
Uma vez que os On-Hand Bag (OHD) de sua base irão gerar coincidências (matches) com
Delayed Bag (AHL) de diversas bases e cias. Aéreas do mundo, o conteúdo, ou melhor,
todas as informações têm que estar em INGLÊS.
Para inserir o On-Hand Bag (OHD), devemos clicar em:
ON-HAND BAG > CREATE
Habilitará as abas: Bag, Flight, Passenger para serem preenchidas: Aba Bag (informações da bagagem) com o mínimo de informações necessárias:
Aba Flight (dados do voo, data e rota do passageiro):
Uma vez preenchido os campos com todas as informações mandatórias, o sistema
informará um número de referência para esse registro de bagagem sobrante:
File Reference Number: XRMLA10483 Nota
1. Os campos mandatórios do OHD são: Color (cor), Type (tipo), Descriptive
Element(s) (elementos da bagagem), Flight (voo), Date (data), Origin (origem) e
Destination (destino).
2. O OHD aceita somente uma bagagem por inserção.
3. Os campos Flight e Date (voo e data), aceitam até 4 conexões.
4. No Flight (voo), caso o voo seja desconhecido, completar com dois Ys.
5. Se a bagagem não tiver etiqueta, deixar o campo Tag Number (etiqueta) EM
BRANCO.
6. Caso a rota seja desconhecida, preencher somente com a sua base.

7. As regras para inserir o conteúdo são exatamente iguais às do Delayed Bag (AHL).
8. No campo Family Name (sobrenome) e Given Name (nome), quando este for
desconhecido, deixar EM BRANCO, não preencher com: UNK, NIL, UNKNOWN,
NONAME, NONE, etc.
9. Se a bagagem possuir características ou acessórios externos, inserir a informação
no campo Remarks (observações) em inglês. Ex.: RED RIBBON."
"Mensagens de Envio
6.1. Envio de Bagagem Sobrante para Outra Base (FWD)
O Forward Bag permite ao agente mandar uma mensagem de envio de bagagem para outra
base, conhecida também como FWD.
Ela deve ser usada para informar outras bases sobre volumes que por algum motivo não
embarcaram no voo correto ou que tenham desembarcado da aeronave erroneamente.
Esta transação NÃO é utilizada para envio de On-Hand Bag (OHD).
Nela também temos campos mandatórios, que são: Rush Tag (etiqueta rush), Flight (voo
que será enviado), Date (data do envio), Destination (destino), Airline to Notify (cia aérea
que será notificada), Reason for Loss (razão da falha), Fault Station (base que falhou).
Para enviar o Forward Bag (FWD), devemos clicar em:
FORWARD BAG > CREATE
Habilitará as abas: Bag e Flight para serem preenchidas:
Aba Bag (informações da bagagem) com o mínimo de informações necessárias: Aba Flight (voo e data) com o mínimo de informações necessárias:
Aba More (informações adicionais) com o mínimo de informações necessárias:
Uma vez preenchido os campos com todas as informações mandatórias, o sistema
informará a base copiada sobre a falta da bagagem: Nota

1. Na área Origin Address, são as informações da base que irá enviar o volume, isto é
2. O campo Tag Number, é usado para anotar as etiquetas originais, e o sistema aceita
até 18 etiquetas em uma mesma mensagem.
3. O elemento Rush Tag é usado para as etiquetas RUSH, e também são aceitas até 18
etiquetas.
4. No campo Family Name (sobrenome) podem ser informados até 10 nomes de
passageiros.
5. Os campos Flight (voo) e Date (data) da área Rush Routing é para informar o voo e
a data em que os volumes estão seguindo e na área Origin Routing é para o voo em
que as bagagens deveriam ter seguido.
6. O campo Supplementary Information (informações suplementares) tem até 3 linhas
de texto livre para, caso necessário, o agente colocar informações adicionais.
7. Uma vez inserido, o Forward Bag (FWD) fica ativo no sistema por um prazo de 10
dias, podendo ser visualizado durante este período.
8. Caso já se tenha o número do Delayed Bag (AHL), podemos inserir em File
Reference e o sistema automaticamente anexará esta mensagem na área Matching
(MCH) deste Delayed Bag (AHL), e será visto por quem visualizar o relatório de
extravio. *Pode ser usado para o Damaged Bag (DPR) também."
" Envio da Bagagem Sobrante (FOH)
É a transação utilizada para mandar uma mensagem de envio referente a um On-Hand Bag
(OHD) aberto em sua base para outra que tenha, ou não, solicitado essa bagagem. E para
isso usamos a transação Forward On-Hand Bag, conhecida também como FOH, que é a
transação específica para enviar os On-Hand Bag (OHD).

Ao localizar o registro On-Hand Bag (OHD), clique em Forward On-Hand Bag nos três
pontos:
Preencha os campos mandatórios na aba Bag como: Rush Tag Number (etiqueta RUSH), o
número do relatório Delayed Bag (AHL) em Related Delayed Bag File Reference available:
E na aba Flight, preencha os campos Flight (voo que será enviado a bagagem) e Date (data
do envio): Nota
1. Na aba More (mais informações), caso haja necessidade, é possível inserir
informações adicionais no campo Supplementary Information.
2. Podemos em uma mesma transação enviar até 5 OHDs, desde que todos pertençam
ao mesmo AHL.
3. Podemos fazer o Forward On-Hand Bag (FOH), mesmo que o On-Hand Bag (OHD)
não tenha sido solicitado via Request Bag (ROH), ou mesmo que ainda não tenha
sido inserido o Delayed Bag (AHL). Para isso, é só completar o número de
referência do Delayed Bag (AHL) com 5 zeros, e preencher normalmente os
campos. A única diferença é que o sistema não anexará uma cópia da mensagem no
Delayed Bag (AHL), pois este é desconhecido.
4. Outra maneira de enviar a mensagem Forward On-Hand Bag (FOH) é através do
Station Inbox, quando checarmos a área Action Messages (AA) e houver uma
mensagem de Request Bag (ROH), solicitando um On-Hand Bag (OHD), clique em
Forward On-Hand nos três pontos.
Uma vez os campos preenchidos e a mensagem transmitida, o sistema
automaticamente toma as seguintes providências:
→ Envia uma mensagem para a área Action Messages (AA) da base que solicitou o On-Hand
→ Anexa uma cópia do FOH (Forward On-Hand Bag) na área Matching File (MCH) do
On-Hand Bag (OHD) da sua base.

---

AHL, conteudo e matches

→ Anexa uma cópia do FOH (Forward On-Hand Bag) na área Matching File (MCH) do AHL
(Delayed Bag) da base que solicitou o OHD (On-Hand Bag).
→ Fecha o On-Hand Bag (OHD)."
" Envio de Bagagem Pertencentes ao Relatório de
Extravio (AHL) de sua Base (FAH)
É uma mensagem de envio usada quando nossa base tem um relatório de extravio (AHL), o
volume foi localizado, mas o passageiro não está mais na cidade onde foi aberto o
relatório, e você terá que enviar a bagagem para outra base para que ela providencie a
devolução ao proprietário.
É aí que entra o Forward Delayed Bag, conhecido também como FAH. Esse tipo de
mensagem de envio informa as instruções para entrega, os detalhes do local para entrega,
ou seja, já inclui todos os dados necessários.
Para enviar a mensagem, após localizar o relatório de extravio, clique em Forward Delayed
Bag nos três pontos:
Na solicitação da máscara, já virá preenchido o Sobrenome do passageiro (Family Name), o
endereço Permanente (Permanent Contact Information), ou se for o caso o endereço
temporário (Temporary Contact Information), o telefone para contato e qualquer tipo de
informação suplementar que tenha sido inserida no elemento Supplementary
Information.
Nesta mensagem é necessário preencher os seguintes campos:
Aba bag > Rush Tag Number - etiqueta RUSH
Aba Flight > Origin Address - base e cia aérea que está enviando o volume.
Aba Flight > Rush Routing - voo, data e a base para onde está sendo enviado"
" Envio de Bagagem para o Depósito de Bagagens (FLZ)
O Forward Bag to Headquarters, conhecido como FLZ é a mensagem específica para os

volumes sobrantes On-Hand Bag (OHD) que deverão ser encaminhados ao Depósito de
Bagagem (SAOLZ) da companhia.
Todos os volumes sobrantes em nosso porto, que não tenham sido reclamados em 5 dias,
devem ser enviados para esta central, que prosseguirá na tentativa de localização do
proprietário por mais 45 dias.
A sigla de endereçamento de toda central de bagagens extraviadas é HDQ (headquarter)
independente de a mesma estar localizada em algum aeroporto.
Para enviar a mensagem, após localizar o registro da bagagem, clique em Forward Bag to
Headquarters nos três pontos:
Os elementos que já estiverem preenchidos no OHD, já aparecerão na máscara.
Obs: Em Additional Destination Address, o campo Station já virá preenchido com a sigla
da central de bagagens HDQ.
Deve-se também enviar uma cópia da mensagem para CGHLA, encarregado de receber o
volume e repassá-lo para o SAOLZ. As bases que não tem voos para CGH enviam a cópia
para GRULA. O sistema irá avisar a base que o prazo de procura pelo LL já está expirando e que o
volume deve ser encaminhado à central com 24hs de antecedência. Esta mensagem
aparecerá na área System Prompt do Station Inbox. Portanto o Forward Bag to
Headquarters (FLZ) e a preparação da bagagem para envio deverá ser feita apenas no
segundo dia após o recebimento do alerta.
Pode-se também enviar até 5 On-Hand Bag (OHD) em uma mesma mensagem de FLZ,
independente de serem ou não do mesmo passageiro. Neste caso o campo Family Name
não aparecerá, mesmo que tenha sido preenchido nos OHDs.
Nota
1. Os campos mandatórios do Forward Bag to Headquarters (FLZ) são:

Aba bag > Rush Tag Number - etiqueta RUSH
Aba Flight > Origin Address - base e cia aérea que está enviando o volume.
Aba Flight > Rush Routing - voo, data e a base para onde está sendo enviado
2. O sistema anexará uma cópia do envio na área Matching File (MCH) do OHD
(On-Hand Bag).
3. A mensagem aparecerá no Station Inbox do HDQ.
Atenção: O sistema não fecha nem suspende o OHD (On-Hand Bag) quando é feito o
Forward Bag to Headquarters (FLZ), pois ele necessita ficar aberto para que o HDQ possa
fazer as buscas secundárias."
"Visualização do Relatório (DAH | DOH | DDP)
Estas transações são utilizadas quando precisamos visualizar um Delayed Bag, um On-Hand
Bag ou um Damaged Bag, conhecidos também como DAH (visualizar a AHL), DOH (visualizar
o OHD) e DDP (visualizar a DPR).
Para ler um relatório de extravio de bagagens, por exemplo, devemos clicar em:
DELAYED BAG > MANAGE
Mostrará o campo Delayed Bag Reference, onde você deverá inserir o número do relatório:
Após inserir o número do relatório e clicar em Display File, o sistema passa a mostrar na
tela todas as informações referentes a este relatório: Temos ainda muitas outras opções para conseguir puxar um relatório dos arquivos do
sistema.
Podemos solicitar um relatório por um Bag Tag Number (etiqueta de bagagem), ou Family
Name (sobrenome), ou Frequent Flyer Number (número do programa de fidelização):
DELAYED BAG > SEARCH > BASIC
Ao abrir a página, devemos preencher os campos: Bag Tag Number (etiqueta de bagagem),
ou Family Name (sobrenome), ou Frequent Flyer Number (número do programa de
fidelização).

Podemos adicionar outros filtros para agilizar nas buscas como: Missing Station (base que
gerou o registro), Missing Airline (cia aérea), o File Status (status do relatório) caso queira
procurar por todos os relatórios (abertos e fechados) ou somente os abertos e dentro de
um período, preenchendo os campos From Date (a partir de) e To Date (data final).
7.1. Tempo de Visualização dos Relatórios
Os relatórios só podem ser visualizados pelo Manage (DAH/DOH/DDP) enquanto estiverem
ativos no sistema.
Um Delayed Bag (AHL) pode ser visualizado por 180 dias ou por 60 dias após a data do
fechamento, o que vier primeiro.
Um On-Hand Bag (OHD) e Damaged Bag (DRP) pode ser visualizado por 180 dias ou por 45
dias após a data do fechamento, o que vier primeiro.
Após estas datas, para visualizarmos um relatório temos que usar o Past Date File (PDI),
onde teremos acesso aos relatórios das datas acima até completarem um ano da data do
último voo informado no elemento Flight e Date (FD). Após extrair a informação, para visualizar o relatório, clique em Display File:
Resposta do sistema:"
" Past Date File (PDI)
O Past Date File, conhecido também como PDI, é usado para podermos visualizar relatórios
que já não estejam mais ativos no sistema, isto é, já ultrapassaram os prazos de
armazenagem de 180 dias desde que ainda abertos ou 60 dias para Delayed Bag (AHL) e 45
para On-Hand Bag (OHD) / Damaged Bag (DPR) a partir da data do fechamento, e por este
motivo não conseguimos mais visualizá-los através do Manage (DAH / DOH / DDP).
Para visualizar, devemos clicar em:
PAST DATE FILE > SEARCH & MANAGE

Uma vez que o agente possui o número do relatório, devemos preencher alguns campos
mandatórios como: File Type (tipo de relatório), Travel Month/Year e selecionar File
Reference Number (número do relatório).
Caso o número de referência do relatório seja desconhecido, podemos localizá-lo
informando o nome do passageiro em Family Name, Station (aeroporto) e Airline (cia
aérea).
Uma vez o relatório tendo acesso somente através do Paste Date File (PDI), torna-se
impossível fechá-lo. Pode-se apenas modificá-lo em Search & Manage > Update File (PDE)."
"Visualização das mensagens de envio, OHDs
e QOH (DOF)
O On-Hand Bag > Search > Basic faz com que o sistema nos responda uma lista com as
mensagens de envio como Forward Bag (FWD), Forward On-Hand Bag (FOH), Forward Delay
Bag (FAH) e Forward Bag to Headquarters (FLZ), conhecido também como DOF (display
OHDs, QOHs e mensagens de envio).
Para visualizar, devemos clicar em:
ON-HAND BAG > SEARCH > BASIC
Para incluir todas as informações, é necessário selecionar em Include forwarded bags a
opção Yes.
Ao abrir a página, você tem a opção de buscar a informação inserindo a Bag Tag Number
(etiqueta) ou Family Name (sobrenome) e para restringimos a busca, poderá ser utilizado
os filtros disponíveis:"
" Lista dos Relatórios (RAF/ROF/RDF)
O Search > Advanced nos mostra uma listagem de todos os Delayed Bag (AHL), On-Hand
Bag (OHD) e Damaged Bag (DPR) inseridos no sistema conhecidos também como RAF (lista
das AHL), ROF (lista dos OHD) e RDF (lista das DPR). E como nas outras transações há
várias maneiras de solicitá-las.

Para visualizar a lista dos relatórios Delayed Bag (AHL), devemos clicar em:
DELAYED BAG > SEARCH > ADVANCED
Podemos visualizar a lista preenchendo somente o campo Requesting Station (base da
abertura), porém a opção Missing Station/Airline deve estar selecionada.
Resposta do sistema:
você tem a opção de buscar a informação inserindo a Bag Tag Number (etiqueta) ou Family
Name (sobrenome) e para restringimos a busca, poderá ser utilizado os filtros disponíveis:
Para visualizar a lista dos relatórios Damaged Bag (DPR), devemos clicar em:
DAMAGED BAG > SEARCH > ADVANCED
E para visualizar a lista dos On-Hand Bag (OHD), devemos clicar em:
ON-HAND BAG > SEARCH > ADVANCED
É possível utilizar o filtro File Status (status do relatório) caso queira procurar por todos os
relatórios (abertos e fechados) ou somente os abertos e dentro de um período,
preenchendo os campos From Date (a partir de) e To Date (data final).
O sistema sempre mostrará a lista dos relatórios abertos no dia e também dos últimos 4
dia Nota
1. Podem-se usar os filtros disponíveis misturados para restringir mais a procura.
2. As opções de voos (Flight), não podem ultrapassar 5 dias.
3. A sequência de datas não pode ultrapassar 7 dias nos últimos 100 dias.
4. Somente os relatórios fechados nos últimos 7 dias aparecem na listagem.
5. Para relatórios anteriores a 7 dias, deve-se informar a data desejada no campo
From Date e To Date, podendo-se solicitar uma sequência de datas de até um
máximo de sete dias. Porém neste caso, mesmo solicitando a opção All (todos), o
sistema só mostrará os relatórios ainda abertos.

6. Ao extrair a lista das bagagens sobrantes, além dos On-Hand Bags (OHD), o sistema
mostra também uma relação dos Quick On-Hand Bag (QOH) inseridos nas últimas
ON-HAND BAG > SEARCH > ADVANCED
Para visualizar o relatório, clique nos 3 pontos e selecione a opção Display File. No caso de Objetos esquecidos, devemos clicar em:
LOST & FOUND PROPERTY > SEARCH & MANAGE
Devemos preencher obrigatoriamente o campo Station (base que registrou o objeto) e o
campo Airline/Handler (cia aérea).
Resposta do sistema:
Assim como em outros relatórios, é possível utilizar os filtros disponíveis para restringir a
busca.
"
"Atualização de Relatórios (AAH/AOH/ADP)
O Update File é usado para podermos incluir, apagar ou modificar informações nos
relatórios de Delayed Bag (AHL), On-Hand Bag (OHD) e Damaged Bag (DPR), conhecidos
também como AAH (atualização de AHL), AOH (atualização de OHD) e ADP (atualização de
Porém há algumas regras para isso.
Campos mandatórios não podem ser apagados, somente modificados.
O primeiro nome inserido em um Delayed Bag (AHL) ou Damaged Bag (DPR) não pode ser
modificado, a não ser por uma senha.
Os campos Costs/Payments (CS) / Fault Station (FS) / Reason for Loss (RL) não podem ser
apagados de relatórios já fechados.
Não há limites de campos para se incluir, modificar ou apagar de uma só vez.
Para realizar as edições nos relatórios, basta clicar em Update File nos três pontos, após
localizar o registro:
Nota
1. O Family Name (sobrenome) e o Given Name (nome) não podem ser nem apagados
nem modificados, a não ser por uma senha usada pelo HDQ.

---

DPR, OHD e QOH

2. Todas as ações, informações passada ao passageiro devem ser inseridas no Extra
Information (FF)
3. Pode-se inserir até 5 Coust (CSs) nos relatórios de Delayed Bag (AHL) e Damaged
Bag (DPR), e apenas um em On-Hand Bag (OHD).
4. Todas as mudanças feitas são registradas no History (histórico) dos relatórios e de
lá não podem ser apagadas.
5. Para fazer inclusão, exclusão ou alteração em relatórios que já expiraram o prazo
de visualização, ver Update Past Date File (PDE)."
"Solicitação de Bagagem Sobrante (ROH)
O Request Bag é usado para solicitarmos um On-Hand Bag (OHD) que está sobrando em
outra base e que tenha gerado uma mensagem de match na área System Matches do
Station Inbox, conhecido também como ROH.
Ao solicitar a bagagem sobrante, clique em Request Bag (ROH) nos três pontos:
O sistema já trará o campo File Reference preenchido com o número de registro da
bagagem sobrante na outra base.
Podemos inserir informações adicionais no campo Supplementary Information como,
orientação de envio da bagagem no próximo voo. Ao realizar a solicitação, é possível verificar no relatório de extravio (Delayed Bag) o
comando ROH (Request Bag) na área Matching File:
Uma vez transmitido, o sistema automaticamente envia a mensagem para:
→ A área Action Messages (AA) do Station Inbox da base que mantém o On-Hand Bag
(OHD).
→ Uma cópia da mensagem para a área Matching File (MCH)) do seu Delayed Bag (AHL).
→ Uma cópia da mensagem para a área Matching File (MCH) do On-Hand Bag (OHD) da
outra base.
Ainda, se os relatórios se mantiverem abertos, o sistema envia uma mensagem para:

→ A área System Prompts (SP) da base que mantém o On-Hand Bag (OHD) informando que
o volume já foi solicitado. Para checar se foi enviado ou não. Após 12hs.
→ A área System Prompts (SP) da base que mantém o Delayed Bag (AHL) informando para
checar se o volume chegou ou não. Após 24 e 48hs.
Nota
1. Podemos solicitar até 5 On-Hand Bag (OHD) em uma mesma transação. Desde que
todas as bagagens pertençam ao mesmo Delayed Bag (AHL).
2. É possível solicitar um Quick On-Hand Bag (QOH), clicando na opção Request Bag e
alterar a opção para Quick On-Hand Bag (QOH)"
" Suspender o Relatório (SUS)
Usamos o Suspend File (SUS) para suspender a busca de uma ou mais bagagem e só
podemos suspender relatórios de extravio de registros de bagagem sobrantes.
A busca pode ser interrompida uma vez que já tivermos a bagagem na base e a certeza de
que pertence ao cliente.
Ao localizar o relatório, clique em Suspend File nos três pontos:
Em relatórios de extravio em que haja mais do que uma bagagem, mas nem todas foram
localizadas, podemos suspender o relatório parcialmente.
Ao clicar em Suspend, o sistema mostrará o pop-up perguntando se deve suspender todas
as bagagens, neste momento, selecione a informações como o número da etiqueta e cor e
tipo da bagagem localizada:
Ao suspender, aparecerá o ícone de pausa:
A partir do momento em que inserimos este comando, o sistema para de procurar a
bagagem e consequentemente de enviar mensagens de match para a área System Matches
(WM) do seu Station Inbox, evitando assim que o agente tenha que ler matches

desnecessariamente. Além disso, enquanto o relatório estiver suspenso, a companhia não
é cobrada pela SITA."
" Reativar o Relatório (RIT)
O Reinstate File, conhecido como RIT, é usado para reativar no sistema um relatório de
extravio ou sobra de bagagem que tenha sido suspenso.
As opções são exatamente as mesmas das já vistas no SUS (Suspend File).
Ao localizar o relatório, clique em Reinstate File nos três pontos:
Ao clicar em Reinstate, o sistema mostrará o pop-up perguntando se deve reativar todas as
bagagens, neste momento, selecione a informações como o número da etiqueta e cor e
tipo da bagagem localizada:
Atenção: Deve-se sempre informar no Extra Information o motivo da reativação do
relatório."
" Entrega da Bagagem (BDO)
O Create Delivery Order, conhecido como BDO, é um formulário de entrega via
WorldTracer.
Ele tem duas funções: anexar ao relatório as informações de entrega e fornecer a cópia a
ser impressa para que o passageiro assine o recebimento do volume (2 VIAS).
Para se conseguir a informação é necessário antes o preenchimento do DSB (Display Station
Baggage), que é onde serão registradas as informações da transportadora, porém isso será
feito pelo LZ, ou talvez pelo supervisor de sua base, sob autorização da central de
bagagem.
Ao localizar o relatório, clique em Create Delivery Order nos três pontos:
Ao abrir a página, devemos inserir o Delivery Date (data da entrega da bagagem),
selecionar no Delivery Service (a prestadora de serviço), selecionar no Delivery
Information em qual endereço deve ser entregue a bagagem e inserir o custo da entrega

em Delivery Cost. Após preencher os campos e clicar em Create, o sistema pergunta se você deseja encerrar
o relatório, caso positivo, clique em OK.
Ao transmitir, o sistema automaticamente anexará uma cópia do BDO no relatório, na área
Delivery Information."
" Fechamento de Relatórios (CAH/COH/CDP)
O Close File é usado para fechar os relatórios de Delayed Bag (AHL), Damaged Bag (DPR) e
On-Hand Bag (OHD), conhecidos também como CAH (encerramento de Delayed Bag), COH
(encerramento de On-Hand Bag) e CDP (encerramento de Damaged Bag).
Todo relatório resolvido deve ser fechado, por questões estatísticas, econômicas e de
gerenciamento.
Para fechar um relatório de extravio (Delayed Bag), devemos inserir o Reason for Loss (RL)
e o Fault Station (FS) na aba Bag:
E na aba Claim, devemos inserir o valor da entrega de bagagem e se houve outros custos
que devem ser inseridos neste momento: Tipos de custos:
1 – Advance : AUXÍLIO EMERGENCIAL
2 – Delivery : ENTREGA DE BAGAGEM
3 – Final : TRAVEL VOUCHER (INDENIZAÇÃO DE DPR OU AHL)
Para encerrar, após visualizar o registro, clique em Close File nos três pontos:
Relatório encerrado com sucesso.
Nota
1. Todos os campos que já estiverem sido incluídos na abertura dos registros, já
aparecerão preenchidos.
2. Os campos mandatórios são Reason for Loss (RL) e o Fault Station (FS).
3. O Settlement Cost deverá sempre ser preenchido. Caso em algum relatório não
tenha havido custo, preenchemos o Currency com BRL e o Amount com ZERO.
4. Fault Station (FS) – É a estação que cometeu o erro. Este campo tem a função

estatística de informar quais bases estão cometendo mais falhas, e com isso poder
ser tomadas decisões no sentido de corrigi-las. Neste campo deve-se inserir apenas
a base, sem identificar companhia, ou seja, inserimos XSA e não XSALA.
5. O sistema não aceita também bases onde a companhia aérea não opere.
6. Reason for Loss (RL) – É onde vamos informar ao sistema qual tipo de falha foi
cometido. Usaremos os códigos de 10 a 79. (VER RELAÇÃO DE CÓDIGOS DE ERRO no
MSB)
7. Comments on Loss deve ser informado o motivo da inserção do Reason for Loss (RL)
e Fault Station (FS)."
" Reabertura do Relatório Fechado (RCB)
Se por algum motivo, o relatório precisar ser reaberto, após já ter sido fechado, devemos
usar o Recreate File (reabrir o relatório), conhecido como RCB.
Uma vez localizado o relatório, clique em Recreate File nos três pontos:
Ao clicar em Recreate, o sistema mostrará um pop-up. No campo Station inserimos a sua
base e em Airline a cia aérea.
Logo em seguida, o sistema pergunta se é para aplicar para todas as informações da
bagagem como Etiqueta, Cor e Tipo e Marca, se houver ou você pode selecionar os itens
específicos que queira reaproveitar para a reabertura do relatório.
Na realidade o sistema não reabre o relatório, ele cria outro exatamente igual, mas com o
próximo número sequencial da base. Isso significa que o sistema fará um novo
rastreamento para localizar a bagagem. A resposta do sistema será um OK. Porém o sistema irá criar outro número de referência
para o relatório.
Nota
1. O sistema irá mostrar no elemento Associated File e no History o relatório antigo.

Isso em ambos os relatórios.
2. Todas as informações do relatório antigo migrarão para o novo, exceção feita aos
elementos do Settlement Cost (custos) e Fault Information (razão do extravio).
3. Não podemos recriar relatórios de outras cias. aéreas.
4. Se já houver algum Associated File no relatório antigo, ele será apagado para que a
nova informação apareça. Porém ambos ficam registrados no History.
5. Podemos usar essa transação quando por algum motivo necessitamos reabrir um
registro de outra base na nossa ou vice versa, realizamos esta transação para caso
receba uma bagagem sobrante solicitada porém ao conferir junto ao cliente, não
pertence ao mesmo.
6. Não é possível reabrir (RCB) para Damaged Bag (DPR), somente para Delayed bag
(AHL) e On-Hand Bag (OHD).
Obs.: O mesmo relatório só poderá ser reaberto uma vez. Caso tente-se fazer um RCB do
mesmo relatório mais de uma vez, o sistema retornará esta mensagem:"
"Abertura de Danifcação e/ou Violação (CFD)
O Close and Create Damaged, conhecido também como CFD, é uma transação que permite
ao agente fechar um AHL (Delayed Bag) e abrir um DPR (Damaged Bag) ao mesmo tempo,
ou melhor, com apenas um comando. Pois as duas máscaras terão de ser preenchidas, a do
CAH (Close File), porque o volume foi localizado e sequencialmente a do DPR (Damaged
Bag), caso o volume tenha sido danificado ou violado. Os elementos que são comuns nos
dois relatórios, já aparecem preenchidos no DPR.
Para realizar esta transação, após visualizar o registro, clique em Close and Create
Damaged nos três pontos:

Ao realizar esta ação, o sistema solicita inserir as informações do Fault Information (razão
do extravio) e Settlement Cost (custos):
Após preencher os campos, ao clicar em Close, o sistema traz o pop-up Enter Dates para
inserir a data que a bagagem chegou em seu aeroporto e a data da entrega da bagagem ao passageiro Ao clicar em Uptade & Close, o sistema pergunta se deve ser utilizado todas as
informações da bagagem, caso positivo, clique em Convert.
O sistema trará a máscara do Damaged Bag (DPR) para ser preenchida. Insira as
informações da bagagem danificada na aba Bag, como: Reason for Loss (RL), Fault Station
(FS), Bag Details (detalhes do dano), Location (onde está o dano na mala), Code (código do
dano), Severity (níveis do dano).
Importante! Devemos inserir os acordos realizados com o cliente em Extra Information (FF)
disponível na aba More. Nota
1. Para os elementos aparecerem preenchidos, o relatório tem que ser de apenas uma
bagagem, e não pode estar suspenso.
2. Se o Delayed Bag estiver suspenso a máscara aparecerá em branco e aí terá que ser
preenchido também os campos da Bagagem como Cor e Tipo.
3. Os elementos Family Name (sobrenome), Given Name (nome) e Associated File
sempre aparecerão preenchidos.
Obs.: Pode-se também fazer CFD de um Delayed Bag já fechado, neste caso aparecerá
direto a máscara do Damaged Bag, e é só preencher normalmente.
Pode-se também fazer um CFD para apenas um volume, sem a necessidade de fechar o
Delayed Bag (AHL). Para o caso de um relatório com mais de uma bagagem em que apenas

---

Action File e relatorios

Qualidade de registro em relatórios e Action File

Action File, relatórios e histórico dependem de qualidade no registro. Toda mensagem deve ser objetiva, datada, rastreável e coerente com a ocorrência. A qualidade do texto no WorldTracer facilita auditoria, resposta ao passageiro e continuidade entre turnos.

um volume foi localizado, e a bagagem que chegou está danificada ou violada.
Neste caso também, o sistema mostrará direto a máscara do Damaged Bag, pois o Delayed
Bag ainda não pode ser fechado.
4. Os elementos da bagagem, aparecerão suspensos (SUS) quando visualizar o
relatório de extravio."
" Objetos Esquecidos
19.1. Registro de Objetos Esquecidos
Utilizamos a transação abaixo para criarmos um registro dos objetos encontrados a bordo,
conhecido também como RFP.
Para realizar o registro do objeto esquecido, devemos clicar em:
LOST & FOUND PROPERTY > CREATE
Abrirá a aba do Item para ser preenchida:
Os campos mandatórios são: Category (categoria), Date Found (data que foi localizado o
objeto), porém devemos preencher outros campos:
Detailed Description - detalhar o objeto encontrado preferencialmente em inglês.
Supplementary Information - dados do local e a data onde o item foi encontrado,
preferencialmente em inglês.
Storage Location - informar em qual local do aeroporto o item está armazenada.
O sistema permite inserir até 10 itens de uma única vez.
Quando transmitirmos, o sistema nos retornará uma máscara já com os números de
registros alocados para cada objeto em ID."
" Visualização do Registro do Objeto Esquecido (DFP)
Uma vez inseridos os objetos, para podermos fazer uma procura, devemos clicar em:
LOST & FOUND PROPERTY > SEARCH & MANAGE
Preencha os campos mandatórios como Station (base) e Airline/Handler (cia aérea):
Há diversas maneiras de tentar achar um objeto registrado, como por data específica, por

um período de datas, pelo número do registro e pela categoria do objeto. Pode-se usar
também uma mistura de comandos, como por exemplo, um objeto específico e uma data
específica.
Segue o exemplo visualizando pelo número do registro: Nota
1. Temos acesso aos objetos registrados em todas as estações de nossa empresa, e à
de qualquer companhia aérea. Por este motivo é que as informações têm que estar
em inglês.
2. Este registro ficará no sistema por um prazo máximo de 90 dias.
3. 24hs antes de sair do sistema uma mensagem será enviada à área System Prompt
(SP) do Station Inbox da base.
4. Após 30 dias os objetos deverão ser enviados para o Depósito de Bagagens.
Obs.: Malas e sacolas esquecidas a bordo devem ser registradas como RFP (Lost & Found) e
não como On-Hand Bag (OHD).
Atenção: Devemos registrar somente objetos esquecidos dentro das aeronaves ou em
dependências da Cia. objetos esquecidos em áreas comuns devem ser entregues à
administração do aeroporto."
" Atualização do Registro do Objeto Esquecido (AFP)
Para atualizar as informações no registro do objeto esquecido, devemos utilizar o Update
conhecido como AFP. Se o entregamos ao proprietário, enviamos para outra base ou se o
enviamos para o Depósito de Bagagens é necessário informar no sistema.
Ao visualizar o registro do objeto, devemos clicar em Update:
No campo Disposal (DO), insira a data que o objeto foi entregue ou enviado e no campo
Comments descreva a ação."
"Action File (CXF)
O Action File, é uma espécie de gerenciador de correio eletrônico, é nele que ficam

armazenadas todas as mensagens enviadas para a sua base, exceção feita às mensagens
recebidas via teletipo. Nele aparecem as mensagens de Forward, Request Bag (ROH),
Forward ON-Hand Bag (FOH), Forward Delayed Bag (FAH), os matches, todos os alertas do
sistema, etc.
É no Action File que nos baseamos para saber o quanto de trabalho teremos no dia.
Cada base tem seu próprio Action File, e ele pode ser visto e lido por qualquer outra base
ou cia. Aérea.
Para checarmos o Action File, devemos clicar em:
STATION INBOX > MANAGE
Day 1 significa dia 1, Day 2 dia 2 e assim por diante até o Day 7.
Todas as mensagens que entram no Action File entram no Day 1. Portanto Day 1 é o dia de
hoje. Quando for 00hs GMT (Greenwich Meridian Time) 21hs horário local, se a mensagem
ainda estiver lá ela passa para o Day 2. Após 24 hs, se ela não for apagada, passa para o
Day 3. E assim sucessivamente até o Day 7. Após esse período, o sistema apagará
automaticamente.
Obs: Só aparecem na tela as áreas que tiverem pelo menos uma mensagem entre o Day 1 e
o Day 7. As áreas do Action File são:
Forward Messages (FW): É a área onde ficam armazenadas as informações de envio de
envio (FWD).
Action Messages (AA): É a área de ação. É nela que aparecem as solicitações de envio de
On-Hand Bag que estão em sua base (ROH), ou envios de On-Hand Bag que estão em outras
bases e foram solicitados por você (FOH). Aparecem também, mensagens de FAH (Forward
Delayed Bag).
System Matches (WM): É onde ficam as mensagens de comparação, feitas pelo sistema,

dos seus Delayed Bag (AHLs) com os On-Hand Bag (OHDs) que estão inseridos pelo mundo
afora.
System Prompts (SP): São os alertas do sistema, avisando que alguma ação deve ser
tomada.
Additional Prompts (AP): Esta área é como uma espécie de e-mail. Onde outras bases
enviam mensagens em geral. Pode-se usá-la também como um diário de serviço, deixando
mensagens para outros turnos sobre tarefas a serem realizadas.
Purged/Retired Items (PR): Mostra todos os Quick On-Hand Bag (QOHs) que já tiveram o
prazo de 24hs expirados.
Email Correspondence (EC): Área onde fica armazenada o email enviado pelo cliente
via Internet.
Local Manager (LM): Área de mensagens enviadas pela central (HDQ) às bases.
Cada dia e cada área têm capacidade para armazenar um total de 999 mensagens.
Se este total for ultrapassado, as 100 mensagens mais antigas são enviadas para a
impressora, independentemente do dia em que elas se encontrem.
ATENÇÃO: DEVEMOS CHECAR O ACTION FILE CONSTANTEMENTE. Funções no station inbox:
Ícone para criar nova mensagem.
Com uma mensagem selecionada ou aberta, o ícone é utilizado para copiá-la.
Ícone para transferir a informação da mensagem para dentro de um relatório.
Ícone para excluir a mensagem.
Ícone para impressão da mensagem.
Campo para pesquisar uma informação (nome, número do
processo, etc.) entre as mensagens que estão na caixa de
entrada.
O símbolo de três pontos são atalhos para algumas funções que estão no menu,
como: copiar, transferir, excluir e imprimir.
Mensagens da área Forward Messages (FW):

Ao clicar em cima da mensagem, ela expandirá e você poderá verificar a informação
completa da mensagem:
Ao clicar no checkbox em destaque, habilita o campos de impressão, exclusão,
encaminhamento e transferência. Mensagens da área System Matches (WM):
Ao clicar em cima da mensagem, ela se expandirá e você poderá verificar a informação
completa da mensagem.
O sistema mostrará as informações de comparações entre a bagagem sobrante e os dados
que estão no relatório de extravio.
Clique no ícone em destaque para visualizar as comparações: Se a comparação selecionada estiver de acordo com o caso, clique em Transfer no final da
página para enviar essa comparação para dentro do relatório.
Mensagens da área System Prompts (SP):
Ao clicar em cima da mensagem, ela se expandirá e você poderá verificar a informação
completa da mensagem e a ação a ser realizada:"
"Relatórios (Reports & Statistics)
Nesta sessão, o sistema traz os dados sobre o atendimento, performance da base,
quantidade de transações, custos e entre outros relacionados aos relatórios de bagagem na
companhia.
Station: relatórios das ações de um aeroporto como quantidade de relatórios,
atendimento, custo e entre outros.
File Reference List (FRR): Lista de relatórios (número dos casos) criados pela base
selecionada.
Station Log (MSL): Lista detalhada dos relatórios de dano, extravio, forward e bagagem
sobrante.
Station Performance (MSP): Apresenta a produtividade do aeroporto relacionado ao
tempo de conclusão de um caso.
Activity: Apresenta relatórios de performance como, gestão de processos e

transações, quantas vezes uma ação foi feita por um agente e entre outros.
Activity Status (MRS): Mostra um resumo das atividades do aeroporto que estão ainda
disponíveis no banco de dados, sejam elas processos abertos, fechados ou suspensos.
Management Inputs (MRI): Mostra o número de relatórios criados por tipo (dano, extravio
e bagagem sobrante), as mensagens de envio de bagagem e a quantidade de transações
executadas pelo aeroporto. Fault Station: Mostra uma análise de desempenho do aeroporto por ocorrência.
Fault Station Log (MSF): Mostra as falhas (Tabela de RLs) como extravio, danificação e/ou
violação com bagagens que ocorreram na base.
Mishandled Connections (MXR): Lista os voos com as bagagens que não foram conectadas
no aeroporto envolvido, desde os voos com as ocorrências mais graves até aqueles com
menor número de problemas.
Performance by File (MFK): Mostra o desempenho por relatório e código de motivo.
Performance by Bag (MRK): Mostra o desempenho por bagagem e código de motivo.
Fault Station Cost (MRP): Apresenta o custo do aeroporto nas operações de bagagens
extraviadas e danos.
Cost: Traz os custos associados a cada relatório.
Convert Currency: É um conversor de moeda.
Payment/Cost (MCS): Extrai os relatórios de custos total de um caso.
Average Cost Performance (MAV): Permissões de extrair relatório de curso médio de caso. Flight: Traz a lista de relatórios por voo.
Flight/Date (MFD): Mostra uma lista de casos criados em um período específico.
Fault/Flight (MFF): Mostra quais voos estão envolvidos em ocorrências e suas frequências,
associados a uma base.

Worst Flight (MWF): Mostra um resumo dos voos com mais ocorrências.
Other: Relatórios diversos.
Damaged/Pilfered List (MDP): Lista das bagagens danificadas e violadas em um aeroporto.
Type of Damage (MRD): Principais tipos de dano ocorridos em um aeroporto.
Baggage Delivery (MBD): Lista de bagagens entregues no aeroporto selecionado do
relatório."$mat_worldtracer_completo$),
('atendimento-cliente-aviacao', $json_atendimento_cliente_aviacao$[{"title":"Conceito e jornada","type":"Aula","duration":"18 min","content":"Slide\n\" MÓDULO 1 – Fundamentos do Atendimento ao Cliente\n1.1. Conceito de Atendimento ao Cliente \nO que é atendimento ao cliente?\nExplicação:\nAtendimento ao cliente é o conjunto de ações e interações que uma empresa realiza para atender, auxiliar, resolver problemas e oferecer uma experiência satisfatória ao seu público. Na aviação, isso inclui desde o check-in até o desembarque e até mesmo contatos após o voo.\n\nExemplo prático:\nUm passageiro chega ao balcão com dúvidas sobre o portão de embarque e regras de bagagem. O atendente escuta, fornece as informações com clareza e oferece ajuda para despachar a mala, demonstrando proatividade e cordialidade.\n\nO que é atendimento ao cliente?\n\nDiferença entre atendimento, suporte e acolhimento\n\nAtendimento como diferencial competitivo no setor aéreo\n\n1.2. Importância do Atendimento no Setor de Aviação\nExplicação:\nNo transporte aéreo, o atendimento ao cliente é um dos principais diferenciais competitivos. Em um mercado onde as tarifas são parecidas, a experiência é o que fideliza o cliente.\n\nExemplo prático:\nDuas companhias oferecem voos similares. O passageiro escolhe sempre aquela que oferece uma equipe mais prestativa, que se lembra do nome dele e resolve suas solicitações com rapidez.\n\n1.3. Experiência do Cliente (Customer Experience – CX)\nExplicação:\nA Experiência do Cliente engloba todas as interações com a empresa. Uma boa experiência depende da percepção do cliente sobre cada etapa da jornada, incluindo atendimento, conforto, segurança e soluções de problemas.\n\nExemplo prático:\nUm passageiro esqueceu um item no avião. Ele liga para a companhia, é atendido com agilidade e em 30 minutos o objeto é encontrado e entregue. Esse atendimento rápido e eficiente transforma uma possível frustração em uma experiência positiva.\n\n1.4. Cliente Interno x Cliente Externo\nExplicação:\nCliente externo é o passageiro. Cliente interno são os colegas de trabalho, de outras áreas ou turnos. Um bom atendimento interno reflete diretamente na experiência externa do passageiro.\n\nExemplo prático:\nA equipe do check-in depende da equipe de bagagens para saber se houve carregamento especial. Uma falha de comunicação pode fazer o atendente repassar informação errada ao passageiro — por isso, atender bem também quem trabalha com você é essencial."},{"title":"Perfis de passageiros","type":"Aula","duration":"22 min","content":"Perfis de passageiros e empatia\n\nConhecer perfis de passageiros exige empatia: executivo com conexão curta, família com criança, passageiro estrangeiro, idoso, gestante, PcD e cliente em crise precisam de abordagens diferentes, mantendo o mesmo padrão de respeito e clareza.\n\n.1.5. Comunicação Positiva e Eficiente\nExplicação:\nUsar uma linguagem amigável, clara e propositiva faz toda a diferença. Evitar termos negativos e adotar uma postura acolhedora ajuda a criar confiança.\n\nExemplo prático:\n“Esse voo já está fechado, você chegou tarde.”\n“Infelizmente o embarque foi encerrado, mas vou verificar as opções disponíveis para ajudá-lo da melhor forma.”\"\n\"2.1. Passageiros Frequentes x Ocasional\nExplicação:\nPassageiros frequentes têm familiaridade com os procedimentos e geralmente buscam agilidade. Já os passageiros ocasionais podem ter dúvidas e inseguranças, exigindo mais orientação.\n\nExemplo:\nUm passageiro frequente faz o check-in pelo app e só precisa saber o portão. Um passageiro ocasional chega confuso ao balcão e pergunta onde é feito o check-in. O atendente deve adaptar o atendimento para cada um.\n2.2. Passageiros Corporativos\nExplicação:\nCostumam estar com o tempo contado, valorizam eficiência, pontualidade e discrição. Podem exigir alterações de última hora ou upgrades.\n\nExemplo:\nUm executivo chega atrasado para o embarque. O atendente, ao identificar o perfil, agiliza o processo e solicita via rádio prioridade no embarque, mantendo um tom respeitoso e eficiente.\n\n2.3. Passageiros com Crianças\nExplicação:\nDemandam paciência, ajuda com bagagem, carrinhos e compreensão com comportamentos imprevisíveis das crianças.\n\nExemplo:\nUma mãe está com bebê no colo e mala nas mãos. O funcionário oferece ajuda para despachar a bagagem e solicita cadeira de rodas para facilitar o deslocamento.\n\n2.4. Passageiros Idosos e Gestantes\nExplicação:\nExigem prioridade e atenção especial à saúde e mobilidade. Devem ser tratados com paciência e linguagem clara.\n\nExemplo:\nUma gestante solicita um assento próximo ao banheiro. O atendente verifica a disponibilidade e faz a alteração com cortesia, explicando as opções disponíveis.\n\n2.5. Passageiros Estrangeiros\nExplicação:\nPodem enfrentar barreiras linguísticas e culturais. O atendimento deve ser mais visual, pausado e adaptado.\n\nExemplo:\nUm passageiro chinês pergunta onde embarcar. O atendente aponta o portão no painel, mostra o cartão de embarque e gesticula, garantindo compreensão sem constrangimento.\n\n2.6. Passageiros em Estresse ou Crise\nExplicação:\nPassageiros que enfrentam atrasos, perdas, emergências familiares ou luto podem reagir com irritação ou apatia."},{"title":"Atendimento humanizado","type":"Pratica","duration":"22 min","content":"Atendimento humanizado durante toda a jornada\n\nO atendimento humanizado acompanha a jornada do passageiro antes, durante e depois do voo. Acolher, explicar, orientar e acompanhar reduzem ansiedade e transformam problemas operacionais em experiências mais previsíveis.\n\nExemplo:\nUm passageiro grita após saber que o voo foi cancelado. O atendente mantém a calma, escuta sem interromper e diz: “Entendo sua frustração, vamos buscar uma solução agora.”\n\n\"\n\" MÓDULO 3 – Atendimento Humanizado\n3.1. O que é Atendimento Humanizado\nExplicação:\nVai além de seguir regras. É acolher com empatia, demonstrar atenção e tratar o cliente como indivíduo.\n\nExemplo:\nUma senhora está nervosa para voar sozinha pela primeira vez. O atendente oferece um acompanhante até o portão e conversa com ela até se sentir segura.3.2. A Empatia como Pilar do Atendimento\nExplicação:\nÉ se colocar no lugar do outro, entendendo sentimentos e necessidades, mesmo sem concordar com tudo.\n\nExemplo:\nMesmo que o erro tenha sido do passageiro ao perder o voo, o atendente escuta, evita julgamentos e busca alternativas, dizendo: “Vamos ver o que conseguimos fazer por você.”3.3. Escuta Ativa e Comunicação Acolhedora\nExplicação:\nConsiste em ouvir com atenção plena, demonstrando interesse real, sem interromper ou rebater.\n\nExemplo:\nDurante uma reclamação, o atendente mantém contato visual, acena com a cabeça e só responde após o cliente terminar, reforçando: “Agradeço por relatar. Vamos resolver.”3.4. Personalização do Atendimento\nExplicação:\nChamar pelo nome, lembrar histórico ou preferências torna o atendimento mais humano e valorizado.\n\nExemplo:\n“Senhor Paulo, vi que o senhor já viajou conosco semana passada. Deseja o mesmo assento na janela?”\n\n\"\n\" MÓDULO 4 – Acessibilidade e Atendimento a PNAE\n4.1. Legislação e Normas\nExplicação:\nA Resolução ANAC 280 assegura direitos de acessibilidade. Conhecê-la evita erros e garante atendimento digno.\n\nExemplo:\nUm passageiro surdo tem o direito de embarcar com acompanhante gratuitamente. O atendente deve informar corretamente e registrar o acompanhante no sistema.4.2. Tipos de Deficiência\nVisual:\nNecessita de orientação física e verbal clara.\nEx: “Senhor, pegarei seu braço pelo cotovelo. Vamos até o embarque.”\n\nAuditiva:\nUsar escrita ou Libras, se souber.\nEx: Escreve: “Seu portão é o 6. Precisa de ajuda para ir até lá?”\n\nMotora:\nPrecisa de auxílio com locomoção e priorização.\nEx: Providenciar cadeira de rodas e guia.\n\nIntelectual/Neurológica:\nDemandam linguagem simples e ambiente previsível.\nEx: Explicar o passo a passo com calma a uma pessoa com autismo."},{"title":"Acessibilidade e PNAE","type":"Consulta","duration":"22 min","content":"Acessibilidade e PNAE\n\nAcessibilidade e PNAE fazem parte do atendimento aeroportuário. O agente deve identificar passageiros com necessidade de assistência especial, registrar corretamente o serviço, oferecer apoio sem retirar autonomia e acionar recursos como cadeira de rodas, acompanhamento, comunicação acessível ou prioridade operacional.\n\nMaterial de apoio da trilha\n\n4.3. Atendimento Inclusivo\nExplicação:\nTratar com respeito, autonomia e sem infantilizar. Atender com dignidade e considerar suas limitações.\n\nExemplo:\nFalar diretamente com o passageiro com deficiência, não apenas com o acompanhante.\n\n4.4. Recursos de Apoio\nExplicação:\nUsar todos os meios disponíveis: intérpretes, cadeiras, guias, sinalização adaptada, etc.\n\nExemplo:\nUm cego chega desacompanhado. O atendente oferece um colaborador guia até o portão, e comunica a equipe de solo para acompanhamento no desembarque.\n\n4.5. Embarque Assistido\nExplicação:\nPessoas com deficiência ou mobilidade reduzida têm direito a prioridade e apoio no embarque.\n\nExemplo:\nGestante embarcando com dificuldade recebe apoio com cadeira e embarque antecipado.\n\n\"\n\" MÓDULO 5 – Atendimento Multicanal\n5.1. Canais de Atendimento\nExplicação:\nCada canal exige linguagem e postura adaptada. O cliente espera uniformidade em todos.\n\nExemplo:\nSe o cliente inicia contato via chat, e liga em seguida, o atendente já deve estar ciente do histórico.5.2. Atendimento no Balcão\nExplicação:\nÉ o ponto mais direto com o cliente. Exige empatia, clareza e postura.\n\nExemplo:\nUsar frases como: “Como posso ajudar hoje?” ao invés de “O que você quer?”\n\n5.3. Atendimento Digital\nExplicação:\nPrecisa ser rápido, claro e sem jargões técnicos. A linguagem escrita deve ser amigável.\n\nExemplo:\nUsar emojis com cautela, evitar “copiar e colar” mensagens frias.\n\n5.4. Atendimento Telefônico e Rádio\nExplicação:\nFala clara, pausada e com confirmação das informações. No rádio, manter o padrão ICAO (Alfa, Bravo, etc.).\n\nExemplo:\n“Reforçando: seu voo sai às 17h do portão 15A.”\"\n\" MÓDULO 6 – Situações Especiais e Críticas\n6.1. Cancelamentos e Atrasos\nExplicação:\nAcolher o cliente com paciência, esclarecer os direitos e oferecer alternativas.\n\nExemplo:\n“Seu voo atrasou por segurança. Vamos providenciar alimentação e verificar conexões.”\n\n6.2. Overbooking\nExplicação:\nSer honesto e proativo. Tentar negociar com compensações justas.\n\nExemplo:\n“Há mais passageiros do que assentos. Posso lhe oferecer um voo amanhã com hospedagem paga e milhas de bônus.”6.3. Bagagens Extraviadas ou Violadas\nExplicação:\nRegistrar a ocorrência com calma e orientar prazos e soluções.\n\nExemplo:\n“Já registrei seu PIR no sistema. Seu número de protocolo é 8643. Informaremos assim que localizar.”"},{"title":"Conflitos e situacoes especiais","type":"Simulacao","duration":"26 min","content":"Conflitos e situações especiais\n\nConflitos podem surgir em cancelamento, atraso, overbooking, extravio, dano de bagagem, perda de conexão ou falha de comunicação. O agente deve manter postura calma, ouvir ativamente, explicar alternativas e registrar a tratativa.\n\nMaterial de apoio da trilha\n\n6.4. Emergências Médicas\nExplicação:\nIsentar o passageiro de filas, acionar paramédico e acompanhar com descrição.\n\nExemplo:\nAcionar a equipe médica ao perceber desmaio próximo ao portão, isolando a área.\n\n6.5. Reclamações e Conflitos\nExplicação:\nOuvir, manter postura neutra e resolver ou encaminhar com educação.\n\nExemplo:\n“O senhor tem razão. Deixe-me registrar sua reclamação para encaminhar à supervisão.”\n\n\"\n\" MÓDULO 7 – Boas Práticas e Padrões\n7.1. Cases Positivos\nExplicação:\nEstudar companhias como Qatar, Azul, Emirates que investem em empatia e suporte.\n\nExemplo:\nA Azul distribui kit de higiene e livros infantis durante atrasos, amenizando o desconforto.\n\n7.2. SLA e Compromissos\nExplicação:\nTempo máximo de espera, resposta e soluções. Devem ser cumpridos.\n\nExemplo:\nResponder um e-mail de reclamação em até 48 horas.7.3. Indicadores de Qualidade\nExplicação:\nNPS, CSAT e FCR avaliam percepção e eficiência.\n\nExemplo:\nNPS mede a chance de o cliente recomendar a empresa com base no atendimento.\n\n7.4. Feedback\nExplicação:\nUsar elogios e críticas como ferramenta de melhoria.\n\nExemplo:\nReuniões mensais com base nos relatórios de elogios e reclamações da Ouvidoria.\n\n\"\n\" MÓDULO 8 – Ética, Postura e Imagem\n8.1. Código de Conduta\nExplicação:\nRegula o comportamento e as decisões éticas da equipe.\n\nExemplo:\nNão divulgar informações de voos especiais, celebridades ou casos de saúde.\n\n8.2. Aparência e Comunicação Não Verbal\nExplicação:\nUniforme limpo, postura confiante e simpatia são essenciais.\n\nExemplo:\nEvitar braços cruzados ou falar de costas para o cliente.\n\n8.3. Diversidade e Inclusão\nExplicação:\nTratar todos com equidade, respeitando diferenças culturais, religiosas, de gênero ou identidade.\n\nExemplo:\nUsar o pronome correto de uma pessoa transgênero, conforme solicitado.\n\"\n\" MÓDULO 9 – Simulações\nExemplos práticos de todos os cenários:\n\nAtender um surdo escrevendo num papel\n\nLidar com pai furioso por extravio de bagagem\n\nAjudar um idoso a se deslocar até o embarque\n\nPassageiro VIP que exige assento trocado na última hora\n\""}]$json_atendimento_cliente_aviacao$::jsonb, $mat_atendimento_cliente_aviacao$Conceito e jornada

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

---

Perfis de passageiros

Perfis de passageiros e empatia

Conhecer perfis de passageiros exige empatia: executivo com conexão curta, família com criança, passageiro estrangeiro, idoso, gestante, PcD e cliente em crise precisam de abordagens diferentes, mantendo o mesmo padrão de respeito e clareza.

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

---

Atendimento humanizado

Atendimento humanizado durante toda a jornada

O atendimento humanizado acompanha a jornada do passageiro antes, durante e depois do voo. Acolher, explicar, orientar e acompanhar reduzem ansiedade e transformam problemas operacionais em experiências mais previsíveis.

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

---

Acessibilidade e PNAE

Acessibilidade e PNAE

Acessibilidade e PNAE fazem parte do atendimento aeroportuário. O agente deve identificar passageiros com necessidade de assistência especial, registrar corretamente o serviço, oferecer apoio sem retirar autonomia e acionar recursos como cadeira de rodas, acompanhamento, comunicação acessível ou prioridade operacional.

Material de apoio da trilha

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

Exemplo:
Gestante embarcando com dificuldade recebe apoio com cadeira e embarque antecipado.

"
" MÓDULO 5 – Atendimento Multicanal
5.1. Canais de Atendimento
Explicação:
Cada canal exige linguagem e postura adaptada. O cliente espera uniformidade em todos.

Exemplo:
Se o cliente inicia contato via chat, e liga em seguida, o atendente já deve estar ciente do histórico.5.2. Atendimento no Balcão
Explicação:
É o ponto mais direto com o cliente. Exige empatia, clareza e postura.

Exemplo:
Usar frases como: “Como posso ajudar hoje?” ao invés de “O que você quer?”

5.3. Atendimento Digital
Explicação:
Precisa ser rápido, claro e sem jargões técnicos. A linguagem escrita deve ser amigável.

Exemplo:
Usar emojis com cautela, evitar “copiar e colar” mensagens frias.

5.4. Atendimento Telefônico e Rádio
Explicação:
Fala clara, pausada e com confirmação das informações. No rádio, manter o padrão ICAO (Alfa, Bravo, etc.).

Exemplo:
“Reforçando: seu voo sai às 17h do portão 15A.”"
" MÓDULO 6 – Situações Especiais e Críticas
6.1. Cancelamentos e Atrasos
Explicação:
Acolher o cliente com paciência, esclarecer os direitos e oferecer alternativas.

Exemplo:
“Seu voo atrasou por segurança. Vamos providenciar alimentação e verificar conexões.”

6.2. Overbooking
Explicação:
Ser honesto e proativo. Tentar negociar com compensações justas.

Exemplo:
“Há mais passageiros do que assentos. Posso lhe oferecer um voo amanhã com hospedagem paga e milhas de bônus.”6.3. Bagagens Extraviadas ou Violadas
Explicação:
Registrar a ocorrência com calma e orientar prazos e soluções.

Exemplo:
“Já registrei seu PIR no sistema. Seu número de protocolo é 8643. Informaremos assim que localizar.”

---

Conflitos e situacoes especiais

Conflitos e situações especiais

Conflitos podem surgir em cancelamento, atraso, overbooking, extravio, dano de bagagem, perda de conexão ou falha de comunicação. O agente deve manter postura calma, ouvir ativamente, explicar alternativas e registrar a tratativa.

Material de apoio da trilha

6.4. Emergências Médicas
Explicação:
Isentar o passageiro de filas, acionar paramédico e acompanhar com descrição.

Exemplo:
Acionar a equipe médica ao perceber desmaio próximo ao portão, isolando a área.

6.5. Reclamações e Conflitos
Explicação:
Ouvir, manter postura neutra e resolver ou encaminhar com educação.

Exemplo:
“O senhor tem razão. Deixe-me registrar sua reclamação para encaminhar à supervisão.”

"
" MÓDULO 7 – Boas Práticas e Padrões
7.1. Cases Positivos
Explicação:
Estudar companhias como Qatar, Azul, Emirates que investem em empatia e suporte.

Exemplo:
A Azul distribui kit de higiene e livros infantis durante atrasos, amenizando o desconforto.

7.2. SLA e Compromissos
Explicação:
Tempo máximo de espera, resposta e soluções. Devem ser cumpridos.

Exemplo:
Responder um e-mail de reclamação em até 48 horas.7.3. Indicadores de Qualidade
Explicação:
NPS, CSAT e FCR avaliam percepção e eficiência.

Exemplo:
NPS mede a chance de o cliente recomendar a empresa com base no atendimento.

7.4. Feedback
Explicação:
Usar elogios e críticas como ferramenta de melhoria.

Exemplo:
Reuniões mensais com base nos relatórios de elogios e reclamações da Ouvidoria.

"
" MÓDULO 8 – Ética, Postura e Imagem
8.1. Código de Conduta
Explicação:
Regula o comportamento e as decisões éticas da equipe.

Exemplo:
Não divulgar informações de voos especiais, celebridades ou casos de saúde.

8.2. Aparência e Comunicação Não Verbal
Explicação:
Uniforme limpo, postura confiante e simpatia são essenciais.

Exemplo:
Evitar braços cruzados ou falar de costas para o cliente.

8.3. Diversidade e Inclusão
Explicação:
Tratar todos com equidade, respeitando diferenças culturais, religiosas, de gênero ou identidade.

Exemplo:
Usar o pronome correto de uma pessoa transgênero, conforme solicitado.
"
" MÓDULO 9 – Simulações
Exemplos práticos de todos os cenários:

Atender um surdo escrevendo num papel

Lidar com pai furioso por extravio de bagagem

Ajudar um idoso a se deslocar até o embarque

Passageiro VIP que exige assento trocado na última hora
"$mat_atendimento_cliente_aviacao$),
('boas-praticas-atendimento', $json_boas_praticas_atendimento$[{"title":"Excelencia na aviacao","type":"Aula","duration":"15 min","content":"Excelência na aviação\n\n1. Introdução à Excelência no Atendimento\nO atendimento ao cliente é um dos pilares fundamentais da aviação civil. A experiência do passageiro começa no primeiro contato com a companhia aérea, seja no balcão de check-in, no embarque ou a bordo da aeronave. Um atendimento de excelência vai além da cortesia: envolve postura profissional, empatia, eficiência e agilidade na resolução de problemas.\n\nExemplo: Um atendente que recebe o passageiro com um sorriso, explica claramente o processo de embarque e se prontifica a ajudar com dúvidas demonstra profissionalismo e contribui para uma experiência positiva.\n\"\n\"\n\nAtendimento excelente combina postura profissional, empatia, eficiência e agilidade. O passageiro avalia a experiência desde o primeiro contato até o pós-voo."},{"title":"Perfil do cliente","type":"Aula","duration":"15 min","content":"Perfil do cliente com empatia\n\nA leitura do perfil do cliente deve ser feita com empatia, sem rótulos. O agente adapta linguagem, ritmo e nível de detalhe conforme necessidade, mantendo escuta ativa, cordialidade e solução prática.\n\nPerfil do cliente\n\n2. Perfil do Cliente na Aviação\nOs clientes da aviação são extremamente diversos: viajantes a negócios, famílias com crianças, idosos, turistas estrangeiros, pessoas com deficiência e passageiros em situações delicadas. Cada perfil demanda um tipo de abordagem. Saber identificar essas diferenças permite oferecer um atendimento mais eficiente e humanizado.\n\nExemplo: Uma criança desacompanhada precisa de atenção especial desde o check-in até o desembarque. O agente responsável deve garantir segurança, acompanhamento contínuo e comunicação clara com os responsáveis.\n\"\n\"\n\nCada passageiro possui necessidade diferente: viajante frequente, família com criança, passageiro idoso, gestante, passageiro estrangeiro, pessoa com deficiência, passageiro em crise ou passageiro impactado por irregularidade operacional."},{"title":"Comunicacao eficaz","type":"Pratica","duration":"18 min","content":"Comunicação eficaz considerando o perfil\n\nComunicação eficaz depende do perfil do passageiro. O agente deve ajustar vocabulário, tom e quantidade de informação para famílias, passageiros frequentes, estrangeiros, idosos, pessoas com deficiência e clientes sob estresse.\n\nComunicação eficaz\n\n3. Comunicação Eficaz\nA comunicação eficaz é a chave para evitar mal-entendidos e resolver conflitos rapidamente. Na aviação, a comunicação deve ser clara, objetiva e acolhedora. É importante escutar ativamente o cliente e adaptar a linguagem ao nível de entendimento dele, evitando termos técnicos.\n\nExemplo: Em vez de dizer \"\"Seu voo está overbooked\"\", o ideal é explicar: \"\"Este voo está com todos os assentos ocupados. Estamos trabalhando para encontrar a melhor solução para você.\"\"\n\"\n\"\n\nComunicação eficaz é clara, acolhedora e objetiva. Evite jargões técnicos quando o passageiro não domina o assunto. Explique o que aconteceu, qual é a alternativa e qual será o próximo passo."},{"title":"Situacoes especiais","type":"Simulacao","duration":"20 min","content":"Situações especiais\n\nPassageiros em situações especiais incluem gestantes, idosos, pessoas com deficiência, passageiros com mobilidade reduzida, famílias com crianças, menores desacompanhados, passageiros estrangeiros, clientes em crise emocional e passageiros impactados por atraso, cancelamento, overbooking, extravio ou dano de bagagem.\n\nAtrasos, cancelamentos, overbooking, perda de bagagem e passageiros em condição especial exigem calma e escuta ativa. O agente deve acolher, explicar direitos e alternativas e registrar o atendimento de forma adequada.\n\nGestantes e idosos\n\nDevem receber prioridade, orientação clara e apoio quando houver dificuldade de deslocamento, dúvida operacional ou necessidade de acomodação. O atendimento deve ser paciente, objetivo e respeitoso.\n\nPessoas com deficiência ou mobilidade reduzida\n\nO agente deve perguntar antes de ajudar, falar diretamente com o passageiro, preservar autonomia e acionar recursos adequados, como cadeira de rodas, acompanhamento, atendimento prioritário ou comunicação acessível.\n\nPassageiros irritados ou em crise\n\nMantenha a calma, não interrompa a fala inicial, demonstre que entendeu o problema e apresente próximos passos concretos. Evite frases defensivas. O foco deve ser solução, registro e orientação.\n\nExemplo prático\n\nEm caso de embarque negado por overbooking, explique a situação com transparência, ofereça as alternativas previstas, registre a tratativa e acompanhe o passageiro até que a solução esteja encaminhada."},{"title":"Feedback e melhoria","type":"Consulta","duration":"16 min","content":"Feedback e melhoria\n\nFeedback\nO feedback dos passageiros é uma ferramenta poderosa de melhoria contínua. Elogios reforçam boas práticas e reclamações indicam falhas a corrigir. Profissionais devem estar abertos ao retorno dos clientes, sem levar para o lado pessoal.\n\nExemplo: Um passageiro elogia o agente de solo por sua paciência e atenção durante uma conexão apertada. Essa informação deve ser registrada para reconhecimento. Reclamações devem ser analisadas para treinar a equipe e evitar recorrências.\n\"\n\"9. Estudos de Caso\nEstudos de caso ajudam a refletir sobre boas e más práticas no atendimento. Situações reais, com desfechos positivos ou negativos, trazem lições valiosas para o dia a dia da aviação.\n\nExemplo positivo: Uma comissária percebe que uma mãe está viajando sozinha com bebê e se oferece para aquecer a mamadeira e buscar lugar mais confortável. O atendimento vai além do esperado, gerando encantamento.\n\nExemplo negativo: Um passageiro estrangeiro é tratado com frieza por não falar português e se sente ignorado. A empresa recebe uma reclamação formal e investe em treinamentos de idiomas e cultura.\n\n\"\n\"10. Encerramento e Dicas Finais\nA excelência no atendimento é uma construção diária, feita com atitudes simples: ouvir com atenção, sorrir, manter a postura e buscar soluções. O profissional da aviação representa a imagem da empresa e influencia diretamente a percepção do cliente.\n\nDicas finais:\n\nTrate cada passageiro como único.\n\nUse sempre o nome do cliente, quando possível.\n\nMantenha a aparência alinhada e a linguagem respeitosa.\n\nSeja gentil mesmo sob pressão.\n\n\"\n\nUse feedbacks para ajustar processos, treinar a equipe, reconhecer boas práticas e reduzir reincidência de falhas. Um atendimento excelente não termina na solução do caso; ele se fortalece quando a operação aprende com cada ocorrência."}]$json_boas_praticas_atendimento$::jsonb, $mat_boas_praticas_atendimento$Excelencia na aviacao

Excelência na aviação

1. Introdução à Excelência no Atendimento
O atendimento ao cliente é um dos pilares fundamentais da aviação civil. A experiência do passageiro começa no primeiro contato com a companhia aérea, seja no balcão de check-in, no embarque ou a bordo da aeronave. Um atendimento de excelência vai além da cortesia: envolve postura profissional, empatia, eficiência e agilidade na resolução de problemas.

Exemplo: Um atendente que recebe o passageiro com um sorriso, explica claramente o processo de embarque e se prontifica a ajudar com dúvidas demonstra profissionalismo e contribui para uma experiência positiva.
"
"

Atendimento excelente combina postura profissional, empatia, eficiência e agilidade. O passageiro avalia a experiência desde o primeiro contato até o pós-voo.

---

Perfil do cliente

Perfil do cliente com empatia

A leitura do perfil do cliente deve ser feita com empatia, sem rótulos. O agente adapta linguagem, ritmo e nível de detalhe conforme necessidade, mantendo escuta ativa, cordialidade e solução prática.

Perfil do cliente

2. Perfil do Cliente na Aviação
Os clientes da aviação são extremamente diversos: viajantes a negócios, famílias com crianças, idosos, turistas estrangeiros, pessoas com deficiência e passageiros em situações delicadas. Cada perfil demanda um tipo de abordagem. Saber identificar essas diferenças permite oferecer um atendimento mais eficiente e humanizado.

Exemplo: Uma criança desacompanhada precisa de atenção especial desde o check-in até o desembarque. O agente responsável deve garantir segurança, acompanhamento contínuo e comunicação clara com os responsáveis.
"
"

Cada passageiro possui necessidade diferente: viajante frequente, família com criança, passageiro idoso, gestante, passageiro estrangeiro, pessoa com deficiência, passageiro em crise ou passageiro impactado por irregularidade operacional.

---

Comunicacao eficaz

Comunicação eficaz considerando o perfil

Comunicação eficaz depende do perfil do passageiro. O agente deve ajustar vocabulário, tom e quantidade de informação para famílias, passageiros frequentes, estrangeiros, idosos, pessoas com deficiência e clientes sob estresse.

Comunicação eficaz

3. Comunicação Eficaz
A comunicação eficaz é a chave para evitar mal-entendidos e resolver conflitos rapidamente. Na aviação, a comunicação deve ser clara, objetiva e acolhedora. É importante escutar ativamente o cliente e adaptar a linguagem ao nível de entendimento dele, evitando termos técnicos.

Exemplo: Em vez de dizer ""Seu voo está overbooked"", o ideal é explicar: ""Este voo está com todos os assentos ocupados. Estamos trabalhando para encontrar a melhor solução para você.""
"
"

Comunicação eficaz é clara, acolhedora e objetiva. Evite jargões técnicos quando o passageiro não domina o assunto. Explique o que aconteceu, qual é a alternativa e qual será o próximo passo.

---

Situacoes especiais

Situações especiais

Passageiros em situações especiais incluem gestantes, idosos, pessoas com deficiência, passageiros com mobilidade reduzida, famílias com crianças, menores desacompanhados, passageiros estrangeiros, clientes em crise emocional e passageiros impactados por atraso, cancelamento, overbooking, extravio ou dano de bagagem.

Atrasos, cancelamentos, overbooking, perda de bagagem e passageiros em condição especial exigem calma e escuta ativa. O agente deve acolher, explicar direitos e alternativas e registrar o atendimento de forma adequada.

Gestantes e idosos

Devem receber prioridade, orientação clara e apoio quando houver dificuldade de deslocamento, dúvida operacional ou necessidade de acomodação. O atendimento deve ser paciente, objetivo e respeitoso.

Pessoas com deficiência ou mobilidade reduzida

O agente deve perguntar antes de ajudar, falar diretamente com o passageiro, preservar autonomia e acionar recursos adequados, como cadeira de rodas, acompanhamento, atendimento prioritário ou comunicação acessível.

Passageiros irritados ou em crise

Mantenha a calma, não interrompa a fala inicial, demonstre que entendeu o problema e apresente próximos passos concretos. Evite frases defensivas. O foco deve ser solução, registro e orientação.

Exemplo prático

Em caso de embarque negado por overbooking, explique a situação com transparência, ofereça as alternativas previstas, registre a tratativa e acompanhe o passageiro até que a solução esteja encaminhada.

---

Feedback e melhoria

Feedback e melhoria

Feedback
O feedback dos passageiros é uma ferramenta poderosa de melhoria contínua. Elogios reforçam boas práticas e reclamações indicam falhas a corrigir. Profissionais devem estar abertos ao retorno dos clientes, sem levar para o lado pessoal.

Exemplo: Um passageiro elogia o agente de solo por sua paciência e atenção durante uma conexão apertada. Essa informação deve ser registrada para reconhecimento. Reclamações devem ser analisadas para treinar a equipe e evitar recorrências.
"
"9. Estudos de Caso
Estudos de caso ajudam a refletir sobre boas e más práticas no atendimento. Situações reais, com desfechos positivos ou negativos, trazem lições valiosas para o dia a dia da aviação.

Exemplo positivo: Uma comissária percebe que uma mãe está viajando sozinha com bebê e se oferece para aquecer a mamadeira e buscar lugar mais confortável. O atendimento vai além do esperado, gerando encantamento.

Exemplo negativo: Um passageiro estrangeiro é tratado com frieza por não falar português e se sente ignorado. A empresa recebe uma reclamação formal e investe em treinamentos de idiomas e cultura.

"
"10. Encerramento e Dicas Finais
A excelência no atendimento é uma construção diária, feita com atitudes simples: ouvir com atenção, sorrir, manter a postura e buscar soluções. O profissional da aviação representa a imagem da empresa e influencia diretamente a percepção do cliente.

Dicas finais:

Trate cada passageiro como único.

Use sempre o nome do cliente, quando possível.

Mantenha a aparência alinhada e a linguagem respeitosa.

Seja gentil mesmo sob pressão.

"

Use feedbacks para ajustar processos, treinar a equipe, reconhecer boas práticas e reduzir reincidência de falhas. Um atendimento excelente não termina na solução do caso; ele se fortalece quando a operação aprende com cada ocorrência.$mat_boas_praticas_atendimento$)
)
update public.academy_courses as c
set
    modules = u.modules,
    material = u.material
from course_content_update as u
where c.id = u.id;

-- Cursos neste lote:
-- dpr
-- worldtracer-completo
-- atendimento-cliente-aviacao
-- boas-praticas-atendimento
