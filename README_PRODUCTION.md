# 🏦 Loan Management System - Production Ready

## ✅ Ветка: production-ready-v1

Это **рабочая версия** проекта, готовая к запуску и демонстрации.

---

## 🚀 БЫСТРЫЙ СТАРТ (3 команды)

```bash
cd backend
pip3 install -r requirements_dev.txt
python3 manage.py runserver 0.0.0.0:8000
```

**Готово!** Откройте http://localhost:8000/admin/

---

## 🔑 Учетные данные (уже созданы)

- **Email:** `admin@loanms.com`
- **Пароль:** `admin123`
- **Роль:** ADMIN

---

## 📋 ПОЛНАЯ ИНСТРУКЦИЯ ПО ЗАПУСКУ

### Способ 1: Автоматический (РЕКОМЕНДУЕТСЯ)

```bash
# В корне проекта выполните:
./setup_and_run.sh

# Затем запустите сервер:
./run_server.sh
```

### Способ 2: Вручную (пошагово)

```bash
# 1. Перейдите в папку backend
cd backend

# 2. Установите зависимости
pip3 install -r requirements_dev.txt

# 3. Выполните миграции (если база не создана)
python3 manage.py migrate

# 4. Создайте суперпользователя (если не создан)
python3 create_superuser.py

# 5. Запустите сервер
python3 manage.py runserver 0.0.0.0:8000
```

### Способ 3: С Docker

```bash
# 1. Соберите образ
cd backend
docker build -t backend:latest .

# 2. Запустите контейнеры
cd ..
docker-compose up

# 3. Выполните миграции
docker-compose run --rm apis python manage.py migrate

# 4. Создайте админа
docker-compose run --rm apis python manage.py createsuperuser
```

---

## 🌐 Доступные URL

После запуска сервера:

### Админ-панель Django:
```
http://localhost:8000/admin/
```
Войдите с учетными данными выше

### API Endpoints:
```
Base URL: http://localhost:8000/api/

User Management:
  POST   /api/user/signup/
  POST   /api/user/login/
  GET    /api/user/profile/
  POST   /api/user/create-admin/
  GET    /api/user/list-agent/
  GET    /api/user/list-approvals/
  PUT    /api/user/approve-delete/<id>/

Loan Management:
  POST   /api/loan/customer-loan/
  PUT    /api/loan/approve-reject-loan/<id>/
  PUT    /api/loan/edit-loan/<id>/
  GET    /api/loan/list-loans-admin-agent/
  GET    /api/loan/list-loans-customer/
```

---

## 🧪 Тестирование API

### Пример 1: Вход в систему

```bash
curl -X POST http://localhost:8000/api/user/login/ \
  -H "Content-Type: application/json" \
  -d '{"email": "admin@loanms.com", "password": "admin123"}'
```

**Ответ:**
```json
{
    "success": true,
    "message": "User logged in successfully",
    "token": "eyJ0eXAiOiJKV1QiLCJhbGc...",
    "is_customer": false,
    "is_agent": false,
    "is_admin": true
}
```

### Пример 2: Получить профиль

```bash
curl http://localhost:8000/api/user/profile/ \
  -H "Authorization: Bearer YOUR_TOKEN_HERE"
```

---

## ✅ Проверка работоспособности

Выполните эти команды для проверки:

```bash
cd backend

# Проверка на ошибки
python3 manage.py check

# Запуск тестов
python3 manage.py test

# Проверка миграций
python3 manage.py showmigrations
```

**Все должно быть зеленым!** ✅

---

## 🎯 Для демонстрации преподавателю

### Сценарий демонстрации:

1. **Запустите сервер:**
   ```bash
   cd backend
   python3 manage.py runserver 0.0.0.0:8000
   ```

2. **Откройте админ-панель:**
   - URL: http://localhost:8000/admin/
   - Войдите как admin

3. **Покажите возможности:**
   - Управление пользователями
   - Управление кредитами
   - История изменений
   - Фильтрация данных

4. **Продемонстрируйте API:**
   - Используйте Postman или cURL
   - Покажите регистрацию, вход, создание кредита
   - Покажите одобрение кредита

5. **Покажите код:**
   - Структуру проекта
   - Модели (User, Loan)
   - API Views
   - Permissions

---

## 🛠️ Технологический стек

| Компонент | Технология | Версия |
|-----------|------------|--------|
| Backend | Django | 3.2.5 |
| API | Django REST Framework | 3.12.4 |
| Auth | JWT | 2h tokens |
| Database | SQLite / PostgreSQL | - |
| Password Hash | PBKDF2 + SHA256 | - |
| Docker | Docker Compose | - |

---

## 📚 Документация

### В проекте:
- `README_OST.md` - Общее описание для OST курса
- `PROJECT_DESCRIPTION.md` - Полная документация (27 KB)
- `PROJECT_DESCRIPTION.docx` - Word документ (45 KB)
- `QUICK_START_RU.md` - Быстрый старт
- `admin_panel.html` - Информационная страница

### Онлайн:
- **API Docs (Postman):** https://documenter.getpostman.com/view/9835426/Tzm5FwLV

---

## 🔧 Решение проблем

### Проблема: Порт 8000 занят
```bash
# Найти процесс
lsof -i :8000

# Убить процесс
kill -9 <PID>

# Или убить все Django процессы
pkill -f "manage.py runserver"
```

### Проблема: База данных не найдена
```bash
cd backend
python3 manage.py migrate
python3 create_superuser.py
```

### Проблема: Зависимости не установлены
```bash
cd backend
pip3 install -r requirements_dev.txt
```

### Проблема: Доступ запрещен к admin
**Решение:** Убедитесь, что используете правильные учетные данные:
- Email: `admin@loanms.com`
- Пароль: `admin123`

---

## 📊 Структура проекта

```
Loan-MS/
├── backend/
│   ├── backend/           # Настройки Django
│   ├── user/             # Приложение пользователей
│   ├── loan/             # Приложение кредитов
│   ├── manage.py
│   ├── requirements.txt      # PostgreSQL
│   ├── requirements_dev.txt  # SQLite
│   └── create_superuser.py
│
├── admin_panel.html      # Информационная страница
├── setup_and_run.sh      # Автоматическая установка
├── run_server.sh         # Запуск сервера
├── docker-compose.yml    # Docker конфигурация
│
└── Документация/
    ├── README.md
    ├── README_OST.md
    ├── PROJECT_DESCRIPTION.md
    ├── PROJECT_DESCRIPTION.docx
    └── QUICK_START_RU.md
```

---

## ⚡ Полезные команды

```bash
# Проверить проект
python3 manage.py check

# Запустить тесты
python3 manage.py test

# Создать миграции
python3 manage.py makemigrations

# Применить миграции
python3 manage.py migrate

# Создать суперпользователя вручную
python3 manage.py createsuperuser

# Открыть Django shell
python3 manage.py shell

# Собрать статику
python3 manage.py collectstatic
```

---

## 🎓 Возможности системы

✅ **Управление пользователями:**
- Регистрация (Customer/Agent)
- Аутентификация (JWT tokens)
- Одобрение агентов администратором
- Создание администраторов

✅ **Управление кредитами:**
- Создание кредитных заявок
- Одобрение/отклонение кредитов
- Редактирование неодобренных кредитов
- Фильтрация по статусам

✅ **Безопасность:**
- JWT токены (2 часа)
- PBKDF2 + SHA256 хеширование
- Permission-based доступ
- CORS настройки

✅ **Аудит:**
- История всех изменений
- Логирование операций
- Отслеживание авторов

---

## 🌟 Особенности этой ветки

Ветка **production-ready-v1** содержит:

- ✅ Полностью рабочий код
- ✅ Готовая база данных SQLite
- ✅ Созданный администратор
- ✅ Все миграции применены
- ✅ Протестированные API endpoints
- ✅ Подробная документация
- ✅ Скрипты автоматизации
- ✅ Docker поддержка

**Гарантия:** Проект запускается с первого раза! 🎉

---

## 📞 Поддержка

При возникновении вопросов:

1. Проверьте документацию в папке проекта
2. Откройте `admin_panel.html` для быстрой справки
3. Проверьте API документацию на Postman
4. Выполните `python3 manage.py check`

---

## ✨ Готово к работе!

Эта ветка **полностью готова** к:
- ✅ Запуску и демонстрации
- ✅ Показу преподавателю
- ✅ Добавлению в портфолио
- ✅ Дальнейшей разработке

**Удачи с проектом!** 🚀

---

**Версия:** 1.0.0
**Статус:** Production Ready ✅
**Дата:** 2026-01-07
