# aramis' zshrc

#
# Init
#

# Load all needed zsh modules
autoload -U compinit && compinit
autoload -U colors && colors
autoload -U promptinit && promptinit
zmodload -i zsh/complist

# Path
export PATH=$HOME/bin:$PATH
export PATH=/usr/local:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/texlive/20*/bin:$PATH
export PATH=/Library/TeX/texbin:$PATH
export PATH=$HOME/.gem/ruby/2.5.0/bin:$PATH
export PATH=$HOME/code/go/bin:$PATH

#
# Plugins
#

source ~/.antibodyrc.sh

#
# Aliases
#

# System
alias cp="cp -riv"
alias ls="betterls"
alias mkdir="mkdir -pv"
alias mv="mv -iv"
alias rm="echo 'Use trs instead, or /bin/rm if you want to delete permanently'"
alias trs="rmtrash"
alias vim8="/Applications/MacVim.app/Contents/bin/vim"
alias vim8diff="/Applications/MacVim.app/Contents/bin/vimdiff"
alias vim="nvim"
alias vimdiff="nvim -d"

# LaTeX shortcuts
alias pdf="open *.pdf"

doc() {
  # Create empty document if it doesn't exist yet
  [ ! -e 'document.md' ] && touch 'document.md'

  # Open document in iA Writer
  open -a "iA Writer.app" document.md
}

# Quick dotfile access
alias ec="cd ~/.vim && nvim vimrc && cd - > /dev/null"
alias sc="nvim $HOME/.bashrc"

#
# Options
#

# History

# Keep history in ~/.zhist
HISTFILE=~/.zhist

# Save a lot of history
HISTSIZE=100000
SAVEHIST=100000

# Do not overwrite history file; instead, just keep adding to it automatically
# after every command
setopt appendhistory
setopt inc_append_history

# Save history timestamp
setopt extended_history

# If the history file needs to be trimmed delete duplicates first
setopt hist_expire_dups_first

# Ignore duplicates in history
setopt hist_ignore_dups
HISTCONTROL=ignoredups

# Remove unneeded blank lines from history
setopt hist_reduce_blanks

# Auto-expand history expansions
setopt hist_verify

# Completion

# After completing something, move the cursor to the end of the completed thing
setopt always_to_end

# Do not autoselect the first completion entry; instead complete as far as
# possible and show available options. Insert the first match after pressing tab
# a second time
setopt auto_menu
unsetopt menu_complete

# Automatically list choices on ambiguous completion
setopt auto_list

# If completed parameter is a directory, add a trailing slash
setopt auto_param_slash

# Complete based on substrings rather than the start of a string; i.e. complete
# from both sides instead of only the end
setopt complete_in_word

# Show an error if a filename does not match
setopt nomatch

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Highlight completion
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# Cache completion
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${ZDOTDIR:-$HOME}/.zcompcache"

# Keyboard shortcuts

# No comment needed
bindkey '^R' history-incremental-search-backward

# Expand history expansions as you type
bindkey ' ' magic-space

# Use emacs keybindings
bindkey -e

# Misc

# Words are separated using space
WORDCHARS=''

# Automatically add  cd  when entering a path by itself
setopt autocd

# Automatically correct spelling mistakes
setopt correct_all
# These commands can be annoying when 'corrected'
alias man='nocorrect man'
alias sudo='nocorrect sudo'

# Allow extra characters for matching file names
setopt extendedglob

# Outputting flow control is disabled using start/stop chars
unsetopt flowcontrol

#
# Environment variables
#

# Gopath
export GOPATH=$HOME/code/go

# Editor
export EDITOR=nvim

# Pager
export PAGER=less

# Set default flags for less
#
# The F flag makes less quit if the entire file can be displayed without
# scrolling
#
# The R flag makes less interpret colours
export LESS="FR"

# Text encoding
export __CF_USER_TEXT_ENCODING=0x08000100:0x0

# Custom ls colours for colours that are consistent with exa
#
# I pick this because I find exa's colours more appealing
export LSCOLORS=ExFxBxDxCxegedabagacad

# fzf
#
# This makes fzf much faster and makes it scan hidden files too, as well as
# making it exclude .git from the search
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND='fd --type f --type d --hidden --follow --exclude .git'
#
# Use Solarized dark colours
export FZF_DEFAULT_OPTS='
--color fg:10,bg:8,hl:3,fg+:12,bg+:0,hl+:5
--color info:2,prompt:6,spinner:4,pointer:10,marker:2
'
#
# Source fzf shell integration files
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
source "/usr/local/opt/fzf/shell/key-bindings.zsh"

#
# Window title
#

# Set the window title to match the present working directory -- whether in
# tmux or in a regular terminal. The tmux function also sets the current
# window's name to ~ if in $HOME, or to the tail of the PWD
tmuxwindowtitle () {
  if [ "$TERM_PROGRAM" = "Apple_Terminal" ]; then
    local SEARCH=' '
    local REPLACE='%20'
    local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
    printf '\ePtmux;\e\e]6;%s\a\e\\' "$PWD_URL"
  fi
  if [[ $(basename $PWD) == $(basename $HOME) ]]; then
    tmux rename-window "~"
  else
    tmux rename-window "$(basename $PWD)"
  fi
}

regularwindowtitle () {
  if [ "$TERM_PROGRAM" = "Apple_Terminal" ]; then
    local SEARCH=' '
    local REPLACE='%20'
    local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
    printf '\e]6;%s\a' "$PWD_URL"
  else
    if [[ $(basename $PWD) == $(basename $HOME) ]]; then
      printf "\e]0;$(echo '~ — zsh')\a"
    else
      printf "\e]0;$(echo $(basename $PWD) — zsh)\a"
    fi
  fi
}

# Call the appropriate window title function before every prompt
case "$TERM" in
  tmux*)
    precmd() { tmuxwindowtitle }
    ;;
  xterm*)
    precmd() { regularwindowtitle }
    ;;
esac
