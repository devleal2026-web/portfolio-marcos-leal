-- Painel Central de Controle de Acessos
-- Script opcional para fase futura de integração real com Supabase.
-- Cria tabelas próprias e não altera tabelas da Leal Academy, Aero Access, jogos ou simuladores.

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
    auth_user_id uuid,
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
    event text not null,
    result text not null,
    user_agent text,
    ip_hint text,
    created_at timestamptz not null default now()
);

alter table public.control_projects enable row level security;
alter table public.control_profiles enable row level security;
alter table public.control_project_access enable row level security;
alter table public.control_access_logs enable row level security;

-- Políticas devem ser ajustadas quando o login administrativo real for conectado.
-- Por segurança, este script não libera acesso anônimo automaticamente.
