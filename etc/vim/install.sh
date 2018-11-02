#!/usr/bin/env bash

# Create neccesary plugin folders
if [ ! -e ~/dotfiles/etc/vim/bundle ]; then
  mkdir -p ~/dotfiles/etc/vim/bundle
fi

# What plugins we install
plugins=(
AndrewRadev/splitjoin.vim
NLKNguyen/c-syntax.vim
arzg/vim-linelinenumbernine
arzg/vim-plan9
arzg/vim-ruby
arzg/vim-tabhelp
dearrrfish/vim-applescript
ericpruitt/tmux.vim
fatih/vim-go
junegunn/goyo.vim
junegunn/seoul256.vim
junegunn/limelight.vim
junegunn/vim-easy-align
lifepillar/vim-colortemplate
lifepillar/vim-mucomplete
romainl/vim-cool
romainl/vim-qf
sgur/vim-editorconfig
terryma/vim-smooth-scroll
tmux-plugins/vim-tmux-focus-events
tommcdo/vim-exchange
tpope/vim-commentary
tpope/vim-endwise
tpope/vim-git
tpope/vim-markdown
tpope/vim-repeat
tpope/vim-surround
tpope/vim-unimpaired
wellle/targets.vim
)

# Remove any old plugins
rm -rf ~/dotfiles/etc/vim/bundle/*

# Clone plugins into their directories and remove any git-related files from the
# plugin to stop git from getting confused
#
# We place an && after each line and a & at the end of the whole thing so that
# plugins install asynchronously. This meant installation times went from circa
# sixty seconds to three. That's a 20x improvement!
for repo in ${plugins[@]}; do
  plugin="$(echo "$repo" | sed -e 's/.*[\/]//')" && \
  git clone --depth=1 -q https://github.com/$repo.git \
    ~/dotfiles/etc/vim/bundle/$plugin && \
  rm -rf ~/dotfiles/etc/vim/bundle/$plugin/.git* && \
  echo $plugin installed! &
done

# This makes the script wait for all the background jobs from installing all the
# plugins above before continuing
wait

# Add bundle. gitignore for the plugins (this is done here because it is related
# and neccesary for installing the plugins and also that I don't have to
# remember to do it in future).
echo "bundle
spell
undo
backup
swap
.netrwhist" > ~/dotfiles/etc/vim/.gitignore
