
" vim: set foldmethod=marker foldlevel=0 nomodeline:

" ----------------------------------------------------------------------------
" Spaces and indents {{{
" ----------------------------------------------------------------------------

set autoindent         " Copy indent from current line into adjacent line
set tabstop=2          " 2 spaces per tab
set shiftwidth=2       " 2 spaces for indentation
set expandtab smarttab " Insert spaces when tab is pressed

" }}}
" ----------------------------------------------------------------------------
" UI {{{
" ----------------------------------------------------------------------------

set laststatus=2                " Always show status line
let &t_ZH="\e[3m"               " Italics fix
let &t_ZR="\e[23m"
if !exists("g:syntax_on")       " Enable syntax highlighting
  syntax on
endif
set bg=dark                     " Dark background
set nocursorline                " Never show cursor guide
set visualbell                  " Flash screen instead of audio bell
set number                      " Line numbers
if has('termguicolors')         " True colour where supported
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set showcmd                     " Show Ex commands
set completeopt=menuone,preview " Show possible completions with preview
set conceallevel=0              " Never conceal
set wildmenu                    " Ex command completion
set wildmode=full
set lazyredraw                  " Prevent unnecessary redrawing
set shortmess=aIT               " Abbreviate error messages
if has('patch-7.4.338')         " Show line wraps
  let &showbreak = '↳ '
  set breakindent
  set breakindentopt=sbr
endif
set scrolloff=5                 " Always leave 5 lines at edges of window when scrolling
set guifont=Menlo:h12           " Set MacVim font
set noimd                       " Fix Input Methods
set imi=1
set ims=-1
set guioptions=                 " Hide scrollbars in MacVim
set synmaxcol=790               " Maximum column in which to syntax highlight
colorscheme seoul256            " Set colourscheme

" }}}
" ----------------------------------------------------------------------------
" Searching {{{
" ----------------------------------------------------------------------------

set hlsearch             " Highlight search matches
set incsearch            " Highlight as you type while searching
set ignorecase smartcase " Smart capitalisation handling

" }}}
" ----------------------------------------------------------------------------
" Files {{{
" ----------------------------------------------------------------------------

set encoding=utf-8     " UTF-8 encoding for better compatibility and future-proof
set autoread           " Automatically read a file when it has been changed outside of vim
set nrformats=hex      " Use hexadecimal and base ten
set hidden             " A buffer becomes hidden when abandoned
set ssop-=options      " Do not store global, local values or folds in a session
set ssop-=folds
set backupdir=/tmp//,. " Annoying temporary files
set directory=/tmp//,.
if v:version >= 703
  set undodir=/tmp//,.
endif

" }}}
" ----------------------------------------------------------------------------
" Editing {{{
" ----------------------------------------------------------------------------

set virtualedit=block  " Allow cursor placement where characters are not in Visual Block
set nojoinspaces       " Insert only one space after punctuation
set formatoptions+=1cj " Auto-format comments
set wrap               " Wrap text
set linebreak          " Break text at convenient places
set mouse=a            " Use mouse
set clipboard=unnamed  " Use macOS clipboard
set timeoutlen=500     " Time in milliseconds to complete a shortcut
set textwidth=79       " 79 chars/line
set nostartofline      " Keep the cursor on the same column
set modelines=2        " Set how many lines are checked for set commands
if exists('&fixeol')   " Handle end of lines at end of files
  set nofixeol
endif

" }}}
" ----------------------------------------------------------------------------
" Status line {{{
" ----------------------------------------------------------------------------

function! s:statusline_expr()
  let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
  let ro  = "%{&readonly ? '[RO] ' : ''}"
  let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
  let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
  let sep = ' %= '
  let pos = ' %-12(%l : %c%V%) '
  let pct = ' %P'

  return ' %F %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
endfunction
let &statusline = s:statusline_expr()

" }}}
" ----------------------------------------------------------------------------

