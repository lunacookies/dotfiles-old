#!/usr/bin/env bash

# Create ~/.config if it doesn't exist yet
mkdir -p $HOME/.config

# Get into the dotfiles repository
cd ~/dotfiles/files

for file in *; do
  # Delete old links if they exist
  if [ -e $HOME/.$file ]; then
    rm -rf $HOME/.$file
  fi

  # Link the file
  ln -s $PWD/$file $HOME/.$file
done
