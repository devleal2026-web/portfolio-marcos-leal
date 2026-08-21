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
    }
];
