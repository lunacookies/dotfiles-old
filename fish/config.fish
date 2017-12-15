
if status is-interactive
and not set -q TMUX
  exec tmux
  exec clear
end

source ~/.config/fish/aliases.fish

set fish_greeting

# Default editor is nvim
set -gx EDITOR nvim

# Colored man
set -xg LESS_TERMCAP_mb (printf "\033[01;31m")
set -xg LESS_TERMCAP_md (printf "\033[01;31m")
set -xg LESS_TERMCAP_me (printf "\033[0m")
set -xg LESS_TERMCAP_se (printf "\033[0m")
set -xg LESS_TERMCAP_so (printf "\033[01;31;33m")
set -xg LESS_TERMCAP_ue (printf "\033[0m")
set -xg LESS_TERMCAP_us (printf "\033[01;32m")

# Homesick
if test -d $HOME/.homesick
  set -gx PATH $HOME/bin $PATH
	source $HOME/.homesick/repos/homeshick/homeshick.fish
  source "$HOME/.homesick/repos/homeshick/completions/homeshick.fish"
end

set -gx PATH $HOME/bin $PATH
set -gx PATH /usr/local/bin $PATH

set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set blue (set_color -o blue)
set gray (set_color -o black)

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color ''
set __fish_git_prompt_color_branch brblack
set __fish_git_prompt_color_dirtystate brblack
set __fish_git_prompt_color_upstream blue

# Status Chars
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_upstream_ahead ' ⇡'
set __fish_git_prompt_char_upstream_behind ' ⇣'
set __fish_git_prompt_char_upstream_equal ''


function fish_prompt
  set last_status $status

  set_color brgreen

  echo -n "
 % "

  set_color normal
end

function fish_right_prompt
  set last_status $status

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt) ' '

  set_color normal
end

