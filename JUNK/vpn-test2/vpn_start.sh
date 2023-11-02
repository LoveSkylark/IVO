#!/bin/bash
openconnect --authgroup="Default Secure" \
  --user="$VPN_USER" \
  --hostname="$VPN_HOST"


#openconnect -u ${VPN_USER} -p ${VPN_PASS} -p AnyConnect ${VPN_PASS}
#tail -f /var/log/openconnect.log  