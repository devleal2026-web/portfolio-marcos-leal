-- Updates only the SIGA course support material and the final trail screenshot.
-- Existing course text, quiz, progress and the other trail screenshots are preserved.

with updated_modules as (
    select
        course.id,
        jsonb_agg(
            case
                when module.item ->> 'title' = 'Boas práticas de uso' then
                    jsonb_set(
                        module.item,
                        '{screenshots}',
                        jsonb_build_array(
                            jsonb_build_object(
                                'title', 'Boas práticas de uso',
                                'src', '../assets/academy-screenshots/siga/siga-boas-praticas-uso.png',
                                'caption', 'Imagem de apoio sobre consulta regular, registro preciso, comunicação e disciplina operacional.'
                            )
                        ),
                        true
                    )
                else module.item
            end
            order by module.position
        ) as modules
    from public.academy_courses course
    cross join lateral jsonb_array_elements(coalesce(course.modules, '[]'::jsonb)) with ordinality as module(item, position)
    where course.id = 'siga-gestao-aeroportuaria'
    group by course.id
), cleaned_labs as (
    select
        course.id,
        coalesce(
            jsonb_agg(link.item) filter (
                where coalesce(link.item ->> 'label', '') <> 'Slide SIGA Latam'
                  and coalesce(link.item ->> 'href', '') not like '%slide-siga-latam.pdf'
            ),
            '[]'::jsonb
        ) as labs
    from public.academy_courses course
    left join lateral jsonb_array_elements(coalesce(course.labs, '[]'::jsonb)) as link(item) on true
    where course.id = 'siga-gestao-aeroportuaria'
    group by course.id
)
update public.academy_courses course
set
    modules = updated_modules.modules,
    labs = cleaned_labs.labs || jsonb_build_array(
        jsonb_build_object(
            'kind', 'material',
            'label', 'Slide SIGA Latam',
            'href', 'https://devleal2026-web.github.io/portfolio-marcos-leal/leal-academy/assets/academy-materials/slide-siga-latam.pdf'
        )
    )
from updated_modules
join cleaned_labs on cleaned_labs.id = updated_modules.id
where course.id = updated_modules.id;
