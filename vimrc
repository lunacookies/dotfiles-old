" Make Nvim source the normal Vim directories so that this config can be used
" with it too
if has('nvim')
  set runtimepath^=~/.vim runtimepath+=~/.vim/after
  let &packpath = &runtimepath
endif

" Load plugins
call pathogen#infect()

" Filetype detection
filetype plugin indent on

" Syntax highlighting
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Create a base autogroup that resets itself upon sourcing of the vimrc. This
" means all autocmds that are in this group are cleared when the vimrc is
" sourced, preventing them from piling up and slowing Vim down.
augroup vimrc
  autocmd!
augroup END

"
" Options
"

" Basic
set clipboard=unnamed
set hidden
set laststatus=2
set path& | let &path .= "**"
set wildmenu

" Fixing Vim's crazy defaults
set backspace=indent,eol,start
set belloff=all
set display=lastline
set nrformats-=octal
set sessionoptions-=options

" Indentation
set autoindent
set shiftround
set smarttab

" Search and patterns
set hlsearch
set ignorecase
set incsearch
set smartcase

" Wrapping and scrolling
set linebreak
set sidescroll=1
set sidescrolloff=5

" Misc
set autoread
set history=10000
set lazyredraw
set mouse=a
set showcmd
set tabpagemax=50
if !has('nvim')
  set encoding=utf-8
  set ttyfast
endif

" Place annoying swap files in /tmp
set backupdir=/tmp//,.
set directory=/tmp//,.
if has('persistent_undo')
  set undodir=/tmp//,.
endif

"
" Mappings
"

" Basic and subtle Vim improvement

" Make Y consistent with how the other capital commands work
nnoremap Y y$

" Move by displayed lines instead of actual lines
nnoremap <expr> k      v:count == 0 ? 'gk' : 'k'
nnoremap <expr> j      v:count == 0 ? 'gj' : 'j'
nnoremap <expr> <Up>   v:count == 0 ? 'gk' : 'k'
nnoremap <expr> <Down> v:count == 0 ? 'gj' : 'j'

" Reselect visual selection after modifying its indentation
xnoremap > >gv
xnoremap < <gv

" Comma

" Juggling with buffers
nnoremap ,b :ls<CR>:buffer<Space>
nnoremap ,sb :ls<CR>:sbuffer<Space>
nnoremap ,vb :ls<CR>:vert sbuffer<Space>
nnoremap ,tb :tabnew<CR>:ls<CR>:buffer<Space>
nnoremap ,, :bnext<CR>

" Juggling with files
nnoremap ,f :find<Space>
nnoremap ,e :edit<Space>
nnoremap ,sf :sfind<Space>
nnoremap ,vf :vert sfind<Space>
nnoremap ,tf :tabfind<Space>
nnoremap ,se :split<Space>
nnoremap ,ve :vsplit<Space>
nnoremap ,te :tabnew<Space>

" Juggling with windows
nnoremap ,s :split<CR>
nnoremap ,ss :split<CR>
nnoremap ,t :tabnew<CR>
nnoremap ,tt :tabnew<CR>
nnoremap ,v :vsplit<CR>
nnoremap ,vv :vsplit<CR>

"
" Autocmds
"

" Jump to the last known cursor position upon opening a file
autocmd vimrc BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

" Save on focus lost
autocmd vimrc FocusLost * update

" Smart window title

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

    set titlestring=
          \ %{bufname('%')==''?'':'file://' .
          \ hostname() .
          \ expand('%:p:gs/\ /%20/')}
    set titlelen=0
  endif

" Ignore all these proxy icon shenanigans if we're not running in Terminal.app
else
  set title
  set titlestring=%f
endif

"
" Plugin config
"

" Netrw

let g:netrw_banner    = 0    " Hide annoying 'help' banner
let g:netrw_liststyle = 3    " Use tree view
let g:netrw_winsize   = '30' " Smaller default window size

"
" Colours
"

colorscheme apprentice

