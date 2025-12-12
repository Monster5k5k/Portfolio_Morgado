#!/bin/bash

config_nginx() {
    # Iniciamos nginx en segundo plano
    nginx &
}

load_entrypoint_base(){
    # Llamamos al script de la capa anterior (Base)
    bash /root/admin/base/start.sh
}

main(){
    load_entrypoint_base
    config_nginx
    # En esta capa intermedia no ponemos el tail -f para permitir herencia,
    # o si se usa sola, Docker la mantendrá si el comando final lo hace.
}

main