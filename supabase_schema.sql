-- ====================================================================
-- BEL PULANG - Supabase Database Schema (Cross-Device Profiles Sync)
-- Jalankan query ini di Supabase Dashboard -> SQL Editor
-- ====================================================================

-- 1. Buat tabel game_profiles untuk menyimpan akun, PIN, level, dan avatar
CREATE TABLE IF NOT EXISTS public.game_profiles (
  id text PRIMARY KEY,                   -- nama karakter lowercase (mis. "budi")
  name text NOT NULL,                    -- nama tampilan (mis. "Budi")
  pin text NOT NULL,                     -- 4 digit PIN angka keamanan (mis. "1234")
  level integer DEFAULT 1 NOT NULL,      -- level progres single player (1 - 50)
  perks jsonb DEFAULT '{}'::jsonb,       -- status perk yang dimiliki
  appearance jsonb DEFAULT '{}'::jsonb,  -- kustomisasi avatar 3D (kulit, baju, hoodie, topi, kacamata)
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- 2. Aktifkan Row Level Security (RLS)
ALTER TABLE public.game_profiles ENABLE ROW LEVEL SECURITY;

-- 3. Beri akses baca, tulis, update untuk client publik (anon)
CREATE POLICY "Allow public game profiles access" 
  ON public.game_profiles 
  FOR ALL 
  USING (true) 
  WITH CHECK (true);

-- 4. Indeks untuk pencarian cepat berdasarkan ID dan PIN
CREATE INDEX IF NOT EXISTS idx_game_profiles_lookup ON public.game_profiles (id, pin);
