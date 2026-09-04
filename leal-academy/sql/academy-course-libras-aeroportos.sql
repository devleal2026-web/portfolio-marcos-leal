-- Curso novo: LIBRAS para atendimento em aeroportos.
-- Este script altera somente o registro id = 'libras-atendimento-aeroportos'.
-- Nao altera, reduz ou substitui conteudo de outros cursos e nao interfere nos simuladores.

grant usage on schema public to anon, authenticated;
grant select on public.academy_courses to anon, authenticated;

insert into public.academy_courses (
    id,
    title,
    eyebrow,
    category,
    level,
    duration,
    color,
    summary,
    modules,
    labs,
    quiz,
    cover_path,
    material,
    sort_order
)
values (
    'libras-atendimento-aeroportos',
    'LIBRAS para Atendimento em Aeroportos',
    'Acessibilidade comunicacional',
    'atendimento',
    'Intermediario',
    '5h',
    '#0f766e',
    'Curso autoral sobre LIBRAS e linguagem de sinais aplicadas ao atendimento aeroportuario: comunicacao visual, alfabeto manual, conduta inclusiva, check-in, embarque, conexao, PNAE, AHL, DPR, OHD, simulacoes, perguntas e solucao de problemas.',
    $modules_libras$[
  {
    "title": "Acessibilidade comunicacional no aeroporto",
    "type": "Aula",
    "duration": "18 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/libras-aeroportos/libras-01-acessibilidade.svg",
        "title": "Acessibilidade comunicacional",
        "caption": "Imagem autoral para introduzir atendimento visual, autonomia e respeito no aeroporto."
      }
    ],
    "content": "Objetivo da trilha\nPreparar o agente para iniciar um atendimento acessivel a passageiros surdos, sinalizantes ou com preferencia por comunicacao visual.\n\nConteudo essencial\nLIBRAS e uma lingua visual-espacial, nao uma versao gesticulada do portugues. No aeroporto, isso exige postura objetiva: manter contato visual, garantir boa iluminacao, falar diretamente com o passageiro, usar escrita ou recursos visuais quando necessario e confirmar entendimento antes de prosseguir.\n\nConduta operacional\n- Identifique a melhor forma de comunicacao: LIBRAS, escrita, leitura labial, aplicativo, acompanhante ou interprete.\n- Nunca fale apenas com o acompanhante quando o passageiro puder decidir por si.\n- Evite gritar; volume alto nao resolve barreira visual.\n- Mostre documentos, telas, etiquetas, horarios e portas de embarque sempre que possivel.\n- Confirme a proxima acao: esperar, seguir, assinar, retirar, registrar ou retornar.\n\nContexto aeroportuario\nA comunicacao acessivel aparece no check-in, embarque, conexao, atendimento PNAE, bagagem extraviada, dano, sobra de volume, seguranca e emergencia. A meta nao e decorar tudo, mas criar um fluxo seguro de entendimento."
  },
  {
    "title": "LIBRAS, cultura surda e atendimento respeitoso",
    "type": "Fundamento",
    "duration": "20 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/libras-aeroportos/libras-02-cultura-surda.svg",
        "title": "Cultura surda e LIBRAS",
        "caption": "Apoio visual sobre lingua, identidade, preferencia comunicacional e autonomia."
      }
    ],
    "content": "Objetivo da trilha\nEntender que atendimento inclusivo comeca pela forma como o passageiro e reconhecido.\n\nPontos principais\nA pessoa surda pode se comunicar por LIBRAS, portugues escrito, leitura labial, oralizacao, gestos combinados, aplicativos ou uma mistura desses recursos. O agente nao deve presumir. Pergunte de maneira simples e visual: Voce usa LIBRAS? Prefere escrever? Quer que eu mostre na tela?\n\nAtitudes esperadas\n- Chame a atencao com gesto visual respeitoso, nunca puxando a pessoa.\n- Posicione-se de frente, sem cobrir a boca e sem falar andando.\n- Reduza ruido visual: mostre uma informacao por vez.\n- Respeite o tempo de resposta.\n- Use frases curtas em portugues escrito quando a comunicacao for por texto.\n\nExemplo no aeroporto\nSe o passageiro chega ao balcao apontando para o cartao de embarque, o agente deve olhar para ele, sorrir, indicar que compreendeu e usar a tela, papel ou celular para confirmar: voo, horario, portao, bagagem e necessidade de assistencia."
  },
  {
    "title": "Parametros dos sinais e expressao facial",
    "type": "Aula tecnica",
    "duration": "24 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/libras-aeroportos/libras-03-parametros.svg",
        "title": "Parametros dos sinais",
        "caption": "Diagrama autoral dos componentes que formam sentido em LIBRAS."
      }
    ],
    "content": "Objetivo da trilha\nReconhecer os elementos que diferenciam sinais e evitam comunicacao imprecisa.\n\nBase tecnica\nOs sinais combinam configuracao de mao, ponto de articulacao, movimento, orientacao da palma e expressoes faciais/corporais. Uma pequena mudanca pode alterar o significado. Por isso, o agente iniciante deve usar os sinais aprendidos com cuidado e complementar com confirmacao visual.\n\nAplicacao aeroportuaria\n- Use expressao facial coerente para pergunta, negacao, alerta ou orientacao.\n- Aponte para o recurso visual correto: etiqueta, esteira, portao, documento, mapa ou numero de voo.\n- Se nao souber um sinal, nao invente. Escreva, mostre a tela e confirme.\n- Em orientacoes criticas, combine sinalizacao, escrita e apontamento.\n\nExercicio\nTreine diferenciar uma pergunta simples de uma afirmacao: Voce precisa de ajuda? / Voce precisa esperar. No atendimento real, a expressao facial e corporal ajuda o passageiro a entender a intencao antes mesmo da frase completa."
  },
  {
    "title": "Alfabeto manual, numeros e dados aeroportuarios",
    "type": "Pratica guiada",
    "duration": "26 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/libras-aeroportos/libras-04-alfabeto-numeros.svg",
        "title": "Alfabeto e numeros",
        "caption": "Apoio para nomes, codigos, horarios, voos e etiquetas de bagagem."
      }
    ],
    "content": "Objetivo da trilha\nUsar datilologia e numeros como apoio para confirmar dados que exigem precisao.\n\nQuando usar\nO alfabeto manual ajuda em nomes proprios, aeroportos, siglas IATA, companhia, localizador, sobrenome, hotel e enderecos. Numeros sao essenciais para voo, horario, assento, etiqueta de bagagem, telefone e protocolo.\n\nBoas praticas\n- Soletrar devagar e em campo visual claro.\n- Dividir sequencias longas: voo, data, etiqueta e telefone em blocos.\n- Confirmar apontando para o papel, tela ou documento.\n- Pedir repeticao com respeito quando houver duvida.\n- Nao substituir todo o atendimento por soletracao; use apenas para dados especificos.\n\nSimulacao\nO passageiro informa etiqueta 1234567890. O agente divide em blocos, registra, mostra na tela e pergunta se esta correto. Depois confirma origem, conexao e destino, usando escrita curta e apontamento no itinerario."
  },
  {
    "title": "Primeiro contato e triagem de necessidade",
    "type": "Simulacao",
    "duration": "25 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/libras-aeroportos/libras-05-primeiro-contato.svg",
        "title": "Primeiro contato",
        "caption": "Fluxo visual de acolhimento, identificacao da necessidade e confirmacao."
      }
    ],
    "content": "Objetivo da trilha\nConduzir os primeiros 60 segundos do atendimento com clareza e controle.\n\nFluxo recomendado\n1. Cumprimente visualmente.\n2. Verifique a preferencia comunicacional.\n3. Identifique o motivo: check-in, embarque, bagagem, conexao, informacao, PNAE ou problema.\n4. Mostre o recurso de apoio: tela, formulario, mapa, placa, protocolo ou etiqueta.\n5. Confirme a proxima acao.\n\nFrases curtas para escrita de apoio\n- Como posso ajudar?\n- Voce prefere LIBRAS, escrita ou leitura da tela?\n- Vou verificar seu voo.\n- Preciso do documento e da passagem.\n- Aguarde aqui, por favor.\n- Vou chamar apoio.\n\nCenario\nPassageiro surdo chega agitado porque nao encontra o portao. O agente mostra o cartao de embarque, consulta o monitor, escreve: Portao mudou para B12. Embarque 18:40. Siga comigo ate a placa B. Confirma se o passageiro entendeu antes de encerrar."
  },
  {
    "title": "Check-in, documentos e despacho de bagagem",
    "type": "Oficina",
    "duration": "30 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/libras-aeroportos/libras-06-checkin.svg",
        "title": "Check-in e bagagem",
        "caption": "Cenario autoral de balcao, documento, etiqueta e despacho de volume."
      }
    ],
    "content": "Objetivo da trilha\nAtender passageiro surdo no check-in sem perda de informacao operacional.\n\nPontos de controle\n- Documento valido e nome conforme reserva.\n- Voo, destino, conexao e horario.\n- Bagagem de mao e bagagem despachada.\n- Peso, volume extra, item especial ou restricao.\n- Assento, prioridade, assistencia e necessidade de acompanhamento.\n- Entrega da etiqueta e explicacao do destino final da bagagem.\n\nConduta tecnica\nMostre a etiqueta e aponte destino, data e numero. Se houver conexao ou retirada obrigatoria, escreva a instrucao. Para itens especiais, use desenho simples ou lista de opcoes. Se o passageiro nao compreender uma regra, acione apoio adequado em vez de encerrar rapidamente.\n\nSimulacao\nO passageiro tem conexao e pergunta se a mala vai ate o destino final. O agente mostra a etiqueta, destaca o aeroporto final, escreve a rota e confirma: sua bagagem segue ate o destino X. Caso precise retirar em algum ponto, a informacao deve ficar visivel e registrada."
  },
  {
    "title": "Embarque, conexao, atraso e portao",
    "type": "Pratica operacional",
    "duration": "28 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/libras-aeroportos/libras-07-embarque.svg",
        "title": "Embarque e conexao",
        "caption": "Apoio visual para comunicacao de portao, atraso, chamada e conexao."
      }
    ],
    "content": "Objetivo da trilha\nComunicar mudancas de voo com rapidez sem gerar abandono de informacao.\n\nSituacoes comuns\n- Troca de portao.\n- Atraso ou cancelamento.\n- Chamada de embarque.\n- Conexao curta.\n- Remarcacao.\n- Prioridade ou assistencia PNAE.\n\nMetodo visual\nUse monitor, cartao de embarque, mapa do terminal e escrita curta. Evite explicar tudo de costas para o passageiro ou apontar sem contexto. Em atraso, escreva o novo horario e o local de espera. Em conexao, desenhe rota simples: chegada, seguranca, portao, tempo.\n\nCenario\nVoo mudou do portao 04 para 12. O agente mostra o painel, escreve PORTAO 12, desenha seta para o corredor e pergunta se o passageiro quer acompanhamento. Se houver tempo curto, aciona apoio e registra a necessidade no fluxo operacional."
  },
  {
    "title": "Bagagem no desembarque: AHL, DPR e OHD",
    "type": "Simulacao integrada",
    "duration": "34 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/libras-aeroportos/libras-08-bagagem.svg",
        "title": "Bagagem no desembarque",
        "caption": "Cenario de entrevista acessivel para extravio, dano e bagagem sobrante."
      }
    ],
    "content": "Objetivo da trilha\nRealizar entrevista acessivel em irregularidades de bagagem no desembarque.\n\nAHL - bagagem nao localizada\nColete etiqueta, rota, descricao visual, conteudo por categorias, endereco, telefone, e-mail e urgencia. Mostre o numero do processo e explique o acompanhamento.\n\nDPR - dano ou violacao\nVerifique dano, fotos, etiqueta, tipo de ocorrencia, prazo, politica aplicavel e orientacao de continuidade. Evite prometer compensacao sem validacao.\n\nOHD - bagagem sobrante\nRegistre identificacao, local de guarda, evidencias e possivel match. Se um passageiro surdo procura mala parecida, compare etiqueta, descricao e conteudo com calma.\n\nSimulacao\nPassageiro surdo nao encontra a mala. O agente mostra esteira, etiqueta, formulario e campos do sistema. Escreve: vou abrir registro de busca. Preciso confirmar rota, mala e contato. Ao final, mostra protocolo e proxima comunicacao."
  },
  {
    "title": "Atendimento PNAE e apoio com autonomia",
    "type": "Aula pratica",
    "duration": "26 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/libras-aeroportos/libras-09-pnae.svg",
        "title": "Atendimento PNAE",
        "caption": "Imagem sobre consentimento, rota assistida, autonomia e comunicacao direta."
      }
    ],
    "content": "Objetivo da trilha\nOferecer apoio sem retirar autonomia do passageiro.\n\nPrincipios\nA necessidade auditiva ou comunicacional nao autoriza conduzir a pessoa sem consentimento. Pergunte antes de acompanhar, tocar, chamar cadeira, mudar fila ou envolver terceiros. O passageiro deve receber a informacao diretamente sempre que possivel.\n\nFluxo PNAE\n- Identifique a assistencia solicitada.\n- Confirme preferencia de comunicacao.\n- Explique etapa atual e proxima etapa.\n- Registre necessidade de acompanhamento quando aplicavel.\n- Avise equipe de portao, embarque, conexao ou desembarque.\n\nExemplo\nPassageiro surdo em conexao curta solicita ajuda. O agente confirma destino, portao, tempo e necessidade de acompanhamento. Escreve: vou acompanhar ate o portao. Podemos ir agora? So inicia deslocamento apos confirmacao clara."
  },
  {
    "title": "Seguranca, emergencia e orientacoes criticas",
    "type": "Protocolo",
    "duration": "24 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/libras-aeroportos/libras-10-seguranca.svg",
        "title": "Seguranca e emergencia",
        "caption": "Apoio para mensagens visuais de pare, espere, siga e peca ajuda."
      }
    ],
    "content": "Objetivo da trilha\nTransmitir orientacoes urgentes de modo simples e verificavel.\n\nSituacoes criticas\n- Area restrita.\n- Evacuacao.\n- Inspecao de seguranca.\n- Item proibido.\n- Alteracao de fluxo.\n- Passageiro perdido ou sem contato.\n\nBoas praticas\nUse gestos universais simples, placas, escrita objetiva e demonstracao visual. Em emergencia, priorize instrucoes curtas: PARE, ESPERE, SIGA COMIGO, DOCUMENTO, BOLSA NA BANDEJA, NAO ENTRE. Confirme por resposta visual ou acao correta.\n\nLimite de atuacao\nO agente em formacao basica nao deve improvisar interpretacao complexa em situacoes juridicas, medicas ou de seguranca sensivel. Deve acionar profissional habilitado, supervisor ou canal de apoio conforme protocolo."
  },
  {
    "title": "Dialogos praticos em aeroporto",
    "type": "Roleplay",
    "duration": "32 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/libras-aeroportos/libras-11-dialogos.svg",
        "title": "Dialogos praticos",
        "caption": "Simulacoes com perguntas, respostas, confirmacao e resolucao."
      }
    ],
    "content": "Objetivo da trilha\nTreinar interacoes completas com inicio, coleta, solucao e fechamento.\n\nDialogo 1 - Check-in\nAgente: Como posso ajudar? Passageiro: voo para Recife. Agente confirma documento, reserva, bagagem, assento e etiqueta.\n\nDialogo 2 - Portao alterado\nPassageiro mostra cartao. Agente consulta painel, escreve novo portao, horario e rota ate o local.\n\nDialogo 3 - Mala nao chegou\nPassageiro mostra comprovante. Agente abre atendimento, confirma etiqueta, rota, descricao e contato, depois mostra protocolo.\n\nDialogo 4 - Dano de bagagem\nAgente observa dano, registra evidencias, explica prazo e proxima etapa.\n\nRegra de ouro\nCada dialogo termina com confirmacao: o passageiro sabe o que aconteceu, onde deve ir, quanto deve esperar, qual documento/protocolo possui e como recebera retorno."
  },
  {
    "title": "Simulacoes avaliativas e melhoria continua",
    "type": "Avaliacao pratica",
    "duration": "33 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/libras-aeroportos/libras-12-simulacoes.svg",
        "title": "Simulacoes avaliativas",
        "caption": "Checklist autoral para roleplay, avaliacao e feedback de atendimento."
      }
    ],
    "content": "Objetivo da trilha\nAvaliar se o aluno consegue aplicar LIBRAS basica, recursos visuais e conduta aeroportuaria segura.\n\nSimulacoes sugeridas\n1. Passageiro surdo faz check-in com bagagem e conexao.\n2. Passageiro precisa localizar portao apos alteracao.\n3. Passageiro abre AHL por mala nao localizada.\n4. Passageiro registra DPR por dano aparente.\n5. Passageiro PNAE precisa de apoio ate o embarque.\n6. Agente comunica atraso e novo horario.\n\nCriterios de avaliacao\n- Abordagem respeitosa.\n- Contato visual e ambiente adequado.\n- Uso correto de escrita, telas e apontamento.\n- Confirmacao de dados criticos.\n- Registro operacional completo.\n- Encerramento com proxima acao clara.\n\nMensagem final\nO objetivo nao e substituir interprete nem formar fluencia completa em LIBRAS. O curso prepara o atendimento aeroportuario para reduzir barreiras, organizar informacoes e proteger a autonomia do passageiro."
  }
]$modules_libras$::jsonb,
    $labs_libras$[
  {
    "label": "Simular check-in acessivel",
    "href": "checkin.html"
  },
  {
    "label": "Simular AHL no desembarque",
    "href": "ahl.html"
  },
  {
    "label": "Simular DPR com atendimento acessivel",
    "href": "dpr.html"
  },
  {
    "label": "Simular OHD e match de bagagem",
    "href": "ohd.html"
  },
  {
    "label": "Biblioteca operacional",
    "href": "operational-library.html"
  }
]$labs_libras$::jsonb,
    $quiz_libras$[
  {
    "question": "Qual e a conduta correta ao atender um passageiro surdo?",
    "options": [
      "Falar diretamente com o passageiro e confirmar a melhor forma de comunicacao",
      "Falar apenas com o acompanhante",
      "Gritar para facilitar leitura labial",
      "Encerrar rapido para evitar demora"
    ],
    "correct": 0
  },
  {
    "question": "LIBRAS deve ser entendida como:",
    "options": [
      "Uma lingua visual-espacial com estrutura propria",
      "Mimica universal",
      "Portugues com gestos",
      "Codigo informal sem regras"
    ],
    "correct": 0
  },
  {
    "question": "Quais elementos formam os sinais em LIBRAS?",
    "options": [
      "Configuracao de mao, ponto, movimento, orientacao e expressao",
      "Apenas velocidade da fala",
      "Somente letras do alfabeto manual",
      "Apenas desenhos no papel"
    ],
    "correct": 0
  },
  {
    "question": "Quando a datilologia e mais util no aeroporto?",
    "options": [
      "Para nomes, codigos, voos, etiquetas e dados que exigem precisao",
      "Para substituir toda conversa",
      "Para evitar confirmacao na tela",
      "Para acelerar sem registrar dados"
    ],
    "correct": 0
  },
  {
    "question": "Em uma troca de portao, o agente deve:",
    "options": [
      "Mostrar o novo portao, escrever a informacao e confirmar entendimento",
      "Apontar rapidamente e sair",
      "Avisar somente por audio",
      "Esperar o passageiro descobrir sozinho"
    ],
    "correct": 0
  },
  {
    "question": "No check-in, a etiqueta de bagagem deve ser usada para:",
    "options": [
      "Confirmar visualmente destino, rota e numero do volume",
      "Substituir documento do passageiro",
      "Ocultar a rota da mala",
      "Evitar explicacao sobre conexao"
    ],
    "correct": 0
  },
  {
    "question": "Ao abrir AHL para passageiro surdo, o agente deve coletar:",
    "options": [
      "Etiqueta, rota, descricao, conteudo por categorias, contato e protocolo",
      "Somente cor da mala",
      "Apenas nome do passageiro",
      "Apenas foto da mala"
    ],
    "correct": 0
  },
  {
    "question": "Em DPR, a comunicacao deve deixar claro:",
    "options": [
      "Dano observado, evidencias, prazo e proxima etapa",
      "Promessa automatica de compensacao",
      "Que nao e preciso registrar",
      "Que o passageiro deve resolver sozinho"
    ],
    "correct": 0
  },
  {
    "question": "No atendimento PNAE, antes de tocar ou conduzir o passageiro, e necessario:",
    "options": [
      "Pedir consentimento e explicar a acao",
      "Agir rapido sem perguntar",
      "Falar somente com terceiros",
      "Assumir que toda pessoa surda precisa cadeira"
    ],
    "correct": 0
  },
  {
    "question": "Em emergencia, mensagens para passageiro surdo devem ser:",
    "options": [
      "Curtas, visuais, confirmadas e alinhadas ao protocolo",
      "Longas e apenas verbais",
      "Sem contato visual",
      "Baseadas em improviso"
    ],
    "correct": 0
  },
  {
    "question": "Se o agente nao souber um sinal, deve:",
    "options": [
      "Usar escrita, tela ou apoio adequado e confirmar entendimento",
      "Inventar um sinal parecido",
      "Ignorar a pergunta",
      "Pedir para o passageiro adivinhar"
    ],
    "correct": 0
  },
  {
    "question": "O encerramento ideal de uma interacao acessivel garante que o passageiro saiba:",
    "options": [
      "O que ocorreu, proxima acao, local, prazo ou protocolo",
      "Apenas o nome do agente",
      "Somente que deve esperar",
      "Nada alem de um gesto final"
    ],
    "correct": 0
  }
]$quiz_libras$::jsonb,
    '../assets/academy-screenshots/libras-aeroportos/libras-01-acessibilidade.svg',
    $material_libras$LIBRAS e Linguagem de Sinais para Atendimento em Aeroportos

Resumo operacional
Este curso autoral adapta fundamentos de LIBRAS para situacoes de atendimento aeroportuario. O foco e comunicacao inicial, respeito, apoio visual, coleta correta de dados e solucao de problemas em check-in, embarque, conexao, atendimento PNAE, AHL, DPR e OHD.

Principios de atendimento
1. Fale diretamente com o passageiro.
2. Pergunte a preferencia comunicacional.
3. Mantenha contato visual e boa iluminacao.
4. Use escrita curta, tela, mapa, etiqueta e demonstracao visual.
5. Confirme entendimento antes de agir.
6. Preserve autonomia e privacidade.
7. Acione interprete, supervisor ou apoio especializado quando a situacao exigir.

Guia de frases para escrita de apoio
- Como posso ajudar?
- Voce usa LIBRAS?
- Prefere escrever?
- Preciso do seu documento.
- Vou verificar seu voo.
- Seu portao mudou.
- Aguarde aqui, por favor.
- Vou acompanhar voce.
- Preciso da etiqueta da bagagem.
- Vou abrir um registro.
- Este e o numero do protocolo.
- Voce entendeu? Posso confirmar?

Glossario operacional para treinamento
Aeroporto, voo, portao, embarque, desembarque, conexao, atraso, cancelado, assento, documento, passagem, bagagem, etiqueta, mala, esteira, peso, prioridade, assistencia, cadeira de rodas, acompanhante, protocolo, telefone, e-mail, endereco, dano, violacao, extravio, objeto esquecido, espera, ajuda, seguir, parar, confirmar.

Simulacoes de aula
Turma A: check-in acessivel com despacho de bagagem e conexao.
Turma B: alteracao de portao e atraso comunicado a passageiro surdo.
Turma C: AHL no desembarque com entrevista completa e protocolo.
Turma D: DPR com dano/violacao e explicacao de continuidade.
Turma E: atendimento PNAE com acompanhamento ate o portao.

Observacao didatica
As imagens deste curso sao apoios visuais autorais e nao substituem demonstracao por instrutor fluente em LIBRAS. Para sinais especificos, pratique com profissional qualificado e valide variacoes regionais antes de aplicar em atendimento real.$material_libras$,
    470
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
where id = 'libras-atendimento-aeroportos';
