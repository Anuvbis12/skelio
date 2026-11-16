# SKELIO — Project Rules & AI Guidelines

## 1. Environment & Runtime Conventions
- **Python Version**: Always invoke scripts using `py -3.11`.
  - Python 3.11 has PyTorch 2.14.1+cpu and Ultralytics 8.4.190 pre-installed.
  - Do NOT use `python` or `py` without `-3.11` because default Python 3.14 on this machine does not have compatible PyTorch wheels.
- **Model Weights**: `yolo11n-pose.pt` is stored at the repository root. Ensure all pipeline and app references point to this file.
- **Operating System**: Windows (PowerShell / CMD). Use forward slashes in python code (`os.path` or `pathlib.Path`) and double-quotes in batch scripts.

## 2. Architecture & File Structure
```
Bigdata/
├── .agents/
│   └── skills/
│       ├── skelio-biomechanics/     # Biomechanics & Pose Estimation Skill
│       └── skelio-app-management/   # Web, Desktop & Mobile App Skill
├── apps/
│   ├── web/                         # Flask Web Dashboard & Video Stream
│   │   ├── app.py                   # Main Flask Backend Server
│   │   ├── templates/index.html     # Dashboard, Metronome, PDF, Modal UI
│   │   └── static/                  # PWA Manifest, Service Worker, Icon
│   └── mobile/                      # Mobile PWA & Capacitor APK Project
│       ├── capacitor.config.json    # Capacitor Android Configuration
│       ├── package.json             # NPM dependencies for Mobile build
│       └── src/index.html           # Touch-first Mobile UI
├── core/
│   └── biomechanical_pipeline.py    # YOLOv11-Pose, Homography, Rep Counter
├── run_skelio_app.bat               # 1-Click Web Dashboard Launcher
└── run_skelio_desktop_app.bat       # 1-Click Standalone Desktop Window Launcher
```

## 3. Biomechanical Standards
- **Push-up**:
  - Primary Angle: Elbow flexion (Shoulder -> Elbow -> Wrist).
  - Rep threshold: Transition from $> 150^\circ$ (UP) down to $< 90^\circ$ (DOWN) and back to $> 150^\circ$ (COMPLETED).
  - Posture Angle: Trunk & Hip line (Shoulder -> Hip -> Ankle). Must remain $> 160^\circ$ to prevent sagging or pike.
- **Squat**:
  - Primary Angle: Knee flexion (Hip -> Knee -> Ankle).
  - Rep threshold: Transition from $> 160^\circ$ (UP) down to $< 95^\circ$ (DOWN) and back to $> 160^\circ$ (COMPLETED).
  - Posture Angle: Torso lean (Shoulder -> Hip -> Knee).

## 4. UI & Communication
- Web dashboard runs on `http://localhost:5000` (or `http://0.0.0.0:5000` for LAN access).
- Responses to the user should be communicated in clear Bahasa Indonesia.
