-- Curso novo: LIBRAS para atendimento em aeroportos.
-- Este script altera somente o registro id = 'libras-atendimento-aeroportos'.
-- Não altera, reduz ou substitui conteúdo de outros cursos e não interfere nos simuladores.

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
    'Intermediário',
    '5h',
    '#0f766e',
    'Curso autoral sobre LIBRAS e linguagem de sinais aplicadas ao atendimento aeroportuário: comunicação visual, alfabeto manual, conduta inclusiva, check-in, embarque, conexão, PNAE, AHL, DPR, OHD, simulações, perguntas e solução de problemas.',
    $modules_libras$[
  {
    "title": "Acessibilidade comunicacional no aeroporto",
    "type": "Aula",
    "duration": "18 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/libras-aeroportos/libras-01-acessibilidade.svg?v=4",
        "title": "Acessibilidade comunicacional",
        "caption": "Saudação e abertura em LIBRAS com avatar genérico de agente e soletração OLA/AJUDA."
      }
    ],
    "content": "Objetivo da trilha\nPreparar o agente para iniciar um atendimento acessível a passageiros surdos, sinalizantes ou com preferência por comunicação visual.\n\nConteúdo essencial\nLIBRAS é uma língua visual-espacial, não uma versão gesticulada do português. No aeroporto, isso exige postura objetiva: manter contato visual, garantir boa iluminação, falar diretamente com o passageiro, usar escrita ou recursos visuais quando necessário e confirmar entendimento antes de prosseguir.\n\nConduta operacional\n- Identifique a melhor forma de comunicação: LIBRAS, escrita, leitura labial, aplicativo, acompanhante ou intérprete.\n- Nunca fale apenas com o acompanhante quando o passageiro puder decidir por si.\n- Evite gritar; volume alto não resolve barreira visual.\n- Mostre documentos, telas, etiquetas, horários e portas de embarque sempre que possível.\n- Confirme a próxima ação: esperar, seguir, assinar, retirar, registrar ou retornar.\n\nContexto aeroportuário\nA comunicação acessível aparece no check-in, embarque, conexão, atendimento PNAE, bagagem extraviada, dano, sobra de volume, segurança e emergência. A meta não é decorar tudo, mas criar um fluxo seguro de entendimento."
  },
  {
    "title": "LIBRAS, cultura surda e atendimento respeitoso",
    "type": "Fundamento",
    "duration": "20 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/libras-aeroportos/libras-02-cultura-surda.svg?v=4",
        "title": "Cultura surda e LIBRAS",
        "caption": "Pronomes e comunicação direta: EU, VOCÊ e aplicação no atendimento ao passageiro."
      }
    ],
    "content": "Objetivo da trilha\nEntender que atendimento inclusivo começa pela forma como o passageiro é reconhecido.\n\nPontos principais\nA pessoa surda pode se comunicar por LIBRAS, português escrito, leitura labial, oralização, gestos combinados, aplicativos ou uma mistura desses recursos. O agente não deve presumir. Pergunte de maneira simples e visual: Você usa LIBRAS? Prefere escrever? Quer que eu mostre na tela?\n\nAtitudes esperadas\n- Chame a atenção com gesto visual respeitoso, nunca puxando a pessoa.\n- Posicione-se de frente, sem cobrir a boca e sem falar andando.\n- Reduza ruído visual: mostre uma informação por vez.\n- Respeite o tempo de resposta.\n- Use frases curtas em português escrito quando a comunicação for por texto.\n\nExemplo no aeroporto\nSe o passageiro chega ao balcão apontando para o cartão de embarque, o agente deve olhar para ele, sorrir, indicar que compreendeu e usar a tela, papel ou celular para confirmar: voo, horário, portão, bagagem e necessidade de assistência."
  },
  {
    "title": "Parâmetros dos sinais e expressão facial",
    "type": "Aula técnica",
    "duration": "24 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/libras-aeroportos/libras-03-parametros.svg?v=4",
        "title": "Parâmetros dos sinais",
        "caption": "Parâmetros dos sinais com mão, movimento, orientação e expressão facial/corporal."
      }
    ],
    "content": "Objetivo da trilha\nReconhecer os elementos que diferenciam sinais e evitam comunicação imprecisa.\n\nBase técnica\nOs sinais combinam configuração de mão, ponto de articulação, movimento, orientação da palma e expressões faciais/corporais. Uma pequena mudança pode alterar o significado. Por isso, o agente iniciante deve usar os sinais aprendidos com cuidado e complementar com confirmação visual.\n\nAplicação aeroportuária\n- Use expressão facial coerente para pergunta, negação, alerta ou orientação.\n- Aponte para o recurso visual correto: etiqueta, esteira, portão, documento, mapa ou número de voo.\n- Se não souber um sinal, não invente. Escreva, mostre a tela e confirme.\n- Em orientações críticas, combine sinalização, escrita e apontamento.\n\nExercício\nTreine diferenciar uma pergunta simples de uma afirmação: Você precisa de ajuda? / Você precisa esperar. No atendimento real, a expressão facial e corporal ajuda o passageiro a entender a intenção antes mesmo da frase completa."
  },
  {
    "title": "Alfabeto manual, números e dados aeroportuários",
    "type": "Prática guiada",
    "duration": "26 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/libras-aeroportos/libras-04-alfabeto-numeros.svg?v=4",
        "title": "Alfabeto e números",
        "caption": "Alfabeto manual e números em quadro autoral para datilologia aeroportuária."
      }
    ],
    "content": "Objetivo da trilha\nUsar datilologia e números como apoio para confirmar dados que exigem precisão.\n\nQuando usar\nO alfabeto manual ajuda em nomes próprios, aeroportos, siglas IATA, companhia, localizador, sobrenome, hotel e endereços. Números são essenciais para voo, horário, assento, etiqueta de bagagem, telefone e protocolo.\n\nBoas práticas\n- Soletrar devagar e em campo visual claro.\n- Dividir sequências longas: voo, data, etiqueta e telefone em blocos.\n- Confirmar apontando para o papel, tela ou documento.\n- Pedir repetição com respeito quando houver dúvida.\n- Não substituir todo o atendimento por soletração; use apenas para dados específicos.\n\nSimulação\nO passageiro informa etiqueta 1234567890. O agente divide em blocos, registra, mostra na tela e pergunta se está correto. Depois confirma origem, conexão e destino, usando escrita curta e apontamento no itinerário."
  },
  {
    "title": "Primeiro contato e triagem de necessidade",
    "type": "Simulação",
    "duration": "25 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/libras-aeroportos/libras-05-primeiro-contato.svg?v=4",
        "title": "Primeiro contato",
        "caption": "Perguntas iniciais e soletração de VOCÊ/QUAL para triagem de atendimento."
      }
    ],
    "content": "Objetivo da trilha\nConduzir os primeiros 60 segundos do atendimento com clareza e controle.\n\nFluxo recomendado\n1. Cumprimente visualmente.\n2. Verifique a preferência comunicacional.\n3. Identifique o motivo: check-in, embarque, bagagem, conexão, informação, PNAE ou problema.\n4. Mostre o recurso de apoio: tela, formulário, mapa, placa, protocolo ou etiqueta.\n5. Confirme a próxima ação.\n\nFrases curtas para escrita de apoio\n- Como posso ajudar?\n- Você prefere LIBRAS, escrita ou leitura da tela?\n- Vou verificar seu voo.\n- Preciso do documento e da passagem.\n- Aguarde aqui, por favor.\n- Vou chamar apoio.\n\nCenário\nPassageiro surdo chega agitado porque não encontra o portão. O agente mostra o cartão de embarque, consulta o monitor, escreve: Portão mudou para B12. Embarque 18:40. Siga comigo até a placa B. Confirma se o passageiro entendeu antes de encerrar."
  },
  {
    "title": "Check-in, documentos e despacho de bagagem",
    "type": "Oficina",
    "duration": "30 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/libras-aeroportos/libras-06-checkin.svg?v=4",
        "title": "Check-in e bagagem",
        "caption": "Check-in com VOO, números, documento, assento, etiqueta e destino final."
      }
    ],
    "content": "Objetivo da trilha\nAtender passageiro surdo no check-in sem perda de informação operacional.\n\nPontos de controle\n- Documento válido e nome conforme reserva.\n- Voo, destino, conexão e horário.\n- Bagagem de mão e bagagem despachada.\n- Peso, volume extra, item especial ou restrição.\n- Assento, prioridade, assistência e necessidade de acompanhamento.\n- Entrega da etiqueta e explicação do destino final da bagagem.\n\nConduta técnica\nMostre a etiqueta e aponte destino, data e número. Se houver conexão ou retirada obrigatória, escreva a instrução. Para itens especiais, use desenho simples ou lista de opções. Se o passageiro não compreender uma regra, acione apoio adequado em vez de encerrar rapidamente.\n\nSimulação\nO passageiro tem conexão e pergunta se a mala vai até o destino final. O agente mostra a etiqueta, destaca o aeroporto final, escreve a rota e confirma: sua bagagem segue até o destino X. Caso precise retirar em algum ponto, a informação deve ficar visível e registrada."
  },
  {
    "title": "Embarque, conexão, atraso e portão",
    "type": "Prática operacional",
    "duration": "28 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/libras-aeroportos/libras-07-embarque.svg?v=4",
        "title": "Embarque e conexão",
        "caption": "Horário, duração, ATRASO e PORTÃO B12 em contexto de embarque e conexão."
      }
    ],
    "content": "Objetivo da trilha\nComunicar mudanças de voo com rapidez sem gerar abandono de informação.\n\nSituações comuns\n- Troca de portão.\n- Atraso ou cancelamento.\n- Chamada de embarque.\n- Conexão curta.\n- Remarcação.\n- Prioridade ou assistência PNAE.\n\nMétodo visual\nUse monitor, cartão de embarque, mapa do terminal e escrita curta. Evite explicar tudo de costas para o passageiro ou apontar sem contexto. Em atraso, escreva o novo horário e o local de espera. Em conexão, desenhe rota simples: chegada, segurança, portão, tempo.\n\nCenário\nVoo mudou do portão 04 para 12. O agente mostra o painel, escreve PORTÃO 12, desenha seta para o corredor e pergunta se o passageiro quer acompanhamento. Se houver tempo curto, aciona apoio e registra a necessidade no fluxo operacional."
  },
  {
    "title": "Bagagem no desembarque: AHL, DPR e OHD",
    "type": "Simulação integrada",
    "duration": "34 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/libras-aeroportos/libras-08-bagagem.svg?v=4",
        "title": "Bagagem no desembarque",
        "caption": "Bagagem com cores, MALA e aplicação em AHL, DPR e OHD no desembarque."
      }
    ],
    "content": "Objetivo da trilha\nRealizar entrevista acessível em irregularidades de bagagem no desembarque.\n\nAHL - bagagem não localizada\nColete etiqueta, rota, descrição visual, conteúdo por categorias, endereço, telefone, e-mail e urgência. Mostre o número do processo e explique o acompanhamento.\n\nDPR - dano ou violação\nVerifique dano, fotos, etiqueta, tipo de ocorrência, prazo, política aplicável e orientação de continuidade. Evite prometer compensação sem validação.\n\nOHD - bagagem sobrante\nRegistre identificação, local de guarda, evidências e possível match. Se um passageiro surdo procura mala parecida, compare etiqueta, descrição e conteúdo com calma.\n\nSimulação\nPassageiro surdo não encontra a mala. O agente mostra esteira, etiqueta, formulário e campos do sistema. Escreve: vou abrir registro de busca. Preciso confirmar rota, mala e contato. Ao final, mostra protocolo e próxima comunicação."
  },
  {
    "title": "Atendimento PNAE e apoio com autonomia",
    "type": "Aula prática",
    "duration": "26 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/libras-aeroportos/libras-09-pnae.svg?v=4",
        "title": "Atendimento PNAE",
        "caption": "Atendimento PNAE com AJUDA, consentimento e autonomia do passageiro."
      }
    ],
    "content": "Objetivo da trilha\nOferecer apoio sem retirar autonomia do passageiro.\n\nPrincípios\nA necessidade auditiva ou comunicacional não autoriza conduzir a pessoa sem consentimento. Pergunte antes de acompanhar, tocar, chamar cadeira, mudar fila ou envolver terceiros. O passageiro deve receber a informação diretamente sempre que possível.\n\nFluxo PNAE\n- Identifique a assistência solicitada.\n- Confirme preferência de comunicação.\n- Explique etapa atual e próxima etapa.\n- Registre necessidade de acompanhamento quando aplicável.\n- Avise equipe de portão, embarque, conexão ou desembarque.\n\nExemplo\nPassageiro surdo em conexão curta solicita ajuda. O agente confirma destino, portão, tempo e necessidade de acompanhamento. Escreve: vou acompanhar até o portão. Podemos ir agora? Só inicia deslocamento após confirmação clara."
  },
  {
    "title": "Segurança, emergência e orientações críticas",
    "type": "Protocolo",
    "duration": "24 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/libras-aeroportos/libras-10-seguranca.svg?v=4",
        "title": "Segurança e emergência",
        "caption": "Negação e orientação crítica: NÃO, PARE e SIGA em segurança aeroportuária."
      }
    ],
    "content": "Objetivo da trilha\nTransmitir orientações urgentes de modo simples e verificável.\n\nSituações críticas\n- Área restrita.\n- Evacuação.\n- Inspeção de segurança.\n- Item proibido.\n- Alteração de fluxo.\n- Passageiro perdido ou sem contato.\n\nBoas práticas\nUse gestos universais simples, placas, escrita objetiva e demonstração visual. Em emergência, priorize instruções curtas: PARE, ESPERE, SIGA COMIGO, DOCUMENTO, BOLSA NA BANDEJA, NÃO ENTRE. Confirme por resposta visual ou ação correta.\n\nLimite de atuação\nO agente em formação básica não deve improvisar interpretação complexa em situações jurídicas, médicas ou de segurança sensível. Deve acionar profissional habilitado, supervisor ou canal de apoio conforme protocolo."
  },
  {
    "title": "Diálogos práticos em aeroporto",
    "type": "Roleplay",
    "duration": "32 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/libras-aeroportos/libras-11-dialogos.svg?v=4",
        "title": "Diálogos práticos",
        "caption": "Diálogos práticos: perguntas, respostas, repetição e fechamento com protocolo."
      }
    ],
    "content": "Objetivo da trilha\nTreinar interações completas com início, coleta, solução e fechamento.\n\nDiálogo 1 - Check-in\nAgente: Como posso ajudar? Passageiro: voo para Recife. Agente confirma documento, reserva, bagagem, assento e etiqueta.\n\nDiálogo 2 - Portão alterado\nPassageiro mostra cartão. Agente consulta painel, escreve novo portão, horário e rota até o local.\n\nDiálogo 3 - Mala não chegou\nPassageiro mostra comprovante. Agente abre atendimento, confirma etiqueta, rota, descrição e contato, depois mostra protocolo.\n\nDiálogo 4 - Dano de bagagem\nAgente observa dano, registra evidências, explica prazo e próxima etapa.\n\nRegra de ouro\nCada diálogo termina com confirmação: o passageiro sabe o que aconteceu, onde deve ir, quanto deve esperar, qual documento/protocolo possui e como receberá retorno."
  },
  {
    "title": "Simulações avaliativas e melhoria contínua",
    "type": "Avaliação prática",
    "duration": "33 min",
    "screenshots": [
      {
        "src": "../assets/academy-screenshots/libras-aeroportos/libras-12-simulacoes.svg?v=4",
        "title": "Simulações avaliativas",
        "caption": "Simulação avaliativa com OK, checklist operacional e confirmação final."
      }
    ],
    "content": "Objetivo da trilha\nAvaliar se o aluno consegue aplicar LIBRAS básica, recursos visuais e conduta aeroportuária segura.\n\nSimulações sugeridas\n1. Passageiro surdo faz check-in com bagagem e conexão.\n2. Passageiro precisa localizar portão após alteração.\n3. Passageiro abre AHL por mala não localizada.\n4. Passageiro registra DPR por dano aparente.\n5. Passageiro PNAE precisa de apoio até o embarque.\n6. Agente comunica atraso e novo horário.\n\nCritérios de avaliação\n- Abordagem respeitosa.\n- Contato visual e ambiente adequado.\n- Uso correto de escrita, telas e apontamento.\n- Confirmação de dados críticos.\n- Registro operacional completo.\n- Encerramento com próxima ação clara.\n\nMensagem final\nO objetivo não é substituir intérprete nem formar fluência completa em LIBRAS. O curso prepara o atendimento aeroportuário para reduzir barreiras, organizar informações e proteger a autonomia do passageiro."
  }
]$modules_libras$::jsonb,
    $labs_libras$[
  {
    "label": "Simular check-in acessível",
    "href": "checkin.html"
  },
  {
    "label": "Simular AHL no desembarque",
    "href": "ahl.html"
  },
  {
    "label": "Simular DPR com atendimento acessível",
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
    "question": "Qual é a conduta correta ao atender um passageiro surdo?",
    "options": [
      "Falar diretamente com o passageiro e confirmar a melhor forma de comunicação",
      "Falar apenas com o acompanhante",
      "Gritar para facilitar leitura labial",
      "Encerrar rápido para evitar demora"
    ],
    "correct": 0
  },
  {
    "question": "LIBRAS deve ser entendida como:",
    "options": [
      "Uma língua visual-espacial com estrutura própria",
      "Mímica universal",
      "Português com gestos",
      "Código informal sem regras"
    ],
    "correct": 0
  },
  {
    "question": "Quais elementos formam os sinais em LIBRAS?",
    "options": [
      "Configuração de mão, ponto, movimento, orientação e expressão",
      "Apenas velocidade da fala",
      "Somente letras do alfabeto manual",
      "Apenas desenhos no papel"
    ],
    "correct": 0
  },
  {
    "question": "Quando a datilologia é mais útil no aeroporto?",
    "options": [
      "Para nomes, códigos, voos, etiquetas e dados que exigem precisão",
      "Para substituir toda conversa",
      "Para evitar confirmação na tela",
      "Para acelerar sem registrar dados"
    ],
    "correct": 0
  },
  {
    "question": "Em uma troca de portão, o agente deve:",
    "options": [
      "Mostrar o novo portão, escrever a informação e confirmar entendimento",
      "Apontar rapidamente e sair",
      "Avisar somente por áudio",
      "Esperar o passageiro descobrir sozinho"
    ],
    "correct": 0
  },
  {
    "question": "No check-in, a etiqueta de bagagem deve ser usada para:",
    "options": [
      "Confirmar visualmente destino, rota e número do volume",
      "Substituir documento do passageiro",
      "Ocultar a rota da mala",
      "Evitar explicação sobre conexão"
    ],
    "correct": 0
  },
  {
    "question": "Ao abrir AHL para passageiro surdo, o agente deve coletar:",
    "options": [
      "Etiqueta, rota, descrição, conteúdo por categorias, contato e protocolo",
      "Somente cor da mala",
      "Apenas nome do passageiro",
      "Apenas foto da mala"
    ],
    "correct": 0
  },
  {
    "question": "Em DPR, a comunicação deve deixar claro:",
    "options": [
      "Dano observado, evidências, prazo e próxima etapa",
      "Promessa automática de compensação",
      "Que não é preciso registrar",
      "Que o passageiro deve resolver sozinho"
    ],
    "correct": 0
  },
  {
    "question": "No atendimento PNAE, antes de tocar ou conduzir o passageiro, é necessário:",
    "options": [
      "Pedir consentimento e explicar a ação",
      "Agir rápido sem perguntar",
      "Falar somente com terceiros",
      "Assumir que toda pessoa surda precisa cadeira"
    ],
    "correct": 0
  },
  {
    "question": "Em emergência, mensagens para passageiro surdo devem ser:",
    "options": [
      "Curtas, visuais, confirmadas e alinhadas ao protocolo",
      "Longas e apenas verbais",
      "Sem contato visual",
      "Baseadas em improviso"
    ],
    "correct": 0
  },
  {
    "question": "Se o agente não souber um sinal, deve:",
    "options": [
      "Usar escrita, tela ou apoio adequado e confirmar entendimento",
      "Inventar um sinal parecido",
      "Ignorar a pergunta",
      "Pedir para o passageiro adivinhar"
    ],
    "correct": 0
  },
  {
    "question": "O encerramento ideal de uma interação acessível garante que o passageiro saiba:",
    "options": [
      "O que ocorreu, próxima ação, local, prazo ou protocolo",
      "Apenas o nome do agente",
      "Somente que deve esperar",
      "Nada além de um gesto final"
    ],
    "correct": 0
  }
]$quiz_libras$::jsonb,
    '../assets/academy-screenshots/libras-aeroportos/libras-01-acessibilidade.svg',
    $material_libras$LIBRAS e Linguagem de Sinais para Atendimento em Aeroportos

Resumo operacional
Este curso autoral adapta fundamentos de LIBRAS para situações de atendimento aeroportuário. O foco é comunicação inicial, respeito, apoio visual, coleta correta de dados e solução de problemas em check-in, embarque, conexão, atendimento PNAE, AHL, DPR e OHD.

Princípios de atendimento
1. Fale diretamente com o passageiro.
2. Pergunte a preferência comunicacional.
3. Mantenha contato visual e boa iluminação.
4. Use escrita curta, tela, mapa, etiqueta e demonstração visual.
5. Confirme entendimento antes de agir.
6. Preserve autonomia e privacidade.
7. Acione intérprete, supervisor ou apoio especializado quando a situação exigir.

Guia de frases para escrita de apoio
- Como posso ajudar?
- Você usa LIBRAS?
- Prefere escrever?
- Preciso do seu documento.
- Vou verificar seu voo.
- Seu portão mudou.
- Aguarde aqui, por favor.
- Vou acompanhar você.
- Preciso da etiqueta da bagagem.
- Vou abrir um registro.
- Este é o número do protocolo.
- Você entendeu? Posso confirmar?

Glossário operacional para treinamento
Aeroporto, voo, portão, embarque, desembarque, conexão, atraso, cancelado, assento, documento, passagem, bagagem, etiqueta, mala, esteira, peso, prioridade, assistência, cadeira de rodas, acompanhante, protocolo, telefone, e-mail, endereço, dano, violação, extravio, objeto esquecido, espera, ajuda, seguir, parar, confirmar.

Simulações de aula
Turma A: check-in acessível com despacho de bagagem e conexão.
Turma B: alteração de portão e atraso comunicado a passageiro surdo.
Turma C: AHL no desembarque com entrevista completa e protocolo.
Turma D: DPR com dano/violação e explicação de continuidade.
Turma E: atendimento PNAE com acompanhamento até o portão.

Referências usadas na elaboração autoral do curso
- Apostila em LIBRAS - Curso Básico ENAP 2019: usada como referência para fundamentos de LIBRAS, alfabeto manual/datilologia, saudações, numerais, expressões faciais gramaticais, perguntas e diálogos de prática.
- LIBRAS01 - Apostila de LIBRAS Básico: usada como referência para alfabeto de LIBRAS, cultura surda, parâmetros dos sinais, numerais, tipos de frases, perguntas, horários, negação, cores, meios de transporte e estrutura de diálogos.
- Lei nº 10.436/2002 - Presidência da República/Planalto: referência oficial sobre o reconhecimento da Libras como meio legal de comunicação e expressão, com sistema linguístico visual-motor e estrutura gramatical própria. Link: https://www.presidencia.gov.br/ccivil_03/leis/2002/l10436.htm
- Atendimento em Libras do INSS: referência institucional de acessibilidade comunicacional em serviço público, com atendimento em Libras e orientação ao cidadão surdo. Link: https://www.gov.br/inss/pt-br/canais_atendimento/atendimento-em-libras-do-inss
- Atendimento em Libras por videochamada da CAIXA: referência de mediação em Libras-português por videochamada para ampliar comunicação acessível em atendimento. Link: https://www.caixa.gov.br/atendimento/libras/Paginas/default.aspx

Como as referências foram utilizadas
O conteúdo foi reorganizado para o contexto aeroportuário, com situações de check-in, embarque, conexão, PNAE, AHL, DPR, OHD, orientação crítica e atendimento em irregularidades de bagagem. As imagens do curso são autorais, inspiradas nas referências visuais fornecidas, com avatar genérico de agente aeroportuário, alfabeto manual, numerais, pronomes, expressões, negação, horários, cores e simulações visuais relacionadas a cada trilha.

Observação didática
As imagens deste curso são apoios visuais autorais e não substituem demonstração por instrutor fluente em LIBRAS. Para sinais específicos, pratique com profissional qualificado e valide variações regionais antes de aplicar em atendimento real.$material_libras$,
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
