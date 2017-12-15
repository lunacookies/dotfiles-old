
source ~/.zplug/init.zsh

zplug "mafredri/zsh-async", from:github, defer:0

zplug "gowong/purer", use:pure.zsh, from:github, as:theme

if ! zplug check --verbose; then
  printf "Install zplug plugins? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load

# PURE_PROMPT_SYMBOL='$'
PURE_PROMPT_SYMBOL_COLOR='white'

setopt autocd

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export EDITOR="nvim"

export PYTHON_CONFIGURE_OPTS="--enable-framework"

alias e="nvim"

alias kk="rmtrash"
alias rm="echo Use 'kk', or the full path i.e. '/bin/rm'"
alias ff="e document.md"
alias fd="open -na /Applications/Skim.app output.pdf"
alias zshc="e ~/dotfiles/zsh/.zshrc"
alias vimc="e ~/dotfiles/nvim/.config/nvim/init.vim"
alias wmc="e ~/dotfiles/chunkwm/.chunkwmrc"
alias hdc="e ~/dotfiles/khd/.khdrc"
alias tec="e ~/.config/alacritty/alacritty.yml"
alias jj="exa -l -T -L 2 -F --ignore-glob Library"
alias jk="exa -a -T -L 2 -F --ignore-glob Library"
# alias jk="ls -AGH"
# alias jj="ls -lG"

alias ywm="brew services restart chunkwm"
alias nwm="brew services stop chunkwm"
alias yhd="brew services restart khd"
alias nhd="brew services stop khd"
alias gc="git commit -am"
alias gi="git init && git add -A"
alias gpl="git pull"
alias gps="git push"
alias gs="git status"
alias gl="git log --color --graph --pretty=format:'%Cgreen%s%Creset%nby %an%n%ar%n'"

export FZF_DEFAULT_OPTS="--no-height --no-reverse --preview 'cat {}' --color=dark"
# export FZF_CTRL_T_OPTS="--preview 'cat {}'"
export FZF_CTRL_T_OPTS="--select-1 --exit-0"

export PATH=$PATH:~/bin
export PATH=$PATH:/usr/texbin
export PATH=$PATH:/Library/TeX/texbin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:~/.cargo/bin

# echo -e "\033]6;1;bg;red;brightness;39\a"
# echo -e "\033]6;1;bg;green;brightness;40\a"
# echo -e "\033]6;1;bg;blue;brightness;34\a"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

