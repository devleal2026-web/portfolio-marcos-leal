-- Aero Access Web - recriacao segura da RPC de login
-- Execute no SQL Editor do projeto Supabase usado pelo Aero Access Web.
-- A funcao valida a senha, mas NUNCA retorna a coluna password ao navegador.

begin;

drop function if exists public.aa_login_web(text, text, text);

create function public.aa_login_web(
    p_profile text,
    p_email text,
    p_password text
)
returns jsonb
language plpgsql
security definer
set search_path = public
as $$
declare
    v_email text := lower(trim(coalesce(p_email, '')));
    v_profile text := lower(trim(coalesce(p_profile, '')));
    v_id uuid;
    v_name text;
    v_role text;
    v_active boolean;
    v_phone text;
    v_status text;
    v_total_requests integer;
begin
    if v_email = '' or coalesce(p_password, '') = '' then
        return null;
    end if;

    if v_profile = 'admin' then
        select u.id, u.name, u.role, coalesce(u.active, true)
          into v_id, v_name, v_role, v_active
          from public.users u
         where lower(u.email) = v_email
           and u.password = p_password
           and coalesce(u.active, true) is true
         limit 1;

        if found then
            return jsonb_build_object(
                'id', v_id,
                'name', v_name,
                'email', v_email,
                'role', coalesce(v_role, 'admin'),
                'active', v_active
            );
        end if;

        select g.id, g.name
          into v_id, v_name
          from public.aa_global_admins g
         where lower(g.email) = v_email
           and g.password = p_password
         limit 1;

        if found then
            return jsonb_build_object(
                'id', v_id,
                'name', v_name,
                'email', v_email,
                'role', 'admin_global',
                'active', true
            );
        end if;

        select c.id, c.name
          into v_id, v_name
          from public.aa_company_admins c
         where lower(c.email) = v_email
           and c.password = p_password
         limit 1;

        if found then
            return jsonb_build_object(
                'id', v_id,
                'name', v_name,
                'email', v_email,
                'role', 'admin_empresa',
                'active', true
            );
        end if;

        return null;
    end if;

    if v_profile = 'agent' then
        select a.id, a.name, coalesce(a.active, true), a.status, coalesce(a.total_requests, 0)
          into v_id, v_name, v_active, v_status, v_total_requests
          from public.agents a
         where lower(a.email) = v_email
           and a.password = p_password
           and coalesce(a.active, true) is true
         limit 1;

        if found then
            update public.agents
               set last_access = now()
             where id = v_id;

            return jsonb_build_object(
                'id', v_id,
                'name', v_name,
                'email', v_email,
                'role', 'agent',
                'active', v_active,
                'status', v_status,
                'total_requests', v_total_requests
            );
        end if;

        return null;
    end if;

    if v_profile = 'passenger' then
        select p.id, p.name, p.phone, coalesce(p.active, true), coalesce(p.total_requests, 0)
          into v_id, v_name, v_phone, v_active, v_total_requests
          from public.passengers p
         where lower(p.email) = v_email
           and p.password = p_password
           and coalesce(p.active, true) is true
         limit 1;

        if found then
            return jsonb_build_object(
                'id', v_id,
                'name', v_name,
                'email', v_email,
                'phone', v_phone,
                'role', 'passenger',
                'active', v_active,
                'total_requests', v_total_requests
            );
        end if;

        return null;
    end if;

    return null;
end;
$$;

alter function public.aa_login_web(text, text, text) owner to postgres;

grant usage on schema public to anon;
grant usage on schema public to authenticated;
grant execute on function public.aa_login_web(text, text, text) to anon;
grant execute on function public.aa_login_web(text, text, text) to authenticated;

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
  and p.proname = 'aa_login_web';

-- Teste manual: substitua pelos dados da conta que deseja validar.
-- select public.aa_login_web('admin', 'email@exemplo.com', 'senha');
