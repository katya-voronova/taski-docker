# taski-docker

![taski-docker CI/CD](https://github.com/katya-voronova/taski-docker/actions/workflows/main.yml/badge.svg)

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
POSTGRES_USER=django_user
POSTGRES_PASSWORD=mysecretpassword
POSTGRES_DB=django
DB_HOST=db
DB_PORT=5432
ALLOWED_HOSTS=localhost,127.0.0.1,123.123.123.123,noname.3utilities.com,backend,gateway
```

3. Запуск проекта через Docker Compose

```
docker compose up --build -d
```

4. Применение миграций

```
docker compose exec backend python manage.py migrate
```

5. Статические файлы

Если нужно собрать статические файлы:

```
docker compose exec backend python manage.py collectstatic --noinput
```

6. Проверка работы

Backend: http://localhost:8000/api/

Frontend: http://localhost:8000/

Admin: http://localhost:8000/admin/ (используй суперпользователя, которого нужно создать командой createsuperuser)

## Разработчик 

[Екатерина Воронова](https://github.com/katya-voronova)
