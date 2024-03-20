# Usa una imagen base de Python
FROM python:latest

# Copia el archivo HTML al directorio de trabajo del contenedor
COPY holamundo.html /app/

# Establece el directorio de trabajo
WORKDIR /app

# Expone el puerto en el que el servidor web estará escuchando
EXPOSE 8010

# Ejecuta un servidor web Python para servir el archivo HTML directamente
CMD ["python", "-m", "http.server", "8010"]
