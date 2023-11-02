FROM alpine

ENV DISPLAY=host.docker.internal:0.0

# Browser setup
RUN apk --update --no-cache add \
    openssh \
    sudo \
    rsync

COPY entrypoint.sh /entrypoint.sh
COPY sshd_config /etc/ssh/sshd_config
RUN mkdir -p /data/ssh/


EXPOSE 22

# Create VPN user
ARG USER=vpn
RUN adduser -D $USER \
  && echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
  && echo "$USER:$USER" | chpasswd

USER $USER
WORKDIR /home/$USER

RUN rm -rf /var/cache/apk/*

ENTRYPOINT ["/entrypoint.sh"] 
