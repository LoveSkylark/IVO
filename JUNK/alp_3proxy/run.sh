#!/bin/bash

docker build -t $1.$2 . || exit 1

docker run -it  \
	--privileged \
	--publish 8080:8080 \
	--publish 4443:4443 \
	--name $1$2  $1.$2