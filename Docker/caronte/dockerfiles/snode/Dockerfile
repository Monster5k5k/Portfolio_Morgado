# Docker/caronte/dockerfiles/snode/Dockerfile

FROM node:18-alpine

# Instalamos bash y openssh para que funcione tu script de inicio base si lo usas, 
# o simplemente para poder entrar por SSH si lo necesitas.
RUN apk add --no-cache bash openssh

WORKDIR /app

# Copiamos package.json usando la ruta relativa desde el contexto (caronte)
# La ruta es: proyecto/mi-web-tarkov/package.json
COPY proyecto/mi-web-tarkov/package*.json ./

RUN npm install

# Copiamos el resto del código
COPY proyecto/mi-web-tarkov/ .

EXPOSE 5173 22

# Arrancamos Vite
CMD ["npm", "run", "dev", "--", "--host"]