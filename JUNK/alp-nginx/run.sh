#!/bin/bash

docker build -t $1.$2 .

docker run -it  \
	--privileged \
	--publish 4443:4443 \
	--name $1$2  $1.$2