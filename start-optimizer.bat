@echo off
title DevEnv-Optimizer v1.0.0
echo =======================================================
echo   DevEnv-Optimizer - Developer System Setup & Tweak
echo =======================================================
echo.

:: Kontrola správcovských oprávnění
net session >nul 2>&1
if %errorLevel% == 0 (
    echo [SUCCESS] Spusteno s pravy administratora.
) else (
    echo [ERROR] Tento skript musi byt spusten jako Administrator!
    echo Klikni na soubor pravym tlacitkem a zvol "Spustit jako administrator".
    pause
    exit /b
)

echo.
echo [1/4] Pročišťování DNS mezipaměti pro rychlejší síťovou odezvu...
ipconfig /flushdns

echo.
echo [2/4] Mazání dočasných systémových souborů (uvolnění disku a RAM)...
del /s /f /q %temp%\*.* >nul 2>&1
del /s /f /q C:\Windows\Temp\*.* >nul 2>&1
echo [SUCCESS] Docasne soubory byly uspesne vymazany.

echo.
echo [3/4] Kontrola nainstalovaných vývojářských nástrojů v PATH...
echo -------------------------------------------------------

where git >nul 2>&1
if %errorlevel%==0 (
    echo  [-] Git je nainstalován. Verze:
    git --version
) else (
    echo  [-] Git NEBYL v systému nalezen.
)

where java >nul 2>&1
if %errorlevel%==0 (
    echo  [-] Java je nainstalována. Verze:
    java -version 2>&1 | findstr "version"
) else (
    echo  [-] Java NEBYLA v systému nalezena.
)

where python >nul 2>&1
if %errorlevel%==0 (
    echo  [-] Python je nainstalován. Verze:
    python --version
) else (
    echo  [-] Python NEBYL v systému nalezen.
)

echo -------------------------------------------------------

echo.
echo [4/4] Optimalizace schématu napájení pro náročné kompilace...
:: Aktivace schématu "Vysoký výkon" pomocí jeho výchozího GUIDu
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
if %errorlevel%==0 (
    echo [SUCCESS] Rezim napajeni byl prepnut na Vysoky vykoN.
) else (
    echo [INFO] Nepodarilo se vynutit rezim Vysokeho vykonu.
)

echo.
echo =======================================================
echo   Optimalizace vývojářského prostředí dokončena!
echo =======================================================
pause
