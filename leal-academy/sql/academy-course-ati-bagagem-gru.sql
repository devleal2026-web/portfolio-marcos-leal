-- Curso novo: ATI - Area de Transito/Transferencia Internacional de Bagagens - GRU.
-- Base: conteudo operacional fornecido pelo usuario.
-- Este script altera somente o registro id = 'ati-bagagem-internacional-gru'.
-- Nao altera cursos existentes nem interfere em imagens ou provas de outros cursos.

grant usage on schema public to anon, authenticated;
grant select on public.academy_courses to anon, authenticated;

alter table public.academy_courses
    add column if not exists category text;

insert into public.academy_courses (
    id, title, eyebrow, category, level, duration, color, summary, modules, labs, quiz, cover_path, material, sort_order
)
values (
    'ati-bagagem-internacional-gru',
    'ATI GRU - Transito e Transferencia Internacional de Bagagens',
    'Bagagem internacional em conexao',
    'bagagem',
    'Intermediario',
    '3h20',
    '#0b6b78',
    'Curso objetivo sobre criterios de entrada na ATI de GRU, regra das 4 horas, excecoes por perda de conexao, bagagem sem etiqueta, controle APAC, troca de etiqueta e checklist de decisao.',
    $modules_ati$[
  {
    "title": "O que e a ATI em GRU",
    "type": "Fundamento operacional",
    "duration": "18 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/ati-bagagem-gru/ati-gru-trilha-01.png?v=ati-realista-1",
        "title": "Operacao realista de bagagem internacional em transito",
        "caption": "Cena de apoio para compreender a ATI como area de controle temporario, tratamento e encaminhamento de bagagens internacionais em conexao."
      }
    ],
    "content": "O que e a ATI em GRU\n\nObjetivo da trilha\nEntender a funcao da Area de Transito/Transferencia Internacional de Bagagens no Aeroporto Internacional de Sao Paulo/Guarulhos.\n\nA ATI e uma area operacional destinada ao controle, armazenamento temporario, tratamento e encaminhamento de bagagens internacionais em conexao por GRU. Sua funcao principal e manter a rastreabilidade da bagagem enquanto ela aguarda tratamento ou liberacao para o proximo fluxo.\n\nO profissional deve compreender que a ATI nao e apenas um local para deixar malas. Cada entrada precisa ter justificativa operacional, identificacao valida e criterio de encaminhamento.\n\nFluxo simplificado\nChegada do voo -> descarregamento -> identificacao da bagagem de conexao -> verificacao de rota e tempo -> ATI ou Linha de Transferencia -> tratamento -> liberacao -> make-up/transferencia -> carregamento no proximo voo.\n\nPonto critico\nATI nao deve ser confundida com Linha de Transferencia. A decisao depende de rota, destino, tempo de conexao, identificacao e situacao operacional.\n\nMensagem principal\nA ATI existe para garantir controle, rastreabilidade e encaminhamento correto das bagagens internacionais em transito por GRU."
  },
  {
    "title": "Criterios para entrada de bagagens na ATI",
    "type": "Triagem operacional",
    "duration": "24 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/ati-bagagem-gru/ati-gru-trilha-02.png?v=ati-realista-1",
        "title": "Triagem realista de bagagens por fluxo",
        "caption": "Separacao operacional de bagagens conforme rota, destino e elegibilidade para ATI."
      }
    ],
    "content": "Criterios para entrada de bagagens na ATI\n\nObjetivo da trilha\nAprender quais bagagens podem ou nao podem ser aceitas na ATI.\n\nA ATI de GRU recebe bagagens internacionais em transito que atendem aos criterios operacionais do fluxo. Nem toda bagagem com destino final internacional deve entrar na ATI. O agente precisa analisar toda a rota.\n\nNao podem ser aceitas na ATI\n- Bagagens com destino domestico dentro do Brasil.\n- Bagagens cujo destino seja o proprio GRU.\n- Bagagens internacionais fora da rota adequada para ATI.\n- Bagagens com trecho domestico intermediario antes do destino internacional, quando esse fluxo nao corresponde a ATI.\n\nExemplo operacional\nUma bagagem GRU -> FLN -> SCL tem destino final internacional, mas possui conexao domestica em FLN. Portanto, nao deve ser aceita na ATI apenas porque o destino final e internacional.\n\nConduta esperada\nAntes de aceitar a bagagem, conferir origem, destino, proximo aeroporto, conexoes, tempo, etiqueta e situacao operacional.\n\nMensagem principal\nO destino final sozinho nao decide ATI. A rota completa decide."
  },
  {
    "title": "Regra das 4 horas: ATI ou Linha de Transferencia",
    "type": "Tempo de conexao",
    "duration": "20 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/ati-bagagem-gru/ati-gru-trilha-03.png?v=ati-realista-1",
        "title": "Conferencia de tempo de conexao",
        "caption": "Agentes analisam etiqueta, documentos e tempo disponivel antes de decidir ATI ou transferencia direta."
      }
    ],
    "content": "Regra das 4 horas: ATI ou Linha de Transferencia\n\nObjetivo da trilha\nAplicar corretamente o criterio de tempo para definir o fluxo da bagagem.\n\nO tempo de conexao e um dos principais criterios para determinar se a bagagem deve entrar na ATI ou seguir diretamente para a Linha de Transferencia.\n\nConexao superior a 4 horas\nBagagens elegiveis com conexao superior a 4 horas podem ser encaminhadas para a ATI, desde que os demais criterios tambem estejam corretos. A bagagem permanece sob controle ate o momento adequado para tratamento e liberacao.\n\nConexao inferior a 4 horas\nBagagens com conexao inferior a 4 horas normalmente nao devem entrar na ATI. Elas devem seguir para a Linha de Transferencia para preservar o tempo operacional ate o proximo voo.\n\nRegra pratica\nConexao maior que 4 horas -> ATI, se elegivel.\nConexao menor que 4 horas -> Linha de Transferencia, salvo excecao operacional.\n\nMensagem principal\nTempo curto exige fluxo direto. Tempo maior permite controle temporario, desde que a rota esteja correta."
  },
  {
    "title": "Excecao: bagagem que perdeu conexao",
    "type": "Reroute e RUSH",
    "duration": "24 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/ati-bagagem-gru/ati-gru-trilha-04.png?v=ati-realista-1",
        "title": "Tratamento realista de bagagem que perdeu conexao",
        "caption": "Preparacao de nova etiqueta e novo encaminhamento apos perda de conexao."
      }
    ],
    "content": "Excecao: bagagem que perdeu conexao\n\nObjetivo da trilha\nEntender quando uma bagagem pode ser tratada na ATI fora do fluxo normal por perda de conexao.\n\nQuando a bagagem perde sua conexao, pode ser necessario realizar novo tratamento para encaminha-la em outro voo disponivel. Essa situacao pode envolver reroute, RUSH ou nova etiqueta.\n\nReroute\nE a alteracao do encaminhamento originalmente previsto para a bagagem. Deve ser feito com base em voo disponivel, rota valida e autorizacao operacional.\n\nRUSH\nE o encaminhamento de bagagem desacompanhada em voo posterior, conforme procedimento aplicavel. Deve manter rastreabilidade, registro e comunicacao correta.\n\nRegra critica\nBagagens com destino internacional que nao foram carregadas no mesmo voo do passageiro nao devem seguir em novo voo com etiqueta antiga quando houver novo tratamento. A etiqueta deve refletir o novo voo/encaminhamento quando aplicavel.\n\nMensagem principal\nBagagem que perdeu conexao exige novo controle. Nao trate como simples permanencia na ATI."
  },
  {
    "title": "Bagagem sem etiqueta: identificacao obrigatoria",
    "type": "Rastreabilidade",
    "duration": "20 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/ati-bagagem-gru/ati-gru-trilha-05.png?v=ati-realista-1",
        "title": "Conferencia realista de bagagem sem etiqueta",
        "caption": "Agentes verificam documentacao e identificacao antes de aceitar uma bagagem sem tag."
      }
    ],
    "content": "Bagagem sem etiqueta: identificacao obrigatoria\n\nObjetivo da trilha\nEvitar entrada indevida de bagagem sem rastreabilidade na ATI.\n\nUma bagagem sem etiqueta nao pode ser simplesmente aceita na ATI. A ausencia de etiqueta impede a confirmacao imediata de rota, passageiro, voo e destino.\n\nPara recebimento, deve existir documentacao que comprove a identificacao e a vinculacao ao passageiro.\n\nDocumento minimo exigido\n- Bingo com a numeracao atual da bagagem.\n- Reserva do passageiro.\n\nEssas informacoes permitem confirmar a bagagem e manter a rastreabilidade antes da entrada na area.\n\nConduta esperada\nSe nao houver identificacao suficiente, nao aceitar automaticamente. Acionar procedimento local, supervisao ou area responsavel.\n\nMensagem principal\nSem etiqueta, nao ha rastreabilidade suficiente. Primeiro identifique, depois decida."
  },
  {
    "title": "Controle fisico local: APAC",
    "type": "Entrada e saida",
    "duration": "22 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/ati-bagagem-gru/ati-gru-trilha-06.png?v=ati-realista-1",
        "title": "Controle realista de entrada e saida",
        "caption": "Registro fisico local com leitura de etiqueta, controle de carrinhos e area segura de armazenagem."
      }
    ],
    "content": "Controle fisico local: APAC\n\nObjetivo da trilha\nCompreender a importancia do controle fisico local de todas as movimentacoes na ATI.\n\nTodas as bagagens que entram ou saem da ATI devem ser informadas ao APAC. Isso garante que o controle local reflita a realidade fisica da area.\n\nO controle precisa manter correspondencia entre tres pontos:\n- Bagagem fisica presente na ATI.\n- Identificacao registrada.\n- Movimentacao de entrada ou saida.\n\nSe uma bagagem entra sem registro, sai sem comunicacao ou tem numero alterado sem atualizacao, a rastreabilidade fica comprometida.\n\nConduta esperada\nAo receber, liberar, transferir, retirar ou redirecionar uma bagagem da ATI, informar o APAC conforme procedimento local.\n\nMensagem principal\nO controle fisico e tao importante quanto o controle no sistema. Bagagem fisica e registro precisam bater."
  },
  {
    "title": "Troca de etiqueta e alteracao da numeracao",
    "type": "Atualizacao de controle",
    "duration": "22 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/ati-bagagem-gru/ati-gru-trilha-07.png?v=ati-realista-1",
        "title": "Troca realista de etiqueta",
        "caption": "Substituicao de etiqueta e atualizacao do controle para manter a nova numeracao vinculada ao volume correto."
      }
    ],
    "content": "Troca de etiqueta e alteracao da numeracao\n\nObjetivo da trilha\nGarantir que a nova numeracao da bagagem seja comunicada e registrada corretamente.\n\nDurante o tratamento na ATI, pode ser necessario substituir a etiqueta original. Se a bagagem passa a possuir nova numeracao, essa alteracao deve ser comunicada ao APAC.\n\nExemplo\nEtiqueta original: 1234567890.\nNova etiqueta: 9876543210.\n\nO controle fisico nao pode continuar considerando apenas a numeracao anterior. Caso contrario, a mala pode parecer ausente, duplicada ou incorreta no acompanhamento.\n\nConduta esperada\nConferir a mala fisica, remover ou inutilizar a referencia anterior quando aplicavel, aplicar a nova etiqueta e informar a nova numeracao ao controle local.\n\nMensagem principal\nTrocou a etiqueta, mudou a identidade operacional da bagagem. O APAC precisa saber."
  },
  {
    "title": "Conferencia da etiqueta e da rota completa",
    "type": "Leitura operacional",
    "duration": "26 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/ati-bagagem-gru/ati-gru-trilha-08.png?v=ati-realista-1",
        "title": "Conferencia realista de tag, rota e decisao",
        "caption": "Equipe confere etiqueta, rota e dados operacionais antes do encaminhamento."
      }
    ],
    "content": "Conferencia da etiqueta e da rota completa\n\nObjetivo da trilha\nLer a etiqueta como fonte principal de decisao operacional.\n\nA etiqueta de bagagem traz informacoes essenciais para decidir se a bagagem deve ir para ATI, Linha de Transferencia ou outro fluxo.\n\nO que conferir\n- Numero da bagagem.\n- Destino.\n- Rota completa.\n- Aeroportos de conexao.\n- Voo.\n- Companhia.\n- Horario da conexao.\n- Situacao operacional.\n\nNao e suficiente verificar somente o destino final. Uma bagagem com destino internacional pode ter trecho domestico intermediario e, por isso, nao atender aos criterios da ATI.\n\nConduta esperada\nLer a etiqueta, comparar com a reserva quando necessario, avaliar tempo e rota, e so depois definir o encaminhamento.\n\nMensagem principal\nEtiqueta bem lida evita bagagem no fluxo errado."
  },
  {
    "title": "Checklist de decisao e fechamento do fluxo",
    "type": "Checklist pratico",
    "duration": "24 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/ati-bagagem-gru/ati-gru-trilha-09.png?v=ati-realista-1",
        "title": "Checklist realista antes do encaminhamento",
        "caption": "Revisao final de etiqueta, rota, tempo, controle e destino antes de liberar a bagagem."
      }
    ],
    "content": "Checklist de decisao e fechamento do fluxo\n\nObjetivo da trilha\nAplicar um roteiro rapido para decidir corretamente o encaminhamento da bagagem.\n\nAntes de aceitar uma bagagem na ATI, pergunte:\n1. A bagagem tem GRU como destino? Se sim, nao aceitar na ATI.\n2. O proximo destino e domestico? Se sim, nao aceitar na ATI.\n3. Existe trecho domestico intermediario antes do destino internacional? Se sim, nao aceitar na ATI.\n4. A rota esta adequada ao fluxo internacional da ATI? Se nao, nao aceitar.\n5. A bagagem possui identificacao valida? Se estiver sem etiqueta, exigir bingo com numeracao atual + reserva do passageiro.\n6. A conexao e superior a 4 horas? Se sim, ATI, desde que os demais criterios estejam atendidos.\n7. A conexao e inferior a 4 horas? Se sim, Linha de Transferencia, salvo excecao operacional.\n8. A bagagem perdeu conexao? Avaliar tratamento, reroute ou RUSH.\n9. A bagagem entrou ou saiu da ATI? Informar APAC.\n10. Houve troca de etiqueta? Informar a nova numeracao ao APAC.\n\nMensagem principal\nA ATI funciona com decisao, registro e rastreabilidade. Sem esses tres pontos, o fluxo fica inseguro."
  }
]$modules_ati$::jsonb,
    $labs_ati$[]$labs_ati$::jsonb,
    $quiz_ati$[
  {
    "question": "Qual e a principal finalidade da ATI em GRU?",
    "options": [
      "Controlar, tratar e encaminhar bagagens internacionais em conexao",
      "Guardar qualquer bagagem que chegou ao aeroporto",
      "Substituir a Linha de Transferencia",
      "Atender passageiro no balcao de check-in"
    ],
    "correct": 0
  },
  {
    "question": "Uma bagagem com destino GRU deve ser aceita na ATI?",
    "options": [
      "Nao, porque GRU e o destino da bagagem",
      "Sim, se houver espaco na area",
      "Sim, sempre que for internacional",
      "Somente se estiver sem etiqueta"
    ],
    "correct": 0
  },
  {
    "question": "No exemplo GRU -> FLN -> SCL, por que a bagagem nao deve ser aceita automaticamente na ATI?",
    "options": [
      "Porque existe trecho domestico intermediario antes do destino internacional",
      "Porque SCL nao e destino internacional",
      "Porque FLN e sempre destino final",
      "Porque toda bagagem para SCL deve ficar em GRU"
    ],
    "correct": 0
  },
  {
    "question": "Pela regra operacional apresentada, conexao superior a 4 horas pode indicar:",
    "options": [
      "ATI, desde que os demais criterios estejam corretos",
      "Linha de Transferencia obrigatoria",
      "Recusa automatica da bagagem",
      "DPR imediato"
    ],
    "correct": 0
  },
  {
    "question": "Bagagem com conexao inferior a 4 horas normalmente deve seguir para:",
    "options": [
      "Linha de Transferencia",
      "ATI obrigatoriamente",
      "Area de achados e perdidos",
      "Sala de desembarque"
    ],
    "correct": 0
  },
  {
    "question": "Quando a bagagem perdeu a conexao, pode ser necessario:",
    "options": [
      "Novo tratamento, reroute ou RUSH conforme procedimento",
      "Manter sempre a etiqueta antiga",
      "Enviar ao passageiro sem registro",
      "Ignorar APAC"
    ],
    "correct": 0
  },
  {
    "question": "Uma bagagem sem etiqueta so deve ser recebida se houver:",
    "options": [
      "Bingo com numeracao atual da bagagem e reserva do passageiro",
      "Apenas descricao verbal da mala",
      "Apenas foto enviada por mensagem",
      "Autorizacao informal de qualquer pessoa"
    ],
    "correct": 0
  },
  {
    "question": "Todas as bagagens que entram ou saem da ATI devem ser informadas ao:",
    "options": [
      "APAC",
      "Passageiro",
      "Setor comercial",
      "Duty free"
    ],
    "correct": 0
  },
  {
    "question": "Se a etiqueta original for substituida e houver nova numeracao, a conduta correta e:",
    "options": [
      "Informar a nova numeracao ao APAC",
      "Manter apenas o numero antigo",
      "Apagar o controle anterior sem registro",
      "Enviar a bagagem sem atualizar ninguem"
    ],
    "correct": 0
  },
  {
    "question": "Ao decidir ATI ou transferencia, o agente deve verificar:",
    "options": [
      "Numero da bagagem, destino, rota, conexoes, voo, companhia, horario e situacao",
      "Somente a cor da mala",
      "Somente o destino final",
      "Somente o peso"
    ],
    "correct": 0
  },
  {
    "question": "Qual afirmacao esta correta?",
    "options": [
      "Destino final internacional nao basta; a rota completa deve ser analisada",
      "Toda bagagem internacional entra na ATI",
      "Toda mala sem etiqueta pode entrar se estiver no carrinho",
      "A Linha de Transferencia e igual a ATI"
    ],
    "correct": 0
  },
  {
    "question": "Os tres pilares operacionais da ATI neste curso sao:",
    "options": [
      "Controle, rastreabilidade e encaminhamento correto",
      "Rapidez, improviso e armazenamento",
      "Venda, atendimento e embarque",
      "Etiqueta, cor e tamanho"
    ],
    "correct": 0
  }
]$quiz_ati$::jsonb,
    '../assets/academy-screenshots/ati-bagagem-gru/ati-gru-cover.png?v=ati-realista-1',
    $material_ati$ATI GRU - Area de Transito/Transferencia Internacional de Bagagens

Resumo
Curso objetivo para orientar a analise e o tratamento de bagagens internacionais em conexao por GRU, com foco em criterios de entrada na ATI, regra das 4 horas, excecoes por perda de conexao, bagagem sem etiqueta, controle APAC, troca de etiqueta e checklist de decisao.

Pontos principais
- ATI nao e Linha de Transferencia.
- Nao aceitar bagagens com destino GRU ou destino domestico.
- Nao decidir apenas pelo destino final; analisar a rota completa.
- Conexao maior que 4 horas pode seguir para ATI se os demais criterios estiverem corretos.
- Conexao menor que 4 horas normalmente segue para Linha de Transferencia.
- Bagagem que perdeu conexao pode exigir reroute, RUSH e nova etiqueta.
- Bagagem sem etiqueta exige bingo com numeracao atual + reserva do passageiro.
- Toda entrada e saida da ATI deve ser informada ao APAC.
- Troca de etiqueta com nova numeracao deve ser comunicada ao APAC.

Aviso operacional
Este curso e material didatico interno. A aplicacao pratica deve respeitar procedimento local, companhia aerea, contrato, supervisao e regras vigentes no aeroporto.$material_ati$,
    520
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
where id = 'ati-bagagem-internacional-gru';
