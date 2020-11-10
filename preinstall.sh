#!/bin/bash

sudo apt install -y zsh tmux neovim python3-neovim

ZSH=$(which zsh)
if [[ "$SHELL" != "$ZSH" ]]; then
 chsh -s $ZSH
fi

#if [ ! -d "$HOME/.pyenv" ]; then
# git clone https://github.com/pyenv/pyenv.git ~/.pyenv
#fi


#curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
