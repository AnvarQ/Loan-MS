# Быстрый старт - Loan Management System (MVP)

## 📋 Описание проекта
Система управления кредитами с тремя ролями пользователей: Клиент (Customer), Агент (Agent), и Администратор (Admin).

## 🚀 ВАРИАНТ 1: Быстрый запуск БЕЗ Docker (для демонстрации)

### Предварительные требования
- Python 3.7 или выше
- pip3

### Шаги для запуска

#### 1. Установить зависимости
```bash
cd backend
pip3 install -r requirements_dev.txt
```

#### 2. Выполнить миграции базы данных
```bash
python3 manage.py migrate
```

#### 3. Создать администратора
```bash
python3 create_superuser.py
```

**Учетные данные администратора:**
- Email: `admin@loanms.com`
- Пароль: `admin123`
- Роль: ADMIN

#### 4. Запустить сервер
```bash
python3 manage.py runserver 0.0.0.0:8000
```

#### 5. Открыть в браузере
- API: http://127.0.0.1:8000/api/
- Админ-панель: http://127.0.0.1:8000/admin/

---

## 🐳 ВАРИАНТ 2: Запуск с Docker (полная версия с PostgreSQL)

### Предварительные требования
- Docker 20.10.x
- docker-compose 1.29.x

### Шаги для запуска

#### 1. Собрать Docker образ
```bash
cd backend
docker build --force-rm -t backend:latest .
```

#### 2. Запустить базу данных и сервер
```bash
cd ..
docker-compose up -d
```

#### 3. Выполнить миграции
```bash
docker-compose run --rm apis python manage.py makemigrations user
docker-compose run --rm apis python manage.py makemigrations loan
docker-compose run --rm apis python manage.py migrate
```

#### 4. Создать администратора
```bash
docker-compose run --rm apis python manage.py createsuperuser
```

#### 5. Остановить сервер
```bash
docker-compose down --remove-orphans
```

---

## 🔑 Основные функции API

### Роли пользователей:
1. **Customer (Клиент)** - может просматривать свои кредиты
2. **Agent (Агент)** - может создавать заявки на кредиты для клиентов, требует одобрения администратором
3. **Admin (Администратор)** - полный доступ, может одобрять агентов и кредиты

### Основные эндпоинты:

**Base URL:** `http://127.0.0.1:8000/api`

#### Пользователи:
- `POST /user/signup/` - Регистрация (Customer или Agent)
- `POST /user/login/` - Вход в систему
- `GET /user/profile/` - Профиль пользователя
- `POST /user/create-admin/` - Создать администратора (только для Admin)
- `GET /user/list-agent/` - Список клиентов (для Agent/Admin)
- `GET /user/list-approvals/` - Список всех пользователей (только для Admin)
- `PUT /user/approve-delete/<id>/` - Одобрить/удалить агента (только для Admin)

#### Кредиты:
- `POST /loan/customer-loan/` - Создать заявку на кредит (только для Agent)
- `PUT /loan/approve-reject-loan/<id>/` - Одобрить/отклонить кредит (только для Admin)
- `PUT /loan/edit-loan/<id>/` - Редактировать кредит (только для Agent)
- `GET /loan/list-loans-admin-agent/` - Список всех кредитов (для Admin/Agent)
- `GET /loan/list-loans-customer/` - Список кредитов клиента (для Customer)

### Фильтры:
- `?status=NEW` - новые заявки
- `?status=APPROVED` - одобренные
- `?status=REJECTED` - отклоненные

---

## 🧪 Запуск тестов

```bash
# Без Docker
python3 manage.py test

# С Docker
docker-compose run --rm apis python manage.py test
```

---

## 📚 Дополнительная информация

- **Документация API (Postman):** https://documenter.getpostman.com/view/9835426/Tzm5FwLV
- **Аутентификация:** JWT токены (действительны 2 часа)
- **Безопасность:** Пароли хэшируются с использованием PBKDF2 + SHA256
- **История:** Все изменения кредитов логируются для отката

---

## 🎓 Для демонстрации преподавателю

1. **Запустите** проект используя ВАРИАНТ 1 (быстрый старт)
2. **Откройте** админ-панель: http://127.0.0.1:8000/admin/
3. **Войдите** с учетными данными:
   - Email: `admin@loanms.com`
   - Пароль: `admin123`
4. **Покажите** основные функции через Postman или другой API клиент
5. **Используйте** документацию API для примеров запросов

---

## 📝 Примечания

- **SQLite** используется для быстрой разработки (ВАРИАНТ 1)
- **PostgreSQL** используется для полноценной production версии (ВАРИАНТ 2)
- Проект автоматически определяет какую БД использовать на основе переменных окружения
- Для production использования рекомендуется Docker версия с PostgreSQL

---

## 🛠️ Технологии
- Django 3.2.5
- Django REST Framework 3.12.4
- JWT Authentication
- PostgreSQL / SQLite
- Docker & Docker Compose
- Simple History (для логирования изменений)
