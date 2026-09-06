-- Curso novo: Sabre Interact pratico em portugues Brasil.
-- Base: referencias publicas sobre Sabre Interact/SabreSonic Airport Check-in e Sabre Developer Hub.
-- Este script altera somente o registro id = 'sabre-interact-atendimento-aeroportuario'.
-- Nao altera cursos existentes nem interfere nos simuladores.

grant usage on schema public to anon, authenticated;
grant select on public.academy_courses to anon, authenticated;

alter table public.academy_courses
    add column if not exists category text;

insert into public.academy_courses (
    id, title, eyebrow, category, level, duration, color, summary, modules, labs, quiz, cover_path, material, sort_order
)
values (
    'sabre-interact-atendimento-aeroportuario',
    'Sabre Interact - Atendimento Aeroportuario',
    'DCS na pratica',
    'atendimento',
    'Intermediario',
    '5h28',
    '#123f6d',
    'Curso pratico em portugues Brasil para ensinar o aluno a usar o Sabre Interact no atendimento aeroportuario: voo, listas, passageiro, check-in, assento, bagagem, documentos, embarque, irregularidade e respostas do sistema.',
    $modules_sabre$[
  {
    "title": "Mapa de uso do Sabre Interact Airport",
    "type": "Fundamento pratico",
    "duration": "22 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/sabre-interact/sabre-interact-trilha-01.png?v=sabre-safe-layout-2",
        "title": "Imagem didatica autoral - mapa do Interact",
        "caption": "Visao didatica das abas e fluxo de trabalho do Interact: voo, check-in, embarque e operacoes."
      }
    ],
    "content": "Objetivo da trilha\nEntender onde cada atendimento acontece dentro do Sabre Interact Airport antes de executar qualquer comando.\n\nOnde clicar ou acessar\n- F1 Flights: iniciar pelo voo. Use para lista de voos, detalhes do voo, historico, contagens e resumo.\n- F2 Check-in: usar quando o atendimento e individual: localizar passageiro, aceitar, assento, bagagem, SSR e documento.\n- F3 Boarding: usar no portao para embarcar, desfazer embarque, consultar boarded/not boarded e zonas.\n- F4 Operations: usar para status operacional, gate, standby, oversale e outras funcoes liberadas por perfil.\n\nComo executar na pratica\n1. Abra a aba ligada ao momento do atendimento.\n2. Selecione ou carregue o voo correto antes de pesquisar passageiros.\n3. Use lista ou busca para localizar o passageiro.\n4. Execute apenas uma acao por vez.\n5. Leia a resposta do sistema antes de repetir ou passar para o proximo passo.\n\nRespostas e conduta\n- Tela correta/lista carregada: prossiga.\n- Sem permissao/permission denied: nao improvise; acione supervisor ou perfil autorizado.\n- Resultado vazio/no match: revise voo, data, nome, linha, assento ou localizador.\n- Warning/edit/document required: pare e trate a pendencia antes de aceitar ou embarcar."
  },
  {
    "title": "Carregar voo, consultar listas e totais",
    "type": "Lista operacional",
    "duration": "28 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/sabre-interact/sabre-interact-trilha-02.png?v=sabre-safe-layout-2",
        "title": "Imagem didatica autoral - listas do voo",
        "caption": "Fluxo visual para carregar voo, consultar listas, filtros e totais antes da acao."
      }
    ],
    "content": "Objetivo da trilha\nEnsinar o aluno a iniciar o atendimento carregando o voo correto e consultando listas/totais antes de agir.\n\nOnde clicar ou acessar\n- Aba F1 Flights para trabalhar o voo no inicio do turno ou antes do atendimento.\n- List / Shift+F1 para visualizar os voos do dia quando disponivel.\n- Select / Shift+F3 para selecionar o voo que sera trabalhado.\n- Flight Details / Shift+F4 para conferir origem, destino, horario, gate e status.\n- Psgr Lists / Shift+F2 para abrir a lista de passageiros do voo.\n- Counts ou Totals / U quando o perfil exibir totais operacionais.\n\nCampos que normalmente precisam ser conferidos\nVoo, data, origem, destino, status, gate, horario, passageiros aceitos, boarded, not boarded, standby e conexoes.\n\nComo executar na pratica\n1. Entre em F1 Flights.\n2. Localize o voo pela lista ou selecione o voo pelo numero/data.\n3. Abra Flight Details para confirmar que o voo e o trecho estao corretos.\n4. Abra Psgr Lists para ver os passageiros e aplicar filtros.\n5. Consulte totais antes de tomar decisao de check-in, portao ou fechamento.\n\nRespostas e conduta\n- Lista carregada: confira voo/data/origem/destino antes de agir.\n- Lista vazia: revise data, aeroporto, filtro e permissao.\n- Status delay/boarding/closed: ajuste a conduta ao status real.\n- Passageiro nao aparece no filtro: troque o filtro antes de concluir que ele nao esta no voo."
  },
  {
    "title": "Pesquisar passageiro por nome, assento, linha ou localizador",
    "type": "Busca de passageiro",
    "duration": "30 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/sabre-interact/sabre-interact-trilha-03.png?v=sabre-safe-layout-2",
        "title": "Imagem didatica autoral - busca de passageiro",
        "caption": "Pesquisa segura por diferentes chaves: nome, assento, linha, localizador ou documento quando permitido."
      }
    ],
    "content": "Objetivo da trilha\nLocalizar o passageiro certo antes de check-in, assento, bagagem, documento ou embarque.\n\nOnde clicar ou acessar\n- F2 Check-in quando o atendimento estiver no balcao/check-in.\n- F3 Boarding quando a busca acontecer no portao.\n- Psgr Lists / Shift+F2 para abrir a lista do voo e filtrar passageiros.\n- Passenger Details / Psgr Details / Shift+F3 para abrir detalhes do passageiro selecionado.\n- Campo Name quando a busca for por sobrenome/nome.\n- Campo Seat quando o passageiro informa assento.\n- Campo Line quando voce ja tem o numero da linha na lista.\n- Campo Record/Locator quando o passageiro apresenta localizador/PNR.\n\nComo pesquisar na pratica\n1. Carregue o voo correto primeiro.\n2. Abra Psgr Lists ou Passenger Details.\n3. Escolha o criterio: Name, Seat, Line ou Record/Locator.\n4. Preencha o dado exatamente como informado ou como aparece no documento.\n5. Pressione Enter/OK conforme a tela.\n6. Antes de agir, confira nome, voo, data, origem, destino, assento, status e documento.\n\nQuando usar cada criterio\n- Nome: quando o passageiro nao tem localizador em maos.\n- Assento: quando ele mostra cartao de embarque ou informa assento.\n- Linha: quando a lista ja esta aberta e a pessoa foi identificada nela.\n- Localizador/record: quando existe comprovante de reserva.\n\nRespostas e conduta\n- Um resultado exato: confirme dados e siga para a acao.\n- Multiplos resultados: compare documento, destino e status.\n- No match/no passenger found: revise grafia, data, voo, trecho e filtro; nao faca check-in em registro duvidoso.\n- Passageiro em voo errado: oriente novo atendimento ou reacomodacao conforme regra."
  },
  {
    "title": "Check-in do passageiro: comando C e aceite operacional",
    "type": "Comando principal",
    "duration": "32 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/sabre-interact/sabre-interact-trilha-04.png?v=sabre-safe-layout-2",
        "title": "Imagem didatica autoral - check-in",
        "caption": "Fluxo didatico do aceite de passageiro: comando, validacao, resposta e proximo passo."
      }
    ],
    "content": "Objetivo da trilha\nEnsinar o aceite/check-in usando comandos e respostas do sistema, sem automatismo perigoso.\n\nOnde clicar ou acessar\n- F2 Check-in para atendimento no balcao.\n- Psgr Lists / Shift+F2 para localizar o passageiro na lista.\n- Check-In na lista, ou atalho operacional equivalente quando habilitado.\n- Comando C para aceitar passageiro conforme contexto.\n- C1 para aceitar a linha 1 da lista carregada.\n- C1/8A como exemplo de aceite da linha 1 atribuindo assento 8A, quando a regra da companhia permitir.\n\nAntes de executar\nConfira identidade, voo, data, destino, status do cupom/ticket, documento, SSR, assento, bagagem, alertas e pendencias.\n\nComo executar na pratica\n1. Abra F2 Check-in.\n2. Carregue ou confirme o voo.\n3. Localize o passageiro por lista, nome, linha, assento ou localizador.\n4. Abra Passenger Details se houver duvida.\n5. Execute C, C1 ou C1/assento apenas quando o registro estiver correto.\n6. Leia a resposta inteira do sistema.\n7. Se aceito, confirme assento, boarding pass e bagagem.\n\nRespostas e conduta\n- Check-in successful/accepted: passageiro aceito; emitir ou confirmar cartao de embarque.\n- Warning/edit: leia a pendencia antes de continuar.\n- Missing document/data: complete o dado obrigatorio e tente novamente.\n- Not allowed/rejected: nao force; validar regra, supervisor ou suporte.\n- Printer failed: nao repetir sem checar impressora/fila para evitar duplicidade."
  },
  {
    "title": "Assentos: mapa, troca, bloqueio e restricao",
    "type": "Assento",
    "duration": "28 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/sabre-interact/sabre-interact-trilha-05.png?v=sabre-safe-layout-2",
        "title": "Imagem didatica autoral - assentos",
        "caption": "Mapa didatico para escolha/troca de assento, com restricao e resposta do sistema."
      }
    ],
    "content": "Objetivo da trilha\nTratar assento sem violar regra comercial, seguranca ou prioridade operacional.\n\nOnde clicar ou acessar\n- F2 Check-in para escolher assento durante aceite.\n- Seat Map para abrir o mapa grafico quando disponivel.\n- Change Seat para alterar assento de passageiro ja localizado.\n- Passenger List -> linha do passageiro -> acao de assento quando a lista estiver aberta.\n- F3 Boarding quando a correcao de assento ocorrer no portao.\n\nComo executar na pratica\n1. Localize o passageiro correto.\n2. Abra Seat Map ou funcao de assento.\n3. Verifique assentos livres, ocupados, bloqueados, pagos/restritos e saida de emergencia.\n4. Selecione o assento permitido.\n5. Confirme a troca e leia a resposta.\n6. Reimprima ou atualize o cartao de embarque se necessario.\n\nQuando usar\nPedido de troca, familia separada, passageiro com assistencia, reacomodacao, mudanca de aeronave, portao ou divergencia de cartao.\n\nRespostas e conduta\n- Seat confirmed: informe o novo assento.\n- Seat not available: ofereca alternativa real.\n- Restricted/chargeable: aplique regra comercial antes de confirmar.\n- Emergency exit restriction: confira criterios fisicos, idioma/compreensao e politica da companhia.\n- Seat already occupied: retorne ao mapa e evite sobrescrever sem autorizacao."
  },
  {
    "title": "Bagagem: inserir volume, peso e etiqueta",
    "type": "Bagagem",
    "duration": "34 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/sabre-interact/sabre-interact-trilha-06.png?v=sabre-safe-layout-2",
        "title": "Imagem didatica autoral - bagagem",
        "caption": "Fluxo didatico de inclusao de bagagem, peso, destino e etiqueta."
      }
    ],
    "content": "Objetivo da trilha\nEnsinar a inserir bagagem no atendimento, conferindo volume, peso, destino e etiqueta.\n\nOnde clicar ou acessar\n- F2 Check-in durante aceite ou regularizacao de bagagem.\n- Bag Tags / Bagagem na lista do passageiro quando disponivel.\n- AB ou B para inclusao de bagagem conforme configuracao da companhia.\n- MB para bag tag manual/pre-impressa quando o fluxo permitir.\n- Print Bag Tag para imprimir etiqueta automatica quando habilitado.\n\nCampos que normalmente devem ser preenchidos\nQuantidade de volumes, peso, destino final, numero de etiqueta manual quando aplicavel, trecho, passageiro vinculado e observacoes de item especial.\n\nComo executar na pratica\n1. Localize o passageiro correto.\n2. Confirme destino e conexao antes de etiquetar.\n3. Pese a bagagem e informe quantidade/peso.\n4. Use AB/B ou a funcao Bag Tags da tela.\n5. Se o sistema pedir tag manual, informe o numero exatamente como impresso.\n6. Leia a resposta e confira etiqueta, destino e recibo com o passageiro.\n\nRespostas e conduta\n- Tag issued/printed: confira nome, voo, destino, numero e peso.\n- Enter bag tag #: digite etiqueta manual somente se autorizado.\n- Excess/weight alert: aplicar franquia/cobranca antes de aceitar.\n- Print failed: verificar impressora/fila antes de repetir.\n- Bag already exists: pesquisar antes de criar outro volume."
  },
  {
    "title": "Pesquisar bagagem e exibir lista por passageiro ou etiqueta",
    "type": "Pesquisa de bagagem",
    "duration": "30 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/sabre-interact/sabre-interact-trilha-07.png?v=sabre-safe-layout-2",
        "title": "Imagem didatica autoral - pesquisa de bagagem",
        "caption": "Consulta didatica de totais, bagagem por passageiro, franquia e pesquisa por etiqueta."
      }
    ],
    "content": "Objetivo da trilha\nEvitar duplicidade e orientar corretamente o passageiro consultando a bagagem ja registrada.\n\nOnde clicar ou acessar\n- F2 Check-in quando a consulta for no balcao.\n- Passenger List -> selecione a linha -> funcao Bag Tags/Bagagem.\n- .B para consultar totais/lista de bagagem quando disponivel.\n- .B1 para exibir bagagens do passageiro da linha 1.\n- .B/<numero da etiqueta> para pesquisar por etiqueta.\n- .BA ou .BA1 para consultar franquia/allowance quando disponivel.\n\nComo pesquisar na pratica\n1. Carregue o voo e localize o passageiro.\n2. Consulte .B1 ou a funcao de bagagem do passageiro antes de reimprimir ou incluir volume.\n3. Se o passageiro apresenta comprovante, pesquise por .B/<bagtag>.\n4. Compare numero da etiqueta, nome, destino, peso, status e data.\n5. So depois responda se a bagagem esta registrada, duplicada, pendente ou divergente.\n\nQuando usar\nReimpressao, duvida sobre destino, mala nao aparece no recibo, etiqueta manual, excesso, conexao, divergencia de quantidade ou comprovante apresentado no portao.\n\nRespostas e conduta\n- Bag found: confirme passageiro, voo, destino e status.\n- No bag found: revise numero, data, companhia e trecho antes de afirmar que nao existe.\n- Multiple/unclear: nao orientar com certeza; chamar apoio.\n- Allowance exceeded: aplicar regra da companhia.\n- Bag exists for another passenger: parar e acionar supervisor."
  },
  {
    "title": "Rush bag e criacao de rush tag",
    "type": "Excecao de bagagem",
    "duration": "30 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/sabre-interact/sabre-interact-trilha-08.png?v=sabre-safe-layout-2",
        "title": "Imagem didatica autoral - rush tag",
        "caption": "Fluxo didatico para encaminhamento autorizado de bagagem fora do fluxo normal."
      }
    ],
    "content": "Objetivo da trilha\nEnsinar quando usar rush bag/rush tag sem confundir com check-in normal de bagagem.\n\nOnde clicar ou acessar\n- Funcao de bagagem ou modulo autorizado pela companhia para Rush Tag.\n- Pesquisa de bagagem antes de criar rush: .B, .B1 ou .B/<bagtag> quando disponivel.\n- Campos Route/Flight/Date para informar rota, voo e data de encaminhamento.\n- Campo Remarks/History para registrar motivo e responsavel quando existir.\n\nComo executar na pratica\n1. Pesquise a etiqueta original antes de criar qualquer rush.\n2. Confirme passageiro, destino final, aeroporto onde a mala esta e voo disponivel.\n3. Abra a funcao Rush Tag apenas se houver autorizacao.\n4. Preencha origem, destino, voo, data, motivo e referencia da etiqueta original.\n5. Gere/imprima a rush tag.\n6. Registre historico e entregue a mala ao fluxo correto.\n\nQuando usar\nBagagem localizada apos partida, mala separada do passageiro, conexao perdida da mala, envio posterior autorizado ou regularizacao conduzida pelo setor de bagagem.\n\nRespostas e conduta\n- Rush tag created: conferir rota, voo, data, destino e motivo.\n- Existing tag found: avaliar atualizacao/encaminhamento antes de duplicar.\n- Missing routing: completar dados obrigatorios.\n- Restricted/not authorized: acionar supervisor ou setor de bagagem.\n- No flight available: nao prometer envio sem alternativa confirmada."
  },
  {
    "title": "SSR, APIS e documentos no atendimento",
    "type": "Documentos e servicos",
    "duration": "32 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/sabre-interact/sabre-interact-trilha-09.png?v=sabre-safe-layout-2",
        "title": "Imagem didatica autoral - SSR e documentos",
        "caption": "Fluxo didatico para leitura e inclusao de SSR, DOC, DOCS e alertas documentais."
      }
    ],
    "content": "Objetivo da trilha\nTratar servicos especiais e documentos obrigatorios antes de aceitar ou embarcar passageiro.\n\nOnde clicar ou acessar\n- F2 Check-in para leitura de pendencias antes do aceite.\n- Passenger Details para abrir dados completos do passageiro.\n- SSR para visualizar/registrar servico especial quando o perfil permitir.\n- DOC para inserir documento de viagem.\n- .DOC para visualizar documento ja registrado.\n- DOCS para consultar tipos de documento validos quando disponivel.\n\nComo executar na pratica\n1. Localize o passageiro.\n2. Abra Passenger Details e leia SSR, alerts, edits e documentos.\n3. Se houver APIS/documento pendente, abra DOC/DOCS conforme a tela.\n4. Preencha documento, validade, nacionalidade, data de nascimento, genero e demais campos exigidos pelo fluxo.\n5. Salve e leia a resposta.\n6. So aceite ou embarque depois que a pendencia estiver resolvida.\n\nQuando usar\nVoos internacionais, APIS, visto, endereco de destino, menor/infant, assistencia, cadeira de rodas, restricao medica ou alerta de seguranca/documento.\n\nRespostas e conduta\n- Document accepted/valid: seguir fluxo.\n- Missing/invalid: corrigir antes de aceitar.\n- SSR pending/requested: confirmar regra antes de prometer servico.\n- Security/government warning: parar e acionar procedimento.\n- Data mismatch: conferir documento fisico e cadastro antes de alterar."
  },
  {
    "title": "Embarque: board, unboard, zonas e passageiros pendentes",
    "type": "Embarque",
    "duration": "32 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/sabre-interact/sabre-interact-trilha-10.png?v=sabre-safe-layout-2",
        "title": "Imagem didatica autoral - embarque",
        "caption": "Fluxo didatico para board/unboard, passageiros embarcados, nao embarcados e zonas."
      }
    ],
    "content": "Objetivo da trilha\nControlar embarque lendo a resposta do sistema e evitando boarded indevido.\n\nOnde clicar ou acessar\n- F3 Boarding para operar no portao.\n- Funcao Boarding/Board quando o voo estiver liberado para embarque.\n- BRD | 1 para embarcar passageiro pela linha/sequencia 1 quando permitido.\n- BRD | 1X para desfazer embarque/unboard da linha 1 quando autorizado.\n- .QB para consultar passageiros embarcados.\n- .QN para consultar aceitos ainda nao embarcados.\n- .BZ para lista por zona/grupo quando configurado.\n\nComo executar na pratica\n1. Confirme voo, gate e status de boarding.\n2. Leia ou digite a sequencia/linha do passageiro.\n3. Execute BRD para embarcar ou use scanner/PDA quando disponivel.\n4. Leia a resposta na hora.\n5. Se houver erro, nao deixe o passageiro passar sem tratar.\n6. Use .QB, .QN e .BZ para fechamento e controle de pendencias.\n\nRespostas e conduta\n- ON/boarded: passageiro embarcado; conferir documento e assento se necessario.\n- Already onboard: investigar duplicidade ou leitura repetida.\n- Not checked in: direcionar para atendimento; nao embarcar.\n- Wrong flight/wrong date: parar e orientar corretamente.\n- Unboard confirmed: registrar motivo conforme regra."
  },
  {
    "title": "Operacoes: gate, status, standby, oversale e irregularidade",
    "type": "Operacoes",
    "duration": "34 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/sabre-interact/sabre-interact-trilha-11.png?v=sabre-safe-layout-2",
        "title": "Imagem didatica autoral - operacoes",
        "caption": "Fluxo didatico de operacoes: status de voo, gate, standby, oversale e irregularidade."
      }
    ],
    "content": "Objetivo da trilha\nMostrar como as funcoes de operacao influenciam check-in, embarque e atendimento ao passageiro.\n\nOnde clicar ou acessar\n- F4 Operations para funcoes operacionais liberadas por perfil.\n- Flight Details para consultar status, horario e gate.\n- Gate Edit / Flight-Gate Edit para alterar gate quando permitido.\n- Update Flight para atualizar status, ETD/ETA ou informacao operacional.\n- Set Boarding On para indicar inicio de embarque quando a operacao libera.\n- Standby/Oversale para acompanhar prioridade, liberacao e restricoes.\n\nComo executar na pratica\n1. Confirme se voce esta no voo correto.\n2. Abra Flight Details antes de alterar qualquer dado.\n3. Use Gate Edit/Update Flight somente se a informacao oficial ja foi liberada.\n4. Salve a alteracao e leia a resposta.\n5. Comunique equipe e passageiros com a mesma informacao do sistema.\n6. Em standby/oversale, nunca confirme assento sem retorno positivo.\n\nQuando usar\nAtraso, troca de portao, inicio de embarque, fechamento, standby, overbooking, cancelamento, retorno ao gate ou reacomodacao.\n\nRespostas e conduta\n- Status updated/gate updated: comunicar e registrar.\n- Permission denied: acionar responsavel.\n- Restriction active: nao forcar check-in/embarque.\n- Oversale/standby pending: nao prometer assento confirmado.\n- Flight closed: seguir procedimento de reabertura/escalonamento, se permitido."
  },
  {
    "title": "Checklist final de comandos e respostas",
    "type": "Avaliacao pratica",
    "duration": "26 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/sabre-interact/sabre-interact-trilha-12.png?v=sabre-safe-layout-2",
        "title": "Imagem didatica autoral - checklist final",
        "caption": "Checklist visual para consolidar comando, resposta e proximo passo em Sabre Interact."
      }
    ],
    "content": "Objetivo da trilha\nConsolidar a rotina: carregar voo, localizar passageiro, executar comando, ler resposta e confirmar proximo passo.\n\nRoteiro operacional completo\n1. F1 Flights: selecione ou confirme o voo.\n2. Flight Details: confira trecho, status, horario e gate.\n3. Psgr Lists / Shift+F2: abra a lista de passageiros.\n4. Passenger Details / Shift+F3: confirme o passageiro quando houver duvida.\n5. F2 Check-in: execute check-in, assento, bagagem, SSR ou documentos.\n6. F3 Boarding: embarque, desfaça embarque ou consulte pendencias.\n7. F4 Operations: trate status, gate, standby e oversale quando autorizado.\n\nPerguntas antes de confirmar\n- Estou no voo/data/gate corretos?\n- O passageiro foi identificado sem risco de homonimo?\n- O comando pertence a tela e ao contexto certo?\n- A resposta foi lida antes de repetir?\n- Bagagem, assento, SSR e documento ficaram coerentes?\n- No embarque, o status retornou boarded/ON ou erro?\n- Em irregularidade, a orientacao foi baseada no sistema e na regra?\n\nMensagens de parada\nWarning, no passenger found, no match, already onboard, not checked in, wrong flight, restricted, permission denied, printer failed, missing document, standby pending.\n\nExercicio final\nO instrutor apresenta cinco cenarios: check-in simples, bagagem manual, documento faltante, passageiro ja embarcado e voo em atraso. O aluno informa: aba correta, comando/funcao, campo a preencher, resposta esperada e conduta."
  }
]$modules_sabre$::jsonb,
    $labs_sabre$[
  {
    "label": "Biblioteca operacional",
    "href": "operational-library.html"
  }
]$labs_sabre$::jsonb,
    $quiz_sabre$[
  {
    "question": "Antes de executar qualquer acao no Sabre Interact, o agente deve:",
    "options": [
      "Confirmar voo, data, passageiro, status e tela correta",
      "Executar o comando mais rapido",
      "Ignorar warnings conhecidos",
      "Imprimir documentos antes de localizar o passageiro"
    ],
    "correct": 0
  },
  {
    "question": "A funcao Passenger Lists/Psgr Lists serve principalmente para:",
    "options": [
      "Exibir passageiros do voo com filtros operacionais",
      "Criar uma etiqueta rush automaticamente",
      "Fechar o voo sem permissao",
      "Substituir a leitura do documento"
    ],
    "correct": 0
  },
  {
    "question": "Quando a busca retorna varios passageiros parecidos, a conduta correta e:",
    "options": [
      "Comparar dados antes de selecionar: voo, destino, assento, documento e status",
      "Escolher o primeiro nome da lista",
      "Criar novo registro",
      "Encerrar atendimento"
    ],
    "correct": 0
  },
  {
    "question": "O comando C/C1 no contexto de check-in esta relacionado a:",
    "options": [
      "Aceitar/check-in de passageiro conforme tela e permissao",
      "Pesquisar bagagem extraviada no WorldTracer",
      "Trocar gate de voo sempre",
      "Enviar mensagem teletype obrigatoria"
    ],
    "correct": 0
  },
  {
    "question": "Uma resposta warning durante check-in exige:",
    "options": [
      "Leitura e decisao antes de prosseguir",
      "Repetir Enter ate aceitar",
      "Ignorar se a fila estiver grande",
      "Embarcar o passageiro imediatamente"
    ],
    "correct": 0
  },
  {
    "question": "Em assentos, restricted ou chargeable indica que o agente deve:",
    "options": [
      "Aplicar regra antes de confirmar o assento",
      "Prometer o assento ao passageiro",
      "Apagar o passageiro da lista",
      "Criar rush tag"
    ],
    "correct": 0
  },
  {
    "question": "AB/B/MB estao ligados ao fluxo de:",
    "options": [
      "Bagagem e etiqueta conforme configuracao da companhia",
      "APIS e documento internacional",
      "Unboard de passageiro",
      "Oversale de voo"
    ],
    "correct": 0
  },
  {
    "question": "Antes de reimprimir ou criar nova etiqueta de bagagem, o agente deve:",
    "options": [
      "Consultar a bagagem ja registrada por passageiro ou etiqueta",
      "Criar uma segunda etiqueta sem conferir",
      "Ignorar numero da etiqueta anterior",
      "Usar qualquer destino"
    ],
    "correct": 0
  },
  {
    "question": ".B/<bagtag> e usado para:",
    "options": [
      "Pesquisar informacao associada a uma etiqueta de bagagem",
      "Embarcar passageiro por zona",
      "Inserir visto APIS",
      "Alterar status do voo"
    ],
    "correct": 0
  },
  {
    "question": "Rush tag deve ser usada quando:",
    "options": [
      "Ha encaminhamento autorizado de bagagem fora do fluxo normal",
      "O passageiro quer trocar assento",
      "A fila esta longa",
      "Nao ha voo carregado"
    ],
    "correct": 0
  },
  {
    "question": "DOC, .DOC e DOCS apoiam principalmente:",
    "options": [
      "Inclusao, visualizacao e lista de documentos quando disponivel",
      "Troca de portao",
      "Lista de bagagens por etiqueta",
      "Cancelamento de check-in"
    ],
    "correct": 0
  },
  {
    "question": "BRD | 1 representa:",
    "options": [
      "Embarcar passageiro pela sequencia/linha quando permitido",
      "Incluir uma mala manual",
      "Abrir mapa de assentos",
      "Consultar franquia de bagagem"
    ],
    "correct": 0
  },
  {
    "question": "BRD | 1X deve ser tratado como:",
    "options": [
      "Unboard/desfazer embarque com autorizacao e motivo",
      "Check-in automatico",
      "Criacao de rush tag",
      "Busca por nome"
    ],
    "correct": 0
  },
  {
    "question": "Already onboard indica:",
    "options": [
      "Passageiro ja consta como embarcado e exige verificacao",
      "Mala aceita com excesso",
      "Documento valido",
      "Assento livre"
    ],
    "correct": 0
  },
  {
    "question": "Update Flight/Gate edit deve ser usado por quem tem:",
    "options": [
      "Permissao e responsabilidade operacional para alterar status/gate",
      "Qualquer aluno sem supervisao",
      "Passageiro no totem",
      "Somente setor comercial fora do aeroporto"
    ],
    "correct": 0
  },
  {
    "question": "Em standby/oversale, o agente nao deve:",
    "options": [
      "Prometer assento antes da confirmacao do sistema",
      "Explicar status ao passageiro",
      "Acompanhar lista",
      "Acionar supervisor se necessario"
    ],
    "correct": 0
  },
  {
    "question": "A regra de ouro do curso e:",
    "options": [
      "Toda resposta do sistema deve ser lida antes do proximo passo",
      "Todo erro deve ser ignorado",
      "Toda bagagem deve virar rush",
      "Todo passageiro deve ser embarcado sem status"
    ],
    "correct": 0
  }
]$quiz_sabre$::jsonb,
    $cover_sabre$../assets/academy-screenshots/sabre-interact/sabre-interact-trilha-01.png?v=sabre-safe-layout-2$cover_sabre$,
    $material_sabre$Sabre Interact - Curso pratico de atendimento aeroportuario

Resumo
Curso objetivo para treinar uso operacional do Sabre Interact/SabreSonic em ambiente aeroportuario: voo, listas, passageiro, check-in, assento, bagagem, documentos, embarque e operacoes.

Comandos e funcoes estudados
Flights/F1 - acompanhar voo, listas e detalhes operacionais.
Check-in/F2 - pesquisar passageiro, aceitar, tratar assento, bagagem, SSR e documentos.
Boarding/F3 - controlar embarque, boarded/unboarded, zonas e passageiros pendentes.
Operations/F4 - acompanhar status de voo, gate, standby, oversale, irregularidade e atualizacoes operacionais.
Passenger Lists/Psgr Lists - exibir passageiros do voo e aplicar filtros.
Passenger Details/Psgr Details - abrir dados do passageiro selecionado.
C / C1 / C1/8A - aceitar passageiro/check-in e, quando permitido, associar assento.
Seat Map / Change Seat / Offload Seat - consultar, atribuir, trocar ou devolver assento conforme regra.
AB / B / MB - incluir bagagem ou bagagem com etiqueta manual/pre-impressa conforme configuracao.
.B / .B1 / .B/<bagtag> / .BA - consultar totais, bagagem por passageiro, etiqueta e franquia.
Rush tag - encaminhamento autorizado de bagagem fora do fluxo normal, com rota, voo, data e motivo.
SSR / DOC / .DOC / DOCS - consultar/inserir servicos especiais e documentos.
BRD | 1 / BRD | 1X / .QB / .QN / .BZ - embarcar, desfazer embarque, listar embarcados, pendentes e zonas.
Update Flight / Gate edit / Set Boarding On - atualizar status/gate quando o perfil permite.

Regra de ouro
Nao execute comando por habito. Leia a resposta. Warning, no match, no passenger found, already onboard, not checked in, wrong flight, restricted, permission denied, printer failed, missing document e standby pending sao mensagens de parada.

Referencias do conteudo
- Sabre Developer Hub - Check-In APIs. Referencia publica sobre integracao de funcionalidades de check-in no ecossistema Sabre. Link: https://developer.sabre.com/
- SabreSonic Interact for Airport Training Guide, pagina publica indexada no SlideShare/Scribd. Usado apenas como referencia tematica publica para abas e funcoes; imagens proprietarias nao foram copiadas. Link: https://es.slideshare.net/slideshow/comprehensive-training-guide-for-sabresonic-airport-check-in-operations/288438791
- Sabre Format Guide/Airport Check-in, pagina publica indexada no CourseHero. Usado como referencia publica para categorias de comandos de check-in, bagagem, embarque e passageiros; sem reproducao integral. Link: https://www.coursehero.com/file/136447772/Sabre/

Observacao
As imagens deste curso sao didaticas e autorais. Elas nao sao prints oficiais do Sabre e nao reproduzem telas proprietarias. Nomes de comandos, permissoes e respostas podem variar por companhia, versao, ambiente e perfil de usuario. O curso nao substitui treinamento oficial Sabre, manual interno da companhia ou validacao de supervisor.$material_sabre$,
    500
)
on conflict (id) do update set
    title = excluded.title,
    eyebrow = excluded.eyebrow,
    category = excluded.category,
    level = excluded.level,
    duration = excluded.duration,
    color = excluded.color,
    summary = excluded.summary,
    modules = excluded.modules,
    labs = excluded.labs,
    quiz = excluded.quiz,
    cover_path = excluded.cover_path,
    material = excluded.material,
    sort_order = excluded.sort_order;

select id, title, jsonb_array_length(modules::jsonb) as trilhas, jsonb_array_length(quiz::jsonb) as questoes
from public.academy_courses
where id = 'sabre-interact-atendimento-aeroportuario';

