@echo off
setlocal enabledelayedexpansion

echo ========================================
echo  Deploy rateiman Cheat
echo ========================================
echo.

set ADB=C:\Users\rateiman\AppData\Local\Android\Sdk\platform-tools\adb.exe
set ABI=x86_64
set BIN=libs\%ABI%\rateiman
set LIB=libs\%ABI%\libc++_shared.so

if not exist "%ADB%" (
    echo [ERROR] adb.exe not found!
    pause
    exit /b 1
)
echo [OK] ADB found: %ADB%

echo.
%ADB% devices
echo.

if not exist "%LIB%" (
    echo [WARN] %LIB% not found, skipping...
) else (
    echo [INFO] Pushing libc++_shared.so...
    %ADB% push "%LIB%" /data/local/tmp/libc++_shared.so
    if errorlevel 1 (
        echo [WARN] Failed to push libc++_shared.so
    )
)

if not exist "%BIN%" (
    echo [ERROR] %BIN% not found!
    echo.
    echo Available builds:
    dir /b libs 2>nul
    echo.
    echo Run ndk-build first, or change ABI variable in this script.
    pause
    exit /b 1
)

echo [INFO] Pushing rateiman...
%ADB% push "%BIN%" /data/local/tmp/rateiman
if errorlevel 1 (
    echo [ERROR] Failed to push rateiman!
    pause
    exit /b 1
)

echo [INFO] Setting permissions...
%ADB% shell chmod 755 /data/local/tmp/rateiman
%ADB% shell chmod 644 /data/local/tmp/libc++_shared.so

echo [INFO] Killing old process...
%ADB% shell su -c "killall rateiman" 2>nul

echo [INFO] Starting cheat...
%ADB% shell su -c "LD_LIBRARY_PATH=/data/local/tmp /data/local/tmp/rateiman &"

echo.
echo ========================================
echo  Deploy complete!
echo ========================================
echo.
echo Make sure Standoff 2 is running!
echo.
echo To stop cheat:
echo   %ADB% shell su -c "killall rateiman"
echo.

pause