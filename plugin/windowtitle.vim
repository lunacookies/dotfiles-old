"
" Window title
"

function! ProxyIconTitle(prefix,suffix) abort
  " This is the format used by Terminal.app to specify what file is being
  " edited
  let filenameurl = 'file://' . hostname() . expand('%:p')

  " This is how the command used to specify the window title is structured in
  " both Vim and Nvim, so we specify it here
  let args = a:prefix . filenameurl . a:suffix

  if has('nvim')
    " We use Nvim's chansend to send the escape codes because it is more direct
    " than printf
    let cmd = 'call chansend(2, "' . args . '")'
    execute cmd
  else
    " Use printf to call escape sequence because chansend() is unique to Nvim
    let cmd = 'silent !printf "' . args . '"'
    execute cmd
    execute 'redraw!'
    execute 'redraw!'
  endif
endfunction

" Make the gui's window title match with the others
if has('gui_running')
  set title
  set titlestring=%t\ —\ gvim
else

  " Only run proxy icon code if we are in Terminal.app (no other terminal
  " emulators have implemented this feature)
  if $TERM_PROGRAM ==# 'Apple_Terminal'

    " Tmux requires different escape codes, so we check if we are in tmux and
    " set which escape codes are called accordingly.
    if $TERM ==# 'tmux-256color-italic'
      " Refresh window title on BufEnter (when switching files)
      autocmd vimrc BufEnter,FocusGained *
            \ call ProxyIconTitle('\ePtmux;\e\e]6;','\e\\')
    else
      autocmd vimrc BufEnter,FocusGained *
            \ call ProxyIconTitle('\e]6;','')
    endif
  else

    " If we are not in tmux or in Terminal.app then set the window title to
    " the current filename and 'Vim':
    "
    " We do this because tmux handles the window title for us -- all we need to
    " do is set the current tmux tab's name to be the current file's name, which
    " we do further below:
    if $TERM !=# 'tmux-256color-italic'
      set title
      set titlestring=%t\ —\ Vim
    endif
  endif

  " Set the current tmux tab's name to the file currently being edited in
  " Vim, but only if we are in tmux
  if $TERM ==# 'tmux-256color-italic'
    autocmd vimrc BufEnter,FocusGained *
          \ call system("tmux rename-window $(echo " . expand("%:t") . ")")
  endif
endif
