# Usa una imagen base de Python para compilar el archivo Python y generar el HTML
FROM python:latest AS builder

# Copia el archivo Python al directorio de trabajo del contenedor
COPY hola_mundo.py /app/

# Establece el directorio de trabajo
WORKDIR /app

# Compila el archivo Python para generar holamundo.html
RUN python3 hola_mundo.py

# Copia el archivo HTML generado al directorio de trabajo del contenedor
COPY holamundo.html /app/

# Usa la misma imagen base de Python para servir el archivo HTML directamente
FROM python:latest

# Copia el archivo HTML generado al directorio de trabajo del contenedor
COPY --from=builder /app/holamundo.html /app/

# Establece el directorio de trabajo
WORKDIR /app

# Expone el puerto en el que el servidor web estará escuchando
EXPOSE 8010

# Ejecuta un servidor web Python para servir el archivo HTML
CMD ["python", "-m", "http.server", "8010"]
