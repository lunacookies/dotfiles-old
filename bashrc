# aramis' bashrc

#
# Path
#

export PATH=$HOME/bin:$PATH
export PATH=/usr/local:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/texlive/20*/bin:$PATH
export PATH=/Library/TeX/texbin:$PATH
export PATH=$HOME/code/go/bin:$PATH

#
# Aliases and functions
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

# Create directory and then cd into it
mkcd() {
  mkdir -p -- "$@"
  cd -- "$@"
}

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

# For some reason git branch doesn't show any output unless I grep for nothing?
fixedgit() {
  if [ "$1" = "branch" ] || [ "$1" = "br" ]; then
    git "$@" --color=always | grep ''
  else
    git "$@"
  fi
}
alias git="fixedgit"

#
# Environment variables
#

# Gopath
export GOPATH=$HOME/code/go

# Use Nvim
export EDITOR=nvim
export VISUAL=nvim

# Use less
export PAGER=less

# Set default flags for less
#
# The F flag makes less act like cat, and then quit, if the entire file can be
# displayed without scrolling
#
# The R flag makes less interpret colours
export LESS="FR"

# Use UTF8 everywhere
export __CF_USER_TEXT_ENCODING=0x08000100:0x0

# Enable coloured output in some BSD utilities
export CLICOLOR=1

# fzf
#
# This makes fzf much faster and makes it scan hidden files too, as well as
# excluding several uninteresting folders from the search
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude .gem --exclude .Trash --exclude Library'
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git --exclude .gem --exclude .Trash --exclude Library'
export FZF_CTRL_T_COMMAND='fd --type f --type d --hidden --follow --exclude .git --exclude .gem --exclude .Trash --exclude Library'
#
# Use colours from Apprentice
export FZF_DEFAULT_OPTS='
--color fg:7,hl:4,fg+:250,bg+:0,hl+:12
--color info:2,prompt:6,spinner:101,pointer:14,marker:2
'
#
# Source fzf shell integration files
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.bash" 2> /dev/null
source "/usr/local/opt/fzf/shell/key-bindings.bash"

# ag & rg
#
# Search by column
agopts=(
--column
)
rgopts=(
--column
)
#
# Use the same colour highlighting in both programs, and make it match the way
# Apprentice in Vim does highlighting
agopts+=(
"--color-line-number='0;37;40'"
"--color-match='0;7;93'"
"--color-path='0;96'"
)
rgopts+=(
"--colors='column:none'"
"--colors='column:bg:black'"
"--colors='column:fg:white'"
"--colors='line:none'"
"--colors='line:bg:black'"
"--colors='line:fg:white'"
"--colors='match:none'"
"--colors='match:bg:229'"
"--colors='match:fg:black'"
"--colors='path:none'"
"--colors='path:fg:cyan'"
"--colors='path:style:intense'"
)
#
# Process options
agexpopts=$(for i in "${agopts[@]}" ; do
printf "%s" " $i"
done)
rgexpopts=$(for i in "${rgopts[@]}" ; do
printf "%s" " $i"
done)
#
# Load all custom options
alias ag="ag$agexpopts --"
alias rg="rg$rgexpopts --"
#
# Remove leftover variables
unset agopts
unset agexpopts
unset rgopts
unset rgexpopts

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

# Ssve history after every prompt
PROMPT_COMMAND="$PROMPT_COMMAND; history -a"

# Words are separated using space
WORDCHARS=''

# See https://asciinema.org/a/5T5vODhu3TRnNzvghYprpA3xf
export CDPATH=.:$HOME:$HOME/code:$HOME/School/2019:..

# Do not overwrite history file
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Automatically add  cd  when entering a path by itself
shopt -s autocd

# Correct spelling errors
shopt -s cdspell
shopt -s dirspell

# Expands e.g. environment variables in directory/file tab completion
shopt -s direxpand

# More globbing options!
shopt -s extglob
shopt -s globstar

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Update window size after every command
shopt -s checkwinsize

# Ignore duplicates in history
HISTCONTROL="erasedups:ignoreboth"

# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Don't assume a word with a @ in it is a hostname
shopt -u hostcomplete

# Complete prefix first, then press tab again for list of options
bind "set show-all-if-unmodified on"
bind 'set menu-complete-display-prefix on'

# Don't complete when tab is pressed on an empty line
shopt -s no_empty_cmd_completion

# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"

# Enable bash-completion and git's own specialised completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
source /usr/local/opt/git/etc/bash_completion.d/git-completion.bash

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
      printf "\e]0;$(echo '~ — bash')\a"
    else
      printf "\e]0;$(echo $(basename $PWD) — bash)\a"
    fi
  fi
}

# Call the appropriate window title function before every prompt
case "$TERM" in
  tmux*)
    PROMPT_COMMAND="$PROMPT_COMMAND; tmuxwindowtitle"
    ;;
  xterm*)
    PROMPT_COMMAND="$PROMPT_COMMAND; regularwindowtitle"
    ;;
esac

#
# Prompt
#

# Source git prompt provided by Homebrew
source /usr/local/opt/git/etc/bash_completion.d/git-prompt.sh

# Limit the number of segments displayed of the working directory in the prompt
# to three
PROMPT_DIRTRIM=3

# Set prompt
PS1='\[\e[37m\][\h:\w\[\e[35m\]$(__git_ps1 " %s" &)\[\e[37m\]]\[\e[0m\] '
