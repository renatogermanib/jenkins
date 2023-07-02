# Utiliza una imagen base de Ubuntu
FROM ubuntu:latest

# Actualiza el sistema e instala OpenSSH
RUN apt-get update && \
    apt-get install -y openssh-server && \
    apt-get clean

# Configura el servidor SSH para permitir conexiones remotas
RUN mkdir /var/run/sshd
RUN echo 'root:password' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Exponer el puerto 22 para permitir conexiones SSH
EXPOSE 22

# Establecer el comando predeterminado cuando se inicie el contenedor
CMD ["/usr/sbin/sshd", "-D"]
