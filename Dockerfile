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


# Usa una imagen base de nginx para servir el archivo HTML
FROM nginx:latest

# Copia el archivo HTML generado al directorio de trabajo del servidor nginx
COPY --from=builder /app/holamundo.html /usr/share/nginx/html/

# Expone el puerto en el que el servidor web estará escuchando
EXPOSE 8010
