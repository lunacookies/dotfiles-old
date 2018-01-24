
" vim: set foldmethod=marker foldlevel=0 nomodeline:

" ===========================================================================
" aramis' init.vim {{{1
" ===========================================================================

" /u/aramisreddit
" github.com/aramisgithub

" Inspired by
" github.com/junegunn
" github.com/Geospace
" gihub.com/herrbischoff

" }}}1
" ===========================================================================
" VIM-PLUG BLOCK {{{1
" ===========================================================================

" ---------------------------------------------------------------------------
" Begin plug {{{2
" ---------------------------------------------------------------------------

call plug#begin('~/.local/share/nvim/plugged')

" }}}
" ---------------------------------------------------------------------------
" Plugins {{{
" ---------------------------------------------------------------------------

Plug 'Yggdroot/indentLine'              " Indent guides
Plug 'dhruvasagar/vim-table-mode'       " Vim table mode for instant table creation
Plug 'jiangmiao/auto-pairs'             " Interact with brackets, parens, quotes in pair
Plug 'junegunn/fzf.vim'                 " fzf on vim
Plug 'junegunn/goyo.vim'                " Distraction-free writing
Plug 'junegunn/limelight.vim'           " Hyper-focus writing
Plug 'junegunn/rainbow_parentheses.vim' " Simpler Rainbow Parentheses
Plug 'junegunn/seoul256.vim'            " Low-contrast colour scheme based on Seoul Colours
Plug 'junegunn/vim-easy-align'          " A vim alignment plugin
Plug 'junegunn/vim-emoji'               " Emoji in vim
Plug 'junegunn/vim-journal'             " A syntax plugin for plain-text notes
Plug 'junegunn/vim-slash'               " Better searching
Plug 'reedes/vim-litecorrect'           " Lightweight auto-correction
Plug 'rhysd/vim-grammarous'             " A powerful grammar checker using LanguageTool
Plug 'tpope/vim-commentary'             " Comment stuff out
Plug 'tpope/vim-fugitive'               " Git wrapper for vim

" }}}
" ---------------------------------------------------------------------------
" End plug {{{
" ---------------------------------------------------------------------------

call plug#end()

" }}}2
" ---------------------------------------------------------------------------
" Automatic plug installation {{{2
" ---------------------------------------------------------------------------

autocmd VimEnter *
  \ if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | q
  \| endif

" }}}2
" ---------------------------------------------------------------------------

" }}}1
" ===========================================================================
" BASIC SETTINGS {{{1
" ===========================================================================

" ---------------------------------------------------------------------------
" Spaces and indents {{{2
" ---------------------------------------------------------------------------

set tabstop=2          " 2 spaces per tab
set shiftwidth=2       " 2 spaces for indentation
set shiftround         " Always set indentation to a multiple of 2
set autoindent         " Copy indent from current line into adjacent line
set expandtab smarttab " Insert spaces when tab is pressed

" }}}2
" ---------------------------------------------------------------------------
" UI {{{2
" ---------------------------------------------------------------------------

set laststatus=2                " Always show status line
set background=light            " Light background
set completeopt=menuone,preview " Show possible completions with preview
set conceallevel=0              " Never conceal
set shortmess=aIT               " Abbreviate error messages
set numberwidth=5               " Leave space for 3 digits in line numbers
set scrolloff=5                 " Leave 5 lines at edges of window when scrolling vertically
set sidescrolloff=10            " Leave 10 lines at edges of window when scrolling horizontally
set wrap                        " Wrap text
set linebreak                   " Wrap at words
set sidescroll=1                " Scroll horizontally at edge of window
let &showbreak='↳ '             " Show occurrences of wrapped text
set breakindent                 " Display indents before wrapped lines
set breakindentopt=sbr          " Display  showbreak  before indent
set guifont=Menlo:h12           " Set MacVim font
set imi=1                       " Enable lmap and disable IM
set ims=-1                      " makes it look like imi is used when typing a search pattern
set guioptions=                 " Hide scrollbars in MacVim
set synmaxcol=790               " Maximum column in which to syntax highlight
set wildmenu                    " Enhanced command-line completion
set wildmode=full               " Complete the next full match
set termguicolors               " True colour
set showcmd                     " Show Ex commands
set nocursorline                " Never show cursor guide
set visualbell                  " Flash screen instead of audio bell
set number                      " Line numbers
set lazyredraw                  " Prevent unnecessary redrawing
set noimd                       " Fix Input Methods
syntax enable                   " Enable syntax highlighting
colorscheme seoul256-light      " Set colour scheme
set titlestring=                " Reset what shows in window title
set titlestring+=%F             " Show filename and file path in window title
set title                       " Show the window title
if exists('&colorcolumn')       " Highlight 79th column
  set colorcolumn=79
endif
let &t_ZH="\e[3m"               " Italics fix
let &t_ZR="\e[23m"

" }}}2
" ---------------------------------------------------------------------------
" Searching {{{2
" ---------------------------------------------------------------------------

set hlsearch             " Highlight search matches
set incsearch            " Highlight as you type while searching
set ignorecase smartcase " Smart capitalisation handling

" }}}2
" ---------------------------------------------------------------------------
" Files {{{2
" ---------------------------------------------------------------------------

set fileencoding=utf-8 " Write UTF-8
set encoding=utf-8     " Display UTF-8
set nrformats=hex      " Use hexadecimal and base ten
set ssop-=options      " Do not save manually set options
set ssop-=folds        " Do not save manually created folds
set undofile           " Keep undo history between sessions
set hidden             " A buffer becomes hidden when abandoned
set autoread           " Automatically read a file when it has been changed outside of vim

" }}}
" ---------------------------------------------------------------------------
" Editing {{{2
" ---------------------------------------------------------------------------

set virtualedit=block " Allow cursor placement where characters are not in Visual Block
set formatoptions=1cj " Auto-format comments
set mouse=a           " Use mouse
set clipboard=unnamed " Use macOS clipboard
set timeoutlen=500    " Time in milliseconds to complete a shortcut
set textwidth=79      " 79 chars/line
set modelines=3       " Set how many lines are checked for set commands
set nojoinspaces      " Insert only one space after punctuation
set nostartofline     " Keep cursor on same column
set spell             " Spell check comments and text
set spelllang=en_gb   " Use British English
if exists('&fixeol')  " Handle end of lines at end of files
  set nofixeol
endif

" }}}2
" ---------------------------------------------------------------------------
" Status line {{{2
" ---------------------------------------------------------------------------

" function! s:statusline_expr()
"   let mod="%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
"   let ro="%{&readonly ? '[RO] ' : ''}"
"   let ft="%{len(&filetype) ? '['.&filetype.'] ' : ''}"
"   let fug="%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
"   let sep=' %='
"   let pos=' %-12(%l : %c%V%) '
"   let pct=' %P'

"   return ' %F %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
" endfunction
" let &statusline=s:statusline_expr()

" set statusline=
" set statusline+=\ %F
" set statusline+=\ %y
" set statusline+=\ %m
" set statusline+=\ %r
" set statusline+=\ %{fugitive#statusline()}
" set statusline+=\ %=
" set statusline+=\ %12(%l\ :\ %2v%)
" set statusline+=\ %5P
" set statusline+=\ 

set statusline=
set statusline+=\ %8(%l\ :\ %-2v%)
set statusline+=\ %m
set statusline+=\ %{fugitive#statusline()}
set statusline+=\ %=
set statusline+=\ %y
set statusline+=\ 

" }}}2
" ---------------------------------------------------------------------------

" }}}1
" ===========================================================================
" MAPPINGS {{{1
" ===========================================================================

" ---------------------------------------------------------------------------
" Escaping {{{2
" ---------------------------------------------------------------------------

inoremap jk <esc>
xnoremap fd <esc>
cnoremap jk <c-c>

" }}}2
" ---------------------------------------------------------------------------
" Leader {{{2
" ---------------------------------------------------------------------------

let mapleader=' '
let maplocalleader=' '

" }}}2
" ---------------------------------------------------------------------------
" Easy enter into command line mode {{{2
" ---------------------------------------------------------------------------

nnoremap ; :
nnoremap : ;

" }}}
" ---------------------------------------------------------------------------
" Save {{{
" ---------------------------------------------------------------------------

nnoremap <c-s> :w<cr>
inoremap <c-s> :w<cr>

" }}}2
" ---------------------------------------------------------------------------
" Quit {{{
" ---------------------------------------------------------------------------

nnoremap <c-q> :wq<cr>
inoremap <c-q> :wq<cr>

" }}}2
" ---------------------------------------------------------------------------
" Movement in insert mode {{{
" ---------------------------------------------------------------------------

inoremap <c-p> <left>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>

" }}}2
" ---------------------------------------------------------------------------
" Buffers {{{
" ---------------------------------------------------------------------------

nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

" }}}2
" ---------------------------------------------------------------------------
" Tabs {{{
" ---------------------------------------------------------------------------

nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>

" }}}
" ---------------------------------------------------------------------------
" Add newlines around cursor {{{
" ---------------------------------------------------------------------------

nnoremap ]<space> o<esc>cc<esc>k
nnoremap [<space> ko<esc>cc<esc>j

" }}}
" ---------------------------------------------------------------------------
" Exchange lines {{{
" ---------------------------------------------------------------------------

nnoremap ]e ddp
nnoremap [e dd2kp

" }}}
" ---------------------------------------------------------------------------
" Markdown headings {{{
" ---------------------------------------------------------------------------

nnoremap <leader>1 0i#<space><esc>
nnoremap <leader>2 0i##<space><esc>
nnoremap <leader>3 0i###<space><esc>
nnoremap <leader>4 0i####<space><esc>
nnoremap <leader>5 0i#####<space><esc>
nnoremap <leader>6 0i######<space><esc>

" }}}
" ---------------------------------------------------------------------------
" Thesaurus {{{
" ---------------------------------------------------------------------------

" Use <space>d on top of a word to look it up in Dictionary.app
nnoremap <leader>d :!open dict://<cword><cr><cr>

" }}}2
" ---------------------------------------------------------------------------
" Folds {{{2
" ---------------------------------------------------------------------------

nnoremap , za

" }}}2
" ---------------------------------------------------------------------------
" Upper-case current word {{{2
" ---------------------------------------------------------------------------

inoremap <c-u> <esc>lviwUea
nnoremap <c-u> viwUe

" }}}2
" ---------------------------------------------------------------------------

" }}}1
" ===========================================================================
" PLUGINS {{{1
" ===========================================================================

" ---------------------------------------------------------------------------
" vim-plug {{{2
" ---------------------------------------------------------------------------

let g:plug_window='-tabnew' " Open vim-plug in new tab

" }}}2
" ---------------------------------------------------------------------------
" indentLine {{{2
" ---------------------------------------------------------------------------

let g:indentLine_showFirstIndentLevel=1                  " Show indent guides at the first level as well
let g:indentLine_enabled=1                               " Enable indent guides by default
let g:indentLine_fileTypeExclude=['markdown', 'journal'] " Don't show indent guides in Markdown files
let g:indentLine_color_term=245                          " Set indent guide colour for terminal
let g:indentLine_color_gui='#8a8a8a'                     " Set indent guide colour for MacVim

" }}}
" ---------------------------------------------------------------------------
" goyo.vim + limelight.vim {{{
" ---------------------------------------------------------------------------

let g:limelight_paragraph_span=1 " Make limelight.vim span 3 paragraphs
let g:limelight_priority=-1      " Don't overrule hlsearch

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

" }}}
" ===========================================================================
" AUTOCMD {{{1
" ===========================================================================

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
  " Rainbow parentheses everywhere {{{
  " --------------------------------------------------------------------------

  autocmd BufEnter * :RainbowParentheses
  autocmd BufEnter .* :RainbowParentheses

  " }}}
  " --------------------------------------------------------------------------
  " Journal options {{{
  " --------------------------------------------------------------------------

  autocmd BufEnter,BufNewFile *.md set filetype=journal
  autocmd FileType journal set formatoptions=tacwq
  autocmd FileType journal set spell
  autocmd FileType journal set scrolloff=15
  autocmd FileType journal call litecorrect#init()
  autocmd FileType journal set nowrap
  autocmd FileType journal set textwidth=79

  " }}}
  " --------------------------------------------------------------------------

augroup END

" }}}1
" ===========================================================================

