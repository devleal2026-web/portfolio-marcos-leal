-- Curso novo: Amadeus Altea objetivo em portugues Brasil.
-- Base: Manual Amadeus Altea _210401_140055.pdf, fornecido pelo usuario.
-- Este script altera somente o registro id = 'amadeus-altea-atendimento-aeroportuario'.
-- Nao altera cursos existentes nem interfere nos simuladores.

grant usage on schema public to anon, authenticated;
grant select on public.academy_courses to anon, authenticated;

alter table public.academy_courses
    add column if not exists category text;

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
    'amadeus-altea-atendimento-aeroportuario',
    'Amadeus Altea - Atendimento Aeroportuario',
    'DCS e atendimento de passageiros',
    'atendimento',
    'Intermediario',
    '3h',
    '#0f4c81',
    'Curso objetivo em portugues Brasil para agentes aeroportuarios que precisam operar conceitos essenciais do Amadeus Altea no atendimento: pesquisa de passageiro, check-in, assentos, bagagem, servicos especiais, embarque, alteracoes e rotina segura de registro.',
    $modules_amadeus$[
  {
    "title": "Visao geral do Amadeus Altea no aeroporto",
    "type": "Aula objetiva",
    "duration": "15 min",
    "screenshots": [
      {
        "src": "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 1280 720'%3E%3Crect width='1280' height='720' fill='%230b1f35'/%3E%3Crect x='80' y='80' width='1120' height='560' rx='32' fill='%23eef6ff'/%3E%3Crect x='80' y='80' width='1120' height='88' rx='32' fill='%230f4c81'/%3E%3Ctext x='120' y='136' font-family='Arial' font-size='34' font-weight='700' fill='white'%3EAmadeus Altea - atendimento aeroportuario%3C/text%3E%3Ctext x='120' y='240' font-family='Arial' font-size='31' font-weight='700' fill='%230b1f35'%3EFluxo central%3C/text%3E%3Ctext x='120' y='300' font-family='Arial' font-size='28' fill='%230b1f35'%3E1. localizar passageiro%3C/text%3E%3Ctext x='120' y='350' font-family='Arial' font-size='28' fill='%230b1f35'%3E2. conferir voo e documentos%3C/text%3E%3Ctext x='120' y='400' font-family='Arial' font-size='28' fill='%230b1f35'%3E3. emitir check-in e bagagem%3C/text%3E%3Ctext x='120' y='450' font-family='Arial' font-size='28' fill='%230b1f35'%3E4. tratar excecoes e registrar%3C/text%3E%3Crect x='760' y='235' width='340' height='230' rx='20' fill='%23d6eaff' stroke='%230f4c81' stroke-width='6'/%3E%3Ctext x='810' y='330' font-family='Arial' font-size='54' font-weight='700' fill='%230f4c81'%3EDCS%3C/text%3E%3Ctext x='810' y='390' font-family='Arial' font-size='29' fill='%230b1f35'%3Econtrole de partida%3C/text%3E%3C/svg%3E",
        "title": "Fluxo do Altea no atendimento",
        "caption": "O agente usa o Altea para localizar, conferir, executar e registrar etapas do atendimento."
      }
    ],
    "content": "Objetivo da trilha\nEntender o papel do Amadeus Altea no atendimento aeroportuario sem transformar o curso em um manual extenso.\n\nConteudo essencial\nO Altea e uma plataforma usada no controle de partida e atendimento de passageiros. No balcao, no portao e em areas de apoio, o agente usa o sistema para consultar voo, localizar passageiro, verificar status, realizar check-in, conferir assento, bagagem, servicos especiais e apoiar a tomada de decisao operacional.\n\nTraducao operacional\n- Passenger: passageiro.\n- Flight: voo.\n- Check-in: aceite/registro do passageiro no voo.\n- Boarding: embarque.\n- Seat: assento.\n- Baggage: bagagem.\n- SSR: solicitacao de servico especial.\n- PNR/Record locator: reserva/localizador.\n\nRegra de trabalho\nUse o sistema como fonte de registro e conferencia. Quando houver divergencia entre fala do passageiro, documento, reserva e tela, pare, confira os dados e acione supervisor se necessario."
  },
  {
    "title": "Acesso, tela de trabalho e navegacao",
    "type": "Rotina guiada",
    "duration": "18 min",
    "screenshots": [
      {
        "src": "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 1280 720'%3E%3Crect width='1280' height='720' fill='%2309152a'/%3E%3Crect x='86' y='92' width='1108' height='536' rx='28' fill='%23f7fbff'/%3E%3Crect x='118' y='130' width='1044' height='70' rx='12' fill='%230f4c81'/%3E%3Ctext x='150' y='176' font-family='Arial' font-size='28' font-weight='700' fill='white'%3ETela de trabalho - navegacao segura%3C/text%3E%3Crect x='130' y='238' width='260' height='310' rx='14' fill='%23e6f1fb'/%3E%3Ctext x='160' y='288' font-family='Arial' font-size='26' font-weight='700' fill='%230b1f35'%3EMenu%3C/text%3E%3Ctext x='160' y='340' font-family='Arial' font-size='24' fill='%230b1f35'%3EVoos%3C/text%3E%3Ctext x='160' y='388' font-family='Arial' font-size='24' fill='%230b1f35'%3EPassageiros%3C/text%3E%3Ctext x='160' y='436' font-family='Arial' font-size='24' fill='%230b1f35'%3EBagagens%3C/text%3E%3Ctext x='160' y='484' font-family='Arial' font-size='24' fill='%230b1f35'%3EEmbarque%3C/text%3E%3Crect x='445' y='238' width='620' height='92' rx='14' fill='%23ffffff' stroke='%2397b8d7' stroke-width='3'/%3E%3Ctext x='480' y='295' font-family='Arial' font-size='28' fill='%230b1f35'%3EPesquisar: voo, nome ou localizador%3C/text%3E%3Crect x='445' y='370' width='620' height='178' rx='14' fill='%23ffffff' stroke='%2397b8d7' stroke-width='3'/%3E%3Ctext x='480' y='428' font-family='Arial' font-size='26' font-weight='700' fill='%230b1f35'%3EConferir antes de executar%3C/text%3E%3Ctext x='480' y='482' font-family='Arial' font-size='24' fill='%230b1f35'%3EData, voo, rota, passageiro, status%3C/text%3E%3C/svg%3E",
        "title": "Navegacao segura",
        "caption": "A rotina correta começa por acesso, pesquisa e conferencia antes de qualquer acao."
      }
    ],
    "content": "Objetivo da trilha\nUsar a tela de trabalho com disciplina operacional.\n\nPassos recomendados\n1. Entrar com usuario proprio.\n2. Confirmar ambiente, data operacional e contexto de atendimento.\n3. Localizar o voo ou passageiro.\n4. Conferir dados principais antes de executar qualquer comando.\n5. Registrar ou finalizar apenas depois da verificacao.\n\nCuidados\n- Nao use login de outro colaborador.\n- Nao deixe tela aberta sem vigilancia.\n- Nao execute acao com passageiro errado selecionado.\n- Leia mensagens e alertas antes de prosseguir.\n- Em duvida, nao force a etapa; valide com apoio.\n\nCenario\nO passageiro chega com cartao de embarque antigo. Antes de alterar qualquer coisa, o agente confere data, voo, origem, destino, nome, localizador e status da viagem."
  },
  {
    "title": "Pesquisa de passageiro e reserva",
    "type": "Pratica operacional",
    "duration": "22 min",
    "screenshots": [
      {
        "src": "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 1280 720'%3E%3Crect width='1280' height='720' fill='%230b1f35'/%3E%3Crect x='88' y='88' width='1104' height='544' rx='26' fill='%23eef6ff'/%3E%3Ctext x='130' y='160' font-family='Arial' font-size='36' font-weight='700' fill='%230f4c81'%3EPesquisa de passageiro%3C/text%3E%3Crect x='130' y='210' width='1020' height='86' rx='14' fill='white' stroke='%2397b8d7' stroke-width='3'/%3E%3Ctext x='160' y='265' font-family='Arial' font-size='28' fill='%230b1f35'%3ENome, localizador, documento ou voo%3C/text%3E%3Crect x='130' y='344' width='1020' height='70' rx='12' fill='%23d8ecff'/%3E%3Ctext x='160' y='389' font-family='Arial' font-size='25' font-weight='700' fill='%230b1f35'%3EConfirmar: nome completo, trecho, horario, status e documento%3C/text%3E%3Crect x='130' y='454' width='1020' height='70' rx='12' fill='%23fff4d6'/%3E%3Ctext x='160' y='499' font-family='Arial' font-size='25' fill='%230b1f35'%3EHomônimos e reservas parecidas exigem dupla conferencia%3C/text%3E%3C/svg%3E",
        "title": "Busca e identificacao",
        "caption": "Pesquisa correta evita check-in, alteracao ou atendimento no passageiro errado."
      }
    ],
    "content": "Objetivo da trilha\nLocalizar o passageiro certo e interpretar a reserva de forma objetiva.\n\nFormas comuns de pesquisa\n- Nome e sobrenome.\n- Localizador da reserva.\n- Numero do voo e lista de passageiros.\n- Documento, quando o fluxo permitir.\n- Cartao de embarque ou comprovante apresentado.\n\nConferencia minima\nAntes de qualquer acao, confirme nome, voo, data, origem, destino, conexao, status do passageiro, documento e observacoes relevantes.\n\nProblemas comuns\nHomônimos, erro de grafia, reserva duplicada, voo em data diferente, trecho cancelado, no-show anterior, bilhete sem confirmacao ou passageiro em voo errado.\n\nSimulacao\nDois passageiros tem sobrenomes parecidos no mesmo voo. O agente deve comparar nome completo, documento e destino antes de selecionar a reserva."
  },
  {
    "title": "Check-in e aceitacao do passageiro",
    "type": "Oficina",
    "duration": "24 min",
    "screenshots": [
      {
        "src": "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 1280 720'%3E%3Crect width='1280' height='720' fill='%2309152a'/%3E%3Crect x='76' y='82' width='1128' height='556' rx='30' fill='%23f7fbff'/%3E%3Ctext x='118' y='154' font-family='Arial' font-size='36' font-weight='700' fill='%230f4c81'%3ECheck-in - aceite seguro%3C/text%3E%3Ccircle cx='180' cy='260' r='34' fill='%230f4c81'/%3E%3Ctext x='171' y='271' font-family='Arial' font-size='28' font-weight='700' fill='white'%3E1%3C/text%3E%3Ctext x='235' y='272' font-family='Arial' font-size='28' fill='%230b1f35'%3EValidar documento e voo%3C/text%3E%3Ccircle cx='180' cy='350' r='34' fill='%230f4c81'/%3E%3Ctext x='171' y='361' font-family='Arial' font-size='28' font-weight='700' fill='white'%3E2%3C/text%3E%3Ctext x='235' y='362' font-family='Arial' font-size='28' fill='%230b1f35'%3EConfirmar regras e restricoes%3C/text%3E%3Ccircle cx='180' cy='440' r='34' fill='%230f4c81'/%3E%3Ctext x='171' y='451' font-family='Arial' font-size='28' font-weight='700' fill='white'%3E3%3C/text%3E%3Ctext x='235' y='452' font-family='Arial' font-size='28' fill='%230b1f35'%3ESelecionar assento e emitir cartao%3C/text%3E%3Ccircle cx='180' cy='530' r='34' fill='%230f4c81'/%3E%3Ctext x='171' y='541' font-family='Arial' font-size='28' font-weight='700' fill='white'%3E4%3C/text%3E%3Ctext x='235' y='542' font-family='Arial' font-size='28' fill='%230b1f35'%3ERegistrar bagagem e finalizar%3C/text%3E%3C/svg%3E",
        "title": "Fluxo de check-in",
        "caption": "Check-in seguro depende de verificacao antes da emissao final."
      }
    ],
    "content": "Objetivo da trilha\nExecutar o check-in com foco em seguranca, documento, voo correto e comunicacao clara.\n\nFluxo basico\n- Localizar passageiro.\n- Validar documento e elegibilidade.\n- Conferir voo, horario, destino e conexao.\n- Verificar alertas, restricoes e necessidades especiais.\n- Confirmar ou ajustar assento conforme regra.\n- Registrar bagagem quando aplicavel.\n- Emitir ou orientar cartao de embarque.\n\nErros que devem ser evitados\nAceitar passageiro em voo/data errada, ignorar alerta de documento, selecionar assento inadequado, deixar SSR sem leitura, finalizar sem explicar portao/horario ou despachar bagagem para destino incorreto.\n\nCenario\nPassageiro internacional chega sem documento exigido para o destino. O agente nao deve concluir o aceite ate validar regra documental com a area responsavel."
  },
  {
    "title": "Documentos, alertas e restricoes",
    "type": "Controle",
    "duration": "20 min",
    "screenshots": [
      {
        "src": "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 1280 720'%3E%3Crect width='1280' height='720' fill='%230b1f35'/%3E%3Crect x='90' y='88' width='1100' height='544' rx='28' fill='%23fffaf0'/%3E%3Ctext x='132' y='160' font-family='Arial' font-size='36' font-weight='700' fill='%23845100'%3EAlertas antes do aceite%3C/text%3E%3Crect x='135' y='225' width='1010' height='78' rx='12' fill='white' stroke='%23d49b2a' stroke-width='3'/%3E%3Ctext x='170' y='276' font-family='Arial' font-size='27' fill='%230b1f35'%3EDocumento / visto / APIS / regra de destino%3C/text%3E%3Crect x='135' y='340' width='1010' height='78' rx='12' fill='white' stroke='%23d49b2a' stroke-width='3'/%3E%3Ctext x='170' y='391' font-family='Arial' font-size='27' fill='%230b1f35'%3EMensagens do sistema e restricoes operacionais%3C/text%3E%3Crect x='135' y='455' width='1010' height='78' rx='12' fill='white' stroke='%23d49b2a' stroke-width='3'/%3E%3Ctext x='170' y='506' font-family='Arial' font-size='27' fill='%230b1f35'%3EValidar antes de concluir ou negar embarque%3C/text%3E%3C/svg%3E",
        "title": "Alertas e documentos",
        "caption": "Mensagem de alerta nao e detalhe: pode impedir aceite, embarque ou despacho."
      }
    ],
    "content": "Objetivo da trilha\nEnsinar o aluno a tratar alertas documentais e restricoes sem improviso.\n\nPontos de atencao\nO sistema pode apresentar alertas relacionados a documento, visto, APIS, destino, conexao, necessidade de conferencia manual, pagamento, bilhete, irregularidade ou restricao operacional.\n\nConduta esperada\n- Ler o alerta completo.\n- Confirmar documento fisico com a reserva.\n- Validar regra aplicavel ao destino ou companhia.\n- Registrar orientacao quando houver recusa ou pendencia.\n- Acionar supervisor quando a decisao envolver negar embarque, excecao documental ou regra sensivel.\n\nFrases de atendimento\n- Preciso conferir uma informacao do seu documento.\n- Ainda nao posso finalizar seu check-in.\n- Vou chamar apoio para validar a regra.\n- A liberacao depende da conferencia exigida para este destino."
  },
  {
    "title": "Assentos, servicos especiais e SSR",
    "type": "Pratica guiada",
    "duration": "22 min",
    "screenshots": [
      {
        "src": "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 1280 720'%3E%3Crect width='1280' height='720' fill='%2309152a'/%3E%3Crect x='88' y='88' width='1104' height='544' rx='28' fill='%23f7fbff'/%3E%3Ctext x='130' y='160' font-family='Arial' font-size='36' font-weight='700' fill='%230f4c81'%3EAssentos e SSR%3C/text%3E%3Cg fill='%23d8ecff' stroke='%230f4c81' stroke-width='3'%3E%3Crect x='180' y='230' width='90' height='70' rx='10'/%3E%3Crect x='300' y='230' width='90' height='70' rx='10'/%3E%3Crect x='480' y='230' width='90' height='70' rx='10'/%3E%3Crect x='600' y='230' width='90' height='70' rx='10'/%3E%3Crect x='180' y='330' width='90' height='70' rx='10'/%3E%3Crect x='300' y='330' width='90' height='70' rx='10'/%3E%3Crect x='480' y='330' width='90' height='70' rx='10'/%3E%3Crect x='600' y='330' width='90' height='70' rx='10'/%3E%3C/g%3E%3Ctext x='780' y='270' font-family='Arial' font-size='28' fill='%230b1f35'%3EExemplos SSR:%3C/text%3E%3Ctext x='780' y='325' font-family='Arial' font-size='26' fill='%230b1f35'%3EWCHR, WCHS, WCHC%3C/text%3E%3Ctext x='780' y='375' font-family='Arial' font-size='26' fill='%230b1f35'%3EUMNR, PETC, AVIH%3C/text%3E%3Ctext x='780' y='425' font-family='Arial' font-size='26' fill='%230b1f35'%3EMeal, assistance, remarks%3C/text%3E%3C/svg%3E",
        "title": "Mapa de assentos e SSR",
        "caption": "Assento e servico especial devem ser coerentes com regra, disponibilidade e necessidade do passageiro."
      }
    ],
    "content": "Objetivo da trilha\nTratar assentos e servicos especiais sem criar risco operacional.\n\nAssentos\nO agente deve verificar disponibilidade, restricoes, assento pago, saida de emergencia, passageiro com necessidade especial, menor desacompanhado, familia, conexao e regras da companhia.\n\nSSR\nSSR e uma solicitacao/registro de servico especial. Exemplos frequentes: cadeira de rodas, menor desacompanhado, animal, refeicao, assistencia especifica, observacao medica ou necessidade de acompanhamento.\n\nConduta\n- Leia o SSR antes de alterar atendimento.\n- Nao apague informacao sem motivo e autorizacao.\n- Confirme se o servico ainda e necessario.\n- Avise equipe de portao quando a necessidade impactar embarque.\n\nSimulacao\nPassageiro WCHR solicita assento no corredor. O agente verifica disponibilidade, restricoes de saida de emergencia e registra orientacao para embarque."
  },
  {
    "title": "Bagagem no Altea",
    "type": "Oficina operacional",
    "duration": "24 min",
    "screenshots": [
      {
        "src": "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 1280 720'%3E%3Crect width='1280' height='720' fill='%230b1f35'/%3E%3Crect x='86' y='88' width='1108' height='544' rx='28' fill='%23eef6ff'/%3E%3Ctext x='130' y='160' font-family='Arial' font-size='36' font-weight='700' fill='%230f4c81'%3EBagagem - registro e etiqueta%3C/text%3E%3Crect x='150' y='240' width='260' height='240' rx='30' fill='%230f4c81'/%3E%3Crect x='205' y='190' width='150' height='80' rx='34' fill='none' stroke='%230f4c81' stroke-width='22'/%3E%3Crect x='505' y='230' width='520' height='270' rx='18' fill='white' stroke='%2397b8d7' stroke-width='4'/%3E%3Ctext x='545' y='300' font-family='Arial' font-size='28' fill='%230b1f35'%3EDestino final%3C/text%3E%3Ctext x='545' y='355' font-family='Arial' font-size='28' fill='%230b1f35'%3ENumero da etiqueta%3C/text%3E%3Ctext x='545' y='410' font-family='Arial' font-size='28' fill='%230b1f35'%3EPeso / volumes / conexao%3C/text%3E%3C/svg%3E",
        "title": "Bagagem e etiqueta",
        "caption": "Bagagem exige destino correto, numero de etiqueta, volumes e informacao clara ao passageiro."
      }
    ],
    "content": "Objetivo da trilha\nRegistrar bagagem com conferencia de destino, peso, etiqueta e conexao.\n\nPontos de controle\n- Quantidade de volumes.\n- Peso e franquia aplicavel.\n- Destino final da etiqueta.\n- Conexao com retirada obrigatoria ou despacho ate destino final.\n- Itens especiais, excesso, restricoes e declaracoes quando aplicavel.\n\nRisco operacional\nA maior falha no balcao e tratar a mala como detalhe. Etiqueta errada, destino errado ou explicacao incompleta geram irregularidade no desembarque.\n\nSimulacao\nPassageiro viaja GRU-LIS-FCO e pergunta se retira a mala em Lisboa. O agente consulta a rota, verifica regra de despacho, mostra destino da etiqueta e orienta de forma objetiva."
  },
  {
    "title": "Portao, embarque e controle de voo",
    "type": "Pratica de portao",
    "duration": "25 min",
    "screenshots": [
      {
        "src": "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 1280 720'%3E%3Crect width='1280' height='720' fill='%2309152a'/%3E%3Crect x='82' y='82' width='1116' height='556' rx='30' fill='%23f7fbff'/%3E%3Crect x='120' y='130' width='1040' height='96' rx='16' fill='%230f4c81'/%3E%3Ctext x='155' y='190' font-family='Arial' font-size='38' font-weight='700' fill='white'%3EControle de embarque%3C/text%3E%3Crect x='155' y='280' width='280' height='190' rx='18' fill='%23d8ecff'/%3E%3Ctext x='205' y='355' font-family='Arial' font-size='58' font-weight='700' fill='%230f4c81'%3EG12%3C/text%3E%3Ctext x='205' y='405' font-family='Arial' font-size='27' fill='%230b1f35'%3EPortao%3C/text%3E%3Crect x='520' y='280' width='500' height='190' rx='18' fill='white' stroke='%2397b8d7' stroke-width='4'/%3E%3Ctext x='560' y='340' font-family='Arial' font-size='28' fill='%230b1f35'%3EStatus: aberto / final / fechado%3C/text%3E%3Ctext x='560' y='395' font-family='Arial' font-size='28' fill='%230b1f35'%3EPendencias antes do fechamento%3C/text%3E%3C/svg%3E",
        "title": "Embarque no portao",
        "caption": "No portao, o Altea apoia status do voo, lista de passageiros e controle de embarque."
      }
    ],
    "content": "Objetivo da trilha\nConduzir embarque com lista correta, status atualizado e atencao a excecoes.\n\nRotina de portao\n- Conferir voo, portao, horario e aeronave quando aplicavel.\n- Acompanhar lista de passageiros aceitos e pendentes.\n- Observar passageiros com SSR, prioridade ou necessidade de assistencia.\n- Controlar sequencia de embarque conforme orientacao da companhia.\n- Tratar mensagens antes de fechar voo.\n\nExcecoes comuns\nPassageiro sem check-in, cartao invalido, troca de assento, documento pendente, passageiro em standby, conexao chegando tarde ou divergencia de status.\n\nCenario\nDurante o embarque, passageiro aparece como nao aceito. O agente nao deve liberar apenas pela pressa da fila; precisa localizar registro, validar documento/status e decidir com base no procedimento."
  },
  {
    "title": "Alteracoes, reacomodacao e irregularidades",
    "type": "Solucao de problemas",
    "duration": "25 min",
    "screenshots": [
      {
        "src": "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 1280 720'%3E%3Crect width='1280' height='720' fill='%230b1f35'/%3E%3Crect x='86' y='88' width='1108' height='544' rx='28' fill='%23fffaf0'/%3E%3Ctext x='130' y='160' font-family='Arial' font-size='36' font-weight='700' fill='%23845100'%3EIrregularidade operacional%3C/text%3E%3Ctext x='140' y='250' font-family='Arial' font-size='30' fill='%230b1f35'%3EAtraso, cancelamento, conexao perdida ou troca de voo%3C/text%3E%3Crect x='140' y='320' width='1000' height='82' rx='14' fill='white' stroke='%23d49b2a' stroke-width='3'/%3E%3Ctext x='175' y='374' font-family='Arial' font-size='27' fill='%230b1f35'%3EConferir elegibilidade antes de prometer solucao%3C/text%3E%3Crect x='140' y='445' width='1000' height='82' rx='14' fill='white' stroke='%23d49b2a' stroke-width='3'/%3E%3Ctext x='175' y='499' font-family='Arial' font-size='27' fill='%230b1f35'%3ERegistrar acao e orientar proximo passo%3C/text%3E%3C/svg%3E",
        "title": "Tratativa de irregularidade",
        "caption": "Em alteracoes de voo, a solucao depende de status, regra, disponibilidade e registro correto."
      }
    ],
    "content": "Objetivo da trilha\nAtuar em alteracoes sem prometer o que o sistema e a regra nao autorizam.\n\nSituacoes comuns\n- Atraso.\n- Cancelamento.\n- Perda de conexao.\n- Troca de voo.\n- Passageiro em standby.\n- Divergencia entre reserva e aeroporto.\n\nMetodo\n1. Identificar passageiro e voo original.\n2. Verificar status e motivo operacional.\n3. Consultar opcoes disponiveis conforme regra.\n4. Confirmar aceite do passageiro.\n5. Registrar alteracao e orientar novo horario, portao, assento e bagagem.\n\nFrase critica\nNunca diga que esta resolvido antes de confirmar no sistema e entregar a informacao final ao passageiro."
  },
  {
    "title": "Encerramento, seguranca e boas praticas",
    "type": "Checklist final",
    "duration": "20 min",
    "screenshots": [
      {
        "src": "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 1280 720'%3E%3Crect width='1280' height='720' fill='%2309152a'/%3E%3Crect x='88' y='88' width='1104' height='544' rx='28' fill='%23f7fbff'/%3E%3Ctext x='130' y='160' font-family='Arial' font-size='36' font-weight='700' fill='%230f4c81'%3EChecklist antes de finalizar%3C/text%3E%3Ctext x='150' y='250' font-family='Arial' font-size='30' fill='%230b1f35'%3EOK - passageiro correto%3C/text%3E%3Ctext x='150' y='315' font-family='Arial' font-size='30' fill='%230b1f35'%3EOK - voo, data, rota e status conferidos%3C/text%3E%3Ctext x='150' y='380' font-family='Arial' font-size='30' fill='%230b1f35'%3EOK - documento, bagagem, assento e SSR tratados%3C/text%3E%3Ctext x='150' y='445' font-family='Arial' font-size='30' fill='%230b1f35'%3EOK - passageiro orientado sobre proximo passo%3C/text%3E%3Ctext x='150' y='510' font-family='Arial' font-size='30' fill='%230b1f35'%3EOK - registro limpo e rastreavel%3C/text%3E%3C/svg%3E",
        "title": "Checklist final",
        "caption": "A melhor operacao e aquela que fica conferida, registrada e compreensivel para o proximo agente."
      }
    ],
    "content": "Objetivo da trilha\nConsolidar uma rotina segura de atendimento no Amadeus Altea.\n\nChecklist antes de encerrar\n- Passageiro correto selecionado.\n- Voo, data, origem, destino e conexao conferidos.\n- Documento validado conforme exigencia.\n- Assento coerente com regra e necessidade.\n- Bagagem registrada com destino correto.\n- SSR lido e tratado.\n- Passageiro recebeu orientacao final.\n- Registro ficou claro para continuidade.\n\nBoas praticas\nTrabalhe com calma operacional, mesmo em fila. O erro silencioso no sistema custa mais tempo do que a conferencia feita no inicio. Se a tela apresentar alerta, trate o alerta como parte do atendimento, nao como obstaculo a ignorar.\n\nFechamento\nO objetivo do curso nao e decorar todas as transacoes do manual. E formar uma base objetiva para atender melhor, reduzir erros e saber quando escalar uma decisao."
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
    "question": "Qual e o papel principal do Amadeus Altea no atendimento aeroportuario?",
    "options": [
      "Apoiar consulta, aceite, embarque, bagagem e registros operacionais do passageiro",
      "Substituir todos os procedimentos da companhia",
      "Criar material de marketing para o aeroporto",
      "Emitir documentos oficiais sem conferencia"
    ],
    "correct": 0
  },
  {
    "question": "Antes de executar qualquer acao no passageiro, o agente deve confirmar:",
    "options": [
      "Nome, voo, data, rota, status e documento",
      "Apenas o primeiro nome",
      "Somente o horario informado verbalmente",
      "A cor da mala antes da reserva"
    ],
    "correct": 0
  },
  {
    "question": "O que deve acontecer quando o sistema apresenta um alerta documental?",
    "options": [
      "Ler o alerta, conferir documento e validar a regra antes de concluir o aceite",
      "Ignorar para acelerar a fila",
      "Emitir o cartao primeiro e conferir depois",
      "Pedir ao passageiro para embarcar e resolver no destino"
    ],
    "correct": 0
  },
  {
    "question": "SSR no contexto do atendimento representa:",
    "options": [
      "Solicitacao ou registro de servico especial",
      "Senha de acesso ao sistema",
      "Setor de retirada de bagagem",
      "Status financeiro da reserva"
    ],
    "correct": 0
  },
  {
    "question": "Ao registrar bagagem, qual e um ponto critico de conferencia?",
    "options": [
      "Destino final da etiqueta e quantidade de volumes",
      "Nome do hotel do passageiro",
      "Numero do portao de embarque apenas",
      "Cor da roupa do passageiro"
    ],
    "correct": 0
  },
  {
    "question": "No portao, se um passageiro aparece como nao aceito no sistema, o agente deve:",
    "options": [
      "Validar registro, documento e status antes de liberar embarque",
      "Liberar imediatamente por causa da fila",
      "Criar um novo passageiro sem conferir",
      "Encerrar o voo sem analisar"
    ],
    "correct": 0
  },
  {
    "question": "Em caso de atraso, cancelamento ou perda de conexao, o agente deve evitar:",
    "options": [
      "Prometer solucao antes de confirmar disponibilidade, regra e registro",
      "Consultar status do voo",
      "Explicar o proximo passo",
      "Acionar supervisor quando necessario"
    ],
    "correct": 0
  },
  {
    "question": "Qual e uma boa pratica de seguranca no uso do Altea?",
    "options": [
      "Usar usuario proprio e nao deixar a tela aberta sem vigilancia",
      "Compartilhar login com colegas",
      "Executar a acao primeiro e conferir depois",
      "Ignorar mensagens para ganhar tempo"
    ],
    "correct": 0
  },
  {
    "question": "O encerramento correto do atendimento deve garantir que:",
    "options": [
      "O passageiro foi orientado e o registro ficou claro para continuidade",
      "A fila andou mesmo sem registro",
      "A tela foi fechada sem revisar alertas",
      "O passageiro recebeu apenas resposta verbal incompleta"
    ],
    "correct": 0
  },
  {
    "question": "O objetivo deste curso objetivo de Amadeus Altea e:",
    "options": [
      "Formar base operacional para atendimento, conferencia, registro e escalonamento",
      "Substituir o treinamento oficial completo do sistema",
      "Ensinar todas as telas possiveis do manual",
      "Eliminar a necessidade de supervisor"
    ],
    "correct": 0
  }
]$quiz_amadeus$::jsonb,
    '',
    $material_amadeus$Amadeus Altea - Atendimento Aeroportuario

Resumo
Curso objetivo em portugues Brasil, elaborado a partir do manual Amadeus Altea fornecido pelo usuario. O conteudo foi reorganizado para uso pratico na Leal Academy, com foco no que um agente aeroportuario precisa compreender para atendimento seguro: localizar passageiro, interpretar reserva, executar check-in, tratar documentos, assentos, bagagem, SSR, embarque e irregularidades.

O que este curso cobre
1. Papel do Amadeus Altea no atendimento aeroportuario.
2. Acesso, navegacao e disciplina de tela.
3. Pesquisa de passageiro e reserva.
4. Check-in e aceite.
5. Documentos, alertas e restricoes.
6. Assentos e servicos especiais.
7. Bagagem e etiqueta.
8. Embarque no portao.
9. Alteracoes e irregularidades.
10. Checklist de encerramento.

Glossario rapido
Passenger - passageiro.
Flight - voo.
Boarding - embarque.
Seat - assento.
Baggage - bagagem.
SSR - solicitacao de servico especial.
PNR/Record locator - reserva/localizador.
Check-in - aceite/registro do passageiro no voo.

Metodo de atendimento
1. Pesquise com dado confiavel.
2. Confirme passageiro, voo, data e rota.
3. Leia alertas antes de executar.
4. Valide documento e regra aplicavel.
5. Confira assento, bagagem e SSR.
6. Oriente o passageiro sobre proximo passo.
7. Registre a acao de forma rastreavel.
8. Escale ao supervisor quando envolver excecao, recusa, regra documental, irregularidade complexa ou decisao sensivel.

Referencias do conteudo
- Manual Amadeus Altea _210401_140055.pdf, fornecido pelo usuario. Utilizado como base local para selecionar temas, traduzir conceitos ao portugues Brasil e reorganizar o material em trilhas objetivas para atendimento aeroportuario.
- Amadeus Training Centre - Altea Departure Control - Customer Management. Referencia publica sobre objetivos do treinamento: introducao ao Altea, aceite de passageiros, bagagem, assentos, assistencia, regrade e embarque. Link: https://www.learn.amadeus.com/All-Courses/item-1371979472-Altea-Departure-Control-Customer-Management-1.en.htm
- IATA - Passenger Ground Services with Amadeus Altea DCS. Referencia publica sobre atendimento de passageiros em check-in, portao, concourse, DCS/CRS, embarque, passageiros com necessidades especiais e transporte seguro de passageiros e bagagens. Link: https://www.iata.org/en/training/courses/passenger-ground-services/goc002eben01/en/

Como as referencias foram utilizadas
As referencias foram usadas para validar a selecao dos topicos e a sequencia didatica. O texto final foi escrito de forma autoral, objetiva e voltada para atendimento aeroportuario no Brasil, sem reproduzir integralmente o manual original nem materiais pagos/restritos.

Observacao
Este curso nao substitui treinamento oficial completo do provedor do sistema nem regras internas de companhia aerea. Ele serve como base objetiva para melhorar a leitura operacional, reduzir erros e orientar quando escalar uma decisao.$material_amadeus$,
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
