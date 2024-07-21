# Etapa de construcción
FROM python:3.9 as build

WORKDIR /app

COPY requirements.txt .

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev

RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Etapa final
FROM python:3.9

WORKDIR /app

COPY --from=build /opt/venv /opt/venv
COPY --from=build /app /app

ENV PATH="/opt/venv/bin:$PATH"

COPY . .

RUN python manage.py collectstatic --noinput

EXPOSE 8000

CMD ["gunicorn", "dealer_project.wsgi:application", "--bind", "0.0.0.0:8000"]
