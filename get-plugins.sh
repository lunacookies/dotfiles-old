#!/usr/bin/env bash

# What plugins we install
plugins=(

alvan/vim-closetag
romainl/vim-cool
romainl/vim-qf
rstacruz/vim-closer
sgur/vim-editorconfig
tpope/vim-commentary
tpope/vim-endwise
tpope/vim-fugitive
tpope/vim-surround
tpope/vim-unimpaired

cakebaker/scss-syntax.vim
hail2u/vim-css3-syntax
kchmck/vim-coffee-script
lifepillar/vim-colortemplate
othree/html5.vim
pangloss/vim-javascript
tpope/vim-git

romainl/Apprentice

)

# Remove any old plugins
rm -rf $HOME/.vim/pack/bundle/*
mkdir $HOME/.vim/pack/bundle/start

installplugin() {
  # This removes the GitHub username and two common Vim plugin name
  # prefix/suffixes
  local plugin="$(echo "$1" | sed -e 's/.*[\/]//' -e 's/^vim-//' -e 's/\.vim//')"

  # Don't clone the plugin's history to make download faster
  # All Vim plugins I use are on GitHub
  git clone --depth=1 -q https://github.com/$1.git \
    $HOME/.vim/pack/bundle/start/$plugin

  # Remove git-related files to prevent nested git repositories
  rm -rf $HOME/.vim/pack/bundle/start/$plugin/.git*

  printf "Installed $plugin\n"
}

# The & is so that bash sets the installation as a background job, allowing for
# asynchronous installation (all plugins being installed at the same time).
for repo in ${plugins[@]}; do
  installplugin "$repo" &
done

# This makes the script wait for all the background jobs from installing all the
# plugins above before continuing
wait
