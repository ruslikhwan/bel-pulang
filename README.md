# Bel Pulang

Game 3D tawuran sekolah di jalan depan gerbang SMEA 70 dan Halte Bulungan (fiksi). Jalan di browser HP, dimainkan landscape, tanpa instal.

Main di: https://belpulang.netlify.app atau https://belpulang.win

## v2.3 — Musuh bertingkat, 99 level, misi baru, suasana
- 10 sekolah musuh dari paling lemah ke paling kuat: SMEA 6, SMEA 82, SMEA 74, SMEA 46, SMEK Poernama, XTM Kafal, XTM Laoed, XTM Budud, XTM Chapptoenn, Arek-Arek (preman). Satu sekolah per level, naik tiap 5 level.
- Single player sampai level 99. Level 51–99 "Angkatan Tua": urutan sekolah diulang, lebih kuat dan lebih ramai. Bos baru di 60/70/80/90 dan bos terakhir Raja Bulungan di level 99.
- 10 misi baru: Cegat Metromini, Pertahankan Gerbang, Rebut Panji, Bebaskan Teman, Kejar Ketua, Tangan Kosong, Razia, Duel Jagoan, Tawuran Malam, Selamatkan Warga. Misi baru muncul bertahap ("MISI BARU").
- Suasana per level: siang, sore, malam (makin sering di level tinggi) dan hujan. Lampu jalan menyala sore/malam, lampu mobil menyala saat malam.
- Perbaikan: jalan tidak lagi berkedip hijau di kamera belakang (rumput bertumpuk dengan aspal).

## v2.2 — Keamanan profil cloud
- PIN profil tidak lagi disimpan polos: server hanya menyimpan hash bcrypt, dan PIN tidak pernah dikirim balik ke HP.
- Tabel `game_profiles` dikunci (RLS tanpa akses langsung); daftar/masuk/simpan lewat fungsi server `bp_register`, `bp_login`, `bp_save` yang mengecek PIN.
- Nama yang sudah dipakai orang lain tidak bisa ditimpa; salah PIN 5x → profil dikunci 10 menit.
- Skema lengkap di `supabase_schema.sql` (sudah diterapkan ke database).

## v2.1 — Kamera belakang (over-the-shoulder)
- Mode kamera baru **BELAKANG** (gaya Bully) selain **ATAS**; default diatur di Pengaturan → KAMERA, bisa diganti juga dari menu Pause.
- Di mode belakang joystick bergerak relatif ke arah kamera; kamera ikut arah lari, geser layar kosong untuk memutar (Q/R di keyboard).
- Bar HP di atas kepala mengecil sesuai jarak supaya tidak menutupi layar.

## v2.0: Model rambut

- Studio Karakter punya pilihan **18 model rambut**: Pendek, Buzz Cut, French Crop, Spiky, Pompadour, Undercut, Quiff, Taper Belah, Taper Fade, Low Fade Klimis, Cepak / Flat Top, Mohawk, Man Bun, Comma Hair, Two Block, Mullet, Keriting, Gondrong. Ditambah **6 warna rambut**: hitam, cokelat tua, cokelat, pirang, merah, abu-abu.
- Rambut pilihanmu ikut tampil di single player dan online (dilihat pemain lain).
- Bot dapat rambut acak: SMEA 70 bermacam gaya (kadang dicat), XTM kebanyakan buzz cut, cepak, dan fade ala taruna. Warga (orang kantoran, anak, supir) juga punya rambut berbeda-beda.
- Panel Studio Karakter ikut tema gelap.

## v1.9.2

- **Sinkronisasi Profil Lintas Perangkat (Method 2 - Supabase Cloud Database)**:
  - Profil, level single player, perk, dan avatar kustom 3D kini otomatis tersimpan di cloud Supabase (`public.game_profiles`).
  - Cukup masukkan Nama dan 4 Digit PIN di laptop, iPad, atau HP untuk memuat karakter dan levelmu dari mana saja.
  - Skema database Supabase siap pakai ada di file [`supabase_schema.sql`](supabase_schema.sql).
  - Dilengkapi fitur alternatif **Kode Pindah Perangkat** (`📲 KODE` dan `IMPOR`) untuk transfer profil instan.
- **Perbaikan Izin Mikrofon di Safari (iPad & iPhone)**:
  - Parameter konstrain audio diperbarui agar kompatibel 100% dengan WebKit iOS (menghilangkan error *OverconstrainedError*).
  - Pengecekan status izin Safari kini mendeteksi label perangkat aktif (`✅ MIKROFON DIIZINKAN`).
- Catatan rilis lengkap semua versi dapat dibaca di [`CHANGELOG.md`](CHANGELOG.md).

## v1.9

- Kartu pilihan perk lebih kontras (abu-abu terang bergaris merah, menyala saat disentuh).
- Tulisan pukulan (BUK!, PLAK!, dll.) dikecilkan supaya tidak menutupi pemain.
- Gerbang sekolah baru seperti aslinya: dua pilar putih, atap kayu bertingkat gaya joglo, papan "SEKOLAH MENENGAH EKONOMI ATAS · SMEA 70 JAKARTA", pintu besi hitam berujung tombak. Papan nama sekolah hitam berbingkai oranye di atas dua tiang, pagar bilah oranye bertekstur kayu.
- Tanaman: semak huruf "SMEA 70" bertekstur daun dan permukaan rimbun, pot gentong batu dengan tanaman tropis berdaun, pohon palem di belakang pagar.
- Gerobak jajanan di seberang sekolah: Bakso Malang (lemari kaca, panci, saus, atap biru, tabung gas), Cilok (gerobak merah, payung warna-warni), Gorengan (lemari kaca, wajan di atas kompor, tabung gas, bangku kayu).

## Tampilan UI (v1.8)

- Gaya grunge/urban, tidak kartun: menu dan tombol berupa strip lakban hitam bertekstur dengan tepi kasar dan sedikit miring, aksen merah bata.
- Huruf baru: **Oswald** (judul, tombol, angka), **Barlow Condensed** (teks), **Special Elite** (label kecil ala mesin ketik).
- Saat menu terbuka, latar game dibuat pudar ala novel grafis dengan cipratan tinta, plus label barcode di pojok kanan bawah yang menunjukkan nama layar.
- HUD baru: panel gelap tipis bergaris merah, bar darah merah (berkedip saat sekarat), bar stamina emas, papan skor huruf ramping, tombol SERANG/TENDANG/HINDAR berupa lingkaran gelap bergaris tipis.
- Tulisan pukulan (BUK!, PLAK!) jadi huruf tegas bergaris hitam, banner jadi strip lakban.

## Halte, gerobak & kendaraan (v1.7)

- **Halte Bulungan** baru: tiang baja kuning, atap lengkung metal dengan rusuk kuning dan lis hijau, papan nama besar "HALTE BULUNGAN" (terbaca dari dua sisi), bangku hijau berkaki kuning, papan info bus, tiang lampu.
- **Gerobak Es Gondrong** baru: rangka kayu kuning, panel biru, rak penuh botol warna-warni, krat merah-kuning, roda besar berjari-jari biru. Pedagangnya pakai model karakter baru, rambut gondrong dan berkumis.
- **Kendaraan beragam**: Metromini, bus kota biru-putih, angkot hijau muda nomor 09, bajaj biru, sedan klasik, hatchback, MPV, SUV, mobil boks lama, jip, pikap, truk boks, mobil polisi, dan motor (bebek, vespa, matic, trail) dengan pengendara berhelm. Bodi membulat, kaca gelap mengkilap, lampu, dan velg.
- Logo merek asli tidak dipakai, diganti tulisan umum (ES GONDRONG, BUS KOTA).
- Tiap kendaraan cukup 1 potongan (Metromini dari sekitar 80 jadi 21) dan bentuknya dipakai bersama.

## Grafik (v1.6)

- Tekstur dibuat langsung oleh kode (tanpa file gambar): aspal dengan retakan, tambalan, noda oli dan jejak ban; marka jalan pudar; trotoar paving dengan daun kering; rumput; beton.
- Gedung sekolah 2 lantai dengan jendela nako, koridor, dan atap genteng. Pohon dengan batang, cabang, dan daun berlapis. Langit biru berawan dan siluet gedung kota di kejauhan.
- Cahaya sore yang hangat, bayangan lebih halus, dan gradasi warna sinematik.
- **Settings → Grafik**: Otomatis / Rendah / Sedang / Tinggi. Otomatis memilih Tinggi untuk iPhone layar retina (iPhone 14 dll.) dan HP kencang, Rendah untuk HP lemah (tanpa bayangan, tekstur kecil). Berlaku setelah game dimuat ulang.
- **Karakter baru** (mengikuti desain referensi): badan membulat, wajah dengan mata, alis, hidung, bibir, dan kumis tipis. Ekspresi berubah otomatis: biasa, marah (saat menyerang), kesakitan (kena pukul/tumbang), dan ketakutan (capek atau warga panik). Lutut menekuk saat jalan dan lari.
  - SMEA 70: kemeja putih keunguan dengan badge di saku, celana abu-abu kebiruan, sepatu kanvas hitam-putih, rambut ikal atau pendek.
  - XTM: kemeja biru ala taruna dengan dasi navy, pangkat emas di bahu, papan nama, sabuk dan gesper, celana navy, sepatu pantofel, rambut cepak.
  - Warga ikut baru: orang kantoran berjas dan berdasi, ibu berhijab dan rok panjang, anak kecil, supir.
  - Tiap orang sekarang cuma 7 potongan (dulu sekitar 20) dan bentuknya dipakai bersama, jadi 100 orang online jauh lebih ringan.
- Benda-benda statis digabung supaya beban gambar (draw call) turun sekitar sepertiga.

## Warga & poin (v1.5)

- Warga lewat di trotoar depan sekolah dan sisi halte: **orang kantoran** (jas, dasi, tas kerja), **ibu dan anak** (ibu berhijab menggandeng anak kecil), dan **supir mobil**. Kalau ada yang berantem di dekatnya, warga panik dan lari sambil teriak.
- Sesekali mobil yang lewat dekat tawuran mengerem dan berhenti, supirnya turun lalu kabur dan ngumpet. Kalau sudah aman, supirnya balik ke mobil dan jalan lagi. Kalau supirnya tumbang, mobilnya ditinggal di jalan (bikin macet) lalu diderek.
- Warga bisa kena pukulan, lemparan, api molotov, hantaman bos, dan tertabrak mobil. **Membunuh warga = −1 poin** untuk pemain yang membunuhnya (bot dan mobil tidak kena hukuman).
- Poin = KO − warga + bonus markas. Single player: poin tampil di layar menang dan kalah. Online: papan skor akhir punya kolom KO, WARGA, BONUS, POIN dan diurutkan dari poin tertinggi. Kill feed menampilkan "X mencelakai warga −1 POIN".
- Bonus markas (online): +1 poin per 150 damage ke gerbang/Metromini lawan, dan +5 untuk semua pemain tim yang berhasil menjebol markas lawan.

**Serbu markas (online):** kalau pasukan lawan sudah habis, ronde belum selesai. Tim yang menang punya 60 detik untuk menjebol markas lawan (SMEA 70 → Metromini XTM, XTM → gerbang SMEA 70) demi bonus poin. Semua bot tim pemenang ikut menyerbu markas. Kalau 60 detik habis atau waktu ronde habis, tim itu tetap menang tanpa bonus jebol markas.

## Voice chat (v1.4, online)

- Tiga tombol di kanan atas (lobby dan saat main):
  - **🎤 ON/OFF**: nyalakan mikrofon. Selalu mati tiap masuk room, browser akan minta izin mikrofon saat pertama dinyalakan.
  - **KE: TIM / KE: SEMUA**: siapa yang bisa dengar suaramu. TIM = cuma teman satu sekolah, SEMUA = termasuk lawan.
  - **🔊 DENGAR / 🔇 BISU**: matikan semua suara orang lain.
- **Settings → Mikrofon**: cek status izin, tombol IZINKAN MIKROFON, tes mic (bar suara + rekam 3 detik lalu diputar), pilih mikrofon, mic otomatis nyala saat masuk room, peredam bising, dan pilihan awal suara ke tim/semua. Ada panduan izin untuk iPhone (Safari/Chrome) dan Android (Chrome) kalau izinnya pernah ditolak.
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
- 50 orang per sekolah, kursi kosong diisi bot. Bot turun bergelombang: 15 di awal, bantuan 8–10 orang tiap 20 detik (lebih cepat untuk tim yang tertinggal). Darah semua 450. Pemain yang tumbang tidak bangkit lagi dan menonton sampai ronde selesai (bisa ganti kamera ke teman). Nama pemain tampil di atas kepala.
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
