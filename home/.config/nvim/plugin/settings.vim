
" Colors {{{1

set background=light                             " Light background
set termguicolors                                " True colour
set synmaxcol=790                                " Maximum column in which to syntax highlight
set guifont=Input\ Mono:h11                      " Set MacVim font
set listchars=eol:¬,trail:⋅,extends:❯,precedes:❮ " Set invisibles
set list                                         " Enable showing invisibles
                                                 " Set colourscheme
colorscheme ia-light

" }}}1
" Command-line {{{1

set completeopt=menuone,preview " Show possible completions with preview
set wildmenu                    " Enhanced command-line completion
set wildmode=full               " Complete the next full match
set showcmd                     " Show Ex commands
set noshowmode                  " Don't show standard mode indicator

" }}}2
" Editing {{{1

set virtualedit=block    " Allow cursor placement where characters are not in Visual Block
set formatoptions=1cjroq " Auto-format comments
set mouse=a              " Use mouse
set clipboard=unnamed    " Use macOS clipboard
set timeoutlen=500       " Time in milliseconds to complete a shortcut
set textwidth=79         " 79 chars/line
set nomodeline           " Set how many lines are checked for set commands
set nojoinspaces         " Insert only one space after punctuation
set nostartofline        " Keep cursor on same column
set spell                " Spell check comments and text
set spelllang=en_gb      " Use British English
if exists('&fixeol')     " Handle end of lines at end of files
  set nofixeol
endif

" }}}1
" Files {{{1

set fileencoding=utf-8      " Write UTF-8
set encoding=utf-8          " Display UTF-8
set nrformats=hex           " Use hexadecimal and base ten
set sessionoptions-=options " Do not save manually set options
set sessionoptions-=folds   " Do not save manually created folds
set undofile                " Keep undo history between sessions
set hidden                  " A buffer becomes hidden when abandoned
set autoread                " Automatically read a file when it has been changed outside of vim

" }}}1
" Spaces and Indents {{{1

set softtabstop=2      " 2 spaces per tab
set shiftwidth=2       " 2 spaces for indentation
set shiftround         " Always set indentation to a multiple of 2
set autoindent         " Copy indent from current line into adjacent line
set expandtab smarttab " Insert spaces when tab is pressed

" }}}1
" Interface {{{1

set conceallevel=0 " Never conceal
set shortmess=aIT  " Abbreviate error messages
set numberwidth=4  " Leave space for 2 digits in line numbers
set guioptions=    " Hide scrollbars in MacVim
set cursorline     " Always show cursor guide
set relativenumber " Relative line numbers
set number         " Absolute line numbers
set lazyredraw     " Prevent unnecessary redrawing
                   " Don't show dashes when folding
set fillchars=fold:\ 
set fillchars+=vert:\│
set colorcolumn=80 " Show marker at 80 columns

" }}}1
" Scrolling {{{1

set scrolloff=5      " Leave 5 lines at edges of window when scrolling vertically
set sidescrolloff=10 " Leave 10 lines at edges of window when scrolling horizontally
set sidescroll=1     " Scroll horizontally at edge of window

" }}}1
" Searching {{{1

set hlsearch             " Highlight search matches
set incsearch            " Highlight as you type while searching
set ignorecase smartcase " Smart capitalisation handling
set inccommand=split     " Live preview of substitute command

" }}}1
" Window title {{{1

set titlestring=     " Reset what shows in window title
set titlestring+=%:t " Show filename and file path in window title
set title            " Show the window title

" }}}1
" Wrapping {{{1

set wrap               " Wrap text
set linebreak          " Wrap at words
let &showbreak='↳ '    " Show occurrences of wrapped text
set breakindent        " Display indents before wrapped lines
set breakindentopt=sbr " Display  showbreak  before indent

" }}}1

