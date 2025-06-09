FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN python manage.py collectstatic --noinput

EXPOSE 9001

CMD ["gunicorn", "mysite.wsgi:application", "--bind", "0.0.0.0:9001"]
