let g:goyo_width = 66 " Leave a few extra chars more than textwidth

function! s:goyo_enter() " On goyo enter:
  set noshowmode        " Don't show current mode
  set noshowcmd         " Don't show last command
  set scrolloff=999     " Centre current line
  Limelight             " Enable paragraph focus mode
endfunction

function! s:goyo_leave() " On goyo exit:
  set showmode          " Show current mode
  set showcmd           " Show last command
  set scrolloff=5       " Show 1 lines of context when scrolling
  Limelight!            " Disable paragraph focus mode
endfunction

" Activate respective function on goyo enter and leave
autocmd! vimrc User GoyoEnter nested call <sid>goyo_enter()
autocmd! vimrc User GoyoLeave nested call <sid>goyo_leave()

