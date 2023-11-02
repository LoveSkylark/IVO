#!/bin/bash
docker run -it --privileged \
  --name ivo-1 \
  --publish 2222:2222 \
  ivo.1