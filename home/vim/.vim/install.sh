#!/usr/bin/env bash

# Create neccesary plugin folders
if [ ! -e ~/dotfiles/home/vim/.vim/pack ];then
  mkdir -p ~/dotfiles/home/vim/.vim/pack/aramis/start
  mkdir -p ~/dotfiles/home/vim/.vim/pack/aramis/opt
fi

# The plugins that will always be loaded
start=(
AndrewRadev/splitjoin.vim
andymass/vim-matchup
aramisgithub/vim-ruby
junegunn/goyo.vim
junegunn/limelight.vim
junegunn/vim-easy-align
justinmk/vim-sneak
lifepillar/vim-mucomplete
mhinz/vim-sayonara
romainl/Apprentice
romainl/vim-cool
romainl/vim-qf
sheerun/vim-polyglot
tmux-plugins/vim-tmux-focus-events
toyamarinyon/vim-swift
tpope/vim-commentary
tpope/vim-dispatch
tpope/vim-endwise
tpope/vim-eunuch
tpope/vim-repeat
tpope/vim-surround
tpope/vim-unimpaired
wellle/targets.vim
)

# The plugins that can are loaded seperately (on a condition) in the vimrc
opt=(
markonm/traces.vim
)

# Clone plugins into their directories and remove any git-related files from the
# plugin to stop git from getting confused
install_plugins() {
  plugin_collection=$1[@]
  for repo in ${!plugin_collection}; do
    plugin="$(echo $repo | sed -e 's/.*[\/]//')"
    rm -rf ~/dotfiles/home/vim/.vim/pack/aramis/$1/$plugin
    git clone --depth=1 -q https://github.com/$repo.git ~/dotfiles/home/vim/.vim/pack/aramis/$1/$plugin
    rm -rf ~/dotfiles/home/vim/.vim/pack/aramis/$1/$plugin/.git*
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
undo
backup
swap
.netrwhist
" > ~/dotfiles/home/vim/.vim/.gitignore

