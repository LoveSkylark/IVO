FROM ubuntu:22.04

RUN apt-get update -y

RUN apt-get install -y \
  xvfb \
  x11-apps \
  xauth

# Install libs needed for Azure AD auth
RUN apt-get install -y libnss3 libsasl2-2 ca-certificates

RUN apt-get install -y \
  openconnect

# Create user for VPN application
RUN useradd -ms /bin/bash vpnuser

# Copy files
COPY vpn_start.sh /home/vpnuser/vpn_start.sh

# Setup X11 forwarding
ENV VPN_HOST=""
ENV VPN_USER=""
ENV VPN_PASS=""
ENV AZURE_TENANT="6aed0be3-a6ff-4c6c-83b5-bb72bdd10088"


ENV DISPLAY=host.docker.internal:0
EXPOSE 5900

# Autostart VPN GUI on container start  
USER vpnuser
ENTRYPOINT ["/bin/bash", "/home/vpnuser/vpn_start.sh"]

