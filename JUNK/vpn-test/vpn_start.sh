#!/bin/bash

# Start virtual framebuffer
Xvfb :1 -ac &

# Launch VPN GUI
xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f /dev/stdout nmerge -

openconnect-gui --profile=/home/vpnuser/vpn_profile.xml &

tail -f /var/log/openconnect.log  