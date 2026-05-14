create table if not exists public.tea_entries (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null default auth.uid(),
  date date not null,
  in_time text,
  out_time text,
  break_minutes integer not null default 0,
  target_hours numeric not null default 8,
  is_smwk boolean not null default false,
  note text not null default '',
  updated_at timestamptz not null default now(),
  unique (user_id, date)
);

alter table public.tea_entries
add column if not exists is_smwk boolean not null default false;

alter table public.tea_entries enable row level security;

drop policy if exists "tea entries select own" on public.tea_entries;
drop policy if exists "tea entries insert own" on public.tea_entries;
drop policy if exists "tea entries update own" on public.tea_entries;
drop policy if exists "tea entries delete own" on public.tea_entries;

create policy "tea entries select own"
on public.tea_entries for select
to authenticated
using (auth.uid() = user_id);

create policy "tea entries insert own"
on public.tea_entries for insert
to authenticated
with check (auth.uid() = user_id);

create policy "tea entries update own"
on public.tea_entries for update
to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

create policy "tea entries delete own"
on public.tea_entries for delete
to authenticated
using (auth.uid() = user_id);
