"
" Window title
"

if has('gui_running')
  " We don't have to do anything in the GUI because it already uses proxy icons
  " automatically
  set title
  set titlestring=%f\ —\ Vim

elseif $TERM_PROGRAM ==# 'Apple_Terminal'

  " Use chansend if we're in Nvim to send the appropriate escape codes to set
  " Terminal.app's proxy icon
  if has('nvim')
    function! ProxyIconTitle(prefix,suffix) abort
      let filenameurl = 'file://' . hostname() . expand('%:p')
      let filenameurl = 'file://' . hostname() . expand('%:p')
      let args = a:prefix . filenameurl . a:suffix
      let cmd = 'call chansend(2, "' . args . '")'
      execute cmd
    endfunction

    autocmd vimrc BufEnter,FocusGained * call ProxyIconTitle('\e]6;','')

    " Otherwise just hook into the 'title' option and apply the escape codes there
  else
    set title
    set t_ts=]6;
    set t_fs=

    set titlestring=%{bufname('%')==''?'':'file://'.hostname().expand('%:p:gs/\ /%20/')}
    set titlelen=0
  endif

  " Ignore all these proxy icon shenanigans if we're not running in Terminal.app
else
  set title
  set titlestring=%f
endif
