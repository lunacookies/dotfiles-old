# .zshrc for macOS
# ==========================================================
# - /u/aramisreddit
# - github.com/aramisgithub

# Initialise
# ----------------------------------------------------------

autoload -U colors && colors      # Initialise colours
autoload -Uz compinit && compinit # Initialise completion
autoload -Uz vcs_info             # Initialise vcs info in prompt

# Options
# ----------------------------------------------------------

### Coloured man
export LESS_TERMCAP_mb=$(printf "\033[01;31m")
export LESS_TERMCAP_md=$(printf "\033[01;31m")
export LESS_TERMCAP_me=$(printf "\033[0m")
export LESS_TERMCAP_se=$(printf "\033[0m")
export LESS_TERMCAP_so=$(printf "\033[01;31;33m")
export LESS_TERMCAP_ue=$(printf "\033[0m")
export LESS_TERMCAP_us=$(printf "\033[01;32m")

### Save a lot of history
HISTFILE=~/.zhist
HISTSIZE=10000
SAVEHIST=1000000

### Words are separated using space
WORDCHARS=''

### Use vi-like key bindings
bindkey -v

### Move cursor to end of word after completion
setopt always_to_end

### Allow functions in prompt
setopt promptsubst

### Do not overwrite history file
setopt appendhistory

### Show completion menu on successive tab press
setopt auto_menu

### Automatically add  cd  when entering a path by itself
setopt autocd

### Allow completion within words
setopt complete_in_word

### Allow extra characters for matching file names
setopt extendedglob

### Show an error if a filename does not match
setopt nomatch

### Outputting flow control is disables using start/stop chars
unsetopt flowcontrol

### Do not autoselect the first completion entry
unsetopt menu_complete

# Aliases
# ----------------------------------------------------------

### System
alias e="nvim"
alias trs="rmtrash"
alias rm="echo Use 'trs' or '/bin/rm'"

### LaTeX shortcuts
alias doc="e document.md"
alias pdf="open -na /Applications/Skim.app output.pdf"
alias cb="~/.bin/compilebeamer"
alias cr="~/.bin/compilereport"

### Quick dotfile access
alias shlc="e ~/.zshrc"
alias ec="e ~/.config/nvim/init.vim"
alias wmc="e ~/.chunkwmrc"
alias hdc="e ~/.khdrc"

### List files/directories
alias l="exa -l --group-directories-first -F --ignore-glob .git"
alias la="exa -l --group-directories-first -F --ignore-glob .git -a"
alias ll="exa -l --group-directories-first -T -L 2 -F --ignore-glob .git"
alias lal="exa -l --group-directories-first -T -L 2 -F --ignore-glob .git -a"

### Daemons
alias ywm="brew services restart chunkwm"
alias nwm="brew services stop chunkwm"
alias yhd="brew services restart khd"
alias nhd="brew services stop khd"

### Git
alias gc="git add -A; and git commit -am"
alias gcl="git clone"
alias gi="git init; and git add -A"
alias gpl="git pull"
alias gps="git push"
alias gs="git status"
alias gl="git log --color --graph --pretty=format:' %Cgreen%s%Creset%nby %an%n%ar%n ' "

# Environment variables
# ----------------------------------------------------------

### Path
export PATH=~/.bin:$PATH                      # Personal scripts
export PATH=/usr/local:$PATH                  # Fix OS updates which mess with PATH
export PATH=/usr/local/bin:$PATH              # Fix TeX (broken on every macOS update)
export PATH=/usr/local/texlive/2017/bin:$PATH # Add tlmgr to PATH
export PATH=/Library/TeX/texbin:$PATH         # Add TeX programs

### Editor
export EDITOR=nvim # Use nvim as editor

### Text encoding
export __CF_USER_TEXT_ENCODING=0x08000100:0x0 # UTF-8 text encoding

# Completion
# ----------------------------------------------------------

### Highlight completion
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# Prompt
# ----------------------------------------------------------

### Enable vcs_info
zstyle ':vcs_info:*' enable git

precmd() {
  vcs_info
}

### Show branch in vcs_info black
zstyle ':vcs_info:git*' formats " %b"

### Set prompt
PROMPT=' %{$fg[blue]%}%~%{$fg[green]%}${vcs_info_msg_0_}%{$fg[red]%} %{$reset_color%}'

# Fzf
# ----------------------------------------------------------

### Fzf display
export FZF_DEFAULT_OPTS="
  --no-height 
  --no-reverse 
  --color=dark 
  --margin 2%
"

### Fzf command
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude Library' # Show hidden files in fzf
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git --exclude Library'
export FZF_CTRL_T_COMMAND='fd --type f --type d --hidden --follow --exclude .git --exclude Library'

### Source fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

