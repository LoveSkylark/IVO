FROM archlinux/archlinux:latest

RUN pacman -Syu --noconfirm \
    socat \
    dnsutils

# Expose local ports  
EXPOSE 2222 8080

# Forward SSH over VPN
RUN socat TCP4-LISTEN:2222,fork TCP4:"*":22 &

# Forward HTTPS wildcard over VPN
RUN socat TCP4-LISTEN:8080,fork TCP4:"*":443 & 

CMD ["/bin/bash"] 