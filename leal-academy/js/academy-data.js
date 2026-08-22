const academyCourses = [
    {
        "id": "fundamentos",
        "title": "Fundamentos do Atendimento Aeroportuario",
        "eyebrow": "Curso inicial",
        "duration": "45 min",
        "level": "Basico",
        "summary": "Apresentacao pessoal, postura, atendimento ao passageiro e prioridades operacionais.",
        "color": "#2f80ed",
        "modules": [
            {
                "title": "Atendimento ao passageiro",
                "type": "Aula",
                "duration": "12 min",
                "content": "Primeiras impressoes, cordialidade, postura, clareza na comunicacao e seguranca nas orientacoes."
            },
            {
                "title": "Prioridades e assistencias",
                "type": "Aula",
                "duration": "14 min",
                "content": "Idosos, gestantes, PNAE, passageiros com deficiencia, menores desacompanhados e servicos especiais."
            },
            {
                "title": "Codigos AIRIMP",
                "type": "Consulta",
                "duration": "19 min",
                "content": "BLND, DEAF, WCHR, WCHS, WCHC, UMNR, MAAS, PETC, AVIH, SVAN, ESAN, WEAP e refeicoes especiais."
            }
        ],
        "labs": [
            {
                "label": "Biblioteca Operacional",
                "href": "operational-library.html"
            }
        ],
        "quiz": []
    },
    {
        "id": "bagagem-extraviada",
        "title": "Bagagem Extraviada - Procedimento AHL",
        "eyebrow": "Curso operacional",
        "duration": "2h 20min",
        "level": "Intermediario",
        "summary": "Definicao de extravio, abertura de PIR/AHL, atendimento no desembarque, busca, entrega, custos e encerramento.",
        "color": "#16a34a",
        "modules": [
            {
                "title": "Definicao e registro",
                "type": "Aula",
                "duration": "18 min",
                "content": "Bagagem extraviada e a bagagem despachada que nao chegou no mesmo voo do passageiro. O registro AHL deve ocorrer no ato do desembarque, seguindo o nome que consta na etiqueta da bagagem."
            },
            {
                "title": "Atendimento no desembarque",
                "type": "Procedimento",
                "duration": "22 min",
                "content": "O agente deve recepcionar passageiros na area de restituicao, informar esteira, consultar FWD, localizar passageiros afetados, orientar prazos e evitar promessas sem verificacao operacional."
            },
            {
                "title": "Documentos e dados obrigatorios",
                "type": "Pratica guiada",
                "duration": "20 min",
                "content": "No WorldTracer, inserir documentos no campo PP com sigla e numero: CPF, RG, DNI ou passaporte. Conferir TN, rota, voo, contatos, endereco, RL, FS e informacoes complementares."
            },
            {
                "title": "Busca por excecao e casos especiais",
                "type": "Consulta",
                "duration": "24 min",
                "content": "A busca por excecao deve ser tratada conforme regra operacional, incluindo casos de conexao com bilhetes separados, alfandega, artigos restritos, arma de fogo e pereciveis."
            },
            {
                "title": "Entrega e encerramento",
                "type": "Simulacao",
                "duration": "26 min",
                "content": "Quando a bagagem chega ao aeroporto, o caso deve ser suspenso, o voo/data deve ser registrado e o BDO deve ser criado. A entrega exige confirmacao de endereco, lacre, recibo e encerramento correto."
            }
        ],
        "labs": [
            {
                "label": "Laboratorio AHL Web",
                "href": "ahl.html"
            },
            {
                "label": "Mascara AHL SITA",
                "href": "worldtracer/ahl.html"
            }
        ],
        "quiz": [
            {
                "question": "O que caracteriza uma bagagem como extraviada?",
                "options": [
                    "Quando e danificada no transporte",
                    "Quando o passageiro se recusa a retira-la",
                    "Quando nao chega no mesmo voo do passageiro",
                    "Quando e deixada na esteira por mais de 30 minutos"
                ],
                "correct": 2
            },
            {
                "question": "Qual e a sigla utilizada no sistema WorldTracer para bagagem extraviada?",
                "options": [
                    "PIR",
                    "FWD",
                    "DLY",
                    "AHL"
                ],
                "correct": 3
            },
            {
                "question": "O que significa a sigla AHL no sistema SITA WorldTracer?",
                "options": [
                    "Alert Hold Luggage",
                    "Arrival Hold List",
                    "Advise If Hold",
                    "Acknowledge Hold Location"
                ],
                "correct": 2
            },
            {
                "question": "A abertura da ocorrencia de Delayed Bag deve ser feita de preferencia:",
                "options": [
                    "Apos o passageiro sair do aeroporto",
                    "No ato do desembarque",
                    "Em qualquer momento",
                    "Apos 24 horas"
                ],
                "correct": 1
            },
            {
                "question": "Quando uma familia tem tres malas extraviadas, cada uma em nome de um passageiro, deve-se:",
                "options": [
                    "Abrir um unico PIR",
                    "Abrir um AHL por grupo familiar",
                    "Abrir tres PIRs distintos",
                    "Notificar apenas a mala principal"
                ],
                "correct": 2
            },
            {
                "question": "Qual nome deve ser usado para registrar o AHL?",
                "options": [
                    "Nome da reserva",
                    "Nome do acompanhante",
                    "Nome na etiqueta da bagagem",
                    "Nome do comprador da passagem"
                ],
                "correct": 2
            },
            {
                "question": "Um dos objetivos de consultar mensagens FWD recebidas e:",
                "options": [
                    "Atualizar banco de dados",
                    "Identificar passageiros com bagagem deixada na origem",
                    "Cancelar voos",
                    "Enviar bagagens ao exterior"
                ],
                "correct": 1
            },
            {
                "question": "Ao consultar FWD, o agente deve:",
                "options": [
                    "Informar que a bagagem ja esta no destino",
                    "Confirmar reembolso",
                    "Anunciar nomes para evitar espera na esteira",
                    "Encaminhar ao embarque"
                ],
                "correct": 2
            },
            {
                "question": "Em qual sistema as bagagens extraviadas sao registradas?",
                "options": [
                    "Sistema de check-in da companhia",
                    "IATA Secure",
                    "SITA WorldTracer Desktop",
                    "ANAC Baggage Portal"
                ],
                "correct": 2
            },
            {
                "question": "A sigla PIR significa:",
                "options": [
                    "Passenger Identification Record",
                    "Personal Item Receipt",
                    "Property Irregularity Report",
                    "Package Identification Request"
                ],
                "correct": 2
            },
            {
                "question": "Quais documentos devem ser inseridos no campo PP?",
                "options": [
                    "Somente passaporte",
                    "Qualquer documento com foto",
                    "CPF, RG, DNI ou passaporte com sigla e numero",
                    "Apenas cartao de embarque"
                ],
                "correct": 2
            },
            {
                "question": "Qual legislacao e aplicada no caso de extravio?",
                "options": [
                    "Codigo de Defesa do Consumidor",
                    "Lei de Aeroportos",
                    "Convencao de Montreal e Resolucao 400 ANAC",
                    "Normas do Procon"
                ],
                "correct": 2
            },
            {
                "question": "Quando a mala esta disponivel no aeroporto para entrega, o colaborador deve:",
                "options": [
                    "Aguardar o cliente",
                    "Informar o passageiro e confirmar endereco",
                    "Enviar sem contato",
                    "Esperar a transportadora"
                ],
                "correct": 1
            },
            {
                "question": "No caso de bagagem retida pela Alfandega por responsabilidade do passageiro, qual RL usar?",
                "options": [
                    "RL79",
                    "RL01",
                    "RL73",
                    "RL90"
                ],
                "correct": 2
            },
            {
                "question": "O que fazer ao informar passageiro sobre extravio?",
                "options": [
                    "Fazer promessas",
                    "Explicar claramente e nao prometer o que nao pode cumprir",
                    "Dizer que chega no proximo voo sem verificar",
                    "Encaminhar ao setor juridico"
                ],
                "correct": 1
            }
        ]
    },
    {
        "id": "objetos-esquecidos",
        "title": "Objetos Esquecidos a Bordo - RFP",
        "eyebrow": "Lost and Found",
        "duration": "1h 40min",
        "level": "Intermediario",
        "summary": "Registro, guarda, transporte, entrega e controle de objetos pessoais encontrados em aeronaves ou areas da companhia.",
        "color": "#0ea5e9",
        "modules": [
            {
                "title": "Definicao e responsabilidade",
                "type": "Aula",
                "duration": "16 min",
                "content": "Objetos esquecidos sao itens pessoais encontrados em aeronaves ou instalacoes da companhia. Devem ser registrados, armazenados e gerenciados pelo Servico de Bagagem."
            },
            {
                "title": "Cadastro no WorldTracer",
                "type": "Pratica guiada",
                "duration": "22 min",
                "content": "A transacao e Lost and Found Property - RFP. Os campos mandatarios sao Category e Date Found. A descricao detalhada deve ser preferencialmente em ingles."
            },
            {
                "title": "Prazo, guarda e descarte",
                "type": "Procedimento",
                "duration": "18 min",
                "content": "O agente tem ate 12 horas apos a chegada do voo para inserir o objeto. Se nao retirado em ate 30 dias, segue para deposito em Sao Paulo, respeitando excecoes locais como powerbanks."
            },
            {
                "title": "Transporte entre aeroportos",
                "type": "Procedimento",
                "duration": "20 min",
                "content": "Objetos nao devem ser entregues a tripulacao. O envio deve ocorrer com etiqueta rush, em caixa lacrada com fita, registrando no AI02 voo, data e numero da rush."
            },
            {
                "title": "Entrega ao passageiro",
                "type": "Simulacao",
                "duration": "14 min",
                "content": "A entrega exige confirmacao do voo, documento do passageiro e recibo assinado com CPF, RG ou passaporte. A folha deve ser arquivada e o caso atualizado no sistema."
            }
        ],
        "labs": [
            {
                "label": "Biblioteca Operacional",
                "href": "operational-library.html"
            }
        ],
        "quiz": [
            {
                "question": "Qual o prazo maximo para registrar objeto esquecido no WorldTracer Desktop?",
                "options": [
                    "24 horas apos o voo",
                    "Imediatamente apos o desembarque",
                    "12 horas apos a chegada do voo",
                    "Ate o final do expediente"
                ],
                "correct": 2
            },
            {
                "question": "Qual transacao e utilizada para registrar objetos esquecidos?",
                "options": [
                    "Found Item Entry - FIE",
                    "On-Hand Bag - OHD",
                    "Missing Report - PIR",
                    "Lost and Found Property - RFP"
                ],
                "correct": 3
            },
            {
                "question": "Para onde objetos nao retirados em ate 30 dias devem ser enviados?",
                "options": [
                    "Escritorio central da companhia",
                    "Departamento de Seguranca",
                    "Deposito de bagagens designado",
                    "Setor LL do aeroporto"
                ],
                "correct": 2
            },
            {
                "question": "Qual item nao deve ser enviado ao deposito central, seguindo orientacao local?",
                "options": [
                    "Documentos pessoais",
                    "Dinheiro",
                    "Powerbanks",
                    "Joias"
                ],
                "correct": 2
            },
            {
                "question": "Quais campos sao obrigatorios no cadastro do objeto?",
                "options": [
                    "Nome do passageiro e voo",
                    "Categoria e data em que foi encontrado",
                    "Local de armazenamento e companhia",
                    "Numero da bagagem e destino"
                ],
                "correct": 1
            },
            {
                "question": "Qual procedimento correto para transporte entre aeroportos?",
                "options": [
                    "Entregar a tripulacao",
                    "Enviar por malote",
                    "Enviar com etiqueta rush em caixa lacrada",
                    "Enviar junto com bagagens de passageiros"
                ],
                "correct": 2
            },
            {
                "question": "Qual o maximo de itens registrados de uma vez no sistema?",
                "options": [
                    "5",
                    "10",
                    "15",
                    "Nao ha limite"
                ],
                "correct": 1
            },
            {
                "question": "O que deve constar no Detailed Description?",
                "options": [
                    "Apenas cor",
                    "Descricao generica",
                    "Detalhamento preferencialmente em ingles",
                    "Nome do passageiro"
                ],
                "correct": 2
            },
            {
                "question": "Se o passageiro relata objeto a bordo sem confirmacao de localizacao, o agente deve:",
                "options": [
                    "Informar que foi perdido",
                    "Pedir para esperar 30 dias",
                    "Dizer que sera devolvido automaticamente",
                    "Coletar contatos e iniciar buscas nos aeroportos por onde a aeronave passou"
                ],
                "correct": 3
            },
            {
                "question": "Quando o objeto e entregue ao passageiro, qual formalidade e necessaria?",
                "options": [
                    "Nenhuma",
                    "Foto do objeto",
                    "Recibo assinado com CPF, RG ou passaporte",
                    "Entrega verbal com CPF"
                ],
                "correct": 2
            },
            {
                "question": "Qual a finalidade do relatorio impresso do RFP?",
                "options": [
                    "Arquivo juridico",
                    "Controle de limpeza",
                    "Protocolo de envio",
                    "Recibo formal apenso ao objeto"
                ],
                "correct": 3
            },
            {
                "question": "No transporte entre aeroportos, o que inserir no AI02?",
                "options": [
                    "Nome e conteudo",
                    "Valor estimado",
                    "Voo, data e numero da etiqueta rush",
                    "Origem e companhia"
                ],
                "correct": 2
            },
            {
                "question": "Se o objeto foi localizado, mas ainda nao chegou ao Servico de Bagagem, deve-se informar:",
                "options": [
                    "Que esta disponivel",
                    "Que ainda nao foi localizado",
                    "Que ira ao domicilio",
                    "Que a PF fara busca"
                ],
                "correct": 1
            },
            {
                "question": "Quando o objeto e dinheiro, o que registrar no sistema?",
                "options": [
                    "Valor exato",
                    "Moeda e montante",
                    "A palavra Valores, sem especificar quantia",
                    "Nome e CPF"
                ],
                "correct": 2
            },
            {
                "question": "Onde encontrar a planilha de controle de objetos localizados?",
                "options": [
                    "GDS da companhia",
                    "Site da Central de Bagagem",
                    "Sistema de vendas",
                    "Intranet da equipe de voo"
                ],
                "correct": 1
            }
        ]
    },
    {
        "id": "avsec",
        "title": "Seguranca da Aviacao Civil - AVSEC",
        "eyebrow": "Seguranca operacional",
        "duration": "1h 30min",
        "level": "Basico",
        "summary": "Medidas, normas e procedimentos para proteger aeronaves, aeroportos, passageiros, equipes e instalacoes contra interferencia ilicita.",
        "color": "#6366f1",
        "modules": [
            {
                "title": "Conceito de AVSEC",
                "type": "Aula",
                "duration": "14 min",
                "content": "AVSEC e o conjunto de medidas para proteger passageiros, funcionarios, aeronaves e aeroportos contra sabotagem, sequestro, terrorismo, invasao de area restrita e transporte ilegal de substancias perigosas."
            },
            {
                "title": "Legislacao e entidades",
                "type": "Consulta",
                "duration": "18 min",
                "content": "A seguranca segue referencias como Anexo 17 da OACI, Codigo Brasileiro de Aeronautica, RBAC 107, 108 e 110. ANAC regula e fiscaliza, OACI define normas internacionais e Policia Federal atua na repressao de crimes aeroportuarios."
            },
            {
                "title": "Ameacas comuns",
                "type": "Aula",
                "duration": "14 min",
                "content": "Entre as ameacas estao sequestro de aeronaves, sabotagem, entrada nao autorizada em areas restritas e explosivos em bagagens."
            },
            {
                "title": "Medidas de prevencao",
                "type": "Procedimento",
                "duration": "20 min",
                "content": "Controle de acesso, raio-X, EDS, inspecao pessoal, verificacao de antecedentes, cameras, vigilantes e caes farejadores compoem a rotina preventiva."
            },
            {
                "title": "Resposta a situacoes criticas",
                "type": "Simulacao",
                "duration": "14 min",
                "content": "Bagagem suspeita exige isolamento da area e acionamento especializado. Acesso nao autorizado exige intervencao da seguranca e verificacao de identidade."
            }
        ],
        "labs": [
            {
                "label": "Biblioteca Operacional",
                "href": "operational-library.html"
            }
        ],
        "quiz": [
            {
                "question": "O que significa AVSEC?",
                "options": [
                    "Seguranca da Aviacao Civil",
                    "Protecao da Aviacao Civil",
                    "Gerenciamento da Aviacao Civil",
                    "Protecao somente de aeronaves"
                ],
                "correct": 0
            },
            {
                "question": "Cite tres ameacas comuns a aviacao.",
                "options": [
                    "Sequestro, sabotagem e entrada nao autorizada em area restrita",
                    "Bagagem com sobrepeso, sujeira na pista e passageiro atrasado",
                    "Aeroporto fechado, chuva forte e manutencao",
                    "Todas as alternativas"
                ],
                "correct": 0
            },
            {
                "question": "Qual orgao fiscaliza a seguranca nos aeroportos brasileiros?",
                "options": [
                    "ANAC",
                    "ICAO",
                    "IATA",
                    "ANVISA"
                ],
                "correct": 0
            },
            {
                "question": "O que fazer ao ver uma bagagem suspeita?",
                "options": [
                    "Isolar area e acionar esquadrao antibombas",
                    "Abrir a bagagem",
                    "Jogar no lixo",
                    "Entregar para a companhia"
                ],
                "correct": 0
            },
            {
                "question": "Quem pode acessar area de patio?",
                "options": [
                    "Somente pessoas autorizadas",
                    "Qualquer pessoa com identidade",
                    "Passageiros com cartao de embarque",
                    "Todas as alternativas"
                ],
                "correct": 0
            },
            {
                "question": "O que e Seguranca da Aviacao Civil?",
                "options": [
                    "Medidas para proteger aeronaves, aeroportos, passageiros, tripulacao e instalacoes contra atos ilicitos",
                    "Procedimento para valorizar companhias",
                    "Medidas nao obrigatorias",
                    "Apenas auditoria"
                ],
                "correct": 0
            },
            {
                "question": "O que significa PSOA?",
                "options": [
                    "Plano de Seguranca Operacional da Aviacao",
                    "Plano de Seguranca Operacional da viacao",
                    "Plano de melhoria operacional",
                    "Processo de servico operacional"
                ],
                "correct": 0
            },
            {
                "question": "Quais medidas ajudam a evitar interferencia ilicita?",
                "options": [
                    "Controle de acesso",
                    "Rastreio de bagagens e cargas",
                    "Inspecao de passageiros",
                    "Todas as alternativas"
                ],
                "correct": 3
            },
            {
                "question": "O que e o RBAC 108?",
                "options": [
                    "Requisitos de seguranca para operadores aereos, incluindo inspecao de passageiros e bagagens",
                    "Requisitos de servicos",
                    "Requisitos administrativos",
                    "Somente inspecao de passageiros"
                ],
                "correct": 0
            },
            {
                "question": "Qual o papel da OACI/ICAO?",
                "options": [
                    "Definir normas internacionais",
                    "Definir normas nacionais",
                    "Fiscalizar normas internacionais",
                    "Nenhuma"
                ],
                "correct": 0
            }
        ]
    },
    {
        "id": "manuseio-bagagem",
        "title": "Prevencao de Danos no Manuseio de Bagagem",
        "eyebrow": "Curso de rampa e check-in",
        "duration": "1h 50min",
        "level": "Intermediario",
        "summary": "Tecnicas de movimentacao, empilhamento, transporte, carregamento e descarregamento para reduzir danos fisicos e reclamacoes.",
        "color": "#f97316",
        "modules": [
            {
                "title": "Integridade de bagagem",
                "type": "Aula",
                "duration": "16 min",
                "content": "Danos podem ser visiveis, funcionais ou ocultos. A responsabilidade envolve toda equipe que interage com a bagagem: check-in, inspecao, triagem, pista e restituicao."
            },
            {
                "title": "Causas comuns de dano",
                "type": "Aula",
                "duration": "18 min",
                "content": "Queda, arremesso, atrito, empilhamento incorreto, chuva, sol, vazamentos e etiqueta arrancada sao causas frequentes de avarias e extravios."
            },
            {
                "title": "Cuidados por tipo de volume",
                "type": "Consulta",
                "duration": "20 min",
                "content": "Malas rigidas nao toleram impacto lateral; malas de tecido rasgam em superficies asperas; caixas exigem reforco; animais devem ficar em area ventilada, protegida e nunca empilhada."
            },
            {
                "title": "Estivagem e descarregamento",
                "type": "Pratica guiada",
                "duration": "24 min",
                "content": "Organize por camadas, malas pesadas na base, frageis no topo, sem espacos ociosos. No descarregamento, nao jogar malas: usar apoio, pranchas, roletes ou movimento controlado."
            },
            {
                "title": "Limited Release",
                "type": "Procedimento",
                "duration": "18 min",
                "content": "O LR registra danos pre-existentes, embalagens inadequadas ou itens frageis sem protecao. Deve conter dados do passageiro, dano observado, voo, data e assinaturas."
            }
        ],
        "labs": [
            {
                "label": "Laboratorio DPR Web",
                "href": "dpr.html"
            },
            {
                "label": "Mascara DPR SITA",
                "href": "worldtracer/dpr.html"
            }
        ],
        "quiz": [
            {
                "question": "Qual opcao e considerada dano funcional?",
                "options": [
                    "Rodinha quebrada",
                    "Etiqueta arrancada",
                    "Mala que nao fecha",
                    "Rasgo no tecido"
                ],
                "correct": 2
            },
            {
                "question": "Quem e responsavel pela integridade da bagagem?",
                "options": [
                    "Somente agentes de pista",
                    "Apenas check-in",
                    "Toda equipe que interage com a bagagem",
                    "Apenas restituicao"
                ],
                "correct": 2
            },
            {
                "question": "Um exemplo de dano causado por arremesso e:",
                "options": [
                    "Mofo",
                    "Rasgo por asfalto",
                    "Quebra de puxador e amassado",
                    "Troca de mala"
                ],
                "correct": 2
            },
            {
                "question": "A exposicao prolongada ao sol pode causar:",
                "options": [
                    "Rasgos no tecido",
                    "Trincas laterais",
                    "Mofo e odor",
                    "Derretimento de partes plasticas"
                ],
                "correct": 3
            },
            {
                "question": "Uma etiqueta arrancada pode resultar em:",
                "options": [
                    "Dano interno",
                    "Extravio de bagagem",
                    "Rachadura",
                    "Dano funcional"
                ],
                "correct": 1
            },
            {
                "question": "Como deve ser transportada uma mala rigida?",
                "options": [
                    "Empilhada com outras 3 malas",
                    "Com base para cima",
                    "Com base para baixo e sem atrito",
                    "Arremessada com cuidado"
                ],
                "correct": 2
            },
            {
                "question": "Na estivagem segura, qual pratica e recomendada?",
                "options": [
                    "Malas leves na base",
                    "Espacos vazios",
                    "Mantas e peso em camadas",
                    "Pequenas e frageis primeiro"
                ],
                "correct": 2
            },
            {
                "question": "O que deve ser evitado ao descarregar bagagens?",
                "options": [
                    "Apoio de outro colaborador",
                    "Jogar malas para fora do porao",
                    "Usar pranchas",
                    "Deixar perto da porta"
                ],
                "correct": 1
            },
            {
                "question": "Um erro operacional comum e:",
                "options": [
                    "Usar alcas reforcadas",
                    "Ignorar etiquetas de FRAGIL",
                    "Usar cintas",
                    "Separar frageis"
                ],
                "correct": 1
            },
            {
                "question": "O termo Limited Release serve para:",
                "options": [
                    "Registrar extravio",
                    "Garantir embarque prioritario",
                    "Isentar responsabilidade por dano pre-existente",
                    "Garantir indenizacao"
                ],
                "correct": 2
            },
            {
                "question": "Qual beneficio direto da correta adocao do LR?",
                "options": [
                    "Reduz tempo de check-in",
                    "Menor tempo de carregamento",
                    "Diminui reclamacoes e protege legalmente",
                    "Elimina vistoria"
                ],
                "correct": 2
            },
            {
                "question": "Como evitar danos em mala fragil?",
                "options": [
                    "Arremessar com menos forca",
                    "Posicionar no topo da carga e proximo a porta",
                    "Envolver com plastico bolha no porao",
                    "Colocar entre malas grandes"
                ],
                "correct": 1
            },
            {
                "question": "Ao identificar bagagem contaminada por vazamento, deve-se:",
                "options": [
                    "Deixar junto",
                    "Colocar vertical",
                    "Separar e remover imediatamente",
                    "Lavar antes de carregar"
                ],
                "correct": 2
            },
            {
                "question": "Ao notar mala visivelmente danificada antes do carregamento, deve-se:",
                "options": [
                    "Ignorar",
                    "Adicionar fita",
                    "Reportar e registrar caso nao possua LR",
                    "Esconder o dano"
                ],
                "correct": 2
            },
            {
                "question": "O que previne reclamacoes por danos pre-existentes?",
                "options": [
                    "Ignorar pequenos defeitos",
                    "Registrar e solicitar assinatura do LR",
                    "Envolver todas as malas",
                    "Orientar itens frageis na mao"
                ],
                "correct": 1
            }
        ]
    },
    {
        "id": "ahl",
        "title": "AHL - Bagagem Extraviada",
        "eyebrow": "Laboratorio WorldTracer",
        "duration": "1h 10min",
        "level": "Intermediario",
        "summary": "Registro de bagagem extraviada, dados do passageiro, rota, contato, endereco e caracteristicas da mala.",
        "color": "#219653",
        "modules": [
            {
                "title": "Quando abrir uma AHL",
                "type": "Aula",
                "duration": "10 min",
                "content": "Use AHL quando a bagagem despachada nao for restituida ao passageiro no destino."
            },
            {
                "title": "Campos principais",
                "type": "Pratica guiada",
                "duration": "25 min",
                "content": "TN, CT, BI, BW, FD, RT, NM, contatos, enderecos, RL, FS, AG e descricao."
            },
            {
                "title": "Mascara SITA",
                "type": "Simulacao",
                "duration": "35 min",
                "content": "Pratique a abertura e consulta na mascara WorldTracer/SITA, preservando o padrao operacional."
            }
        ],
        "labs": [
            {
                "label": "Laboratorio AHL Web",
                "href": "ahl.html"
            },
            {
                "label": "Mascara AHL SITA",
                "href": "worldtracer/ahl.html"
            }
        ],
        "quiz": []
    },
    {
        "id": "ohd",
        "title": "OHD - Bagagem Localizada",
        "eyebrow": "Achados e perdidos",
        "duration": "1h 05min",
        "level": "Intermediario",
        "summary": "Criacao de OHD, catalogacao de conteudo, identificacao e envio para a base solicitante.",
        "color": "#f2c94c",
        "modules": [
            {
                "title": "Quando abrir um OHD",
                "type": "Aula",
                "duration": "10 min",
                "content": "Use OHD quando houver sobra de bagagem na base apos o desembarque dos passageiros."
            },
            {
                "title": "Conteudo e identificacao",
                "type": "Pratica guiada",
                "duration": "25 min",
                "content": "Registre TN, CT, BI, BW, CC, AB, BP, EA, SL, RT, FD, AG, FF e observacoes."
            },
            {
                "title": "ROH e FOH",
                "type": "Simulacao",
                "duration": "30 min",
                "content": "Receba solicitacoes de envio e registre o FOH com voo, data, tag e agente responsavel."
            }
        ],
        "labs": [
            {
                "label": "Laboratorio OHD Web",
                "href": "ohd.html"
            },
            {
                "label": "Mascara OHD SITA",
                "href": "worldtracer/ohd.html"
            }
        ],
        "quiz": []
    },
    {
        "id": "matches",
        "title": "Matches AHL x OHD",
        "eyebrow": "Busca inteligente",
        "duration": "35 min",
        "level": "Avancado",
        "summary": "Comparacao entre processos, percentuais de compatibilidade e acao operacional a partir do match.",
        "color": "#9b51e0",
        "modules": [
            {
                "title": "Como o sistema compara",
                "type": "Aula",
                "duration": "10 min",
                "content": "A comparacao considera tag, nome, telefone, e-mail, endereco, rota, voo, marca, peso, descricao e conteudo."
            },
            {
                "title": "Interpretando percentuais",
                "type": "Exercicio",
                "duration": "10 min",
                "content": "Matches a partir de 50% devem ser analisados. A tag tem maior peso por ser a evidencia mais forte."
            },
            {
                "title": "Solicitar e enviar bagagem",
                "type": "Simulacao",
                "duration": "15 min",
                "content": "A AHL solicita por ROH. O OHD responde com FOH e encerra o OHD quando a bagagem e enviada."
            }
        ],
        "labs": [
            {
                "label": "Ver AHL",
                "href": "ahl.html"
            },
            {
                "label": "Ver OHD",
                "href": "ohd.html"
            }
        ],
        "quiz": []
    },
    {
        "id": "dpr",
        "title": "DPR - Dano e Violacao",
        "eyebrow": "Relatorio operacional",
        "duration": "50 min",
        "level": "Intermediario",
        "summary": "Registro de dano, violacao, elemento, localizacao, extensao e dados completos do passageiro.",
        "color": "#eb5757",
        "modules": [
            {
                "title": "Quando abrir DPR",
                "type": "Aula",
                "duration": "12 min",
                "content": "Use DPR para dano relevante ou violacao de bagagem, avaliando o tipo de dano e evidencias."
            },
            {
                "title": "Codigos de dano",
                "type": "Consulta",
                "duration": "18 min",
                "content": "Elemento: TOP, SIDE, END, BOTT. Localizacao: alca, fechadura, buraco, rasgo, rodas, ziper, conteudo e outros. Extensao: MI, MA, TL."
            },
            {
                "title": "Mascara DPR",
                "type": "Simulacao",
                "duration": "20 min",
                "content": "Preencha dados do passageiro, bagagem e dano na interface web ou na mascara SITA."
            }
        ],
        "labs": [
            {
                "label": "Laboratorio DPR Web",
                "href": "dpr.html"
            },
            {
                "label": "Mascara DPR SITA",
                "href": "worldtracer/dpr.html"
            }
        ],
        "quiz": []
    },
    {
        "id": "worldtracer-completo",
        "title": "WorldTracer Completo",
        "eyebrow": "Sistema operacional",
        "duration": "3h 20min",
        "level": "Avancado",
        "summary": "Navegacao, transacoes, relatorios AHL/OHD/DPR/RFP, Action File, mensagens, fechamento, reabertura e estatisticas.",
        "color": "#2563eb",
        "modules": [
            {
                "title": "Mapa de transacoes",
                "type": "Aula",
                "duration": "25 min",
                "content": "Help, Create, Close File, BDO, DPR, AHL, OHD, QOH, RFP, FWD, FOH, ROH, FLZ, CXF, SUS, RCB e Update File formam a base operacional do WorldTracer."
            },
            {
                "title": "Campos e traducoes",
                "type": "Consulta",
                "duration": "25 min",
                "content": "Bag Tag Number, Brand Information, Color, Type, Passenger Routing, Reason for Loss, Fault Station, Extra Information e Delivery Order devem ser compreendidos para evitar registros incompletos."
            },
            {
                "title": "AHL, conteudo e matches",
                "type": "Pratica guiada",
                "duration": "35 min",
                "content": "AHL exige dados mandatarios de passageiro, bagagem e voo. O conteudo deve ser registrado em ingles, com ate 12 categorias por bagagem."
            },
            {
                "title": "DPR, OHD e QOH",
                "type": "Simulacao",
                "duration": "40 min",
                "content": "DPR registra dano ou violacao; OHD registra bagagem sobrante; QOH e temporario, ativo por 24 horas e deve ser convertido em OHD assim que possivel."
            },
            {
                "title": "Action File e relatorios",
                "type": "Consulta",
                "duration": "30 min",
                "content": "Station Inbox/CXF reune FWD, ROH, FOH, FAH, matches e prompts. Reports & Statistics apoia gestao de performance, custos, voos e falhas."
            }
        ],
        "labs": [
            {
                "label": "AHL Web",
                "href": "ahl.html"
            },
            {
                "label": "OHD Web",
                "href": "ohd.html"
            },
            {
                "label": "DPR Web",
                "href": "dpr.html"
            }
        ],
        "quiz": [
            {
                "question": "O que significa AHL no WorldTracer?",
                "options": [
                    "Relatorio de bagagem danificada",
                    "Registro de bagagem encontrada",
                    "Relatorio de bagagem extraviada",
                    "Relatorio de bagagem violada"
                ],
                "correct": 2
            },
            {
                "question": "Qual campo e obrigatorio para criar AHL?",
                "options": [
                    "PNR Number",
                    "Brand Information",
                    "Family Name",
                    "Title"
                ],
                "correct": 2
            },
            {
                "question": "Em que aba se insere o conteudo da bagagem no AHL?",
                "options": [
                    "Flight",
                    "Claim",
                    "Passenger",
                    "Bag"
                ],
                "correct": 3
            },
            {
                "question": "Transacao para registrar ate 10 etiquetas rapidamente:",
                "options": [
                    "OHD",
                    "DPR",
                    "QOH",
                    "ROH"
                ],
                "correct": 2
            },
            {
                "question": "Qual relatorio e criado para bagagem localizada sem identificacao?",
                "options": [
                    "AHL",
                    "QOH",
                    "RFP",
                    "OHD"
                ],
                "correct": 3
            },
            {
                "question": "BDO serve para:",
                "options": [
                    "Criar AHL",
                    "Criar ordem de entrega",
                    "Visualizar DPR",
                    "Suspender relatorio"
                ],
                "correct": 1
            },
            {
                "question": "DPR representa:",
                "options": [
                    "Danificacao e extravio",
                    "Bagagem perdida",
                    "Danificacao e/ou violacao",
                    "Pedido de indenizacao"
                ],
                "correct": 2
            },
            {
                "question": "Limite de bagagens em um AHL:",
                "options": [
                    "1",
                    "5",
                    "10",
                    "Nao ha limite"
                ],
                "correct": 2
            },
            {
                "question": "Quando RL 90 a 99 e usado, qual campo fica obrigatorio?",
                "options": [
                    "Damaged Contents",
                    "Pilfered Contents",
                    "Routing",
                    "Delivery Station"
                ],
                "correct": 1
            },
            {
                "question": "O que evitar no conteudo do OHD?",
                "options": [
                    "Ingles",
                    "Tags identicas",
                    "Termos genericos como CLOTHES, SEVERAL",
                    "Estado da bagagem"
                ],
                "correct": 2
            },
            {
                "question": "Funcao para reabrir relatorio fechado:",
                "options": [
                    "RIT",
                    "AAH",
                    "RCB",
                    "SUS"
                ],
                "correct": 2
            },
            {
                "question": "FLZ significa:",
                "options": [
                    "Reembolso",
                    "Envio para origem",
                    "Envio para central de bagagens",
                    "Registro de nao embarcada"
                ],
                "correct": 2
            },
            {
                "question": "Transacao para solicitar OHD de outra base:",
                "options": [
                    "FAH",
                    "FOH",
                    "ROH",
                    "DOF"
                ],
                "correct": 2
            },
            {
                "question": "SUS serve para:",
                "options": [
                    "Adicionar bagagem",
                    "Cancelar definitivamente",
                    "Pausar temporariamente a busca",
                    "Deletar bagagem"
                ],
                "correct": 2
            },
            {
                "question": "Relatorio para objeto localizado a bordo:",
                "options": [
                    "FAH",
                    "RFP",
                    "DPR",
                    "OHD"
                ],
                "correct": 1
            }
        ]
    },
    {
        "id": "atendimento-cliente-aviacao",
        "title": "Fundamentos do Atendimento ao Cliente na Aviacao",
        "eyebrow": "Experiencia do passageiro",
        "duration": "2h",
        "level": "Basico",
        "summary": "Atendimento, suporte, acolhimento, perfis de clientes, empatia, acessibilidade, multicanalidade e situacoes criticas.",
        "color": "#14b8a6",
        "modules": [
            {
                "title": "Conceito e jornada",
                "type": "Aula",
                "duration": "18 min",
                "content": "Atendimento ao cliente envolve check-in, embarque, desembarque, bagagem e contatos apos o voo. A experiencia e diferencial competitivo."
            },
            {
                "title": "Perfis de passageiros",
                "type": "Aula",
                "duration": "22 min",
                "content": "Passageiros frequentes, ocasionais, corporativos, familias, idosos, gestantes, estrangeiros e pessoas em crise exigem abordagens adaptadas."
            },
            {
                "title": "Atendimento humanizado",
                "type": "Pratica",
                "duration": "22 min",
                "content": "Empatia, escuta ativa, linguagem acolhedora e personalizacao transformam problemas operacionais em experiencias mais seguras."
            },
            {
                "title": "Acessibilidade e PNAE",
                "type": "Consulta",
                "duration": "22 min",
                "content": "Atender pessoas com deficiencia exige respeito, autonomia, linguagem simples, recursos de apoio e comunicacao direta."
            },
            {
                "title": "Conflitos e situacoes especiais",
                "type": "Simulacao",
                "duration": "26 min",
                "content": "Atrasos, cancelamentos, overbooking, emergencias medicas e bagagens extraviadas devem ser conduzidos com calma e clareza."
            }
        ],
        "labs": [
            {
                "label": "Biblioteca Operacional",
                "href": "operational-library.html"
            }
        ],
        "quiz": [
            {
                "question": "Principal objetivo do atendimento ao cliente na aviacao:",
                "options": [
                    "Marketing",
                    "Reduzir custos",
                    "Garantir experiencia satisfatoria durante toda a jornada",
                    "Aumentar bagagens"
                ],
                "correct": 2
            },
            {
                "question": "Comunicacao positiva e:",
                "options": [
                    "Resposta automatica",
                    "Linguagem tecnica",
                    "Foco em solucoes e cordialidade",
                    "Tom autoritario"
                ],
                "correct": 2
            },
            {
                "question": "Diferenca entre atendimento e suporte:",
                "options": [
                    "Atendimento amplo; suporte pontual e tecnico",
                    "Atendimento so no embarque",
                    "Suporte so por supervisores",
                    "Atendimento so VIP"
                ],
                "correct": 0
            },
            {
                "question": "Empatia e importante porque:",
                "options": [
                    "Parece sofisticado",
                    "Permite compreender e acolher melhor",
                    "Reduz tempo",
                    "Elimina escuta"
                ],
                "correct": 1
            },
            {
                "question": "Escuta ativa significa:",
                "options": [
                    "Ouvir com atencao sem interromper",
                    "Ouvir preenchendo formulario",
                    "Interromper para responder",
                    "Focar apenas na passagem"
                ],
                "correct": 0
            },
            {
                "question": "Gestantes:",
                "options": [
                    "Tem prioridade e atencao especial",
                    "Nao tem suporte",
                    "So com laudo",
                    "Devem viajar sozinhas"
                ],
                "correct": 0
            },
            {
                "question": "Passageiro em crise exige:",
                "options": [
                    "Escuta ativa e empatia",
                    "Pressa",
                    "Ignorar",
                    "Exigir calma"
                ],
                "correct": 0
            },
            {
                "question": "Mobilidade reduzida precisa:",
                "options": [
                    "Ser ignorada",
                    "Atendimento preferencial e apoio personalizado",
                    "Aguardar comum",
                    "Ajuda so se pedir"
                ],
                "correct": 1
            },
            {
                "question": "Com precos semelhantes, diferencia:",
                "options": [
                    "Frota",
                    "Cardapio",
                    "Experiencia do cliente",
                    "Portao"
                ],
                "correct": 2
            },
            {
                "question": "Impacto do atendimento:",
                "options": [
                    "Reduz voo",
                    "Fideliza cliente e melhora imagem",
                    "Controla atrasos",
                    "Evita troca de tripulacao"
                ],
                "correct": 1
            }
        ]
    },
    {
        "id": "boas-praticas-atendimento",
        "title": "Boas Praticas no Atendimento ao Cliente",
        "eyebrow": "Excelencia no servico",
        "duration": "1h 50min",
        "level": "Basico",
        "summary": "Postura profissional, comunicacao clara, resolucao de conflitos, atendimento especial, padroes ANAC/IATA e feedback.",
        "color": "#22c55e",
        "modules": [
            {
                "title": "Excelencia na aviacao",
                "type": "Aula",
                "duration": "15 min",
                "content": "Atendimento excelente vai alem da cortesia: envolve postura, empatia, eficiencia e agilidade para conduzir a jornada do passageiro."
            },
            {
                "title": "Perfil do cliente",
                "type": "Aula",
                "duration": "15 min",
                "content": "Familias, idosos, estrangeiros, PcDs, passageiros corporativos e pessoas em situacoes delicadas pedem abordagens especificas."
            },
            {
                "title": "Comunicacao eficaz",
                "type": "Pratica",
                "duration": "18 min",
                "content": "Explicar sem jargoes, acolher e traduzir problemas operacionais reduz ansiedade e evita conflitos."
            },
            {
                "title": "Situacoes especiais",
                "type": "Simulacao",
                "duration": "20 min",
                "content": "Overbooking, cancelamentos, perda de bagagem e passageiros irritados exigem calma, empatia e busca por solucao."
            },
            {
                "title": "Feedback e melhoria",
                "type": "Consulta",
                "duration": "16 min",
                "content": "Elogios reforcam boas praticas; reclamacoes ajudam a corrigir falhas e orientar treinamentos."
            }
        ],
        "labs": [
            {
                "label": "Biblioteca Operacional",
                "href": "operational-library.html"
            }
        ],
        "quiz": [
            {
                "question": "Atendimento de excelencia na aviacao e:",
                "options": [
                    "Falar alto",
                    "Seguir apenas manual",
                    "Postura profissional, empatia, eficiencia e agilidade",
                    "Priorizar executiva"
                ],
                "correct": 2
            },
            {
                "question": "Ao receber passageiro:",
                "options": [
                    "Olhar computador",
                    "Evitar contato",
                    "Sorriso e informacoes claras",
                    "Perguntar se sabe o sistema"
                ],
                "correct": 2
            },
            {
                "question": "Conhecer perfil dos clientes serve para:",
                "options": [
                    "Precos",
                    "Fila",
                    "Adaptar atendimento",
                    "Silencio"
                ],
                "correct": 2
            },
            {
                "question": "Passageiro cadeirante deve receber:",
                "options": [
                    "Ajuda so no embarque",
                    "So se pedir",
                    "Acompanhamento completo e embarque seguro",
                    "Nenhuma atencao"
                ],
                "correct": 2
            },
            {
                "question": "Comunicacao eficaz:",
                "options": [
                    "Termos tecnicos",
                    "Clara e acessivel",
                    "Rapida",
                    "Evitar duvidas"
                ],
                "correct": 1
            },
            {
                "question": "Overbooking deve ser informado com:",
                "options": [
                    "Culpa ao passageiro",
                    "Ignorar",
                    "Acolhimento e solucao",
                    "Nova compra"
                ],
                "correct": 2
            },
            {
                "question": "Passageiro irritado por cancelamento:",
                "options": [
                    "Evitar",
                    "Ignorar",
                    "Manter calma, empatia e solucao",
                    "Transferir"
                ],
                "correct": 2
            },
            {
                "question": "ANAC/IATA devem ser seguidas para:",
                "options": [
                    "Evitar atrasos",
                    "Opcional",
                    "Seguranca juridica e operacional",
                    "Facilitar piloto"
                ],
                "correct": 2
            },
            {
                "question": "Feedback e importante porque:",
                "options": [
                    "Obrigatorio",
                    "Reforca boas praticas e corrige falhas",
                    "Evita reclamacao",
                    "Marketing"
                ],
                "correct": 1
            },
            {
                "question": "Ma pratica:",
                "options": [
                    "Ajudar mae",
                    "Tratar estrangeiro com frieza",
                    "Ajudar cadeirante",
                    "Solucao rapida"
                ],
                "correct": 1
            }
        ]
    },
    {
        "id": "bagagem-violada",
        "title": "Bagagem Violada - DPR Pilferage",
        "eyebrow": "Dano e violacao",
        "duration": "1h 30min",
        "level": "Intermediario",
        "summary": "Criterios de aceitacao, prazos, documentos, RL 91-95, compensacao e tratativa de itens convencionais ou de valor.",
        "color": "#dc2626",
        "modules": [
            {
                "title": "Definicao e prazo",
                "type": "Aula",
                "duration": "16 min",
                "content": "Violacao e falta de conteudo ou indicio de abertura indevida. Prazo normal: 7 dias da chegada. Se decorrente de extravio: 21 dias apos recebimento."
            },
            {
                "title": "Aceitacao e documentos",
                "type": "Procedimento",
                "duration": "20 min",
                "content": "Documento, cartao de embarque, etiqueta/comprovante e lista de itens com nota fiscal quando aplicavel sustentam o registro."
            },
            {
                "title": "Objetos de valor",
                "type": "Consulta",
                "duration": "18 min",
                "content": "Eletronicos e objetos de valor podem gerar registro, mas nao indenizacao conforme criterio. Convencionais seguem proposta conforme autonomia."
            },
            {
                "title": "RL e encerramento",
                "type": "Simulacao",
                "duration": "18 min",
                "content": "Objetos de valor/eletronicos podem ser encerrados com RL93 e carta de recusa. Bagagem gate violada usa RL95."
            }
        ],
        "labs": [
            {
                "label": "DPR Web",
                "href": "dpr.html"
            },
            {
                "label": "Mascara DPR SITA",
                "href": "worldtracer/dpr.html"
            }
        ],
        "quiz": [
            {
                "question": "Prazo para reclamacao de violacao:",
                "options": [
                    "24 horas",
                    "5 dias",
                    "7 dias da chegada",
                    "30 dias"
                ],
                "correct": 2
            },
            {
                "question": "Violacao decorrente de extravio:",
                "options": [
                    "15 dias",
                    "21 dias apos recebimento",
                    "10 dias",
                    "48 horas"
                ],
                "correct": 1
            },
            {
                "question": "RL para objetos de valor/eletronicos:",
                "options": [
                    "RL91",
                    "RL92",
                    "RL93",
                    "RL95"
                ],
                "correct": 2
            },
            {
                "question": "Sem contato apos 30 dias:",
                "options": [
                    "Arquivar",
                    "E-mail automatico",
                    "Registrar tentativas no FF e encerrar com RL93",
                    "Reabrir"
                ],
                "correct": 2
            },
            {
                "question": "Toda tratativa fica em:",
                "options": [
                    "Routing",
                    "Claim",
                    "Extra Information - FF",
                    "Report Station"
                ],
                "correct": 2
            },
            {
                "question": "Se passageiro recusar compensacao:",
                "options": [
                    "Carta",
                    "Reabrir",
                    "Formulario de derivacao",
                    "Nada"
                ],
                "correct": 2
            },
            {
                "question": "Violacao em bagagem gate:",
                "options": [
                    "LIR",
                    "RL93",
                    "Supervisor",
                    "PIR com RL95"
                ],
                "correct": 3
            },
            {
                "question": "Prazo de compensacao Brasil apos aprovacao:",
                "options": [
                    "7 dias uteis",
                    "15 corridos",
                    "30 corridos",
                    "10 dias uteis"
                ],
                "correct": 3
            },
            {
                "question": "Itens que impedem compensacao:",
                "options": [
                    "Roupas",
                    "Cosmeticos",
                    "Joias e medicamentos",
                    "Livros"
                ],
                "correct": 2
            }
        ]
    },
    {
        "id": "bagagem-danificada",
        "title": "Bagagem Danificada - DPR Damage",
        "eyebrow": "Damage report",
        "duration": "2h 10min",
        "level": "Intermediario",
        "summary": "Prazos, criterios de registro, codigos de dano, Fault Station, Limited Release e compensacao por tipo de dano.",
        "color": "#f59e0b",
        "modules": [
            {
                "title": "Definicao e aceite",
                "type": "Aula",
                "duration": "18 min",
                "content": "Dano na bagagem despachada deve ser avaliado no desembarque ou dentro do prazo aplicavel. Se vier de extravio, o prazo e 21 dias apos recebimento."
            },
            {
                "title": "Codigos TD",
                "type": "Consulta",
                "duration": "25 min",
                "content": "TOP, SIDE, END e BOTT indicam local. Codigos 1 a 16 indicam tipo de dano. MI, MA e TL indicam extensao."
            },
            {
                "title": "Fault Station e RL",
                "type": "Procedimento",
                "duration": "20 min",
                "content": "Em voos diretos, FS e origem; em conexao, o ponto anterior a abertura; em surface, o trecho anterior ao deslocamento terrestre."
            },
            {
                "title": "Limited Release",
                "type": "Procedimento",
                "duration": "20 min",
                "content": "Se houver LR assinado para o mesmo dano, o PIR nao deve ser aberto; a negativa deve ficar documentada."
            },
            {
                "title": "Compensacao",
                "type": "Simulacao",
                "duration": "24 min",
                "content": "Dano maior e dano total seguem tabelas de autonomia. A compensacao deve ser emitida somente apos aceite e solucao do caso."
            }
        ],
        "labs": [
            {
                "label": "DPR Web",
                "href": "dpr.html"
            },
            {
                "label": "Mascara DPR SITA",
                "href": "worldtracer/dpr.html"
            }
        ],
        "quiz": [
            {
                "question": "Lacre rompido:",
                "options": [
                    "Objetos perdidos",
                    "Ocorrencia separada",
                    "Foto e mencionar no PIR como violacao",
                    "Trocar lacre"
                ],
                "correct": 2
            },
            {
                "question": "PIR pode ser cancelado por:",
                "options": [
                    "Bagagem intacta",
                    "Desistencia",
                    "Duplicidade",
                    "Todos"
                ],
                "correct": 3
            },
            {
                "question": "Prazo para dano apos extravio:",
                "options": [
                    "7 dias",
                    "10 dias",
                    "21 dias",
                    "30 dias"
                ],
                "correct": 2
            },
            {
                "question": "Limited Release assinada:",
                "options": [
                    "Registrar PIR",
                    "Ignorar",
                    "Negar reclamacao",
                    "Indenizar"
                ],
                "correct": 2
            },
            {
                "question": "Item compensavel:",
                "options": [
                    "Porcelana",
                    "TV acima de 40 polegadas",
                    "Camera fotografica",
                    "Necessaire"
                ],
                "correct": 1
            },
            {
                "question": "Dano por chuva registra quando:",
                "options": [
                    "Sempre",
                    "Conteudo danificado nao eletronico",
                    "Exterior umido",
                    "So internacional"
                ],
                "correct": 1
            },
            {
                "question": "Codigo lateral:",
                "options": [
                    "TOP",
                    "SIDE",
                    "END",
                    "BOTT"
                ],
                "correct": 1
            },
            {
                "question": "Campo tipo/local/extensao:",
                "options": [
                    "BI",
                    "BS",
                    "TD",
                    "LI"
                ],
                "correct": 2
            },
            {
                "question": "Dano total:",
                "options": [
                    "Rasgo 15 cm",
                    "Alca tiracolo",
                    "Fibra rachada acima de 20 cm",
                    "Arranhoes"
                ],
                "correct": 2
            },
            {
                "question": "Amassado e codigo:",
                "options": [
                    "MI",
                    "MA",
                    "TL",
                    "14"
                ],
                "correct": 3
            }
        ]
    },
    {
        "id": "tratativa-rl-mct",
        "title": "Tratativa de Bagagem - RL e MCT",
        "eyebrow": "Analise operacional",
        "duration": "2h 30min",
        "level": "Avancado",
        "summary": "Uso correto de Reason for Loss, tabela MCT operacional, conexoes criticas e classificacao de falhas por area operacional.",
        "color": "#7c3aed",
        "modules": [
            {
                "title": "Conceito de RL",
                "type": "Aula",
                "duration": "18 min",
                "content": "Reason for Loss classifica causa de extravio, atraso ou dano, apoiando investigacao, estatistica e acao corretiva."
            },
            {
                "title": "Grupos de RL",
                "type": "Consulta",
                "duration": "30 min",
                "content": "RL10 check-in origem; RL20 carregamento origem; RL30 carregamento/descarga; RL40 destino; RL50 conexao; RL60 fatores gerais; RL90 violacao/DPR."
            },
            {
                "title": "MCT operacional",
                "type": "Pratica",
                "duration": "24 min",
                "content": "MCT e Minimum Connection Time. RL51 indica tempo inviavel, RL56 conexao critica e RL55 tempo adequado."
            },
            {
                "title": "Areas de transferencia",
                "type": "Simulacao",
                "duration": "24 min",
                "content": "DOMxDOM, DOMxINTER e INTERxINTER possuem fluxos e riscos diferentes. INTERxDOM nao possui MCT porque inicia novo trecho."
            },
            {
                "title": "Casos praticos de RL",
                "type": "Exercicio",
                "duration": "30 min",
                "content": "Etiqueta ilegivel, tag em mala errada, porao errado, area incorreta e deportacao exigem selecao correta do RL."
            }
        ],
        "labs": [
            {
                "label": "AHL Web",
                "href": "ahl.html"
            },
            {
                "label": "DPR Web",
                "href": "dpr.html"
            }
        ],
        "quiz": [
            {
                "question": "MCT significa:",
                "options": [
                    "Margem de Carga",
                    "Modulo de Controle",
                    "Minimum Connection Time",
                    "Metodo de Trafego"
                ],
                "correct": 2
            },
            {
                "question": "Conexao abaixo do minimo:",
                "options": [
                    "RL55",
                    "RL56",
                    "RL51",
                    "RL50"
                ],
                "correct": 2
            },
            {
                "question": "DOM x DOM 32 min:",
                "options": [
                    "RL55",
                    "RL51",
                    "RL56",
                    "RL11"
                ],
                "correct": 1
            },
            {
                "question": "DOM x INTER 45 min:",
                "options": [
                    "RL51",
                    "RL56",
                    "RL55",
                    "RL53"
                ],
                "correct": 1
            },
            {
                "question": "INTER x INTER acima de 60 min:",
                "options": [
                    "RL51",
                    "RL56",
                    "RL55",
                    "RL60"
                ],
                "correct": 2
            },
            {
                "question": "Conexao critica possivel:",
                "options": [
                    "RL51",
                    "RL54",
                    "RL55",
                    "RL56"
                ],
                "correct": 3
            },
            {
                "question": "Conexao sem MCT:",
                "options": [
                    "DOMxDOM",
                    "INTERxINTER",
                    "DOMxINTER",
                    "INTERxDOM"
                ],
                "correct": 3
            },
            {
                "question": "Etiqueta ilegivel no check-in:",
                "options": [
                    "RL12",
                    "RL11",
                    "RL15",
                    "RL21"
                ],
                "correct": 1
            },
            {
                "question": "Etiqueta so ate conexao:",
                "options": [
                    "RL12",
                    "RL13",
                    "RL51",
                    "RL25"
                ],
                "correct": 0
            },
            {
                "question": "Etiqueta em mala errada:",
                "options": [
                    "RL21",
                    "RL17",
                    "RL15",
                    "RL32"
                ],
                "correct": 2
            },
            {
                "question": "Porao/container errado:",
                "options": [
                    "RL33",
                    "RL35",
                    "RL31",
                    "RL32"
                ],
                "correct": 1
            },
            {
                "question": "Area incorreta:",
                "options": [
                    "RL41",
                    "RL44",
                    "RL45",
                    "RL42"
                ],
                "correct": 0
            },
            {
                "question": "Retida por imigracao/deportacao:",
                "options": [
                    "RL63",
                    "RL64",
                    "RL65",
                    "RL67"
                ],
                "correct": 3
            }
        ]
    },
    {
        "id": "bagagem-sem-etiqueta-ohd",
        "title": "Bagagem Sem Etiqueta e Sobrante - OHD",
        "eyebrow": "On-Hand Bag",
        "duration": "1h 35min",
        "level": "Intermediario",
        "summary": "Registro de QOH/OHD, conteudo em ingles, busca ate o 5o dia, envio por ROH/FOH/FLZ, recebimento e encerramento.",
        "color": "#ca8a04",
        "modules": [
            {
                "title": "Definicao de OHD",
                "type": "Aula",
                "duration": "14 min",
                "content": "OHD e usado para bagagens nao retiradas na esteira ou localizadas sem etiqueta. Bagagens com destino indicado seguem por FWD."
            },
            {
                "title": "QOH temporario",
                "type": "Procedimento",
                "duration": "16 min",
                "content": "QOH e solucao rapida por etiqueta, ativa por 24 horas, com tag e Further Information."
            },
            {
                "title": "Registro de OHD",
                "type": "Pratica",
                "duration": "22 min",
                "content": "A bagagem deve ser pesada, lacrada e descrita com conteudo detalhado em ingles. Termos genericos nao ajudam nos matches."
            },
            {
                "title": "ROH, FOH e FLZ",
                "type": "Simulacao",
                "duration": "24 min",
                "content": "AHL solicita OHD por ROH. A base envia por FOH. Apos 5 dias sem solicitacao ativa, segue para deposito via FLZ."
            },
            {
                "title": "Recebimento e encerramento",
                "type": "Procedimento",
                "duration": "18 min",
                "content": "Ao receber Rush, conferir peso e lacre. OHD so fecha quando entregue ao passageiro ou enviado a outro aeroporto."
            }
        ],
        "labs": [
            {
                "label": "OHD Web",
                "href": "ohd.html"
            },
            {
                "label": "Mascara OHD SITA",
                "href": "worldtracer/ohd.html"
            }
        ],
        "quiz": [
            {
                "question": "Bagagem sobrante OHD e:",
                "options": [
                    "Nao embarcada",
                    "Sobrepeso",
                    "Sem etiqueta ou nao retirada da esteira",
                    "Esquecida no check-in"
                ],
                "correct": 2
            },
            {
                "question": "Comando para enviar OHD:",
                "options": [
                    "COH",
                    "ROH",
                    "FOH",
                    "FLZ"
                ],
                "correct": 2
            },
            {
                "question": "OHD encerra quando:",
                "options": [
                    "Devolvido a cia",
                    "Receita Federal",
                    "Entregue ou enviado a outro aeroporto",
                    "15 dias"
                ],
                "correct": 2
            },
            {
                "question": "OHD recebido em aeroporto incorreto:",
                "options": [
                    "Devolver",
                    "Encaminhar passageiro",
                    "Criar novo OHD",
                    "Cancelar"
                ],
                "correct": 2
            },
            {
                "question": "Campo CC deve conter:",
                "options": [
                    "Apenas clothes",
                    "Generico",
                    "Descricao fiel e detalhada",
                    "Nome e voo"
                ],
                "correct": 2
            },
            {
                "question": "Pereciveis para deposito:",
                "options": [
                    "Refrigerar",
                    "Guardar",
                    "Descartar e registrar no FF",
                    "Enviar como esta"
                ],
                "correct": 2
            },
            {
                "question": "Idioma da descricao OHD:",
                "options": [
                    "Portugues",
                    "Ingles",
                    "Espanhol",
                    "Destino"
                ],
                "correct": 1
            },
            {
                "question": "Apos 5o dia:",
                "options": [
                    "Guardar",
                    "Receita",
                    "Deposito com Rush e FLZ",
                    "Origem"
                ],
                "correct": 2
            },
            {
                "question": "Solicitar OHD de outra base:",
                "options": [
                    "FOH",
                    "COH",
                    "FLZ",
                    "ROH"
                ],
                "correct": 3
            },
            {
                "question": "Antes de deposito verificar:",
                "options": [
                    "Etiqueta azul",
                    "Voo domestico",
                    "ROH ativo",
                    "Papel"
                ],
                "correct": 2
            }
        ]
    },
    {
        "id": "lideranca-bagagem-extraviada",
        "title": "Lideranca em Bagagem Extraviada",
        "eyebrow": "Gestao LL",
        "duration": "2h 30min",
        "level": "Avancado",
        "summary": "Lideranca para Lost and Found: equipe, atendimento sob pressao, priorizacao, seguranca da informacao e melhoria continua.",
        "color": "#0f766e",
        "modules": [
            {
                "title": "Papel do lider LL",
                "type": "Aula",
                "duration": "22 min",
                "content": "O lider equilibra operacao, atendimento e equipe. Orienta, prioriza, divide tarefas e reduz improvisos em momentos de pressao."
            },
            {
                "title": "Comunicacao assertiva",
                "type": "Pratica",
                "duration": "24 min",
                "content": "Reunioes pre-turno, feedback positivo e corretivo, linguagem clara e mediacao entre areas sao essenciais."
            },
            {
                "title": "Gestao de turnos",
                "type": "Simulacao",
                "duration": "24 min",
                "content": "Balcao, rastreio WorldTracer, telefone, entregas e pendencias devem ser distribuidos por experiencia, volume e criticidade."
            },
            {
                "title": "Decisao sob pressao",
                "type": "Exercicio",
                "duration": "22 min",
                "content": "PNAE no balcao, ROH urgente, sistema fora do ar e passageiro agressivo exigem mapa de prioridades."
            },
            {
                "title": "Etica e padronizacao",
                "type": "Consulta",
                "duration": "22 min",
                "content": "Protecao de dados, conferencia de documentos, dupla checagem e criterios justos sustentam confianca e performance."
            },
            {
                "title": "Indicadores e melhoria",
                "type": "Gestao",
                "duration": "20 min",
                "content": "PIRs abertos/fechados, tempo medio de localizacao, entregas no prazo e reclamacoes orientam melhorias."
            }
        ],
        "labs": [
            {
                "label": "AHL Web",
                "href": "ahl.html"
            },
            {
                "label": "OHD Web",
                "href": "ohd.html"
            }
        ],
        "quiz": []
    },
    {
        "id": "atendimento-pcd",
        "title": "Atendimento de Excelencia a Passageiros PcD",
        "eyebrow": "Inclusao e acessibilidade",
        "duration": "1h 35min",
        "level": "Basico",
        "summary": "Atendimento respeitoso, eficiente e acessivel a passageiros com deficiencia ou necessidades especiais.",
        "color": "#0891b2",
        "modules": [
            {
                "title": "Atendimento inclusivo",
                "type": "Aula",
                "duration": "16 min",
                "content": "Reconhece necessidades diferentes, garante acesso igualitario e evita paternalismo, exclusao ou infantilizacao."
            },
            {
                "title": "Base legal",
                "type": "Consulta",
                "duration": "14 min",
                "content": "Lei Brasileira de Inclusao, ANAC 280/2013 e Convencao da ONU orientam direitos e acessibilidade."
            },
            {
                "title": "Tipos de necessidades",
                "type": "Aula",
                "duration": "22 min",
                "content": "Deficiencia visual, auditiva, motora, intelectual, TEA, idosos, gestantes e pessoas com panico exigem abordagem clara e previsivel."
            },
            {
                "title": "Boas praticas",
                "type": "Pratica",
                "duration": "22 min",
                "content": "Fale diretamente com a pessoa, pergunte antes de ajudar, use linguagem simples e evite termos inadequados."
            },
            {
                "title": "Recursos e casos reais",
                "type": "Simulacao",
                "duration": "20 min",
                "content": "Ambulift, cadeira de rodas, balcoes rebaixados, Libras, pictogramas e sinalizacao tatil/visual devem ser oferecidos com respeito."
            }
        ],
        "labs": [
            {
                "label": "Biblioteca Operacional",
                "href": "operational-library.html"
            }
        ],
        "quiz": [
            {
                "question": "Objetivo do atendimento inclusivo:",
                "options": [
                    "Priorizar frequentes",
                    "Atendimento respeitoso, eficiente e acessivel a PcDs",
                    "Reduzir embarque",
                    "Criar regra rigida"
                ],
                "correct": 1
            },
            {
                "question": "Lei 13.146/2015 e ANAC 280 tratam:",
                "options": [
                    "So internacional",
                    "Idosos",
                    "Inclusao e acessibilidade de PcDs",
                    "Seguranca"
                ],
                "correct": 2
            },
            {
                "question": "Cadeirante recusa ajuda:",
                "options": [
                    "Carregar",
                    "Ignorar",
                    "Respeitar e permanecer disponivel",
                    "Chamar supervisor"
                ],
                "correct": 2
            },
            {
                "question": "Surdos:",
                "options": [
                    "Falar alto",
                    "Libras, escrita ou mimica, falando de frente",
                    "Falar com acompanhante",
                    "Perguntas invasivas"
                ],
                "correct": 1
            },
            {
                "question": "Frase correta:",
                "options": [
                    "Voce nao consegue",
                    "Coitadinho",
                    "Prefere seguir sozinho ou com ajuda?",
                    "Falar com acompanhante"
                ],
                "correct": 2
            },
            {
                "question": "Ambulift serve para:",
                "options": [
                    "Comunicacao",
                    "Embarque/desembarque de cadeirantes",
                    "Balcao",
                    "Bagagem"
                ],
                "correct": 1
            },
            {
                "question": "Falha com passageiro TEA:",
                "options": [
                    "Oferecer ajuda",
                    "Repreender por emitir sons",
                    "Nao oferecer cadeira",
                    "Falar com acompanhante"
                ],
                "correct": 1
            },
            {
                "question": "Deve ser evitado:",
                "options": [
                    "Paciencia",
                    "Autonomia",
                    "Linguagem clara",
                    "Pressionar ou ridicularizar"
                ],
                "correct": 3
            },
            {
                "question": "Checklist correto:",
                "options": [
                    "Pressupor ajuda",
                    "Falar com acompanhante",
                    "Perguntar antes de ajudar",
                    "Evitar recursos"
                ],
                "correct": 2
            },
            {
                "question": "Excelencia depende de:",
                "options": [
                    "Velocidade",
                    "Rigor formal",
                    "Respeito, empatia e preparo",
                    "Tratamento igual sem necessidades"
                ],
                "correct": 2
            }
        ]
    },
    {
        "id": "interpretacao-etiqueta-bagagem",
        "title": "Interpretacao de Etiqueta de Bagagem",
        "eyebrow": "Rastreabilidade operacional",
        "duration": "1h 45min",
        "level": "Basico",
        "summary": "Leitura de etiqueta de bagagem, LPN, codigo de barras, codigos IATA, rota de baixo para cima, conexoes e situacoes especiais.",
        "color": "#0f766e",
        "modules": [
            {
                "title": "Funcao da etiqueta",
                "type": "Aula",
                "duration": "12 min",
                "content": "A etiqueta de bagagem e o principal documento operacional da mala. Ela identifica, rastreia e direciona a bagagem dentro da cadeia aeroportuaria."
            },
            {
                "title": "Estrutura da etiqueta",
                "type": "Consulta",
                "duration": "16 min",
                "content": "Codigo de barras, LPN, companhia emissora, aeroportos IATA, destino final, conexoes, voo e comprovante do passageiro formam a leitura basica."
            },
            {
                "title": "LPN e rastreabilidade",
                "type": "Aula",
                "duration": "14 min",
                "content": "O License Plate Number e o numero unico da bagagem. Ele deve ser conferido em registros de irregularidade, busca, devolucao e rastreamento."
            },
            {
                "title": "Codigos IATA de aeroporto",
                "type": "Consulta",
                "duration": "14 min",
                "content": "Codigos IATA possuem tres letras e identificam aeroportos ou cidades. Exemplos: GRU, GIG, REC, CWB, MIA, JFK, CDG."
            },
            {
                "title": "Leitura correta da rota",
                "type": "Pratica guiada",
                "duration": "18 min",
                "content": "A rota impressa na etiqueta deve ser lida de baixo para cima: origem na parte inferior, conexao no meio e destino final no topo."
            },
            {
                "title": "Bagagem prioritaria, rush e reetiquetada",
                "type": "Procedimento",
                "duration": "16 min",
                "content": "Etiquetas especiais exigem atencao redobrada, principalmente em bagagem prioritaria, rush, reetiquetada ou irregular."
            },
            {
                "title": "Fluxo operacional da bagagem",
                "type": "Simulacao",
                "duration": "16 min",
                "content": "O fluxo inclui check-in, emissao da etiqueta, triagem, leitura automatizada, carregamento, transferencia em conexoes e restituicao."
            },
            {
                "title": "Boas praticas e erros comuns",
                "type": "Exercicio",
                "duration": "19 min",
                "content": "Conferir destino final, rota, LPN e conexoes reduz erro de despacho, extravio, envio incorreto e falha na comunicacao ao passageiro."
            }
        ],
        "labs": [
            {
                "label": "Simular Check-In",
                "href": "checkin.html"
            },
            {
                "label": "AHL para irregularidade",
                "href": "ahl.html"
            },
            {
                "label": "OHD para bagagem sobrante",
                "href": "ohd.html"
            }
        ],
        "quiz": [
            {
                "question": "Qual e a funcao principal da etiqueta de bagagem?",
                "options": [
                    "Apenas comprovar pagamento",
                    "Identificar, rastrear e direcionar a bagagem",
                    "Substituir o documento do passageiro",
                    "Informar somente o peso da mala"
                ],
                "correct": 1
            },
            {
                "question": "O que significa LPN na etiqueta de bagagem?",
                "options": [
                    "Local Passenger Name",
                    "License Plate Number",
                    "Loading Priority Number",
                    "Lost Property Notice"
                ],
                "correct": 1
            },
            {
                "question": "Por que o LPN e importante?",
                "options": [
                    "Define o preco da passagem",
                    "Identifica unicamente a bagagem no rastreamento",
                    "Mostra apenas o destino final",
                    "Indica o assento do passageiro"
                ],
                "correct": 1
            },
            {
                "question": "Os codigos IATA de aeroporto normalmente possuem:",
                "options": [
                    "Duas letras",
                    "Tres letras",
                    "Quatro numeros",
                    "Uma letra e dois numeros"
                ],
                "correct": 1
            },
            {
                "question": "Como a rota da etiqueta deve ser lida?",
                "options": [
                    "De cima para baixo",
                    "Da esquerda para direita",
                    "De baixo para cima",
                    "Somente pelo codigo de barras"
                ],
                "correct": 2
            },
            {
                "question": "Na leitura da etiqueta, a parte inferior normalmente representa:",
                "options": [
                    "Destino final",
                    "Origem",
                    "Peso",
                    "Nome do passageiro"
                ],
                "correct": 1
            },
            {
                "question": "A parte superior da sequencia de aeroportos normalmente indica:",
                "options": [
                    "Origem",
                    "Conexao anterior",
                    "Destino final",
                    "Balanca utilizada"
                ],
                "correct": 2
            },
            {
                "question": "Bagagem rush indica, em geral:",
                "options": [
                    "Bagagem enviada depois do voo original",
                    "Bagagem de cortesia",
                    "Bagagem de cabine",
                    "Bagagem sem necessidade de rastreio"
                ],
                "correct": 0
            },
            {
                "question": "Qual campo deve ser usado como referencia principal em irregularidade?",
                "options": [
                    "Cor da mala",
                    "LPN/TN da etiqueta",
                    "Nome do atendente",
                    "Portao de embarque"
                ],
                "correct": 1
            },
            {
                "question": "Uma boa pratica antes do despacho e:",
                "options": [
                    "Conferir destino final, rota e conexoes",
                    "Ler apenas a primeira linha",
                    "Ignorar conexoes",
                    "Usar somente a cor da bagagem"
                ],
                "correct": 0
            },
            {
                "question": "Se a etiqueta estiver ilegivel ou danificada, o agente deve:",
                "options": [
                    "Despachar assim mesmo sem conferencia",
                    "Reimprimir ou corrigir conforme procedimento local",
                    "Retirar a bagagem do passageiro sem registro",
                    "Alterar o destino manualmente sem validar"
                ],
                "correct": 1
            },
            {
                "question": "A leitura errada da rota pode causar:",
                "options": [
                    "Aumento de milhas",
                    "Erro de despacho ou extravio",
                    "Melhor rastreio",
                    "Cancelamento automatico do voo"
                ],
                "correct": 1
            }
        ]
    },
    {
        "id": "gestao-pessoas-rampa",
        "title": "Gestao de Pessoas e Comportamento Assertivo na Rampa",
        "eyebrow": "Lideranca operacional",
        "duration": "1h 40min",
        "level": "Intermediario",
        "summary": "Lideranca presente, comunicacao assertiva, mudanca de cultura, desenvolvimento continuo e gestao de conflitos na operacao de rampa.",
        "color": "#0f766e",
        "modules": [
            {
                "title": "Fundamentos da gestao na rampa",
                "type": "Aula",
                "duration": "20 min",
                "content": "Papel do lider como facilitador, exemplo e ponto de equilibrio entre pontualidade, seguranca, produtividade e clima da equipe."
            },
            {
                "title": "Comunicacao assertiva no patio",
                "type": "Pratica guiada",
                "duration": "18 min",
                "content": "Comunicacao clara, curta e respeitosa sob pressao, uso correto do radio, confirmacao de entendimento e feedback imediato."
            },
            {
                "title": "Mudanca de cultura e osmose operacional",
                "type": "Aula",
                "duration": "20 min",
                "content": "Como evitar que novos colaboradores copiem praticas erradas, criando mentoria positiva, padroes visiveis e correcao imediata."
            },
            {
                "title": "Desenvolvimento continuo na operacao",
                "type": "Consulta",
                "duration": "20 min",
                "content": "Aprendizado diario, microtreinamentos, metas trimestrais, indicadores tecnicos e comportamentais para evolucao da equipe."
            },
            {
                "title": "Conflitos e seguranca psicologica",
                "type": "Simulacao",
                "duration": "22 min",
                "content": "Mediacao de conflitos, canal seguro para reporte de riscos, escuta ativa e tecnica ouvir-entender-agir."
            }
        ],
        "labs": [
            {
                "label": "Biblioteca Operacional",
                "href": "operational-library.html"
            }
        ],
        "quiz": [
            {
                "question": "Qual e o papel central do lider na rampa?",
                "options": [
                    "Controlar tudo sozinho sem delegar",
                    "Ser facilitador, exemplo e organizador da operacao",
                    "Ficar apenas no escritorio acompanhando mensagens",
                    "Priorizar somente a pontualidade, mesmo com risco"
                ],
                "correct": 1
            },
            {
                "question": "Uma boa pratica de lideranca antes do inicio da operacao e:",
                "options": [
                    "Fazer briefing curto, claro e objetivo",
                    "Esperar a equipe perguntar o que fazer",
                    "Distribuir tarefas sempre para as mesmas pessoas",
                    "Corrigir erros apenas no fim do mes"
                ],
                "correct": 0
            },
            {
                "question": "Na comunicacao por radio, a regra dos 3 Cs representa:",
                "options": [
                    "Controle, cobranca e comando",
                    "Clareza, concisao e confirmacao",
                    "Calma, carisma e competencia",
                    "Carga, cabine e conexao"
                ],
                "correct": 1
            },
            {
                "question": "Qual mensagem e mais assertiva no patio?",
                "options": [
                    "Vai la ver o negocio no aviao",
                    "Equipe 23, loader avariado. Mover para posicao 114 em 2 minutos",
                    "Todo mundo esta fazendo errado",
                    "Resolva isso logo"
                ],
                "correct": 1
            },
            {
                "question": "O que significa osmose operacional no contexto do curso?",
                "options": [
                    "Aprender apenas observando bons manuais",
                    "Copiar praticas erradas por convivencia e repeticao",
                    "Troca automatica de funcao na escala",
                    "Sistema de medicao de carga"
                ],
                "correct": 1
            },
            {
                "question": "Como reduzir a osmose operacional negativa?",
                "options": [
                    "Ignorar pequenos desvios",
                    "Criar mentoria positiva e corrigir desvios imediatamente",
                    "Permitir atalhos quando o voo esta atrasado",
                    "Evitar reunioes de padronizacao"
                ],
                "correct": 1
            },
            {
                "question": "Desenvolvimento continuo na rampa inclui:",
                "options": [
                    "Recusar reciclagens por experiencia anterior",
                    "Microtreinamentos, metas e acompanhamento de indicadores",
                    "Treinar somente novos colaboradores",
                    "Usar apenas conhecimento informal"
                ],
                "correct": 1
            },
            {
                "question": "Seguranca psicologica significa que a equipe pode:",
                "options": [
                    "Falar riscos e falhas sem medo de punicao injusta",
                    "Ignorar procedimentos quando discordar",
                    "Evitar comunicar incidentes",
                    "Transferir responsabilidades para outro turno"
                ],
                "correct": 0
            },
            {
                "question": "A tecnica ouvir-entender-agir ajuda principalmente em:",
                "options": [
                    "Conflitos e reportes de risco",
                    "Calculo de peso de bagagem",
                    "Emissao de etiqueta",
                    "Controle de combustivel"
                ],
                "correct": 0
            },
            {
                "question": "Um exemplo de ma lideranca operacional e:",
                "options": [
                    "Reconhecer uma acao preventiva",
                    "Acompanhar a operacao por presenca",
                    "Ignorar sugestoes da equipe e permanecer distante",
                    "Distribuir tarefas de forma equilibrada"
                ],
                "correct": 2
            }
        ]
    },
    {
        "id": "restituicao-bagagem-sla",
        "title": "Restituição de Bagagem - SLA e Fluxo Operacional",
        "eyebrow": "Operação de chegada",
        "duration": "1h 50min",
        "level": "Intermediário",
        "summary": "Controle de restituição de bagagem, tempos de percurso, risco por posição, SLA de esteira, análise por turno e plano de ação.",
        "color": "#0f766e",
        "modules": [
            {
                "title": "Objetivo da restituição",
                "type": "Aula",
                "duration": "14 min",
                "content": "A restituição de bagagem é o fluxo que leva os volumes descarregados da aeronave até a esteira de entrega ao passageiro. O objetivo é cumprir o SLA definido, reduzir espera, evitar acúmulo de volumes e manter comunicação operacional clara."
            },
            {
                "title": "Distância, percurso e risco",
                "type": "Procedimento",
                "duration": "16 min",
                "content": "A distância entre a posição da aeronave, o pátio, o BHS e a área de restituição influencia diretamente o tempo de entrega. Posições próximas têm baixo risco; posições afastadas exigem mais planejamento, equipamentos e acompanhamento."
            },
            {
                "title": "Classificação operacional",
                "type": "Consulta",
                "duration": "16 min",
                "content": "O risco pode ser classificado como baixo, moderado, crescente, alto ou crítico. A classificação considera distância, tempo médio de deslocamento, congestionamento interno, pico operacional, tipo de voo e disponibilidade de equipe."
            },
            {
                "title": "Composição do SLA",
                "type": "Prática guiada",
                "duration": "18 min",
                "content": "O SLA de restituição deve ser analisado pela soma de descarga, transporte, entrada no BHS e disponibilização na esteira. Quando a soma se aproxima do limite, qualquer atraso pequeno pode gerar não conformidade."
            },
            {
                "title": "Monitoramento por turno",
                "type": "Análise",
                "duration": "18 min",
                "content": "A análise por turno identifica onde estão as maiores violações de SLA. Turnos com alto volume, voos internacionais, congestionamento de esteiras ou longas janelas sem restituição exigem prioridade de gestão."
            },
            {
                "title": "Pareto e priorização",
                "type": "Gestão",
                "duration": "16 min",
                "content": "A leitura de Pareto ajuda a priorizar ações. Se dois turnos concentram a maior parte das violações, atuar primeiro nesses turnos pode reduzir rapidamente o impacto total."
            },
            {
                "title": "Plano de ação operacional",
                "type": "Simulação",
                "duration": "17 min",
                "content": "O plano de ação deve prever equipe, tratores, carretas, prioridade para voos críticos, comunicação pré-chegada, início imediato do transporte e supervisão dedicada quando o risco for alto."
            },
            {
                "title": "Governança e registros",
                "type": "Procedimento",
                "duration": "15 min",
                "content": "Todo atraso relevante deve ser registrado com horário, causa, turno, voo, posição, início da descarga, chegada ao BHS e início da restituição. O histórico permite corrigir processo, dimensionamento e comunicação."
            }
        ],
        "labs": [
            {
                "label": "Biblioteca Operacional",
                "href": "operational-library.html"
            },
            {
                "label": "Dashboard do Simulador",
                "href": "../index.html"
            }
        ],
        "quiz": [
            {
                "question": "Qual é o principal objetivo da restituição de bagagem?",
                "options": [
                    "Guardar bagagens não retiradas por tempo indeterminado",
                    "Levar as bagagens descarregadas até a esteira dentro do SLA definido",
                    "Substituir o processo de triagem do aeroporto",
                    "Evitar o uso de registros operacionais"
                ],
                "correct": 1
            },
            {
                "question": "Qual fator aumenta diretamente o risco de descumprimento do SLA?",
                "options": [
                    "Posição da aeronave muito próxima ao BHS",
                    "Baixo volume de voos no turno",
                    "Grande distância entre aeronave, BHS e esteira",
                    "Equipe pronta antes da chegada"
                ],
                "correct": 2
            },
            {
                "question": "Em uma operação com posição distante, qual ação é recomendada?",
                "options": [
                    "Aguardar o fim da descarga para planejar o transporte",
                    "Reduzir equipamentos para liberar espaço",
                    "Iniciar o transporte rapidamente e acompanhar o fluxo",
                    "Priorizar apenas voos com menor quantidade de bagagens"
                ],
                "correct": 2
            },
            {
                "question": "O SLA de restituição deve considerar:",
                "options": [
                    "Somente o horário de pouso",
                    "Somente o horário de abertura da porta da aeronave",
                    "Descarga, percurso, entrada no BHS e início da entrega na esteira",
                    "Apenas o número de passageiros no voo"
                ],
                "correct": 2
            },
            {
                "question": "Quando a soma descarga + percurso + BHS chega ao limite do SLA, o que ocorre?",
                "options": [
                    "A operação fica sem risco",
                    "Qualquer pequeno desvio pode gerar não conformidade",
                    "O turno deixa de precisar de supervisão",
                    "A esteira pode ser aberta sem bagagem"
                ],
                "correct": 1
            },
            {
                "question": "A classificação de risco operacional serve para:",
                "options": [
                    "Eliminar a necessidade de medição",
                    "Definir quais voos podem ser ignorados",
                    "Apoiar planejamento, priorização e dimensionamento",
                    "Registrar apenas atrasos de passageiros"
                ],
                "correct": 2
            },
            {
                "question": "Qual cenário representa risco crítico?",
                "options": [
                    "Percurso curto, equipe disponível e baixa demanda",
                    "Percurso muito longo, pico operacional e esteiras saturadas",
                    "Voo doméstico com poucas bagagens e esteira livre",
                    "Transporte iniciado antes do fim da descarga"
                ],
                "correct": 1
            },
            {
                "question": "A análise por turno ajuda a identificar:",
                "options": [
                    "Somente o nome do passageiro",
                    "Onde ocorrem mais violações e qual turno exige ação",
                    "A quantidade de assentos disponíveis no voo",
                    "O valor de indenização por bagagem"
                ],
                "correct": 1
            },
            {
                "question": "Na lógica de Pareto, a gestão deve priorizar:",
                "options": [
                    "Os eventos que concentram maior parte do impacto",
                    "Somente os eventos mais simples",
                    "Apenas turnos com baixo volume",
                    "Casos sem registro operacional"
                ],
                "correct": 0
            },
            {
                "question": "Qual prática melhora a previsibilidade da restituição?",
                "options": [
                    "Planejamento pré-chegada dos voos críticos",
                    "Uso de comunicação informal sem confirmação",
                    "Registro apenas quando há reclamação",
                    "Atrasar a saída das carretas para juntar mais volumes"
                ],
                "correct": 0
            },
            {
                "question": "O que deve ser registrado em uma violação de SLA?",
                "options": [
                    "Apenas o nome do supervisor",
                    "Horários, causa, turno, posição e etapa afetada",
                    "Somente o número total de malas",
                    "Apenas o portão de embarque do passageiro"
                ],
                "correct": 1
            },
            {
                "question": "Em turnos com longas janelas sem restituição, a prioridade deve ser:",
                "options": [
                    "Governança, controle e priorização operacional",
                    "Redução de registros",
                    "Fechar esteiras sem comunicação",
                    "Aguardar demanda do passageiro"
                ],
                "correct": 0
            },
            {
                "question": "Qual item faz parte de um plano de ação para voo crítico?",
                "options": [
                    "Supervisão dedicada e equipamentos dimensionados",
                    "Ausência de briefing",
                    "Nenhuma medição de tempo",
                    "Comunicação somente após reclamações"
                ],
                "correct": 0
            },
            {
                "question": "Por que o histórico operacional é importante?",
                "options": [
                    "Porque substitui a operação em tempo real",
                    "Porque permite identificar causa, reincidência e melhoria de processo",
                    "Porque elimina necessidade de equipe",
                    "Porque serve apenas para arquivamento"
                ],
                "correct": 1
            },
            {
                "question": "Qual é uma boa conclusão gerencial quando poucos turnos concentram a maioria das violações?",
                "options": [
                    "Não existe problema operacional",
                    "A ação deve começar pelos turnos de maior impacto",
                    "Todos os turnos devem receber exatamente a mesma ação",
                    "O SLA deve deixar de ser acompanhado"
                ],
                "correct": 1
            }
        ]
    },
    {
        "id": "siga-gestao-aeroportuaria",
        "title": "Sistema Integrado de Gestão Aeroportuária - SIGA",
        "eyebrow": "Gestão operacional",
        "duration": "1h 20min",
        "level": "Básico",
        "summary": "Uso de plataforma integrada para acompanhamento de voos, atualizações operacionais, alertas, incidentes e colaboração em tempo real.",
        "color": "#2563eb",
        "modules": [
            {
                "title": "Conceito e finalidade",
                "type": "Aula",
                "duration": "12 min",
                "content": "Um sistema integrado de gestão aeroportuária centraliza informações operacionais em tempo real para apoiar equipes de aeroporto, rampa, atendimento, coordenação e gestão."
            },
            {
                "title": "Acesso seguro",
                "type": "Procedimento",
                "duration": "10 min",
                "content": "O acesso deve ocorrer por canal autorizado, com usuário individual, senha forte e, quando disponível, autenticação em dois fatores. Credenciais não devem ser compartilhadas."
            },
            {
                "title": "Dashboard operacional",
                "type": "Aula",
                "duration": "12 min",
                "content": "O dashboard apresenta data, hora local e UTC, boas-vindas ao usuário, menu de navegação, publicações recentes, atualizações e avisos críticos."
            },
            {
                "title": "Controle de voos",
                "type": "Prática guiada",
                "duration": "14 min",
                "content": "O controle de voos permite buscar voos por número e data, acompanhar chegada, partida, embarque, atraso, mudança de portão e impactos nos serviços de solo."
            },
            {
                "title": "Atualizações operacionais",
                "type": "Consulta",
                "duration": "12 min",
                "content": "Atualizações de capacidade, mudanças de voo, alterações de gate, retenção de equipe e ajustes de processo devem ser lidos, aplicados e registrados."
            },
            {
                "title": "Avisos, alertas e incidentes",
                "type": "Procedimento",
                "duration": "14 min",
                "content": "Alertas operacionais, avisos gerais, ocorrências com passageiros especiais, leitura de etapas e incidentes devem ser tratados com registro, ação e acompanhamento."
            },
            {
                "title": "Colaboração e feedback",
                "type": "Simulação",
                "duration": "12 min",
                "content": "A colaboração permite reportar erros, comunicar incidências, enviar feedback e manter diferentes áreas alinhadas em uma mesma fonte de informação."
            },
            {
                "title": "Boas práticas de uso",
                "type": "Checklist",
                "duration": "14 min",
                "content": "Boas práticas incluem atualizar dados em tempo real, evitar duplicidade, confirmar informações antes de publicar, registrar cada etapa e comunicar desvios com clareza."
            }
        ],
        "labs": [
            {
                "label": "Dashboard do Simulador",
                "href": "../index.html"
            },
            {
                "label": "Biblioteca Operacional",
                "href": "operational-library.html"
            }
        ],
        "quiz": [
            {
                "question": "Qual é a finalidade principal de um sistema integrado de gestão aeroportuária?",
                "options": [
                    "Substituir todos os procedimentos operacionais",
                    "Centralizar informações operacionais em tempo real",
                    "Servir apenas como mural de notícias",
                    "Controlar somente dados financeiros"
                ],
                "correct": 1
            },
            {
                "question": "Qual prática é recomendada no acesso ao sistema?",
                "options": [
                    "Compartilhar login com a equipe",
                    "Usar senha simples para agilizar",
                    "Utilizar usuário individual e autenticação segura",
                    "Salvar senha em computadores públicos"
                ],
                "correct": 2
            },
            {
                "question": "O dashboard operacional normalmente apresenta:",
                "options": [
                    "Apenas fotos dos colaboradores",
                    "Data, hora, avisos, atualizações e menu de navegação",
                    "Somente dados de vendas",
                    "Informações sem relação com a operação"
                ],
                "correct": 1
            },
            {
                "question": "No controle de voos, é importante acompanhar:",
                "options": [
                    "Somente o número do assento",
                    "Chegada, partida, atraso, embarque e mudança de portão",
                    "Apenas o nome do comandante",
                    "Somente o tipo de aeronave"
                ],
                "correct": 1
            },
            {
                "question": "Uma mudança de gate deve ser:",
                "options": [
                    "Ignorada se o voo ainda não pousou",
                    "Registrada e comunicada às áreas impactadas",
                    "Tratada apenas pelo passageiro",
                    "Publicada sem confirmação"
                ],
                "correct": 1
            },
            {
                "question": "Atualizações operacionais servem para:",
                "options": [
                    "Orientar mudanças de processo, capacidade e fluxo",
                    "Eliminar a necessidade de supervisão",
                    "Substituir o atendimento ao passageiro",
                    "Remover registros anteriores"
                ],
                "correct": 0
            },
            {
                "question": "Ao receber um alerta operacional, o usuário deve:",
                "options": [
                    "Fechar sem ler",
                    "Registrar ação, acompanhar e evitar duplicidades",
                    "Criar novo alerta igual",
                    "Enviar mensagem informal sem registro"
                ],
                "correct": 1
            },
            {
                "question": "O registro de cada etapa é importante porque:",
                "options": [
                    "Aumenta burocracia sem utilidade",
                    "Garante rastreabilidade e continuidade entre equipes",
                    "Dispensa comunicação com outras áreas",
                    "Serve apenas para auditoria anual"
                ],
                "correct": 1
            },
            {
                "question": "Em incidentes operacionais, a colaboração deve ocorrer por:",
                "options": [
                    "Fonte única de informação e feedback estruturado",
                    "Mensagens soltas sem histórico",
                    "Apenas comunicação verbal",
                    "Decisão isolada de uma área"
                ],
                "correct": 0
            },
            {
                "question": "Qual é uma boa prática antes de publicar informação operacional?",
                "options": [
                    "Confirmar a informação",
                    "Publicar primeiro e verificar depois",
                    "Usar abreviações não padronizadas",
                    "Apagar dados anteriores sem critério"
                ],
                "correct": 0
            },
            {
                "question": "O campo de feedback ou incidências deve ser usado para:",
                "options": [
                    "Reportar erros, desvios e oportunidades de melhoria",
                    "Substituir o login individual",
                    "Registrar informações pessoais sem necessidade",
                    "Evitar comunicação com suporte"
                ],
                "correct": 0
            },
            {
                "question": "Qual conduta reduz duplicidade de follow-up?",
                "options": [
                    "Registrar a etapa concluída e verificar histórico antes de nova ação",
                    "Criar várias mensagens iguais",
                    "Usar canais paralelos sem atualização",
                    "Ignorar ações anteriores"
                ],
                "correct": 0
            },
            {
                "question": "O uso de hora local e UTC ajuda principalmente em:",
                "options": [
                    "Padronização de eventos e comunicação entre áreas",
                    "Definição de preço da passagem",
                    "Escolha de assento",
                    "Troca de uniforme"
                ],
                "correct": 0
            },
            {
                "question": "Quando uma informação do sistema parece incorreta, o usuário deve:",
                "options": [
                    "Corrigir sem registrar",
                    "Reportar pelo canal de incidência ou suporte",
                    "Ignorar a informação",
                    "Divulgar em canal informal"
                ],
                "correct": 1
            },
            {
                "question": "Qual é o resultado esperado do uso correto do sistema?",
                "options": [
                    "Mais previsibilidade, menos erros e melhor coordenação",
                    "Menos comunicação entre equipes",
                    "Menos registros operacionais",
                    "Mais decisões sem evidência"
                ],
                "correct": 0
            }
        ]
    },
    {
        "id": "checkin-operacional",
        "title": "Check-in Operacional Aeroportuário",
        "eyebrow": "Atendimento e aceitação",
        "duration": "1h 10min",
        "level": "Básico",
        "summary": "Procedimentos essenciais de check-in, documentação, aceitação de bagagem, passageiros especiais, encerramento de voo e registros operacionais.",
        "color": "#0f766e",
        "modules": [
            {
                "title": "Função do check-in",
                "type": "Aula",
                "duration": "10 min",
                "content": "O check-in confirma a elegibilidade do passageiro para viajar, valida dados do voo, documentos, serviços, assentos, bagagens e necessidades especiais antes do embarque."
            },
            {
                "title": "Documentos e identificação",
                "type": "Procedimento",
                "duration": "12 min",
                "content": "A identificação deve ser conferida conforme rota, tipo de passageiro, exigência nacional ou internacional, autorização de menor e compatibilidade entre documento, reserva e cartão de embarque."
            },
            {
                "title": "Aceitação de bagagem",
                "type": "Prática guiada",
                "duration": "14 min",
                "content": "A bagagem deve ser aceita com conferência de peso, dimensão, franquia, restrições, itens proibidos, condição física, etiqueta, comprovante e orientações claras ao passageiro."
            },
            {
                "title": "Passageiros especiais e SSR",
                "type": "Aula",
                "duration": "12 min",
                "content": "Passageiros com necessidades especiais, menores desacompanhados, gestantes, idosos, animais, equipamentos de mobilidade e serviços adicionais exigem registro correto e comunicação entre áreas."
            },
            {
                "title": "Fechamento e no-show",
                "type": "Simulação",
                "duration": "10 min",
                "content": "O fechamento do check-in precisa respeitar prazos operacionais, reconciliação de passageiros, status de embarque, bagagens aceitas e comunicação com portão, rampa e coordenação."
            },
            {
                "title": "Conformidade e registros",
                "type": "Checklist",
                "duration": "12 min",
                "content": "Registros corretos protegem passageiro, empresa e operação. Toda exceção deve ser documentada com clareza, evidência, horário, responsável e encaminhamento adequado."
            }
        ],
        "labs": [
            {
                "label": "Simulador Check-In",
                "href": "../pages/checkin.html"
            },
            {
                "label": "Biblioteca Operacional",
                "href": "operational-library.html"
            }
        ],
        "quiz": [
            {
                "question": "Qual é a principal finalidade do check-in operacional?",
                "options": [
                    "Apenas imprimir cartão de embarque",
                    "Confirmar elegibilidade do passageiro, documentos, serviços e bagagens para o voo",
                    "Substituir a inspeção de segurança",
                    "Definir a rota da aeronave"
                ],
                "correct": 1
            },
            {
                "question": "Antes de aceitar o passageiro, o agente deve conferir:",
                "options": [
                    "Apenas o primeiro nome",
                    "Documento, reserva, voo, rota e requisitos aplicáveis",
                    "Somente o número do assento",
                    "Apenas a quantidade de malas"
                ],
                "correct": 1
            },
            {
                "question": "Em voos internacionais, a conferência documental deve considerar:",
                "options": [
                    "Apenas documento com foto nacional",
                    "Passaporte, visto, autorização, validade e regras do destino quando aplicáveis",
                    "Somente cartão de embarque",
                    "Apenas autorização verbal do passageiro"
                ],
                "correct": 1
            },
            {
                "question": "Na aceitação de bagagem despachada, é correto verificar:",
                "options": [
                    "Peso, dimensão, franquia, condição externa, restrições e etiqueta",
                    "Apenas a cor da mala",
                    "Somente o destino final",
                    "Apenas se o passageiro está com pressa"
                ],
                "correct": 0
            },
            {
                "question": "Quando a bagagem apresenta dano pré-existente, o agente deve:",
                "options": [
                    "Ignorar o dano",
                    "Registrar conforme procedimento aplicável e orientar o passageiro",
                    "Trocar a etiqueta por outra companhia",
                    "Despachar sem qualquer observação"
                ],
                "correct": 1
            },
            {
                "question": "Códigos SSR e assistências servem para:",
                "options": [
                    "Registrar necessidades especiais e comunicar áreas envolvidas",
                    "Cancelar automaticamente o passageiro",
                    "Substituir documento de identificação",
                    "Definir preço da passagem"
                ],
                "correct": 0
            },
            {
                "question": "Um passageiro com mobilidade reduzida deve receber:",
                "options": [
                    "Atendimento padronizado, sem perguntar nada",
                    "Apoio adequado, respeito à autonomia e comunicação com as áreas necessárias",
                    "Apenas orientação verbal",
                    "Atendimento somente se estiver acompanhado"
                ],
                "correct": 1
            },
            {
                "question": "O menor desacompanhado exige atenção porque:",
                "options": [
                    "Depende de regra, documentação, responsáveis e acompanhamento operacional",
                    "Pode viajar sem qualquer registro",
                    "Não precisa de conferência documental",
                    "É tratado como passageiro adulto"
                ],
                "correct": 0
            },
            {
                "question": "O fechamento do check-in deve ser alinhado com:",
                "options": [
                    "Portão, rampa, coordenação e status dos passageiros/bagagens",
                    "Apenas o passageiro que chegou primeiro",
                    "Somente o setor comercial",
                    "Nenhuma outra área"
                ],
                "correct": 0
            },
            {
                "question": "Quando o passageiro chega após o prazo operacional de aceitação, o agente deve:",
                "options": [
                    "Prometer embarque mesmo sem confirmação",
                    "Seguir o procedimento, explicar com clareza e buscar alternativas permitidas",
                    "Liberar a bagagem sem passageiro",
                    "Encerrar atendimento sem orientação"
                ],
                "correct": 1
            },
            {
                "question": "Qual conduta protege a rastreabilidade do atendimento?",
                "options": [
                    "Registrar exceções, horários, evidências e encaminhamentos",
                    "Resolver tudo apenas verbalmente",
                    "Usar conta de outro colaborador",
                    "Apagar histórico após o voo"
                ],
                "correct": 0
            },
            {
                "question": "Itens restritos ou perigosos na bagagem devem ser tratados:",
                "options": [
                    "Com orientação e aplicação das regras de segurança e transporte",
                    "Como bagagem comum",
                    "Somente no destino",
                    "Sem comunicação ao passageiro"
                ],
                "correct": 0
            },
            {
                "question": "A etiqueta de bagagem deve refletir:",
                "options": [
                    "Rota/destino correto conforme aceitação e regras do itinerário",
                    "Apenas a origem",
                    "O aeroporto preferido do passageiro",
                    "Um destino genérico"
                ],
                "correct": 0
            },
            {
                "question": "Uma boa comunicação no check-in deve ser:",
                "options": [
                    "Clara, objetiva, respeitosa e orientada à solução",
                    "Técnica e difícil para mostrar autoridade",
                    "Rápida sem confirmação",
                    "Sempre informal"
                ],
                "correct": 0
            },
            {
                "question": "Qual é o resultado esperado de um check-in bem executado?",
                "options": [
                    "Passageiro, bagagem e áreas operacionais alinhados antes do embarque",
                    "Mais dúvidas no portão",
                    "Menos registros operacionais",
                    "Bagagens aceitas sem controle"
                ],
                "correct": 0
            }
        ]
    },
    {
        "id": "embarque-controle-portao",
        "title": "Embarque e Controle de Portão",
        "eyebrow": "Operação de gate",
        "duration": "1h 05min",
        "level": "Básico",
        "summary": "Rotina operacional do portão de embarque, conferência de passageiros, prioridades, bagagem de mão, irregularidades e fechamento do voo.",
        "color": "#1d4ed8",
        "modules": [
            {
                "title": "Preparação do portão",
                "type": "Aula",
                "duration": "10 min",
                "content": "A preparação do portão começa antes da chamada de embarque, com conferência de voo, horário, aeronave, posição, documentação operacional, equipe e recursos de atendimento."
            },
            {
                "title": "Sequência de embarque",
                "type": "Procedimento",
                "duration": "10 min",
                "content": "A sequência de embarque organiza prioridades, grupos, passageiros com assistência, famílias, conexões e fluxo geral para reduzir filas, conflito e atraso."
            },
            {
                "title": "Conferência e conciliação",
                "type": "Prática guiada",
                "duration": "12 min",
                "content": "O controle de portão exige conferência do cartão de embarque, documento quando aplicável, status do passageiro e conciliação entre aceitos, embarcados e pendentes."
            },
            {
                "title": "Bagagem no portão",
                "type": "Aula",
                "duration": "12 min",
                "content": "Bagagem de mão, volumes fora do padrão e bagagem despachada no portão precisam ser tratados com etiqueta, orientação, segurança e comunicação com rampa."
            },
            {
                "title": "Irregularidades no gate",
                "type": "Simulação",
                "duration": "11 min",
                "content": "Atraso de passageiro, troca de assento, impedimento de embarque, overbooking, assistência especial não prevista e conflito exigem calma, registro e acionamento correto."
            },
            {
                "title": "Fechamento do voo",
                "type": "Checklist",
                "duration": "10 min",
                "content": "O fechamento do voo confirma passageiros embarcados, ausentes, bagagens reconciliadas, informações à tripulação, documentação final e liberação operacional."
            }
        ],
        "labs": [
            {
                "label": "Simulador Loading",
                "href": "../pages/loading.html"
            },
            {
                "label": "Biblioteca Operacional",
                "href": "operational-library.html"
            }
        ],
        "quiz": [
            {
                "question": "Qual é a finalidade da preparação do portão antes do embarque?",
                "options": [
                    "Iniciar chamada sem conferir dados",
                    "Garantir voo, horário, equipe, recursos e informações operacionais corretas",
                    "Substituir a atuação da rampa",
                    "Eliminar a conferência de passageiros"
                ],
                "correct": 1
            },
            {
                "question": "A sequência de embarque deve considerar:",
                "options": [
                    "Prioridades, assistências, grupos e fluxo seguro",
                    "Apenas passageiros sem bagagem de mão",
                    "Somente ordem de chegada",
                    "Apenas passageiros frequentes"
                ],
                "correct": 0
            },
            {
                "question": "O controle de portão exige conciliar:",
                "options": [
                    "Aceitos, embarcados, pendentes e ausentes",
                    "Somente passageiros na fila",
                    "Apenas bagagens pesadas",
                    "Somente assentos de janela"
                ],
                "correct": 0
            },
            {
                "question": "Quando houver passageiro com assistência especial, o portão deve:",
                "options": [
                    "Aguardar o passageiro pedir novamente",
                    "Confirmar registro, apoio necessário e comunicação com áreas envolvidas",
                    "Ignorar se o voo estiver no horário",
                    "Encaminhar sem registro"
                ],
                "correct": 1
            },
            {
                "question": "Bagagem de mão fora do padrão no portão deve ser tratada com:",
                "options": [
                    "Orientação, etiqueta quando aplicável e comunicação com rampa",
                    "Aceitação automática na cabine",
                    "Entrega direta na esteira de restituição",
                    "Nenhuma ação"
                ],
                "correct": 0
            },
            {
                "question": "A conferência do cartão de embarque no gate serve para:",
                "options": [
                    "Confirmar passageiro, voo, trecho e status de embarque",
                    "Definir franquia de bagagem",
                    "Alterar destino do passageiro",
                    "Substituir documentação internacional"
                ],
                "correct": 0
            },
            {
                "question": "Se um passageiro chega após encerramento do embarque, o agente deve:",
                "options": [
                    "Abrir a porta da aeronave sem consulta",
                    "Seguir procedimento, explicar com clareza e acionar supervisão quando necessário",
                    "Prometer embarque no mesmo voo",
                    "Ignorar o passageiro"
                ],
                "correct": 1
            },
            {
                "question": "Overbooking ou preterição deve ser tratado com:",
                "options": [
                    "Comunicação transparente, registro, alternativas e regras aplicáveis",
                    "Silêncio até o passageiro perceber",
                    "Remoção de passageiros sem explicação",
                    "Apenas orientação para comprar nova passagem"
                ],
                "correct": 0
            },
            {
                "question": "No fechamento do voo, é essencial confirmar:",
                "options": [
                    "Passageiros embarcados, ausentes e bagagens reconciliadas",
                    "Apenas o horário local",
                    "Somente a quantidade de assentos vazios",
                    "Apenas a fila encerrada"
                ],
                "correct": 0
            },
            {
                "question": "Uma comunicação eficiente entre portão e rampa evita:",
                "options": [
                    "Bagagens sem reconciliação, atraso e informação conflitante",
                    "Uso de cartão de embarque",
                    "Atendimento prioritário",
                    "Leitura de documentos"
                ],
                "correct": 0
            },
            {
                "question": "Em situação de conflito no gate, a postura recomendada é:",
                "options": [
                    "Manter calma, escutar, explicar limites e registrar a ocorrência",
                    "Responder no mesmo tom do passageiro",
                    "Evitar qualquer explicação",
                    "Abandonar a posição"
                ],
                "correct": 0
            },
            {
                "question": "A chamada de embarque deve ser:",
                "options": [
                    "Clara, audível, objetiva e coerente com o fluxo definido",
                    "Improvisada e sem sequência",
                    "Feita apenas uma vez",
                    "Sempre em linguagem técnica"
                ],
                "correct": 0
            },
            {
                "question": "Quando há mudança de portão, a equipe deve:",
                "options": [
                    "Atualizar informação, orientar passageiros e comunicar áreas impactadas",
                    "Esperar que os passageiros descubram",
                    "Alterar sem registro",
                    "Informar somente após encerramento"
                ],
                "correct": 0
            },
            {
                "question": "Qual informação deve chegar à tripulação quando aplicável?",
                "options": [
                    "Passageiros com assistência, casos especiais e pendências relevantes",
                    "Opiniões pessoais do agente",
                    "Apenas quantidade de malas grandes",
                    "Informações sem relação com o voo"
                ],
                "correct": 0
            },
            {
                "question": "O resultado de um embarque bem controlado é:",
                "options": [
                    "Voo fechado com passageiros, bagagens e áreas alinhadas",
                    "Mais filas sem orientação",
                    "Menos rastreabilidade",
                    "Aumento de conflitos no portão"
                ],
                "correct": 0
            }
        ]
    },
    {
        "id": "irregularidades-voo",
        "title": "Atendimento em Irregularidades de Voo",
        "eyebrow": "Direitos e contingência",
        "duration": "1h 25min",
        "level": "Intermediário",
        "summary": "Atendimento em atrasos, cancelamentos, interrupções, preterição, assistência material, reacomodação, reembolso e registro de ocorrências.",
        "color": "#7c3aed",
        "modules": [
            {
                "title": "Tipos de irregularidade",
                "type": "Aula",
                "duration": "12 min",
                "content": "Irregularidades de voo incluem atraso, cancelamento, interrupção, alteração programada, perda de conexão, preterição de embarque e mudanças operacionais que impactam a jornada."
            },
            {
                "title": "Informação ao passageiro",
                "type": "Procedimento",
                "duration": "12 min",
                "content": "O passageiro deve receber informação clara, tempestiva e atualizada sobre situação do voo, previsão, motivo quando disponível, alternativas e próximos passos."
            },
            {
                "title": "Assistência material",
                "type": "Consulta",
                "duration": "14 min",
                "content": "A assistência material deve observar tempo de espera e necessidade do passageiro, podendo envolver comunicação, alimentação, acomodação e transporte conforme regra aplicável."
            },
            {
                "title": "Reacomodação e reembolso",
                "type": "Prática guiada",
                "duration": "16 min",
                "content": "Em cancelamento, atraso relevante ou interrupção, o atendimento deve apresentar alternativas permitidas, como reacomodação, execução por outra modalidade ou reembolso, conforme cenário."
            },
            {
                "title": "Preterição de embarque",
                "type": "Simulação",
                "duration": "15 min",
                "content": "Preterição ocorre quando o passageiro apto não embarca por motivo operacional. O tratamento exige transparência, busca de voluntários quando aplicável, compensação e registro."
            },
            {
                "title": "Registro e postura em crise",
                "type": "Checklist",
                "duration": "16 min",
                "content": "Em contingência, o agente deve manter calma, registrar decisões, orientar com consistência, acionar liderança e evitar promessas sem confirmação operacional."
            }
        ],
        "labs": [
            {
                "label": "Dashboard do Simulador",
                "href": "../index.html"
            },
            {
                "label": "Biblioteca Operacional",
                "href": "operational-library.html"
            }
        ],
        "quiz": [
            {
                "question": "Qual situação é considerada irregularidade de voo?",
                "options": [
                    "Atraso, cancelamento, interrupção, preterição ou alteração que impacta a jornada",
                    "Somente troca voluntária de assento",
                    "Apenas despacho de bagagem comum",
                    "Somente compra de passagem"
                ],
                "correct": 0
            },
            {
                "question": "Durante atraso ou cancelamento, a comunicação ao passageiro deve ser:",
                "options": [
                    "Clara, atualizada e coerente com as informações disponíveis",
                    "Feita apenas após o embarque",
                    "Ocultada até haver solução definitiva",
                    "Sempre informal e sem registro"
                ],
                "correct": 0
            },
            {
                "question": "A assistência material deve considerar:",
                "options": [
                    "Tempo de espera e necessidade do passageiro",
                    "Apenas o preço pago pela passagem",
                    "Somente o número do assento",
                    "Apenas a classe tarifária"
                ],
                "correct": 0
            },
            {
                "question": "Em regra operacional brasileira, a assistência após 1 hora de espera envolve:",
                "options": [
                    "Facilidades de comunicação",
                    "Hospedagem obrigatória imediata",
                    "Reembolso automático integral sem análise",
                    "Encerramento do atendimento"
                ],
                "correct": 0
            },
            {
                "question": "Após 2 horas de espera, a assistência material tende a incluir:",
                "options": [
                    "Alimentação conforme meios disponíveis",
                    "Apenas nova etiqueta de bagagem",
                    "Cancelamento do documento",
                    "Nenhuma obrigação adicional"
                ],
                "correct": 0
            },
            {
                "question": "Após 4 horas de espera, conforme cenário, pode ser necessária assistência com:",
                "options": [
                    "Acomodação ou hospedagem e transporte quando aplicável",
                    "Somente aviso verbal",
                    "Troca de uniforme",
                    "Nada além de comunicação"
                ],
                "correct": 0
            },
            {
                "question": "Reacomodação significa:",
                "options": [
                    "Oferecer alternativa de transporte ao passageiro conforme regra e disponibilidade",
                    "Cancelar o passageiro sem aviso",
                    "Alterar bagagem para outro aeroporto sem passageiro",
                    "Trocar somente o portão"
                ],
                "correct": 0
            },
            {
                "question": "Quando o passageiro tem direito a alternativas, o agente deve:",
                "options": [
                    "Explicar opções disponíveis, prazos, impactos e registrar a escolha",
                    "Escolher por ele sem informar",
                    "Oferecer apenas a alternativa mais barata",
                    "Evitar qualquer registro"
                ],
                "correct": 0
            },
            {
                "question": "Preterição de embarque ocorre quando:",
                "options": [
                    "Passageiro apto deixa de embarcar por motivo operacional",
                    "Passageiro decide não viajar espontaneamente",
                    "Passageiro perde documento antes do check-in",
                    "A mala fica danificada"
                ],
                "correct": 0
            },
            {
                "question": "Em caso de preterição, uma prática correta é:",
                "options": [
                    "Buscar voluntários quando aplicável, explicar alternativas e registrar",
                    "Remover passageiro sem justificativa",
                    "Negar qualquer informação",
                    "Encerrar voo sem controle"
                ],
                "correct": 0
            },
            {
                "question": "A postura do agente em contingência deve ser:",
                "options": [
                    "Calma, empática, objetiva e baseada em procedimento",
                    "Irritada e defensiva",
                    "Silenciosa para evitar perguntas",
                    "Improvisada a cada passageiro"
                ],
                "correct": 0
            },
            {
                "question": "Por que registros são importantes em irregularidades?",
                "options": [
                    "Garantem rastreabilidade de informação, orientação e decisão tomada",
                    "Substituem a necessidade de atender",
                    "Servem apenas para estatística sem uso operacional",
                    "Permitem apagar evidências"
                ],
                "correct": 0
            },
            {
                "question": "Se ainda não há previsão confiável de partida, o agente deve:",
                "options": [
                    "Informar a situação real e atualizar quando houver nova previsão",
                    "Inventar um horário para acalmar a fila",
                    "Prometer embarque imediato",
                    "Evitar contato visual"
                ],
                "correct": 0
            },
            {
                "question": "Passageiros com assistência especial em contingência exigem:",
                "options": [
                    "Acompanhamento, prioridade adequada e cuidado com necessidades específicas",
                    "Atendimento somente no fim da fila",
                    "Nenhum tratamento diferenciado",
                    "Apenas informação por alto-falante"
                ],
                "correct": 0
            },
            {
                "question": "O objetivo de um bom atendimento em irregularidade é:",
                "options": [
                    "Reduzir incerteza, aplicar direitos, oferecer alternativas e preservar segurança",
                    "Evitar que o passageiro saiba o que ocorreu",
                    "Encerrar a conversa o mais rápido possível",
                    "Transferir toda responsabilidade para outra área"
                ],
                "correct": 0
            }
        ]
    },
    {
        "id": "conexoes-mct",
        "title": "Conexões e MCT",
        "eyebrow": "Conectividade operacional",
        "duration": "1h 15min",
        "level": "Intermediário",
        "summary": "Interpretação de conexões, tempo mínimo operacional, riscos para passageiros e bagagens, perda de conexão, priorização e indicadores.",
        "color": "#0891b2",
        "modules": [
            {
                "title": "Conceito de conexão e MCT",
                "type": "Aula",
                "duration": "12 min",
                "content": "MCT é o tempo mínimo de conexão necessário para que passageiro e bagagem sejam transferidos com segurança entre voos dentro das condições previstas."
            },
            {
                "title": "Leitura de itinerário",
                "type": "Prática guiada",
                "duration": "12 min",
                "content": "A leitura do itinerário deve considerar origem, conexão, destino final, tipo de voo, mudança de terminal, controle migratório, retirada de bagagem e tempo disponível."
            },
            {
                "title": "Risco para passageiro e bagagem",
                "type": "Aula",
                "duration": "13 min",
                "content": "Conexões curtas aumentam risco de passageiro embarcar sem a bagagem, bagagem perder o trecho, falha de reconciliação e abertura de processo no destino."
            },
            {
                "title": "Priorização operacional",
                "type": "Procedimento",
                "duration": "13 min",
                "content": "Conexões críticas exigem identificação antecipada, comunicação entre áreas, prioridade de bagagem, orientação ao passageiro e acompanhamento até o embarque."
            },
            {
                "title": "Perda de conexão",
                "type": "Simulação",
                "duration": "13 min",
                "content": "Quando há perda de conexão, o atendimento deve verificar causa, reacomodação, assistência, tratamento da bagagem e registros necessários para continuidade."
            },
            {
                "title": "Indicadores e melhoria",
                "type": "Checklist",
                "duration": "12 min",
                "content": "A gestão de conexões deve acompanhar misconnection, bagagens não conectadas, tempo de transferência, causas recorrentes, turnos críticos e ações corretivas."
            }
        ],
        "labs": [
            {
                "label": "Dashboard do Simulador",
                "href": "../index.html"
            },
            {
                "label": "Biblioteca Operacional",
                "href": "operational-library.html"
            }
        ],
        "quiz": [
            {
                "question": "O que significa MCT?",
                "options": [
                    "Tempo mínimo de conexão",
                    "Controle máximo de tarifa",
                    "Mensagem comercial de transporte",
                    "Manual de carga temporária"
                ],
                "correct": 0
            },
            {
                "question": "O MCT existe para avaliar se há tempo mínimo para:",
                "options": [
                    "Transferência segura de passageiro e bagagem entre voos",
                    "Escolha de assento",
                    "Compra de bagagem extra",
                    "Troca de uniforme da equipe"
                ],
                "correct": 0
            },
            {
                "question": "Na leitura de um itinerário com conexão, o agente deve observar:",
                "options": [
                    "Origem, conexão, destino, terminais, controles e tempo disponível",
                    "Apenas o número do primeiro voo",
                    "Somente a classe tarifária",
                    "Apenas a cor da etiqueta"
                ],
                "correct": 0
            },
            {
                "question": "Uma conexão curta aumenta o risco de:",
                "options": [
                    "Passageiro ou bagagem não seguirem no próximo trecho",
                    "Melhorar automaticamente a pontualidade",
                    "Eliminar necessidade de comunicação",
                    "Dispensar triagem de bagagem"
                ],
                "correct": 0
            },
            {
                "question": "Qual fator pode tornar uma conexão mais crítica?",
                "options": [
                    "Mudança de terminal, controle migratório ou atraso do voo de chegada",
                    "Passageiro sentado na janela",
                    "Bagagem sem cor informada",
                    "Cartão de embarque impresso em papel"
                ],
                "correct": 0
            },
            {
                "question": "Conexões críticas devem ser tratadas com:",
                "options": [
                    "Identificação antecipada, prioridade e comunicação entre áreas",
                    "Espera passiva",
                    "Apenas anúncio genérico",
                    "Nenhum acompanhamento"
                ],
                "correct": 0
            },
            {
                "question": "Quando a bagagem perde a conexão, uma consequência possível é:",
                "options": [
                    "Abertura de processo de bagagem no destino",
                    "Cancelamento automático do passageiro",
                    "Eliminação do comprovante de bagagem",
                    "Embarque sem necessidade de etiqueta"
                ],
                "correct": 0
            },
            {
                "question": "Em perda de conexão do passageiro, o atendimento deve verificar:",
                "options": [
                    "Causa, alternativa de viagem, assistência e bagagem",
                    "Apenas o assento preferido",
                    "Somente a esteira de restituição",
                    "Apenas o nome da aeronave"
                ],
                "correct": 0
            },
            {
                "question": "A bagagem em conexão precisa ser acompanhada porque:",
                "options": [
                    "Pode exigir transferência, reconciliação, prioridade ou reetiquetagem",
                    "Nunca depende do voo do passageiro",
                    "Sempre fica no aeroporto de conexão",
                    "Não possui relação com MCT"
                ],
                "correct": 0
            },
            {
                "question": "Um bom indicador para gestão de conexões é:",
                "options": [
                    "Quantidade de passageiros e bagagens que perderam conexão por causa recorrente",
                    "Quantidade de cafés servidos",
                    "Cor das malas por voo",
                    "Número de poltronas vazias sem análise"
                ],
                "correct": 0
            },
            {
                "question": "Quando há conexão internacional, pode ser necessário considerar:",
                "options": [
                    "Imigração, alfândega, segurança, terminal e retirada/redespacho de bagagem",
                    "Apenas a distância até a loja mais próxima",
                    "Somente o idioma do passageiro",
                    "Nenhum controle adicional"
                ],
                "correct": 0
            },
            {
                "question": "A priorização de bagagem em conexão deve ser comunicada a:",
                "options": [
                    "Áreas envolvidas no fluxo, como rampa, BHS, gate e coordenação",
                    "Apenas passageiros que perguntarem",
                    "Somente setor financeiro",
                    "Ninguém"
                ],
                "correct": 0
            },
            {
                "question": "Se o tempo de conexão está abaixo do mínimo aplicável, o agente deve:",
                "options": [
                    "Tratar como risco, orientar e acionar fluxo adequado",
                    "Garantir que tudo dará certo",
                    "Ignorar por ser responsabilidade do passageiro",
                    "Apagar o registro"
                ],
                "correct": 0
            },
            {
                "question": "A análise de causa em conexões ajuda a:",
                "options": [
                    "Reduzir reincidência de misconnection e bagagem não conectada",
                    "Aumentar filas",
                    "Remover prioridade",
                    "Evitar qualquer registro"
                ],
                "correct": 0
            },
            {
                "question": "O objetivo da gestão de MCT é:",
                "options": [
                    "Proteger a continuidade da viagem e reduzir falhas de conexão",
                    "Criar atraso proposital",
                    "Substituir o check-in",
                    "Eliminar acompanhamento de bagagens"
                ],
                "correct": 0
            }
        ]
    }
];

