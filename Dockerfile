FROM alpine

ENV DISPLAY=host.docker.internal:0.0
ARG USER=vpn

ENV SERVER="" 
ENV OPTIONS=""
ENV PROTOCOL=""

# Browser setup
RUN apk --update --no-cache add \
    firefox-esr \
    ttf-dejavu \
    ttf-liberation \
    openconnect \
    openssh \
    sudo \
    tinyproxy \
    python3 \
    py3-pip \
    build-base \
    make \
    musl-dev \
    python3-dev \
    py3-qt5 \
    py3-qtwebengine \
    cairo-dev \
    gobject-introspection-dev \
    webkit2gtk

# OPENCONNECT-SSO
RUN pip3 install https://github.com/dlenski/gp-saml-gui/archive/master.zip

# PROXY
RUN sed -i -e '/^Allow /s/^/#/' \
    -e '/^ConnectPort /s/^/#/' \
    -e '/^#DisableViaHeader /s/^#//' \
    /etc/tinyproxy/tinyproxy.conf
VOLUME /etc/tinyproxy
EXPOSE 8888

# SSH
COPY sshd_config /etc/ssh/sshd_config
RUN mkdir -p /data/ssh/
EXPOSE 2222

#Cleanup
RUN rm -rf /var/cache/apk/*

# Create VPN user
RUN adduser -D $USER && \
    echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    echo "$USER:$USER" | chpasswd

USER $USER
WORKDIR /home/$USER

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
