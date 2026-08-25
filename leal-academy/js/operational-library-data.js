const operationalLibraryData = [
    {
        categoria:"Atendimento",
        titulo:"Postura no atendimento",
        texto:"O atendimento deve transmitir segurança, cordialidade e clareza. O agente deve manter boa apresentação, falar diretamente com o passageiro e conduzir a orientação com calma.",
        pontos:[
            "Cumprimente o passageiro com postura profissional.",
            "Use tom de voz claro e moderado.",
            "Evite discutir; explique procedimentos com objetividade.",
            "Mantenha atenção especial a passageiros prioritários."
        ],
        tags:["atendimento","postura","cliente","passageiro"]
    },
    {
        categoria:"Check-in",
        titulo:"Responsabilidades do check-in",
        texto:"O check-in envolve localização da reserva, conferência documental, despacho de bagagens, emissão do cartão de embarque e atendimento a necessidades especiais.",
        pontos:[
            "Confirmar reserva e dados do passageiro.",
            "Verificar documentos aceitos conforme regra aplicável.",
            "Conferir bagagem, peso e restrições.",
            "Sinalizar serviços especiais quando necessário."
        ],
        tags:["check-in","documentos","bagagem","embarque"]
    },
    {
        categoria:"AIRIMP",
        titulo:"Códigos de assistência",
        texto:"Códigos AIRIMP padronizam solicitações e condições especiais entre empresas aéreas e aeroportos.",
        pontos:[
            "BLND: passageiro com deficiência visual.",
            "DEAF: passageiro com deficiência auditiva.",
            "WCHR: cadeira de rodas para longas distâncias.",
            "WCHS: assistência em escadas.",
            "WCHC: assistência integral até o assento.",
            "UMNR: menor desacompanhado.",
            "MAAS: máxima assistência."
        ],
        tags:["airimp","blnd","deaf","wchr","wchs","wchc","umnr","maas"]
    },
    {
        categoria:"AIRIMP",
        titulo:"Serviços especiais",
        texto:"Alguns códigos sinalizam serviços adicionais, alimentação, animais, oxigênio, armas ou equipamentos especiais.",
        pontos:[
            "PETC: animal transportado na cabine.",
            "AVIH: animal vivo transportado no porão.",
            "SVAN: animal de serviço.",
            "ESAN: animal de suporte emocional, conforme regra da companhia.",
            "WEAP: arma de fogo ou desportiva.",
            "SPEQ: equipamento especial.",
            "BBML, CHML, DBML, VGML: refeições especiais."
        ],
        tags:["petc","avih","svan","esan","weap","speq","bbml","chml","dbml","vgml"]
    },
    {
        categoria:"Artigos Perigosos",
        titulo:"Itens restritos",
        texto:"Artigos perigosos devem ser avaliados conforme regras da companhia, ANAC, IATA e segurança aeroportuária.",
        pontos:[
            "Objetos perfurantes não devem seguir como bagagem de mão.",
            "Cigarros eletrônicos e baterias sobressalentes exigem atenção especial.",
            "Inflamáveis, explosivos e corrosivos normalmente não podem embarcar.",
            "Cadeiras de rodas e auxílios motrizes seguem regras específicas."
        ],
        tags:["artigos perigosos","restritos","bateria","inflamavel","anac","iata"]
    },
    {
        categoria:"PNAE / MAAS",
        titulo:"Atendimento a passageiros com assistência",
        texto:"O atendimento especial deve preservar segurança, autonomia e dignidade do passageiro.",
        pontos:[
            "Fale diretamente com o passageiro.",
            "Pergunte antes de ajudar.",
            "Em cadeira de rodas, conduza com cuidado em rampas, portas e áreas de circulação.",
            "Em deficiência visual, ofereça o braço e antecipe obstáculos.",
            "Em deficiência auditiva, fale de frente e use escrita se necessário."
        ],
        tags:["pnae","maas","wchr","wchs","wchc","blnd","deaf"]
    },
    {
        categoria:"Menor",
        titulo:"Menor desacompanhado",
        texto:"O serviço UMNR acompanha menores viajando sem responsável legal, conforme idade, rota e política da empresa.",
        pontos:[
            "Confirmar idade e regra da companhia.",
            "Verificar documentação e autorização quando aplicável.",
            "Registrar dados dos responsáveis na origem e destino.",
            "Não aceitar situações incompatíveis com segurança ou assistência necessária."
        ],
        tags:["umnr","menor","autorizacao","documentos"]
    },
    {
        categoria:"PET",
        titulo:"Transporte de animais",
        texto:"Animais podem ser transportados como PETC ou AVIH, conforme porte, peso, documentação e regra da companhia.",
        pontos:[
            "Verificar vacinação e documentação.",
            "Conferir dimensões e condições do kennel.",
            "Avaliar restrições de raça, saúde e ventilação.",
            "Confirmar se o serviço é cabine, porão, animal de serviço ou suporte."
        ],
        tags:["pet","petc","avih","kennel","svan","esan"]
    },
    {
        categoria:"Armas",
        titulo:"Transporte de arma de fogo",
        texto:"Armas exigem procedimento específico, apresentação prévia, documentação e autorização pelos órgãos competentes.",
        pontos:[
            "Encaminhar conforme procedimento da companhia e autoridade aeroportuária.",
            "Conferir formulário aplicável.",
            "Garantir que a arma esteja desmuniciada quando despachada.",
            "Informar restrições e condições operacionais ao passageiro."
        ],
        tags:["arma","weap","gedaf","gepar","despacho"]
    },
    {
        categoria:"Embarque",
        titulo:"Procedimentos de embarque",
        texto:"O embarque deve ocorrer somente após liberação operacional, respeitando prioridade, segurança e comunicação entre setores.",
        pontos:[
            "Aguardar liberação do despacho ou superior.",
            "Respeitar prioridades legais e operacionais.",
            "Em posição remota, orientar deslocamento seguro até a aeronave.",
            "Conferir passageiros embarcados antes do fechamento."
        ],
        tags:["embarque","prioridade","remota","despacho"]
    },
    {
        categoria:"Bagagem",
        titulo:"Serviço de bagagem",
        texto:"O serviço de bagagem atua em extravio, sobra, dano, suspeita de subtração e localização de itens.",
        pontos:[
            "Registrar reclamações em relatório apropriado.",
            "Usar características padronizadas da bagagem.",
            "Orientar o passageiro sobre prazo e acompanhamento.",
            "Acionar busca, catalogação e restituição conforme o caso."
        ],
        tags:["bagagem","ll","rib","bic","extravio","dano"]
    },
    {
        categoria:"WorldTracer",
        titulo:"AHL - Bagagem extraviada",
        texto:"AHL é usado quando a bagagem despachada não é restituída ao passageiro no destino.",
        pontos:[
            "Confirmar que a bagagem realmente não chegou.",
            "Acionar busca em aeronave, triagem, rampa e carga.",
            "Coletar dados do passageiro e características da bagagem.",
            "Registrar informações para localização e restituição."
        ],
        tags:["ahl","worldtracer","extravio","bagagem"]
    },
    {
        categoria:"WorldTracer",
        titulo:"OHD - Sobra de bagagem",
        texto:"OHD é usado quando uma bagagem permanece na base após a saída dos passageiros.",
        pontos:[
            "Procurar identificação, etiqueta ou documento na bagagem.",
            "Submeter a bagagem ao procedimento de segurança.",
            "Se houver identificação, preparar envio ao destino correto.",
            "Se não houver identificação, catalogar conteúdo e características."
        ],
        tags:["ohd","worldtracer","sobra","rush","conteudo"]
    },
    {
        categoria:"WorldTracer",
        titulo:"DPR - Dano ou violação",
        texto:"DPR é usado para dano relevante causado no manuseio da bagagem ou suspeita de subtração.",
        pontos:[
            "Avaliar se o dano compromete o uso da bagagem.",
            "Verificar se o dano já constava no despacho.",
            "Registrar dados do passageiro e evidências.",
            "Encaminhar conforme política de reparo, coleta ou indenização."
        ],
        tags:["dpr","damage","pilferage","dano","violacao"]
    },
    {
        categoria:"Siglas Operacionais",
        titulo:"Indicadores, tempo e pontualidade",
        texto:"Siglas usadas nos cursos para controle de tempo, conexão, atendimento e qualidade operacional.",
        pontos:[
            "SLA: Service Level Agreement. Acordo ou meta de nível de serviço, usado para medir prazos como entrega de bagagem, resposta ou atendimento.",
            "MCT: Minimum Connection Time. Tempo mínimo de conexão necessário para passageiro e bagagem seguirem com segurança entre voos.",
            "KPI: Key Performance Indicator. Indicador-chave de desempenho usado para acompanhar qualidade, produtividade e desvios.",
            "ETA: Estimated Time of Arrival. Horário estimado de chegada.",
            "ETD: Estimated Time of Departure. Horário estimado de partida.",
            "STA: Scheduled Time of Arrival. Horário programado de chegada.",
            "STD: Scheduled Time of Departure. Horário programado de partida.",
            "UTC: Coordinated Universal Time. Horário universal usado como referência em operações aéreas."
        ],
        tags:["sla","mct","kpi","eta","etd","sta","std","utc","tempo","indicadores","pontualidade"]
    },
    {
        categoria:"Siglas Operacionais",
        titulo:"WorldTracer e serviço de bagagem",
        texto:"Siglas usadas em processos de bagagem extraviada, sobrante, danificada, violada e comunicação entre bases.",
        pontos:[
            "AHL: Advise If Hold. Registro de bagagem não restituída ao passageiro.",
            "OHD: On-Hand Bag. Registro de bagagem localizada ou sobrante na base.",
            "DPR: Damage/Pilferage Report. Registro de dano ou suspeita de violação/subtração.",
            "RFP: Lost and Found Property. Registro de objeto esquecido ou localizado.",
            "PIR: Property Irregularity Report. Relatório de irregularidade de propriedade/bagagem.",
            "ROH: Request On-Hand Bag. Solicitação de envio de uma bagagem OHD para outra base.",
            "FOH: Forward On-Hand Bag. Mensagem de envio de uma bagagem OHD.",
            "QOH: Query On-Hand Bag. Consulta ou solicitação relacionada a OHD, conforme fluxo operacional.",
            "BDO: Baggage Delivery Order. Ordem de entrega da bagagem ao passageiro.",
            "FWD: Forward Message. Mensagem de encaminhamento ou aviso de envio."
        ],
        tags:["ahl","ohd","dpr","rfp","pir","roh","foh","qoh","bdo","fwd","worldtracer","bagagem"]
    },
    {
        categoria:"Siglas Operacionais",
        titulo:"Campos comuns em máscaras SITA",
        texto:"Campos frequentemente usados nas máscaras de AHL, OHD, DPR e comunicações operacionais.",
        pontos:[
            "TN: Tag Number. Número da etiqueta de bagagem.",
            "NM: Name. Nome do passageiro.",
            "IT: Initials. Iniciais do passageiro.",
            "CT: Color/Type. Cor e tipo da bagagem.",
            "BI: Brand Information. Marca ou informação da bagagem.",
            "BW: Baggage Weight. Peso da bagagem.",
            "FD: Flight/Date. Voo e data.",
            "RT: Route. Rota do passageiro ou da bagagem.",
            "CC: Contents. Conteúdo declarado ou identificado.",
            "AG: Agent. Agente ou base responsável pelo registro.",
            "FF: Extra Information. Campo de informações adicionais e histórico.",
            "RL: Reason for Loss. Motivo operacional atribuído à irregularidade.",
            "FS: Fault Station. Estação provável responsável pela irregularidade."
        ],
        tags:["tn","nm","it","ct","bi","bw","fd","rt","cc","ag","ff","rl","fs","sita","mascara"]
    },
    {
        categoria:"WorldTracer",
        titulo:"Elementos das máscaras AHL, OHD e DPR",
        texto:"Referencia de consulta para identificar o significado dos campos usados nas mascaras do simulador. Cada mascara usa apenas os campos aplicaveis ao seu tipo de processo.",
        pontos:[
            "AB: Endereco anexado a bagagem.",
            "AG: Nome do agente.",
            "AM: Mensagem automatica.",
            "BD: Detalhe do dano da bagagem.",
            "BI: Marca da bagagem.",
            "BP: Telefone anexo a bagagem.",
            "BW: Peso total dos volumes despachados no check-in.",
            "CC: Conteudo.",
            "CD: Conteudo danificado.",
            "CP: Telefone celular.",
            "CT: Cor e tipo da bagagem.",
            "DB: Destino que consta na etiqueta da bagagem.",
            "DD: Data e hora da entrega da bagagem.",
            "DS: Cadastro da entregadora no BDO.",
            "DV: Data limite de entrega no endereco temporario.",
            "DW: Peso do volume entregue ao passageiro.",
            "EA: E-mail do cliente.",
            "FD: Voo e data em que o cliente embarcou.",
            "FF: Informacoes suplementares.",
            "FL: Numero do programa de fidelizacao do cliente.",
            "FO: Voo e data em que o volume sera enviado.",
            "IT: Iniciais do nome do cliente.",
            "LA: Idioma.",
            "LP: Conteudo faltante na bagagem.",
            "LZ: Elemento que identifica o relatorio na busca secundaria.",
            "NM: Nome e sobrenome do cliente.",
            "PN: Telefone do endereco permanente do cliente.",
            "PP: Numero do documento.",
            "PS: Status do cliente.",
            "RB: Reposicao de bagagem.",
            "RL: Codigo de extravio, danificacao ou violacao.",
            "RT: Rota.",
            "SI: Informacoes suplementares.",
            "SL: Local de armazenamento.",
            "TA: Endereco temporario do cliente.",
            "TC: Pais do endereco temporario.",
            "TD: Codigo da danificacao.",
            "TK: Numero do bilhete.",
            "TN: Numero da etiqueta da bagagem.",
            "TP: Telefone temporario.",
            "TS: Estado do endereco temporario.",
            "TZ: CEP do endereco temporario.",
            "XF: Endereco do Action File."
        ],
        tags:["worldtracer","ahl","ohd","dpr","campos","mascara","it","pp","ps","bdo"]
    },
    {
        categoria:"WorldTracer",
        titulo:"Identificacao das transacoes",
        texto:"Referencia de consulta para as principais transacoes do ambiente WorldTracer simulado. Use esta lista para associar cada codigo ao momento operacional correto.",
        pontos:[
            "HELP: Ajuda do sistema.",
            "AHL: Criar relatorio de bagagem extraviada.",
            "OHD: Criar relatorio de bagagem sobrante.",
            "QOH: Insercao rapida de bagagem sobrante.",
            "DPR: Criar relatorio de danificacao e violacao.",
            "DAH: Visualizacao de AHL.",
            "DOH: Visualizacao de OHD.",
            "DDP: Visualizacao de DPR.",
            "RAF: Lista de AHLs.",
            "ROF: Lista de OHDs.",
            "DOF: Lista de OHDs, QOHs e mensagens de envio FWD, FOH, FAH, FLZ.",
            "AAH: Incluir, apagar ou alterar informacoes no AHL.",
            "AOH: Incluir, apagar ou alterar informacoes no OHD.",
            "ADP: Incluir, apagar ou alterar informacoes no DPR.",
            "CXF: Area de armazenamento de mensagens, Action File.",
            "DXF: Ler mensagens do Action File.",
            "EXF: Excluir mensagens do Action File.",
            "PXF: Enviar mensagens.",
            "TXF: Transferir mensagens.",
            "ROH: Solicitar OHD.",
            "FOH: Enviar OHD.",
            "SUS: Suspender relatorios de AHL e OHD.",
            "RIT: Reativar relatorios de AHL e OHD.",
            "FAH: Envio de bagagens pertencentes a AHLs de sua base.",
            "FLZ: Envio de bagagem para a central de bagagens.",
            "CAH: Fechamento de AHL.",
            "CDP: Fechamento de DPR.",
            "COH: Fechamento de OHD.",
            "CFD: Fechamento de AHL e abertura de DPR.",
            "BDO: Ordem de entrega de bagagem.",
            "RCB: Reabertura de relatorio fechado.",
            "DST: Area de visualizacao dos dados da base.",
            "FWD: Mensagem de envio de bagagem.",
            "RFP: Insercao de objetos localizados a bordo.",
            "DFP: Visualizacao de objetos encontrados a bordo.",
            "AFP: Inserir informacoes nos objetos esquecidos a bordo.",
            "PDI: Visualizar relatorios inativos no sistema.",
            "FRR: Relatorios de AHL, OHD e DPR abertos, usando somente o numero."
        ],
        tags:["worldtracer","transacoes","help","ahl","ohd","qoh","dpr","action file","dxf","exf","pxf","txf","roh","foh","fah","flz","bdo","fwd","rfp","pdi","frr"]
    },
    {
        categoria:"WorldTracer",
        titulo:"Categorias oficiais de Contents",
        texto:"Categorias padronizadas para preenchimento do campo CC/Contents no AHL e OHD. O agente deve escolher categorias existentes no sistema e detalhar o item em ingles.",
        pontos:[
            "ALCOHOL-2, ART-3, AUDIO-1, BOOK-2, COAT-1, COMPUTER-2, COSMETIC-1, CURRENCY-3.",
            "DRESS-1, ELECTRIC-2, FOOD-1, FOOTWEAR-1, GIFT-1, HAIR-2, HANDBAG-1, HEADWEAR-2.",
            "HOUSEHOLD-1, INFANT-1, JEWELLERY-1, LINEN-1, MECHANIC-3, MEDICAL-1, MUSIC-3, NATURE-2.",
            "OPTICS-3, PAPERS-1, PHOTO-1, RELIGIOUS-3, SHIRT-1, SKIRT-1, SLEEPWEAR-1, SPORT-1.",
            "SPORTSWEAR-1, SUIT-1, SWEATER-1, TIMEPIECE-2, TOBACCO-2, TOOLS-3, TOYS-2, TROUSERS-1.",
            "UNIFORM-3, VIDEO-1, WEAPON-3, WEATHER-1."
        ],
        tags:["contents","cc","categorias","ahl","ohd","worldtracer","book","footwear","weapon"]
    },
    {
        categoria:"Siglas Operacionais",
        titulo:"Atendimento, acessibilidade e serviços especiais",
        texto:"Siglas usadas no atendimento a passageiros com necessidade de assistência, prioridade ou serviço especial.",
        pontos:[
            "PNAE: Passageiro com Necessidade de Assistência Especial.",
            "PRM: Passenger with Reduced Mobility. Passageiro com mobilidade reduzida.",
            "MAAS: Meet and Assist. Passageiro que precisa de assistência máxima ou acompanhamento especial.",
            "SSR: Special Service Request. Solicitação de serviço especial registrada na reserva.",
            "WCHR: Wheelchair Ramp. Cadeira de rodas para longas distâncias; passageiro consegue subir escadas.",
            "WCHS: Wheelchair Steps. Passageiro precisa de ajuda em escadas.",
            "WCHC: Wheelchair Cabin. Passageiro precisa de assistência completa até o assento.",
            "BLND: Passageiro com deficiência visual.",
            "DEAF: Passageiro com deficiência auditiva.",
            "UMNR: Unaccompanied Minor. Menor desacompanhado."
        ],
        tags:["pnae","prm","maas","ssr","wchr","wchs","wchc","blnd","deaf","umnr","assistencia"]
    },
    {
        categoria:"Siglas Operacionais",
        titulo:"Segurança, normas e artigos perigosos",
        texto:"Siglas presentes nos cursos de segurança da aviação, artigos perigosos e conformidade operacional.",
        pontos:[
            "AVSEC: Aviation Security. Segurança da aviação civil contra atos de interferência ilícita.",
            "DGR: Dangerous Goods Regulations. Regras para transporte de artigos perigosos.",
            "IATA: International Air Transport Association. Associação internacional que publica padrões da indústria aérea.",
            "ANAC: Agência Nacional de Aviação Civil. Autoridade brasileira de aviação civil.",
            "OACI ou ICAO: Organização da Aviação Civil Internacional.",
            "RBAC: Regulamento Brasileiro da Aviação Civil.",
            "AHM: Airport Handling Manual. Manual de referência IATA para atendimento aeroportuário.",
            "IGOM: IATA Ground Operations Manual. Manual IATA de operações de solo."
        ],
        tags:["avsec","dgr","iata","anac","oaci","icao","rbac","ahm","igom","seguranca","normas"]
    },
    {
        categoria:"Siglas Operacionais",
        titulo:"Rampa, bagagem e equipamentos",
        texto:"Siglas e termos usados em rampa, manuseio de bagagem, equipamentos de solo e rastreabilidade.",
        pontos:[
            "BHS: Baggage Handling System. Sistema de processamento e triagem de bagagens.",
            "BRS: Baggage Reconciliation System. Sistema de reconciliação entre passageiro e bagagem.",
            "LPN: License Plate Number. Número único de identificação da etiqueta de bagagem.",
            "ULD: Unit Load Device. Unidade de carga usada para acondicionar bagagens ou cargas.",
            "GSE: Ground Support Equipment. Equipamentos de apoio em solo.",
            "FOD: Foreign Object Debris. Objeto estranho que pode causar dano ou risco operacional.",
            "GPU: Ground Power Unit. Equipamento de energia externa para aeronave.",
            "ASU: Air Start Unit. Equipamento para partida pneumática da aeronave.",
            "PCA: Pre-Conditioned Air. Ar condicionado externo para aeronave em solo."
        ],
        tags:["bhs","brs","lpn","uld","gse","fod","gpu","asu","pca","rampa","bagagem"]
    }
];
