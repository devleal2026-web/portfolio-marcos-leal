create extension if not exists pgcrypto;

create table if not exists public.action_files (
    id uuid primary key default gen_random_uuid(),
    user_id uuid default auth.uid(),

    case_type text not null check (case_type in ('AHL', 'OHD', 'DPR', 'RFP')),
    case_id uuid,
    reference_number text not null,
    station text,
    airline text,

    action_code text not null,
    action_title text not null,
    action_description text,

    status text not null default 'PENDENTE'
        check (status in ('PENDENTE', 'EM TRATATIVA', 'RESPONDIDO', 'ENCERRADO')),
    priority text not null default 'NORMAL'
        check (priority in ('NORMAL', 'ALTA', 'URGENTE')),

    assigned_to text,
    forward_to text,
    message text not null,
    response text,
    history jsonb not null default '[]'::jsonb,

    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    resolved_at timestamptz
);

create index if not exists idx_action_files_reference
    on public.action_files(reference_number);

create index if not exists idx_action_files_status
    on public.action_files(status);

create index if not exists idx_action_files_case
    on public.action_files(case_type, case_id);

create index if not exists idx_action_files_code
    on public.action_files(action_code);

comment on table public.action_files is
    'Fila operacional Action File do simulador WorldTracer, incluindo DXF, EXF, AP, FW, FWD, BDO, AA, ROH e FOH.';

alter table public.action_files enable row level security;

drop policy if exists "action_files_select_authenticated" on public.action_files;
create policy "action_files_select_authenticated"
on public.action_files
for select
to authenticated
using (true);

drop policy if exists "action_files_insert_authenticated" on public.action_files;
create policy "action_files_insert_authenticated"
on public.action_files
for insert
to authenticated
with check (auth.uid() is not null);

drop policy if exists "action_files_update_authenticated" on public.action_files;
create policy "action_files_update_authenticated"
on public.action_files
for update
to authenticated
using (true)
with check (auth.uid() is not null);

drop policy if exists "action_files_delete_authenticated" on public.action_files;
create policy "action_files_delete_authenticated"
on public.action_files
for delete
to authenticated
using (true);
