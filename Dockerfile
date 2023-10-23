FROM archlinux/archlinux:base-devel
LABEL Maintainer = LoveSkylark 

RUN pacman -Syu --needed --noconfirm \
    git \
    openconnect \
    openssh \
    sudo \ 
    dnsmasq \
    # inetutils \
    # inetutils-ping \
    net-tools \
    lsof \
    wget \
    curl \
    # telnet \
    bind-tools
    
RUN pacman -Syu --needed --noconfirm \
    python \
    python-attrs \
    python-colorama \
    python-jaraco.classes \
    python-keyring \
    python-lxml \
    python-prompt_toolkit \
    python-pyqt5 \
    python-pyqtwebengine \
    python-pysocks \
    python-pyxdg \
    python-requests \
    python-structlog \
    python-toml \
    python-setuptools \
    python-pytest \
    python-pytest-asyncio \
    python-pyxdg

# Setup SSH server
RUN ssh-keygen -A && echo 'root:password' | chpasswd

# COPY sshd_config /etc/ssh/sshd_config

RUN systemctl enable sshd
EXPOSE 22


# Setup X11 forwarding
ENV DISPLAY=host.docker.internal:0
EXPOSE 5900


# makepkg user and workdir
ARG user=makepkg
RUN useradd --system --create-home $user \
  && echo "$user ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/$user
USER $user
WORKDIR /home/$user

# Install yay
RUN git clone https://aur.archlinux.org/yay.git \
  && cd yay \
  && makepkg -sri --needed --noconfirm \
  && cd \
  # Clean up
  && rm -rf .cache yay
RUN yay -Syu --noconfirm
RUN yay -S openconnect-sso --noconfirm
