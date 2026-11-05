# Bel Pulang

Game 3D tawuran sekolah di jalan depan gerbang SMEA 70 dan Halte Bulungan (fiksi). Jalan di browser HP, dimainkan landscape, tanpa instal.

Main di: https://belpulang.netlify.app atau https://belpulang.win

## Voice chat (v1.4, online)

- Tiga tombol di kanan atas (lobby dan saat main):
  - **🎤 ON/OFF**: nyalakan mikrofon. Selalu mati tiap masuk room, browser akan minta izin mikrofon saat pertama dinyalakan.
  - **KE: TIM / KE: SEMUA**: siapa yang bisa dengar suaramu. TIM = cuma teman satu sekolah, SEMUA = termasuk lawan.
  - **🔊 DENGAR / 🔇 BISU**: matikan semua suara orang lain.
- Nama yang sedang bicara muncul di bawah tombol (⚔ = dari tim lawan). Di daftar pemain lobby, 🎤 = mikrofonnya nyala.
- Suara langsung antar-HP (WebRTC peer-to-peer), server Supabase cuma dipakai untuk menyambungkan. Di beberapa jaringan (misalnya Wi-Fi kantor/sekolah yang ketat) suara bisa gagal tersambung. Kalau sering terjadi, perlu ditambah server TURN.

## Stamina (v1.3)

- Bar kuning di bawah bar darah, di HUD dan di atas kepala semua orang.
- Tiap pukul, tendang, lempar, dan hindar makan stamina. Makin besar damage senjatanya, makin boros: tangan kosong 8, tendangan 14, katana 21, celurit 25, hindar 12.
- Stamina pulih sendiri kalau berhenti menyerang sebentar, lebih cepat kalau diam. Kalau habis muncul tulisan CAPEK! dan tidak bisa menyerang, jadi harus mundur dulu.
- Bot yang kehabisan stamina kabur menjauhi lawan sampai staminanya pulih.
- Single player: stamina awal 100, naik +4 tiap level (Level 50 = 296) dan pulihnya makin cepat. Ada perk baru **Napas Panjang** (+20 stamina, pulih 15% lebih cepat).
- Online: semua pemain stamina 100.

## Menu (v1.2)

- Dibuka dengan layar Sporadis Games, lalu menu utama dengan latar anak-anak tawuran di depan SMEA 70.
- **Single Player**: New Game, Last Game (lanjut level terakhir), Load Game (pilih profil tersimpan lalu masukkan PIN).
- **Multiplayer**: tabel room yang sedang online (nama room, host, jumlah pemain, PIN, status). Room tanpa PIN bisa langsung JOIN, room ber-PIN minta PIN dulu. CREATE ROOM di kiri atas untuk jadi host, bisa diberi PIN opsional.
- **Settings**: atur avatar (dipakai di single player dan online).

## Mode

**Single-player (50 level)**
- SMEA 70 melawan SMA Seberang yang datang dari kanan jalan dan turun dari bus.
- Misi berganti tiap level: tawuran, rebut spanduk Bulungan Cup, awas Wito (kabur ke gerbang), jaga halte, kawal Conge, hujan senjata.
- Bos tiap 10 level, perk setelah tiap kemenangan, progres tersimpan otomatis.

**Online (SMEA 70 vs XTM)**
- Satu orang membuat room dan membagikan kode 4 huruf, yang lain gabung pakai kode itu.
- 50 orang per sekolah, kursi kosong diisi bot. Bot turun bergelombang: 15 di awal, bantuan 8–10 orang tiap 20 detik (lebih cepat untuk tim yang tertinggal). Darah semua 150. Pemain yang tumbang tidak bangkit lagi dan menonton sampai ronde selesai (bisa ganti kamera ke teman). Nama pemain tampil di atas kepala.
- SMEA 70 keluar dari gerbang. XTM turun dari Metromini yang parkir di halte sebelah kanan (markas XTM).
- Bot SMEA 70 menjaga gerbang dan memukul mundur, sebagian maju menghancurkan Metromini. Bot XTM merubuhkan gerbang dan menghabisi lawan.
- XTM menang kalau gerbang SMEA 70 rubuh dan ada yang masuk sekolah. SMEA 70 menang kalau Metromini XTM hancur, atau waktu 6 menit habis dan gerbang masih berdiri. Sekolah yang pasukannya habis duluan kalah.
- Gerbang dan Metromini masing-masing 3.000 darah.
- Razia Wito tiap 90 detik: dalam 6 detik SMEA 70 harus masuk ke dalam gerbang dan XTM ke halte Metromini. Yang masih di luar ditahan 20 detik, lalu keluar lagi dari markas.
- Molotov: dilempar, membakar area selama beberapa detik.
- Kill feed, papan skor KO, dan pilihan senjata awal di lobby.
- Pembuat room menjadi host yang menjalankan pertandingan, jadi host harus tetap membuka game sampai ronde selesai.

## Kontrol

| HP | Laptop | Fungsi |
|---|---|---|
| Joystick kiri | WASD / panah | Jalan |
| SERANG | J | Pukul, ayun senjata, atau lempar. 3x pukul beruntun = pukulan atas |
| TENDANG | K | Lawan terpental jauh |
| HINDAR | Spasi | Lolos dari serangan (makan stamina) |
| TUKAR | E | Tukar senjata dengan yang ada di tanah |

## Senjata

| Senjata | Damage | Pakai |
|---|---|---|
| Tangan kosong | 10 | Stamina 8 per pukulan |
| Batu | 14 | Lempar 3x |
| Botol kaca | 24 | Lempar 2x |
| Ikat pinggang | 17 | 12 ayunan |
| Bambu | 22 | 9 ayunan, jangkauan paling panjang |
| Papan kayu | 19 | 8 ayunan |
| Kursi plastik | 15 | 4 ayunan, lawan terpental jauh |
| Helm | 14 | 10 ayunan |
| Payung | 11 | 10 ayunan |
| Katana | 42 | 7 ayunan |
| Celurit | 55 | 5 ayunan |
| Molotov | 8 + api 14/detik | Lempar 1x, membakar area |

## Teknis

- Satu file `index.html`, tanpa build. Three.js r128 dimuat dari cdnjs.
- Mode online memakai Supabase Realtime (broadcast + presence), tanpa tabel database. supabase-js dimuat dari jsDelivr hanya saat tombol MAIN ONLINE ditekan.
- Project Supabase versi gratis otomatis di-pause setelah sekitar seminggu tidak dipakai. Kalau mode online tidak bisa tersambung, nyalakan lagi project-nya dari dashboard Supabase.

## Deploy

Hubungkan repo ini ke Netlify (Add new site → Import an existing project → GitHub → `bel-pulang`). Build command dikosongkan, publish directory `/`. Setiap push ke `main` otomatis meng-update situsnya.
