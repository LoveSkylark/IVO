#!/bin/sh

set -eu

if [ ! -f ~/.ssh/IVO-RSA-KEY ]; then
    echo "Generating RSA key for Jumpbox connection"
    sudo ssh-keygen -t rsa -b 4096 -f ~/.ssh/IVO-RSA-KEY -N ''
    if [ $? -eq 0 ]; then
        echo "RSA key generated"
    else
        echo "RSA key alredy exists"
        exit 1 
    fi
fi
