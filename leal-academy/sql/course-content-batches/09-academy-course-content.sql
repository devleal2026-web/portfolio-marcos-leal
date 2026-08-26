-- Lote 09: restaura conteudo completo dos cursos no Supabase.
-- Execute este arquivo no SQL Editor do Supabase.

with course_content_update(id, modules, material) as (
values
('introducao-operacao-rampa', $json_introducao_operacao_rampa$[{"title":"Ambiente de rampa","type":"Aula","duration":"14 min","content":"Ambiente de rampa\n\nObjetivo da trilha\nConhecer o ambiente de rampa, seus riscos e a importância da coordenação entre equipes.\n\nA rampa é a área operacional próxima às aeronaves onde ocorrem chegada, estacionamento, atendimento, descarregamento, carregamento, abastecimento quando aplicável, limpeza, embarque, despacho e saída. É um ambiente dinâmico, com pessoas, veículos, equipamentos, aeronaves e cargas circulando ao mesmo tempo.\n\nCaracterísticas da rampa\n- Alto volume de movimentação.\n- Ruído intenso.\n- Áreas demarcadas e restritas.\n- Dependência de comunicação visual, rádio e procedimentos.\n- Necessidade de autorização e treinamento.\n- Risco de colisão, queda, atropelamento, ingestão por motor e dano à aeronave.\n\nConsciência situacional\nConsciência situacional é perceber o que acontece ao redor, entender o risco e antecipar consequências. Na rampa, o colaborador deve observar aeronaves em movimento, motores, cones, veículos, pedestres, equipamentos, clima e sinalizações.\n\nEntrada e circulação\nNinguém deve circular em área restrita sem autorização, credencial, treinamento e necessidade operacional. Caminhar fora das rotas, cruzar área de manobra sem atenção ou ficar próximo à aeronave sem função aumenta o risco.\n\nInterface entre áreas\nA rampa depende de atendimento, portão, manutenção, limpeza, abastecimento, bagagem, carga, segurança e coordenação. Uma informação errada em qualquer área pode atrasar o turnaround ou gerar falha de segurança.\n\nMensagem principal\nA rampa não perdoa distração. Segurança começa com atenção, autorização e respeito ao procedimento."},{"title":"Segurança no pátio","type":"Procedimento","duration":"16 min","content":"Segurança no pátio\n\nObjetivo da trilha\nAplicar práticas essenciais de segurança para reduzir risco de acidente e dano operacional.\n\nSegurança no pátio envolve cumprir regras de circulação, usar EPIs, respeitar marcações, manter distância segura da aeronave, controlar velocidade, reportar riscos e nunca improvisar fora do procedimento autorizado. A rotina pode parecer repetitiva, mas o risco permanece presente em cada operação.\n\nRiscos principais\n- Colisão entre veículos e aeronaves.\n- Atropelamento de pessoas.\n- Queda de bagagens ou equipamentos.\n- Jato de exaustão.\n- Ingestão por motor.\n- Hélices e partes móveis.\n- Escorregões em chuva ou óleo.\n- FOD na área de movimentação.\n- Equipamento sem freio ou mal posicionado.\n\nEPIs\nColete refletivo, calçado adequado, proteção auditiva e outros EPIs definidos localmente reduzem exposição ao risco. EPI não substitui procedimento, mas é barreira importante de segurança.\n\nZonas de risco da aeronave\nMotores, trem de pouso, portas, porões, áreas de abastecimento, ponta de asa e cones de segurança exigem atenção especial. A aproximação deve ocorrer apenas quando autorizado e conforme procedimento.\n\nVelocidade e prioridade\nVeículos devem obedecer limites de velocidade e rotas autorizadas. A aeronave sempre exige respeito prioritário. Pressa operacional não justifica manobra insegura.\n\nMensagem principal\nSegurança de rampa depende de disciplina. Atalho pode parecer rápido, mas aumenta risco para pessoas e aeronaves."},{"title":"GSE e equipamentos","type":"Prática guiada","duration":"14 min","content":"GSE e equipamentos\n\nObjetivo da trilha\nEntender o uso seguro de equipamentos de apoio em solo e sua relação com a proteção da aeronave e da equipe.\n\nGSE, ou Ground Support Equipment, são equipamentos de apoio em solo usados para atender aeronaves e movimentar bagagens, carga e serviços. Incluem tratores, carrinhos, dollies, esteiras, escadas, rebocadores, GPUs, cones, calços e outros recursos definidos pela operação.\n\nPrincípios de uso\n- Operar apenas se treinado e autorizado.\n- Fazer inspeção visual antes do uso.\n- Verificar freios, luzes, pneus, acoplamentos e condição geral.\n- Respeitar velocidade e rotas.\n- Posicionar equipamento com distância segura.\n- Usar calços e freios quando exigido.\n- Nunca abandonar equipamento em área insegura.\n\nAproximação da aeronave\nA aproximação deve ser lenta, alinhada e autorizada. Equipamento mal posicionado pode danificar fuselagem, portas, porões, sensores, antenas ou motores. Pequeno contato pode gerar atraso, inspeção e custo elevado.\n\nEsteiras e bagagens\nEsteiras devem ser posicionadas com cuidado, sem pressionar a aeronave. Bagagens devem ser movimentadas sem arremesso e sem criar risco de queda. O operador deve observar mãos, pés, altura da esteira e estabilidade dos volumes.\n\nEquipamento defeituoso\nEquipamento com falha deve ser retirado de uso e reportado. Usar equipamento defeituoso para “não atrasar” pode causar acidente, dano à aeronave ou lesão.\n\nMensagem principal\nGSE ajuda a operação, mas também é fonte de risco. Equipamento seguro depende de inspeção, autorização e posicionamento correto."},{"title":"Turnaround da aeronave","type":"Simulação","duration":"16 min","content":"Turnaround da aeronave\n\nObjetivo da trilha\nCompreender o fluxo de atividades entre chegada e partida e como a coordenação reduz atraso e risco.\n\nTurnaround é o período entre a chegada da aeronave ao estacionamento e sua próxima saída. Nesse intervalo, várias equipes trabalham simultaneamente: desembarque, bagagem, carga, limpeza, abastecimento, manutenção, catering, embarque, documentação e despacho.\n\nEtapas comuns\n- Chegada e estacionamento.\n- Calçamento e sinalização.\n- Liberação segura para aproximação de equipamentos.\n- Desembarque de passageiros.\n- Abertura de porões.\n- Descarregamento de bagagem e carga.\n- Serviços de limpeza e abastecimento quando aplicável.\n- Carregamento do próximo voo.\n- Embarque.\n- Fechamento de portas e porões.\n- Retirada de equipamentos.\n- Pushback ou saída.\n\nCoordenação\nCada etapa depende de outra. Se a bagagem não chega, o embarque pode atrasar. Se equipamento fica mal posicionado, outra equipe não acessa a aeronave. Se a comunicação falha, o porão pode ser fechado com pendência.\n\nSequenciamento seguro\nAtividades simultâneas exigem controle. Nem todo equipamento pode se aproximar ao mesmo tempo. A equipe deve respeitar sequência, distância e autorização para evitar colisão e conflito.\n\nPressão de tempo\nTurnaround costuma ter meta de pontualidade. Mesmo assim, segurança não pode ser sacrificada. Atraso é problema operacional; acidente é problema crítico.\n\nMensagem principal\nTurnaround eficiente é coordenação segura. O voo sai melhor quando cada área cumpre sua etapa no tempo certo e comunica desvios cedo."},{"title":"Bagagem, carga e reconciliação","type":"Aula","duration":"15 min","content":"Bagagem, carga e reconciliação\n\nObjetivo da trilha\nEntender a responsabilidade da rampa no fluxo de bagagens, cargas e conferências operacionais.\n\nA interface da rampa com bagagem é essencial para evitar extravio, dano, atraso e carregamento incorreto. O volume que chega ao porão deve estar compatível com voo, destino, conexão, prioridade e instruções operacionais.\n\nPontos críticos da bagagem\n- Conferir etiqueta e destino.\n- Separar conexões e prioridades.\n- Proteger itens frágeis e especiais.\n- Evitar arremesso e esmagamento.\n- Carregar no porão correto.\n- Respeitar instruções de carregamento.\n- Reportar volume sem etiqueta, danificado ou suspeito.\n\nReconciliação\nReconciliação é a conferência entre volumes aceitos, autorizados e carregados. Ela ajuda a garantir que bagagens estejam associadas ao passageiro e ao voo correto, conforme regras e sistemas aplicáveis. Falha nessa etapa pode gerar impacto de segurança e serviço.\n\nCarga e itens especiais\nAlguns volumes exigem cuidado adicional: cadeira de rodas, equipamentos esportivos, instrumentos, carrinhos infantis, animais quando aplicável, cargas frágeis e itens com restrição. O manuseio deve seguir procedimento e comunicação entre áreas.\n\nDanos por manuseio\nDanos ocorrem por queda, arremesso, arraste, esmagamento, exposição inadequada, empilhamento errado ou uso incorreto de equipamento. A prevenção começa no treinamento e continua no acompanhamento da supervisão.\n\nMensagem principal\nBagagem é compromisso com o passageiro e com a segurança. A rampa protege a operação quando lê, separa, carrega e reporta corretamente."},{"title":"FOD, clima e reporte","type":"Checklist","duration":"15 min","content":"FOD, clima e reporte\n\nObjetivo da trilha\nReconhecer riscos ambientais e reportar condições inseguras antes que se transformem em acidente ou dano.\n\nFOD significa objeto estranho que pode causar dano. Pode ser parafuso, plástico, pedra, etiqueta, ferramenta, pedaço de metal, lacre, papel rígido ou qualquer material solto em área operacional. Um FOD pode danificar pneu, motor, fuselagem ou equipamento.\n\nPrevenção de FOD\n- Inspecionar área antes e depois da operação.\n- Recolher objetos soltos quando seguro e autorizado.\n- Manter ferramentas controladas.\n- Evitar deixar material em carrinhos e dollies.\n- Reportar áreas contaminadas.\n- Participar de campanhas de limpeza operacional.\n\nClima adverso\nChuva, vento forte, raios, calor intenso, baixa visibilidade e piso escorregadio alteram o risco. A equipe deve seguir orientações locais, reduzir exposição, ajustar velocidade, proteger bagagens e interromper atividade quando o procedimento exigir.\n\nQuase falha\nQuase falha é evento que não gerou dano, mas poderia gerar. Exemplo: veículo freia a tempo antes de atingir equipamento; bagagem cai perto de colaborador; objeto é encontrado próximo ao motor. Reportar quase falha permite prevenir acidente real.\n\nReporte\nO reporte deve ser objetivo: local, horário, risco, ação tomada, pessoas envolvidas quando aplicável, equipamento e evidência. O objetivo é permitir correção e aprendizado.\n\nCultura justa\nReportar risco não deve ser visto como problema. É sinal de maturidade operacional. A equipe que reporta aprende mais rápido e protege melhor pessoas, aeronaves e passageiros.\n\nMensagem principal\nFOD, clima e quase falhas precisam de atenção antes do dano. Segurança operacional depende de observar, agir e registrar."}]$json_introducao_operacao_rampa$::jsonb, $mat_introducao_operacao_rampa$Ambiente de rampa

Ambiente de rampa

Objetivo da trilha
Conhecer o ambiente de rampa, seus riscos e a importância da coordenação entre equipes.

A rampa é a área operacional próxima às aeronaves onde ocorrem chegada, estacionamento, atendimento, descarregamento, carregamento, abastecimento quando aplicável, limpeza, embarque, despacho e saída. É um ambiente dinâmico, com pessoas, veículos, equipamentos, aeronaves e cargas circulando ao mesmo tempo.

Características da rampa
- Alto volume de movimentação.
- Ruído intenso.
- Áreas demarcadas e restritas.
- Dependência de comunicação visual, rádio e procedimentos.
- Necessidade de autorização e treinamento.
- Risco de colisão, queda, atropelamento, ingestão por motor e dano à aeronave.

Consciência situacional
Consciência situacional é perceber o que acontece ao redor, entender o risco e antecipar consequências. Na rampa, o colaborador deve observar aeronaves em movimento, motores, cones, veículos, pedestres, equipamentos, clima e sinalizações.

Entrada e circulação
Ninguém deve circular em área restrita sem autorização, credencial, treinamento e necessidade operacional. Caminhar fora das rotas, cruzar área de manobra sem atenção ou ficar próximo à aeronave sem função aumenta o risco.

Interface entre áreas
A rampa depende de atendimento, portão, manutenção, limpeza, abastecimento, bagagem, carga, segurança e coordenação. Uma informação errada em qualquer área pode atrasar o turnaround ou gerar falha de segurança.

Mensagem principal
A rampa não perdoa distração. Segurança começa com atenção, autorização e respeito ao procedimento.

---

Segurança no pátio

Segurança no pátio

Objetivo da trilha
Aplicar práticas essenciais de segurança para reduzir risco de acidente e dano operacional.

Segurança no pátio envolve cumprir regras de circulação, usar EPIs, respeitar marcações, manter distância segura da aeronave, controlar velocidade, reportar riscos e nunca improvisar fora do procedimento autorizado. A rotina pode parecer repetitiva, mas o risco permanece presente em cada operação.

Riscos principais
- Colisão entre veículos e aeronaves.
- Atropelamento de pessoas.
- Queda de bagagens ou equipamentos.
- Jato de exaustão.
- Ingestão por motor.
- Hélices e partes móveis.
- Escorregões em chuva ou óleo.
- FOD na área de movimentação.
- Equipamento sem freio ou mal posicionado.

EPIs
Colete refletivo, calçado adequado, proteção auditiva e outros EPIs definidos localmente reduzem exposição ao risco. EPI não substitui procedimento, mas é barreira importante de segurança.

Zonas de risco da aeronave
Motores, trem de pouso, portas, porões, áreas de abastecimento, ponta de asa e cones de segurança exigem atenção especial. A aproximação deve ocorrer apenas quando autorizado e conforme procedimento.

Velocidade e prioridade
Veículos devem obedecer limites de velocidade e rotas autorizadas. A aeronave sempre exige respeito prioritário. Pressa operacional não justifica manobra insegura.

Mensagem principal
Segurança de rampa depende de disciplina. Atalho pode parecer rápido, mas aumenta risco para pessoas e aeronaves.

---

GSE e equipamentos

GSE e equipamentos

Objetivo da trilha
Entender o uso seguro de equipamentos de apoio em solo e sua relação com a proteção da aeronave e da equipe.

GSE, ou Ground Support Equipment, são equipamentos de apoio em solo usados para atender aeronaves e movimentar bagagens, carga e serviços. Incluem tratores, carrinhos, dollies, esteiras, escadas, rebocadores, GPUs, cones, calços e outros recursos definidos pela operação.

Princípios de uso
- Operar apenas se treinado e autorizado.
- Fazer inspeção visual antes do uso.
- Verificar freios, luzes, pneus, acoplamentos e condição geral.
- Respeitar velocidade e rotas.
- Posicionar equipamento com distância segura.
- Usar calços e freios quando exigido.
- Nunca abandonar equipamento em área insegura.

Aproximação da aeronave
A aproximação deve ser lenta, alinhada e autorizada. Equipamento mal posicionado pode danificar fuselagem, portas, porões, sensores, antenas ou motores. Pequeno contato pode gerar atraso, inspeção e custo elevado.

Esteiras e bagagens
Esteiras devem ser posicionadas com cuidado, sem pressionar a aeronave. Bagagens devem ser movimentadas sem arremesso e sem criar risco de queda. O operador deve observar mãos, pés, altura da esteira e estabilidade dos volumes.

Equipamento defeituoso
Equipamento com falha deve ser retirado de uso e reportado. Usar equipamento defeituoso para “não atrasar” pode causar acidente, dano à aeronave ou lesão.

Mensagem principal
GSE ajuda a operação, mas também é fonte de risco. Equipamento seguro depende de inspeção, autorização e posicionamento correto.

---

Turnaround da aeronave

Turnaround da aeronave

Objetivo da trilha
Compreender o fluxo de atividades entre chegada e partida e como a coordenação reduz atraso e risco.

Turnaround é o período entre a chegada da aeronave ao estacionamento e sua próxima saída. Nesse intervalo, várias equipes trabalham simultaneamente: desembarque, bagagem, carga, limpeza, abastecimento, manutenção, catering, embarque, documentação e despacho.

Etapas comuns
- Chegada e estacionamento.
- Calçamento e sinalização.
- Liberação segura para aproximação de equipamentos.
- Desembarque de passageiros.
- Abertura de porões.
- Descarregamento de bagagem e carga.
- Serviços de limpeza e abastecimento quando aplicável.
- Carregamento do próximo voo.
- Embarque.
- Fechamento de portas e porões.
- Retirada de equipamentos.
- Pushback ou saída.

Coordenação
Cada etapa depende de outra. Se a bagagem não chega, o embarque pode atrasar. Se equipamento fica mal posicionado, outra equipe não acessa a aeronave. Se a comunicação falha, o porão pode ser fechado com pendência.

Sequenciamento seguro
Atividades simultâneas exigem controle. Nem todo equipamento pode se aproximar ao mesmo tempo. A equipe deve respeitar sequência, distância e autorização para evitar colisão e conflito.

Pressão de tempo
Turnaround costuma ter meta de pontualidade. Mesmo assim, segurança não pode ser sacrificada. Atraso é problema operacional; acidente é problema crítico.

Mensagem principal
Turnaround eficiente é coordenação segura. O voo sai melhor quando cada área cumpre sua etapa no tempo certo e comunica desvios cedo.

---

Bagagem, carga e reconciliação

Bagagem, carga e reconciliação

Objetivo da trilha
Entender a responsabilidade da rampa no fluxo de bagagens, cargas e conferências operacionais.

A interface da rampa com bagagem é essencial para evitar extravio, dano, atraso e carregamento incorreto. O volume que chega ao porão deve estar compatível com voo, destino, conexão, prioridade e instruções operacionais.

Pontos críticos da bagagem
- Conferir etiqueta e destino.
- Separar conexões e prioridades.
- Proteger itens frágeis e especiais.
- Evitar arremesso e esmagamento.
- Carregar no porão correto.
- Respeitar instruções de carregamento.
- Reportar volume sem etiqueta, danificado ou suspeito.

Reconciliação
Reconciliação é a conferência entre volumes aceitos, autorizados e carregados. Ela ajuda a garantir que bagagens estejam associadas ao passageiro e ao voo correto, conforme regras e sistemas aplicáveis. Falha nessa etapa pode gerar impacto de segurança e serviço.

Carga e itens especiais
Alguns volumes exigem cuidado adicional: cadeira de rodas, equipamentos esportivos, instrumentos, carrinhos infantis, animais quando aplicável, cargas frágeis e itens com restrição. O manuseio deve seguir procedimento e comunicação entre áreas.

Danos por manuseio
Danos ocorrem por queda, arremesso, arraste, esmagamento, exposição inadequada, empilhamento errado ou uso incorreto de equipamento. A prevenção começa no treinamento e continua no acompanhamento da supervisão.

Mensagem principal
Bagagem é compromisso com o passageiro e com a segurança. A rampa protege a operação quando lê, separa, carrega e reporta corretamente.

---

FOD, clima e reporte

FOD, clima e reporte

Objetivo da trilha
Reconhecer riscos ambientais e reportar condições inseguras antes que se transformem em acidente ou dano.

FOD significa objeto estranho que pode causar dano. Pode ser parafuso, plástico, pedra, etiqueta, ferramenta, pedaço de metal, lacre, papel rígido ou qualquer material solto em área operacional. Um FOD pode danificar pneu, motor, fuselagem ou equipamento.

Prevenção de FOD
- Inspecionar área antes e depois da operação.
- Recolher objetos soltos quando seguro e autorizado.
- Manter ferramentas controladas.
- Evitar deixar material em carrinhos e dollies.
- Reportar áreas contaminadas.
- Participar de campanhas de limpeza operacional.

Clima adverso
Chuva, vento forte, raios, calor intenso, baixa visibilidade e piso escorregadio alteram o risco. A equipe deve seguir orientações locais, reduzir exposição, ajustar velocidade, proteger bagagens e interromper atividade quando o procedimento exigir.

Quase falha
Quase falha é evento que não gerou dano, mas poderia gerar. Exemplo: veículo freia a tempo antes de atingir equipamento; bagagem cai perto de colaborador; objeto é encontrado próximo ao motor. Reportar quase falha permite prevenir acidente real.

Reporte
O reporte deve ser objetivo: local, horário, risco, ação tomada, pessoas envolvidas quando aplicável, equipamento e evidência. O objetivo é permitir correção e aprendizado.

Cultura justa
Reportar risco não deve ser visto como problema. É sinal de maturidade operacional. A equipe que reporta aprende mais rápido e protege melhor pessoas, aeronaves e passageiros.

Mensagem principal
FOD, clima e quase falhas precisam de atenção antes do dano. Segurança operacional depende de observar, agir e registrar.$mat_introducao_operacao_rampa$),
('chart-bagagem-iata', $json_chart_bagagem_iata$[{"title":"Para que serve o chart IATA","type":"Aula","duration":"10 min","content":"Para que serve o chart IATA\n\nObjetivo da trilha\nEntender por que o Baggage Identification Chart existe e como ele ajuda na rotina de AHL, OHD, DPR e busca de bagagem.\n\nO chart de bagagem IATA é uma referência visual usada para transformar a aparência de uma bagagem ou artigo em uma descrição padronizada. Em vez de cada agente escrever de um jeito, a equipe passa a usar uma linguagem comum para cor, tipo, formato e elementos visíveis.\n\nBase oficial consultada\nA IATA descreve o Baggage ID Chart como uma lista internacionalmente reconhecida de tipos de bagagem, cores e elementos descritivos. A codificação de cores foi conferida com o modelo AIDM/IATA, que referencia os códigos da Resolução 743b. A imagem enviada foi usada como base visual do treinamento, mas os pontos de codificação foram alinhados com a referência oficial atual.\n\nPor que isso importa\nQuando uma bagagem é extraviada, o sistema depende de informações comparáveis. Um AHL aberto em uma base pode gerar match com um OHD aberto em outro aeroporto. Se um agente escreve apenas “mala preta comum”, a identificação fica fraca. Se registra cor predominante, tipo visual e elementos descritivos, a chance de reconhecimento aumenta.\n\nO que a imagem mostra\nA imagem enviada traz duas áreas principais: a primeira parte com cores, tipos de bagagem e elementos descritivos; a segunda com miscellaneous articles, ou artigos diversos. A leitura deve ser feita por comparação visual: olho na bagagem, olho no chart, escolha do código mais próximo e complementação com características relevantes.\n\nOnde aplicar\n- AHL: bagagem extraviada informada pelo passageiro.\n- OHD: bagagem sobrante encontrada no aeroporto.\n- DPR: dano ou violação, quando a descrição da mala precisa ser clara.\n- Conteúdo/CC: quando o conteúdo declarado ajuda na busca, sempre com descrição objetiva e preferencialmente em inglês quando o sistema exigir.\n\nMensagem principal\nO chart não é decoração. Ele é uma ferramenta de padronização. Quanto melhor a leitura visual, melhor a qualidade do processo e do match."},{"title":"Cores da bagagem","type":"Consulta guiada","duration":"12 min","content":"Cores da bagagem\n\nObjetivo da trilha\nAprender a escolher a cor predominante da bagagem usando os códigos visuais do chart.\n\nA cor é a primeira camada da identificação. O agente deve observar a cor predominante do volume, não pequenos detalhes. Uma mala preta com zíper vermelho continua sendo preta; o vermelho pode ser citado como detalhe se ajudar na identificação.\n\nCódigos oficiais de cor IATA\n- BK: preto.\n- BU: azul.\n- RD: vermelho, vinho, rosa ou burgundy.\n- WT: branco ou transparente.\n- GY: cinza, prata ou alumínio.\n- PU: roxo, violeta ou lilás.\n- YW: amarelo.\n- BE: bege, creme ou marfim.\n- BN: marrom, tan, taupe, bronze ou cobre.\n- GN: verde, oliva ou jade.\n- MC: duas ou mais cores sólidas, excluindo acabamento pequeno.\n- PC: print, pattern, floral, listrado, xadrez, manchado ou outro padrão visual marcante.\n\nObservação operacional\nAlguns charts antigos ou máscaras locais podem exibir abreviações diferentes para padrão/estampa. A referência IATA atual usa PC. Em treinamento, ensine o conceito e confirme a abreviação disponível no sistema usado pela base.\n\nComo decidir\n1. Observe a bagagem de frente e de lado.\n2. Identifique a cor que ocupa maior área.\n3. Se houver mistura forte de cores sólidas, use MC.\n4. Se houver estampa marcante, padrão ou desenho, avalie PC ou a abreviação equivalente exibida no sistema local.\n5. Use detalhes de cor apenas como complemento, não como cor principal.\n\nErros comuns\n- Usar a cor da etiqueta em vez da cor da mala.\n- Registrar cor de alça, fita ou cadeado como cor principal.\n- Chamar cinza escuro de preto sem observar iluminação.\n- Ignorar estampa evidente.\n\nExemplos práticos\nMala rígida azul com rodinhas pretas: cor principal azul, detalhe rodinhas pretas se necessário.\nMala bege com flores coloridas grandes: pode ser bege com padrão, ou PC se o padrão domina a identificação.\nMochila preta com logo branco: preta; o logo pode entrar na descrição complementar.\n\nMensagem principal\nA cor deve ajudar outro agente a reconhecer a mesma bagagem, não apenas registrar uma impressão rápida."},{"title":"Tipo do volume","type":"Prática guiada","duration":"16 min","content":"Tipo do volume\n\nObjetivo da trilha\nEscolher o tipo de bagagem ou artigo pela forma externa, sem confundir tipo com conteúdo, marca ou valor.\n\nDepois da cor, o chart orienta a escolha do tipo visual. A imagem mostra luggage/bags, com malas de diferentes formatos, bolsas, mochilas, sacolas, caixas e volumes especiais. O agente deve escolher a figura mais parecida com o volume real.\n\nCritérios de leitura\n- Estrutura: rígida, flexível, caixa, bolsa, mochila ou saco.\n- Formato: retangular, quadrado, cilíndrico, dobrável ou irregular.\n- Transporte: com rodas, com alça, de mão, de ombro, de costas.\n- Tamanho aparente: pequeno, médio, grande ou volumoso.\n- Uso visual: mala de viagem, mochila, sacola, pasta, caixa ou equipamento.\n\nO que não fazer\nNão escolha o tipo pela marca. Uma Samsonite, uma Delsey ou uma mala sem marca podem ter o mesmo tipo visual. Também não escolha pelo conteúdo: uma mala com roupas continua sendo mala; uma caixa com roupa continua sendo caixa.\n\nComo complementar\nQuando duas figuras parecem possíveis, escolha a mais próxima e use elementos descritivos para diferenciar. Exemplo: mala rígida preta com quatro rodas, alça telescópica e cinta vermelha. Mesmo que o código de tipo não capture tudo, a descrição complementar melhora a busca.\n\nCasos frequentes\n- Mala rígida com rodinhas: priorize formato rígido e rodas visíveis.\n- Mala flexível de tecido: priorize tipo flexível e bolsos externos se houver.\n- Mochila despachada: não registre como mala rígida; use o tipo visual de mochila/saco quando aplicável.\n- Caixa ou pacote: use tipo de caixa/pacote quando não houver aparência de mala.\n\nMensagem principal\nTipo é aparência externa. Conteúdo, marca e valor entram em outros campos ou na descrição complementar."},{"title":"Elementos descritivos","type":"Aula prática","duration":"14 min","content":"Elementos descritivos\n\nObjetivo da trilha\nUsar detalhes visíveis para diferenciar volumes parecidos e melhorar a precisão do registro.\n\nElementos descritivos são características externas que ajudam outro agente a reconhecer o mesmo volume. A imagem traz uma faixa de descriptive elements, com ícones de detalhes estruturais e visuais. Mesmo quando o código exato não é legível na imagem, a função operacional é clara: complementar cor e tipo.\n\nElementos úteis\n- Rodinhas: duas ou quatro rodas, quando visíveis.\n- Alça: alça lateral, superior ou telescópica.\n- Bolso externo: principalmente em malas flexíveis e mochilas.\n- Cinta ou faixa: cor e posição ajudam muito.\n- Cadeado: quando visível e relevante.\n- Etiquetas antigas: podem confundir rota e ajudam na identificação.\n- Zíper aparente: especialmente se a bagagem tem zíper frontal forte.\n- Dano visível: rasgo, quebrado, amassado ou alça faltando.\n- Material aparente: rígida, tecido, couro, plástico ou caixa papelão.\n- Formato incomum: cilíndrico, dobrável, comprido ou irregular.\n\nRegra dos três níveis\nUma boa identificação pode seguir este raciocínio:\n1. Cor predominante.\n2. Tipo visual do volume.\n3. Dois ou três elementos que realmente diferenciam.\n\nExemplo ruim\n“Mala preta.”\n\nExemplo melhor\n“Mala preta rígida, quatro rodas, alça telescópica, cinta vermelha.”\n\nExemplo em inglês operacional\n“BLACK HARD CASE, FOUR WHEELS, RED STRAP.”\n\nMensagem principal\nDetalhe bom é aquele que diferencia. Detalhe demais, sem critério, pode poluir a descrição."},{"title":"Artigos diversos","type":"Consulta","duration":"12 min","content":"Artigos diversos\n\nObjetivo da trilha\nReconhecer quando o item deve ser tratado como miscellaneous article e não como mala tradicional.\n\nA segunda parte da imagem apresenta miscellaneous articles, ou artigos diversos. Essa área é usada para objetos que não têm aparência de mala comum. Ela inclui itens volumosos, equipamentos, carrinhos, cadeiras, pacotes, instrumentos, artigos esportivos, objetos infantis e outros formatos especiais.\n\nQuando usar essa parte do chart\nUse miscellaneous articles quando o volume não se encaixa bem em luggage/bags. O objetivo é evitar forçar um item especial dentro de um tipo de mala que não representa sua aparência.\n\nExemplos práticos\n- Carrinho infantil despachado.\n- Cadeira ou equipamento de mobilidade.\n- Instrumento musical em case próprio.\n- Equipamento esportivo em bolsa específica.\n- Caixa ou pacote sem formato de mala.\n- Objeto dobrável, volumoso ou com formato irregular.\n- Item infantil, assento, base ou acessório especial.\n\nCuidados operacionais\nItens diversos costumam exigir atenção extra: podem ser frágeis, ter valor afetivo, precisar de etiqueta especial, embalagem adequada ou registro mais detalhado. Se o item chega danificado ou sem etiqueta, a descrição precisa ser ainda mais precisa.\n\nRelação com RFP, AHL e OHD\nNem todo artigo diverso será bagagem despachada. Alguns podem aparecer como objeto esquecido, outros como volume despachado. O agente deve separar a natureza do processo: RFP para objeto encontrado/esquecido, AHL para bagagem não localizada, OHD para bagagem sobrante e DPR para dano/violação.\n\nMensagem principal\nSe não parece mala, não force como mala. Use a área de artigos diversos para representar melhor o objeto."},{"title":"Montagem do código no atendimento","type":"Simulação","duration":"16 min","content":"Montagem do código no atendimento\n\nObjetivo da trilha\nAplicar a leitura do chart em registros reais, com descrição clara e útil para busca operacional.\n\nA montagem da identificação deve seguir uma sequência lógica. Primeiro observe a bagagem; depois compare com o chart; em seguida registre cor, tipo e elementos; por fim revise se a descrição seria útil para outro aeroporto localizar o volume.\n\nFluxo recomendado\n1. Confirmar se o item é bagagem tradicional ou artigo diverso.\n2. Escolher a cor predominante.\n3. Escolher o tipo visual mais próximo.\n4. Adicionar elementos externos relevantes.\n5. Registrar conteúdo/CC quando aplicável, em inglês quando o sistema exigir.\n6. Evitar termos genéricos, subjetivos ou sem valor de busca.\n7. Revisar com o passageiro quando for AHL.\n\nPerguntas que ajudam\n- Se outro agente olhar esta descrição, ele reconheceria a mala?\n- A cor escolhida é predominante ou apenas detalhe?\n- O tipo representa o formato real?\n- Há cinta, etiqueta, dano, roda, alça ou bolso que diferencie?\n- O conteúdo foi informado em categoria correta?\n- Alguma informação está baseada em suposição?\n\nExemplo AHL\nPassageiro informa mala cinza rígida, quatro rodas, sem cadeado, com fita verde. Registro sugerido: cor cinza, tipo rígido com rodas, descrição complementar “GREEN STRAP, FOUR WHEELS”.\n\nExemplo OHD\nEquipe encontra mochila preta sem etiqueta, com bolso frontal e logotipo branco. Registro sugerido: cor preta, tipo mochila, descrição complementar “FRONT POCKET, WHITE LOGO, NO TAG”.\n\nExemplo de artigo diverso\nCarrinho infantil azul dobrável encontrado como volume sobrante. Use a lógica de artigo diverso, cor azul e descrição “FOLDING BABY STROLLER”.\n\nMensagem principal\nO chart deve transformar observação em padrão. O bom registro reduz retrabalho, acelera match e protege a qualidade do atendimento."}]$json_chart_bagagem_iata$::jsonb, $mat_chart_bagagem_iata$Para que serve o chart IATA

Para que serve o chart IATA

Objetivo da trilha
Entender por que o Baggage Identification Chart existe e como ele ajuda na rotina de AHL, OHD, DPR e busca de bagagem.

O chart de bagagem IATA é uma referência visual usada para transformar a aparência de uma bagagem ou artigo em uma descrição padronizada. Em vez de cada agente escrever de um jeito, a equipe passa a usar uma linguagem comum para cor, tipo, formato e elementos visíveis.

Base oficial consultada
A IATA descreve o Baggage ID Chart como uma lista internacionalmente reconhecida de tipos de bagagem, cores e elementos descritivos. A codificação de cores foi conferida com o modelo AIDM/IATA, que referencia os códigos da Resolução 743b. A imagem enviada foi usada como base visual do treinamento, mas os pontos de codificação foram alinhados com a referência oficial atual.

Por que isso importa
Quando uma bagagem é extraviada, o sistema depende de informações comparáveis. Um AHL aberto em uma base pode gerar match com um OHD aberto em outro aeroporto. Se um agente escreve apenas “mala preta comum”, a identificação fica fraca. Se registra cor predominante, tipo visual e elementos descritivos, a chance de reconhecimento aumenta.

O que a imagem mostra
A imagem enviada traz duas áreas principais: a primeira parte com cores, tipos de bagagem e elementos descritivos; a segunda com miscellaneous articles, ou artigos diversos. A leitura deve ser feita por comparação visual: olho na bagagem, olho no chart, escolha do código mais próximo e complementação com características relevantes.

Onde aplicar
- AHL: bagagem extraviada informada pelo passageiro.
- OHD: bagagem sobrante encontrada no aeroporto.
- DPR: dano ou violação, quando a descrição da mala precisa ser clara.
- Conteúdo/CC: quando o conteúdo declarado ajuda na busca, sempre com descrição objetiva e preferencialmente em inglês quando o sistema exigir.

Mensagem principal
O chart não é decoração. Ele é uma ferramenta de padronização. Quanto melhor a leitura visual, melhor a qualidade do processo e do match.

---

Cores da bagagem

Cores da bagagem

Objetivo da trilha
Aprender a escolher a cor predominante da bagagem usando os códigos visuais do chart.

A cor é a primeira camada da identificação. O agente deve observar a cor predominante do volume, não pequenos detalhes. Uma mala preta com zíper vermelho continua sendo preta; o vermelho pode ser citado como detalhe se ajudar na identificação.

Códigos oficiais de cor IATA
- BK: preto.
- BU: azul.
- RD: vermelho, vinho, rosa ou burgundy.
- WT: branco ou transparente.
- GY: cinza, prata ou alumínio.
- PU: roxo, violeta ou lilás.
- YW: amarelo.
- BE: bege, creme ou marfim.
- BN: marrom, tan, taupe, bronze ou cobre.
- GN: verde, oliva ou jade.
- MC: duas ou mais cores sólidas, excluindo acabamento pequeno.
- PC: print, pattern, floral, listrado, xadrez, manchado ou outro padrão visual marcante.

Observação operacional
Alguns charts antigos ou máscaras locais podem exibir abreviações diferentes para padrão/estampa. A referência IATA atual usa PC. Em treinamento, ensine o conceito e confirme a abreviação disponível no sistema usado pela base.

Como decidir
1. Observe a bagagem de frente e de lado.
2. Identifique a cor que ocupa maior área.
3. Se houver mistura forte de cores sólidas, use MC.
4. Se houver estampa marcante, padrão ou desenho, avalie PC ou a abreviação equivalente exibida no sistema local.
5. Use detalhes de cor apenas como complemento, não como cor principal.

Erros comuns
- Usar a cor da etiqueta em vez da cor da mala.
- Registrar cor de alça, fita ou cadeado como cor principal.
- Chamar cinza escuro de preto sem observar iluminação.
- Ignorar estampa evidente.

Exemplos práticos
Mala rígida azul com rodinhas pretas: cor principal azul, detalhe rodinhas pretas se necessário.
Mala bege com flores coloridas grandes: pode ser bege com padrão, ou PC se o padrão domina a identificação.
Mochila preta com logo branco: preta; o logo pode entrar na descrição complementar.

Mensagem principal
A cor deve ajudar outro agente a reconhecer a mesma bagagem, não apenas registrar uma impressão rápida.

---

Tipo do volume

Tipo do volume

Objetivo da trilha
Escolher o tipo de bagagem ou artigo pela forma externa, sem confundir tipo com conteúdo, marca ou valor.

Depois da cor, o chart orienta a escolha do tipo visual. A imagem mostra luggage/bags, com malas de diferentes formatos, bolsas, mochilas, sacolas, caixas e volumes especiais. O agente deve escolher a figura mais parecida com o volume real.

Critérios de leitura
- Estrutura: rígida, flexível, caixa, bolsa, mochila ou saco.
- Formato: retangular, quadrado, cilíndrico, dobrável ou irregular.
- Transporte: com rodas, com alça, de mão, de ombro, de costas.
- Tamanho aparente: pequeno, médio, grande ou volumoso.
- Uso visual: mala de viagem, mochila, sacola, pasta, caixa ou equipamento.

O que não fazer
Não escolha o tipo pela marca. Uma Samsonite, uma Delsey ou uma mala sem marca podem ter o mesmo tipo visual. Também não escolha pelo conteúdo: uma mala com roupas continua sendo mala; uma caixa com roupa continua sendo caixa.

Como complementar
Quando duas figuras parecem possíveis, escolha a mais próxima e use elementos descritivos para diferenciar. Exemplo: mala rígida preta com quatro rodas, alça telescópica e cinta vermelha. Mesmo que o código de tipo não capture tudo, a descrição complementar melhora a busca.

Casos frequentes
- Mala rígida com rodinhas: priorize formato rígido e rodas visíveis.
- Mala flexível de tecido: priorize tipo flexível e bolsos externos se houver.
- Mochila despachada: não registre como mala rígida; use o tipo visual de mochila/saco quando aplicável.
- Caixa ou pacote: use tipo de caixa/pacote quando não houver aparência de mala.

Mensagem principal
Tipo é aparência externa. Conteúdo, marca e valor entram em outros campos ou na descrição complementar.

---

Elementos descritivos

Elementos descritivos

Objetivo da trilha
Usar detalhes visíveis para diferenciar volumes parecidos e melhorar a precisão do registro.

Elementos descritivos são características externas que ajudam outro agente a reconhecer o mesmo volume. A imagem traz uma faixa de descriptive elements, com ícones de detalhes estruturais e visuais. Mesmo quando o código exato não é legível na imagem, a função operacional é clara: complementar cor e tipo.

Elementos úteis
- Rodinhas: duas ou quatro rodas, quando visíveis.
- Alça: alça lateral, superior ou telescópica.
- Bolso externo: principalmente em malas flexíveis e mochilas.
- Cinta ou faixa: cor e posição ajudam muito.
- Cadeado: quando visível e relevante.
- Etiquetas antigas: podem confundir rota e ajudam na identificação.
- Zíper aparente: especialmente se a bagagem tem zíper frontal forte.
- Dano visível: rasgo, quebrado, amassado ou alça faltando.
- Material aparente: rígida, tecido, couro, plástico ou caixa papelão.
- Formato incomum: cilíndrico, dobrável, comprido ou irregular.

Regra dos três níveis
Uma boa identificação pode seguir este raciocínio:
1. Cor predominante.
2. Tipo visual do volume.
3. Dois ou três elementos que realmente diferenciam.

Exemplo ruim
“Mala preta.”

Exemplo melhor
“Mala preta rígida, quatro rodas, alça telescópica, cinta vermelha.”

Exemplo em inglês operacional
“BLACK HARD CASE, FOUR WHEELS, RED STRAP.”

Mensagem principal
Detalhe bom é aquele que diferencia. Detalhe demais, sem critério, pode poluir a descrição.

---

Artigos diversos

Artigos diversos

Objetivo da trilha
Reconhecer quando o item deve ser tratado como miscellaneous article e não como mala tradicional.

A segunda parte da imagem apresenta miscellaneous articles, ou artigos diversos. Essa área é usada para objetos que não têm aparência de mala comum. Ela inclui itens volumosos, equipamentos, carrinhos, cadeiras, pacotes, instrumentos, artigos esportivos, objetos infantis e outros formatos especiais.

Quando usar essa parte do chart
Use miscellaneous articles quando o volume não se encaixa bem em luggage/bags. O objetivo é evitar forçar um item especial dentro de um tipo de mala que não representa sua aparência.

Exemplos práticos
- Carrinho infantil despachado.
- Cadeira ou equipamento de mobilidade.
- Instrumento musical em case próprio.
- Equipamento esportivo em bolsa específica.
- Caixa ou pacote sem formato de mala.
- Objeto dobrável, volumoso ou com formato irregular.
- Item infantil, assento, base ou acessório especial.

Cuidados operacionais
Itens diversos costumam exigir atenção extra: podem ser frágeis, ter valor afetivo, precisar de etiqueta especial, embalagem adequada ou registro mais detalhado. Se o item chega danificado ou sem etiqueta, a descrição precisa ser ainda mais precisa.

Relação com RFP, AHL e OHD
Nem todo artigo diverso será bagagem despachada. Alguns podem aparecer como objeto esquecido, outros como volume despachado. O agente deve separar a natureza do processo: RFP para objeto encontrado/esquecido, AHL para bagagem não localizada, OHD para bagagem sobrante e DPR para dano/violação.

Mensagem principal
Se não parece mala, não force como mala. Use a área de artigos diversos para representar melhor o objeto.

---

Montagem do código no atendimento

Montagem do código no atendimento

Objetivo da trilha
Aplicar a leitura do chart em registros reais, com descrição clara e útil para busca operacional.

A montagem da identificação deve seguir uma sequência lógica. Primeiro observe a bagagem; depois compare com o chart; em seguida registre cor, tipo e elementos; por fim revise se a descrição seria útil para outro aeroporto localizar o volume.

Fluxo recomendado
1. Confirmar se o item é bagagem tradicional ou artigo diverso.
2. Escolher a cor predominante.
3. Escolher o tipo visual mais próximo.
4. Adicionar elementos externos relevantes.
5. Registrar conteúdo/CC quando aplicável, em inglês quando o sistema exigir.
6. Evitar termos genéricos, subjetivos ou sem valor de busca.
7. Revisar com o passageiro quando for AHL.

Perguntas que ajudam
- Se outro agente olhar esta descrição, ele reconheceria a mala?
- A cor escolhida é predominante ou apenas detalhe?
- O tipo representa o formato real?
- Há cinta, etiqueta, dano, roda, alça ou bolso que diferencie?
- O conteúdo foi informado em categoria correta?
- Alguma informação está baseada em suposição?

Exemplo AHL
Passageiro informa mala cinza rígida, quatro rodas, sem cadeado, com fita verde. Registro sugerido: cor cinza, tipo rígido com rodas, descrição complementar “GREEN STRAP, FOUR WHEELS”.

Exemplo OHD
Equipe encontra mochila preta sem etiqueta, com bolso frontal e logotipo branco. Registro sugerido: cor preta, tipo mochila, descrição complementar “FRONT POCKET, WHITE LOGO, NO TAG”.

Exemplo de artigo diverso
Carrinho infantil azul dobrável encontrado como volume sobrante. Use a lógica de artigo diverso, cor azul e descrição “FOLDING BABY STROLLER”.

Mensagem principal
O chart deve transformar observação em padrão. O bom registro reduz retrabalho, acelera match e protege a qualidade do atendimento.$mat_chart_bagagem_iata$)
)
update public.academy_courses as c
set
    modules = u.modules,
    material = u.material
from course_content_update as u
where c.id = u.id;

-- Cursos neste lote:
-- introducao-operacao-rampa
-- chart-bagagem-iata
