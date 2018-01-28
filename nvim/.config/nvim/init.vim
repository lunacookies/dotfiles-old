
" vim: set foldmethod=marker foldlevel=0 nomodeline:

" =============================================================================
" aramis' init.vim {{{1
" =============================================================================

" /u/aramisreddit
" github.com/aramisgithub

" Inspired by
" github.com/junegunn
" github.com/Geospace
" gihub.com/herrbischoff

" }}}1
" =============================================================================
" VIM-PLUG BLOCK {{{1
" =============================================================================

" -----------------------------------------------------------------------------
" Begin plug {{{2
" -----------------------------------------------------------------------------

call plug#begin('~/.local/share/nvim/plugged')

" }}}2
" -----------------------------------------------------------------------------
" Plugins {{{2
" -----------------------------------------------------------------------------

Plug 'SirVer/ultisnips'                                  " The ultimate snippet solution for Vim
Plug 'Yggdroot/indentLine'                               " Indent guides
Plug 'dbmrq/vim-ditto',            { 'for': 'markdown' } " Stop repeating yourself
Plug 'drzel/vim-scroll-off-fraction'
Plug 'dhruvasagar/vim-table-mode', { 'for': 'markdown' } " Vim table mode for instant table creation
Plug 'dkarter/bullets.vim',        { 'for': 'markdown' } " Automated bullet lists
Plug 'jiangmiao/auto-pairs'                              " Interact with brackets, parens, quotes in pair
Plug 'junegunn/goyo.vim',          { 'for': 'markdown' } " Distraction-free writing
Plug 'junegunn/fzf.vim'
Plug '/usr/local/opt/fzf'
Plug 'nanotech/jellybeans.vim'
Plug 'junegunn/limelight.vim',     { 'for': 'markdown' } " Hyper-focus writing
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-entire'                           " Text objects for entire buffer
Plug 'kana/vim-textobj-indent'                           " Text objects for indented blocks of lines
Plug 'kana/vim-textobj-line'                             " Text objects for the current line
Plug 'kana/vim-textobj-user'                             " Create your own text objects
Plug 'reedes/vim-litecorrect',     { 'for': 'markdown' } " Lightweight auto-correction
Plug 'w0rp/ale'
Plug 'romainl/flattened'                                 " Solarized, without the bullshit
Plug 'takac/vim-hardtime'                                " Stop repeating hjkl
Plug 'tpope/vim-abolish'                                 " Act on multiple variants of a word
Plug 'tpope/vim-commentary'                              " Comment stuff out
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'                                " Git wrapper for vim
Plug 'tpope/vim-markdown',         { 'for': 'markdown' } " Vim Markdown runtime files
Plug 'tpope/vim-repeat'                                  " Repeat plugin maps
Plug 'tpope/vim-surround'                                " Quoting/parenthesising made simple
Plug 'tpope/vim-unimpaired'                              " Pairs of handy bracket mappings
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'mbbill/undotree'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" }}}2
" -----------------------------------------------------------------------------
" End plug {{{2
" -----------------------------------------------------------------------------

call plug#end()

" }}}2
" -----------------------------------------------------------------------------
" Automatic plug installation {{{2
" -----------------------------------------------------------------------------

autocmd VimEnter *
  \ if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | q
  \| endif

" }}}2
" -----------------------------------------------------------------------------

" }}}1
" =============================================================================
" BASIC SETTINGS {{{1
" =============================================================================

" -----------------------------------------------------------------------------
" Spaces and indents {{{2
" -----------------------------------------------------------------------------

set softtabstop=2      " 2 spaces per tab
set shiftwidth=2       " 2 spaces for indentation
set shiftround         " Always set indentation to a multiple of 2
set autoindent         " Copy indent from current line into adjacent line
set expandtab smarttab " Insert spaces when tab is pressed

" }}}2
" -----------------------------------------------------------------------------
" UI {{{2
" -----------------------------------------------------------------------------

set laststatus=2                " Always show status line
set background=light            " Light background
set completeopt=menuone,preview " Show possible completions with preview
set conceallevel=0              " Never conceal
set shortmess=aIT               " Abbreviate error messages
set numberwidth=4               " Leave space for 2 digits in line numbers
set scrolloff=5                 " Leave 5 lines at edges of window when scrolling vertically
set sidescrolloff=10            " Leave 10 lines at edges of window when scrolling horizontally
set wrap                        " Wrap text
set linebreak                   " Wrap at words
set sidescroll=1                " Scroll horizontally at edge of window
set listchars=trail:•           " Show trailing spaces with a •
set list                        " Enable showing invisibles
let &showbreak='↳ '             " Show occurrences of wrapped text
set breakindent                 " Display indents before wrapped lines
set breakindentopt=sbr          " Display  showbreak  before indent
set guifont=Input:h11           " Set MacVim font
set imi=1                       " Enable lmap and disable IM
set ims=-1                      " Makes it look like imi is used when typing a search pattern
set guioptions=                 " Hide scrollbars in MacVim
set synmaxcol=790               " Maximum column in which to syntax highlight
set wildmenu                    " Enhanced command-line completion
set wildmode=full               " Complete the next full match
set termguicolors               " True colour
set showcmd                     " Show Ex commands
set nocursorline                " Never show cursor guide
set visualbell                  " Flash screen instead of audio bell
set relativenumber              " Relative line numbers
set lazyredraw                  " Prevent unnecessary redrawing
set noimd                       " Fix Input Methods

" Set colourscheme according to current time of day.
let hr = str2nr(strftime('%H'))
if hr < 7 || hr >= 16
    let cs = 'flattened_dark'
else
    let cs = 'flattened_light'
endif
execute 'colorscheme '.cs

set titlestring=                " Reset what shows in window title
set titlestring+=%F             " Show filename and file path in window title
set title                       " Show the window title
if exists('&colorcolumn')       " Highlight 79th column
  set colorcolumn=80
endif
let &t_ZH="\e[3m"               " Italics fix
let &t_ZR="\e[23m"

" }}}2
" -----------------------------------------------------------------------------
" Searching {{{2
" -----------------------------------------------------------------------------

set hlsearch             " Highlight search matches
set incsearch            " Highlight as you type while searching
set ignorecase smartcase " Smart capitalisation handling

" }}}2
" -----------------------------------------------------------------------------
" Files {{{2
" -----------------------------------------------------------------------------

set fileencoding=utf-8 " Write UTF-8
set encoding=utf-8     " Display UTF-8
set nrformats=hex      " Use hexadecimal and base ten
set ssop-=options      " Do not save manually set options
set ssop-=folds        " Do not save manually created folds
set undofile           " Keep undo history between sessions
set hidden             " A buffer becomes hidden when abandoned
set autoread           " Automatically read a file when it has been changed outside of vim

" }}}2
" -----------------------------------------------------------------------------
" Editing {{{2
" -----------------------------------------------------------------------------

set virtualedit=block    " Allow cursor placement where characters are not in Visual Block
set formatoptions=1cjroq " Auto-format comments
set mouse=a              " Use mouse
set clipboard=unnamed    " Use macOS clipboard
set timeoutlen=500       " Time in milliseconds to complete a shortcut
set textwidth=79         " 79 chars/line
set modelines=3          " Set how many lines are checked for set commands
set nojoinspaces         " Insert only one space after punctuation
set nostartofline        " Keep cursor on same column
set spell                " Spell check comments and text
set spelllang=en_gb      " Use British English
if exists('&fixeol')     " Handle end of lines at end of files
  set nofixeol
endif

" }}}2
" -----------------------------------------------------------------------------
" Status line {{{2
" -----------------------------------------------------------------------------

set statusline=
set statusline+=\ %8(%l\ :\ %-2v%)
set statusline+=\ %m
set statusline+=\ %{fugitive#statusline()}
set statusline+=\ %=
set statusline+=\ %y
set statusline+=\ 

" }}}2
" -----------------------------------------------------------------------------

" }}}1
" =============================================================================
" MAPPINGS {{{1
" =============================================================================

" -----------------------------------------------------------------------------
" Escaping {{{2
" -----------------------------------------------------------------------------

" Insert mode
inoremap jk <esc>

" Visual mode
xnoremap fd <esc>

" Ex command-line mode
cnoremap jk <c-c>

" }}}2
" -----------------------------------------------------------------------------
" Navigating splits {{{2
" -----------------------------------------------------------------------------

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" }}}2
" -----------------------------------------------------------------------------
" Leader {{{2
" -----------------------------------------------------------------------------

let mapleader=' '      " Regular leader
let maplocalleader=' ' " Local  leader

" }}}2
" -----------------------------------------------------------------------------
" Easy enter into command line mode {{{2
" -----------------------------------------------------------------------------

" Normal mode
nnoremap ; :
nnoremap : ;

" Visual mode
xnoremap ; :
xnoremap : ;

" }}}2
" -----------------------------------------------------------------------------
" Save {{{2
" -----------------------------------------------------------------------------

nnoremap <c-s> :w<cr> " Save in normal mode
inoremap <c-s> :w<cr> " Save in insert mode too

" }}}2
" -----------------------------------------------------------------------------
" Quit {{{2
" -----------------------------------------------------------------------------

nnoremap <c-q> :wq<cr> " Save and quit in normal mode
inoremap <c-q> :wq<cr> " Save and quit in insert mode too

" }}}2
" -----------------------------------------------------------------------------
" Markdown headings {{{2
" -----------------------------------------------------------------------------

nnoremap <leader>1 0i#<space><esc>0
nnoremap <leader>2 0i##<space><esc>0
nnoremap <leader>3 0i###<space><esc>0
nnoremap <leader>4 0i####<space><esc>0
nnoremap <leader>5 0i#####<space><esc>0
nnoremap <leader>6 0i######<space><esc>0

" }}}2
" -----------------------------------------------------------------------------
" Thesaurus {{{2
" -----------------------------------------------------------------------------

" Use <space>d on top of a word to look it up in Dictionary.app
nnoremap <leader>d :!open dict://<cword><cr><cr>

" }}}2
" -----------------------------------------------------------------------------
" Folds {{{2
" -----------------------------------------------------------------------------

nnoremap , za

" }}}2
" -----------------------------------------------------------------------------
" Upper-case current word {{{2
" -----------------------------------------------------------------------------

inoremap <c-u> <esc>lviwUea
nnoremap <c-u> viwUe

" }}}2
" -----------------------------------------------------------------------------

" }}}1
" =============================================================================
" PLUGINS {{{1
" =============================================================================

" -----------------------------------------------------------------------------
" vim-plug {{{2
" -----------------------------------------------------------------------------

let g:plug_window='-tabnew' " Open vim-plug in new tab

" }}}2
" -----------------------------------------------------------------------------
" indentLine {{{2
" -----------------------------------------------------------------------------

let g:indentLine_showFirstIndentLevel=1       " Show indent guides at the first level as well
let g:indentLine_enabled=1                    " Enable indent guides by default
let g:indentLine_fileTypeExclude=['markdown'] " Don't show indent guides in Markdown files
let g:indentLine_color_tty_light=14           " Set indent guide colour for terminal
let g:indentLine_color_gui='#93a1a1'          " Set indent guide colour for MacVim

" }}}2
" -----------------------------------------------------------------------------
" goyo.vim + limelight.vim {{{2
" -----------------------------------------------------------------------------

let g:limelight_paragraph_span=1 " Make limelight.vim span 3 paragraphs
let g:goyo_width=85              " Leave space for line numbers
let g:limelight_priority=-1      " Don't overrule hlsearch
let g:goyo_linenr=1              " Show line numbers in Goyo mode

nnoremap <leader>g :Goyo<cr>        " Map goyo.vim
nnoremap <leader>l :Limelight!!<cr> " Map limelight.vim

function! s:goyo_enter()
  set scrolloff=999
  Limelight
endfunction

function! s:goyo_leave()
  set scrolloff=5
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <sid>goyo_enter()
autocmd! User GoyoLeave nested call <sid>goyo_leave()


" }}}2
" ---------------------------------------------------------------------------
" vim-easy-align {{{2
" ---------------------------------------------------------------------------

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <plug>(EasyAlign)

" }}}2
" ---------------------------------------------------------------------------
" vim-table-mode {{{2
" ---------------------------------------------------------------------------

function! s:isAtStartOfLine(mapping)
  let text_before_cursor=getline('.')[0 : col('.')-1]
  let mapping_pattern='\V' . escape(a:mapping, '\')
  let comment_pattern='\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor=~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
  \ <sid>isAtStartOfLine('\|\|') ?
  \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'

inoreabbrev <expr> __
  \ <sid>isAtStartOfLine('__') ?
  \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" }}}
" ---------------------------------------------------------------------------

" }}}1
" =============================================================================
" AUTOCMD {{{1
" =============================================================================

augroup vimrc

  " --------------------------------------------------------------------------
  " Help in new tabs {{{2
  " --------------------------------------------------------------------------

  function! s:helptab()
    if &buftype=='help'
      wincmd T
      nnoremap <buffer> q :q<cr>
    endif
  endfunction
  autocmd vimrc BufEnter *.txt call s:helptab()

  " }}}2
  " --------------------------------------------------------------------------

augroup END

" }}}1
" =============================================================================

