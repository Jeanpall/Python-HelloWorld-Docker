# Usa una imagen base de Python
FROM python:latest

# Copia el archivo Python al directorio de trabajo del contenedor
COPY /home/ubuntu/Python-HelloWorld-Docker/hola_mundo.py /app/

# Compila el archivo Python para generar holamundo.html
RUN python3 hola_mundo.py

# Establece el directorio de trabajo
WORKDIR /app

# Copia el archivo HTML generado al directorio de trabajo del contenedor
COPY /home/ubuntu/Python-HelloWorld-Docker/holamundo.html /app/

# Expone el puerto en el que el servidor web estará escuchando
EXPOSE 8010

# Ejecuta el servidor web para servir el archivo HTML
CMD ["python", "-m", "http.server", "8010"]

