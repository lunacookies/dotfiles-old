
" vim: set foldmethod=marker foldlevel=0 nomodeline:

" =============================================================================
" SPACES AND INDENTS {{{1
" =============================================================================

set softtabstop=2      " 2 spaces per tab
set shiftwidth=2       " 2 spaces for indentation
set shiftround         " Always set indentation to a multiple of 2
set autoindent         " Copy indent from current line into adjacent line
set expandtab smarttab " Insert spaces when tab is pressed

" }}}1
" =============================================================================
" UI {{{1
" =============================================================================

" -----------------------------------------------------------------------------
" Colours and Text {{{2
" -----------------------------------------------------------------------------

set background=dark        " Dark background
set termguicolors           " True colour
set synmaxcol=790           " Maximum column in which to syntax highlight
set guifont=Input\ Mono:h11       " Set MacVim font
set listchars=trail:•       " Show trailing spaces with a •
set list                    " Enable showing invisibles
colorscheme base16-atelier-forest " Set colourscheme
let &t_ZH="\e[3m"           " Italics fix
let &t_ZR="\e[23m"

" }}}2
" -----------------------------------------------------------------------------
" Input Methods {{{2
" -----------------------------------------------------------------------------

set noimdisable " Fix Input Methods
set iminsert=1  " Enable lmap and disable IM
set imsearch=-1 " Makes it look like imi is used when typing a search pattern

" }}}2
" -----------------------------------------------------------------------------
" Wrapping {{{2
" -----------------------------------------------------------------------------

set wrap               " Wrap text
set linebreak          " Wrap at words
let &showbreak='↳ '    " Show occurrences of wrapped text
set breakindent        " Display indents before wrapped lines
set breakindentopt=sbr " Display  showbreak  before indent

" }}}2
" -----------------------------------------------------------------------------
" Command line {{{2
" -----------------------------------------------------------------------------

set completeopt=menuone,preview " Show possible completions with preview
set wildmenu                    " Enhanced command-line completion
set wildmode=full               " Complete the next full match
set showcmd                     " Show Ex commands
set noshowmode                  " Don't show standard mode indicator

" }}}2
" -----------------------------------------------------------------------------
" Window title {{{2
" -----------------------------------------------------------------------------

set titlestring=     " Reset what shows in window title
set titlestring+=%:t " Show filename and file path in window title
set title            " Show the window title

" }}}2
" -----------------------------------------------------------------------------
" Scrolling {{{2
" -----------------------------------------------------------------------------

set scrolloff=5      " Leave 5 lines at edges of window when scrolling vertically
set sidescrolloff=10 " Leave 10 lines at edges of window when scrolling horizontally
set sidescroll=1     " Scroll horizontally at edge of window

" }}}2
" -----------------------------------------------------------------------------
" Status line {{{2
" -----------------------------------------------------------------------------

set laststatus=2                           " Always show status line
set visualbell                             " Flash indicator on status line instead of bell
set statusline=                            " Reset status line
set statusline+=\ %8(%l\ :\ %-2v%)         " Lines and columns
set statusline+=\ %m                       " Modified/read-only flag
set statusline+=\ %{fugitive#statusline()} " Git branch
set statusline+=\ %=                       " Separator
set statusline+=\ %y                       " Filetype
                                           " Spacer
set statusline+=\ 

" }}}2
" -----------------------------------------------------------------------------
" Misc {{{2
" -----------------------------------------------------------------------------

set conceallevel=0        " Never conceal
set shortmess=aIT         " Abbreviate error messages
set numberwidth=4         " Leave space for 2 digits in line numbers
set guioptions=           " Hide scrollbars in MacVim
set nocursorline          " Never show cursor guide
set relativenumber        " Relative line numbers
set number                " Absolute line numbers
set lazyredraw            " Prevent unnecessary redrawing
" Don't show dashes when folding
set fillchars=fold:\ 
if exists('&colorcolumn') " Highlight 79th column
  set colorcolumn=80
endif

" }}}2
" -----------------------------------------------------------------------------

" }}}1
" =============================================================================
" SEARCHING {{{1
" =============================================================================

set hlsearch             " Highlight search matches
set incsearch            " Highlight as you type while searching
set ignorecase smartcase " Smart capitalisation handling

" }}}1
" =============================================================================
" FILES {{{1
" =============================================================================

set fileencoding=utf-8 " Write UTF-8
set encoding=utf-8     " Display UTF-8
set nrformats=hex      " Use hexadecimal and base ten
set sessionoptions-=options      " Do not save manually set options
set sessionoptions-=folds        " Do not save manually created folds
set undofile           " Keep undo history between sessions
set hidden             " A buffer becomes hidden when abandoned
set autoread           " Automatically read a file when it has been changed outside of vim

" }}}1
" =============================================================================
" EDITING {{{1
" =============================================================================

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

" }}}1
" =============================================================================

