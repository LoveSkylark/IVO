#!/bin/bash
docker run -it --privileged \
  --name TEST \
  --publish 999:22 \
  ico:1.0.11