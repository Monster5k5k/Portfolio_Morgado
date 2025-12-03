FROM mortviva7/ubbase


USER root
RUN apt update && apt install -yq --no-install-recommends \
    nginx 


RUN chown -R www-data /var/www/html
RUN chmod -R 755 /var/www/html

#instalamos el ngnix/apache en usuario www-data
#el propietario de /var(www(/html debe ser www-data

RUN mkdor -p /var/log/ngnix
EXPOSE 80

RUN mkdir -p /root/admin/sweb/nginx
WORKDIR /root/admin/sweb/nginx
COPY ./dockerfiles/sweb/nginx .
RUN chmod +x /root/admin/sweb/nginx/admin/start.sh

ENTRYPOINT ["./admin/start.sh"]