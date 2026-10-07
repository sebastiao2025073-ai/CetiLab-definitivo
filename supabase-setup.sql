-- CETI Lab: execute este arquivo no Supabase > SQL Editor.
create table if not exists public.agendamentos (
  id uuid not null default gen_random_uuid() primary key,
  week_key text not null,
  day_id text not null,
  slot_id text not null,
  turma text not null,
  professor text not null,
  disciplina text,
  created_at timestamptz not null default now(),
  unique (week_key, day_id, slot_id)
);
alter table public.agendamentos enable row level security;
create index if not exists agendamentos_week_key_idx on public.agendamentos (week_key);

drop policy if exists "ceti_select_agendamentos" on public.agendamentos;
drop policy if exists "ceti_insert_agendamentos" on public.agendamentos;
drop policy if exists "ceti_delete_agendamentos" on public.agendamentos;
create policy "ceti_select_agendamentos" on public.agendamentos for select to anon using (true);
create policy "ceti_insert_agendamentos" on public.agendamentos for insert to anon with check (true);
create policy "ceti_delete_agendamentos" on public.agendamentos for delete to anon using (true);
