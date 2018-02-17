
let g:goyo_width=67              " Leave a few extra chars more than textwidth

" Map goyo.vim
nnoremap <leader>g :Goyo<cr>

function! s:goyo_enter() " On goyo enter:
  set nolist                  " Disable invisibles
  silent !tmux set status off " Hide tmux statusbar
  set noshowmode              " Don't show current mode
  set noshowcmd               " Don't show last command
  call aramis#syntax#prose()  " Call prose syntax function
  set scrolloff=999           " Centre current line
  set nocursorline            " Don't show cursor guide
  Limelight                   " Enable paragraph focus mode
endfunction

function! s:goyo_leave() " On goyo exit:
  colorscheme ia-light
  set nolist                 " Disable invisibles
  silent !tmux set status on " Show tmux statusbar
  set showmode               " Show current mode
  set showcmd                " Show last command
  call aramis#syntax#prose() " Call prose syntax function
  set scrolloff=5            " Show 5 lines of context when scrolling
  set cursorline             " Show cursor guide
  Limelight!                 " Disable paragraph focus mode
endfunction

autocmd! vimrc User GoyoEnter nested call <sid>goyo_enter()
autocmd! vimrc User GoyoLeave nested call <sid>goyo_leave()

