create extension if not exists pgcrypto;

create table if not exists public.simulator_bases (
    id uuid primary key default gen_random_uuid(),
    station_code text not null unique,
    display_name text not null,
    region text,
    country text default 'BR',
    can_ahl boolean not null default true,
    can_ohd boolean not null default true,
    can_dpr boolean not null default true,
    can_rfp boolean not null default true,
    can_action_file boolean not null default true,
    active boolean not null default true,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now()
);

create table if not exists public.simulator_airlines (
    id uuid primary key default gen_random_uuid(),
    airline_code text not null unique,
    display_name text not null,
    active boolean not null default true,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now()
);

create table if not exists public.simulator_base_airlines (
    id uuid primary key default gen_random_uuid(),
    base_id uuid not null references public.simulator_bases(id) on delete cascade,
    airline_id uuid not null references public.simulator_airlines(id) on delete cascade,
    active boolean not null default true,
    created_at timestamptz not null default now(),
    unique(base_id, airline_id)
);

create table if not exists public.training_sessions (
    id uuid primary key default gen_random_uuid(),
    title text not null,
    course_code text,
    base_id uuid references public.simulator_bases(id),
    airline_id uuid references public.simulator_airlines(id),
    match_mode text not null default 'AUTO',
    action_file_mode text not null default 'AUTO',
    status text not null default 'ABERTA',
    notes text,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now()
);

alter table public.action_files
    add column if not exists training_session_id uuid references public.training_sessions(id);

create index if not exists idx_simulator_bases_station_code
    on public.simulator_bases(station_code);

create index if not exists idx_simulator_airlines_airline_code
    on public.simulator_airlines(airline_code);

create index if not exists idx_simulator_base_airlines_base
    on public.simulator_base_airlines(base_id);

create index if not exists idx_simulator_base_airlines_airline
    on public.simulator_base_airlines(airline_id);

create index if not exists idx_action_files_training_session
    on public.action_files(training_session_id);

insert into public.simulator_bases (station_code, display_name, region, country)
values
    ('GRU', 'GRU Training LL', 'Sudeste', 'BR'),
    ('GIG', 'GIG Training LL', 'Sudeste', 'BR'),
    ('BSB', 'BSB Training LL', 'Centro-Oeste', 'BR'),
    ('CNF', 'CNF Training LL', 'Sudeste', 'BR'),
    ('VCP', 'VCP Training LL', 'Sudeste', 'BR'),
    ('SSA', 'SSA Training LL', 'Nordeste', 'BR'),
    ('REC', 'REC Training LL', 'Nordeste', 'BR'),
    ('FOR', 'FOR Training LL', 'Nordeste', 'BR'),
    ('POA', 'POA Training LL', 'Sul', 'BR'),
    ('CWB', 'CWB Training LL', 'Sul', 'BR'),
    ('FLN', 'FLN Training LL', 'Sul', 'BR'),
    ('BEL', 'BEL Training LL', 'Norte', 'BR'),
    ('MAO', 'MAO Training LL', 'Norte', 'BR'),
    ('NAT', 'NAT Training LL', 'Nordeste', 'BR'),
    ('MCZ', 'MCZ Training LL', 'Nordeste', 'BR'),
    ('AJU', 'AJU Training LL', 'Nordeste', 'BR'),
    ('VIX', 'VIX Training LL', 'Sudeste', 'BR'),
    ('SDU', 'SDU Training LL', 'Sudeste', 'BR'),
    ('IGU', 'IGU Training LL', 'Sul', 'BR'),
    ('CGB', 'CGB Training LL', 'Centro-Oeste', 'BR')
on conflict (station_code) do update
set display_name = excluded.display_name,
    region = excluded.region,
    country = excluded.country,
    active = true,
    updated_at = now();

insert into public.simulator_airlines (airline_code, display_name)
values
    ('LA', 'Airline LA Training'),
    ('G3', 'Airline G3 Training'),
    ('AD', 'Airline AD Training'),
    ('AA', 'Airline AA Training'),
    ('UA', 'Airline UA Training'),
    ('DL', 'Airline DL Training'),
    ('TP', 'Airline TP Training'),
    ('AF', 'Airline AF Training'),
    ('KL', 'Airline KL Training'),
    ('IB', 'Airline IB Training'),
    ('BA', 'Airline BA Training'),
    ('LH', 'Airline LH Training'),
    ('EK', 'Airline EK Training'),
    ('QR', 'Airline QR Training'),
    ('CM', 'Airline CM Training'),
    ('AV', 'Airline AV Training'),
    ('AC', 'Airline AC Training'),
    ('AR', 'Airline AR Training'),
    ('AM', 'Airline AM Training'),
    ('UX', 'Airline UX Training')
on conflict (airline_code) do update
set display_name = excluded.display_name,
    active = true,
    updated_at = now();

insert into public.simulator_base_airlines (base_id, airline_id)
select b.id, a.id
from public.simulator_bases b
cross join public.simulator_airlines a
where b.station_code in ('GRU', 'GIG', 'BSB', 'REC', 'SSA', 'POA', 'CNF', 'VCP')
  and a.airline_code in ('LA', 'G3', 'AD', 'AA', 'UA', 'DL', 'TP', 'AF', 'KL', 'IB', 'CM', 'AV', 'UX')
on conflict (base_id, airline_id) do update
set active = true;

alter table public.simulator_bases enable row level security;
alter table public.simulator_airlines enable row level security;
alter table public.simulator_base_airlines enable row level security;
alter table public.training_sessions enable row level security;

drop policy if exists "simulator_bases_select_authenticated" on public.simulator_bases;
create policy "simulator_bases_select_authenticated"
on public.simulator_bases for select to authenticated using (true);

drop policy if exists "simulator_bases_write_authenticated" on public.simulator_bases;
create policy "simulator_bases_write_authenticated"
on public.simulator_bases for all to authenticated
using (auth.uid() is not null)
with check (auth.uid() is not null);

drop policy if exists "simulator_airlines_select_authenticated" on public.simulator_airlines;
create policy "simulator_airlines_select_authenticated"
on public.simulator_airlines for select to authenticated using (true);

drop policy if exists "simulator_airlines_write_authenticated" on public.simulator_airlines;
create policy "simulator_airlines_write_authenticated"
on public.simulator_airlines for all to authenticated
using (auth.uid() is not null)
with check (auth.uid() is not null);

drop policy if exists "simulator_base_airlines_select_authenticated" on public.simulator_base_airlines;
create policy "simulator_base_airlines_select_authenticated"
on public.simulator_base_airlines for select to authenticated using (true);

drop policy if exists "simulator_base_airlines_write_authenticated" on public.simulator_base_airlines;
create policy "simulator_base_airlines_write_authenticated"
on public.simulator_base_airlines for all to authenticated
using (auth.uid() is not null)
with check (auth.uid() is not null);

drop policy if exists "training_sessions_select_authenticated" on public.training_sessions;
create policy "training_sessions_select_authenticated"
on public.training_sessions for select to authenticated using (true);

drop policy if exists "training_sessions_write_authenticated" on public.training_sessions;
create policy "training_sessions_write_authenticated"
on public.training_sessions for all to authenticated
using (auth.uid() is not null)
with check (auth.uid() is not null);
