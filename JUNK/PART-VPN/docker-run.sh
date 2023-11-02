#!/bin/bash
docker run -it \
  --privileged \
  --name VPN-part \
  --net bridge \
  vpnpart:1.0.0
