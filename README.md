# Bel Pulang

Game 3D tawuran sekolah di jalan depan gerbang SMEA 70 dan Halte Bulungan (fiksi). Jalan di browser HP, dimainkan landscape, tanpa instal.

Main di: https://belpulang.netlify.app atau https://belpulang.win

## Mode

**Single-player (50 level)**
- SMEA 70 melawan SMA Seberang yang datang dari kanan jalan dan turun dari bus.
- Misi berganti tiap level: tawuran, rebut spanduk Bulungan Cup, awas Wito (kabur ke gerbang), jaga halte, kawal Conge, hujan senjata.
- Bos tiap 10 level, perk setelah tiap kemenangan, progres tersimpan otomatis.

**Online (SMEA 70 vs XTM)**
- Satu orang membuat room dan membagikan kode 4 huruf, yang lain gabung pakai kode itu.
- 50 orang per sekolah langsung turun semua sejak awal, kursi kosong diisi bot. Darah semua sama, tidak ada bangkit lagi. Nama pemain tampil di atas kepala.
- SMEA 70 keluar dari gerbang. XTM turun dari Metromini yang parkir di halte sebelah kanan (markas XTM).
- Bot SMEA 70 menjaga gerbang dan memukul mundur, sebagian maju menghancurkan Metromini. Bot XTM merubuhkan gerbang dan menghabisi lawan.
- XTM menang kalau gerbang SMEA 70 rubuh dan ada yang masuk sekolah. SMEA 70 menang kalau Metromini XTM hancur, atau waktu 4 menit habis dan gerbang masih berdiri. Sekolah yang pasukannya habis duluan kalah.
- Razia Wito tiap 1 menit: dalam 5 detik SMEA 70 harus masuk ke dalam gerbang dan XTM ke halte Metromini. Yang masih di luar saat razia: BUSTED (tumbang).
- Molotov: dilempar, membakar area selama beberapa detik.
- Kill feed, papan skor KO, dan pilihan senjata awal di lobby.
- Pembuat room menjadi host yang menjalankan pertandingan, jadi host harus tetap membuka game sampai ronde selesai.

## Kontrol

| HP | Laptop | Fungsi |
|---|---|---|
| Joystick kiri | WASD / panah | Jalan |
| SERANG | J | Pukul, ayun senjata, atau lempar. 3x pukul beruntun = pukulan atas |
| TENDANG | K | Lawan terpental jauh |
| HINDAR | Spasi | Lolos dari serangan |
| TUKAR | E | Tukar senjata dengan yang ada di tanah |

## Senjata

| Senjata | Damage | Pakai |
|---|---|---|
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
