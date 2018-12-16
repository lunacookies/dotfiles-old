# aramis' bashrc

#
# Aliases
#

# System
alias cp="cp -riv"
alias ls="exa --git --group-directories-first"
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
# Environment variables
#

# Path
export PATH=$HOME/bin:$PATH
export PATH=/usr/local:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/texlive/20*/bin:$PATH
export PATH=/Library/TeX/texbin:$PATH
export PATH=$HOME/.gem/ruby/2.5.0/bin:$PATH
export PATH=$HOME/code/go/bin:$PATH

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
# This makes fzf take some more of its colours from the terminal's colour scheme
export FZF_DEFAULT_OPTS='
--color spinner:2,pointer:9,prompt:4
'

#
# Options
#

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
HISTFILE=$HOME/.bash_history
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

# Tab through completion matches like zsh
bind 'TAB:menu-complete'

# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"

# Enable bash-completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

#
# Window title
#

# Set the window title to match the present working directory
regularwindowtitle () {
  if [ "$TERM_PROGRAM" = "Apple_Terminal" ]; then
    local SEARCH=' '
    local REPLACE='%20'
    local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
    printf '\e]6;%s\a' "$PWD_URL"
  else
    if [[ $(basename $PWD) == $(basename $HOME) ]]; then
      printf "\e]0;$(echo '~ — bash')\a"
    else
      printf "\e]0;$(echo $(basename $PWD) — bash)\a"
    fi
  fi
}

# Call the window title function before every prompt
PROMPT_COMMAND="regularwindowtitle"

#
# Prompt
#

# Load git prompt
if [ -e ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi

# Show more information in git prompt
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWUPSTREAM=1

# Custom function for git prompt
customgitprompt() {
  if git rev-parse --git-dir > /dev/null 2>&1; then
    __git_ps1 '%s ' | sed 's/=//g' | sed 's/%/*/g' | sed 's/\*\*/*/g' | sed 's/\*+\*/*+/g' | sed 's/ \*/*/g' | sed 's/>/ ⇡/g' | sed 's/</ ⇣/g'
  fi
}

# Set prompt

# Clear out prompt
PS1=''

# PWD (shows as much of each directory name as is necessary to be unambiguous.
# It shows the last directory in full)
# TODO: Switch from a zsh script to a compiled binary
PS1=$PS1'\[\e[32m\]$(zsh ~/bin/disambiguate-keeplast.zsh) '
# Git prompt
PS1=$PS1'\[\e[35m\]$(customgitprompt &)'
# Prompt character
PS1=$PS1'\[\e[32m\]›'
# Clear colour
PS1=$PS1' \[\e[m\]'

# Use a vertical bar cursor
PS1='\[\e[5 q\]'$PS1
