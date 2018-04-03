# config.fish for macOS
# ==========================================================
# - /u/aramisreddit
# - github.com/aramisgithub

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
set -gx PATH ~/.bin $PATH                      # Personal scripts
set -gx PATH /usr/local $PATH                  # Fix OS updates which mess with PATH
set -gx PATH /usr/local/bin $PATH              # Fix TeX (broken on every macOS update)
set -gx PATH /usr/local/texlive/2017/bin $PATH # Add tlmgr to PATH
set -gx PATH /Library/TeX/texbin $PATH         # Add TeX programs

### Editor
set -gx EDITOR nvim # Use nvim as editor

### Text encoding
set -gx __CF_USER_TEXT_ENCODING 0x08000100:0x0 # UTF-8 text encoding

# Prompt
# ----------------------------------------------------------

### Set colours
set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set cyan (set_color cyan)
set red (set_color red)
set blue (set_color blue)
set black (set_color black)

### Git
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showupstream 'yes'

### Status Chars
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_upstream_ahead ' ⇡'
set __fish_git_prompt_char_upstream_behind ' ⇣'
set __fish_git_prompt_char_upstream_equal ''

### Set prompt
function fish_prompt
  set_color cyan
  printf '%s' ' ' (prompt_pwd)
  set_color green
  printf '%s ' (__fish_git_prompt)
  set_color normal
end

# Options
# ----------------------------------------------------------

### Greeting
set fish_greeting

### Coloured man
set -gx LESS_TERMCAP_mb (printf "\033[01;31m")
set -gx LESS_TERMCAP_md (printf "\033[01;31m")
set -gx LESS_TERMCAP_me (printf "\033[0m")
set -gx LESS_TERMCAP_se (printf "\033[0m")
set -gx LESS_TERMCAP_so (printf "\033[01;31;33m")
set -gx LESS_TERMCAP_ue (printf "\033[0m")
set -gx LESS_TERMCAP_us (printf "\033[01;32m")

### Fzf display
set -gx FZF_DEFAULT_OPTS "
  --no-height 
  --no-reverse 
  --color=dark 
  --margin 2%
"

### Fzf command
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git --exclude Library' # Show hidden files in fzf
set -gx FZF_ALT_C_COMMAND 'fd --type d --hidden --follow --exclude .git --exclude Library'
set -gx FZF_CTRL_T_COMMAND 'fd --type f --type d --hidden --follow --exclude .git --exclude Library'

