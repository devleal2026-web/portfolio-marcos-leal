-- Curso novo: Amadeus Altea pratico em portugues Brasil.
-- Base: Manual Amadeus Altea _210401_140055.pdf, fornecido pelo usuario, e referencias publicas Amadeus/IATA.
-- Este script altera somente o registro id = 'amadeus-altea-atendimento-aeroportuario'.
-- Nao altera cursos existentes nem interfere nos simuladores.

grant usage on schema public to anon, authenticated;
grant select on public.academy_courses to anon, authenticated;

alter table public.academy_courses
    add column if not exists category text;

insert into public.academy_courses (
    id, title, eyebrow, category, level, duration, color, summary, modules, labs, quiz, cover_path, material, sort_order
)
values (
    'amadeus-altea-atendimento-aeroportuario',
    'Amadeus Altea - Comandos de Atendimento',
    'DCS na pratica',
    'atendimento',
    'Intermediario',
    '5h40',
    '#0f4c81',
    'Curso pratico em portugues Brasil para ensinar o aluno a usar o Amadeus Altea no atendimento aeroportuario: comandos, atalhos, acoes de tela, quando usar, respostas esperadas, erros comuns e proximos passos.',
    $modules_amadeus$[
  {
    "title": "Mapa de uso: telas, atalhos e respostas do Altea",
    "type": "Fundamento pratico",
    "duration": "20 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/amadeus-altea/manual-amadeus-007.png",
        "title": "Print do manual Amadeus Altea - pagina 7",
        "caption": "Pagina do manual sobre Amadeus Information Pages e ajuda/consulta, compativel com a trilha de navegacao e apoio ao operador."
      }
    ],
    "content": "Objetivo da trilha\nEnsinar o aluno a pensar como operador de Amadeus Altea: toda acao gera uma resposta do sistema, e toda resposta exige decisao operacional.\n\nComandos e acoes desta trilha\n- CTRL+H ou aplicacao Customer: abre a area de identificacao e atendimento do passageiro.\n- Menu Applications: abre aplicacoes disponiveis conforme permissao do usuario.\n- HELP ou ajuda online: consulta orientacao do sistema quando o agente nao sabe o proximo passo.\n- Campo de pesquisa: localiza passageiro, voo, reserva ou produto conforme tela aberta.\n\nQuando usar\nUse no inicio do atendimento, antes de aceitar passageiro, alterar assento, tratar bagagem, verificar SSR ou liberar embarque.\n\nRespostas esperadas\n- Tela correta abre: continue a conferencia.\n- Tela nao abre: usuario pode nao ter perfil/permissao. Acione supervisor.\n- Mensagem de erro: leia a mensagem antes de repetir a acao.\n- Resultado vazio: revise dados de pesquisa, data, voo e grafia.\n\nExercicio\nSimule um passageiro no balcao. O aluno deve dizer qual tela abrir, qual dado usar para pesquisa e qual resposta do sistema permitiria continuar."
  },
  {
    "title": "Identificar passageiro: Customer e busca basica",
    "type": "Comando guiado",
    "duration": "26 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/amadeus-altea/manual-amadeus-047.png",
        "title": "Print do manual Amadeus Altea - pagina 47",
        "caption": "Pagina do manual sobre recuperacao de PNR por localizador, nome, voo, data e bilhete, compativel com identificacao e busca de passageiro."
      }
    ],
    "content": "Objetivo da trilha\nEnsinar a localizar o passageiro certo antes de qualquer alteracao.\n\nComando/acao\n- CTRL+H: abre Customer/Identificacao do cliente quando disponivel no perfil.\n- Pesquisa por nome + voo: usar quando o passageiro nao apresenta localizador.\n- Pesquisa por localizador/PNR: usar quando ha comprovante de reserva.\n- Pesquisa por voo/lista: usar no balcao ou portao quando o passageiro esta no voo do dia.\n\nPara que serve\nEncontrar o Customer Product Record ou registro equivalente do passageiro no ambiente de DCS/reserva.\n\nQuando usar\nSempre antes de check-in, alteracao de assento, inclusao de bagagem, leitura de SSR, embarque ou reacomodacao.\n\nRespostas do sistema e conduta\n- No match/no customer found: conferir grafia, data, voo, sobrenome e localizador. Se persistir, procurar por outro dado ou acionar apoio.\n- Um resultado exato: confirmar nome completo, documento, voo, data, origem e destino antes de abrir.\n- Multiplos resultados: comparar sobrenome, iniciais, destino, horario e documento. Nunca escolher por aparencia da lista.\n- Registro bloqueado ou sem permissao: nao contornar; chamar supervisor.\n\nSimulacao\nPassageiro informa apenas sobrenome SILVA e voo 1234. O aluno deve explicar como reduzir risco de homonimo antes de selecionar o registro."
  },
  {
    "title": "Ler a ficha do passageiro e a tabela de produtos",
    "type": "Leitura operacional",
    "duration": "24 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/amadeus-altea/manual-amadeus-049.png",
        "title": "Print do manual Amadeus Altea - pagina 49",
        "caption": "Pagina do manual com opcoes de exibicao do PNR, segmentos e informacoes do passageiro, compativel com leitura da ficha antes da acao."
      }
    ],
    "content": "Objetivo da trilha\nEnsinar o aluno a interpretar a ficha do passageiro antes de executar comandos.\n\nComandos/acoes\n- Abrir Customer View ou ficha do passageiro selecionado.\n- Expandir detalhes do produto/trecho quando houver conexao.\n- Consultar historico/comentarios quando a tela indicar informacao importante.\n\nPara que serve\nVerificar se o passageiro esta reservado, aceito, pendente, em standby, com servico especial, com conexao, com assento, com bagagem ou com alerta.\n\nQuando usar\nDepois da identificacao e antes de check-in, embarque, troca de assento ou qualquer promessa ao passageiro.\n\nRespostas e interpretacao\n- Status reservado/nao aceito: passageiro ainda precisa passar pelo aceite.\n- Status aceito: verificar cartao, assento, bagagem e portao.\n- Standby: nao prometer assento confirmado. Explicar que depende de liberacao.\n- Conexao onward: conferir se os trechos seguintes tambem precisam de aceite ou orientacao.\n- Comentario/alerta alto: ler antes de agir.\n\nExercicio\nDiante de uma ficha com voo aceito, assento vazio e SSR WCHR, o aluno deve listar quais pontos confirmar antes de encerrar."
  },
  {
    "title": "Aceitar passageiro: check-in no Customer Acceptance",
    "type": "Operacao principal",
    "duration": "30 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/amadeus-altea/manual-amadeus-050.png",
        "title": "Print do manual Amadeus Altea - pagina 50",
        "caption": "Pagina do manual sobre status de segmentos, incluindo accepted/waitlist/no/uc, compativel com decisao operacional antes/depois do aceite."
      }
    ],
    "content": "Objetivo da trilha\nEnsinar o aluno a realizar aceite/check-in com criterio.\n\nComandos/acoes\n- Accept: confirma o aceite do passageiro no voo.\n- Enter na tela de aceite: em muitos fluxos ativa o botao principal quando todos os campos exigidos estao completos.\n- Cancel/Back: abandona a acao quando os dados nao estao corretos.\n- Advanced Options: abre opcoes como standby, through check-in ou selecao de voos especificos quando disponiveis.\n\nPara que serve\nRegistrar que o passageiro foi aceito para embarque, permitindo emissao de cartao e continuidade do fluxo.\n\nQuando usar\nApos validar identidade, documento, bilhete/reserva, voo correto, regras aplicaveis, assento, bagagem e SSR.\n\nRespostas e conduta\n- Accepted/Check-in completed: emitir ou orientar cartao, confirmar portao/horario e bagagem.\n- Warning: ler antes de prosseguir. Pode envolver documento, assento, conexao, pagamento ou servico especial.\n- Rejected/Not allowed: nao insistir. Validar motivo e acionar supervisor se envolver recusa.\n- Missing mandatory data: preencher dados obrigatorios ou corrigir cadastro.\n\nSimulacao\nPassageiro internacional aparece com alerta documental. O aluno deve explicar por que nao deve clicar em Accept antes de validar o alerta."
  },
  {
    "title": "Comandos de assento: mapa, escolha e troca",
    "type": "Pratica de tela",
    "duration": "24 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/amadeus-altea/manual-amadeus-044.png",
        "title": "Print do manual Amadeus Altea - pagina 44",
        "caption": "Pagina do manual dedicada a Seat Map Display, compativel com mapa, escolha e troca de assento."
      }
    ],
    "content": "Objetivo da trilha\nEnsinar como tratar assentos no Altea sem criar conflito operacional.\n\nComandos/acoes\n- Open Seat Map/Seat Map: exibe mapa de assentos disponivel.\n- Seat preference: registra preferencia quando nao ha assento especifico.\n- Change seat: altera assento ja atribuido quando permitido.\n- Clear/cancel seat change: cancela tentativa se houver restricao ou erro.\n\nPara que serve\nSelecionar, confirmar ou alterar assento respeitando regra comercial e operacional.\n\nQuando usar\nNo check-in, no portao, em reacomodacao, em atendimento PNAE, em familia/grupo ou quando o passageiro solicita troca.\n\nRespostas e conduta\n- Seat confirmed: confirmar verbalmente/visualmente e emitir novo cartao se necessario.\n- Seat not available: oferecer alternativa real, nao prometer bloqueio.\n- Restricted seat: verificar saida de emergencia, passageiro com assistencia, menor, infant, regra de seguranca ou cobranca.\n- Chargeable seat: seguir politica da companhia antes de confirmar.\n\nExercicio\nPassageiro WCHR pede saida de emergencia. O aluno deve recusar a troca com base em seguranca e oferecer assento adequado."
  },
  {
    "title": "Bagagem no Altea: volumes, peso, etiqueta e lista",
    "type": "Oficina operacional",
    "duration": "34 min",
    "content": "Objetivo da trilha\nEnsinar o aluno a trabalhar a bagagem dentro do fluxo de atendimento: consultar a lista, inserir volume, conferir tipo, peso, destino, etiqueta e status antes de liberar o passageiro.\n\nComandos/acoes\n- Baggage/Bag tab: abre a area de bagagem do passageiro ou do produto selecionado.\n- Add bag/Register bag: inclui volume no atendimento.\n- Update baggage details: corrige quantidade, peso, destino, tipo ou informacao permitida pela companhia.\n- Baggage list/View bags: consulta a lista de volumes associados ao passageiro, voo ou atendimento.\n- Bag tag/Print tag: imprime etiqueta quando os dados estao corretos.\n- Reprint bag tag: reimprime somente quando permitido e com controle operacional.\n\nPara que serve\nGarantir que a mala esteja vinculada ao passageiro correto, ao voo correto, ao destino correto e ao numero de etiqueta correto.\n\nQuando usar\nDurante check-in, drop-off, conexao, regularizacao de etiqueta, excesso, item especial, reimpressao controlada ou duvida sobre volumes ja aceitos.\n\nRespostas e conduta\n- Bag accepted/tag issued: conferir numero da etiqueta, nome, voo, origem, destino final, quantidade e peso.\n- Baggage already exists: abrir a lista de bagagem antes de criar novo volume para evitar duplicidade.\n- Weight/excess warning: aplicar franquia, cobranca ou autorizacao conforme regra da companhia.\n- Destination/interline warning: confirmar se a mala segue ate o destino final ou se o passageiro deve retirar e redespachar.\n- Print failed: verificar impressora/status da etiqueta antes de repetir impressao.\n\nSimulacao\nPassageiro informa que ja despachou uma mala e quer incluir outra. O aluno deve abrir a lista de bagagem, confirmar a etiqueta existente e somente depois inserir o novo volume."
  },
  {
    "title": "Consultar e pesquisar bagagem por numero de etiqueta",
    "type": "Pesquisa operacional",
    "duration": "28 min",
    "content": "Objetivo da trilha\nEnsinar a localizar uma bagagem ja registrada sem criar nova etiqueta indevidamente.\n\nComandos/acoes\n- View bag/Baggage list: abre a lista de bagagens associadas ao passageiro ou ao voo.\n- Search bag by tag number: pesquisa pelo numero da etiqueta quando o passageiro apresenta comprovante ou quando ha duvida operacional.\n- Expand bag details: mostra status, rota, destino, peso, data, voo e historico quando disponivel.\n- Filter/flight list: filtra volumes por voo, trecho ou lista operacional conforme permissao do perfil.\n\nPara que serve\nConfirmar se a bagagem existe no sistema, se pertence ao passageiro correto e se esta associada ao voo/trecho esperado.\n\nQuando usar\nUse quando o passageiro perdeu o comprovante, apresenta etiqueta ilegivel, questiona quantidade de volumes, informa conexao, solicita reimpressao ou quando o agente precisa checar se a mala ja foi registrada.\n\nRespostas e conduta\n- Tag found: conferir nome, voo, data, origem, destino e quantidade antes de orientar.\n- No bag found/no item: revisar numero da etiqueta, companhia, data e voo. Nao cadastrar outra mala sem confirmar.\n- Multiple results: comparar data, voo, rota e passageiro; nao selecionar pelo primeiro resultado.\n- Bag not associated to customer: nao vincular manualmente sem regra/permissao. Acionar apoio.\n\nExercicio\nO passageiro apresenta a etiqueta 123456 e diz que a mala deveria seguir ate GRU. O aluno deve pesquisar pelo numero, abrir detalhes e explicar quais campos precisa conferir antes de responder."
  },
  {
    "title": "Tipos de bagagem e itens especiais no Altea",
    "type": "Consulta de tabela",
    "duration": "26 min",
    "content": "Objetivo da trilha\nEnsinar o aluno a consultar o tipo de bagagem correto antes de aceitar itens fora do fluxo simples.\n\nComandos/acoes\n- Baggage type/list of bag types: abre ou consulta a lista de tipos de bagagem disponiveis no perfil.\n- Special baggage/oversized/sport equipment: identifica item especial quando a companhia disponibiliza esse fluxo.\n- Cabin/unchecked/limited release: usar somente quando a regra e o perfil permitirem.\n- Remarks/comentarios de bagagem: registrar observacao operacional quando exigida.\n\nPara que serve\nDiferenciar mala comum, item especial, excesso, bagagem de cabine, equipamento esportivo, item fragil ou volume que exige autorizacao.\n\nQuando usar\nUse antes de aceitar bagagem fora do padrao: excesso de peso, dimensao irregular, item esportivo, bagagem fragil, bagagem com restricao, conexao interline ou volume que exige etiqueta/observacao especifica.\n\nRespostas e conduta\n- Type accepted: prosseguir conferindo peso, rota e etiqueta.\n- Type restricted/not allowed: nao forcar aceite; aplicar regra da companhia ou acionar supervisor.\n- Additional information required: preencher campos exigidos, como peso, dimensao, comentario ou autorizacao.\n- Charge/payment required: direcionar para cobranca/autorizacao antes de finalizar.\n\nSimulacao\nPassageiro apresenta prancha/equipamento esportivo. O aluno deve consultar o tipo de bagagem, verificar se exige pagamento/autorizacao e explicar por que nao deve registrar como mala comum sem validar."
  },
  {
    "title": "Rush bag e criacao de rush tag",
    "type": "Excecao de bagagem",
    "duration": "32 min",
    "content": "Objetivo da trilha\nEnsinar o conceito operacional de rush bag/rush tag e quando esse fluxo pode ser usado sem gerar rastreabilidade incorreta.\n\nComandos/acoes\n- Rush bag/Rush tag: cria ou prepara etiqueta de encaminhamento emergencial quando a mala precisa seguir sem o passageiro no mesmo fluxo normal.\n- Create rush tag: preencher rota, voo, data, destino e dados exigidos antes da emissao.\n- Search bag before rush: pesquisar etiqueta existente antes de criar rush tag.\n- Print rush tag/Reprint: imprimir ou reimprimir somente com controle e autorizacao.\n- Remarks/history: registrar motivo, voo de envio, destino e responsavel quando o sistema permitir.\n\nPara que serve\nEncaminhar bagagem atrasada, separada, regularizada ou recuperada, mantendo controle de rota e historico.\n\nQuando usar\nUse em irregularidade de bagagem, conexao perdida da mala, mala localizada apos o voo, regularizacao operacional, envio posterior autorizado ou orientacao de setor de bagagem. Nao usar para substituir check-in normal.\n\nRespostas e conduta\n- Rush tag created: conferir numero, rota, destino, voo, data e motivo antes de imprimir.\n- Existing bag/tag found: avaliar se deve atualizar/encaminhar a etiqueta existente, nao duplicar.\n- Missing routing/flight/date: completar dados obrigatorios antes de emitir.\n- Not authorized/restricted: acionar supervisor ou setor de bagagem; nao criar alternativa manual sem regra.\n- Print failed: verificar impressora e historico antes de repetir.\n\nExercicio\nUma mala ficou retida e precisa seguir no proximo voo. O aluno deve pesquisar a etiqueta original, confirmar destino, escolher voo/data de envio e explicar quais dados precisam aparecer na rush tag."
  },
  {
    "title": "SSR e assistencias: ler, confirmar e comunicar",
    "type": "Atendimento especial",
    "duration": "26 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/amadeus-altea/manual-amadeus-038.png",
        "title": "Print do manual Amadeus Altea - pagina 38",
        "caption": "Pagina do manual sobre OSI/SSR e elementos de servico, compativel com leitura e comunicacao de assistencias."
      }
    ],
    "content": "Objetivo da trilha\nEnsinar o uso operacional de SSR e servicos especiais no atendimento.\n\nComandos/acoes\n- View services/SSR details: visualiza servicos especiais vinculados.\n- Confirm service: confirma necessidade quando o fluxo exigir.\n- Add/modify service request: solicitar ou ajustar servico apenas conforme permissao e politica.\n- Remarks/notes: registrar observacao operacional quando permitido.\n\nPara que serve\nGarantir que necessidades especiais, assistencias, menor desacompanhado, animais, refeicoes e observacoes relevantes sejam tratadas corretamente.\n\nQuando usar\nAntes do check-in, na troca de assento, no portao, em conexao, em reacomodacao ou quando o passageiro informa necessidade nao registrada.\n\nRespostas e conduta\n- SSR confirmed: alinhar atendimento e comunicar area impactada.\n- SSR pending/requested: nao tratar como confirmado sem validar.\n- SSR conflict/restriction: acionar supervisor ou regra da companhia.\n- Missing SSR: registrar conforme processo, sem inventar codigo.\n\nExercicio\nPassageiro informa necessidade de cadeira de rodas no balcao, mas nao ha SSR. O aluno deve descrever como registrar, confirmar e avisar o portao."
  },
  {
    "title": "APIS, documentos e alertas obrigatorios",
    "type": "Controle regulatorio",
    "duration": "26 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/amadeus-altea/manual-amadeus-039.png",
        "title": "Print do manual Amadeus Altea - pagina 39",
        "caption": "Pagina do manual com SSR DOCS/DOCO/DOCA para APIS e documentos, compativel com a trilha documental."
      }
    ],
    "content": "Objetivo da trilha\nEnsinar o aluno a tratar dados regulatórios e documentais no sistema.\n\nComandos/acoes\n- Document data/API fields: inserir ou validar dados exigidos pelo destino.\n- Edit document data: corrigir informacao digitada incorretamente, quando permitido.\n- Validate/continue: submeter dados para verificacao do sistema.\n- Stop/cancel: interromper quando documento ou regra nao permite seguir.\n\nPara que serve\nAtender exigencias de seguranca, imigracao, destino, companhia e transporte.\n\nQuando usar\nVoos internacionais, destinos com exigencia especifica, alerta do sistema, dados faltantes, divergencia de documento ou passageiro com conexao sensivel.\n\nRespostas e conduta\n- Accepted/valid: prosseguir no check-in.\n- Incomplete data: preencher campos obrigatorios antes de aceitar.\n- Invalid/expired document: nao liberar sem validacao.\n- Supervisor required: escalar com evidencias da tela e documento.\n\nSimulacao\nDocumento venceu antes da data de retorno. O aluno deve explicar por que a decisao nao pode ser baseada apenas na pressa do passageiro."
  },
  {
    "title": "Embarque: scan, board, deboard e mensagens de erro",
    "type": "Portao de embarque",
    "duration": "30 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/amadeus-altea/manual-amadeus-054.png",
        "title": "Print do manual Amadeus Altea - pagina 54",
        "caption": "Pagina do manual sobre listagem de PNR por voo e boarding point, compativel com preparacao/lista operacional de embarque."
      }
    ],
    "content": "Objetivo da trilha\nEnsinar a operar a logica de embarque no Altea.\n\nComandos/acoes\n- Boarding Monitor: acompanhar status do voo e passageiros pendentes.\n- Scan boarding pass: ler cartao de embarque.\n- Board customer: confirmar embarque quando autorizado.\n- Deboard/offload customer: retirar embarque/aceite apenas conforme regra e autorizacao.\n- Close boarding/flight close-out: etapa final, conforme permissao operacional.\n\nPara que serve\nControlar quem embarcou, quem esta pendente e quais mensagens impedem liberacao.\n\nQuando usar\nDurante embarque, pre-embarque, fechamento de porta, no-show, passageiro errado no portao ou necessidade de retirar passageiro.\n\nRespostas e conduta\n- Boarded: passageiro liberado e registrado.\n- Not accepted/not checked-in: direcionar para regularizacao; nao liberar pela fila.\n- Wrong flight/wrong date: conferir cartao e orientar passageiro.\n- Duplicate/already boarded: verificar se houve leitura anterior, troca de cartao ou possivel erro.\n- Security/doc warning: resolver antes de embarcar.\n\nExercicio\nCartao escaneado retorna wrong flight. O aluno deve indicar os passos: parar, conferir voo, buscar passageiro e orientar novo portao ou regularizacao."
  },
  {
    "title": "Standby, regrade, onload e conexoes criticas",
    "type": "Tratamento avancado",
    "duration": "28 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/amadeus-altea/manual-amadeus-050.png",
        "title": "Print do manual Amadeus Altea - pagina 50",
        "caption": "Pagina do manual sobre status de segmentos, accepted/waitlist e mudancas de status, compativel com standby e decisoes de disponibilidade."
      }
    ],
    "content": "Objetivo da trilha\nEnsinar o aluno a interpretar listas e situacoes que nao sao check-in simples.\n\nComandos/acoes\n- Regrade list: acompanhar passageiros candidatos a mudanca de cabine/servico conforme regra.\n- Onload list: verificar passageiros a serem aceitos/carregados no voo quando aplicavel.\n- Standby handling: tratar passageiro aguardando liberacao.\n- Transfer/through check-in options: tratar continuidade de viagem quando disponivel.\n\nPara que serve\nOrganizar excecoes antes do fechamento do voo e evitar promessa indevida.\n\nQuando usar\nOverbooking, no-show, conexao curta, upgrade operacional, passageiro standby, irregularidade, transferencia ou voo com ajuste de capacidade.\n\nRespostas e conduta\n- Confirmed/accepted: emitir orientacao final e atualizar cartao se necessario.\n- Waitlisted/standby: informar que ainda nao ha confirmacao.\n- No seat/no availability: escalar conforme regra e orientar alternativa.\n- Regrade completed: confirmar novo assento/cabine e efeitos na bagagem/embarque.\n\nSimulacao\nPassageiro standby pergunta se ja pode embarcar. O aluno deve responder com base no status do sistema, nao na expectativa do passageiro."
  },
  {
    "title": "Alteracoes, disrupcao e reacomodacao no atendimento",
    "type": "Solucao de problemas",
    "duration": "30 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/amadeus-altea/manual-amadeus-056.png",
        "title": "Print do manual Amadeus Altea - pagina 56",
        "caption": "Pagina do manual sobre listas com segmentos inativos/cancelados e filtros operacionais, compativel com disrupcao e reacomodacao."
      }
    ],
    "content": "Objetivo da trilha\nEnsinar como agir quando o atendimento sai do fluxo normal.\n\nComandos/acoes\n- Modify itinerary/rebooking action: alterar voo quando o perfil e a regra permitirem.\n- Transfer customer: direcionar passageiro para outro voo/fluxo quando aplicavel.\n- Update customer details: ajustar informacao necessaria ao novo atendimento.\n- Print/reprint boarding pass: emitir novo documento somente depois de status confirmado.\n\nPara que serve\nResolver atraso, cancelamento, conexao perdida, troca de voo, irregularidade operacional ou necessidade de reacomodacao.\n\nQuando usar\nDepois de confirmar status do voo, motivo, regra de protecao, disponibilidade e aceite do passageiro.\n\nRespostas e conduta\n- Rebooked/transferred: conferir novo voo, data, portao, assento, bagagem e conexoes.\n- Not eligible: explicar limite e acionar supervisor se houver contestacao.\n- Pending action: nao emitir informacao final ate concluir.\n- Error/restriction: coletar evidencias e escalar.\n\nExercicio\nConexao perdida por atraso do primeiro voo. O aluno deve montar a sequencia: identificar, verificar status, buscar opcao, confirmar passageiro, atualizar registro e orientar bagagem."
  },
  {
    "title": "Messenger, ajuda online e leitura de mensagens",
    "type": "Comunicacao do sistema",
    "duration": "22 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/amadeus-altea/manual-amadeus-007.png",
        "title": "Print do manual Amadeus Altea - pagina 7",
        "caption": "Pagina do manual sobre paginas de informacao e ajuda online, compativel com consulta de orientacoes e suporte ao operador."
      }
    ],
    "content": "Objetivo da trilha\nEnsinar o aluno a buscar apoio dentro do ambiente de trabalho.\n\nComandos/acoes\n- Messenger: visualizar ou publicar mensagens operacionais quando o perfil permitir.\n- Subscribe/view message categories: acompanhar categorias relevantes ao voo/operacao.\n- HELP: abrir ajuda do sistema para consultar funcao ou comando.\n- GSL /PALAVRA/: pesquisa textual em guias/ajuda quando disponivel em ambiente criptico/ARD.\n\nPara que serve\nReceber avisos, consultar instrucoes e reduzir erro em telas pouco usadas.\n\nQuando usar\nEm duvida de funcao, mensagem operacional, mudanca de procedimento, alerta incomum ou necessidade de orientar outro setor.\n\nRespostas e conduta\n- Help topic found: leia antes de executar a acao.\n- No help result: refine o termo ou procure supervisor.\n- Message received: identifique origem, voo, prioridade e acao esperada.\n- Message sent: confirme destinatario e conteudo antes de considerar concluido.\n\nSimulacao\nO aluno recebe mensagem operacional sobre troca de portao. Deve indicar como confirmar voo, atualizar atendimento e orientar passageiros."
  },
  {
    "title": "Checklist final de comandos e respostas",
    "type": "Avaliacao pratica",
    "duration": "25 min",
    "content": "Objetivo da trilha\nConsolidar o uso pratico do Altea por comandos, acoes e respostas.\n\nChecklist de operacao\n- CTRL+H/Customer abriu a identificacao correta?\n- A pesquisa retornou o passageiro certo?\n- A ficha mostra voo, data, rota e status coerentes?\n- O alerta foi lido e tratado?\n- O Accept gerou aceite valido ou warning?\n- O assento foi confirmado ou recusado pelo sistema?\n- A bagagem gerou etiqueta correta?\n- O SSR foi lido, confirmado e comunicado?\n- O scan de embarque retornou boarded ou erro?\n- A reacomodacao foi concluida antes de orientar o passageiro?\n\nRespostas que exigem pausa\nNo match, multiple matches, warning, rejected, not accepted, wrong flight, duplicate, restricted, pending, supervisor required.\n\nExercicio final\nO instrutor apresenta cinco cenarios: check-in simples, bagagem com excesso, SSR WCHR, erro no portao e conexao perdida. O aluno deve indicar comando/acao, resposta esperada e proximo passo."
  }
]$modules_amadeus$::jsonb,
    $labs_amadeus$[
  {
    "label": "Biblioteca operacional",
    "href": "operational-library.html"
  }
]$labs_amadeus$::jsonb,
    $quiz_amadeus$[
  {
    "question": "Qual e a primeira acao antes de alterar qualquer dado do passageiro no Altea?",
    "options": [
      "Identificar corretamente passageiro, voo, data, rota e status",
      "Escolher um assento aleatorio",
      "Imprimir etiqueta de bagagem imediatamente",
      "Fechar a tela para acelerar a fila"
    ],
    "correct": 0
  },
  {
    "question": "CTRL+H ou a aplicacao Customer serve principalmente para:",
    "options": [
      "Abrir a identificacao/atendimento do passageiro",
      "Finalizar o voo sem conferencia",
      "Apagar alertas do sistema",
      "Emitir relatorio financeiro"
    ],
    "correct": 0
  },
  {
    "question": "Se a pesquisa retorna multiplos passageiros parecidos, o agente deve:",
    "options": [
      "Comparar dados e selecionar somente apos dupla conferencia",
      "Escolher o primeiro resultado",
      "Criar nova reserva sem conferir",
      "Ignorar documento"
    ],
    "correct": 0
  },
  {
    "question": "Uma resposta Warning no aceite significa que o agente deve:",
    "options": [
      "Ler e tratar o alerta antes de continuar",
      "Clicar novamente ate sumir",
      "Fechar o atendimento",
      "Prometer embarque sem validar"
    ],
    "correct": 0
  },
  {
    "question": "No mapa de assentos, Restricted seat indica:",
    "options": [
      "Assento com regra ou limitacao que precisa ser respeitada",
      "Assento sempre gratuito",
      "Erro sem importancia",
      "Assento reservado para qualquer passageiro"
    ],
    "correct": 0
  },
  {
    "question": "Ao emitir etiqueta de bagagem, o ponto mais critico e:",
    "options": [
      "Conferir destino final, numero da etiqueta, volumes e peso",
      "Ver apenas a cor da mala",
      "Entregar sem explicar conexao",
      "Reimprimir varias vezes sem controle"
    ],
    "correct": 0
  },
  {
    "question": "SSR deve ser tratado como:",
    "options": [
      "Servico especial que precisa ser lido, confirmado e comunicado quando impactar a operacao",
      "Campo decorativo da reserva",
      "Motivo para negar atendimento automaticamente",
      "Informacao que pode ser apagada sem criterio"
    ],
    "correct": 0
  },
  {
    "question": "No embarque, se o scan retorna Wrong flight, o agente deve:",
    "options": [
      "Parar, conferir cartao, voo e registro antes de liberar passagem",
      "Permitir embarque pela pressa da fila",
      "Ignorar a mensagem",
      "Trocar a etiqueta de bagagem"
    ],
    "correct": 0
  },
  {
    "question": "Passageiro em standby deve receber qual orientacao?",
    "options": [
      "Ainda nao ha confirmacao ate o sistema liberar assento/status",
      "O embarque esta garantido sempre",
      "Nao precisa acompanhar chamada",
      "Pode embarcar sem cartao"
    ],
    "correct": 0
  },
  {
    "question": "Em disrupcao, a reacomodacao so deve ser comunicada como concluida quando:",
    "options": [
      "Novo voo/status estiver confirmado no sistema e o passageiro receber orientacao final",
      "O passageiro aceitar verbalmente qualquer opcao",
      "A fila estiver grande",
      "O agente achar provavel que de certo"
    ],
    "correct": 0
  },
  {
    "question": "HELP ou ajuda online deve ser usado quando:",
    "options": [
      "O agente precisa confirmar funcao, comando ou orientacao antes de agir",
      "Quer pular a validacao do supervisor",
      "Deseja apagar mensagem operacional",
      "Nao quer ler alertas"
    ],
    "correct": 0
  },
  {
    "question": "Qual resposta exige pausa e analise antes de finalizar?",
    "options": [
      "Rejected, warning, pending, no match ou supervisor required",
      "Accepted sem alerta",
      "Boarded confirmado",
      "Seat confirmed"
    ],
    "correct": 0
  },
  {
    "question": "Antes de criar uma nova etiqueta de bagagem, o agente deve:",
    "options": [
      "Consultar a lista de bagagem do passageiro para evitar duplicidade",
      "Criar outra etiqueta sempre que o passageiro pedir",
      "Ignorar etiquetas ja existentes",
      "Usar qualquer destino para acelerar o atendimento"
    ],
    "correct": 0
  },
  {
    "question": "Na pesquisa de bagagem por numero de etiqueta, a conduta correta e:",
    "options": [
      "Conferir nome, voo, data, origem, destino e status antes de orientar",
      "Responder apenas olhando os tres ultimos digitos",
      "Cadastrar outra mala se aparecer mais de um resultado",
      "Reimprimir sem verificar a lista"
    ],
    "correct": 0
  },
  {
    "question": "A lista de tipos de bagagem serve principalmente para:",
    "options": [
      "Selecionar corretamente mala comum, item especial, excesso ou fluxo restrito",
      "Trocar assento do passageiro",
      "Cancelar automaticamente o check-in",
      "Substituir a regra da companhia"
    ],
    "correct": 0
  },
  {
    "question": "Rush tag deve ser usada quando:",
    "options": [
      "Ha encaminhamento autorizado de bagagem fora do fluxo normal, com rota e controle definidos",
      "O passageiro quer uma etiqueta mais bonita",
      "O agente nao encontrou o passageiro no sistema",
      "A impressora comum esta sem papel"
    ],
    "correct": 0
  },
  {
    "question": "Antes de criar uma rush tag, e indispensavel:",
    "options": [
      "Pesquisar etiqueta existente, confirmar destino, voo, data, motivo e autorizacao",
      "Apagar o historico anterior da bagagem",
      "Usar sempre o voo mais cheio",
      "Emitir sem registrar responsavel"
    ],
    "correct": 0
  }
]$quiz_amadeus$::jsonb,
    $cover_amadeus$../assets/academy-screenshots/amadeus-altea/manual-amadeus-007.png$cover_amadeus$ ,
    $material_amadeus$Amadeus Altea - Curso pratico de comandos para atendimento aeroportuario

Resumo
Curso objetivo em portugues Brasil para ensinar o aluno a usar o Amadeus Altea no atendimento de passageiros. O foco nao e apenas explicar o que e o sistema, mas treinar comando/acao, finalidade, momento de uso, resposta esperada e proximo passo.

Mapa rapido de comandos e acoes
CTRL+H / Customer - abre identificacao e atendimento do passageiro. Use para localizar passageiro antes de check-in, assento, bagagem, SSR ou embarque. Respostas comuns: sem resultado, um resultado, multiplos resultados, sem permissao.
Customer View - mostra ficha do passageiro, voo, status, assento, conexoes, bagagem, SSR e alertas. Use antes de executar qualquer alteracao.
Accept - aceita passageiro no voo/check-in. Use somente apos documento, voo, rota, alertas e pendencias conferidos. Respostas comuns: accepted, warning, rejected, missing data.
Advanced Options - abre opcoes como standby, through check-in ou voos especificos quando disponiveis. Use em situacoes que nao seguem o check-in simples.
Seat Map / Change seat - consulta, escolhe ou altera assento. Respostas comuns: seat confirmed, not available, restricted, chargeable.
Add bag / Update baggage details / Print bag tag - registra volumes, peso e etiqueta. Respostas comuns: tag issued, baggage already exists, excess alert, interline warning, print failed.
Baggage list / View bags - consulta volumes ja associados ao passageiro, voo ou atendimento. Use antes de inserir nova mala, reimprimir etiqueta ou responder duvida sobre quantidade/status.
Search bag by tag number - pesquisa bagagem pelo numero da etiqueta. Use para localizar volume, confirmar rota/destino/status e evitar duplicidade.
Baggage type / List of bag types - consulta tipos de bagagem e itens especiais permitidos no perfil. Use para excesso, item esportivo, volume fragil, cabine, oversized ou fluxo restrito.
Rush bag / Create rush tag - cria etiqueta rush para encaminhamento autorizado de bagagem fora do fluxo normal. Use apos pesquisar etiqueta existente e confirmar destino, voo, data, motivo e autorizacao.
View SSR / Services - consulta ou confirma servicos especiais. Respostas comuns: confirmed, requested, pending, conflict, restriction.
Document/API fields - registra ou valida dados documentais/regulatorios. Respostas comuns: valid, incomplete, invalid, warning, supervisor required.
Boarding Monitor / Scan boarding pass / Board - controla embarque. Respostas comuns: boarded, not accepted, wrong flight, duplicate, security warning.
Deboard/Offload - retira embarque/aceite conforme regra e permissao. Use apenas com autorizacao operacional.
Regrade/Onload/Standby lists - acompanha listas especiais e passageiros aguardando liberacao. Respostas comuns: confirmed, waitlisted, no seat, pending.
Messenger / Help / GSL por termo - consulta mensagens e ajuda. Use para confirmar orientacao, regra ou funcao antes de agir.

Regra de ouro
Nunca trate uma resposta do sistema como detalhe. Warning, rejected, pending, no match, wrong flight e supervisor required sao mensagens de parada. O agente deve ler, entender e decidir antes de continuar.

Referencias do conteudo
- Manual Amadeus Altea _210401_140055.pdf, fornecido pelo usuario. Utilizado como base local para selecionar temas e traduzir a logica de uso ao portugues Brasil.
- Amadeus Training Centre - Altea Departure Control - Customer Management. Referencia publica sobre navegacao, identificacao, aceite de passageiros, bagagem, assentos, assistencia, regrade, listas e embarque. Link: https://www.learn.amadeus.com/All-Courses/item-1371979472-Altea-Departure-Control-Customer-Management-1.en.htm
- Amadeus Altea DC-CM Overview. Referencia publica sobre interface Customer Management, aplicacoes, identificacao, historico, regrade/onload, bagagem, assento, boarding monitor, templates e regras de negocio. Link: https://www.learn.amadeus.com/Airline-Courses/item-2127013743-Amadeus-Altea-DC-CM-Overview-Virtual.en.htm
- IATA - Passenger Ground Services with Amadeus Altea DCS. Referencia publica sobre check-in, bagagem, embarque, passageiros com necessidades especiais, DCS/CRS e atendimento em solo. Link: https://www.iata.org/en/training/courses/passenger-ground-services/goc002eben01/en/

Observacao
As imagens foram extraidas do manual local indicado pelo usuario para servir como apoio visual. As telas, permissoes e nomes de botoes podem variar por companhia, versao, perfil e ambiente. Este curso ensina a logica operacional e as respostas mais importantes, mas nao substitui treinamento oficial do provedor, normas da companhia ou validacao de supervisor em excecoes.$material_amadeus$,
    490
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
where id = 'amadeus-altea-atendimento-aeroportuario';
