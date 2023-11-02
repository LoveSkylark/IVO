FROM ubuntu:22.04
LABEL maintainer = Skylark 

ARG VPN-PORTAL_VERSION="1.0.0"

RUN apt-get update -y

RUN apt-get install -y \
    python3 \
    xorg \
    xorg-dev \
    xvfb \
    pip \
    openconnect


# Setup X11 forwarding
ENV DISPLAY=host.docker.internal:0
EXPOSE 5900

# makepkg user and workdir
ARG user=vpn
RUN useradd --system --create-home $user \
#   && mkdir /etc/sudoers.d/ \
#   && echo "$user ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/$user \
  && echo "$user:$user" | chpasswd
USER $user
WORKDIR /home/$user


RUN pip install --user --upgrade pip \
    "openconnect-sso[full]"


# apt-get install libglib2.0-0



# RUN apt-get install -y \
#     make \
#     libgnutls28-dev \
#     libev-dev \
#     liblasso3-dev \
#     libglib2.0-dev \
#     libapr1-dev  

# COPY ocserv/ /vpn/

# CMD ["/bin/bash"]


# # ll
# # WORKDIR /vpn
# # RUN make install

#https://gitlab.com/openconnect/ocserv