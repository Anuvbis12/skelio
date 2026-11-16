# 🌐 SKELIO Web Application Dashboard

Aplikasi web interaktif **SKELIO (Real-Time Biomechanical Analytics & Exercise Evaluation)** berbasis AI Pose Estimation (YOLOv11-Pose) untuk evaluasi seminar proposal dan tugas akhir Big Data UNESA.

---

## 🌟 Fitur Unggulan Antarmuka (Web UI Features)

### 1. 📁 Upload Video Mandiri (Drag & Drop + File Picker)
* Pengguna maupun dosen penguji dapat langsung menyeret (*drag & drop*) atau memilih file video rekaman latihan dari HP (`.mp4`, `.mov`, `.avi`, `.mkv`).
* Pipeline AI akan otomatis beralih memproses video tersebut frame-by-frame secara real-time lengkap dengan visualisasi HUD skeleton dan grafik sudut sendi.

### 2. 🏆 Kartu Skor Evaluasi Sesi (Workout Summary Card 0–100)
* Tombol **"Selesai Latihan"** memicu jendela modal ringkasan komprehensif:
  * **Skor Konsistensi Postur:** Nilai 0–100 dengan predikat kelayakan (*Grade A: Sangat Sempurna, Grade B: Bagus & Konsisten, Grade C: Perlu Koreksi, Grade D: Perlu Bimbingan*).
  * **Statistik Utama:** Total Reps, Clean Reps ratio, Rata-rata Kedalaman (*Average Depth %*), Waktu Aktif, dan Estimasi Kalori Terbakar (*MET 7.2 Calisthenics*).
  * **Rekomendasi Cerdas Biomekanika AI:** Diagnosa otomatis terhadap kesalahan form (misal: *Hip Sagging*, punggung membungkuk, atau repetisi dangkal).

### 3. ⏱️ Hitung Mundur (Countdown 3-2-1) & Metronom Tempo (Cadence)
* Tombol **"Mulai Latihan"** mengaktifkan hitung mundur audio-visual 3-2-1 di layar agar pengguna sempat memposisikan diri sebelum deteksi dimulai.
* Fitur **Metronom Tempo (2-1-1)** dengan audio sintetis *Web Audio API* dan indikator visual:
  * **2 detik Fase Turun (Eksentrik)**
  * **1 detik Fase Tahan Bawah (Isometrik)**
  * **1 detik Fase Naik/Dorong (Konsentrik)**

### 4. 📄 Ekspor Laporan PDF Otomatis
* Tombol **"Cetak Laporan PDF"** menghasilkan dokumen PDF resmi A4 siap cetak (`html2pdf.js`):
  * Kop resmi SKELIO & UNESA Teknik Informatika Kelompok 11.
  * Metadata sesi (tanggal, jenis gerakan, durasi, kalori).
  * Nilai skor postur & predikat.
  * Tabel audit indikator biomekanika.
  * Rekomendasi perbaikan postur.

### 5. 📊 Real-Time Kinematic Waveform Chart & Audio Voice Coach
* Grafik osilasi sudut sendi real-time (*Chart.js*) memperlihatkan kurva fleksi-ekstensi.
* Pelatih suara AI (*Web Speech API*) bersuara otomatis di speaker browser ("Repetisi 1!", "Turun lebih dalam!", "Tegakkan dada!").
* Ekspor data log tabular ke format `.csv`.

---

## 🚀 Cara Menjalankan Aplikasi

Cukup klik ganda file peluncur di root folder:
```cmd
run_skelio_app.bat
```
Atau jalankan via terminal:
```bash
py -3.11 apps/web/app.py
```
Peramban web akan terbuka secara otomatis di: **`http://localhost:5000`**
