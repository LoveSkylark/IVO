#!/bin/bash

ID=""
SERVER=""
PROTOCOL=""
OPTIONS=""
NAME=""
KEY="~/.ssh/IVO-RSA-KEY.pub"

while getopts ":n:i:s:p:o:" opt; do
  case $opt in
    n)
      NAME=$OPTARG
      ;;
    i)
      ID=$OPTARG
      ;;
    s)
      SERVER=$OPTARG
      ;;
    p)
      PROTOCOL=$OPTARG
      ;;
    o)
      OPTIONS=$OPTARG
      ;;
    k)
      KEY=$OPTARG
      ;;      
    ?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done
if [ -z "$NAME" ]; then
  echo "Container name is required example: -n newname" >&2
  exit 1
fi

SSH_PORT=$((2200+ID))
PROXY_PORT=$((8800+ID))

if ! [[ $ID =~ ^[0-9]{1,2}$ ]]; then
  echo "ID must be a number between 0-99" >&2
  exit 1
fi

docker run \
  -v "$KEY":/home/vpn/.ssh/authorized_keys \
  -e SERVER="$SERVER" \
  -e PROTOCOL="$PROTOCOL" \
  -e OPTIONS="$OPTIONS" \
  --privileged \
  --publish $SSH_PORT:2222 \
  --publish $PROXY_PORT:8888 \
  --name $NAME \
  loveskylark/ivo:latest \