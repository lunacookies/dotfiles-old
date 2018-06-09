# aramis' config.fish


##
## Initialise
##

autoload -U colors && colors      # Initialise colours
autoload -Uz compinit && compinit # Initialise completion
autoload -Uz vcs_info             # Initialise vcs info in prompt


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

# Save a lot of history
HISTFILE=~/.zhist
HISTSIZE=10000
SAVEHIST=1000000

# Words are separated using space
WORDCHARS=''

# Move cursor to end of word after completion
setopt always_to_end

# Allow functions in prompt
setopt promptsubst

# Do not overwrite history file
setopt appendhistory

# Show completion menu on successive tab press
setopt auto_menu

# Automatically add  cd  when entering a path by itself
setopt autocd

# Allow completion within words
setopt complete_in_word

# Allow extra characters for matching file names
setopt extendedglob

# Show an error if a filename does not match
setopt nomatch

# Outputting flow control is disables using start/stop chars
unsetopt flowcontrol

# Do not autoselect the first completion entry
unsetopt menu_complete

# Highlight completion
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories


##
## Aliases
##

# System
alias cb="chmod +x ~/bin/*"
alias cp="cp -riv"
alias cx="chmod +x"
alias e="nvim"
alias ma="math --scale=7 --"
alias mk="mkdir -pv"
alias mv="mv -iv"
alias rm="echo Use 'trs' or '/bin/rm'"
alias trs="rmtrash"

# LaTeX shortcuts
alias doc="e document.md"

# Quick dotfile access
alias ec="e ~/.config/nvim/init.vim"
alias hdc="e ~/.khdrc"
alias sc="e ~/.config/fish/config.fish"
alias tec="e ~/.config/kitty/kitty.conf"
alias wmc="e ~/.chunkwmrc"

# List files/directories
alias l="exa -l --git --git-ignore --group-directories-first -F --ignore-glob .git"
alias la="exa -l --git --group-directories-first -F --ignore-glob .git -a"
alias lal="exa -l --git --group-directories-first -T -L 2 -F --ignore-glob .git -a"
alias ll="exa -l --git --git-ignore --group-directories-first -T -L 2 -F --ignore-glob .git"

# Daemons
alias nhd="brew services stop khd"
alias nwm="brew services stop chunkwm"
alias yhd="brew services restart khd"
alias ywm="brew services restart chunkwm"

# Git
alias ga="git add"
alias gap="git add --patch"
alias gc="git commit"
alias gca="git add -A && git commit -a"
alias gcl="git clone"
alias gd="git diff"
alias gi="git init && git add -A"
alias gl="git log --color --graph --pretty format:' %Cgreen%s%Creset%nby %an%n%ar%n ' "
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
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
export PATH=/usr/local/opt/findutils/libexec/gnubin:$PATH
export PATH=/usr/local/opt/grep/libexec/gnubin:$PATH

# Manpath
export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH
export MANPATH=/usr/local/opt/findutils/libexec/gnuman:$MANPATH
export MANPATH=/usr/local/opt/grep/libexec/gnuman:$MANPATH

# Editor
export EDITOR=nvim

# Text encoding
export __CF_USER_TEXT_ENCODING=0x08000100:0x0


##
## Fzf
##

# Fzf command
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND='fd --type f --type d --hidden --follow --exclude .git'

# Setup fzf
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi

# Auto-completion
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
source "/usr/local/opt/fzf/shell/key-bindings.zsh"


##
## Window title
##

# Set the window title to match the present working directory -- whether in
# tmux or in a regular terminal. This also checks git status after every prompt.
case "$TERM" in
  tmux*)
    precmd () {
      COLLAPSEPWD=$(print -rD $PWD)
      tmux rename-window ${COLLAPSEPWD}
      vcs_info
    }
      ;;
esac

case "$TERM" in
  xterm*)
    precmd () {
      print -Pn "\e]0;%~\a"
      vcs_info
    }
      ;;
esac

##
## Prompt
##

# Enable vcs_info
zstyle ':vcs_info:*' enable git

# Show branch in vcs_info
zstyle ':vcs_info:git*' formats '%b'

# Use homebrew-style prompt
PROMPT='%{$fg[blue]%}==> %{$fg_bold[white]%}%~ %{$reset_color%}'
RPROMPT='${vcs_info_msg_0_}'
