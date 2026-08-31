-- Updates only the SIGA screenshot paths to images with automatic logo overlay.
-- It preserves all existing lesson text and all other module fields.

update public.academy_courses as course
set modules = (
    select jsonb_agg(
        case lesson.module ->> 'title'
            when 'Conceito e finalidade' then
                lesson.module || jsonb_build_object(
                    'screenshots',
                    jsonb_build_array(
                        jsonb_build_object(
                            'src', '../assets/academy-screenshots/siga/siga-conceito-finalidade-leal-auto.jpg',
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
                            'src', '../assets/academy-screenshots/siga/siga-acesso-seguro-leal-auto.jpg',
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
                            'src', '../assets/academy-screenshots/siga/siga-dashboard-operacional-leal-auto.jpg',
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
                            'src', '../assets/academy-screenshots/siga/siga-controle-voos-leal-auto.jpg',
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
                            'src', '../assets/academy-screenshots/siga/siga-atualizacoes-operacionais-leal-auto.jpg',
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
                            'src', '../assets/academy-screenshots/siga/siga-avisos-alertas-incidentes-leal-auto.jpg',
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
                            'src', '../assets/academy-screenshots/siga/siga-colaboracao-feedback-leal-auto.jpg',
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
                            'src', '../assets/academy-screenshots/siga/siga-boas-praticas-leal-auto.jpg',
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
