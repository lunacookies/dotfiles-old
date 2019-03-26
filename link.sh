#!/usr/bin/env bash

cd ~/dotfiles

# Function for removing a directory/file only if it exists
rmifexists() {
  local target="$1"
  [ -e "$target" ] && rm -r "$target"
}

# Remove ~/.config because the only program that I use that keeps its config in
# there is Nvim, and its config is only a symlink that is generated later
# anyway.
rmifexists "$HOME/.config"

# Define a function that links a given file to a given location and
# automatically removes the target file if it exists
linkrc() {
  local rcpath="$2$1"

  # Link the rc
  #
  # -s: Make symbolic link
  # -h: Do not follow a symlink that may be present at the target
  # -F: Overwrite target
  ln -shF "$PWD/$1" "$rcpath"
}

# Link every file that needs to be in $HOME to $HOME
for rc in *rc *.conf git* editorconfig ; do
    linkrc $rc "$HOME/." &
done

# Link my scripts to $HOME
linkrc "bin" "$HOME/"

# Link Vimfiles to $HOME/.vim and remove any existing ones
rmifexists "$HOME/.local/share/nvim/swap"
rmifexists "$HOME/.vimrc"
linkrc "vim" "$HOME/."

# Link Nvim configuration
mkdir -p "$HOME/.config/nvim"
ln -shF "$PWD/vim/vimrc" "$HOME/.config/nvim/init.vim"
