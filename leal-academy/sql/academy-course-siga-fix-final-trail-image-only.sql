-- Fixes only the support image of the 8th/final trail in the SIGA course.
-- It does not change course text, quiz, support materials, labs or other trails.

update public.academy_courses as course
set modules = fixed.modules
from (
    select
        id,
        jsonb_agg(
            case
                when module.position = 8 then
                    jsonb_set(
                        module.item,
                        '{screenshots}',
                        jsonb_build_array(
                            jsonb_build_object(
                                'title', coalesce(module.item ->> 'title', 'Boas práticas de uso'),
                                'src', 'https://devleal2026-web.github.io/portfolio-marcos-leal/leal-academy/assets/academy-screenshots/siga/siga-boas-praticas-uso.png',
                                'caption', 'Imagem de apoio sobre consulta regular, registro preciso, comunicação e disciplina operacional.'
                            )
                        ),
                        true
                    )
                else module.item
            end
            order by module.position
        ) as modules
    from public.academy_courses
    cross join lateral jsonb_array_elements(coalesce(modules, '[]'::jsonb)) with ordinality as module(item, position)
    where id = 'siga-gestao-aeroportuaria'
    group by id
) as fixed
where course.id = fixed.id;
