# 📱 SKELIO Mobile Application (Android & iOS)

Aplikasi mobile **SKELIO (Real-Time Biomechanical Analytics)** dirancang khusus untuk layar smartphone dengan kontrol sentuh (*touch-first*), tata letak ramah jempol, serta orientasi layar yang fleksibel.

---

## 🚀 3 Cara Menjalankan Versi Mobile

### Cara 1: Akses Langsung Lewat HP via Jaringan Wi-Fi (Paling Cepat & Instan)
1. Pastikan HP dan Laptop terhubung ke jaringan **Wi-Fi yang sama**.
2. Jalankan server di laptop:
   ```cmd
   run_skelio_app.bat
   ```
3. Di layar HP (Chrome / Safari), buka alamat IP laptop Anda:
   ```
   http://192.168.1.31:5000
   ```
   *(Ganti dengan IP lokal laptop Anda jika berbeda)*.

---

### Cara 2: Install sebagai Aplikasi Native PWA (Progressive Web App)
Aplikasi SKELIO sudah dilengkapi **Web App Manifest** dan **Service Worker**:
* **Di Android (Google Chrome):** Buka link di atas, klik tombol **"Install App"** di bilah navigasi atau buka menu titik tiga $\rightarrow$ pilih **"Tambahkan ke Layar Utama" / "Install Aplikasi"**.
* **Di iPhone (Safari):** Buka link di atas, klik ikon **Share** (kotak panah ke atas) $\rightarrow$ pilih **"Add to Home Screen"**.
* Ikon resmi SKELIO akan langsung muncul di layar utama smartphone Anda dan berjalan sebagai aplikasi layar penuh (*fullscreen standalone*) tanpa bilah peramban!

---

### Cara 3: Build Menjadi File Android APK (.apk) via Capacitor
Modul di folder `apps/mobile/` sudah disiapkan dengan konfigurasi **Capacitor Android**:

1. Buka folder mobile:
   ```bash
   cd apps/mobile
   ```
2. Pasang dependensi Capacitor (memerlukan Node.js):
   ```bash
   npm install
   npx cap add android
   ```
3. Buka proyek di Android Studio untuk build APK:
   ```bash
   npx cap open android
   ```

---

## 🌟 Fitur Khusus Versi Mobile
1. **Vertical / Portrait Live Stream:** Tampilan video dan HUD yang dioptimalkan untuk rasio layar ponsel 9:16 atau 1:1.
2. **Right-Edge Depth Gauge Bar:** Indikator kedalaman gerakan visual di pinggir layar yang mudah dilihat saat meletakkan HP di lantai.
3. **Audio Coaching Speaker HP:** Suara instruksi pelatih AI langsung terdengar jernih dari speaker ponsel (*Web Speech API*).
4. **Metronom Tempo Sentuh:** Tombol tempo ritme 2-1-1 ramah jempol.
