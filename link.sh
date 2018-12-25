#!/usr/bin/env bash

cd ~/dotfiles

# Define a function that links a given file to a given location and
# automatically removes the target file if it exists
linkrc() {
  local rcpath="$2$1"

  # Link the rc
  #
  # -s: Make symbolic link
  # -h: Do not follow a symlink that may be present at the target
  # -F: Overwrite target
  ln -shF $PWD/$1 $rcpath
}

# Link [every file in the etc/ directory that needs to be in $HOME] to $HOME
for rc in *rc git* editorconfig ; do
    linkrc $rc "$HOME/." &
done

# Link my scripts to $HOME
linkrc "bin" "$HOME/"
