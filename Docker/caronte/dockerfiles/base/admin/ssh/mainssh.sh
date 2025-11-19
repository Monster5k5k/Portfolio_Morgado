#!/bin/bash

configurar_ssh() {

  # 1. Deshabilitar el login de root
  sed -i 's/#PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config

  # 2. Cambiar el puerto de SSH
  sed -i 's/#Port.*/Port '$PORT_SSH'/' /etc/ssh/sshd_config
  # 3. Configurar las claves SSH para el usuario
  if [ ! d /home/$USUARIO/.ssh ]; then
    mkdir -p /home/$USUARIO/.ssh
    cat /root/datos/id_rsa.pub >> /home/$USUARIO/.ssh/authorized_keys
  fi
  # 4. Reiniciar el servicio SSH para que se aplique las configuraciones
  service ssh restart
  #exec /usr/sbin/sshd -D & #dejar el ssh en background /(2plano)
  mkdir /home/$USUARIO/.ssh
  cat /root/admin/base/common/id_rsa.pub >> /home/$USUARIO/.ssh/authorized_keys

  config_sudoers () {
    if [ -f /etc/sudoers ]
    then
        #comprobar que el ${USUARIO} No existe
        echo "${USUARIO} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
      fi
  }
}