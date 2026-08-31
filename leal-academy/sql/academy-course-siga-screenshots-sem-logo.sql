-- Updates only the SIGA screenshot paths to the no-logo image files.
-- It preserves all current lesson text and all other module fields.

update public.academy_courses as course
set modules = (
    select jsonb_agg(
        case lesson.module ->> 'title'
            when 'Conceito e finalidade' then
                lesson.module || jsonb_build_object(
                    'screenshots',
                    jsonb_build_array(
                        jsonb_build_object(
                            'src', '../assets/academy-screenshots/siga/siga-conceito-finalidade-sem-logo.jpg',
                            'title', 'Visao geral do SIGA',
                            'caption', 'Referencia visual do ambiente integrado usado para centralizar informacoes operacionais.'
                        )
                    )
                )
            when 'Acesso seguro' then
                lesson.module || jsonb_build_object(
                    'screenshots',
                    jsonb_build_array(
                        jsonb_build_object(
                            'src', '../assets/academy-screenshots/siga/siga-acesso-seguro-sem-logo.jpg',
                            'title', 'Tela de acesso e ambiente inicial',
                            'caption', 'Exemplo visual para reforcar acesso individual, perfil correto e uso autorizado.'
                        )
                    )
                )
            when 'Dashboard operacional' then
                lesson.module || jsonb_build_object(
                    'screenshots',
                    jsonb_build_array(
                        jsonb_build_object(
                            'src', '../assets/academy-screenshots/siga/siga-dashboard-operacional-sem-logo.jpg',
                            'title', 'Dashboard operacional',
                            'caption', 'Tela de acompanhamento inicial com informacoes de turno, publicacoes e atalhos operacionais.'
                        )
                    )
                )
            when 'Controle de voos' then
                lesson.module || jsonb_build_object(
                    'screenshots',
                    jsonb_build_array(
                        jsonb_build_object(
                            'src', '../assets/academy-screenshots/siga/siga-controle-voos-sem-logo.jpg',
                            'title', 'Controle de voos',
                            'caption', 'Referencia para consulta de voos, status, etapas operacionais e impacto nos servicos de solo.'
                        )
                    )
                )
            when 'Atualizações operacionais' then
                lesson.module || jsonb_build_object(
                    'screenshots',
                    jsonb_build_array(
                        jsonb_build_object(
                            'src', '../assets/academy-screenshots/siga/siga-atualizacoes-operacionais-sem-logo.jpg',
                            'title', 'Atualizacoes operacionais',
                            'caption', 'Print de apoio para leitura de publicacoes, mudancas de fluxo e informacoes recentes.'
                        )
                    )
                )
            when 'Avisos, alertas e incidentes' then
                lesson.module || jsonb_build_object(
                    'screenshots',
                    jsonb_build_array(
                        jsonb_build_object(
                            'src', '../assets/academy-screenshots/siga/siga-avisos-alertas-incidentes-sem-logo.jpg',
                            'title', 'Avisos e alertas',
                            'caption', 'Exemplo visual de area usada para acompanhar avisos, alertas e ocorrencias que exigem acao.'
                        )
                    )
                )
            when 'Colaboração e feedback' then
                lesson.module || jsonb_build_object(
                    'screenshots',
                    jsonb_build_array(
                        jsonb_build_object(
                            'src', '../assets/academy-screenshots/siga/siga-colaboracao-feedback-sem-logo.jpg',
                            'title', 'Colaboracao e feedback',
                            'caption', 'Referencia de recurso colaborativo para reporte de erro, incidencia ou melhoria operacional.'
                        )
                    )
                )
            when 'Boas práticas de uso' then
                lesson.module || jsonb_build_object(
                    'screenshots',
                    jsonb_build_array(
                        jsonb_build_object(
                            'src', '../assets/academy-screenshots/siga/siga-boas-praticas-sem-logo.jpg',
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
