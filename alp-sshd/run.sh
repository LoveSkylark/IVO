#!/bin/bash

docker build -t $1.$2 .

docker run -it  \
	-v ~/.ssh/authorized_keys:/home/vpn/.ssh/authorized_keys \
	--privileged \
	--publish 2222:22 \
	--name $1$2  $1.$2