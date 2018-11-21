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

" Make Nvim source the normal Vim directories so that this config can be used
" with it too
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

"
" Options
"

" Basic
set clipboard=unnamed
set hidden
set laststatus=2
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

"
" Mappings
"

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
