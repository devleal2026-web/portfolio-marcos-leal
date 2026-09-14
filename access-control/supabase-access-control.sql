-- Painel Central de Controle de Acessos
-- Execute no Supabase do projeto Leal Academy.
-- Escopo isolado: cria/atualiza apenas tabelas public.control_* e a funcao public.control_log_event(jsonb).

create extension if not exists pgcrypto;

grant usage on schema public to anon, authenticated;

create table if not exists public.control_projects (
    id uuid primary key default gen_random_uuid(),
    slug text unique not null,
    name text not null,
    type text not null,
    url text,
    status text not null default 'Ativo',
    notes text,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now()
);

create table if not exists public.control_profiles (
    id uuid primary key default gen_random_uuid(),
    auth_user_id uuid unique,
    name text not null,
    email text unique not null,
    role text not null default 'Visitante',
    status text not null default 'Ativo',
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now()
);

create table if not exists public.control_project_access (
    id uuid primary key default gen_random_uuid(),
    profile_id uuid not null references public.control_profiles(id) on delete cascade,
    project_id uuid not null references public.control_projects(id) on delete cascade,
    access_level text not null default 'Visualizar',
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    unique(profile_id, project_id)
);

create table if not exists public.control_access_logs (
    id uuid primary key default gen_random_uuid(),
    profile_id uuid references public.control_profiles(id) on delete set null,
    project_id uuid references public.control_projects(id) on delete set null,
    project_slug text,
    user_email text,
    event text not null,
    result text not null,
    path text,
    user_agent text,
    ip_hint text,
    metadata jsonb not null default '{}'::jsonb,
    created_at timestamptz not null default now()
);

alter table public.control_access_logs add column if not exists project_slug text;
alter table public.control_access_logs add column if not exists user_email text;
alter table public.control_access_logs add column if not exists path text;
alter table public.control_access_logs add column if not exists metadata jsonb not null default '{}'::jsonb;

insert into public.control_projects (slug, name, type, url, status) values
('leal-academy', 'Leal Academy', 'Plataforma', 'https://www.lealacademy.com.br/', 'Ativo'),
('aero-access', 'Aero Access', 'Aplicativo', 'https://aeroaccess.lealacademy.com.br/', 'Ativo'),
('simulador-aviacao', 'Simulador Operacional Aviação', 'Simulador', 'https://www.lealacademy.com.br/', 'Em revisão'),
('neuroloop', 'NeuroLoop', 'Jogo', 'https://www.lealacademy.com.br/jogos/neuroloop/', 'Ativo'),
('mibis', 'MIBIS', 'Jogo', 'https://www.lealacademy.com.br/jogos/mibis/', 'Ativo'),
('access-control', 'Painel de Controle', 'Painel', 'https://www.lealacademy.com.br/controle', 'Ativo')
on conflict (slug) do update set
    name = excluded.name,
    type = excluded.type,
    url = excluded.url,
    status = excluded.status,
    updated_at = now();

insert into public.control_profiles (name, email, role, status) values
('Administrador geral', 'devleal2026@gmail.com', 'Admin global', 'Ativo')
on conflict (email) do update set
    name = excluded.name,
    role = excluded.role,
    status = excluded.status,
    updated_at = now();

alter table public.control_projects enable row level security;
alter table public.control_profiles enable row level security;
alter table public.control_project_access enable row level security;
alter table public.control_access_logs enable row level security;

drop policy if exists control_projects_select_auth on public.control_projects;
drop policy if exists control_profiles_select_auth on public.control_profiles;
drop policy if exists control_project_access_select_auth on public.control_project_access;
drop policy if exists control_access_logs_select_auth on public.control_access_logs;

create policy control_projects_select_auth on public.control_projects
    for select to authenticated using ((auth.jwt() ->> 'email') = 'devleal2026@gmail.com');

create policy control_profiles_select_auth on public.control_profiles
    for select to authenticated using ((auth.jwt() ->> 'email') = 'devleal2026@gmail.com');

create policy control_project_access_select_auth on public.control_project_access
    for select to authenticated using ((auth.jwt() ->> 'email') = 'devleal2026@gmail.com');

create policy control_access_logs_select_auth on public.control_access_logs
    for select to authenticated using ((auth.jwt() ->> 'email') = 'devleal2026@gmail.com');

create or replace function public.control_log_event(payload jsonb)
returns uuid
language plpgsql
security definer
set search_path = public
as $$
declare
    v_project_id uuid;
    v_profile_id uuid;
    v_log_id uuid;
    v_project_slug text;
    v_user_email text;
    v_auth_id uuid;
begin
    v_project_slug := nullif(left(coalesce(payload->>'project_slug', 'site-principal'), 120), '');
    v_user_email := nullif(left(coalesce(payload->>'user_email', ''), 180), '');

    begin
        v_auth_id := nullif(payload->>'profile_auth_id', '')::uuid;
    exception when others then
        v_auth_id := null;
    end;

    select id into v_project_id
    from public.control_projects
    where slug = v_project_slug
    limit 1;

    if v_auth_id is not null then
        select id into v_profile_id
        from public.control_profiles
        where auth_user_id = v_auth_id
        limit 1;
    end if;

    if v_profile_id is null and v_user_email is not null then
        select id into v_profile_id
        from public.control_profiles
        where lower(email) = lower(v_user_email)
        limit 1;
    end if;

    insert into public.control_access_logs (
        profile_id,
        project_id,
        project_slug,
        user_email,
        event,
        result,
        path,
        user_agent,
        ip_hint,
        metadata
    ) values (
        v_profile_id,
        v_project_id,
        v_project_slug,
        v_user_email,
        left(coalesce(nullif(payload->>'event', ''), 'event'), 120),
        left(coalesce(nullif(payload->>'result', ''), 'Permitido'), 40),
        left(coalesce(payload->>'path', ''), 500),
        left(coalesce(payload->>'user_agent', ''), 500),
        left(coalesce(payload->>'ip_hint', ''), 120),
        coalesce(payload->'metadata', '{}'::jsonb)
    ) returning id into v_log_id;

    return v_log_id;
end;
$$;

grant execute on function public.control_log_event(jsonb) to anon, authenticated;
grant select on public.control_projects to authenticated;
grant select on public.control_profiles to authenticated;
grant select on public.control_project_access to authenticated;
grant select on public.control_access_logs to authenticated;

-- Observacao: eventos anonimos podem ser gravados somente pela funcao control_log_event.
-- Leitura dos logs fica restrita a usuarios autenticados no Supabase.

