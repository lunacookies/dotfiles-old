#!/usr/bin/env bash

# Get into the dotfiles repository
cd ~/dotfiles


##
## Un- and re-stow .config dotfiles
##

# We unstow and restow the dotfiles to prevent conflicts down the road
echo "Unstowing XDG Base Directory-compliant dotfiles"
stow --delete --target=$HOME/.config xdg
echo "Restowing XDG Base Directory-compliant dotfiles"
stow --target=$HOME/.config xdg


##
## Un- and re-stow dotfiles in ~/
##

# Get us to the root of the directories we will be stowing
cd home

for homeconf in *
do
  # We use basename because stow isn't smart enough to remove the trailing slash
  # for us; it throws an error when a path that has been passed to it contains
  # a slash.
  dirname=$(basename $homeconf)
  echo "Unstowing $dirname"
  stow --delete --target=$HOME $dirname
  echo "Restowing $dirname"
  stow --target=$HOME $dirname
done

