#!/usr/bin/env bash

# Create neccesary plugin folders
if [ ! -e ~/dotfiles/home/vim/.vim/bundle ];then
  mkdir -p ~/dotfiles/home/vim/.vim/bundle
fi

# What plugins we install
plugins=(
AndrewRadev/splitjoin.vim
adriaanzon/vim-textobj-matchit
aramisgithub/vim-ruby
junegunn/goyo.vim
junegunn/limelight.vim
junegunn/vim-easy-align
kana/vim-textobj-user
lifepillar/vim-mucomplete
romainl/Apprentice
romainl/vim-cool
romainl/vim-qf
sheerun/vim-polyglot
terryma/vim-smooth-scroll
tmux-plugins/vim-tmux-focus-events
toyamarinyon/vim-swift
tpope/vim-commentary
tpope/vim-endwise
tpope/vim-repeat
tpope/vim-surround
tpope/vim-unimpaired
wellle/targets.vim
)

# Remove any old plugins
rm -rf ~/dotfiles/home/vim/.vim/bundle/*

# Clone plugins into their directories and remove any git-related files from the
# plugin to stop git from getting confused
for repo in ${plugins[@]}; do
  plugin="$(echo "$repo" | sed -e 's/.*[\/]//')"
  git clone --depth=1 -q https://github.com/$repo.git ~/dotfiles/home/vim/.vim/bundle/$plugin
  rm -rf ~/dotfiles/home/vim/.vim/bundle/$plugin/.git*
  echo $plugin installed!
done

# Add bundle. gitignore for the plugins (this is done here because it is related and
# neccesary for installing the plugins and also that I don't have to remember to
# do it in future).
echo "bundle
spell
undo
backup
swap
.netrwhist
" > ~/dotfiles/home/vim/.vim/.gitignore

