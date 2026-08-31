-- Forces the SIGA final trail image to reload by adding a cache-busting version to the JPG URL.
-- It updates only the screenshots field of the 8th trail. No course text, quiz, labs or material links are changed.

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
                                'src', 'https://devleal2026-web.github.io/portfolio-marcos-leal/leal-academy/assets/academy-screenshots/siga/siga-boas-praticas-uso.jpg?v=20260831-2',
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

select
    module.position,
    module.item ->> 'title' as trail_title,
    module.item -> 'screenshots' as screenshots
from public.academy_courses course
cross join lateral jsonb_array_elements(coalesce(course.modules, '[]'::jsonb)) with ordinality as module(item, position)
where course.id = 'siga-gestao-aeroportuaria'
  and module.position = 8;
