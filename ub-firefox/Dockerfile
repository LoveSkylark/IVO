ARG VPN-PORTAL_VERSION="1.0.0"

FROM ubuntu:22.04
LABEL Maintainer = Skylark 

RUN apt-get update -y

ENV DISPLAY=host.docker.internal:0.0

# Browser setup
RUN sudo add-apt-repository ppa:mozillateam/ppa
RUN apt-get install -y firefox-esr 


ENV VPN_HOST=""
ENV VPN_USER=""
ENV VPN_PASS=""

ENV USER="vpnuser"
RUN useradd -ms /bin/bash $USER \
  && adduser $USER sudo \
  && echo "$USER:$USER" | chpasswd

USER $USER

CMD firefox-esr --no-sandbox --in-process-gpu