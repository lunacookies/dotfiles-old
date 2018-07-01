" aramis' init.vim



""
"" Basics
""

" Encoding, UTF-8, other backend stuff

if !has('nvim')
  let &termencoding = &encoding " Keyboard and terminal both  use utf-8
endif

if !has('nvim')
  set encoding=utf-8            " Use utf-8 internally (nvim always does this)
endif

setglobal fileencoding=utf-8    " Set default file encoding
scriptencoding utf-8            " This file uses some utf-8 symbols
set fileencodings=ucs-bom,utf-8 " Sets how (n)vim detects the current encoding
set fileformat=unix             " Unix file format
set nolangremap                 " Assume English keyboard

" Load matchit.vim if it hasn't already been loaded
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &runtimepath) ==# ''
  runtime! macros/matchit.vim
endif

" Load plugins with packages if available; otherwise load them with pathogen
if !has('packages')
  execute pathogen#infect('pack/aramis/start/{}')
  if !has('nvim')
    execute pathogen#infect('pack/aramis/opt/traces.vim')
  endif
else
  if !has('nvim')
    packadd traces.vim
  endif
endif

" Allow syntax colouring, filetype detection, and built-in plugins
filetype plugin indent on

" Enable syntax colouring
if !exists('g:syntax_on')
  syntax enable
endif

" Create autocmd group used by all my autocmds (cleared when sourcing vimrc)
augroup vimrc
  autocmd!
augroup END


""
"" Plug options
""

" Easy align

" Allow alignment of % character
let g:easy_align_delimiters = { '%': {
      \ 'pattern': '%\+', 'delimiter_align': 'l', 'ignore_groups': ['!Comment']
      \ }, }

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Goyo

let g:goyo_width = 68 " Leave a few extra chars more than textwidth

function! s:goyo_enter() " On goyo enter:
  set noshowcmd          " Don't show last command
  set scrolloff=999      " Centre current line
  Limelight              " Enable paragraph focus mode
endfunction

function! s:goyo_leave() " On goyo exit:
  set showcmd            " Show last command
  set scrolloff=1        " Show 1 line of context when scrolling
  Limelight!             " Disable paragraph focus mode
endfunction

" Activate respective function on goyo enter and leave
autocmd! vimrc User GoyoEnter nested call <sid>goyo_enter()
autocmd! vimrc User GoyoLeave nested call <sid>goyo_leave()

" Limelight

let g:limelight_default_coefficient = 0.6 " Set dimmed paragraph colour
let g:limelight_priority            = -1  " Don't overrule hlsearch

" Polyglot

let g:polyglot_disabled = [ 'markdown', 'ruby', 'swift', ]
"                            |           |       |
"                            |           |       +- Use toyamarinyon swift
"                            |           |          instead
"                            |           +- Use my fork of vim-ruby instead of
"                            |              the official one
"                            +- Replace plasticboy markdown with tpope markdown

" Sneak

let g:sneak#use_ic_scs = 1 " Use ignorecase + smartcase
let g:sneak#label      = 1 " Use label mode

" Cool

let g:CoolTotalMatches = 1 " Show number of matches in command line


""
"" Options
""

" Editing

set backspace=2             " Backspace over everything
set clipboard^=unnamed      " Use macOS clipboard when available
set formatoptions=1cjqr     " Wrap and join comments intelligently
set mouse=nvc               " Enable mouse in all modes except insert mode
set nojoinspaces            " Insert only one space after punctuation
set nostartofline           " Keep cursor on same column
set nrformats+=alpha        " Allow incrementing single alphabetics
set nrformats-=octal        " Do not consider some numbers to be octal
set sessionoptions-=options " Do not save manually-set options in sessions
set spelllang=en_gb         " Use British English
set tags=./tags;,tags       " Where to search for tags
set textwidth=80            " 80 chars/line
set virtualedit=block       " Allow cursor placement anywhere in V-block

" User interface and interactions

set belloff=all       " Disable all bells
set colorcolumn=+1    " Highlight one column after textwidth
set complete-=i       " Don't show completion messages
set conceallevel=0    " Never conceal
set cursorline        " Make the current line more prominent
set display=lastline  " Show as much of partially-displayed lines as possible
set guioptions=       " Hide scrollbars in MacVim
set laststatus=2      " Always display statusline
set lazyredraw        " Don't redraw during macros
set list              " Show invisibles
set listchars=trail:• " Display a bullet point on trailing spaces
set shortmess=acIT    " Abbreviate error messages
set showcmd           " Tells you if you press a non-alphabetic key
set splitbelow        " Create new splits to the bottom
set splitright        " Create new splits to the right
set tabpagemax=50     " Maximum number of tab pages

" Smart window title

if has('nvim')
  function! SetTerminalTitle() abort
    let titleString = 'file://'.expand('%:p')
    let args = ']6;'.titleString.''
    let cmd = 'call chansend(2, "'.args.'")'
    execute cmd
  endfunction

  if !has('gui_running')
    autocmd vimrc BufEnter * call SetTerminalTitle()
  endif
else
  set title
  if !has('gui_running')
    set t_ts=]6;
    set t_fs=
    set titlestring=%{bufname('%')==''?'':'file://'.hostname().expand('%:p:gs/\ /%20/')}
    set titlelen=0
  else
    set titlestring=%F
  endif
endif

" Make redrawing smoother
if !('nvim')
  set ttyfast
endif

" Time out mapping after 100ms
if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

" Dynamic cursor shape that does not blink
if has('nvim')
  set guicursor=n-v-c-ci:block,i-ve:ver25,r-cr:hor20,o:hor50,n:blinkon0
else
  let &t_SI.="\e[5 q"
  let &t_SR.="\e[4 q"
  let &t_EI.="\e[1 q"
endif

" Buffers and files

set autoread     " Read a file again if it has been modified outside of vim
set hidden       " A buffer becomes hidden when abandoned
set path=$PWD/** " Recursively search directories

" Juggling with buffers
nnoremap <Space>b :ls<CR>:buffer<Space>
nnoremap <Space><Space> :bnext<CR>

" Juggling with files
nnoremap <Space>f :find<Space>
nnoremap <Space>e :edit<Space>

" Small/temporary files and undo

set viminfo+=!
set backup                               " Make a backup of every file you open in vim
set backupdir=~/.local/share/nvim/backup " Save backups here
set swapfile                             " Create swapfiles
set directory=~/.local/share/nvim/swap// " Save swap files here
set undodir=~/.local/share/nvim/undo     " Save undo history here
set undofile                             " Keep undo history between sessions

" Undo points
inoremap ! !<C-g>u
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap : :<C-g>u
inoremap ; ;<C-g>u
inoremap ? ?<C-g>u

" Searching, substitute, global, etc

set gdefault   " Replace all instances on a line by default (use /g to disable)
set hlsearch   " Highlight search matches
set ignorecase " Ignore
set incsearch  " Jump to search results as you type
set smartcase  " Smarter capitalisation when searching

" Jump through incsearch matches with <Tab>
cnoremap <expr> <Tab>   getcmdtype()
      \ == "/" \|\| getcmdtype()
      \ == "?" ? "<CR>/<C-r>/" : "<C-z>"

cnoremap <expr> <S-Tab> getcmdtype()
      \ == "/" \|\| getcmdtype()
      \ == "?" ? "<CR>?<C-r>/" : "<S-Tab>"

" Live preview of substitute command
if has('nvim')
  set inccommand=split
endif

" Wrapping and scrolling

if exists('+breakindent')
  let &showbreak = '››› ' " Mark which lines have been wrapped with three arrows
  set breakindent         " Display indents before wrapped lines
  set breakindentopt=sbr  " Display  showbreak  before indent
endif
if has('linebreak')
  set linebreak           " Don't break words
endif
set scrolloff=1           " Show one line of context around the cursor
set sidescroll=1          " Scroll horizontally when wrapping is disabled
set sidescrolloff=5       " Show five columns of context around the cursor
set wrap                  " Soft wrap text

" Indentation

set autoindent   " Copy the previous line's indent to the current one
set expandtab    " Insert spaces when tab is pressed
set shiftround   " Always set indentation to a multiple of 2
set shiftwidth=2 " 2 spaces for indentation
set smarttab     " Indent and dedent in insert mode using <Tab>
let &softtabstop = &shiftwidth

" Command-line

set history=10000   " Save as many lines of command-line history as possible
set wildcharm=<C-z> " Send <C-z> when tab completing (for incsearch tab mapping)
set wildmenu        " Better command-line completion
set wildmode=full   " Complete the next full match


""
"" Statusline
""

function! s:statusline_expr()
  let l:mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
  let l:ro  = "%{&readonly ? '[RO] ' : ''}"
  let l:ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
  let l:fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
  let l:sep = ' %= '
  let l:pos = ' %-12(%l : %c%V%) '
  let l:pct = ' %P'

  return ' [%n] %F %<'.l:mod.ro.ft.fug.sep.pos.'%*'.l:pct.' '
endfunction
let &statusline = s:statusline_expr()


""
"" Mappings
""

" Command-line mode
nnoremap <CR> :
xnoremap <CR> :

" Escape from modes
inoremap jk <Esc>`^
xnoremap fd <Esc>
cnoremap jk <C-c>

" Do not jump to the next match automatically
nnoremap * *N
nnoremap # #N
nnoremap g* g*N
nnoremap g# g#N

" Autoexpansion
inoremap (<CR> (<CR>)<Esc>O
inoremap {<CR> {<CR>}<Esc>O
inoremap {; {<CR>};<Esc>O
inoremap {, {<CR>},<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap [; [<CR>];<Esc>O
inoremap [, [<CR>],<Esc>O

" Move by screen lines, except when a count is given. This is for the relative
" line numbers used for quick jumps around.
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" Make Y behave like other capitals
nnoremap Y y$

" Alignment
nmap <Space>" mz<Plug>(EasyAlign)ip*"`z
nmap <Space># mz<Plug>(EasyAlign)ip*#`z
nmap <Space>% mz<Plug>(EasyAlign)ip*%`z
nmap <Space>& mz<Plug>(EasyAlign)ip*&`z
nmap <Space>' mz<Plug>(EasyAlign)ip*"`z
nmap <Space>, mz<Plug>(EasyAlign)ip*,`z
nmap <Space>. mz<Plug>(EasyAlign)ip*.`z
nmap <Space>: mz<Plug>(EasyAlign)ip*:`z
nmap <Space>= mz<Plug>(EasyAlign)ip*=`z
nmap <Space>t mz<Plug>(EasyAlign)ip*\|`z
xmap <Space>" mz<Plug>(EasyAlign)*"`z
xmap <Space># mz<Plug>(EasyAlign)*#`z
xmap <Space>% mz<Plug>(EasyAlign)*%`z
xmap <Space>& mz<Plug>(EasyAlign)*&`z
xmap <Space>' mz<Plug>(EasyAlign)*"`z
xmap <Space>, mz<Plug>(EasyAlign)*,`z
xmap <Space>. mz<Plug>(EasyAlign)*.`z
xmap <Space>: mz<Plug>(EasyAlign)*:`z
xmap <Space>= mz<Plug>(EasyAlign)*=`z
xmap <Space>t mz<Plug>(EasyAlign)*\|`z

" LaTeX + pandoc mappings
nnoremap <Space>a :call aramis#functions#pandocconvertarticle()<CR>
nnoremap <Space>c :call aramis#functions#pandocclean()<CR>
nnoremap <Space>p :call aramis#functions#pandocconvertpres()<CR>
nnoremap <Space>r :call aramis#functions#pandocconvertreport()<CR>

" Closing/saving
nnoremap <Space>q :wq<CR>
nnoremap <Space>w :write<CR>
nnoremap <Space>x :Sayonara<CR>

" Distraction-free writing
nnoremap <Space>g :Goyo<CR>
nnoremap <Space>l :Limelight!!<CR>

" Auto-indent
nnoremap <Space>i mzgg=G`zzz

" Sort
nnoremap <Space>s mzvip:sort<CR>`z

" Search in all currently opened buffers
command! -nargs=1 Vim call aramis#functions#vimgrepall(<f-args>)
nnoremap <Space>v :Vim<Space>


""
"" Autocmds
""

" Do not show whitespace in insert mode
autocmd vimrc InsertEnter * set nolist
autocmd vimrc InsertLeave * set list

" Set tmux window name to vim filename
autocmd vimrc BufReadPost,FileReadPost,BufNewFile *
      \ call system("tmux rename-window " . expand("%:t"))

" Write name of current markdown file to ~/.currentfile for automatic LaTeX
" compilation
autocmd vimrc BufReadPost,BufWritePost,FileReadPost,BufNewFile *.md
      \ call system('echo ' . expand('%:p') . ' > $HOME/.currentfile')

" Show highlight group when pressing F10
nnoremap <F10> :echo "hi<"
      \ . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Automatically show quickfix list
autocmd vimrc QuickFixCmdPost [^l]* cwindow
autocmd vimrc QuickFixCmdPost    l* lwindow
autocmd vimrc VimEnter            * cwindow


""
"" Colourscheme
""

" Custom vim interface
autocmd vimrc ColorScheme * highlight! ModeMsg gui=reverse, cterm=reverse

" Better syntax highlighting
autocmd vimrc ColorScheme * highlight! link    Sneak               Search
autocmd vimrc ColorScheme * highlight! link    rubyKeywordAsMethod rubyString
autocmd vimrc ColorScheme * highlight! link    vimAutoCmdSfxList   Type
autocmd vimrc ColorScheme * highlight! link    vimIsCommand        Statement

" Set colourscheme
colorscheme apprentice
