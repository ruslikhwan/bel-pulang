# Catatan Rilis & Changelog - Bel Pulang

Semua pembaruan penting, fitur baru, dan perbaikan bug didokumentasikan di sini.

---

## [v2.0] - 2026-11-06

### Model & Warna Rambut Baru
- Studio Karakter diperkaya dengan **18 model rambut pria realistis**: Pendek, Buzz Cut, French Crop, Spiky, Pompadour, Undercut, Quiff, Taper Belah, Taper Fade, Low Fade Klimis, Cepak / Flat Top, Mohawk, Man Bun, Comma Hair, Two Block, Mullet, Keriting, dan Gondrong.
- Ditambahkan **6 pilihan warna rambut**: Hitam, Cokelat Tua, Cokelat, Pirang, Merah, dan Abu-abu.
- Model dan warna rambut pilihan pemain ikut tampil di mode single player dan online (bisa dilihat oleh pemain lain).
- Bot di arena mendapatkan model rambut acak (SMEA 70 aneka gaya, XTM mayoritas cepak/taruna, warga sipil beragam gaya).
- Penyesuaian tema gelap (*dark mode*) pada panel Studio Karakter.

---

## [v1.9.2] - 2026-11-06

### Fitur Baru & Sinkronisasi Cloud (Method 2)
- **Sinkronisasi Profil Lintas Perangkat (Cloud Sync Supabase)**:
  - Profil pemain, PIN 4 digit, progres level, perk, dan kustomisasi karakter 3D sekarang tersinkronisasi otomatis ke database cloud Supabase (`public.game_profiles`).
  - Masuk menggunakan Nama dan 4 Digit PIN di perangkat apa pun (Laptop, iPad, iPhone, Android) akan otomatis menarik profil tersimpan dari cloud.
  - Setiap kenaikan level, perubahan avatar, atau perk baru otomatis tersinkronisasi 24/7 ke cloud.
  - Skema database resmi disertakan di file [`supabase_schema.sql`](supabase_schema.sql).
- **Kode Pindah Perangkat (Device Transfer Code)**:
  - Tombol **`📲 KODE`** di kartu profil menu utama untuk menyalin kode profil terenkripsi (`BP:...`).
  - Fitur **"IMPOR KODE"** di modal login untuk memindahkan profil antar-perangkat secara instan tanpa perlu database.

### Perbaikan Bug
- **Akses Mikrofon Safari (iPad & iPhone)**:
  - **Kompatibilitas Safari AudioSession (play-and-record)**: Memperbaiki error WebKit AudioSession category is not compatible with audio capture dengan mengonfigurasi 
avigator.audioSession.type = 'play-and-record' saat mengakses mikrofon dan 'auto' saat selesai, menggantikan mode hardcoded 'playback' yang mengunci sistem audio iOS hanya untuk output.
  - Memperbaiki urutan deklarasi `isIOS` di skrip utama yang sebelumnya berada di bawah fungsi `micCons()` (Temporal Dead Zone), yang sempat memicu `ReferenceError` pada Safari.
  - Memperbarui `vcMicOn()` agar menggunakan `micGet()` yang memiliki fallback audio murni saat WebKit menolak constraint lanjutan.
  - Menambahkan auto-upgrade HTTP ke HTTPS karena Safari memblokir total akses mikrofon pada koneksi HTTP biasa.
  - Memperjelas pesan diagnostik mikrofon jika Safari memblokir izin di Pengaturan iPad (*Pengaturan Situs Web -> Mikrofon -> Izinkan*).
  - Menghapus parameter konstrain audio yang tidak didukung WebKit (`video: false`, `noiseSuppression`, `autoGainControl`) yang sebelumnya menyebabkan Safari menolak izin dengan *OverconstrainedError*.
  - Menambahkan fallback otomatis ke konstrain audio standar (`{ audio: true }`).
  - Memperbaiki deteksi izin mikrofon di iOS menggunakan `navigator.mediaDevices.enumerateDevices()` sehingga status izin langsung berubah hijau (`✅ MIKROFON DIIZINKAN`) setelah menekan "Izinkan" di Safari.
- **Validasi PIN Cloud**:
  - Pengecekan PIN cloud sekarang membedakan secara spesifik antara akun yang belum terdaftar dan kesalahan pengetikan 4 digit PIN.

---

## [v1.9.1] - 2026-11-06

### Avatar & Tampilan 3D
- Topi sekolah abu-abu dirapikan agar menutup rambut dengan proporsional.
- Topi kupluk (beanie) disesuaikan agar tidak menutupi area mata karakter.
- Kacamata diperbarui dengan model bingkai 3D yang lebih presisi.
- Penyesuaian `id`, `scope`, dan `start_url` absolut pada `manifest.webmanifest` untuk PWA Android.

---

## [v1.9] - 2026-11-05

### Lingkungan & Visual Sekolah
- **Gerbang Sekolah Asli**: Dua pilar putih, atap kayu bertingkat gaya joglo, plang nama "SEKOLAH MENENGAH EKONOMI ATAS · SMEA 70 JAKARTA", pintu besi hitam berujung tombak.
- **Tanaman & Taman**: Semak huruf topiary "SMEA 70" dengan tekstur daun rimbun, pot gentong batu tanaman tropis, dan pohon palem di balik pagar sekolah.
- **Gerobak Jajanan Khas**:
  - Bakso Malang (lemari kaca, panci kuah, botol saus, atap biru, tabung gas).
  - Cilok (gerobak merah, payung warna-warni).
  - Gorengan (lemari kaca, wajan penggorengan di atas kompor, bangku kayu santai).
- Pilihan kartu perk dibuat lebih kontras (abu-abu terang dengan border merah, highlight saat disentuh).
- Efek teks pukulan (BUK!, PLAK!) dioptimalkan ukurannya agar tidak menghalangi pandangan pemain.

---

## [v1.8] - 2026-11-05

### Desain Antarmuka Grunge Urban
- Desain antarmuka bertema lakban jalanan (*duct tape*) dengan sudut miring dan aksen merah bata.
- Tipografi baru: **Oswald** (judul & tombol cta), **Barlow Condensed** (bodi teks), dan **Special Elite** (label mesin ketik).
- Latar menu dengan efek tinta novel grafis dan label barcode layar.
- HUD gelap minimalis dengan bilah HP merah berkedip saat kritis, bar stamina emas, dan tombol kontrol melingkar.

---

## [v1.7] - 2026-11-05

### Halte & Kendaraan Jakarta
- **Halte Bulungan**: Konstruksi baja kuning, atap lengkung metal, papan nama bolak-balik, bangku halte, dan tiang penerangan.
- **Gerobak Es Gondrong**: Gerobak kayu kuning-biru lengkap dengan rak botol sirup warna-warni dan pedagang gondrong berkumis.
- **Kendaraan Jalanan Beragam**: Metromini oranye-biru (jurusan acak 610, 69, 74), bus kota putih-biru, angkot hijau 09, bajaj biru modern, mobil sedan, hatchback, MPV, SUV, mobil boks, jip, pikap, truk, mobil polisi, serta pengendara motor berhelm.

---

## [v1.6] - 2026-11-04

### Mesin Grafis & Karakter Generasi Baru
- Tekstur prosedural: aspal retak, bekas tambalan, noda oli, trotoar paving berdaun kering, rumput, dan beton sekolah.
- Gedung sekolah 2 lantai dengan jendela nako, langit sore bersiluet gedung kota, dan bayangan realistis.
- Pengaturan preset grafik: Otomatis / Rendah / Sedang / Tinggi.
- Model karakter anatomis baru: tubuh membulat, ekspresi dinamis (tenang, marah, sakit, panik), dan animasi lutut menekuk.

---

## [v1.5] - 2026-11-04

### Warga & Mode Serbu Markas
- Kehadiran warga sekitar: orang kantoran berjas, ibu menggandeng anak, supir kendaraan. Warga dapat panik dan melarikan diri jika tawuran mendekat.
- Sistem penalti poin jika mencelakai warga sipil (−1 poin).
- **Mode Serbu Markas (Online)**: Kesempatan 60 detik bagi tim pemenang untuk menjebol markas lawan (Metromini XTM atau Gerbang SMEA 70) demi poin bonus tim.

---

## [v1.4] - 2026-11-03

### Voice Chat Online P2P
- Fitur suara langsung antar pemain berbasis WebRTC Peer-to-Peer.
- Kontrol audio: mikrofon ON/OFF, mode bicara ke TIM atau SEMUA, dan tombol hening/dengar.
- Menu pengaturan mikrofon lengkap dengan alat tes suara (*mic test*) dan perekaman diagnostik 3 detik.

---

## [v1.3] - 2026-11-02

### Sistem Stamina Pertarungan
- Bilah stamina kuning di HUD dan di atas kepala karakter.
- Konsumsi stamina proporsional untuk pukulan, tendangan, tebasan senjata berat, dan gerakan hindaran.
- Mekanisme kelelahan (CAPEK!) yang mewajibkan jeda taktis untuk pemulihan tenaga.

---

## [v1.2] - 2026-11-01

### Studio Kustomisasi Karakter & Mode Menu
- Studio karakter 3D interaktif dengan turntable putar 360 derajat.
- Pilihan postur tubuh (Ramping, Standar, Kekar), 5 palet warna kulit, pakaian seragam SMA atau hoodie dengan aneka warna, topi sekolah, kupluk, peci, serta kacamata.
- Penyimpanan akun lokal dengan proteksi 4 digit PIN.

---

## [v1.1] - 2026-10-31

### Tawuran Online Multiplayer 50 vs 50
- Mode online sekolah: SMEA 70 bertahan di gerbang vs XTM menyerbu dari halte bus.
- Integrasi bot otomatis pengisi slot hingga 50 vs 50 per sesi.
- Senjata tawuran khas: celurit, katana, gir motor berantai, bambu runcing, batu lempar, dan bom molotov.
