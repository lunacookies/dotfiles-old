# aramis' bashrc

##
## Aliases
##

# System
alias cp="cp -riv"
alias cx="chmod +x"
alias cxb="chmod +x ~/bin/*"
alias e="nvim"
alias mk="mkdir -pv"
alias mv="mv -iv"
alias rm="echo Use 'trs' or '/bin/rm'"
alias trs="rmtrash"

# LaTeX shortcuts
alias doc="e document.md"
alias pdf="open *.pdf"

# Quick dotfile access
alias ec="e ~/.vim/vimrc ~/.vim/install.sh ~/.vim/autoload/aramis/* ~/.vim/ftplugin/*"
alias hdc="e ~/.skhdrc"
alias sc="e ~/.zshrc ~/.bashrc ~/.shrc"
alias wmc="e ~/.chunkwmrc"

# List files/directories
alias l="exa -l --git --group-directories-first -F --ignore-glob .git"
alias la="exa -l --git --group-directories-first -F --ignore-glob .git -a"
alias lal="exa -l --git --group-directories-first -T -L 2 -F --ignore-glob .git -a"
alias ll="exa -l --git --group-directories-first -T -L 2 -F --ignore-glob .git"

# Daemons
alias nhd="brew services stop skhd"
alias nwm="brew services stop chunkwm"
alias yhd="brew services restart skhd"
alias ywm="brew services restart chunkwm"

# Git
alias ga="git add"
alias gap="git add --patch"
alias gc="git commit"
alias gca="git add -A && git commit -a"
alias gcl="git clone"
alias gd="git diff"
alias gl="git log --oneline --decorate --graph --all"
alias gm="git mv"
alias gpl="git pull"
alias gps="git push"
alias gr="git rm"
alias grc="git reset --hard"
alias gs="git status -s"
alias gsl="git status"


##
## Environment variables
##

# Path
export PATH=~/bin:$PATH
export PATH=/usr/local:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/texlive/20*/bin:$PATH
export PATH=/Library/TeX/texbin:$PATH
export PATH=$HOME/.gem/ruby/2.5.0/bin:$PATH

# ConTeXt
export OSFONTDIR="/Library/Fonts//;/System/Library/Fonts;$HOME/Library/Fonts"

# Editor
export EDITOR=nvim

# Text encoding
export __CF_USER_TEXT_ENCODING=0x08000100:0x0


##
## Window title
##

# Set the window title to match the present working directory -- whether in
# tmux or in a regular terminal.
tmuxwindowtitle () {
  if [ "$TERM_PROGRAM" = "Apple_Terminal" ]; then
    local SEARCH=' '
    local REPLACE='%20'
    local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
    printf '\ePtmux;\e\e]6;%s\a\e\\' "$PWD_URL"
  else
    tmux rename-window -t $(tmux display-message -p '#I') $(echo $(basename $PWD) — zsh)
  fi
}

regularwindowtitle () {
  if [ "$TERM_PROGRAM" = "Apple_Terminal" ]; then
    local SEARCH=' '
    local REPLACE='%20'
    local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
    printf '\e]6;%s\a' "$PWD_URL"
  else
    printf "\e]0;$(echo $(basename $PWD) — zsh)\a"
  fi
}


##
## Options
##

# Coloured man
export LESS_TERMCAP_mb=$(printf "\033[01;31m")
export LESS_TERMCAP_md=$(printf "\033[01;31m")
export LESS_TERMCAP_me=$(printf "\033[0m")
export LESS_TERMCAP_se=$(printf "\033[0m")
export LESS_TERMCAP_so=$(printf "\033[01;31;33m")
export LESS_TERMCAP_ue=$(printf "\033[0m")
export LESS_TERMCAP_us=$(printf "\033[01;32m")

# Use arrows to navigate history
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

# Save a lot of history
HISTFILE=~/.zhist
HISTSIZE=10000
SAVEHIST=1000000

# Words are separated using space
WORDCHARS=''

# Do not overwrite history file
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Automatically add  cd  when entering a path by itself
shopt -s autocd 2> /dev/null

# Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null

# Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null

# More globbing options!
shopt -s extglob
shopt -s globstar 2> /dev/null

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Update window size after every command
shopt -s checkwinsize

# Ignore duplicates in history
HISTCONTROL="erasedups:ignoreboth"

# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"


##
## Window title
##

# Set the window title to match the present working directory -- whether in
# tmux or in a regular terminal. This also checks git status after every prompt.
case "$TERM" in
  screen*)
    PROMPT_COMMAND="tmuxwindowtitle"
esac

case "$TERM" in
  xterm*)
    PROMPT_COMMAND="regularwindowtitle"
esac

##
## Prompt
##

# Set prompt
PS1='
\[\e[34m\]\w
\[\e[32m\]\h \[\e[m\]\\$ '

