FROM ubuntu
ARG USUARIO
ARG PASSWORD
RUN apt update && apt install -yq --no-install-recommends \
    nano \
    git curl wget \
    inputils-ping net-tools \
    sudo
RUN useradd -rm -d /home/${USUARIO} -s /bin/bash ${USUARIO}
RUN echo "${USUARIO}:${PASSWORD}" | chpasswd
RUN echo "Bienvenido ${USUARIO}" > /home/${USUARIO}/hello.txt