FROM ubuntu:22.04

RUN apt-get update -y

RUN apt-get install -y \
  xvfb \
  x11-apps \
  xauth

RUN apt-get install -y libgtk-3-0 libxtst6 libgconf-2-4 libnss3 \
  libasound2 libxrandr2 libxss1 libxext6 libgbm1 libx11-xcb1 \
  libgl1 libgles2 libwayland-egl1-mesa 

RUN apt-get install -y \
  openconnect \
  openconnect-gui

# Create user for VPN application
RUN useradd -ms /bin/bash vpnuser

# Copy files
COPY vpn_profile.xml /home/vpnuser/vpn_profile.xml
COPY vpn_start.sh /home/vpnuser/vpn_start.sh

RUN apt-get install -y \
  xvfb \
  x11-apps \
  xauth
  
# Setup X11 forwarding
ENV DISPLAY=host.docker.internal:0
EXPOSE 5900

# Autostart VPN GUI on container start  
USER vpnuser
ENTRYPOINT ["/bin/bash", "/home/vpnuser/vpn_start.sh"]

