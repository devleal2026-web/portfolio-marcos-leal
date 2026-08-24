create extension if not exists pgcrypto;

create table if not exists public.operational_action_sequences (
    action_code text not null,
    station text not null,
    airline text not null,
    last_number integer not null default 0,
    updated_at timestamptz not null default now(),
    primary key (action_code, station, airline)
);

create or replace function public.gerar_operational_action_reference(
    p_action_code text,
    p_station text,
    p_airline text
)
returns text
language plpgsql
security definer
set search_path = public
as $$
declare
    v_action text;
    v_station text;
    v_airline text;
    v_next integer;
begin
    v_action := upper(coalesce(nullif(trim(p_action_code), ''), 'ACT'));
    v_station := upper(coalesce(nullif(trim(p_station), ''), 'GRU'));
    v_airline := upper(coalesce(nullif(trim(p_airline), ''), 'YY'));

    insert into public.operational_action_sequences (
        action_code,
        station,
        airline,
        last_number,
        updated_at
    )
    values (
        v_action,
        v_station,
        v_airline,
        1,
        now()
    )
    on conflict (action_code, station, airline)
    do update set
        last_number = public.operational_action_sequences.last_number + 1,
        updated_at = now()
    returning last_number into v_next;

    return v_action || '-' || v_station || v_airline || '-' || lpad(v_next::text, 5, '0');
end;
$$;

create table if not exists public.operational_actions (
    id uuid primary key default gen_random_uuid(),
    user_id uuid default auth.uid(),

    case_type text not null check (case_type in ('AHL', 'OHD', 'DPR')),
    case_id uuid not null,
    reference_number text not null,

    action_reference text not null unique,
    action_code text not null check (action_code in ('FWD', 'FLZ', 'COH')),
    action_category text not null default 'ACTION_MESSAGES',
    status text not null default 'REGISTRADO'
        check (status in ('REGISTRADO', 'ENCERRADO', 'CANCELADO')),

    station text,
    airline text,
    destination_station text,

    rush_tag text,
    original_tag text,
    flight text,
    route text,
    weight text,
    seal_number text,

    reason_for_loss text,
    fault_station text,
    fault_airline text,

    receiver_name text,
    receiver_document text,
    receiver_contact text,

    action_date date,
    notes text,
    bag_description text,
    message text not null,
    history jsonb not null default '[]'::jsonb,

    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now()
);

create index if not exists idx_operational_actions_case
    on public.operational_actions(case_type, case_id);

create index if not exists idx_operational_actions_reference
    on public.operational_actions(reference_number);

create index if not exists idx_operational_actions_action_reference
    on public.operational_actions(action_reference);

create index if not exists idx_operational_actions_code
    on public.operational_actions(action_code);

create index if not exists idx_operational_actions_status
    on public.operational_actions(status);

comment on table public.operational_actions is
    'Ações operacionais do simulador aeroportuário: FWD Forward Bag/Rush, FLZ envio ao depósito e COH fechamento de OHD entregue.';

alter table public.operational_action_sequences enable row level security;
alter table public.operational_actions enable row level security;

drop policy if exists "operational_action_sequences_select_authenticated" on public.operational_action_sequences;
create policy "operational_action_sequences_select_authenticated"
on public.operational_action_sequences
for select
to authenticated
using (true);

drop policy if exists "operational_action_sequences_insert_authenticated" on public.operational_action_sequences;
create policy "operational_action_sequences_insert_authenticated"
on public.operational_action_sequences
for insert
to authenticated
with check (auth.uid() is not null);

drop policy if exists "operational_action_sequences_update_authenticated" on public.operational_action_sequences;
create policy "operational_action_sequences_update_authenticated"
on public.operational_action_sequences
for update
to authenticated
using (true)
with check (auth.uid() is not null);

drop policy if exists "operational_actions_select_authenticated" on public.operational_actions;
create policy "operational_actions_select_authenticated"
on public.operational_actions
for select
to authenticated
using (true);

drop policy if exists "operational_actions_insert_authenticated" on public.operational_actions;
create policy "operational_actions_insert_authenticated"
on public.operational_actions
for insert
to authenticated
with check (auth.uid() is not null);

drop policy if exists "operational_actions_update_authenticated" on public.operational_actions;
create policy "operational_actions_update_authenticated"
on public.operational_actions
for update
to authenticated
using (true)
with check (auth.uid() is not null);

drop policy if exists "operational_actions_delete_authenticated" on public.operational_actions;
create policy "operational_actions_delete_authenticated"
on public.operational_actions
for delete
to authenticated
using (true);
