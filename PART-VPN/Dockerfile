FROM archlinux/archlinux:latest

LABEL Maintainer = LoveSkylark 


# Setup the builder
RUN pacman -Syu --needed --noconfirm \
    gcc \
    make \
    git \
    patch \
    binutils

RUN pacman -Syu --needed --noconfirm \
    openconnect \
    sudo \
    fakeroot

RUN pacman -Syu --needed --noconfirm \
    python \
    python-attrs \
    python-colorama \
    python-jaraco.classes \
    python-keyring \
    python-lxml \
    python-prompt_toolkit \
    python-pyqt5 \
    # python-pyqtwebengine \
    python-pysocks \
    python-pyxdg \
    python-requests \
    python-structlog \
    python-toml \
    python-setuptools \
    python-pytest \
    python-pytest-asyncio \
    python-pyxdg

# Setup X11 forwarding
ENV DISPLAY=host.docker.internal:0

# makepkg user and workdir
ARG user=makepkg
RUN useradd --system --create-home $user \
  && echo "$user ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/$user
USER $user
WORKDIR /home/$user

# Install yay
RUN git clone https://aur.archlinux.org/yay.git \
  && cd yay \
  && makepkg -sri --needed --noconfirm > build.log \
  && cat build.log \
  && cd \
  # Clean up
  && rm -rf .cache yay
  
RUN yay -Syu --noconfirm \
  && yay -S --noconfirm openconnect-sso \
  && yay -Sc --noconfirm

# Clean up unnecessary packages
RUN sudo pacman -Rns --noconfirm gcc make patch binutils

# Clean up build artifacts
RUN rm -rf yay

# Clean up package cache
RUN sudo pacman -Sc --noconfirm
