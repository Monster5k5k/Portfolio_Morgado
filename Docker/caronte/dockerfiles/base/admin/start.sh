#!/bin/bash
set -e

source /root/admin/base/usuario/mainusuario.sh
source /root/admin/base/ssh/mainssh.sh

main () {
    # Función para crear un nuevo usuario
    newUser
    # Función para configurar SSH
    configurar_ssh
    config_sudoers
    # PARA QUE EL CONTENEDOR NO SE CIERRE
    tail -f /dev/null
}

main