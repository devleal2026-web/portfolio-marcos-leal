-- Aero Access Web - RPC unica de login para a versao web
-- Execute no SQL Editor do projeto Supabase usado pelo Aero Access Web.
-- A funcao valida a senha, mas NUNCA retorna a coluna password ao navegador.

begin;

drop function if exists public.aa_login_web(text, text, text);
drop function if exists public.aa_web_login_v2(text, text, text);
drop function if exists public.aa_access_login(jsonb);

create function public.aa_access_login(payload jsonb)
returns jsonb
language plpgsql
security definer
set search_path = public
as $$
declare
    v_profile text := lower(trim(coalesce(payload ->> 'profile', '')));
    v_email text := lower(trim(coalesce(payload ->> 'email', '')));
    v_password text := coalesce(payload ->> 'password', '');
    v_result jsonb;
    v_row jsonb;
begin
    if v_email = '' or v_password = '' then
        return null;
    end if;

    if v_profile in ('admin', 'admin_operacional', 'admin_operational') then
        select jsonb_build_object(
            'id', u.id,
            'name', u.name,
            'email', lower(u.email),
            'role', coalesce(u.role, 'admin'),
            'active', coalesce(u.active, true)
        )
          into v_result
          from public.users u
         where lower(u.email) = v_email
           and u.password = v_password
           and coalesce(u.active, true) is true
         limit 1;

        return v_result;
    end if;

    if v_profile in ('admin_empresa', 'company_admin') then
        select to_jsonb(c)
          into v_row
          from public.aa_company_admins c
         where lower(c.email) = v_email
           and c.password = v_password
         limit 1;

        if v_row is null or coalesce((v_row ->> 'active')::boolean, true) is not true then
            return null;
        end if;

        return jsonb_build_object(
            'id', v_row -> 'id',
            'name', coalesce(v_row ->> 'name', v_row ->> 'email', 'Admin empresa'),
            'email', lower(v_row ->> 'email'),
            'role', 'admin_empresa',
            'company_id', v_row -> 'company_id',
            'active', true
        );
    end if;

    if v_profile in ('admin_global', 'global_admin') then
        select to_jsonb(g)
          into v_row
          from public.aa_global_admins g
         where lower(g.email) = v_email
           and g.password = v_password
         limit 1;

        if v_row is null or coalesce((v_row ->> 'active')::boolean, true) is not true then
            return null;
        end if;

        return jsonb_build_object(
            'id', v_row -> 'id',
            'name', coalesce(v_row ->> 'name', v_row ->> 'email', 'Admin global'),
            'email', lower(v_row ->> 'email'),
            'role', 'admin_global',
            'active', true
        );
    end if;

    if v_profile = 'agent' then
        select jsonb_build_object(
            'id', a.id,
            'name', a.name,
            'email', lower(a.email),
            'role', 'agent',
            'active', coalesce(a.active, true),
            'status', a.status,
            'total_requests', coalesce(a.total_requests, 0)
        )
          into v_result
          from public.agents a
         where lower(a.email) = v_email
           and a.password = v_password
           and coalesce(a.active, true) is true
         limit 1;

        if v_result is not null then
            update public.agents
               set last_access = now()
             where id = (v_result ->> 'id')::uuid;
        end if;

        return v_result;
    end if;

    if v_profile = 'passenger' then
        select jsonb_build_object(
            'id', p.id,
            'name', p.name,
            'email', lower(p.email),
            'phone', p.phone,
            'role', 'passenger',
            'active', coalesce(p.active, true),
            'total_requests', coalesce(p.total_requests, 0)
        )
          into v_result
          from public.passengers p
         where lower(p.email) = v_email
           and p.password = v_password
           and coalesce(p.active, true) is true
         limit 1;

        return v_result;
    end if;

    return null;
end;
$$;

alter function public.aa_access_login(jsonb) owner to postgres;

grant usage on schema public to anon;
grant usage on schema public to authenticated;
grant execute on function public.aa_access_login(jsonb) to anon;
grant execute on function public.aa_access_login(jsonb) to authenticated;

commit;

notify pgrst, 'reload schema';

-- Verificacao da assinatura exposta para a API.
select
    n.nspname as schema,
    p.proname as function_name,
    pg_get_function_identity_arguments(p.oid) as arguments,
    p.prosecdef as security_definer
from pg_proc p
join pg_namespace n on n.oid = p.pronamespace
where n.nspname = 'public'
  and p.proname = 'aa_access_login';

-- Teste manual: substitua pelos dados da conta que deseja validar.
-- select public.aa_access_login(jsonb_build_object(
--     'profile', 'admin_operacional',
--     'email', 'email@exemplo.com',
--     'password', 'senha'
-- ));
