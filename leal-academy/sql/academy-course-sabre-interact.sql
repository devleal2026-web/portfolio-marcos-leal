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
        "src": "../assets/academy-screenshots/sabre-interact/sabre-interact-trilha-01.png?v=c47980b",
        "title": "Imagem didatica autoral - mapa do Interact",
        "caption": "Visao didatica das abas e fluxo de trabalho do Interact: voo, check-in, embarque e operacoes."
      }
    ],
    "content": "Objetivo da trilha\nEntender o Sabre Interact como ambiente operacional de aeroporto, com abas de voo, check-in, embarque e operacoes.\n\nFuncoes de referencia\n- Flights/F1: acompanhar voo, listas e detalhes.\n- Check-in/F2: localizar passageiro, aceitar, tratar assento, bagagem e documentos.\n- Boarding/F3: controlar embarque, passageiros boarded/unboarded e zonas.\n- Operations/F4: atualizar status de voo, gate, irregularidade, oversale e listas operacionais.\n\nQuando usar\nUse esse mapa mental antes de executar qualquer comando: primeiro identifique o voo e passageiro; depois escolha a funcao; por fim leia a resposta do sistema.\n\nRespostas e conduta\n- Tela correta: prossiga com a validacao.\n- Sem permissao: acione supervisor.\n- Resultado vazio: revise voo, data, nome, assento ou sequencia.\n- Warning: pare, leia e decida antes de confirmar."
  },
  {
    "title": "Carregar voo, consultar listas e totais",
    "type": "Lista operacional",
    "duration": "28 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/sabre-interact/sabre-interact-trilha-02.png?v=c47980b",
        "title": "Imagem didatica autoral - listas do voo",
        "caption": "Fluxo visual para carregar voo, consultar listas, filtros e totais antes da acao."
      }
    ],
    "content": "Objetivo da trilha\nEnsinar o aluno a iniciar o atendimento carregando o voo correto e lendo listas antes de agir.\n\nComandos/funcoes\n- Passenger Lists/Psgr Lists: exibe passageiros do voo com filtros.\n- Flight Details: mostra dados do voo, gate, status e historico.\n- Totals/U: consulta totais operacionais quando disponivel.\n- Standby list/.S: exibe passageiros standby conforme configuracao da companhia.\n\nQuando usar\nNo inicio do turno, antes do check-in, no portao, em atraso, em oversale ou quando houver divergencia entre passageiro, voo e status.\n\nRespostas e conduta\n- Lista carregada: confira voo, data, origem/destino e status.\n- Lista vazia: revise voo/data ou permissao.\n- Passageiro em filtro errado: altere filtro antes de concluir que ele nao esta no voo."
  },
  {
    "title": "Pesquisar passageiro por nome, assento, linha ou localizador",
    "type": "Busca de passageiro",
    "duration": "30 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/sabre-interact/sabre-interact-trilha-03.png?v=c47980b",
        "title": "Imagem didatica autoral - busca de passageiro",
        "caption": "Pesquisa segura por diferentes chaves: nome, assento, linha, localizador ou documento quando permitido."
      }
    ],
    "content": "Objetivo da trilha\nLocalizar o passageiro certo antes de check-in, assento, bagagem, documento ou embarque.\n\nComandos/funcoes\n- Passenger Details/Psgr Details: abre detalhes do passageiro.\n- Pesquisa por nome: usar quando nao ha documento de viagem completo ou localizador.\n- Pesquisa por assento/linha: usar a partir da lista exibida.\n- Pesquisa por record/localizador: usar quando o passageiro apresenta comprovante.\n\nQuando usar\nSempre antes de qualquer alteracao. Homonimos e grupos exigem dupla conferencia.\n\nRespostas e conduta\n- Um resultado exato: confirmar nome, voo, data e destino.\n- Multiplos resultados: comparar assento, destino, documento e status.\n- No match/no passenger found: revisar grafia, voo, data e filtro; nao criar acao sem localizar corretamente."
  },
  {
    "title": "Check-in do passageiro: comando C e aceite operacional",
    "type": "Comando principal",
    "duration": "32 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/sabre-interact/sabre-interact-trilha-04.png?v=c47980b",
        "title": "Imagem didatica autoral - check-in",
        "caption": "Fluxo didatico do aceite de passageiro: comando, validacao, resposta e proximo passo."
      }
    ],
    "content": "Objetivo da trilha\nEnsinar o aceite/check-in usando comandos e respostas do sistema, sem automatismo perigoso.\n\nComandos/funcoes\n- C: comando de check-in/aceite conforme contexto do passageiro ou lista.\n- C1: aceita o passageiro da linha 1 quando o voo/lista esta carregado e permitido.\n- C1/8A: exemplo de aceite com atribuicao de assento, quando aceito pela regra.\n- Follow-up from list/seat map: continuar uma acao iniciada por lista ou mapa.\n\nQuando usar\nApos confirmar identidade, voo, data, documentos, assento, bagagem, SSR e alertas.\n\nRespostas e conduta\n- Accepted/checked in: confirmar cartao, assento, bagagem e orientacao.\n- Warning/edit: ler motivo antes de prosseguir.\n- Not allowed/rejected: nao insistir; validar regra ou supervisor.\n- Missing document/data: completar dados obrigatorios antes de aceitar."
  },
  {
    "title": "Assentos: mapa, troca, bloqueio e restricao",
    "type": "Assento",
    "duration": "28 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/sabre-interact/sabre-interact-trilha-05.png?v=c47980b",
        "title": "Imagem didatica autoral - assentos",
        "caption": "Mapa didatico para escolha/troca de assento, com restricao e resposta do sistema."
      }
    ],
    "content": "Objetivo da trilha\nTratar assento sem violar regra comercial, seguranca ou prioridade operacional.\n\nComandos/funcoes\n- Seat Map: consultar disponibilidade.\n- Change Seat: alterar assento atribuido quando permitido.\n- Offload/return seat: devolver/cancelar assento quando o fluxo exigir.\n- Seat from list: atuar a partir do passageiro selecionado na lista.\n\nQuando usar\nNo check-in, portao, reacomodacao, familia/grupo, assistencia especial ou pedido de troca.\n\nRespostas e conduta\n- Seat confirmed: confirmar novo assento e emitir/reimprimir cartao se necessario.\n- Seat not available: oferecer alternativa real.\n- Restricted/chargeable: aplicar regra antes de confirmar.\n- Emergency exit restriction: validar aptidao e politicas antes de atribuir."
  },
  {
    "title": "Bagagem: inserir volume, peso e etiqueta",
    "type": "Bagagem",
    "duration": "34 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/sabre-interact/sabre-interact-trilha-06.png?v=c47980b",
        "title": "Imagem didatica autoral - bagagem",
        "caption": "Fluxo didatico de inclusao de bagagem, peso, destino e etiqueta."
      }
    ],
    "content": "Objetivo da trilha\nEnsinar a inserir bagagem no atendimento, conferir destino e interpretar a resposta antes de entregar etiqueta.\n\nComandos/funcoes\n- AB ou B: check-in/inclusao de bagagem conforme configuracao da companhia.\n- MB: uso com bag tag manual/pre-impressa quando aplicavel.\n- Bag tag print: impressao de etiqueta automatica quando habilitada.\n- Update bags: corrigir quantidade, peso ou dados permitidos.\n\nQuando usar\nDurante check-in, drop-off, regularizacao de etiqueta, bagagem pre-impressa, conexao, excesso ou item especial.\n\nRespostas e conduta\n- Tag issued: conferir numero, nome, destino e peso.\n- Enter bag tag #: inserir etiqueta manual somente quando o fluxo permitir.\n- Excess/weight alert: aplicar regra de franquia/cobranca.\n- Print failed: verificar impressora e registro antes de repetir."
  },
  {
    "title": "Pesquisar bagagem e exibir lista por passageiro ou etiqueta",
    "type": "Pesquisa de bagagem",
    "duration": "30 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/sabre-interact/sabre-interact-trilha-07.png?v=c47980b",
        "title": "Imagem didatica autoral - pesquisa de bagagem",
        "caption": "Consulta didatica de totais, bagagem por passageiro, franquia e pesquisa por etiqueta."
      }
    ],
    "content": "Objetivo da trilha\nEvitar duplicidade e orientar corretamente o passageiro consultando a bagagem ja registrada.\n\nComandos/funcoes\n- .B: exibe totais de bagagem do voo quando disponivel.\n- .B1: exibe bagagens do passageiro da linha 1.\n- .B/<bagtag>: pesquisa informacao vinculada a uma etiqueta.\n- .BA ou .BA1: consulta franquia/allowance de bagagem quando disponivel.\n\nQuando usar\nAntes de reimprimir etiqueta, incluir novo volume, responder sobre destino, tratar divergencia de quantidade ou localizar mala por comprovante.\n\nRespostas e conduta\n- Bag found: conferir passageiro, voo, data, destino e status.\n- No bag found: revisar numero, voo, companhia e data.\n- Multiple/unclear: nao orientar com certeza; acionar apoio.\n- Allowance exceeded: aplicar regra da companhia antes de aceitar."
  },
  {
    "title": "Rush bag e criacao de rush tag",
    "type": "Excecao de bagagem",
    "duration": "30 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/sabre-interact/sabre-interact-trilha-08.png?v=c47980b",
        "title": "Imagem didatica autoral - rush tag",
        "caption": "Fluxo didatico para encaminhamento autorizado de bagagem fora do fluxo normal."
      }
    ],
    "content": "Objetivo da trilha\nEnsinar quando usar rush bag/rush tag sem confundir com check-in normal de bagagem.\n\nComandos/funcoes\n- Rush tag/RUSH: preparar etiqueta de encaminhamento conforme permissao da companhia.\n- Search bag before rush: pesquisar etiqueta existente antes de criar outra.\n- Route/flight/date: preencher rota, voo e data de envio.\n- Remarks/history: registrar motivo e responsavel quando o sistema permitir.\n\nQuando usar\nBagagem separada do passageiro, mala localizada apos partida, conexao perdida de bagagem ou envio posterior autorizado.\n\nRespostas e conduta\n- Rush tag created: conferir rota, destino, voo, data e motivo.\n- Existing tag found: avaliar atualizacao/encaminhamento em vez de duplicar.\n- Missing routing: completar dados obrigatorios.\n- Restricted/not authorized: acionar supervisor ou setor de bagagem."
  },
  {
    "title": "SSR, APIS e documentos no atendimento",
    "type": "Documentos e servicos",
    "duration": "32 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/sabre-interact/sabre-interact-trilha-09.png?v=c47980b",
        "title": "Imagem didatica autoral - SSR e documentos",
        "caption": "Fluxo didatico para leitura e inclusao de SSR, DOC, DOCS e alertas documentais."
      }
    ],
    "content": "Objetivo da trilha\nTratar servicos especiais e documentos obrigatorios antes de aceitar ou embarcar passageiro.\n\nComandos/funcoes\n- SSR: exibe ou atribui codigos de servico especial conforme uso permitido.\n- DOC: inserir documento de viagem.\n- .DOC: visualizar documento ja registrado.\n- DOCS: listar tipos de documento validos quando disponivel.\n\nQuando usar\nVoos internacionais, passageiros com assistencia, menor, infant, APIS, visto, endereco de destino ou alerta de seguranca/documento.\n\nRespostas e conduta\n- Document accepted/valid: seguir fluxo.\n- Missing/invalid: corrigir antes de aceitar.\n- SSR pending/requested: confirmar regra antes de prometer.\n- Security/government warning: parar e acionar procedimento."
  },
  {
    "title": "Embarque: board, unboard, zonas e passageiros pendentes",
    "type": "Embarque",
    "duration": "32 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/sabre-interact/sabre-interact-trilha-10.png?v=c47980b",
        "title": "Imagem didatica autoral - embarque",
        "caption": "Fluxo didatico para board/unboard, passageiros embarcados, nao embarcados e zonas."
      }
    ],
    "content": "Objetivo da trilha\nControlar embarque lendo a resposta do sistema e evitando boarded indevido.\n\nComandos/funcoes\n- BRD | 1: embarca passageiro pela sequencia/linha quando permitido.\n- BRD | 1X: desfaz embarque/unboard quando autorizado.\n- .QB: exibe passageiros embarcados.\n- .QN: exibe passageiros aceitos e ainda nao embarcados.\n- .BZ: exibe lista por zona de embarque quando configurado.\n\nQuando usar\nNo portao, durante chamada por grupo/zona, fechamento de voo, divergencia de cartao, duplicidade ou passageiro embarcado por engano.\n\nRespostas e conduta\n- ON/boarded: passageiro embarcado; confirme assento e documento.\n- Already onboard: investigar duplicidade ou tentativa repetida.\n- Not checked in/wrong flight: nao embarcar; direcionar atendimento.\n- Unboard confirmed: registrar motivo conforme regra."
  },
  {
    "title": "Operacoes: gate, status, standby, oversale e irregularidade",
    "type": "Operacoes",
    "duration": "34 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/sabre-interact/sabre-interact-trilha-11.png?v=c47980b",
        "title": "Imagem didatica autoral - operacoes",
        "caption": "Fluxo didatico de operacoes: status de voo, gate, standby, oversale e irregularidade."
      }
    ],
    "content": "Objetivo da trilha\nMostrar como as funcoes de operacao influenciam check-in e embarque.\n\nComandos/funcoes\n- Update Flight: atualiza status de voo, gate, ETD/ETA e informacoes operacionais conforme permissao.\n- Set Boarding On: indica voo em embarque quando a operacao libera.\n- Standby/Oversale: acompanha liberacao, prioridade e restricoes.\n- Gate edit/Flight details: consulta ou altera dados operacionais conforme perfil.\n\nQuando usar\nAtraso, troca de portao, inicio de embarque, fechamento, standby, overbooking, cancelamento, retorno ao gate ou reacomodacao.\n\nRespostas e conduta\n- Status updated: comunicar equipe e passageiro com informacao coerente.\n- Permission denied: acionar responsavel.\n- Restriction active: nao forcar check-in/embarque.\n- Oversale/standby pending: nao prometer assento confirmado."
  },
  {
    "title": "Checklist final de comandos e respostas",
    "type": "Avaliacao pratica",
    "duration": "26 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/sabre-interact/sabre-interact-trilha-12.png?v=c47980b",
        "title": "Imagem didatica autoral - checklist final",
        "caption": "Checklist visual para consolidar comando, resposta e proximo passo em Sabre Interact."
      }
    ],
    "content": "Objetivo da trilha\nConsolidar a rotina: carregar voo, localizar passageiro, executar comando, ler resposta e confirmar proximo passo.\n\nChecklist operacional\n- O voo/data/gate estao corretos?\n- O passageiro foi identificado sem risco de homonimo?\n- O comando pertence a tela/contexto correto?\n- A resposta foi lida antes de repetir?\n- Bagagem, assento, SSR e documento ficaram coerentes?\n- No embarque, o status retornou boarded/ON ou erro?\n- Em irregularidade, a orientacao foi baseada no sistema e na regra?\n\nMensagens de parada\nWarning, no passenger found, no match, already onboard, not checked in, wrong flight, restricted, permission denied, printer failed, missing document, standby pending.\n\nExercicio final\nO instrutor apresenta cinco cenarios: check-in simples, bagagem manual, documento faltante, passageiro ja embarcado e voo em atraso. O aluno informa comando/funcao, resposta esperada e proximo passo."
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
    $cover_sabre$../assets/academy-screenshots/sabre-interact/sabre-interact-trilha-01.png?v=c47980b$cover_sabre$,
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

