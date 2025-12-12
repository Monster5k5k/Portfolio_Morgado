# Usamos una imagen real de Node, no la de Nginx
FROM node:22-alpine

# Instalamos bash y ssh por si quieres entrar luego
RUN apk add --no-cache bash openssh

# Creamos la carpeta de la app
WORKDIR /app

# Copiamos los archivos de configuración desde la ruta del contexto
# (Docker lo busca en Docker/caronte/proyecto/mi-web-tarkov/)
COPY proyecto/mi-web-tarkov/package*.json ./

# Instalamos las dependencias
RUN npm install

# Copiamos el resto del código de la web
COPY proyecto/mi-web-tarkov/ .

# Exponemos el puerto de Vite (5173) y el de SSH (22)
EXPOSE 5173 22

# Arrancamos Vite aceptando conexiones externas
CMD ["npm", "run", "dev"]