#!/bin/bash

# Update repos
sudo yum update -y

if [ ! -d "$HOME/.pyenv" ]; then
 git clone https://github.com/pyenv/pyenv.git ~/.pyenv
fi

if ! [ -x "$(command -v rde)" ]; then
    echo "RDE is not installed! please Install"
    exit 1
fi

if [ ! -f "$HOME/.ssh/id_rsa" ]; then
    ssh-keygen -t rsa -b 2048
fi

# xrpd setup
sudo yum install -y xrdp x11rdp xorgxrdp
sudo sed -i "s|security_layer=rdp|security_layer=tls|g" /etc/xrdp/xrdp.ini
sudo sed -i "s|certificate=$|certificate=/etc/xrdp/cert.pem|g" /etc/xrdp/xrdp.ini
sudo sed -i "s|key_file=$|key_file=/etc/xrdp/key.pem|g" /etc/xrdp/xrdp.ini
