-- Adds the full SIGA PDF as a support material link.
-- Existing course content, modules, screenshots, quiz, material text and current links are preserved.

update public.academy_courses
set labs = coalesce(labs, '[]'::jsonb) || jsonb_build_array(
    jsonb_build_object(
        'label', 'Slide SIGA Latam',
        'href', 'https://devleal2026-web.github.io/portfolio-marcos-leal/leal-academy/assets/academy-materials/slide-siga-latam.pdf'
    )
)
where id = 'siga-gestao-aeroportuaria'
  and not exists (
      select 1
      from jsonb_array_elements(coalesce(labs, '[]'::jsonb)) as item
      where item ->> 'label' = 'Slide SIGA Latam'
  );
