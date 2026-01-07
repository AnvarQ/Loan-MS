# 🚀 ЗАПУСК ПРОЕКТА ЧЕРЕЗ VS CODE
## Самый простой способ!

---

## ШАГ 1: Установи VS Code (если нет)

Скачай с официального сайта:
```
https://code.visualstudio.com/
```

Установи с настройками по умолчанию.

---

## ШАГ 2: Установи Python (если нет)

**Windows:**
- Скачай: https://www.python.org/downloads/
- ⚠️ **ВАЖНО:** При установке поставь галочку "Add Python to PATH"!

**macOS/Linux:**
```bash
brew install python3
# или
sudo apt install python3 python3-pip
```

Проверь установку:
```bash
python --version
```

---

## ШАГ 3: Скачай проект

### Вариант A: Через Git (если установлен)
1. Открой VS Code
2. Нажми `Ctrl+Shift+P` (или `Cmd+Shift+P` на Mac)
3. Набери: `Git: Clone`
4. Вставь: `https://github.com/AnvarQ/Loan-MS.git`
5. Выбери папку куда сохранить
6. Нажми "Open" когда появится уведомление

### Вариант B: Скачать ZIP
1. Иди на https://github.com/AnvarQ/Loan-MS
2. Нажми зеленую кнопку "Code" → "Download ZIP"
3. Распакуй куда удобно
4. В VS Code: File → Open Folder → выбери папку `Loan-MS`

---

## ШАГ 4: Открой терминал в VS Code

В VS Code нажми:
- **Windows/Linux:** `Ctrl + \``  (обратная кавычка)
- **macOS:** `Cmd + \``

Или через меню: **Terminal → New Terminal**

Внизу откроется встроенный терминал! 🎉

---

## ШАГ 5: Перейди в папку backend

В терминале VS Code напиши:
```bash
cd backend
```

---

## ШАГ 6: Установи зависимости

```bash
pip install -r requirements_dev.txt
```

**Если ошибка "pip not found":**
```bash
python -m pip install -r requirements_dev.txt
```

**Или попробуй:**
```bash
pip3 install -r requirements_dev.txt
```

Подождите 1-2 минуты пока установятся все библиотеки.

---

## ШАГ 7: Создай базу данных

```bash
python manage.py migrate
```

Должно появиться:
```
Running migrations:
  Applying contenttypes.0001_initial... OK
  Applying user.0001_initial... OK
  ...
```

---

## ШАГ 8: Создай администратора

```bash
python create_superuser.py
```

Должно появиться:
```
Superuser created successfully!
Email: admin@loanms.com
Password: admin123
```

---

## ШАГ 9: ЗАПУСТИ СЕРВЕР! 🎉

```bash
python manage.py runserver
```

**Должно появиться:**
```
Starting development server at http://127.0.0.1:8000/
Quit the server with CTRL-BREAK.
```

---

## ШАГ 10: Открой в браузере

### Вариант 1: Обычный способ
Открой браузер и иди на:
```
http://127.0.0.1:8000/admin/
```

### Вариант 2: Через VS Code (удобнее!)
1. В терминале найди строку: `http://127.0.0.1:8000/`
2. Наведи мышкой на эту ссылку
3. Нажми `Ctrl+Click` (Windows/Linux) или `Cmd+Click` (Mac)
4. Откроется в браузере автоматически!

**Логин:**
- Email: `admin@loanms.com`
- Password: `admin123`

---

## 🎯 КРАТКАЯ ВЕРСИЯ (Шпаргалка)

```bash
# В терминале VS Code:
cd backend
pip install -r requirements_dev.txt
python manage.py migrate
python create_superuser.py
python manage.py runserver

# Открыть: http://127.0.0.1:8000/admin/
# Логин: admin@loanms.com / admin123
```

---

## 🔧 ПОЛЕЗНЫЕ РАСШИРЕНИЯ VS CODE

Установи для удобства (необязательно):

1. **Python** (Microsoft) - подсветка синтаксиса
   - В VS Code: Extensions (Ctrl+Shift+X) → найди "Python"

2. **SQLite Viewer** - просмотр базы данных
   - Поиск: "SQLite Viewer"

---

## ❓ ЧАСТЫЕ ПРОБЛЕМЫ

### 1. "python: command not found"
**Решение:**
```bash
python3 manage.py runserver
```

Если и это не работает - переустанови Python с галочкой "Add to PATH"

### 2. Терминал не открывается
**Решение:**
- Меню: Terminal → New Terminal
- Или: View → Terminal

### 3. "No module named django"
**Решение:**
```bash
pip install -r requirements_dev.txt
```

### 4. Порт 8000 занят
**Решение:**
```bash
# Используй другой порт:
python manage.py runserver 8080

# Открой: http://127.0.0.1:8080/admin/
```

### 5. На Windows: PowerShell не дает запустить
**Решение:** Переключи терминал на CMD:
1. Нажми на стрелку вниз возле "+" в терминале
2. Выбери "Command Prompt"

---

## 🧪 КАК ПРОТЕСТИРОВАТЬ (необязательно)

### Запустить тесты:
```bash
# В терминале VS Code:
python manage.py test
```

**Результат:** 60 tests passed ✅

---

## 🎬 КАК ПОКАЗАТЬ ПРЕПОДАВАТЕЛЮ

### 1. Запусти сервер в VS Code:
```bash
cd backend
python manage.py runserver
```

### 2. Покажи терминал с запущенным сервером
- Видно что сервер работает без ошибок

### 3. Открой админ-панель в браузере:
```
http://127.0.0.1:8000/admin/
```

### 4. Покажи разделы:
- ✅ Users (управление пользователями)
- ✅ Loans (управление кредитами)
- ✅ Funds (управление фондами)

### 5. Покажи тесты в VS Code:
```bash
python manage.py test
```

Результат: **60/60 tests passed** ✅

---

## 📂 СТРУКТУРА ПРОЕКТА В VS CODE

```
Loan-MS/                          ← Корневая папка (открой её в VS Code)
├── backend/                      ← Перейди сюда в терминале (cd backend)
│   ├── manage.py                 ← Главный файл для запуска
│   ├── requirements_dev.txt      ← Зависимости для установки
│   ├── create_superuser.py       ← Создание админа
│   ├── db.sqlite3                ← База данных (появится после migrate)
│   ├── backend/
│   │   └── settings.py           ← Настройки проекта
│   ├── user/                     ← Модуль пользователей
│   ├── loan/                     ← Модуль кредитов
│   └── fund/                     ← Модуль фондов
└── ИНСТРУКЦИЯ_VS_CODE.md         ← Эта инструкция
```

---

## 🎨 СОВЕТЫ ДЛЯ VS CODE

### 1. Разделить экран
- Сверху: браузер с админ-панелью
- Снизу: VS Code с кодом и терминалом

### 2. Удобная навигация
- `Ctrl+P` - быстрый поиск файлов
- `Ctrl+Shift+F` - поиск по всем файлам
- `Ctrl+\`` - показать/скрыть терминал

### 3. Несколько терминалов
- Можешь открыть несколько терминалов:
  - Первый: для сервера (`python manage.py runserver`)
  - Второй: для тестов (`python manage.py test`)
- Переключаться между ними через dropdown в терминале

---

## ✅ ЧЕКЛИСТ ПЕРЕД ДЕМОНСТРАЦИЕЙ

В VS Code проверь:

- [ ] Проект открыт в VS Code (File → Open Folder → Loan-MS)
- [ ] Терминал открыт (Ctrl+\`)
- [ ] Зависимости установлены (`pip install -r requirements_dev.txt`)
- [ ] База создана (`python manage.py migrate`)
- [ ] Админ создан (`python create_superuser.py`)
- [ ] Сервер запущен (`python manage.py runserver`)
- [ ] Админ-панель открывается (http://127.0.0.1:8000/admin/)
- [ ] Тесты проходят (`python manage.py test` - 60/60)

---

## 🎉 ГОТОВО!

**Преимущества VS Code:**
- ✅ Всё в одном окне (код + терминал + файлы)
- ✅ Удобная навигация по проекту
- ✅ Подсветка синтаксиса
- ✅ Встроенный Git
- ✅ Можно редактировать код сразу

---

## 📞 ПОМОЩЬ

Если что-то не работает:
1. Проверь что Python установлен: `python --version`
2. Проверь что находишься в папке backend: `cd backend`
3. Переустанови зависимости: `pip install -r requirements_dev.txt`
4. Удали db.sqlite3 и создай заново:
   ```bash
   rm db.sqlite3  # или просто удали файл
   python manage.py migrate
   python create_superuser.py
   ```

---

**Статус:** ✅ Production Ready
**Тесты:** 60/60 passed
**VS Code:** Рекомендуется для удобства!

🚀 **Всё готово к работе!**
