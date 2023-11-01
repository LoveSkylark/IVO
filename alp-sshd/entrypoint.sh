#!/bin/sh
set -eu

echo "Starting SSH key generation"

if [ ! -f /data/ssh/ssh_host_rsa_key ]; then
    echo "Generating RSA key"
    sudo ssh-keygen -t rsa -b 4096 -f /data/ssh/ssh_host_rsa_key -N ''
    if [ $? -eq 0 ]; then
        echo "RSA key generated"
    else
        echo "RSA key generation failed!"
        exit 1 
    fi
fi

if [ ! -f /data/ssh/ssh_host_ecdsa_key ]; then
    echo "Generating ECDSA key" 
    sudo ssh-keygen -t ecdsa -b 521 -f /data/ssh/ssh_host_ecdsa_key -N ''
    if [ $? -eq 0 ]; then
        echo "ECDSA key generated"
    else
        echo "ECDSA key generation failed!"
        exit 1
    fi  
    
fi

if [ ! -f /data/ssh/ssh_host_ed25519_key ]; then
    echo "Generating ED25519 key" 
    sudo ssh-keygen -t ed25519 -b 4096 -f /data/ssh/ssh_host_ed25519_key -N ''
    if [ $? -eq 0 ]; then
        echo "ED25519 key generated"
    else
        echo "ED25519 key generation failed!"
        exit 1
    fi  
fi

echo "Setting key file permissions"
sudo chmod o+r /data/ssh/ssh_host*_key

exec /usr/sbin/sshd -D