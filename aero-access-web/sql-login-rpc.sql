-- Aero Access Web - login RPC seguro
-- Execute no SQL Editor do Supabase do projeto Aero Access.
-- A funcao valida credenciais sem expor leitura aberta das tabelas users, agents e passengers.

create or replace function public.aa_login_web(
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
    v_user record;
begin
    if v_email = '' or coalesce(p_password, '') = '' then
        return null;
    end if;

    if v_profile = 'passenger' then
        select id, name, email, phone, active, total_requests
          into v_user
          from public.passengers
         where lower(email) = v_email
           and password = p_password
           and active is true
         limit 1;

        if not found then
            return null;
        end if;

        return jsonb_build_object(
            'id', v_user.id,
            'name', v_user.name,
            'email', v_user.email,
            'phone', v_user.phone,
            'active', v_user.active,
            'total_requests', coalesce(v_user.total_requests, 0),
            'role', 'passenger'
        );
    end if;

    if v_profile = 'agent' then
        select id, name, email, active, status, total_requests
          into v_user
          from public.agents
         where lower(email) = v_email
           and password = p_password
           and active is true
         limit 1;

        if not found then
            return null;
        end if;

        update public.agents
           set last_access = now()
         where id = v_user.id;

        return jsonb_build_object(
            'id', v_user.id,
            'name', v_user.name,
            'email', v_user.email,
            'active', v_user.active,
            'status', v_user.status,
            'total_requests', coalesce(v_user.total_requests, 0),
            'role', 'agent'
        );
    end if;

    if v_profile = 'admin' then
        select id, name, email, role, active
          into v_user
          from public.users
         where lower(email) = v_email
           and password = p_password
           and active is true
           and lower(role) in (
                'admin',
                'admin_operacional',
                'operational_admin',
                'admin_empresa',
                'company_admin',
                'admin_global',
                'global_admin'
           )
         limit 1;

        if not found then
            return null;
        end if;

        return jsonb_build_object(
            'id', v_user.id,
            'name', v_user.name,
            'email', v_user.email,
            'role', v_user.role,
            'active', v_user.active
        );
    end if;

    return null;
end;
$$;

grant execute on function public.aa_login_web(text, text, text) to anon;
grant execute on function public.aa_login_web(text, text, text) to authenticated;
