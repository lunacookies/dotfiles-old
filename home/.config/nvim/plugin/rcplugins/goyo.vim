
Plug 'junegunn/goyo.vim' " Distraction-free writing

let g:goyo_width=67 " Leave a few extra chars more than textwidth

function! s:goyo_enter()     " On goyo enter:
  set nonumber               " Disable line numbers
  set norelativenumber       " Disable relative line numbers
  set nolist                 " Disable invisibles
  set noshowmode             " Don't show current mode
  set noshowcmd              " Don't show last command
  call aramis#syntax#prose() " Call prose syntax function
  set scrolloff=999          " Centre current line
  set nocursorline           " Don't show cursor guide
  Limelight                  " Enable paragraph focus mode
endfunction

function! s:goyo_leave()     " On goyo exit:
  set number                 " Enable line numbers
  set relativenumber         " Enable relative line numbers
  set nolist                 " Disable invisibles
  set showmode               " Show current mode
  set showcmd                " Show last command
  call aramis#syntax#prose() " Call prose syntax function
  set scrolloff=5            " Show 5 lines of context when scrolling
  set cursorline             " Show cursor guide
  Limelight!                 " Disable paragraph focus mode
endfunction

autocmd! vimrc User GoyoEnter nested call <sid>goyo_enter()
autocmd! vimrc User GoyoLeave nested call <sid>goyo_leave()

" Map goyo.vim
nnoremap <silent> <leader>g :Goyo<cr>

