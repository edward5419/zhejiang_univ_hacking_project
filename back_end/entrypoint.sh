python manage.py makemigrations
python manage.py migrate

python manage.py runserver 0.0.0.0:8001

# gunicorn DjangoApi.wsgi:application --bind 0.0.0.0:8000