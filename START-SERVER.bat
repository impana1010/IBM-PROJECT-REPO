@echo off
title SmartCart AI - Local Server
color 0A
echo.
echo  ==========================================
echo   SmartCart AI - Local Development Server
echo  ==========================================
echo.
echo  Starting server on ALL network interfaces...
echo.

:: Find Python
where python >nul 2>&1
if %errorlevel% neq 0 (
    echo  ERROR: Python is not installed or not in PATH.
    echo  Please install Python from https://python.org
    pause
    exit /b 1
)

:: Kill anything on port 8081
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":8081 " 2^>nul') do (
    taskkill /PID %%a /F >nul 2>&1
)

echo  Server starting on port 8081...
echo.

:: Get local IP
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /C:"IPv4 Address"') do (
    set IP=%%a
    goto :found
)
:found
set IP=%IP: =%

echo  ==========================================
echo.
echo   YOUR LOCAL LINK (this computer):
echo   http://localhost:8081/index.html
echo.
echo   FRIENDS ON SAME WIFI:
echo   http://%IP%:8081/index.html
echo.
echo   Keep this window open while sharing.
echo   Press Ctrl+C to stop the server.
echo.
echo  ==========================================
echo.

python -m http.server 8081 --bind 0.0.0.0 --directory "%~dp0"
pause
