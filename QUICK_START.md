# Быстрый старт: Markdown Site

Эта инструкция поможет вам настроить проект "с нуля" на новом компьютере или после очистки, а также расскажет, как публиковать статьи.

---

## Часть 1. Первая настройка (один раз)

Если вы скачали проект заново или перенесли его на другой ПК.

1. **Откройте терминал (CMD)** и перейдите в папку проекта:
   ```cmd
   cd /d C:\Users\anika\Music\antigravity\markdown-site-main
   ```

2. **Очистите старые "хвосты" и библиотеки (если нужно):**
   ```cmd
   rmdir /s /q .git
   rmdir /s /q node_modules
   del package-lock.json
   ```

3. **Установите зависимости:**
   ```cmd
   npm install
   ```

4. **Подключите базу данных Convex:**
   *(Важно сбросить старую переменную перед запуском)*
   ```cmd
   set CONVEX_DEPLOYMENT=
   npx convex dev
   ```
   *   Выберите **Existing project**.
   *   Выберите ваш проект (`markdown-site` или `zaqqaz`).
   *   Когда увидите `Convex functions ready!`, нажмите **Ctrl + C**.

5. **Настройте Git и отправьте код на GitHub:**
   ```cmd
   git init
   git config user.name "Vik2111"
   git config user.email "vik2111@example.com"
   git remote add origin https://github.com/Vik2111/markdown-site.git
   git add .
   git commit -m "Fresh start"
   git branch -M main
   git push -u origin main --force
   ```

---

## Часть 2. Как написать и опубликовать статью

### Шаг 1. Создание статьи
Создайте новый файл в папке `content\blog\` (например, `my-new-post.md`).

Вставьте в начало файла такую "шапку":
```yaml
---
title: "Мой новый пост"
description: "О чем эта статья"
date: "2023-12-25"
slug: "my-new-post-slug"
published: true
tags: ["жизнь", "кодинг"]
image: "/images/my-photo.jpg" 
---
```
*(Ниже шапки пишите обычный текст).*

### Шаг 2. Публикация (Sync & Deploy)
Чтобы статья появилась на сайте и сохранилась на GitHub:

1. **Запустите файл `deploy.bat`** (просто дважды кликните по нему или введите в терминале):
   ```cmd
   deploy.bat
   ```
2. Скрипт сам:
   *   Сохранит ваши локальные изменения.
   *   Скачает обновления с GitHub (если вы правили что-то с телефона).
   *   Отправит пост на сайт (Convex).
   *   Отправит файлы на GitHub.

**Готово! Сайт обновлен.**
