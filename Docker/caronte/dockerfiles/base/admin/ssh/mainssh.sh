#!/bin/bash

configurar_ssh() {

  # 1. Deshabilitar el login de root
  sed -i 's/#PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config

  # 2. Cambiar el puerto de SSH
  sed -i 's/#Port.*/Port '$PORT_SSH'/' /etc/ssh/sshd_config
  # 3. Configurar la autenticación por clave pública
  mkdir -p /var/run/sshd
  ssh-keygen -A
  # 4. Reiniciar el servicio SSH para que se aplique las configuraciones
  service ssh restart

}