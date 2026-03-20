# Настройки путей
$SourceRepo = "C:\Users\danas\mfua_clone"
$DestRepo = "C:\Users\danas\mfua"

Write-Host "=== Запуск синхронизации: $(Get-Date) ===" -ForegroundColor Cyan

# 1. Проверка путей
if (!(Test-Path $SourceRepo) -or !(Test-Path $DestRepo)) {
    Write-Error "Ошибка: Пути не найдены. Проверьте переменные в скрипте."
    pause
    exit
}

# 2. Git Pull в источнике
Write-Host "Обновление источника..." -ForegroundColor Yellow
Set-Location $SourceRepo
git pull origin main

# 3. Копирование файлов (замена существующих, пропуск .git)
Write-Host "Копирование содержимого..." -ForegroundColor Yellow
# Get-ChildItem берет всё кроме .git, Copy-Item копирует с заменой (Force)
Get-ChildItem -Path $SourceRepo -Exclude ".git" -Recurse | ForEach-Object {
    $DestPath = $_.FullName.Replace($SourceRepo, $DestRepo)
    if ($_.PSIsContainer) {
        if (!(Test-Path $DestPath)) { New-Item -Path $DestPath -ItemType Directory }
    } else {
        Copy-Item -Path $_.FullName -Destination $DestPath -Force
    }
}

# 4. Git Push (опционально)
Write-Host "Пуш изменений..." -ForegroundColor Yellow
Set-Location $DestRepo
git add .
git commit -m "Auto-sync: $(Get-Date)"
git push origin main

Write Host "=== Done! ===" -ForegroundColor Green
pause