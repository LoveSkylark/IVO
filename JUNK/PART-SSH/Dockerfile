FROM archlinux/archlinux:latest

LABEL Maintainer = LoveSkylark 


# Setup the builder
RUN pacman -Syu --needed --noconfirm \
    gcc \
    make \
    git \
    patch \
    openssh \
    binutils

RUN pacman -Syu --needed --noconfirm \
    openconnect \
    sudo \
    fakeroot \
    systemd

RUN sudo ssh-keygen -A

COPY sshd_config /etc/sshd/sshd_config
COPY sshd.service /etc/systemd/system/sshd.service
RUN systemctl enable sshd.service
EXPOSE 8000 2222

RUN echo "root:VPNDocker!" | chpasswd 

RUN echo "Hello"