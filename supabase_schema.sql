-- ====================================================================
-- BEL PULANG - Supabase Schema: profil lintas perangkat (aman)
-- Jalankan di Supabase Dashboard -> SQL Editor (sudah diterapkan v2.2)
--
-- Prinsip:
--  * PIN TIDAK pernah disimpan polos: hanya hash bcrypt (pgcrypto).
--  * Tabel dikunci RLS tanpa policy -> klien (anon) tidak bisa
--    SELECT/INSERT/UPDATE langsung. Semua akses lewat fungsi RPC
--    bp_register / bp_login / bp_save yang memeriksa PIN di server.
--  * Salah PIN 5x -> profil dikunci 10 menit (anti tebak PIN).
-- ====================================================================

create extension if not exists pgcrypto with schema extensions;

create table if not exists public.game_profiles (
  id           text primary key check (char_length(id) between 2 and 24),
  name         text not null check (char_length(name) between 2 and 24),
  pin_hash     text not null,
  level        integer not null default 1 check (level between 1 and 50),
  perks        jsonb not null default '{}'::jsonb,
  appearance   jsonb not null default '{}'::jsonb,
  fails        integer not null default 0,
  locked_until timestamptz,
  created_at   timestamptz not null default now(),
  updated_at   timestamptz not null default now()
);

alter table public.game_profiles enable row level security;
-- sengaja TIDAK ada policy: akses langsung dari klien ditolak
revoke all on public.game_profiles from anon, authenticated;

-- cek PIN + hitung salah/kunci. Mengembalikan 'ok' | 'none' | 'wrong' | 'locked'
create or replace function public.bp_check_pin(p_id text, p_pin text)
returns text language plpgsql security definer set search_path = public, extensions as $$
declare r public.game_profiles%rowtype;
begin
  select * into r from public.game_profiles where id = lower(p_id) for update;
  if not found then return 'none'; end if;
  if r.locked_until is not null and r.locked_until > now() then return 'locked'; end if;
  if r.pin_hash = crypt(p_pin, r.pin_hash) then
    update public.game_profiles set fails = 0, locked_until = null where id = r.id;
    return 'ok';
  end if;
  update public.game_profiles
     set fails = r.fails + 1,
         locked_until = case when r.fails + 1 >= 5 then now() + interval '10 minutes' else null end
   where id = r.id;
  return 'wrong';
end $$;
revoke all on function public.bp_check_pin(text, text) from public, anon, authenticated;

create or replace function public.bp_register(p_id text, p_name text, p_pin text,
  p_level int default 1, p_perks jsonb default '{}'::jsonb, p_appearance jsonb default '{}'::jsonb)
returns jsonb language plpgsql security definer set search_path = public, extensions as $$
begin
  if p_pin !~ '^[0-9]{4}$' then return jsonb_build_object('status','bad'); end if;
  if char_length(coalesce(p_name,'')) not between 2 and 24 then return jsonb_build_object('status','bad'); end if;
  insert into public.game_profiles(id, name, pin_hash, level, perks, appearance)
  values (lower(p_id), p_name, crypt(p_pin, gen_salt('bf', 8)),
          greatest(1, least(50, coalesce(p_level,1))),
          coalesce(p_perks,'{}'::jsonb), coalesce(p_appearance,'{}'::jsonb))
  on conflict (id) do nothing;
  if not found then return jsonb_build_object('status','taken'); end if;
  return jsonb_build_object('status','ok');
end $$;

create or replace function public.bp_login(p_id text, p_pin text)
returns jsonb language plpgsql security definer set search_path = public, extensions as $$
declare s text; r public.game_profiles%rowtype;
begin
  s := public.bp_check_pin(p_id, p_pin);
  if s <> 'ok' then return jsonb_build_object('status', s); end if;
  select * into r from public.game_profiles where id = lower(p_id);
  return jsonb_build_object('status','ok','id',r.id,'name',r.name,'level',r.level,
    'perks',r.perks,'appearance',r.appearance,'created_at',r.created_at);
end $$;

create or replace function public.bp_save(p_id text, p_pin text, p_level int, p_perks jsonb, p_appearance jsonb)
returns jsonb language plpgsql security definer set search_path = public, extensions as $$
declare s text;
begin
  s := public.bp_check_pin(p_id, p_pin);
  if s <> 'ok' then return jsonb_build_object('status', s); end if;
  update public.game_profiles
     set level = greatest(1, least(50, coalesce(p_level, level))),
         perks = coalesce(p_perks, perks),
         appearance = coalesce(p_appearance, appearance),
         updated_at = now()
   where id = lower(p_id);
  return jsonb_build_object('status','ok');
end $$;

grant execute on function public.bp_register(text,text,text,int,jsonb,jsonb) to anon, authenticated;
grant execute on function public.bp_login(text,text) to anon, authenticated;
grant execute on function public.bp_save(text,text,int,jsonb,jsonb) to anon, authenticated;
