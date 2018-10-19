#!/usr/bin/env bash

# Create ~/.config if it doesn't exist yet
mkdir -p $HOME/.config

# Get into the dotfiles repository
cd ~/dotfiles

# Define a function that links a given file to a given location and
# automatically removes the target file
rmandlink() {
  local rcpath="$2$1"

  # Delete old links
  rm -rf $rcpath

  # Link the rc
  ln -s $PWD/$1 $rcpath
}

#
# etc
#

cd etc

# Link every file in the etc/ directory to $HOME, apart from the ones that
# follow the XDG Base Directory Spec -- link those to $HOME/.config
for rc in *; do
  if [ $rc = "Apple_Terminal" ] \
    || [ $rc = "git" ] \
    || [ $rc = "iTerm2" ] \
    || [ $rc = "nvim" ] \
    || [ $rc = "stylus" ]; then
    rmandlink $rc "$HOME/.config/"
  else
    rmandlink $rc "$HOME/."
  fi
done

cd ..

#
# bin
#

# Link my scripts to $HOME
rmandlink "bin" "$HOME/"
