-- Atualiza somente o curso entrevista-passageiro-ahl.
-- Execute no Supabase SQL Editor para centralizar o conteudo no banco.

update public.academy_courses
set
    title = 'Entrevista com o Passageiro no Desembarque',
    eyebrow = 'AHL, DPR e ocorrencias de chegada',
    category = 'bagagem',
    level = 'Intermediario',
    duration = '2h 40min',
    color = '#8b5cf6',
    summary = 'Curso completo para conduzir entrevista no desembarque em casos de AHL, DPR, violacao, demora de restituição, bagagem sobrante, item especial e ocorrencias gerais.',
    cover_path = '../assets/academy-screenshots/advanced-baggage-courses/ahl-web.png',
    modules = $modules_entrevista_desembarque$[
        {
            "title":"Papel da entrevista no desembarque",
            "type":"Aula",
            "duration":"18 min",
            "content":"Papel da entrevista no desembarque\n\nObjetivo da trilha\nEntender por que a entrevista no desembarque e decisiva para AHL, DPR e demais ocorrencias de chegada.\n\nA entrevista no desembarque e o momento em que o relato do passageiro vira dado operacional. O agente nao esta apenas ouvindo uma reclamacao: esta coletando evidencias, reconstruindo a jornada da bagagem, identificando o tipo de irregularidade e escolhendo o processo correto.\n\nNo desembarque podem aparecer situacoes diferentes: mala que nao chegou, mala danificada, violacao, demora na esteira, bagagem entregue em area errada, mala sem etiqueta, volume sobrante, item especial danificado, cadeira de rodas afetada, carrinho infantil ausente, equipamento esportivo extraviado ou objeto esquecido a bordo.\n\nA IATA destaca que o manuseio inadequado de bagagem inclui atraso, dano, perda e violacao, e que a rastreabilidade melhora a reuniao da bagagem com o passageiro. Na pratica, isso significa que uma entrevista bem feita alimenta o sistema com dados confiaveis para busca, match, entrega, compensacao e auditoria.\n\nConduta esperada\n- Receber o passageiro com calma e postura profissional.\n- Separar fato de suposicao.\n- Confirmar documento, voo, etiqueta, rota e quantidade de volumes.\n- Identificar se o caso e AHL, DPR, RFP, OHD, demora de entrega ou orientacao simples.\n- Explicar o proximo passo antes de abrir ou negar qualquer registro.\n- Registrar historico claro para continuidade por outra equipe.\n\nBase de referencia\nIATA Resolution 753 trabalha a rastreabilidade em quatro pontos da jornada da bagagem: entrega pelo passageiro, carregamento na aeronave, transferencia e devolucao ao passageiro. O desembarque e justamente o ponto em que a falha fica visivel para o cliente.\n\nMensagem principal\nA entrevista correta reduz retrabalho, evita abertura indevida e protege o passageiro, a empresa e a qualidade do processo.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/ahl-web.png","title":"Formulario AHL no simulador","caption":"A entrevista transforma o relato do passageiro em campos objetivos para busca e acompanhamento."}]
        },
        {
            "title":"Triagem: AHL, DPR ou outra ocorrencia",
            "type":"Procedimento",
            "duration":"22 min",
            "content":"Triagem: AHL, DPR ou outra ocorrencia\n\nObjetivo da trilha\nAprender a classificar a ocorrencia antes de preencher qualquer formulario.\n\nO primeiro erro de uma entrevista fraca e abrir o processo errado. Nem todo problema no desembarque e AHL. Nem toda mala danificada e DPR. Nem todo objeto encontrado e RFP. A triagem inicial deve definir o caminho correto.\n\nQuando tende a ser AHL\n- Passageiro despachou a bagagem e ela nao apareceu no destino final.\n- Ha comprovante de bagagem, mas o volume nao foi localizado na esteira.\n- A mala pode ter ficado na origem, conexao, voo errado, area errada ou retida para tratativa.\n- O passageiro precisa de registro para acompanhamento, busca e eventual entrega.\n\nQuando tende a ser DPR\n- A bagagem chegou, mas apresenta dano visivel.\n- Ha violacao, abertura, lacre rompido, cadeado ausente ou relato de conteudo faltante.\n- Ha dano em cadeira de rodas, equipamento de mobilidade, carrinho infantil, instrumento ou item especial despachado.\n- O registro precisa descrever dano, localizacao, extensao e evidencia.\n\nQuando pode ser outra tratativa\n- Demora na esteira sem extravio confirmado: acompanhar restituição e orientar.\n- Mala retirada por outro passageiro: registrar dados, acionar supervisao e buscar contato.\n- Bagagem sobrante sem passageiro: avaliar OHD ou QOH conforme procedimento.\n- Objeto esquecido a bordo ou em area operacional: avaliar RFP.\n- Problema de etiqueta ou rota: conferir leitura da etiqueta antes de concluir.\n\nPerguntas de triagem\n1. Quantos volumes foram despachados?\n2. Quantos chegaram?\n3. O passageiro possui comprovante de bagagem?\n4. A mala apareceu danificada ou nao apareceu?\n5. O problema envolve conteudo faltante, violacao ou apenas demora?\n6. A rota teve conexao, reacomodacao ou troca de voo?\n7. O passageiro ja verificou outra esteira, oversize, atendimento especial ou alfandega?\n\nMensagem principal\nClassifique antes de registrar. Processo correto com dados corretos vale mais do que abertura rapida com informacao fraca.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/dpr-web.png","title":"DPR web no simulador","caption":"Quando ha dano ou violacao, a entrevista muda de foco: evidencias, classificacao do dano e registro visual."}]
        },
        {
            "title":"Roteiro de entrevista para AHL",
            "type":"Roteiro pratico",
            "duration":"26 min",
            "content":"Roteiro de entrevista para AHL\n\nObjetivo da trilha\nConduzir a entrevista de bagagem nao localizada sem esquecer dados essenciais.\n\nNo AHL, o agente precisa reconstruir a jornada da bagagem. O passageiro muitas vezes esta cansado, irritado ou inseguro. Por isso, o roteiro deve ser claro, humano e objetivo.\n\nAbertura da conversa\nUse uma frase simples: Entendo o transtorno. Vou registrar as informacoes para iniciar a busca e acompanhar a localizacao da sua bagagem. Vou precisar confirmar alguns dados da sua viagem e da mala.\n\nDados essenciais\n- Nome completo do passageiro conforme documento ou reserva.\n- Voo de chegada, data, origem e conexoes.\n- Numero da etiqueta/TN/LPN de cada volume.\n- Quantidade de malas despachadas e quantidade nao localizada.\n- Se houve reacomodacao, troca de voo, atraso, conexao curta ou retirada obrigatoria em alfandega.\n- Se a mala foi despachada no balcao, totem, bag drop, portao ou conexao.\n- Se o passageiro recebeu nova etiqueta, etiqueta manual ou comprovante adicional.\n\nDescricao da bagagem\n- Cor predominante.\n- Tipo visual conforme chart IATA.\n- Marca, modelo ou material quando conhecidos.\n- Rodas, alcas, bolsos, cinta, cadeado, etiqueta antiga, adesivos ou dano anterior.\n- Peso aproximado.\n- Conteudo declarado por categoria, sem expor intimidade alem do necessario.\n\nContato e entrega\n- Telefone com DDI/DDD.\n- E-mail.\n- Endereco temporario e permanente.\n- Hotel, periodo de estadia, quarto se permitido pelo procedimento local.\n- Pessoa autorizada a receber, quando aplicavel.\n- Observacoes de acesso, horario e urgencia operacional.\n\nFechamento com o passageiro\nExplique que o registro sera acompanhado, que a comunicacao deve ser mantida atualizada e que recibos de despesas emergenciais devem ser guardados quando a politica aplicavel permitir reembolso. Evite prometer prazo absoluto sem confirmacao operacional.\n\nMensagem principal\nAHL forte nasce de entrevista completa: etiqueta, rota, descricao, conteudo, contato e historico.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/ahl-history.png","title":"Historico AHL","caption":"O historico precisa mostrar o que foi perguntado, confirmado, orientado e encaminhado."}]
        },
        {
            "title":"Entrevista para DPR, dano e violacao",
            "type":"Procedimento",
            "duration":"26 min",
            "content":"Entrevista para DPR, dano e violacao\n\nObjetivo da trilha\nColetar dados corretos quando a bagagem chega danificada, violada ou com conteudo afetado.\n\nNo DPR, a entrevista deve unir relato, vistoria e evidencia. O passageiro pode dizer que a mala chegou quebrada, aberta, molhada, amassada, sem roda, sem alca, com cadeado rompido ou com itens faltando. O agente precisa entender o fato sem discutir culpa no balcao.\n\nPerguntas iniciais\n- O dano foi percebido agora no desembarque?\n- A bagagem foi retirada da esteira, oversize ou entregue por equipe?\n- O passageiro ja saiu da area de desembarque?\n- A mala possui sinal de dano anterior ou Limited Release?\n- A etiqueta esta integra e corresponde ao passageiro?\n- Ha conteudo faltante, conteudo danificado ou apenas dano externo?\n\nVistoria operacional\n- Identifique elemento danificado: roda, alca, ziper, lateral, estrutura, fibra, cadeado, costura, tela, carrinho, cadeira ou equipamento.\n- Identifique localizacao do dano: superior, inferior, lateral, frente, fundo, canto, puxador, rodinha.\n- Classifique extensao: pequeno, medio, grande, total, violacao, conteudo faltante ou conteudo danificado conforme regra local.\n- Registre fotos quando o procedimento permitir.\n- Consulte historico de aceitacao, etiqueta Limited Release ou observacao de dano previo quando houver sistema disponivel.\n\nDano em item especial\nCadeira de rodas, equipamento de mobilidade, dispositivo assistivo, carrinho infantil, instrumento musical e equipamento esportivo exigem entrevista mais cuidadosa. Pergunte se o passageiro precisa de alternativa imediata, se o item e essencial para deslocamento e se ha risco de ficar sem assistencia.\n\nOrientacao ao passageiro\nExplique que o registro depende de evidencia e procedimento aplicavel. Nao minimize o dano. Nao prometa compensacao sem autonomia. Se houver negativa por dano preexistente ou regra especifica, explique com respeito e registre a orientacao.\n\nMensagem principal\nDPR de qualidade nao e apenas preencher dano. E confirmar fato, evidenciar, classificar corretamente e orientar com transparencia.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/dpr-worldtracer.png","title":"Mascara DPR WorldTracer","caption":"A mascara tecnica organiza dano, localizacao, extensao, rota, passageiro e historico."}]
        },
        {
            "title":"Ocorrencias gerais no desembarque",
            "type":"Simulacao",
            "duration":"24 min",
            "content":"Ocorrencias gerais no desembarque\n\nObjetivo da trilha\nAtender situacoes de chegada que nao se encaixam imediatamente em AHL ou DPR.\n\nO desembarque e uma area de muitas variaveis. A entrevista precisa diferenciar irregularidade real de fluxo ainda em andamento, falha de comunicacao ou situacao que pertence a outro processo.\n\nDemora na restituição\nQuando o voo acabou de chegar, a primeira acao e confirmar se a entrega ainda esta ocorrendo, se houve separacao por esteira, se ha volume em oversize, se ha atraso operacional ou se a bagagem esta retida em outro ponto. Nao abra AHL antes de verificar o fluxo basico.\n\nBagagem em esteira errada\nPergunte qual esteira o passageiro acompanhou, confirme painel, voo, origem e se houve mudanca de carrossel. Acione a equipe de sala/rampa quando houver indicio de entrega em outra area.\n\nBagagem retirada por terceiro\nSe o passageiro viu outra pessoa retirar ou suspeita troca de mala, colete descricao da mala, horario, esteira, possivel identificacao do terceiro, imagens quando autorizadas e dados de contato. Registre e escale conforme procedimento, pois pode envolver erro, troca involuntaria ou subtracao.\n\nBagagem sobrante no desembarque\nQuando uma mala fica na esteira apos todos os passageiros deixarem a area, ela deve ser removida para local seguro e tratada como sobrante conforme regra local. A entrevista pode ocorrer depois, quando o dono for localizado.\n\nObjeto esquecido a bordo ou em area operacional\nSe o passageiro relata objeto esquecido no assento, bolso da poltrona, sala de desembarque, banheiro, loja ou transporte interno, avalie RFP e nao AHL. O foco e local encontrado, descricao detalhada, data, voo, assento e contato.\n\nAlfandega e conexao internacional\nEm algumas rotas, a bagagem pode exigir retirada, inspeção ou redespacho. Confirme se o passageiro deveria retirar a mala em ponto intermediario antes de considerar extravio.\n\nMensagem principal\nToda ocorrencia de desembarque precisa de triagem. A pergunta certa evita abrir processo errado.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/ohd-web.png","title":"OHD web","caption":"Bagagem sobrante no desembarque precisa de guarda, registro e rastreabilidade."}]
        },
        {
            "title":"Conteudo, itens sensiveis e evidencias",
            "type":"Consulta guiada",
            "duration":"20 min",
            "content":"Conteudo, itens sensiveis e evidencias\n\nObjetivo da trilha\nColetar conteudo e evidencias com criterio, sem expor o passageiro nem registrar dados inuteis.\n\nConteudo ajuda no match de AHL com OHD, apoia investigacao de violacao e melhora a identificacao de bagagem. Mas a entrevista deve ser profissional. O agente nao deve transformar a conversa em interrogatorio invasivo.\n\nComo perguntar sobre conteudo\nUse perguntas por categoria: roupas, calcados, cosmeticos, medicamentos, documentos, eletronicos, alimentos, artigos infantis, instrumentos, equipamentos esportivos ou itens profissionais. Depois detalhe apenas o que for relevante para busca ou reclamacao.\n\nBoas praticas\n- Priorize itens diferenciadores.\n- Evite termos genericos como roupas e coisas pessoais sem detalhe algum.\n- Registre marca/modelo quando for relevante e informado com seguranca.\n- Para medicamentos, pergunte urgencia e necessidade imediata, sem expor diagnostico desnecessario.\n- Para documentos, passaporte, chaves e itens criticos, registre urgencia e oriente conforme procedimento.\n- Para conteudo faltante, diferencie suspeita de violacao, dano interno e item proibido/inadequado para bagagem despachada.\n\nEvidencias importantes\n- Comprovante da bagagem.\n- Cartao de embarque ou reserva.\n- Foto da mala antes da viagem, se o passageiro tiver.\n- Foto do dano no desembarque, quando aplicavel.\n- Etiqueta Limited Release, se houver.\n- Recibos de despesas emergenciais, quando aplicavel.\n- Declaracao objetiva do passageiro no historico.\n\nCuidado com promessas\nFontes publicas de defesa do consumidor, como o DOT dos EUA, orientam passageiros a registrar problemas com bagagem rapidamente e guardar comprovantes. Para o agente, a conduta correta e orientar o passageiro conforme a politica da empresa e regras locais, sem prometer reembolso fora da autonomia.\n\nMensagem principal\nConteudo e evidencia fortalecem o processo quando sao objetivos, relevantes e respeitosos.",
            "screenshots":[{"src":"../assets/academy-screenshots/chart-iata/chart-iata-code-reading.jpg","title":"Chart IATA e descricao","caption":"A descricao visual e o conteudo declarado aumentam a qualidade da busca e do match."}]
        },
        {
            "title":"Comunicacao em situacoes sensiveis",
            "type":"Atendimento",
            "duration":"22 min",
            "content":"Comunicacao em situacoes sensiveis\n\nObjetivo da trilha\nConduzir conversas dificeis no desembarque com empatia, firmeza e clareza operacional.\n\nPassageiros no desembarque podem estar cansados, atrasados, longe de casa, com criancas, sem idioma local, com mobilidade reduzida ou em viagem por motivo sensivel. A bagagem nao localizada ou danificada aumenta o estresse. A comunicacao do agente pode acalmar ou piorar o caso.\n\nFrases recomendadas\n- Vou verificar as informacoes com voce para registrar corretamente.\n- Entendo que isso gera transtorno. Vamos seguir o procedimento para localizar ou registrar a ocorrencia.\n- Preciso confirmar alguns dados para evitar erro no processo.\n- Vou explicar o que acontece agora e quais serao os proximos passos.\n- Nao quero prometer algo sem confirmacao, mas vou registrar a prioridade corretamente.\n\nFrases a evitar\n- Isso sempre acontece.\n- Deve ter ficado em outro aeroporto.\n- A culpa nao e nossa.\n- Nao posso fazer nada.\n- Volte amanha sem registro.\n- E so aguardar.\n\nPassageiro irritado\nDeixe o passageiro concluir a primeira fala, reconheca o transtorno, reduza o tom de voz e conduza para dados objetivos. Se houver agressividade, acione apoio conforme procedimento e preserve seguranca da equipe.\n\nPassageiro estrangeiro\nFale devagar, use frases curtas, confirme nome, voo e tag por escrito quando possivel. Use alfabeto fonetico para letras criticas. Evite jargao interno.\n\nPassageiro com deficiencia ou mobilidade reduzida\nFale diretamente com o passageiro, pergunte antes de ajudar e priorize solucao para deslocamento, equipamento essencial ou assistencia imediata.\n\nMensagem principal\nEmpatia nao substitui procedimento. Procedimento sem empatia tambem falha. O bom atendimento une os dois.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/baggage-claim-checkin.png","title":"Fluxo da bagagem","caption":"A entrevista deve conectar o que foi despachado no inicio com o que aconteceu no desembarque."}]
        },
        {
            "title":"Registro, historico e continuidade",
            "type":"Checklist",
            "duration":"28 min",
            "content":"Registro, historico e continuidade\n\nObjetivo da trilha\nGarantir que o caso possa ser acompanhado por qualquer agente depois da entrevista.\n\nUma boa entrevista perde valor se o registro fica pobre. A continuidade do atendimento depende do que foi salvo: dados, historico, mensagens, evidencias e proximas acoes.\n\nChecklist final antes de salvar\n- Processo correto selecionado: AHL, DPR, RFP, OHD/QOH ou orientacao sem abertura.\n- Nome, contato e referencia conferidos.\n- Etiqueta/TN/LPN digitada sem erro.\n- Rota completa confirmada, incluindo conexoes e reacomodacoes.\n- Quantidade de volumes correta.\n- Descricao visual suficiente para reconhecimento.\n- Conteudo relevante informado de forma objetiva.\n- Endereco e disponibilidade de entrega conferidos.\n- Dano/violacao descrito com localizacao e extensao quando aplicavel.\n- Historico inicial registrado com fatos e orientacao dada.\n\nHistorico bom\nUm historico bom responde: quem reclamou, o que aconteceu, quando foi percebido, qual evidencia foi vista, qual orientacao foi dada, qual acao ficou pendente e qual area precisa acompanhar.\n\nExemplo de historico AHL\nPAX informa 1 volume nao localizado no desembarque GRU. TN conferido com comprovante. Rota REC/GRU, sem conexao internacional. Mala preta rigida, 4 rodas, cinta verde, conteudo roupas e calcados. Contato e endereco temporario confirmados. Passageiro orientado sobre acompanhamento e necessidade de manter telefone ativo.\n\nExemplo de historico DPR\nPAX retirou mala na esteira 03 e identificou roda quebrada e rachadura lateral esquerda. TN confere com etiqueta. Sem registro informado de dano previo pelo passageiro. Fotos coletadas conforme procedimento. Passageiro orientado sobre tratativa e prazo conforme regra local.\n\nAcompanhamento\nDepois da abertura, acompanhe Action File, mensagens, matches, ROH/FOH, BDO, contato com passageiro e encerramento correto. A entrevista nao termina quando o botao salvar e pressionado.\n\nMensagem principal\nRegistro bom e aquele que permite continuidade sem depender da memoria do primeiro agente.",
            "screenshots":[{"src":"../assets/academy-screenshots/advanced-baggage-courses/action-file-inbox.png","title":"Action File e acompanhamento","caption":"Apos a abertura, mensagens e pendencias mantem o processo vivo ate a solucao."}]
        }
    ]$modules_entrevista_desembarque$::jsonb,
    labs = $labs_entrevista_desembarque$[
        {"label":"Simulador AHL","href":"ahl.html"},
        {"label":"Simulador DPR","href":"dpr.html"},
        {"label":"Simulador RFP","href":"rfp.html"},
        {"label":"OHD e bagagem sobrante","href":"ohd.html"},
        {"label":"Chart IATA","href":"course.html?id=chart-bagagem-iata"},
        {"label":"Action File","href":"action-file.html"}
    ]$labs_entrevista_desembarque$::jsonb,
    quiz = $quiz_entrevista_desembarque$[
        {"question":"Antes de abrir um registro no desembarque, o agente deve:","options":["Classificar se o caso e AHL, DPR, RFP, OHD ou outra tratativa","Abrir sempre AHL","Prometer entrega imediata","Ignorar o comprovante de bagagem"],"correct":0},
        {"question":"Um AHL forte depende principalmente de:","options":["Etiqueta, rota, descricao, conteudo, contato e historico","Somente cor da mala","Somente nome do passageiro","Apenas promessa verbal"],"correct":0},
        {"question":"Quando a mala chega com roda quebrada e rachadura, a entrevista tende a direcionar para:","options":["DPR, com vistoria e evidencia","RFP","QOH temporario","Nenhum registro possivel"],"correct":0},
        {"question":"Conteudo declarado deve ser coletado:","options":["Por categorias relevantes e com respeito a privacidade","Com detalhes invasivos sempre","Somente se for eletronico","Nunca deve ser perguntado"],"correct":0},
        {"question":"Bagagem que sobra na esteira apos o desembarque deve ser tratada como:","options":["Sobrante, com guarda e registro conforme procedimento","Pertence ao primeiro passageiro que reclamar","Dano de bagagem","Certificado de curso"],"correct":0},
        {"question":"Em situacao sensivel, a melhor comunicacao e:","options":["Empatica, objetiva e alinhada ao procedimento","Defensiva e rapida","Sem explicacao","Com promessa de compensacao sem autonomia"],"correct":0},
        {"question":"O historico inicial deve registrar:","options":["Fatos, evidencias, orientacao dada e proximas acoes","Apenas o primeiro nome do passageiro","Somente o humor do passageiro","Nada, pois o sistema ja sabe"],"correct":0},
        {"question":"A entrevista termina quando:","options":["O caso fica registrado e com continuidade operacional definida","O passageiro para de falar","A mala nao aparece na primeira esteira","O agente troca de tela"],"correct":0}
    ]$quiz_entrevista_desembarque$::jsonb,
    material = $material_entrevista_desembarque$Entrevista com o Passageiro no Desembarque

Objetivo geral
Capacitar o aluno a conduzir entrevista operacional no desembarque em situacoes de AHL, DPR, violacao, demora de restituição, bagagem sobrante, objeto esquecido e outras ocorrencias de chegada.

Base de referencia usada na construcao do curso
- IATA Baggage Tracking / Resolution 753: rastreabilidade em entrega pelo passageiro, carregamento, transferencia e devolucao ao passageiro.
- IATA Baggage Standards / Baggage Reference Manual: padronizacao internacional para operacoes de bagagem.
- DOT Lost, Delayed or Damaged Baggage: orientacoes publicas sobre registro rapido, comunicacao, despesas incidentais, dano, perda e limites de responsabilidade.

Roteiro rapido de entrevista no desembarque
1. Acolha o passageiro e explique que precisa confirmar dados para registrar corretamente.
2. Identifique o tipo de ocorrencia: AHL, DPR, RFP, OHD/QOH, demora de entrega, troca de mala ou orientacao.
3. Confirme nome, voo, data, rota, conexoes, quantidade de volumes e etiqueta/TN/LPN.
4. Verifique se a bagagem nao chegou, chegou danificada, chegou violada ou foi localizada em local incorreto.
5. Colete descricao visual com apoio do chart: cor, tipo, marca, material, rodas, alcas, bolsos, cinta, cadeado, etiquetas antigas e sinais externos.
6. Colete conteudo por categorias relevantes, sem expor o passageiro alem do necessario.
7. Confirme telefone, e-mail, endereco temporario, endereco permanente e disponibilidade para entrega.
8. Registre historico objetivo com fatos, evidencias, orientacao dada e proxima acao.

Decisao operacional
- AHL: bagagem despachada nao localizada no destino.
- DPR: dano, violacao, conteudo afetado ou equipamento especial danificado.
- RFP: objeto esquecido a bordo ou em area operacional.
- OHD/QOH: bagagem sobrante, localizada sem passageiro ou sem identificacao completa.
- Orientacao/acompanhamento: demora de esteira, mudanca de carrossel ou fluxo ainda em andamento.

Checklist de qualidade
- Processo correto.
- Etiqueta conferida.
- Rota completa.
- Descricao visual suficiente.
- Conteudo relevante.
- Contato valido.
- Endereco claro.
- Evidencia registrada.
- Historico compreensivel.
- Proxima acao definida.

Frase-chave para o aluno
No desembarque, a entrevista e a ponte entre a experiencia do passageiro e a qualidade do processo operacional.$material_entrevista_desembarque$
where id = 'entrevista-passageiro-ahl';
