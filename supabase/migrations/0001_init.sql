-- Exam Revision Budget — schema
-- Safe to run more than once.

create extension if not exists "pgcrypto";

create table if not exists public.exam_revision_budget_sessions (
  id uuid primary key default gen_random_uuid(),
  subject text,
  minutes integer,
  topic text,
  confidence integer,
  studied_on date,
  created_at timestamptz not null default now()
);

create index if not exists exam_revision_budget_sessions_created_idx on public.exam_revision_budget_sessions (created_at desc);

alter table public.exam_revision_budget_sessions enable row level security;

drop policy if exists "exam_revision_budget_sessions_read" on public.exam_revision_budget_sessions;
create policy "exam_revision_budget_sessions_read" on public.exam_revision_budget_sessions for select using (true);

drop policy if exists "exam_revision_budget_sessions_insert" on public.exam_revision_budget_sessions;
create policy "exam_revision_budget_sessions_insert" on public.exam_revision_budget_sessions for insert with check (true);
