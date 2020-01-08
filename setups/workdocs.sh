#!/bin/bash

if ! [ -d "$HOME/WorkDocs" ]; then
  echo 'Install WorkDocs!'
  exit 1
fi

dirs=( "bin" ".notable" "research" "webhome" ".enpass" )

for dir in "${dirs[@]}"
do
  workdoc_dir=$(sed 's/\.//' <<< "$dir")
  if ! [ -d "$HOME/$dir" ]; then
    echo "Creating ~/$dir"
    ln -s "$HOME/WorkDocs/home_backup/$workdoc_dir" "$HOME/$dir"
  fi
done

if ! [ -d "$HOME/Documents/Enpass" ]; then
  echo "Creating Enpass dir..."
  ln -s "$HOME/.enpass" "$HOME/Documents/Enpass"
fi

