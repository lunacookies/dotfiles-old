
# export TERM="screen-256color"
export PATH="$PATH:/Library/TeX/texbin"
export PATH="$PATH:~/bin"
export PATH="$PATH:/usr/texbin"
export PATH="$PATH:/usr/local/bin"

# export GITAWAREPROMPT=~/.bash/git-aware-prompt
# source "${GITAWAREPROMPT}/main.sh"
# PS1="
# \[\e[33m\]\w \[\e[m\]\[\e[0;90m\$git_branch\$git_dirty\[\e[m\]\$ "


if [ "$PLATFORM" = Linux ]; then
  PS1="\[\e[1;38m\]\u\[\e[1;34m\]@\[\e[1;31m\]\h\[\e[1;30m\]:"
  PS1="$PS1\[\e[0;38m\]\w\[\e[1;35m\]> \[\e[0m\]"
else
  ### git-prompt
  __git_ps1() { :;}
  if [ -e ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
  fi
  PS1='\[\e[34m\]\u\[\e[1;32m\]@\[\e[0;33m\]\h\[\e[35m\]:\[\e[m\]\w\[\e[1;30m\]$(__git_ps1)\[\e[1;31m\]> \[\e[0m\]'
fi

archey -o

