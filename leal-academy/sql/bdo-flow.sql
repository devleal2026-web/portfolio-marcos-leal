create extension if not exists pgcrypto;

create table if not exists public.bdo_reference_sequences (
    station text not null,
    airline text not null,
    last_number integer not null default 0,
    updated_at timestamptz not null default now(),
    primary key (station, airline)
);

create or replace function public.gerar_bdo_reference_number(
    p_station text,
    p_airline text
)
returns text
language plpgsql
security definer
set search_path = public
as $$
declare
    v_station text;
    v_airline text;
    v_next integer;
begin
    v_station := upper(coalesce(nullif(trim(p_station), ''), 'GRU'));
    v_airline := upper(coalesce(nullif(trim(p_airline), ''), 'YY'));

    insert into public.bdo_reference_sequences (
        station,
        airline,
        last_number,
        updated_at
    )
    values (
        v_station,
        v_airline,
        1,
        now()
    )
    on conflict (station, airline)
    do update set
        last_number = public.bdo_reference_sequences.last_number + 1,
        updated_at = now()
    returning last_number into v_next;

    return 'BDO-' || v_station || v_airline || '-' || lpad(v_next::text, 5, '0');
end;
$$;

create table if not exists public.bdo_orders (
    id uuid primary key default gen_random_uuid(),
    user_id uuid default auth.uid(),

    case_type text not null check (case_type in ('AHL', 'OHD', 'DPR')),
    case_id uuid not null,
    reference_number text not null,
    bdo_reference text not null unique,

    station text,
    airline text,
    delivery_station text,
    delivery_date date,
    scheduled_datetime timestamptz,

    delivery_service text,
    delivery_service_label text,
    delivery_cost_amount numeric(12, 2) not null default 0,
    delivery_cost_currency text not null default 'BRL',
    recharge_station text,
    recharge_airline text,

    delivery_company text,
    delivery_contact text,
    delivery_address text,
    delivery_instructions text,
    email text,
    website text,
    teletype_address text,
    supplementary_info text,

    status text not null default 'CRIADO'
        check (status in ('CRIADO', 'PROCESSO ENCERRADO', 'CANCELADO')),

    close_requested boolean not null default false,
    close_confirmed boolean not null default false,
    close_date timestamptz,
    close_station text,
    reason_for_loss text,
    fault_station text,

    message text not null,
    history jsonb not null default '[]'::jsonb,

    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now()
);

create index if not exists idx_bdo_orders_case
    on public.bdo_orders(case_type, case_id);

create index if not exists idx_bdo_orders_reference
    on public.bdo_orders(reference_number);

create index if not exists idx_bdo_orders_bdo_reference
    on public.bdo_orders(bdo_reference);

create index if not exists idx_bdo_orders_status
    on public.bdo_orders(status);

comment on table public.bdo_orders is
    'Ordens de entrega de bagagem BDO criadas nos processos AHL, OHD e DPR do simulador.';

alter table public.bdo_reference_sequences enable row level security;
alter table public.bdo_orders enable row level security;

drop policy if exists "bdo_reference_sequences_select_authenticated" on public.bdo_reference_sequences;
create policy "bdo_reference_sequences_select_authenticated"
on public.bdo_reference_sequences
for select
to authenticated
using (true);

drop policy if exists "bdo_reference_sequences_insert_authenticated" on public.bdo_reference_sequences;
create policy "bdo_reference_sequences_insert_authenticated"
on public.bdo_reference_sequences
for insert
to authenticated
with check (auth.uid() is not null);

drop policy if exists "bdo_reference_sequences_update_authenticated" on public.bdo_reference_sequences;
create policy "bdo_reference_sequences_update_authenticated"
on public.bdo_reference_sequences
for update
to authenticated
using (true)
with check (auth.uid() is not null);

drop policy if exists "bdo_orders_select_authenticated" on public.bdo_orders;
create policy "bdo_orders_select_authenticated"
on public.bdo_orders
for select
to authenticated
using (true);

drop policy if exists "bdo_orders_insert_authenticated" on public.bdo_orders;
create policy "bdo_orders_insert_authenticated"
on public.bdo_orders
for insert
to authenticated
with check (auth.uid() is not null);

drop policy if exists "bdo_orders_update_authenticated" on public.bdo_orders;
create policy "bdo_orders_update_authenticated"
on public.bdo_orders
for update
to authenticated
using (true)
with check (auth.uid() is not null);

drop policy if exists "bdo_orders_delete_authenticated" on public.bdo_orders;
create policy "bdo_orders_delete_authenticated"
on public.bdo_orders
for delete
to authenticated
using (true);
