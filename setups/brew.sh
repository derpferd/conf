#!/bin/bash

if ! [ -x "$(command -v brew)" ]; then
  echo 'Installing brew...'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo 'Checking for brew updates...'
brew update
brew upgrade

brew_commands=( "go" "lazygit" "neovim" "nvm" "jq" )

for cmd in "${brew_commands[@]}"
do
    if ! [ -x "$(command -v $cmd)" ]; then
      echo "Installing '$cmd' from brew..."
      brew install "$cmd"
    fi
done
