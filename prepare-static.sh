#!/bin/bash
echo "Собираем статику Django..."
docker compose exec backend python manage.py collectstatic --noinput

echo "Копируем статику бэкенда в volume..."
docker compose exec backend cp -r /app/collected_static/. /backend_static/static/

echo "Копируем статику фронтенда в volume..."
docker compose up frontend

echo "Объединяем статику..."
docker compose exec gateway sh -c "
  cp -r /frontend_static/* /staticfiles/ 2>/dev/null || true
  cp -r /backend_static/static/* /staticfiles/static/ 2>/dev/null || true
"

echo "Готово! Статика подготовлена."
