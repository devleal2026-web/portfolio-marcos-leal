-- Complemento do curso Interpretacao de Etiqueta de Bagagem.
-- Acrescenta lista de aeroportos principais e alfabeto fonetico sem alterar outros cursos.

update public.academy_courses
set
    modules = $json_interpretacao_etiqueta_bagagem_airports$[{"title":"Funcao da etiqueta","type":"Aula","duration":"12 min","content":"Funcao da etiqueta\n\nObjetivo da trilha\nCompreender a funcao da etiqueta de bagagem no transporte aereo e sua importancia para rastreabilidade, despacho correto e tratativa de irregularidades.\n\nA etiqueta de bagagem e o principal documento operacional da mala. Sem uma etiqueta valida, a bagagem perde sua identificacao formal no fluxo aeroportuario e se torna muito mais dificil de rastrear. Ela e emitida no check-in para bagagens despachadas e acompanha a mala desde a entrega pelo passageiro ate a restituicao no destino.\n\nA etiqueta identifica a bagagem, orienta o sistema automatizado, apoia a leitura humana dos agentes e permite conectar a mala ao passageiro, ao voo, ao itinerario e aos registros de irregularidade. Tudo o que acontece com a mala - despacho, conexao, falha de carregamento, envio incorreto, extravio, localizacao ou devolucao - depende das informacoes impressas e registradas nessa etiqueta.\n\nNa operacao diaria, o agente deve entender que a etiqueta nao e apenas um adesivo. Ela e uma chave operacional. Uma leitura incorreta pode gerar despacho para destino errado, perda de conexao, criacao equivocada de AHL/OHD, demora na busca e insatisfacao do passageiro.\n\nPontos essenciais\n- A etiqueta identifica a bagagem despachada.\n- A etiqueta orienta a triagem e o carregamento.\n- A etiqueta permite rastreabilidade em sistemas de bagagem.\n- A etiqueta ajuda a comprovar origem, destino e conexoes.\n- A etiqueta deve ser protegida, lida e registrada corretamente.\n\nExemplo operacional\nUm passageiro desembarca e informa que sua mala nao chegou. Antes de qualquer conclusao, o agente confere o comprovante de bagagem, identifica o numero da etiqueta e usa esse dado como referencia principal para busca e abertura do registro de irregularidade."},{"title":"Estrutura da etiqueta","type":"Consulta","duration":"16 min","content":"Estrutura da etiqueta\n\nObjetivo da trilha\nIdentificar os principais campos de uma etiqueta de bagagem e compreender como cada informacao apoia a operacao.\n\nUma etiqueta de bagagem normalmente contem informacoes destinadas a leitura automatizada e leitura humana. O sistema de triagem utiliza o codigo de barras para direcionar a mala, enquanto os agentes utilizam campos impressos para conferencia visual, orientacao, reetiquetagem e investigacao.\n\nCampos principais\n- Codigo de barras: permite leitura automatizada no sistema de triagem.\n- LPN ou TN: numero unico de identificacao da bagagem.\n- Companhia emissora: indica quem emitiu a etiqueta.\n- Codigo IATA dos aeroportos: identifica origem, conexoes e destino.\n- Voo e data: ajudam a confirmar o trecho operacional.\n- Nome ou referencia do passageiro: quando disponivel, auxilia na associacao com a viagem.\n- Stub ou comprovante: parte entregue ao passageiro para conferencias futuras.\n\nA leitura deve ser feita com calma. Em momentos de pressa, e comum olhar apenas o destino mais visivel e ignorar conexoes. Esse erro pode direcionar a mala para um ponto intermediario ou fazer o agente interpretar destino final como origem.\n\nBoa pratica\nSempre confira tres elementos juntos: numero da etiqueta, rota e destino final. Se houver conexao, valide a sequencia completa antes de orientar, separar ou enviar a bagagem."},{"title":"LPN e rastreabilidade","type":"Aula","duration":"14 min","content":"LPN e rastreabilidade\n\nObjetivo da trilha\nEntender o papel do License Plate Number na identificacao unica da bagagem.\n\nLPN significa License Plate Number. Na pratica, e a placa de identificacao da mala dentro da operacao. Assim como um veiculo possui uma placa unica, a bagagem despachada possui um numero que permite rastrear eventos, localizar registros, abrir irregularidades e vincular a mala ao passageiro.\n\nO LPN pode aparecer junto ao codigo de barras e tambem em formato numerico ou alfanumerico, dependendo do padrao utilizado. Em muitos processos operacionais, ele tambem e chamado de TN, Bag Tag Number ou numero da etiqueta.\n\nPor que conferir o LPN\n- Evita abrir processo com numero errado.\n- Ajuda a localizar mensagens de encaminhamento.\n- Permite comparar AHL, OHD e registros de carregamento.\n- Reduz risco de entregar mala errada.\n- Ajuda em auditoria e historico operacional.\n\nSituacoes em que o LPN e essencial\n- Passageiro sem bagagem no desembarque.\n- Mala localizada sem passageiro.\n- Bagagem enviada por rush.\n- Reetiquetagem por falha, dano ou alteracao de rota.\n- Conferencia de entrega ao passageiro.\n\nErro comum\nCopiar apenas parte do numero ou confundir caracteres parecidos. Sempre confirme o numero com o comprovante, com a etiqueta fisica e com o sistema antes de salvar um processo."},{"title":"Codigos IATA de aeroporto","type":"Consulta","duration":"14 min","content":"Codigos IATA de aeroporto\n\nObjetivo da trilha\nReconhecer os codigos IATA impressos na etiqueta e interpretar sua funcao na rota.\n\nOs codigos IATA de aeroporto possuem tres letras e identificam aeroportos ou cidades na operacao aerea. Eles aparecem na etiqueta para indicar origem, conexoes e destino final. Exemplos comuns incluem GRU, GIG, REC, CWB, MIA, JFK, LHR e CDG.\n\nEsses codigos sao essenciais porque permitem leitura rapida por agentes, sistemas automatizados e equipes de rampa. Um erro de interpretacao pode levar a bagagem para aeroporto incorreto, causar atraso na conexao ou gerar abertura indevida de irregularidade.\n\nComo interpretar\n- Verifique todos os aeroportos impressos.\n- Identifique qual e a origem.\n- Localize conexoes intermediarias.\n- Confirme o destino final.\n- Compare a etiqueta com o itinerario do passageiro.\n\nExemplo\nUma etiqueta apresenta CWB, GRU e MIA. Se lida de forma correta, a sequencia indica que a bagagem saiu de CWB, conectou em GRU e tem destino final MIA. Se o agente ler de cima para baixo sem criterio, pode interpretar o destino como origem e direcionar a tratativa de forma errada.\n\nPonto de atencao\nAlguns aeroportos e cidades podem gerar confusao por siglas parecidas. Sempre confira a rota completa, nao apenas um codigo isolado."},{"title":"Leitura correta da rota","type":"Pratica guiada","duration":"18 min","content":"Leitura correta da rota\n\nObjetivo da trilha\nAplicar a regra operacional critica: a rota impressa na etiqueta deve ser lida de baixo para cima.\n\nA leitura correta da rota e uma das competencias mais importantes na interpretacao de etiqueta de bagagem. Em muitas etiquetas, a sequencia de aeroportos aparece verticalmente. A regra operacional e ler de baixo para cima.\n\nRegra pratica\n- Parte inferior: origem da bagagem.\n- Parte central: conexao ou conexoes.\n- Parte superior: destino final.\n\nEssa regra evita um dos erros mais comuns: ler a etiqueta de cima para baixo e inverter a rota. Quando isso acontece, o agente pode achar que a mala deveria ir para a origem, quando na verdade a origem esta na parte inferior da etiqueta.\n\nExemplo guiado\nSe a etiqueta apresenta, de cima para baixo:\nMIA\nGRU\nCWB\n\nA leitura correta e CWB/GRU/MIA. A mala saiu de CWB, conecta em GRU e segue para MIA.\n\nAplicacao no atendimento\nAo receber uma reclamação de bagagem, o agente deve comparar o itinerario informado pelo passageiro com a leitura de baixo para cima da etiqueta. Se houver divergencia, deve investigar antes de registrar conclusoes no sistema.\n\nPonto de atencao\nA excelencia operacional comeca na leitura correta da etiqueta. Quando a rota e compreendida corretamente, o agente melhora a busca, reduz retrabalho e orienta o passageiro com mais seguranca."},{"title":"Bagagem prioritaria, rush e reetiquetada","type":"Procedimento","duration":"16 min","content":"Bagagem prioritaria, rush e reetiquetada\n\nObjetivo da trilha\nIdentificar etiquetas em condicoes operacionais diferenciadas e entender os cuidados de conferencia.\n\nNem toda etiqueta representa uma bagagem em fluxo normal. Algumas malas recebem tratamento especial por prioridade, atraso, reenvio, reetiquetagem ou irregularidade. Esses casos exigem atencao redobrada, porque normalmente envolvem prazo curto, passageiro aguardando, conexao sensivel ou historico de falha anterior.\n\nBagagem prioritaria\nIndica necessidade de tratamento diferenciado, normalmente ligada ao perfil do passageiro, classe de servico, conexao ou processo operacional. Deve ser separada e carregada conforme regra local.\n\nBagagem rush\nE usada quando a bagagem nao seguiu no voo original ou precisa ser encaminhada posteriormente. A etiqueta rush deve estar associada a uma mensagem ou registro que justifique o envio, informando voo, rota, data e destino.\n\nBagagem reetiquetada\nOcorre quando a etiqueta original precisa ser substituida por dano, falha de leitura, alteracao de voo ou redirecionamento. A reetiquetagem deve preservar rastreabilidade e evitar duplicidade de informacao.\n\nBagagem irregular\nPode envolver etiqueta ilegivel, rota divergente, tag danificada, bagagem sem comprovante claro ou mala localizada fora do fluxo esperado. Nesses casos, o agente deve investigar antes de enviar ou entregar.\n\nChecklist rapido\n- Conferir LPN/TN.\n- Conferir rota de baixo para cima.\n- Confirmar destino final.\n- Validar voo/data.\n- Verificar se ha mensagem operacional relacionada.\n- Registrar qualquer divergencia no historico apropriado."},{"title":"Fluxo operacional da bagagem","type":"Simulacao","duration":"16 min","content":"Fluxo operacional da bagagem\n\nObjetivo da trilha\nVisualizar o caminho da bagagem desde o check-in ate a restituicao ao passageiro.\n\nO fluxo operacional da bagagem comeca no check-in, quando a mala e pesada, aceita e etiquetada. A partir desse momento, a etiqueta passa a orientar todas as etapas seguintes.\n\nEtapas do fluxo\n1. Check-in e emissao da etiqueta.\n2. Entrega da bagagem ao sistema de triagem.\n3. Leitura automatizada do codigo de barras.\n4. Separacao por voo, destino ou conexao.\n5. Transporte ate a aeronave correta.\n6. Carregamento no porao ou equipamento previsto.\n7. Transferencia em conexoes, quando houver.\n8. Descarregamento no destino.\n9. Restituicao ao passageiro.\n\nEm cada etapa, a etiqueta pode ser lida por sistema, agente ou equipe operacional. Por isso, a qualidade da impressao, fixacao e conferencia da etiqueta influencia diretamente o resultado final.\n\nRiscos operacionais\n- Codigo de barras danificado.\n- Etiqueta mal fixada.\n- Leitura incorreta da rota.\n- Bagagem separada no pier errado.\n- Perda de conexao por atraso no manuseio.\n- Falha de comunicacao entre areas.\n\nMensagem principal\nPor tras de cada mala entregue corretamente, existe uma cadeia de profissionais que interpretou e executou corretamente as informacoes da etiqueta."},{"title":"Boas praticas e erros comuns","type":"Exercicio","duration":"19 min","content":"Boas praticas e erros comuns\n\nObjetivo da trilha\nPadronizar condutas para reduzir falhas operacionais ligadas a leitura e registro de etiqueta.\n\nBoas praticas\n- Conferir sempre o destino final antes de despachar.\n- Ler a rota de baixo para cima.\n- Confirmar conexoes quando existirem.\n- Usar o LPN/TN como referencia principal.\n- Guardar e orientar o passageiro sobre o comprovante da bagagem.\n- Registrar corretamente o numero da etiqueta em AHL, OHD, DPR ou outro processo.\n- Investigar etiquetas ilegíveis, rasgadas ou divergentes antes de concluir a tratativa.\n\nErros comuns\n- Ler a rota de cima para baixo.\n- Copiar numero incompleto da etiqueta.\n- Confundir aeroporto de conexao com destino final.\n- Ignorar etiqueta rush ou reetiquetagem.\n- Entregar mala sem conferir etiqueta e documento.\n- Abrir processo sem validar o comprovante do passageiro.\n\nConduta esperada\nQuando houver duvida, o agente deve parar, conferir e registrar. A pressa nao pode substituir a verificacao. A etiqueta de bagagem concentra informacoes essenciais, e sua leitura correta protege o passageiro, a operacao e a credibilidade do atendimento.\n\nResumo final\nA correta interpretacao da etiqueta garante rastreabilidade, fluidez operacional e integridade do servico. O profissional que domina LPN, codigos IATA, leitura de rota e situacoes especiais reduz extravios e atua com mais seguranca."},{"title":"Principais aeroportos do mundo","type":"Consulta","duration":"20 min","content":"Resumo da trilha\n\nEsta consulta apresenta as principais siglas IATA de aeroportos usadas na leitura de etiquetas de bagagem, conexoes e destinos. O aluno deve usar a lista completa abaixo como apoio para identificar origem, conexao e destino final, sempre conferindo a sigla da etiqueta com o itinerario do passageiro antes de orientar, registrar ou encaminhar uma irregularidade."},{"title":"Alfabeto fonetico aeroportuario","type":"Consulta","duration":"10 min","content":"Alfabeto fonetico aeroportuario\n\nObjetivo da trilha\nPadronizar a soletracao de siglas, nomes, codigos, etiquetas e referencias operacionais em comunicacao verbal, radio, telefone e atendimento.\n\nNa rotina aeroportuaria, letras parecidas podem causar erro de registro. B, D, E, G, P, T, V e Z podem ser confundidas em ambientes com ruido, radio, sotaque ou pressa. O alfabeto fonetico reduz esse risco porque transforma cada letra em uma palavra padronizada.\n\nLista completa\n- A ALFA\n- B BRAVO\n- C CHARLIE\n- D DELTA\n- E ECHO\n- F FOXTROT\n- G GOLF\n- H HOTEL\n- I INDIA\n- J JULIETT\n- K KILO\n- L LIMA\n- M MIKE\n- N NOVEMBER\n- O OSCAR\n- P PAPA\n- Q QUEBEC\n- R ROMEO\n- S SIERRA\n- T TANGO\n- U UNIFORM\n- V VICTOR\n- W WHISKEY\n- X X-RAY\n- Y YANKEE\n- Z ZULU\n\nExemplos de aplicacao\n- GRU: G GOLF, R ROMEO, U UNIFORM.\n- MIA: M MIKE, I INDIA, A ALFA.\n- JFK: J JULIETT, F FOXTROT, K KILO.\n- TN LA123456: L LIMA, A ALFA, um dois tres quatro cinco seis.\n- PNR ABG58G: A ALFA, B BRAVO, G GOLF, cinco oito, G GOLF.\n\nConduta esperada\nAo transmitir uma sigla ou codigo, fale primeiro o codigo completo e depois soletre se houver risco de erro. Exemplo: destino GRU, soletrando GOLF ROMEO UNIFORM. Em atendimento ao passageiro, use a soletracao apenas quando necessario, mantendo linguagem clara e simples.\n\nPonto de atencao\nNo padrao internacional, ALFA e JULIETT sao grafados dessa forma. Em alguns materiais informais aparecem Alpha ou Juliet, mas a referencia operacional de soletracao usa ALFA e JULIETT."}]$json_interpretacao_etiqueta_bagagem_airports$::jsonb,
    material = $mat_interpretacao_etiqueta_bagagem_airports$Funcao da etiqueta

Funcao da etiqueta

Objetivo da trilha
Compreender a funcao da etiqueta de bagagem no transporte aereo e sua importancia para rastreabilidade, despacho correto e tratativa de irregularidades.

A etiqueta de bagagem e o principal documento operacional da mala. Sem uma etiqueta valida, a bagagem perde sua identificacao formal no fluxo aeroportuario e se torna muito mais dificil de rastrear. Ela e emitida no check-in para bagagens despachadas e acompanha a mala desde a entrega pelo passageiro ate a restituicao no destino.

A etiqueta identifica a bagagem, orienta o sistema automatizado, apoia a leitura humana dos agentes e permite conectar a mala ao passageiro, ao voo, ao itinerario e aos registros de irregularidade. Tudo o que acontece com a mala - despacho, conexao, falha de carregamento, envio incorreto, extravio, localizacao ou devolucao - depende das informacoes impressas e registradas nessa etiqueta.

Na operacao diaria, o agente deve entender que a etiqueta nao e apenas um adesivo. Ela e uma chave operacional. Uma leitura incorreta pode gerar despacho para destino errado, perda de conexao, criacao equivocada de AHL/OHD, demora na busca e insatisfacao do passageiro.

Pontos essenciais
- A etiqueta identifica a bagagem despachada.
- A etiqueta orienta a triagem e o carregamento.
- A etiqueta permite rastreabilidade em sistemas de bagagem.
- A etiqueta ajuda a comprovar origem, destino e conexoes.
- A etiqueta deve ser protegida, lida e registrada corretamente.

Exemplo operacional
Um passageiro desembarca e informa que sua mala nao chegou. Antes de qualquer conclusao, o agente confere o comprovante de bagagem, identifica o numero da etiqueta e usa esse dado como referencia principal para busca e abertura do registro de irregularidade.

---

Estrutura da etiqueta

Estrutura da etiqueta

Objetivo da trilha
Identificar os principais campos de uma etiqueta de bagagem e compreender como cada informacao apoia a operacao.

Uma etiqueta de bagagem normalmente contem informacoes destinadas a leitura automatizada e leitura humana. O sistema de triagem utiliza o codigo de barras para direcionar a mala, enquanto os agentes utilizam campos impressos para conferencia visual, orientacao, reetiquetagem e investigacao.

Campos principais
- Codigo de barras: permite leitura automatizada no sistema de triagem.
- LPN ou TN: numero unico de identificacao da bagagem.
- Companhia emissora: indica quem emitiu a etiqueta.
- Codigo IATA dos aeroportos: identifica origem, conexoes e destino.
- Voo e data: ajudam a confirmar o trecho operacional.
- Nome ou referencia do passageiro: quando disponivel, auxilia na associacao com a viagem.
- Stub ou comprovante: parte entregue ao passageiro para conferencias futuras.

A leitura deve ser feita com calma. Em momentos de pressa, e comum olhar apenas o destino mais visivel e ignorar conexoes. Esse erro pode direcionar a mala para um ponto intermediario ou fazer o agente interpretar destino final como origem.

Boa pratica
Sempre confira tres elementos juntos: numero da etiqueta, rota e destino final. Se houver conexao, valide a sequencia completa antes de orientar, separar ou enviar a bagagem.

---

LPN e rastreabilidade

LPN e rastreabilidade

Objetivo da trilha
Entender o papel do License Plate Number na identificacao unica da bagagem.

LPN significa License Plate Number. Na pratica, e a placa de identificacao da mala dentro da operacao. Assim como um veiculo possui uma placa unica, a bagagem despachada possui um numero que permite rastrear eventos, localizar registros, abrir irregularidades e vincular a mala ao passageiro.

O LPN pode aparecer junto ao codigo de barras e tambem em formato numerico ou alfanumerico, dependendo do padrao utilizado. Em muitos processos operacionais, ele tambem e chamado de TN, Bag Tag Number ou numero da etiqueta.

Por que conferir o LPN
- Evita abrir processo com numero errado.
- Ajuda a localizar mensagens de encaminhamento.
- Permite comparar AHL, OHD e registros de carregamento.
- Reduz risco de entregar mala errada.
- Ajuda em auditoria e historico operacional.

Situacoes em que o LPN e essencial
- Passageiro sem bagagem no desembarque.
- Mala localizada sem passageiro.
- Bagagem enviada por rush.
- Reetiquetagem por falha, dano ou alteracao de rota.
- Conferencia de entrega ao passageiro.

Erro comum
Copiar apenas parte do numero ou confundir caracteres parecidos. Sempre confirme o numero com o comprovante, com a etiqueta fisica e com o sistema antes de salvar um processo.

---

Codigos IATA de aeroporto

Codigos IATA de aeroporto

Objetivo da trilha
Reconhecer os codigos IATA impressos na etiqueta e interpretar sua funcao na rota.

Os codigos IATA de aeroporto possuem tres letras e identificam aeroportos ou cidades na operacao aerea. Eles aparecem na etiqueta para indicar origem, conexoes e destino final. Exemplos comuns incluem GRU, GIG, REC, CWB, MIA, JFK, LHR e CDG.

Esses codigos sao essenciais porque permitem leitura rapida por agentes, sistemas automatizados e equipes de rampa. Um erro de interpretacao pode levar a bagagem para aeroporto incorreto, causar atraso na conexao ou gerar abertura indevida de irregularidade.

Como interpretar
- Verifique todos os aeroportos impressos.
- Identifique qual e a origem.
- Localize conexoes intermediarias.
- Confirme o destino final.
- Compare a etiqueta com o itinerario do passageiro.

Exemplo
Uma etiqueta apresenta CWB, GRU e MIA. Se lida de forma correta, a sequencia indica que a bagagem saiu de CWB, conectou em GRU e tem destino final MIA. Se o agente ler de cima para baixo sem criterio, pode interpretar o destino como origem e direcionar a tratativa de forma errada.

Ponto de atencao
Alguns aeroportos e cidades podem gerar confusao por siglas parecidas. Sempre confira a rota completa, nao apenas um codigo isolado.

---

Leitura correta da rota

Leitura correta da rota

Objetivo da trilha
Aplicar a regra operacional critica: a rota impressa na etiqueta deve ser lida de baixo para cima.

A leitura correta da rota e uma das competencias mais importantes na interpretacao de etiqueta de bagagem. Em muitas etiquetas, a sequencia de aeroportos aparece verticalmente. A regra operacional e ler de baixo para cima.

Regra pratica
- Parte inferior: origem da bagagem.
- Parte central: conexao ou conexoes.
- Parte superior: destino final.

Essa regra evita um dos erros mais comuns: ler a etiqueta de cima para baixo e inverter a rota. Quando isso acontece, o agente pode achar que a mala deveria ir para a origem, quando na verdade a origem esta na parte inferior da etiqueta.

Exemplo guiado
Se a etiqueta apresenta, de cima para baixo:
MIA
GRU
CWB

A leitura correta e CWB/GRU/MIA. A mala saiu de CWB, conecta em GRU e segue para MIA.

Aplicacao no atendimento
Ao receber uma reclamação de bagagem, o agente deve comparar o itinerario informado pelo passageiro com a leitura de baixo para cima da etiqueta. Se houver divergencia, deve investigar antes de registrar conclusoes no sistema.

Ponto de atencao
A excelencia operacional comeca na leitura correta da etiqueta. Quando a rota e compreendida corretamente, o agente melhora a busca, reduz retrabalho e orienta o passageiro com mais seguranca.

---

Bagagem prioritaria, rush e reetiquetada

Bagagem prioritaria, rush e reetiquetada

Objetivo da trilha
Identificar etiquetas em condicoes operacionais diferenciadas e entender os cuidados de conferencia.

Nem toda etiqueta representa uma bagagem em fluxo normal. Algumas malas recebem tratamento especial por prioridade, atraso, reenvio, reetiquetagem ou irregularidade. Esses casos exigem atencao redobrada, porque normalmente envolvem prazo curto, passageiro aguardando, conexao sensivel ou historico de falha anterior.

Bagagem prioritaria
Indica necessidade de tratamento diferenciado, normalmente ligada ao perfil do passageiro, classe de servico, conexao ou processo operacional. Deve ser separada e carregada conforme regra local.

Bagagem rush
E usada quando a bagagem nao seguiu no voo original ou precisa ser encaminhada posteriormente. A etiqueta rush deve estar associada a uma mensagem ou registro que justifique o envio, informando voo, rota, data e destino.

Bagagem reetiquetada
Ocorre quando a etiqueta original precisa ser substituida por dano, falha de leitura, alteracao de voo ou redirecionamento. A reetiquetagem deve preservar rastreabilidade e evitar duplicidade de informacao.

Bagagem irregular
Pode envolver etiqueta ilegivel, rota divergente, tag danificada, bagagem sem comprovante claro ou mala localizada fora do fluxo esperado. Nesses casos, o agente deve investigar antes de enviar ou entregar.

Checklist rapido
- Conferir LPN/TN.
- Conferir rota de baixo para cima.
- Confirmar destino final.
- Validar voo/data.
- Verificar se ha mensagem operacional relacionada.
- Registrar qualquer divergencia no historico apropriado.

---

Fluxo operacional da bagagem

Fluxo operacional da bagagem

Objetivo da trilha
Visualizar o caminho da bagagem desde o check-in ate a restituicao ao passageiro.

O fluxo operacional da bagagem comeca no check-in, quando a mala e pesada, aceita e etiquetada. A partir desse momento, a etiqueta passa a orientar todas as etapas seguintes.

Etapas do fluxo
1. Check-in e emissao da etiqueta.
2. Entrega da bagagem ao sistema de triagem.
3. Leitura automatizada do codigo de barras.
4. Separacao por voo, destino ou conexao.
5. Transporte ate a aeronave correta.
6. Carregamento no porao ou equipamento previsto.
7. Transferencia em conexoes, quando houver.
8. Descarregamento no destino.
9. Restituicao ao passageiro.

Em cada etapa, a etiqueta pode ser lida por sistema, agente ou equipe operacional. Por isso, a qualidade da impressao, fixacao e conferencia da etiqueta influencia diretamente o resultado final.

Riscos operacionais
- Codigo de barras danificado.
- Etiqueta mal fixada.
- Leitura incorreta da rota.
- Bagagem separada no pier errado.
- Perda de conexao por atraso no manuseio.
- Falha de comunicacao entre areas.

Mensagem principal
Por tras de cada mala entregue corretamente, existe uma cadeia de profissionais que interpretou e executou corretamente as informacoes da etiqueta.

---

Boas praticas e erros comuns

Boas praticas e erros comuns

Objetivo da trilha
Padronizar condutas para reduzir falhas operacionais ligadas a leitura e registro de etiqueta.

Boas praticas
- Conferir sempre o destino final antes de despachar.
- Ler a rota de baixo para cima.
- Confirmar conexoes quando existirem.
- Usar o LPN/TN como referencia principal.
- Guardar e orientar o passageiro sobre o comprovante da bagagem.
- Registrar corretamente o numero da etiqueta em AHL, OHD, DPR ou outro processo.
- Investigar etiquetas ilegíveis, rasgadas ou divergentes antes de concluir a tratativa.

Erros comuns
- Ler a rota de cima para baixo.
- Copiar numero incompleto da etiqueta.
- Confundir aeroporto de conexao com destino final.
- Ignorar etiqueta rush ou reetiquetagem.
- Entregar mala sem conferir etiqueta e documento.
- Abrir processo sem validar o comprovante do passageiro.

Conduta esperada
Quando houver duvida, o agente deve parar, conferir e registrar. A pressa nao pode substituir a verificacao. A etiqueta de bagagem concentra informacoes essenciais, e sua leitura correta protege o passageiro, a operacao e a credibilidade do atendimento.

Resumo final
A correta interpretacao da etiqueta garante rastreabilidade, fluidez operacional e integridade do servico. O profissional que domina LPN, codigos IATA, leitura de rota e situacoes especiais reduz extravios e atua com mais seguranca.

---

Principais aeroportos do mundo

- GRU + Aeroporto Internacional de Sao Paulo/Guarulhos + Brasil
- CGH + Aeroporto de Sao Paulo/Congonhas + Brasil
- VCP + Aeroporto Internacional de Viracopos/Campinas + Brasil
- GIG + Aeroporto Internacional do Rio de Janeiro/Galeao + Brasil
- SDU + Aeroporto Santos Dumont + Brasil
- BSB + Aeroporto Internacional de Brasilia + Brasil
- CNF + Aeroporto Internacional de Belo Horizonte/Confins + Brasil
- SSA + Aeroporto Internacional de Salvador + Brasil
- REC + Aeroporto Internacional do Recife/Guararapes + Brasil
- FOR + Aeroporto Internacional de Fortaleza + Brasil
- CWB + Aeroporto Internacional de Curitiba/Afonso Pena + Brasil
- POA + Aeroporto Internacional de Porto Alegre/Salgado Filho + Brasil
- FLN + Aeroporto Internacional de Florianopolis + Brasil
- MAO + Aeroporto Internacional de Manaus/Eduardo Gomes + Brasil
- BEL + Aeroporto Internacional de Belem/Val de Cans + Brasil
- NAT + Aeroporto Internacional de Natal + Brasil
- MIA + Miami International Airport + Estados Unidos
- JFK + John F. Kennedy International Airport + Estados Unidos
- EWR + Newark Liberty International Airport + Estados Unidos
- LGA + LaGuardia Airport + Estados Unidos
- ATL + Hartsfield-Jackson Atlanta International Airport + Estados Unidos
- ORD + Chicago O'Hare International Airport + Estados Unidos
- DFW + Dallas/Fort Worth International Airport + Estados Unidos
- LAX + Los Angeles International Airport + Estados Unidos
- SFO + San Francisco International Airport + Estados Unidos
- SEA + Seattle-Tacoma International Airport + Estados Unidos
- DEN + Denver International Airport + Estados Unidos
- LAS + Harry Reid International Airport + Estados Unidos
- BOS + Boston Logan International Airport + Estados Unidos
- IAH + George Bush Intercontinental Airport + Estados Unidos
- YYZ + Toronto Pearson International Airport + Canada
- YUL + Montreal-Trudeau International Airport + Canada
- YVR + Vancouver International Airport + Canada
- MEX + Aeropuerto Internacional de la Ciudad de Mexico + Mexico
- CUN + Aeropuerto Internacional de Cancun + Mexico
- BOG + Aeropuerto Internacional El Dorado + Colombia
- LIM + Aeropuerto Internacional Jorge Chavez + Peru
- SCL + Aeropuerto Internacional Arturo Merino Benitez + Chile
- EZE + Aeropuerto Internacional Ministro Pistarini/Ezeiza + Argentina
- AEP + Aeroparque Jorge Newbery + Argentina
- MVD + Aeropuerto Internacional de Carrasco + Uruguai
- ASU + Aeropuerto Internacional Silvio Pettirossi + Paraguai
- PTY + Aeropuerto Internacional de Tocumen + Panama
- MAD + Adolfo Suarez Madrid-Barajas Airport + Espanha
- BCN + Josep Tarradellas Barcelona-El Prat Airport + Espanha
- LIS + Aeroporto Humberto Delgado/Lisboa + Portugal
- OPO + Aeroporto Francisco Sa Carneiro/Porto + Portugal
- LHR + London Heathrow Airport + Reino Unido
- LGW + London Gatwick Airport + Reino Unido
- CDG + Paris Charles de Gaulle Airport + Franca
- ORY + Paris-Orly Airport + Franca
- AMS + Amsterdam Airport Schiphol + Paises Baixos
- FRA + Frankfurt Airport + Alemanha
- MUC + Munich Airport + Alemanha
- ZRH + Zurich Airport + Suica
- GVA + Geneva Airport + Suica
- FCO + Rome Fiumicino Airport + Italia
- MXP + Milan Malpensa Airport + Italia
- VIE + Vienna International Airport + Austria
- IST + Istanbul Airport + Turquia
- DXB + Dubai International Airport + Emirados Arabes Unidos
- DOH + Hamad International Airport/Doha + Catar
- AUH + Zayed International Airport/Abu Dhabi + Emirados Arabes Unidos
- JED + King Abdulaziz International Airport/Jeddah + Arabia Saudita
- CAI + Cairo International Airport + Egito
- JNB + O. R. Tambo International Airport/Johannesburg + Africa do Sul
- ADD + Bole International Airport/Addis Ababa + Etiopia
- NBO + Jomo Kenyatta International Airport/Nairobi + Quenia
- SIN + Singapore Changi Airport + Singapura
- HKG + Hong Kong International Airport + Hong Kong/China
- PEK + Beijing Capital International Airport + China
- PVG + Shanghai Pudong International Airport + China
- NRT + Narita International Airport/Tokyo + Japao
- HND + Tokyo Haneda Airport + Japao
- ICN + Incheon International Airport/Seul + Coreia do Sul
- BKK + Suvarnabhumi Airport/Bangkok + Tailandia
- KUL + Kuala Lumpur International Airport + Malasia
- DEL + Indira Gandhi International Airport/Delhi + India
- BOM + Chhatrapati Shivaji Maharaj International Airport/Mumbai + India
- SYD + Sydney Kingsford Smith Airport + Australia
- MEL + Melbourne Airport + Australia
- AKL + Auckland Airport + Nova Zelandia

---

Alfabeto fonetico aeroportuario

- A ALFA
- B BRAVO
- C CHARLIE
- D DELTA
- E ECHO
- F FOXTROT
- G GOLF
- H HOTEL
- I INDIA
- J JULIETT
- K KILO
- L LIMA
- M MIKE
- N NOVEMBER
- O OSCAR
- P PAPA
- Q QUEBEC
- R ROMEO
- S SIERRA
- T TANGO
- U UNIFORM
- V VICTOR
- W WHISKEY
- X X-RAY
- Y YANKEE
- Z ZULU

Uso operacional
Use as siglas IATA para interpretar origem, conexao e destino final na etiqueta de bagagem. Use o alfabeto fonetico para soletrar codigos e evitar erro de comunicacao em radio, telefone, atendimento e registros operacionais.$mat_interpretacao_etiqueta_bagagem_airports$
where id = 'interpretacao-etiqueta-bagagem';
