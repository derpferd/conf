#!/bin/bash

if [ ! -d "$HOME/.pyenv" ]; then
 git clone https://github.com/pyenv/pyenv.git ~/.pyenv
fi

if ! [ -x "$(command -v rde)" ]; then
    echo "RDE is not installed! please Install"
    exit 1
fi
