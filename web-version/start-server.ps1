# PowerShell script a web szerver indításához

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Pénzügy Elemző - Web Szerver" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Ellenőrizzük, hogy Python van-e
try {
    $pythonVersion = python --version 2>&1
    Write-Host "[OK] Python találva: $pythonVersion" -ForegroundColor Green
    Write-Host ""
    
    # IP cím lekérése
    $ipAddress = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.InterfaceAlias -notlike "*Loopback*" -and $_.IPAddress -notlike "169.254.*" } | Select-Object -First 1).IPAddress
    
    Write-Host "A szerver elindul a http://localhost:8000 címen" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Az iPhone-on nyisd meg:" -ForegroundColor Yellow
    Write-Host "http://$ipAddress:8000" -ForegroundColor Green
    Write-Host ""
    Write-Host "A szerver leállításához nyomj Ctrl+C-t" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host ""
    
    # Szerver indítása
    python -m http.server 8000
}
catch {
    Write-Host "[HIBA] Python nincs telepítve!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Telepítsd a Python-t: https://www.python.org/downloads/" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "VAGY használd a Netlify Drop-ot:" -ForegroundColor Yellow
    Write-Host "https://app.netlify.com/drop" -ForegroundColor Cyan
    Write-Host ""
    Read-Host "Nyomj Enter-t a kilépéshez"
}

