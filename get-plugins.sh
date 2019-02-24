#!/usr/bin/env bash

# Enable extended globbing
shopt -s extglob

# What plugins we install
#
# Thy are grouped into three categories:
# 1. Small improvements
# 2. Big, new features
# 3. Language support
# 4. Colours
plugins=(

alvan/vim-closetag
machakann/vim-highlightedyank
romainl/vim-cool
romainl/vim-qf
rstacruz/vim-closer
sgur/vim-editorconfig
tpope/vim-commentary
tpope/vim-endwise
tpope/vim-surround
tpope/vim-unimpaired
wellle/targets.vim
wincent/terminus

junegunn/vim-easy-align
lifepillar/vim-mucomplete
tpope/vim-fugitive

hail2u/vim-css3-syntax
kchmck/vim-coffee-script
lifepillar/vim-colortemplate
othree/html5.vim
pangloss/vim-javascript
tpope/vim-git
tpope/vim-haml
vim-ruby/vim-ruby

arzg/apprentice8

)

# Remove any old plugins
rm -rf $HOME/.vim/pack
mkdir -p $HOME/.vim/pack/bundle/start

installplugin() {
  # This removes the GitHub username and two common Vim plugin name
  # prefix/suffixes
  local plugin="$(echo "$1" | sed -e 's/.*[\/]//' -e 's/^vim-//' -e 's/\.vim//')"
  local pluginpath="$HOME/.vim/pack/bundle/start/$plugin"

  # Don't clone the plugin's history to make download faster
  # All Vim plugins I use are on GitHub
  git clone --depth=1 -q https://github.com/$1.git "$pluginpath"

  # Remove git-related files to prevent nested git repositories
  rm -rf "$pluginpath"/.git*

  # Remove any non-essential files that are not needed for the plugin to run
  rm -rf "$pluginpath"/README*
  rm -f "$pluginpath"/*.@(md|mdown|mkdown|markdown)
  rm -rf "$pluginpath"/test

  # Print a line announcing installation of the plugin on top of any previous
  # announcements. We do this to provide visual feedback to show the script is
  # working, but does not take up space.
  printf "\r\e[0KInstalled $plugin"
}

# The & is so that bash sets the installation as a background job, allowing for
# asynchronous installation (all plugins being installed at the same time).
for repo in ${plugins[@]}; do
  installplugin "$repo" &
done

# This makes the script wait for all the background jobs from installing all the
# plugins above before continuing
wait

# Clear away all output from the script
printf "\r\e[0K"

# Generate helptags

# If the user is using Homebrew Vim by default then this will make sure helptags
# are also generated for system Vim
[ -e /usr/bin/vim ] && /usr/bin/vim +'silent! helptags ALL | quit!'
[ -e /usr/local/bin/vim ] && /usr/local/bin/vim +'silent! helptags ALL | quit!'
# For MacVim users
[ -e /Applications/MacVim.app/Contents/bin/vim ] && /Applications/MacVim.app/Contents/bin/vim +'silent! helptags ALL | quit!'
# Just in case Vim is located at a path we haven't run yet
vim +'silent! helptags ALL | quit!'
# Neovim does not have the problem of multiple versions being installed at once,
# so we can just run 'nvim'. Neovim also supports running headless, which is an
# advantage in this situation.
nvim --headless +'silent! helptags ALL | quit!'
