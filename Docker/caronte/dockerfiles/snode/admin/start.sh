#!/bin/bash
set -e

# 1. Cargamos la capa anterior (Nginx)
load_entrypoint_nginx(){
    # Nota: verifica que esta ruta coincida con donde copiaste el start de nginx en el paso 1.1
    # En tu Dockerfile de nginx pusiste WORKDIR /root/admin/sweb/nginx, asi que ajustamos:
    bash /root/admin/sweb/nginx/admin/start.sh
}

# 2. Vamos a tu carpeta de proyecto
workdir(){
    cd /root/admin/node/proyecto/mi-web-tarkov
}

# 3. Instalamos y Construimos (Build)
dependencias(){
    echo "Instalando dependencias..."
    npm install
    echo "Construyendo proyecto..."
    npm run build
    
    # IMPORTANTE: Copiamos lo generado (dist) a donde Nginx busca los archivos
    echo "Desplegando en Nginx..."
    cp -r dist/* /var/www/html/
}

# 4. Recargamos Nginx para que muestre la nueva web
nginxreload(){
    service nginx reload
}

main(){
    load_entrypoint_nginx
    workdir
    dependencias
    nginxreload
    # Mantenemos el contenedor vivo
    tail -f /dev/null
}

main