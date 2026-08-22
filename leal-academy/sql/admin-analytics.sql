-- ==========================================================
-- LEAL ACADEMY ADMIN / ANALYTICS
-- Execute no SQL Editor do Supabase.
-- Depois ajuste o e-mail abaixo para o administrador principal.
-- ==========================================================

create extension if not exists pgcrypto;

create table if not exists public.academy_admins (
    email text primary key,
    created_at timestamptz not null default now()
);

insert into public.academy_admins (email)
values ('devleal2026@gmail.com')
on conflict (email) do nothing;

create table if not exists public.access_profiles (
    id uuid primary key references auth.users(id) on delete cascade,
    full_name text,
    email text unique,
    access_count integer not null default 0,
    created_at timestamptz not null default now(),
    last_access_at timestamptz
);

alter table public.access_profiles
    add column if not exists access_count integer not null default 0;

alter table public.access_profiles
    add column if not exists created_at timestamptz not null default now();

alter table public.access_profiles
    add column if not exists last_access_at timestamptz;

create table if not exists public.academy_access_events (
    id uuid primary key default gen_random_uuid(),
    user_id uuid not null references auth.users(id) on delete cascade,
    email text not null,
    full_name text,
    event_type text not null default 'page_view',
    page_title text,
    page_path text,
    course_id text,
    course_title text,
    metadata jsonb not null default '{}'::jsonb,
    created_at timestamptz not null default now()
);

create table if not exists public.academy_course_progress (
    user_id uuid not null references auth.users(id) on delete cascade,
    email text not null,
    full_name text,
    course_id text not null,
    course_title text not null,
    total_lessons integer not null default 0,
    completed_lessons jsonb not null default '[]'::jsonb,
    completed_count integer not null default 0,
    progress_percent integer not null default 0,
    started_at timestamptz not null default now(),
    last_activity_at timestamptz not null default now(),
    completed_at timestamptz,
    primary key (user_id, course_id)
);

create table if not exists public.academy_quiz_attempts (
    id uuid primary key default gen_random_uuid(),
    user_id uuid not null references auth.users(id) on delete cascade,
    email text not null,
    full_name text,
    course_id text not null,
    course_title text not null,
    score_percent integer not null default 0,
    grade numeric(4,1) not null default 0,
    correct_count integer not null default 0,
    total_questions integer not null default 0,
    approved boolean not null default false,
    review jsonb not null default '[]'::jsonb,
    created_at timestamptz not null default now()
);

create table if not exists public.academy_certificates (
    certificate_code text primary key,
    user_id uuid not null references auth.users(id) on delete cascade,
    email text not null,
    full_name text,
    student_name text,
    student_email text,
    course_id text not null,
    course_title text not null,
    grade numeric(4,1) not null default 0,
    score_percent integer not null default 0,
    correct_count integer not null default 0,
    total_questions integer not null default 0,
    issued_at timestamptz not null default now(),
    created_at timestamptz not null default now()
);

create index if not exists idx_academy_access_events_user_created
    on public.academy_access_events (user_id, created_at desc);

create index if not exists idx_academy_access_events_course
    on public.academy_access_events (course_id);

create index if not exists idx_academy_course_progress_course
    on public.academy_course_progress (course_id);

create index if not exists idx_academy_quiz_attempts_user_created
    on public.academy_quiz_attempts (user_id, created_at desc);

create index if not exists idx_academy_certificates_user
    on public.academy_certificates (user_id);

alter table public.academy_admins enable row level security;
alter table public.access_profiles enable row level security;
alter table public.academy_access_events enable row level security;
alter table public.academy_course_progress enable row level security;
alter table public.academy_quiz_attempts enable row level security;
alter table public.academy_certificates enable row level security;

drop policy if exists "Admins can read own admin row" on public.academy_admins;
create policy "Admins can read own admin row"
on public.academy_admins
for select
to authenticated
using (lower(email) = lower(auth.jwt() ->> 'email'));

drop policy if exists "Users can read own profile" on public.access_profiles;
create policy "Users can read own profile"
on public.access_profiles
for select
to authenticated
using (
    id = auth.uid()
    or exists (
        select 1
        from public.academy_admins admins
        where lower(admins.email) = lower(auth.jwt() ->> 'email')
    )
);

drop policy if exists "Users can insert own profile" on public.access_profiles;
create policy "Users can insert own profile"
on public.access_profiles
for insert
to authenticated
with check (id = auth.uid());

drop policy if exists "Users can update own profile" on public.access_profiles;
create policy "Users can update own profile"
on public.access_profiles
for update
to authenticated
using (id = auth.uid())
with check (id = auth.uid());

drop policy if exists "Users can insert own access events" on public.academy_access_events;
create policy "Users can insert own access events"
on public.academy_access_events
for insert
to authenticated
with check (user_id = auth.uid());

drop policy if exists "Users and admins can read access events" on public.academy_access_events;
create policy "Users and admins can read access events"
on public.academy_access_events
for select
to authenticated
using (
    user_id = auth.uid()
    or exists (
        select 1
        from public.academy_admins admins
        where lower(admins.email) = lower(auth.jwt() ->> 'email')
    )
);

drop policy if exists "Users can upsert own course progress" on public.academy_course_progress;
create policy "Users can upsert own course progress"
on public.academy_course_progress
for insert
to authenticated
with check (user_id = auth.uid());

drop policy if exists "Users can update own course progress" on public.academy_course_progress;
create policy "Users can update own course progress"
on public.academy_course_progress
for update
to authenticated
using (user_id = auth.uid())
with check (user_id = auth.uid());

drop policy if exists "Users and admins can read course progress" on public.academy_course_progress;
create policy "Users and admins can read course progress"
on public.academy_course_progress
for select
to authenticated
using (
    user_id = auth.uid()
    or exists (
        select 1
        from public.academy_admins admins
        where lower(admins.email) = lower(auth.jwt() ->> 'email')
    )
);

drop policy if exists "Users can insert own quiz attempts" on public.academy_quiz_attempts;
create policy "Users can insert own quiz attempts"
on public.academy_quiz_attempts
for insert
to authenticated
with check (user_id = auth.uid());

drop policy if exists "Users and admins can read quiz attempts" on public.academy_quiz_attempts;
create policy "Users and admins can read quiz attempts"
on public.academy_quiz_attempts
for select
to authenticated
using (
    user_id = auth.uid()
    or exists (
        select 1
        from public.academy_admins admins
        where lower(admins.email) = lower(auth.jwt() ->> 'email')
    )
);

drop policy if exists "Users can insert own certificates" on public.academy_certificates;
create policy "Users can insert own certificates"
on public.academy_certificates
for insert
to authenticated
with check (user_id = auth.uid());

drop policy if exists "Users can update own certificates" on public.academy_certificates;
create policy "Users can update own certificates"
on public.academy_certificates
for update
to authenticated
using (user_id = auth.uid())
with check (user_id = auth.uid());

drop policy if exists "Users and admins can read certificates" on public.academy_certificates;
create policy "Users and admins can read certificates"
on public.academy_certificates
for select
to authenticated
using (
    user_id = auth.uid()
    or exists (
        select 1
        from public.academy_admins admins
        where lower(admins.email) = lower(auth.jwt() ->> 'email')
    )
);
