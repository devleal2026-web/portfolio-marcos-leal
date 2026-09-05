-- Atualiza imagens zoomaveis do curso de LIBRAS usando pranchas baseadas em frames do Dicionario INES.
-- Execute no Supabase SQL Editor. Nao altera coluna image; atualiza apenas o JSONB de modules.
-- Versao: 20260905-libras-ines-1

with target_course as (
    select id, modules
    from academy_courses
    where id = 'libras-atendimento-aeroportos'
       or slug = 'libras-atendimento-aeroportos'
       or lower(title) like '%libras%aeroporto%'
    limit 1
), visual_map(module_index, screenshots) as (
    values
    (1, '[{"src": "https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-ines-01-inicio-atendimento.png?v=20260905-libras-ines-1", "zoomSrc": "https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-ines-01-inicio-atendimento-hd.png?v=20260905-libras-ines-1", "title": "Inicio do atendimento em LIBRAS", "caption": "Frames de videos publicos do Dicionario INES para VOCE, AJUDAR e AEROPORTO, aplicados a abertura do atendimento aeroportuario."}]'::jsonb),
    (2, '[{"src": "https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-ines-02-cultura-surda.png?v=20260905-libras-ines-1", "zoomSrc": "https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-ines-02-cultura-surda-hd.png?v=20260905-libras-ines-1", "title": "Cultura surda e autonomia", "caption": "Sinais INES para SURDO, VOCE e INFORMACAO, vinculados ao atendimento direto e respeitoso."}]'::jsonb),
    (3, '[{"src": "https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-ines-03-parametros.png?v=20260905-libras-ines-1", "zoomSrc": "https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-ines-03-parametros-hd.png?v=20260905-libras-ines-1", "title": "Parametros dos sinais", "caption": "Sequencias de movimento INES para observar configuracao de mao, movimento, apontamento e expressao."}]'::jsonb),
    (4, '[{"src": "https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-ines-04-alfabeto-numeros.png?v=20260905-libras-ines-1", "zoomSrc": "https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-ines-04-alfabeto-numeros-hd.png?v=20260905-libras-ines-1", "title": "Alfabeto manual completo A-Z", "caption": "Alfabeto manual completo para nomes, siglas, portoes, assentos, etiquetas e protocolos."}]'::jsonb),
    (5, '[{"src": "https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-ines-05-primeiro-contato.png?v=20260905-libras-ines-1", "zoomSrc": "https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-ines-05-primeiro-contato-hd.png?v=20260905-libras-ines-1", "title": "Primeiro contato e triagem", "caption": "Sinais INES para VOCE, PRECISAR, AQUI e AJUDAR em triagem inicial."}]'::jsonb),
    (6, '[{"src": "https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-ines-06-checkin.png?v=20260905-libras-ines-1", "zoomSrc": "https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-ines-06-checkin-hd.png?v=20260905-libras-ines-1", "title": "Check-in, documento e bagagem", "caption": "Sinais INES para DOCUMENTO, BILHETE, PASSAPORTE e BAGAGEM no fluxo de check-in."}]'::jsonb),
    (7, '[{"src": "https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-ines-07-embarque-conexao.png?v=20260905-libras-ines-1", "zoomSrc": "https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-ines-07-embarque-conexao-hd.png?v=20260905-libras-ines-1", "title": "Embarque, portao e conexao", "caption": "Sinais INES para PORTAO, AVIAO, HORA e MAPA; codigos como B12 devem ser feitos por datilologia/numerais."}]'::jsonb),
    (8, '[{"src": "https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-ines-08-bagagem-desembarque.png?v=20260905-libras-ines-1", "zoomSrc": "https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-ines-08-bagagem-desembarque-hd.png?v=20260905-libras-ines-1", "title": "Bagagem no desembarque", "caption": "Sinais INES para MALA, BAGAGEM, PROBLEMA e AGUARDAR no atendimento de ocorrencia de bagagem."}]'::jsonb),
    (9, '[{"src": "https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-ines-09-pnae-autonomia.png?v=20260905-libras-ines-1", "zoomSrc": "https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-ines-09-pnae-autonomia-hd.png?v=20260905-libras-ines-1", "title": "Atendimento PNAE com autonomia", "caption": "Sinais INES para AJUDAR, ACOMPANHAR, ESPERAR e CONFIRMAR com consentimento e autonomia."}]'::jsonb),
    (10, '[{"src": "https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-ines-10-dialogos.png?v=20260905-libras-ines-1", "zoomSrc": "https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-ines-10-dialogos-hd.png?v=20260905-libras-ines-1", "title": "Dialogos praticos em aeroporto", "caption": "Sinais INES para PEDIR, NAO, QUERER e OBRIGADO em sequencias de pergunta, resposta e encerramento."}]'::jsonb),
    (11, '[{"src": "https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-ines-11-simulacoes.png?v=20260905-libras-ines-1", "zoomSrc": "https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-ines-11-simulacoes-hd.png?v=20260905-libras-ines-1", "title": "Simulacoes avaliativas", "caption": "Sinais INES para PROBLEMA, AGUA, BANHEIRO, CANCELAR, IR e PASSAGEIRO em cenarios avaliativos."}]'::jsonb)
), clean_modules as (
    select
        tc.id,
        jsonb_agg(m.module order by m.ordinality) as modules
    from target_course tc
    cross join lateral jsonb_array_elements(tc.modules) with ordinality as m(module, ordinality)
    where lower(coalesce(m.module->>'title','')) not like '%seguran%'
      and lower(coalesce(m.module->>'title','')) not like '%emerg%'
    group by tc.id
), module_rows as (
    select
        cm.id,
        (m.ordinality)::int as module_index,
        jsonb_set(m.module, '{screenshots}', vm.screenshots, true) as module
    from clean_modules cm
    cross join lateral jsonb_array_elements(cm.modules) with ordinality as m(module, ordinality)
    join visual_map vm on vm.module_index = m.ordinality
), rebuilt as (
    select id, jsonb_agg(module order by module_index) as modules
    from module_rows
    group by id
)
update academy_courses c
set modules = rebuilt.modules,
    updated_at = now()
from rebuilt
where c.id = rebuilt.id;

select id, title, jsonb_array_length(modules) as total_trilhas
from academy_courses
where id = 'libras-atendimento-aeroportos'
   or slug = 'libras-atendimento-aeroportos'
   or lower(title) like '%libras%aeroporto%';
