# Dockerfile

# Usa una imagen base de Python
FROM python:latest

# Copia el archivo Python al directorio de trabajo del contenedor
COPY hola_mundo.py /app/

# Establece el directorio de trabajo
WORKDIR /app

# Ejecuta el script Python al iniciar el contenedor
CMD ["python", "hola_mundo.py"]
