@echo off
echo ========================================
echo   Pénzügy Elemző - Web Szerver
echo ========================================
echo.

REM Ellenőrizzük, hogy Python van-e telepítve
python --version >nul 2>&1
if %errorlevel% == 0 (
    echo [OK] Python talalva!
    echo.
    echo A szerver elindul a http://localhost:8000 cimen
    echo.
    echo Az iPhone-on nyisd meg:
    echo http://[SZAMITOGEP-IP-CIM]:8000
    echo.
    echo Az IP cimet megtudod: ipconfig
    echo.
    echo A szerver leallitasahoz nyomj Ctrl+C-t
    echo.
    echo ========================================
    echo.
    python -m http.server 8000
) else (
    echo [HIBA] Python nincs telepítve!
    echo.
    echo Telepítsd a Python-t: https://www.python.org/downloads/
    echo.
    echo VAGY hasznald a Netlify Drop-ot:
    echo https://app.netlify.com/drop
    echo.
    pause
)

