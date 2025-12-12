# 1. Heredamos de TU Nginx (que acabamos de crear en el paso 1)
FROM linas/swebngnix

# 2. Instalamos Node.js (Versión actual para que funcione Vite)
RUN apt update && apt install -yq curl ca-certificates && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt install -yq nodejs

# 3. Preparamos carpetas
RUN mkdir -p /root/admin/node
# Adaptamos la ruta a TU proyecto
RUN mkdir -p /root/admin/node/proyecto/mi-web-tarkov

WORKDIR /root/admin/node

# 4. Copiamos TU código fuente
COPY ./proyecto/mi-web-tarkov/ /root/admin/node/proyecto/mi-web-tarkov

# 5. Copiamos el script de arranque de esta capa
COPY ./dockerfiles/snode/admin/start.sh .
RUN chmod +x ./start.sh

ENTRYPOINT [ "./start.sh" ]