
# vim: set foldmethod=marker foldlevel=0 nomodeline:

set fish_greeting # Don't show greeting upon opening fish

# Base16 Shell
if status --is-interactive
    eval sh $HOME/.config/base16-shell/scripts/base16-default-dark.sh
end

# Colored man
set -xg LESS_TERMCAP_mb (printf "\033[01;31m")
set -xg LESS_TERMCAP_md (printf "\033[01;31m")
set -xg LESS_TERMCAP_me (printf "\033[0m")
set -xg LESS_TERMCAP_se (printf "\033[0m")
set -xg LESS_TERMCAP_so (printf "\033[01;31;33m")
set -xg LESS_TERMCAP_ue (printf "\033[0m")
set -xg LESS_TERMCAP_us (printf "\033[01;32m")

function tmuxwindowtitle --on-event fish_prompt
  tmux rename-window (prompt_pwd)
end

