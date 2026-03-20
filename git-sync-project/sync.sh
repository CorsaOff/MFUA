#!/bin/bash

# Настройки путей
SOURCE_REPO="$HOME/projects/source-repo"
DEST_REPO="$HOME/projects/target-repo"

echo "=== Запуск синхронизации: $(date) ==="

# 1. Проверка существования путей
if [ ! -d "$SOURCE_REPO" ] || [ ! -d "$DEST_REPO" ]; then
    echo "Ошибка: Один из путей не найден."
    exit 1
fi

# 2. Синхронизация исходного репозитория
echo "Обновление исходного репозитория..."
cd "$SOURCE_REPO" || exit
git pull origin main

# 3. Копирование содержимого (исключая .git)
echo "Копирование файлов в целевой репозиторий..."
# Используем rsync для удобного исключения .git и замены файлов
rsync -av --exclude='.git' --delete "$SOURCE_REPO/" "$DEST_REPO/"

# 4. Пуш в целевой репозиторий (опционально)
echo "Отправка изменений в целевой репозиторий..."
cd "$DEST_REPO" || exit
git add .
git commit -m "Auto-sync: $(date)"
git push origin main

echo "=== Синхронизация завершена успешно ==="
# Пауза для визуального контроля в терминале
sleep 5