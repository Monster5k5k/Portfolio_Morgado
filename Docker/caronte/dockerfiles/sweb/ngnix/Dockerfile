# 1. Heredamos de TU base (no la de jiahao)
FROM linas/ubbase

USER root

# 2. Instalamos Nginx
RUN apt update && apt install -yq --no-install-recommends \
    nginx

# 3. Permisos para el usuario web
RUN chown -R www-data /var/www/html
RUN chmod -R 755 /var/www/html

# 4. Logs y Puertos
RUN mkdir -p /var/log/nginx
EXPOSE 80

# 5. Preparamos el entorno de admin
RUN mkdir -p /root/admin/nginx
WORKDIR /root/admin/nginx

# Copiamos los scripts de esta capa
COPY ./dockerfiles/sweb/ngnix .
RUN chmod +x /root/admin/sweb/nginx/admin/start.sh

# 6. Arrancamos
ENTRYPOINT ["./admin/start.sh"]