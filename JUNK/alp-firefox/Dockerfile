FROM alpine

ENV DISPLAY=host.docker.internal:0.0

# Browser setup
RUN apk add --no-cache firefox-esr \
    ttf-dejavu \
    ttf-liberation

# Create VPN user
ARG USER=vpn
RUN adduser -D $USER && \
    echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    echo "$USER:$USER" | chpasswd

USER $USER
WORKDIR /home/$USER


# CMD firefox-esr --no-sandbox --in-process-gpu