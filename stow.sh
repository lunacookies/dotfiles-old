#!/usr/bin/env bash

cd ~/dotfiles

# Un- and re-stow .config dotfiles
echo "Unstowing XDG Base Directory-compliant dotfiles"
stow -D --target=$HOME/.config xdg
echo "Restowing XDG Base Directory-compliant dotfiles"
stow --target=$HOME/.config xdg

cd home

# Un- and re-stow dotfiles in ~/
for homeconf in *
do
  echo "Unstowing $homeconf"
  stow -D --target=$HOME $homeconf
  echo "Restowing $homeconf"
  stow --target=$HOME $homeconf
done

