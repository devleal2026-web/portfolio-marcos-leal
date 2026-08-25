-- ==========================================================
-- LEAL ACADEMY SECURITY HARDENING
-- Execute depois de admin-analytics.sql e dos SQLs operacionais.
-- Mantem a aula compartilhada funcionando, mas restringe exclusoes
-- e cadastros globais de base/cia/sessao ao administrador.
-- ==========================================================

alter table public.action_files enable row level security;
alter table public.bdo_orders enable row level security;
alter table public.operational_actions enable row level security;
alter table public.simulator_bases enable row level security;
alter table public.simulator_airlines enable row level security;
alter table public.simulator_base_airlines enable row level security;
alter table public.training_sessions enable row level security;

drop policy if exists "action_files_delete_authenticated" on public.action_files;
create policy "action_files_delete_authenticated"
on public.action_files
for delete
to authenticated
using (public.is_academy_admin());

drop policy if exists "bdo_orders_delete_authenticated" on public.bdo_orders;
create policy "bdo_orders_delete_authenticated"
on public.bdo_orders
for delete
to authenticated
using (public.is_academy_admin());

drop policy if exists "operational_actions_delete_authenticated" on public.operational_actions;
create policy "operational_actions_delete_authenticated"
on public.operational_actions
for delete
to authenticated
using (public.is_academy_admin());

drop policy if exists "simulator_bases_write_authenticated" on public.simulator_bases;
create policy "simulator_bases_write_authenticated"
on public.simulator_bases
for all
to authenticated
using (public.is_academy_admin())
with check (public.is_academy_admin());

drop policy if exists "simulator_airlines_write_authenticated" on public.simulator_airlines;
create policy "simulator_airlines_write_authenticated"
on public.simulator_airlines
for all
to authenticated
using (public.is_academy_admin())
with check (public.is_academy_admin());

drop policy if exists "simulator_base_airlines_write_authenticated" on public.simulator_base_airlines;
create policy "simulator_base_airlines_write_authenticated"
on public.simulator_base_airlines
for all
to authenticated
using (public.is_academy_admin())
with check (public.is_academy_admin());

drop policy if exists "training_sessions_write_authenticated" on public.training_sessions;
create policy "training_sessions_write_authenticated"
on public.training_sessions
for all
to authenticated
using (public.is_academy_admin())
with check (public.is_academy_admin());
