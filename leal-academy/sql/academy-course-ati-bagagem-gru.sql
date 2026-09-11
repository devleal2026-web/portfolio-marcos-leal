-- Curso novo: ATI - Área de Trânsito/Transferência Internacional de Bagagens - GRU.
-- Base: conteúdo operacional fornecido pelo usuário.
-- Este script altera somente o registro id = 'ati-bagagem-internacional-gru'.
-- Não altera cursos existentes nem interfere em imagens ou provas de outros cursos.

grant usage on schema public to anon, authenticated;
grant select on public.academy_courses to anon, authenticated;

alter table public.academy_courses
    add column if not exists category text;

insert into public.academy_courses (
    id, title, eyebrow, category, level, duration, color, summary, modules, labs, quiz, cover_path, material, sort_order
)
values (
    'ati-bagagem-internacional-gru',
    'ATI GRU - Trânsito e Transferência Internacional de Bagagens',
    'Bagagem internacional em conexão',
    'bagagem',
    'Intermediário',
    '3h20',
    '#0b6b78',
    'Curso objetivo sobre critérios de entrada na ATI de GRU, regra das 4 horas, exceções por perda de conexão, bagagem sem etiqueta, controle APAC, troca de etiqueta e checklist de decisão.',
    $modules_ati$[
  {
    "title": "O que é a ATI em GRU",
    "type": "Fundamento operacional",
    "duration": "18 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/ati-bagagem-gru/ati-gru-trilha-01.png?v=ati-realista-2",
        "title": "Operação realista de bagagem internacional em trânsito",
        "caption": "Cena de apoio para compreender a ATI como área de controle temporário, tratamento e encaminhamento de bagagens internacionais em conexão."
      }
    ],
    "content": "O que é a ATI em GRU\n\nObjetivo da trilha\nEntender a função da Área de Trânsito/Transferência Internacional de Bagagens no Aeroporto Internacional de São Paulo/Guarulhos.\n\nA ATI é uma área operacional destinada ao controle, armazenamento temporário, tratamento e encaminhamento de bagagens internacionais em conexão por GRU. Sua função principal é manter a rastreabilidade da bagagem enquanto ela aguarda tratamento ou liberação para o próximo fluxo.\n\nO profissional deve compreender que a ATI não é apenas um local para deixar malas. Cada entrada precisa ter justificativa operacional, identificação válida e critério de encaminhamento.\n\nFluxo simplificado\nChegada do voo -> descarregamento -> identificação da bagagem de conexão -> verificação de rota e tempo -> ATI ou Linha de Transferência -> tratamento -> liberação -> make-up/transferência -> carregamento no próximo voo.\n\nPonto crítico\nATI não deve ser confundida com Linha de Transferência. A decisão depende de rota, destino, tempo de conexão, identificação e situação operacional.\n\nMensagem principal\nA ATI existe para garantir controle, rastreabilidade e encaminhamento correto das bagagens internacionais em trânsito por GRU."
  },
  {
    "title": "Critérios para entrada de bagagens na ATI",
    "type": "Triagem operacional",
    "duration": "24 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/ati-bagagem-gru/ati-gru-trilha-02.png?v=ati-realista-2",
        "title": "Triagem realista de bagagens por fluxo",
        "caption": "Separação operacional de bagagens conforme rota, destino e elegibilidade para ATI."
      }
    ],
    "content": "Critérios para entrada de bagagens na ATI\n\nObjetivo da trilha\nAprender quais bagagens podem ou não podem ser aceitas na ATI.\n\nA ATI de GRU recebe bagagens internacionais em trânsito que atendem aos critérios operacionais do fluxo. Nem toda bagagem com destino final internacional deve entrar na ATI. O agente precisa analisar toda a rota.\n\nNão podem ser aceitas na ATI\n- Bagagens com destino doméstico dentro do Brasil.\n- Bagagens cujo destino seja o próprio GRU.\n- Bagagens internacionais fora da rota adequada para ATI.\n- Bagagens com trecho doméstico intermediário antes do destino internacional, quando esse fluxo não corresponde à ATI.\n\nExemplo operacional\nUma bagagem GRU -> FLN -> SCL tem destino final internacional, mas possui conexão doméstica em FLN. Portanto, não deve ser aceita na ATI apenas porque o destino final é internacional.\n\nConduta esperada\nAntes de aceitar a bagagem, conferir origem, destino, próximo aeroporto, conexões, tempo, etiqueta e situação operacional.\n\nMensagem principal\nO destino final sozinho não decide ATI. A rota completa decide."
  },
  {
    "title": "Regra das 4 horas: ATI ou Linha de Transferência",
    "type": "Tempo de conexão",
    "duration": "20 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/ati-bagagem-gru/ati-gru-trilha-03.png?v=ati-realista-2",
        "title": "Conferência de tempo de conexão",
        "caption": "Agentes analisam etiqueta, documentos e tempo disponível antes de decidir ATI ou transferência direta."
      }
    ],
    "content": "Regra das 4 horas: ATI ou Linha de Transferência\n\nObjetivo da trilha\nAplicar corretamente o critério de tempo para definir o fluxo da bagagem.\n\nO tempo de conexão é um dos principais critérios para determinar se a bagagem deve entrar na ATI ou seguir diretamente para a Linha de Transferência.\n\nConexão superior a 4 horas\nBagagens elegíveis com conexão superior a 4 horas podem ser encaminhadas para a ATI, desde que os demais critérios também estejam corretos. A bagagem permanece sob controle até o momento adequado para tratamento e liberação.\n\nConexão inferior a 4 horas\nBagagens com conexão inferior a 4 horas normalmente não devem entrar na ATI. Elas devem seguir para a Linha de Transferência para preservar o tempo operacional até o próximo voo.\n\nRegra prática\nConexão maior que 4 horas -> ATI, se elegível.\nConexão menor que 4 horas -> Linha de Transferência, salvo exceção operacional.\n\nMensagem principal\nTempo curto exige fluxo direto. Tempo maior permite controle temporário, desde que a rota esteja correta."
  },
  {
    "title": "Exceção: bagagem que perdeu conexão",
    "type": "Reroute e RUSH",
    "duration": "24 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/ati-bagagem-gru/ati-gru-trilha-04.png?v=ati-realista-2",
        "title": "Tratamento realista de bagagem que perdeu conexão",
        "caption": "Preparação de nova etiqueta e novo encaminhamento após perda de conexão."
      }
    ],
    "content": "Exceção: bagagem que perdeu conexão\n\nObjetivo da trilha\nEntender quando uma bagagem pode ser tratada na ATI fora do fluxo normal por perda de conexão.\n\nQuando a bagagem perde sua conexão, pode ser necessário realizar novo tratamento para encaminhá-la em outro voo disponível. Essa situação pode envolver reroute, RUSH ou nova etiqueta.\n\nReroute\nÉ a alteração do encaminhamento originalmente previsto para a bagagem. Deve ser feito com base em voo disponível, rota válida e autorização operacional.\n\nRUSH\nÉ o encaminhamento de bagagem desacompanhada em voo posterior, conforme procedimento aplicável. Deve manter rastreabilidade, registro e comunicação correta.\n\nRegra crítica\nBagagens com destino internacional que não foram carregadas no mesmo voo do passageiro não devem seguir em novo voo com etiqueta antiga quando houver novo tratamento. A etiqueta deve refletir o novo voo/encaminhamento quando aplicável.\n\nMensagem principal\nBagagem que perdeu conexão exige novo controle. Não trate como simples permanência na ATI."
  },
  {
    "title": "Bagagem sem etiqueta: identificação obrigatória",
    "type": "Rastreabilidade",
    "duration": "20 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/ati-bagagem-gru/ati-gru-trilha-05.png?v=ati-realista-2",
        "title": "Conferência realista de bagagem sem etiqueta",
        "caption": "Agentes verificam documentação e identificação antes de aceitar uma bagagem sem tag."
      }
    ],
    "content": "Bagagem sem etiqueta: identificação obrigatória\n\nObjetivo da trilha\nEvitar entrada indevida de bagagem sem rastreabilidade na ATI.\n\nUma bagagem sem etiqueta não pode ser simplesmente aceita na ATI. A ausência de etiqueta impede a confirmação imediata de rota, passageiro, voo e destino.\n\nPara recebimento, deve existir documentação que comprove a identificação e a vinculação ao passageiro.\n\nDocumento mínimo exigido\n- Bingo com a numeração atual da bagagem.\n- Reserva do passageiro.\n\nEssas informações permitem confirmar a bagagem e manter a rastreabilidade antes da entrada na área.\n\nConduta esperada\nSe não houver identificação suficiente, não aceitar automaticamente. Acionar procedimento local, supervisão ou área responsável.\n\nMensagem principal\nSem etiqueta, não há rastreabilidade suficiente. Primeiro identifique, depois decida."
  },
  {
    "title": "Controle físico local: APAC",
    "type": "Entrada e saída",
    "duration": "22 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/ati-bagagem-gru/ati-gru-trilha-06.png?v=ati-realista-2",
        "title": "Controle realista de entrada e saída",
        "caption": "Registro físico local com leitura de etiqueta, controle de carrinhos e área segura de armazenagem."
      }
    ],
    "content": "Controle físico local: APAC\n\nObjetivo da trilha\nCompreender a importância do controle físico local de todas as movimentações na ATI.\n\nTodas as bagagens que entram ou saem da ATI devem ser informadas ao APAC. Isso garante que o controle local reflita a realidade física da área.\n\nO controle precisa manter correspondência entre três pontos:\n- Bagagem física presente na ATI.\n- Identificação registrada.\n- Movimentação de entrada ou saída.\n\nSe uma bagagem entra sem registro, sai sem comunicação ou tem número alterado sem atualização, a rastreabilidade fica comprometida.\n\nConduta esperada\nAo receber, liberar, transferir, retirar ou redirecionar uma bagagem da ATI, informar o APAC conforme procedimento local.\n\nMensagem principal\nO controle físico é tão importante quanto o controle no sistema. Bagagem física e registro precisam bater."
  },
  {
    "title": "Troca de etiqueta e alteração da numeração",
    "type": "Atualização de controle",
    "duration": "22 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/ati-bagagem-gru/ati-gru-trilha-07.png?v=ati-realista-2",
        "title": "Troca realista de etiqueta",
        "caption": "Substituição de etiqueta e atualização do controle para manter a nova numeração vinculada ao volume correto."
      }
    ],
    "content": "Troca de etiqueta e alteração da numeração\n\nObjetivo da trilha\nGarantir que a nova numeração da bagagem seja comunicada e registrada corretamente.\n\nDurante o tratamento na ATI, pode ser necessário substituir a etiqueta original. Se a bagagem passa a possuir nova numeração, essa alteração deve ser comunicada ao APAC.\n\nExemplo\nEtiqueta original: 1234567890.\nNova etiqueta: 9876543210.\n\nO controle físico não pode continuar considerando apenas a numeração anterior. Caso contrário, a mala pode parecer ausente, duplicada ou incorreta no acompanhamento.\n\nConduta esperada\nConferir a mala física, remover ou inutilizar a referência anterior quando aplicável, aplicar a nova etiqueta e informar a nova numeração ao controle local.\n\nMensagem principal\nTrocou a etiqueta, mudou a identidade operacional da bagagem. O APAC precisa saber."
  },
  {
    "title": "Conferência da etiqueta e da rota completa",
    "type": "Leitura operacional",
    "duration": "26 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/ati-bagagem-gru/ati-gru-trilha-08.png?v=ati-realista-2",
        "title": "Conferência realista de tag, rota e decisão",
        "caption": "Equipe confere etiqueta, rota e dados operacionais antes do encaminhamento."
      }
    ],
    "content": "Conferência da etiqueta e da rota completa\n\nObjetivo da trilha\nLer a etiqueta como fonte principal de decisão operacional.\n\nA etiqueta de bagagem traz informações essenciais para decidir se a bagagem deve ir para ATI, Linha de Transferência ou outro fluxo.\n\nO que conferir\n- Número da bagagem.\n- Destino.\n- Rota completa.\n- Aeroportos de conexão.\n- Voo.\n- Companhia.\n- Horário da conexão.\n- Situação operacional.\n\nNão é suficiente verificar somente o destino final. Uma bagagem com destino internacional pode ter trecho doméstico intermediário e, por isso, não atender aos critérios da ATI.\n\nConduta esperada\nLer a etiqueta, comparar com a reserva quando necessário, avaliar tempo e rota, e só depois definir o encaminhamento.\n\nMensagem principal\nEtiqueta bem lida evita bagagem no fluxo errado."
  },
  {
    "title": "Checklist de decisão e fechamento do fluxo",
    "type": "Checklist prático",
    "duration": "24 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/ati-bagagem-gru/ati-gru-trilha-09.png?v=ati-realista-2",
        "title": "Checklist realista antes do encaminhamento",
        "caption": "Revisão final de etiqueta, rota, tempo, controle e destino antes de liberar a bagagem."
      }
    ],
    "content": "Checklist de decisão e fechamento do fluxo\n\nObjetivo da trilha\nAplicar um roteiro rápido para decidir corretamente o encaminhamento da bagagem.\n\nAntes de aceitar uma bagagem na ATI, pergunte:\n1. A bagagem tem GRU como destino? Se sim, não aceitar na ATI.\n2. O próximo destino é doméstico? Se sim, não aceitar na ATI.\n3. Existe trecho doméstico intermediário antes do destino internacional? Se sim, não aceitar na ATI.\n4. A rota está adequada ao fluxo internacional da ATI? Se não, não aceitar.\n5. A bagagem possui identificação válida? Se estiver sem etiqueta, exigir bingo com numeração atual + reserva do passageiro.\n6. A conexão é superior a 4 horas? Se sim, ATI, desde que os demais critérios estejam atendidos.\n7. A conexão é inferior a 4 horas? Se sim, Linha de Transferência, salvo exceção operacional.\n8. A bagagem perdeu conexão? Avaliar tratamento, reroute ou RUSH.\n9. A bagagem entrou ou saiu da ATI? Informar APAC.\n10. Houve troca de etiqueta? Informar a nova numeração ao APAC.\n\nMensagem principal\nA ATI funciona com decisão, registro e rastreabilidade. Sem esses três pontos, o fluxo fica inseguro."
  }
]$modules_ati$::jsonb,
    $labs_ati$[]$labs_ati$::jsonb,
    $quiz_ati$[
  {
    "question": "Qual é a principal finalidade da ATI em GRU?",
    "options": [
      "Controlar, tratar e encaminhar bagagens internacionais em conexão",
      "Guardar qualquer bagagem que chegou ao aeroporto",
      "Substituir a Linha de Transferência",
      "Atender passageiro no balcão de check-in"
    ],
    "correct": 0
  },
  {
    "question": "Uma bagagem com destino GRU deve ser aceita na ATI?",
    "options": [
      "Não, porque GRU é o destino da bagagem",
      "Sim, se houver espaço na área",
      "Sim, sempre que for internacional",
      "Somente se estiver sem etiqueta"
    ],
    "correct": 0
  },
  {
    "question": "No exemplo GRU -> FLN -> SCL, por que a bagagem não deve ser aceita automaticamente na ATI?",
    "options": [
      "Porque existe trecho doméstico intermediário antes do destino internacional",
      "Porque SCL não é destino internacional",
      "Porque FLN é sempre destino final",
      "Porque toda bagagem para SCL deve ficar em GRU"
    ],
    "correct": 0
  },
  {
    "question": "Pela regra operacional apresentada, conexão superior a 4 horas pode indicar:",
    "options": [
      "ATI, desde que os demais critérios estejam corretos",
      "Linha de Transferência obrigatória",
      "Recusa automática da bagagem",
      "DPR imediato"
    ],
    "correct": 0
  },
  {
    "question": "Bagagem com conexão inferior a 4 horas normalmente deve seguir para:",
    "options": [
      "Linha de Transferência",
      "ATI obrigatoriamente",
      "Área de achados e perdidos",
      "Sala de desembarque"
    ],
    "correct": 0
  },
  {
    "question": "Quando a bagagem perdeu a conexão, pode ser necessário:",
    "options": [
      "Novo tratamento, reroute ou RUSH conforme procedimento",
      "Manter sempre a etiqueta antiga",
      "Enviar ao passageiro sem registro",
      "Ignorar APAC"
    ],
    "correct": 0
  },
  {
    "question": "Uma bagagem sem etiqueta só deve ser recebida se houver:",
    "options": [
      "Bingo com numeração atual da bagagem e reserva do passageiro",
      "Apenas descrição verbal da mala",
      "Apenas foto enviada por mensagem",
      "Autorização informal de qualquer pessoa"
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
    "question": "Se a etiqueta original for substituída e houver nova numeração, a conduta correta é:",
    "options": [
      "Informar a nova numeração ao APAC",
      "Manter apenas o número antigo",
      "Apagar o controle anterior sem registro",
      "Enviar a bagagem sem atualizar ninguém"
    ],
    "correct": 0
  },
  {
    "question": "Ao decidir ATI ou transferência, o agente deve verificar:",
    "options": [
      "Número da bagagem, destino, rota, conexões, voo, companhia, horário e situação",
      "Somente a cor da mala",
      "Somente o destino final",
      "Somente o peso"
    ],
    "correct": 0
  },
  {
    "question": "Qual afirmação está correta?",
    "options": [
      "Destino final internacional não basta; a rota completa deve ser analisada",
      "Toda bagagem internacional entra na ATI",
      "Toda mala sem etiqueta pode entrar se estiver no carrinho",
      "A Linha de Transferência é igual à ATI"
    ],
    "correct": 0
  },
  {
    "question": "Os três pilares operacionais da ATI neste curso são:",
    "options": [
      "Controle, rastreabilidade e encaminhamento correto",
      "Rapidez, improviso e armazenamento",
      "Venda, atendimento e embarque",
      "Etiqueta, cor e tamanho"
    ],
    "correct": 0
  }
]$quiz_ati$::jsonb,
    '../assets/academy-screenshots/ati-bagagem-gru/ati-gru-cover.png?v=ati-realista-2',
    $material_ati$ATI GRU - Área de Trânsito/Transferência Internacional de Bagagens

Resumo
Curso objetivo para orientar a análise e o tratamento de bagagens internacionais em conexão por GRU, com foco em critérios de entrada na ATI, regra das 4 horas, exceções por perda de conexão, bagagem sem etiqueta, controle APAC, troca de etiqueta e checklist de decisão.

Pontos principais
- ATI não é Linha de Transferência.
- Não aceitar bagagens com destino GRU ou destino doméstico.
- Não decidir apenas pelo destino final; analisar a rota completa.
- Conexão maior que 4 horas pode seguir para ATI se os demais critérios estiverem corretos.
- Conexão menor que 4 horas normalmente segue para Linha de Transferência.
- Bagagem que perdeu conexão pode exigir reroute, RUSH e nova etiqueta.
- Bagagem sem etiqueta exige bingo com numeração atual + reserva do passageiro.
- Toda entrada e saída da ATI deve ser informada ao APAC.
- Troca de etiqueta com nova numeração deve ser comunicada ao APAC.

Aviso operacional
Este curso é material didático interno. A aplicação prática deve respeitar procedimento local, companhia aérea, contrato, supervisão e regras vigentes no aeroporto.$material_ati$,
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
