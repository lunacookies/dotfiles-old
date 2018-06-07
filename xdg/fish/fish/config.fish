# aramis' config.fish


##
## Options
##

# Coloured man
set -gx LESS_TERMCAP_mb (printf "\033[01;31m")
set -gx LESS_TERMCAP_md (printf "\033[01;31m")
set -gx LESS_TERMCAP_me (printf "\033[0m")
set -gx LESS_TERMCAP_se (printf "\033[0m")
set -gx LESS_TERMCAP_so (printf "\033[01;31;33m")
set -gx LESS_TERMCAP_ue (printf "\033[0m")
set -gx LESS_TERMCAP_us (printf "\033[01;32m")

# Disable greeting
set fish_greeting


##
## Aliases
##

# System
alias cb "chmod +x ~/bin/*"
alias cp "cp -riv"
alias cx "chmod +x"
alias e "nvim"
alias ma "math --scale=7 --"
alias mk "mkdir -pv"
alias mv "mv -iv"
alias rm "echo Use 'trs' or '/bin/rm'"
alias trs "rmtrash"

# LaTeX shortcuts
alias doc "e document.md"

# Quick dotfile access
alias ec "e ~/.config/nvim/init.vim"
alias hdc "e ~/.khdrc"
alias sc "e ~/.config/fish/config.fish"
alias tec "e ~/.config/kitty/kitty.conf"
alias wmc "e ~/.chunkwmrc"

# List files/directories
alias l "exa -l --git --git-ignore --group-directories-first -F --ignore-glob .git"
alias la "exa -l --git --group-directories-first -F --ignore-glob .git -a"
alias lal "exa -l --git --group-directories-first -T -L 2 -F --ignore-glob .git -a"
alias ll "exa -l --git --git-ignore --group-directories-first -T -L 2 -F --ignore-glob .git"

# Daemons
alias nhd "brew services stop khd"
alias nwm "brew services stop chunkwm"
alias yhd "brew services restart khd"
alias ywm "brew services restart chunkwm"

# Git
alias ga "git add"
alias gap "git add --patch"
alias gc "git commit"
alias gca "git add -A; and git commit -a"
alias gcl "git clone"
alias gd "git diff"
alias gi "git init; and git add -A"
alias gl "git log --color --graph --pretty format:' %Cgreen%s%Creset%nby %an%n%ar%n ' "
alias gpl "git pull"
alias gps "git push"
alias gr "git rm"
alias grc "git reset --hard"
alias gs "git status -s"
alias gsl "git status"


##
## Environment variables
##

# Path
set -gx PATH ~/bin $PATH
set -gx PATH /usr/local $PATH
set -gx PATH /usr/local/bin $PATH
set -gx PATH /usr/local/texlive/20*/bin $PATH
set -gx PATH /Library/TeX/texbin $PATH
set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
set -gx PATH /usr/local/opt/findutils/libexec/gnubin $PATH
set -gx PATH /usr/local/opt/grep/libexec/gnubin $PATH

# Manpath
set -gx MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH
set -gx MANPATH /usr/local/opt/findutils/libexec/gnuman $MANPATH
set -gx MANPATH /usr/local/opt/grep/libexec/gnuman $MANPATH

# Editor
set -gx EDITOR nvim

# Text encoding
set -gx __CF_USER_TEXT_ENCODING 0x08000100:0x0


##
## Fzf
##

# Fzf command
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
set -gx FZF_ALT_C_COMMAND 'fd --type d --hidden --follow --exclude .git'
set -gx FZF_CTRL_T_COMMAND 'fd --type f --type d --hidden --follow --exclude .git'


##
## Window title
##

# Set window title to shortened PWD
function fish_title
  echo (prompt_pwd)
end

# Set tmux window title to PWD
if set -q TMUX
  function precmd --on-event fish_prompt
    tmux rename-window (prompt_pwd)
  end
end


##
## Prompt
##

function fish_prompt
  set last_status $status

  set_color blue
  printf '==> '
  set_color normal
  set_color -o
  printf '%s ' (prompt_pwd)
  set_color normal
end


##
## Colours
##

# Use color8 for autosuggestions
set fish_color_autosuggestion brblack

