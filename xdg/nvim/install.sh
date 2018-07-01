#!/usr/bin/env bash

# Create neccesary plugin folders
if [ ! -e ~/dotfiles/xdg/nvim/pack ];then
  mkdir -p ~/dotfiles/xdg/nvim/pack/aramis/start
  mkdir -p ~/dotfiles/xdg/nvim/pack/aramis/opt
fi

# The plugins that will always be loaded
start=(
mhinz/vim-sayonara
romainl/vim-cool
sheerun/vim-polyglot
toyamarinyon/vim-swift
tpope/vim-endwise
tpope/vim-eunuch
tpope/vim-repeat
tpope/vim-unimpaired
aramisgithub/vim-ruby
AndrewRadev/splitjoin.vim
junegunn/vim-easy-align
justinmk/vim-sneak
kana/vim-textobj-indent
kana/vim-textobj-line
kana/vim-textobj-user
tpope/vim-commentary
tpope/vim-surround
wellle/targets.vim
ajh17/VimCompletesMe
christoomey/vim-tmux-navigator
junegunn/goyo.vim
junegunn/limelight.vim
romainl/Apprentice
romainl/vim-qf
)

# The plugins that can are loaded seperately (on a condition) in the vimrc
opt=(
markonm/traces.vim
)

# Clone plugins into their directories and remove any git-related files from the
# plugin
install_plugins() {
  plugin_collection=$1[@]
  for repo in ${!plugin_collection}; do
    plugin="$(echo $repo | sed -e 's/.*[\/]//')"
    rm -rf ~/dotfiles/xdg/nvim/pack/aramis/$1/$plugin
    git clone --depth=1 -q https://github.com/$repo.git ~/dotfiles/xdg/nvim/pack/aramis/$1/$plugin
    rm -rf ~/dotfiles/xdg/nvim/pack/aramis/$1/$plugin/.git*
    echo $plugin installed!
  done
}

# Install them!
install_plugins start
install_plugins opt

# Add gitignore for the plugins (this is done here because it is related and
# neccesary for installing the plugins and also that I don't have to remember to
# do it in future).
echo "pack
spell
.netrwhist
" > ~/dotfiles/xdg/nvim/.gitignore

