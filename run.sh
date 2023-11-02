#!/bin/bash

docker build -t $1.$2 .

docker run -it  \
	-v ~/.ssh/IVO-RSA-KEY.pub:/home/vpn/.ssh/authorized_keys \
	--privileged \
	--publish 2222:2222 \
	--publish 8888:8888 \
	--name $1$2  $1.$2