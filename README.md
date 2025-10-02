# taski-docker

Простой TODO-проект с Django (backend), React (frontend) и Nginx gateway.

## Запуск

1. Клонирование репозитория

```
git clone https://github.com/katya-voronova/taski-docker
cd taski-docker
```

2. Настройка окружения

Создать .env файл, например скопировав шаблон:

```
cp .env.example .env
```

Проверить, что там указаны:

```
POSTGRES_USER=your_user
POSTGRES_PASSWORD=your_password
POSTGRES_DB=your_db
DB_HOST=db
DB_PORT=5432
ALLOWED_HOSTS=localhost,127.0.0.1
```
3. Запуск проекта через Docker Compose

```
docker compose up --build -d
```

Это запустит базы данных, backend, frontend и gateway.

4. Применение миграций

Для работы Django нужно выполнить миграции базы данных:

```
docker compose exec backend python manage.py migrate
```

Важно! На локальной машине миграции можно запускать вручную. На сервере они запускаются автоматически через CI/CD (если есть).

5. Статические файлы

Если нужно собрать статические файлы:

```
docker compose exec backend python manage.py collectstatic --noinput
```

Файлы будут доступны через /backend_static внутри контейнера и через volume static.

6. Проверка работы

Backend: http://localhost:8000/api/

Frontend: http://localhost:8000/

Admin: http://localhost:8000/admin/ (используй суперпользователя, которого нужно создать командой createsuperuser)

## Разработчик 

[Екатерина Воронова](https://github.com/katya-voronova)
