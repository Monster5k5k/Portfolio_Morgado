FROM ubuntu:22.04

ARG USUARIO
ARG PASSWORD

# Instalar utilidades básicas
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    nano \
    git \
    curl \
    wget \
    iputils-ping \
    net-tools \
    sudo && \
    rm -rf /var/lib/apt/lists/*

# Crear usuario y establecer contraseña
RUN useradd -rm -d /home/${USUARIO} -s /bin/bash ${USUARIO} && \
    echo "${USUARIO}:${PASSWORD}" | chpasswd && \
    echo "${USUARIO} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Crear un archivo de bienvenida
RUN echo "Bienvenido ${USUARIO}" > /home/${USUARIO}/hello.txt && \
    chown ${USUARIO}:${USUARIO} /home/${USUARIO}/hello.txt

# Cambiar al nuevo usuario
USER ${USUARIO}
WORKDIR /home/${USUARIO}