-- Atualiza SOMENTE as imagens do curso de LIBRAS no Supabase.
-- Grava thumbnails e imagens HD para zoom no campo modules->screenshots.
-- Também remove a trilha/questão de Segurança e Emergência, que foi retirada do curso.

with cleaned_modules as (
    select c.id, jsonb_agg(m.module order by m.ord) as modules
    from academy_courses c
    cross join lateral jsonb_array_elements(c.modules::jsonb) with ordinality as m(module, ord)
    where c.id = 'libras-atendimento-aeroportos'
      and lower(coalesce(m.module->>'title','')) not like '%segurança%'
      and lower(coalesce(m.module->>'title','')) not like '%seguranca%'
      and lower(coalesce(m.module->>'title','')) not like '%emergência%'
      and lower(coalesce(m.module->>'title','')) not like '%emergencia%'
    group by c.id
), visual_profiles(ord, title, src, zoom_src, caption) as (
    values
    (1, 'Acessibilidade comunicacional em LIBRAS', 'https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-correto-01-acessibilidade.png?v=20260904-libras-zoom-2', 'https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-correto-01-acessibilidade-hd.png?v=20260904-libras-zoom-2', 'Cumprimento, apresentação e preferência comunicacional com sinais de referência aplicados ao balcão de atendimento.'),
    (2, 'Cultura surda e respeito no atendimento', 'https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-correto-02-cultura-surda.png?v=20260904-libras-zoom-2', 'https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-correto-02-cultura-surda-hd.png?v=20260904-libras-zoom-2', 'Pronomes e apontamento espacial para falar diretamente com o passageiro surdo, preservando autonomia.'),
    (3, 'Parâmetros dos sinais e expressão', 'https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-correto-03-parametros.png?v=20260904-libras-zoom-2', 'https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-correto-03-parametros-hd.png?v=20260904-libras-zoom-2', 'Configuração de mão, ponto, movimento, orientação e expressão com referência visual de Libras.'),
    (4, 'Alfabeto manual, números e códigos', 'https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-correto-04-alfabeto-numeros.png?v=20260904-libras-zoom-2', 'https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-correto-04-alfabeto-numeros-hd.png?v=20260904-libras-zoom-2', 'Alfabeto manual e numerais para soletrar nomes, voos, portões, assentos, etiquetas e protocolos.'),
    (5, 'Primeiro contato e triagem', 'https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-correto-05-primeiro-contato.png?v=20260904-libras-zoom-2', 'https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-correto-05-primeiro-contato-hd.png?v=20260904-libras-zoom-2', 'Saudação, apresentação, EU/VOCÊ e demonstrativos aplicados aos primeiros segundos de atendimento.'),
    (6, 'Check-in, documento e bagagem', 'https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-correto-06-checkin.png?v=20260904-libras-zoom-2', 'https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-correto-06-checkin-hd.png?v=20260904-libras-zoom-2', 'Datilologia e numerais para confirmar documento, voo, assento, destino final e etiqueta da bagagem.'),
    (7, 'Embarque, conexão e portão', 'https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-correto-07-embarque.png?v=20260904-libras-zoom-2', 'https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-correto-07-embarque-hd.png?v=20260904-libras-zoom-2', 'PORTÃO B12 tratado como código aeroportuário: datilologia/numerais, placa, mapa, horário e painel.'),
    (8, 'Bagagem no desembarque', 'https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-correto-08-bagagem.png?v=20260904-libras-zoom-2', 'https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-correto-08-bagagem-hd.png?v=20260904-libras-zoom-2', 'Cores, números e descrição visual para AHL, DPR, OHD, etiqueta, mala, protocolo e prazo.'),
    (9, 'Atendimento PNAE com autonomia', 'https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-correto-09-pnae.png?v=20260904-libras-zoom-2', 'https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-correto-09-pnae-hd.png?v=20260904-libras-zoom-2', 'Pronomes, demonstrativos e referência espacial para perguntar, orientar e acompanhar com consentimento.'),
    (10, 'Diálogos práticos em aeroporto', 'https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-correto-10-dialogos.png?v=20260904-libras-zoom-2', 'https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-correto-10-dialogos-hd.png?v=20260904-libras-zoom-2', 'Cumprimentos, perguntas, respostas, negação/interrogação e confirmação final em diálogos de aeroporto.'),
    (11, 'Simulações avaliativas', 'https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-correto-11-simulacoes.png?v=20260904-libras-zoom-2', 'https://lealacademy.com.br/leal-academy/assets/academy-screenshots/libras-aeroportos/libras-correto-11-simulacoes-hd.png?v=20260904-libras-zoom-2', 'Avaliação de sinais estudados, datilologia, numerais, expressões, contexto aeroportuário e confirmação.')
), updated_modules as (
    select cm.id,
           jsonb_agg(
               jsonb_set(
                   m.module,
                   '{screenshots}',
                   jsonb_build_array(jsonb_build_object(
                       'src', vp.src,
                       'zoomSrc', vp.zoom_src,
                       'title', vp.title,
                       'caption', vp.caption
                   )),
                   true
               )
               order by m.ord
           ) as modules
    from cleaned_modules cm
    cross join lateral jsonb_array_elements(cm.modules) with ordinality as m(module, ord)
    join visual_profiles vp on vp.ord = m.ord
    group by cm.id
)
update academy_courses c
set modules = um.modules,
    quiz = (
        select jsonb_agg(q.question order by q.ord)
        from jsonb_array_elements(c.quiz::jsonb) with ordinality as q(question, ord)
        where lower(coalesce(q.question->>'question','')) not like '%segurança%'
          and lower(coalesce(q.question->>'question','')) not like '%seguranca%'
          and lower(coalesce(q.question->>'question','')) not like '%emergência%'
          and lower(coalesce(q.question->>'question','')) not like '%emergencia%'
    )
from updated_modules um
where c.id = um.id;

select id, title, jsonb_array_length(modules::jsonb) as trilhas, jsonb_array_length(quiz::jsonb) as questoes
from academy_courses
where id = 'libras-atendimento-aeroportos';
