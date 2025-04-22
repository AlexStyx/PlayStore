# 📦 PlayStore App

## Описание

**PlayStore** — это e-commerce платформа для игр и аксессуаров. Приложение включает мобильный клиент на **SwiftUI**, а также backend на **Go** с базой данных **PostgreSQL**.

Цель — предоставить покупателям и продавцам удобный интерфейс для взаимодействия с товарами: покупка, продажа, сортировка, управление профилем и объявлениями.

---

## 🔧 Технологический стек

### iOS-клиент

- `SwiftUI` — UI и навигация
- `SwiftData` — локальное хранилище
- `Combine` — реактивная логика
- `MVVM` — архитектура
- `NavigationStack + path` — управление переходами

### Backend

- `Go 1.20+`
- `Gin` — HTTP-фреймворк
- `PostgreSQL` — СУБД
- `GORM` — ORM
- `JWT` (в планах) — аутентификация
- `Docker` (в планах) — контейнеризация

---

## 📁 Структура проекта

### 📱 iOS

```plaintext
.
├── Models
│   └── User.swift
├── Views
│   ├── ContentView.swift
│   ├── AuthView.swift
│   ├── MainTabView.swift
│   └── ProfileView.swift
├── Utils
│   └── Screen.swift
```

### 🌐 Backend

```plaintext
.
├── main.go
├── controllers/
│   └── auth.go
│   └── user.go
├── models/
│   └── user.go
├── routes/
│   └── routes.go
├── database/
│   └── connection.go
```

---

## 💡 Ключевые функции

| Пользователь | Цель | Функциональность |
|--------------|------|------------------|
| Покупатель | Найти товар | Поиск, карточка товара, сортировка |
| Покупатель | Сохранить товар | Добавление в корзину |
| Продавец | Выставить товар | Форма добавления, управление объявлениями |
| Все | Иметь доступ к профилю | Авторизация, регистрация, редактирование профиля |
| Все | Увидеть фото и описание | Карточка товара с изображениями |

---

## 🔐 Backend API

| Метод | Endpoint | Описание |
|-------|----------|----------|
| `POST` | `/register` | Регистрация |
| `POST` | `/login` | Авторизация |
| `GET` | `/profile/:id` | Получить профиль |
| `PUT` | `/profile/:id` | Обновить профиль |
| `POST` | `/ads` | Добавить объявление |
| `GET` | `/ads` | Получить список объявлений |
| `PUT/DELETE` | `/ads/:id` | Обновить / Удалить объявление |

---

## 🧪 Пример модели пользователя

### SQL

```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    user_type TEXT NOT NULL CHECK (user_type IN ('buyer', 'seller')),
    created_at TIMESTAMP DEFAULT now()
);
```

### Go-модель (GORM)

```go
type User struct {
    ID        uint      `gorm:"primaryKey"`
    Email     string    `gorm:"unique;not null"`
    Password  string    `gorm:"not null"`
    UserType  string    `gorm:"not null"`
    CreatedAt time.Time
}
```

---

## 🚀 Локальный запуск

### iOS

- Открыть `.xcodeproj` или `.xcodeworkspace`
- Запустить на симуляторе iOS 17+
- Требуется macOS 13+, Xcode 15+

### Backend

```bash
go mod tidy
go run main.go
```

**Требования:**

- Go 1.20+
- PostgreSQL 14+
- Установить переменные окружения или .env файл для БД

---

## 🔄 План расширения

- 🔜 Уведомления (Push/Local)
- 🔜 JWT аутентификация
- 🔜 Подключение к backend через `URLSession` или `Alamofire`
- 🔜 Docker-файл для backend
- 🔜 Синхронизация SwiftData с сервером

---

## 📌 Полезные ссылки

- [GORM Docs](https://gorm.io/docs/)
- [Gin Framework](https://github.com/gin-gonic/gin)
- [SwiftData Guide](https://developer.apple.com/documentation/swiftdata/)

---

## 📄 Лицензия

MIT License — свободно использовать и развивать.

