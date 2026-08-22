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
