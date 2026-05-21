@echo off
color 0A
title DevEnv-Optimizer v2.0.1
echo =======================================================
echo         DevEnv-Optimizer - Pro Environment Setup
echo =======================================================
echo.

:: Admin privileges check
net session >nul 2>&1
if %errorLevel% == 0 (
    echo [OK] Running with Administrator privileges.
) else (
    echo [ERROR] This script requires Administrator privileges!
    echo Please right-click the file and select "Run as administrator".
    pause
    exit /b
)

echo.
echo [1/5] Gathering System Hardware Information...
echo -------------------------------------------------------
wmic cpu get name | findstr /v "Name"
wmic path Win32_VideoController get name | findstr /v "Name"
echo -------------------------------------------------------

echo.
echo [2/5] Flushing DNS Resolver Cache for network stability...
ipconfig /flushdns >nul
echo [OK] DNS Cache flushed successfully.

echo.
echo [3/5] Cleaning Temporary System and Application Files...
del /s /f /q "%temp%\*.*" >nul 2>&1
del /s /f /q "C:\Windows\Temp\*.*" >nul 2>&1
echo [OK] Temporary files removed. Free space recovered.

echo.
echo [4/5] Verifying Environment Variables (Dev Stack)...
echo -------------------------------------------------------
where git >nul 2>&1
if %errorlevel%==0 ( echo  [OK] Git is configured. ) else ( echo  [--] Git NOT found in PATH. )

where java >nul 2>&1
if %errorlevel%==0 ( echo  [OK] Java SDK is configured. ) else ( echo  [--] Java NOT found in PATH. )

where python >nul 2>&1
if %errorlevel%==0 ( echo  [OK] Python is configured. ) else ( echo  [--] Python NOT found in PATH. )

where node >nul 2>&1
if %errorlevel%==0 ( echo  [OK] Node.js is configured. ) else ( echo  [--] Node.js NOT found in PATH. )
echo -------------------------------------------------------

echo.
echo [5/5] Optimizing Power Plan for Maximum Compilation Speed...
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
if %errorlevel%==0 (
    echo [OK] Power plan enforced to High Performance.
) else (
    echo [INFO] Could not enforce High Performance power plan.
)

echo.
echo =======================================================
echo   Optimization Complete! Your environment is ready.
echo =======================================================
pause
