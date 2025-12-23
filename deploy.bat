@echo off
chcp 65001 > nul
echo ===================================================
echo     AUTO-DEPLOY: SYNC POSTS ^& PUSH TO GITHUB
echo ===================================================

:: 1. Настройка переменных (ВАШ АДРЕС CONVEX)
set VITE_CONVEX_URL=https://ardent-tapir-719.convex.cloud
set CONVEX_DEPLOYMENT=production

:: 2. Сохраняем локальные изменения (ЧТОБЫ НЕ БЫЛО ОШИБОК ПРИ PULL)
echo.
echo [1/4] Saving local changes...
call git add .
set /p commitMsg="Enter commit message (default: Update content): "
if "%commitMsg%"=="" set commitMsg=Update content
call git commit -m "%commitMsg%"

:: 3. Забираем новости с GitHub (СЛИЯНИЕ)
echo.
echo [2/4] Pulling changes from GitHub...
call git pull origin main
if %errorlevel% neq 0 (
    echo.
    echo [WARNING] Возможно, возник КОНФЛИКТ версий.
    echo Git попытался объединить файлы автоматически.
    echo Если видите слово CONFLICT выше - нужно открыть файлы и проверить.
    pause
)

:: 4. Синхронизация постов на сайт (Convex)
echo.
echo [3/4] Syncing posts to Convex...
call npx tsx scripts/sync-posts.ts
if %errorlevel% neq 0 (
    echo [ERROR] Sync failed!
    pause
    exit /b %errorlevel%
)

:: 5. Отправка итогового результата на GitHub
echo.
echo [4/4] Pushing to GitHub...
call git push

echo.
echo ===================================================
echo             SUCCESS! SITE UPDATED.
echo ===================================================
pause
