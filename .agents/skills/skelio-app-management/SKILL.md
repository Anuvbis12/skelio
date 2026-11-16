---
name: skelio-app-management
description: >-
  Manage, launch, test, and debug SKELIO application targets including the Flask Web Dashboard, Native Desktop App (Edge/Chrome App Container), and Mobile PWA/Capacitor project.
---

# SKELIO Application Management Skill

This skill provides step-by-step procedures for serving, configuring, debugging, and building all deployment targets of SKELIO.

## 1. Prerequisites & Execution Environment

- **Python Interpreter**: Always execute using `py -3.11`.
- **Packages Required**:
  ```powershell
  py -3.11 -m pip install torch torchvision --index-url https://download.pytorch.org/whl/cpu
  py -3.11 -m pip install ultralytics opencv-python flask werkzeug
  ```

## 2. Launching Application Targets

### A. Web Dashboard (Browser Mode)
Runs the background backend and launches the default system browser:
```powershell
.\run_skelio_app.bat
```
Direct command:
```powershell
py -3.11 apps/web/app.py
```
Dashboard URL: `http://localhost:5000` (or `http://0.0.0.0:5000` on LAN).

### B. Native Desktop Application (Standalone Window Mode)
Runs the backend and embeds SKELIO into a clean, dedicated window without browser navigation or address bar:
```powershell
.\run_skelio_desktop_app.bat
```

### C. Mobile App (Smartphone via LAN / PWA)
1. Ensure smartphone is connected to the same Wi-Fi network.
2. Find host IP address:
   ```powershell
   ipconfig
   ```
3. Open `http://<HOST_IP>:5000` in mobile Safari/Chrome.
4. Tap **"Install App"** to install as a native PWA on the home screen.

### D. Android APK Build (Capacitor)
```bash
cd apps/mobile
npm install
npx cap add android
npx cap open android
```

## 3. Backend REST & Streaming Endpoints

Endpoint | Method | Description
:---|:---|:---
`/video_feed` | `GET` | Multipart MJPEG real-time video stream with pose & angle overlay.
`/api/set_exercise` | `POST` | Change active exercise (`pushup` or `squat`).
`/api/set_source` | `POST` | Switch input source (`0` for webcam, or video file path).
`/api/upload_video` | `POST` | Upload custom `.mp4`/`.mov` video file to `apps/web/uploads/`.
`/api/session_start` | `POST` | Start a new workout session (resets rep telemetry and timer).
`/api/session_stop` | `POST` | Stop workout session and generate summary.
`/api/session_summary`| `GET` | Returns JSON summary: posture score (0-100), depth, calorie, AI recommendations.
`/api/export_csv` | `GET` | Downloads historical rep data in CSV format.

## 4. Troubleshooting Common Issues

### Issue 1: `ERR_CONNECTION_REFUSED` on startup
- **Cause**: Browser tried to open before PyTorch and YOLO model weights finished loading into CPU memory (~3-5 seconds).
- **Fix**: The startup script now uses a deferred launcher thread inside `apps/web/app.py` that waits until the socket listener is active.

### Issue 2: Port 5000 already in use
- Check and terminate existing process:
  ```powershell
  Get-Process -Id (Get-NetTCPConnection -LocalPort 5000).OwningProcess | Stop-Process -Force
  ```
