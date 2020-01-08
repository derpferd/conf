#!/bin/bash

if ! [ -x "$(command -v brew)" ]; then
  echo 'Installing brew...'
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew tap amazon/amazon "ssh://git.amazon.com/pkg/HomebrewAmazon"
fi

echo 'Checking for brew updates...'
brew update
brew upgrade

brew_commands=( "ninja-dev-sync" "nvm" "tig" "jq" )

for cmd in "${brew_commands[@]}"
do
    if ! [ -x "$(command -v $cmd)" ]; then
      echo "Installing '$cmd' from brew..."
      brew install "$cmd"
    fi
done
