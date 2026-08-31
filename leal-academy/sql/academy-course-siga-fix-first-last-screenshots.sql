-- Fixes only SIGA lesson 01 and lesson 08 screenshots.
-- Lessons 02 to 07 remain untouched. Existing lesson text is preserved.

update public.academy_courses as course
set modules = (
    select jsonb_agg(
        case lesson.module ->> 'title'
            when 'Conceito e finalidade' then
                lesson.module || jsonb_build_object(
                    'screenshots',
                    jsonb_build_array(
                        jsonb_build_object(
                            'src', '../assets/academy-screenshots/siga/siga-conceito-finalidade-fixed.jpg',
                            'title', 'Visao geral do SIGA',
                            'caption', 'Referencia visual do ambiente integrado usado para centralizar informacoes operacionais.'
                        )
                    )
                )
            when 'Boas práticas de uso' then
                lesson.module || jsonb_build_object(
                    'screenshots',
                    jsonb_build_array(
                        jsonb_build_object(
                            'src', '../assets/academy-screenshots/siga/siga-boas-praticas-fixed.jpg',
                            'title', 'Boas praticas de uso',
                            'caption', 'Print de encerramento para reforcar consulta frequente, registro correto e disciplina operacional.'
                        )
                    )
                )
            else lesson.module
        end
        order by lesson.ordinality
    )
    from jsonb_array_elements(course.modules::jsonb) with ordinality as lesson(module, ordinality)
)
where course.id = 'siga-gestao-aeroportuaria';
