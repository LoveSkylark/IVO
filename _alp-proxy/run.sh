#!/bin/bash

docker build -t $1.$2 . || exit 1

docker run -it  \
	--privileged \
	--publish 8888:8888 \
	--name $1$2  $1.$2