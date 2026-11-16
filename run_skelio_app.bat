@echo off
title SKELIO - Web Application Dashboard (UNESA)
:: Pindah ke direktori tempat file .bat berada
cd /d "%~dp0"

echo ====================================================================
echo SISTEM SKELIO: WEB APPLICATION DASHBOARD (YOLOv11-Pose Engine)
echo Kelompok 11 Big Data - S1 Teknik Informatika UNESA
echo ====================================================================
echo.
echo [*] Memuat model AI YOLOv11 & server web Flask...
echo [*] Mohon tunggu beberapa detik, peramban (browser) akan terbuka otomatis!
echo.
echo [TIPS] Tekan CTRL+C di jendela hitam ini jika ingin menutup aplikasi.
echo ====================================================================
echo.

where py >nul 2>nul
if %errorlevel% equ 0 (
    py -3.11 apps\web\app.py
    if %errorlevel% neq 0 (
        echo [INFO] Mencoba beralih ke Python 3.10...
        py -3.10 apps\web\app.py
    )
    if %errorlevel% neq 0 (
        echo [INFO] Mencoba python default...
        python apps\web\app.py
    )
) else (
    python apps\web\app.py
)

echo.
echo Server SKELIO telah dimatikan.
pause
