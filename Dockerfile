# Usar una imagen base oficial de Python
FROM python:3.9 AS build

# Establecer el directorio de trabajo en el contenedor
WORKDIR /app

# Copiar los requisitos a la imagen del contenedor
COPY requirements.txt .

# Instalar las dependencias del sistema necesarias
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev

# Crear y activar un entorno virtual
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Instalar las dependencias de Python
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copiar el contenido de la aplicación a la imagen del contenedor
COPY . .

# Ejecutar colectar archivos estáticos
RUN python manage.py collectstatic --noinput

# Etapa final
FROM python:3.9

WORKDIR /app

COPY --from=build /opt/venv /opt/venv
COPY --from=build /app /app

ENV PATH="/opt/venv/bin:$PATH"

EXPOSE 8000

CMD ["gunicorn", "dealer_project.wsgi:application", "--bind", "0.0.0.0:8000"]
