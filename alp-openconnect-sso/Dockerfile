FROM alpine

ENV DISPLAY=host.docker.internal:0.0

# Browser setup
RUN apk --update --no-cache add \
    firefox-esr \
    ttf-dejavu \
    ttf-liberation

# Open Connect Setup
RUN apk --update --no-cache add \
    openconnect \
    sudo \
    python3 \
    py3-pip \
    build-base \
    make \
    musl-dev \
    python3-dev \
    py3-qt5 \
    py3-qtwebengine \
  && pip3 install --upgrade pip openconnect-sso[full]==0.7.3

# Create VPN user
ARG USER=vpn
RUN adduser -D $USER && \
    echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    echo "$USER:$USER" | chpasswd

USER $USER
WORKDIR /home/$USER


# CMD firefox-esr --no-sandbox --in-process-gpu