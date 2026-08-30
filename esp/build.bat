@echo off
setlocal enabledelayedexpansion

pushd "%~dp0"

set "NDK=C:\Users\rateiman\AppData\Local\Android\Sdk\ndk\android-ndk-r21e"

if not exist "%NDK%\ndk-build.cmd" (
    echo [ERROR] NDK not found at: %NDK%
    echo.
    echo Make sure the path is correct.
    pause
    popd
    exit /b 1
)

echo [INFO] NDK: %NDK%
echo [INFO] Building for x86_64 only...
echo.

call "%NDK%\ndk-build.cmd" NDK_PROJECT_PATH=. NDK_APPLICATION_MK=jni/Application.mk APP_BUILD_SCRIPT=jni/Android.mk -j%NUMBER_OF_PROCESSORS%

set "RC=%ERRORLEVEL%"

echo.
if "%RC%"=="0" (
    if exist "libs\x86_64\rateiman" (
        for %%F in ("libs\x86_64\rateiman") do set "SZ=%%~zF"
        echo [OK] libs\x86_64\rateiman (!SZ! bytes)
    ) else (
        echo [WARN] libs\x86_64\rateiman not found!
    )
) else (
    echo [FAIL] ndk-build returned code %RC%
)

popd
exit /b %RC%