" vim: set foldmethod=marker foldlevel=0 nomodeline:

" aramis' vimrc

"
" Basics
"

" Load the proper directories if this file is loaded by Nvim
if has('nvim')
  set runtimepath^=~/.vim runtimepath+=~/.vim/after
  let &packpath = &runtimepath
endif

" Use UTF-8 internally (Nvim always does this)
if !has('nvim')
  set encoding=utf-8
endif

" Load matchit.vim if it hasn't already been loaded
if !exists('g:loaded_matchit')
      \ && findfile('plugin/matchit.vim', &runtimepath) ==# ''
  runtime! macros/matchit.vim
endif

" Create the autocmd group used by all my autocmds (cleared when sourcing vimrc)
augroup vimrc
  autocmd!
augroup END

"
" vim-plug
"

" Install vim-plug if it hasn't been installed yet
"
" This has to be before everything else because the rest only works if vim-plug
" is installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Operators, textobjects, and mappings that fit with Vim
Plug 'junegunn/vim-easy-align'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'wellle/targets.vim'

" Light extensions to built-in features
Plug 'haya14busa/vim-asterisk'
Plug 'markonm/traces.vim'
Plug 'romainl/vim-cool'
Plug 'romainl/vim-qf'
Plug 'tmux-plugins/vim-tmux-focus-events'

" Completely new features
Plug 'lifepillar/vim-mucomplete'
Plug 'sgur/vim-editorconfig'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'wellle/visual-split.vim'

" Language support
Plug 'NLKNguyen/c-syntax.vim'
Plug 'arzg/vim-ruby', { 'for': 'ruby' }
Plug 'dearrrfish/vim-applescript'
Plug 'ericpruitt/tmux.vim'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'lifepillar/vim-colortemplate'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown'

" Nice colours
Plug 'romainl/Apprentice'

call plug#end()

" Install missing plugins automatically on startup
autocmd vimrc VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q | runtime vimrc
      \| endif

"
" Plug options
"

" Easy align

" Allow alignment of % character
let g:easy_align_delimiters = { '%': {
      \ 'pattern': '%\+', 'delimiter_align': 'l', 'ignore_groups': ['!Comment']
      \ }, }

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Cool

let g:CoolTotalMatches = 1 " Show number of matches in command line

" MUComplete

" Complete dictionary words first before looking for similar words in markdown
" files.
let g:mucomplete#chains = {
      \ 'vim':      [ 'path', 'omni', 'cmd', 'c-p' ],
      \ 'markdown': [ 'dict', 'c-p' ],
      \ 'default':  [ 'path', 'c-p', 'omni' ],
      \ }

" Asterisk

" Don't move after using *
map *  <Plug>(asterisk-z*)
map #  <Plug>(asterisk-z#)
map g* <Plug>(asterisk-gz*)
map g# <Plug>(asterisk-gz#)

" Stay in the same position on the match as from where you started
let g:asterisk#keeppos = 1

" Ruby

let ruby_space_errors       = 1 " Highlight whitespace errors
let ruby_fold               = 1 " Enable ruby syntax folding
let ruby_spellcheck_strings = 1 " Check for spelling errors in strings

"
" Options
"

" Editing

set backspace=2                       " Backspace over everything
set clipboard^=unnamed                " Use macOS clipboard when available
set dictionary+=/usr/share/dict/words " Larger dictionary
set formatoptions=1cjqr               " Wrap and join comments intelligently
set mouse=nvc                         " Use mouse in all modes except insert
set nojoinspaces                      " Insert only one space after punctuation
set nostartofline                     " Keep cursor on same column
set nrformats+=alpha                  " Allow incrementing single alphabetics
set nrformats-=octal                  " Do not consider octal numbers
set sessionoptions-=options           " Don't keep manually-set options
set spelllang=en_gb                   " Use British English
set tags=./tags;,tags                 " Where to search for tags
set textwidth=80                      " 80 chars/line
set virtualedit=block                 " Better visual block mode

" User interface and interactions

set belloff=all           " Disable all bells
set colorcolumn=+1        " Show a marker one char after textwidth
set completeopt+=menuone  " Show completions when there is a match
set completeopt+=noselect " Required for MUComplete
set completeopt+=preview  " Display extra info about the match
set conceallevel=0        " Never conceal
set display=lastline      " Show as much of partly-displayed lines as possible
set foldlevel=99          " Don't fold anything up by default
set guifont=Menlo:h14     " Use Menlo 14pt if running in MacVim
set guioptions=           " Hide scrollbars in MacVim
set laststatus=2          " Always display statusline
set lazyredraw            " Don't redraw during macros
set linespace=3           " Add a little bit of extra leading to tight Menlo
set numberwidth=5         " Make enough space for triple-digit line numbers
set pumheight=7           " Show 7 completion items before showing a scrollbar
set shortmess=acIT        " Abbreviate error messages
set showcmd               " Tells you if you press a non-alphabetic key
set splitbelow            " Create new splits to the bottom
set splitright            " Create new splits to the right
set tabpagemax=50         " Maximum number of tab pages

" Make redrawing smoother
if !has('nvim')
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

" Smart window title

" See README.md

function! ProxyIconTitle(prefix,suffix) abort
  " This is the format used by Terminal.app to specify what file is being
  " edited
  let filenameurl = 'file://' . hostname() . expand('%:p')

  " This is how the command used to specify the window title is structured in
  " both Vim and Nvim, so we specify it here
  let args = a:prefix . filenameurl . a:suffix

  if has('nvim')
    " We use Nvim's chansend to send the escape codes because it is more direct
    " than printf
    let cmd = 'call chansend(2, "' . args . '")'
    execute cmd
  else
    " Use printf to call escape sequence because chansend() is unique to Nvim
    let cmd = 'silent !printf "' . args . '"'
    execute cmd
    execute 'redraw!'
    execute 'redraw!'
  endif
endfunction

" Make the gui's window title match with the others
if has('gui_running')
  set title
  set titlestring=%t\ —\ gvim
else

  " Only run proxy icon code if we are in Terminal.app (no other terminal
  " emulators have implemented this feature)
  if $TERM_PROGRAM ==# 'Apple_Terminal'

    " Tmux requires different escape codes, so we check if we are in tmux and
    " set which escape codes are called accordingly.
    if $TERM ==# 'tmux-256color-italic'

      " Refresh window title on BufEnter (when switching files) and on
      " FocusGained (when switching tmux panes)
      "
      " This also sets the current window's name to the current filename
      autocmd vimrc BufEnter,FocusGained *
            \ call ProxyIconTitle('\ePtmux;\e\e]6;','\e\\')
            \ | call system("tmux rename-window $(echo " . expand("%:t") . ")")
    else

      autocmd vimrc BufEnter,FocusGained *
            \ call ProxyIconTitle('\e]6;','')
    endif
  else

    " If setting a proxy icon is unavailable ...
    if $TERM ==# 'tmux-256color-italic'

      " Set the current tmux window's name to the file currently being edited in
      " Vim
      autocmd vimrc BufEnter,FocusGained *
            \ call system("tmux rename-window $(echo " . expand("%:t") . ")")
    else

      " If we are not in tmux or in Terminal.app then set the window title to
      " the current filename and the current program (Vim or Nvim)
      set title
      if has('nvim')
        set titlestring=%t\ —\ nvim
      else
        set titlestring=%t\ —\ vim
      endif
    endif
  endif
endif

" Buffers and files

set autoread     " Read a file again if it has been modified outside of Vim
set hidden       " A buffer becomes hidden when abandoned
set path=$PWD/** " Recursively search directories

" Viminfo

set viminfo+=! " Save uppercase variables into viminfo (default behavoiur)

" Undo

" Only use persistent undo if Vim has it compiled in
if has('persistent_undo')
  set undodir=~/.vim/undo " Save undo history here
  set undofile            " Keep undo history between sessions

  " Automatically create directory for undo if it does not exist
  if !isdirectory(expand('~').'/.vim/undo')
    !mkdir -p $HOME/.vim/undo
  endif
endif

" Undo points
inoremap ! !<C-g>u
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap : :<C-g>u
inoremap ; ;<C-g>u
inoremap ? ?<C-g>u

" Backup

set backup                  " Make a backup of every file you open in Vim
set backupdir=~/.vim/backup " Save backups here

" Automatically create directory for backups if it does not exist
if !isdirectory(expand('~').'/.vim/backup')
  !mkdir -p $HOME/.vim/backup
endif

" Swapfiles

set swapfile                " Create swapfiles
set directory=~/.vim/swap// " Save swap files here

" Automatically create directory for swapfiles if it does not exist
if !isdirectory(expand('~').'/.vim/swap')
  !mkdir -p $HOME/.vim/swap
endif

" Searching, substitute, global, etc

set hlsearch   " Highlight search matches
set ignorecase " Ignore
set incsearch  " Jump to search results as you type
set smartcase  " Smarter capitalisation when searching

" Use ripgrep if available, fall back to the silver searcher, then fall back to
" the system grep for grepping
if executable('rg')
  set grepprg=rg\ --vimgrep\ -i
  set grepformat^=%f:%l:%c:%m
elseif executable('ag')
  set grepprg=ag\ --vimgrep\ -i
  set grepformat^=%f:%l:%c:%m
else
  set grepprg=grep\ -iR
endif

" Smarter grep command
command! -nargs=+ -complete=file_in_path -bar Grep
      \ silent! grep! <q-args> | redraw!

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
set shiftround   " Always set indentation to a multiple of 2
set smarttab     " Indent and dedent in insert mode using <Tab>

" Command-line

set history=1000     " Save a lot of command-line history
set wildcharm=<C-z>  " Use <C-z> when tab completing (for incsearch tab mapping)
set wildignorecase   " Ignore case when completing files and directories
set wildmenu         " Better command-line completion
set wildmode=longest " Complete the longest common string
set wildmode+=full   " … then each full match

"
" Statusline
"

" The file

set statusline=\     " Add space to start us off
set statusline+=%f\  " Filename relative to PWD

" Flags

set statusline+=%m   " Modified flag
set statusline+=%r   " Readonly flag
set statusline+=%=   " Separator to jump to the other side

" Position

set statusline+=%l   " Current line
set statusline+=\/   " Solidus
set statusline+=%-6L " Total lines in file (plus 6 padding on the right)
set statusline+=%3c  " Current column (padded for less than 4 chars)
set statusline+=\    " Finish off with a space

"
" 'Leader' mappings
"

" Comma

" Juggling with buffers
" Comma, how you want to view the buffer, then b
" 'b' for buffer
nnoremap ,b :ls<CR>:buffer<Space>
nnoremap ,sb :ls<CR>:sbuffer<Space>
nnoremap ,vb :ls<CR>:vert sbuffer<Space>
nnoremap ,tb :tabnew<CR>:ls<CR>:buffer<Space>
nnoremap ,, :bnext<CR>

" Juggling with files
" Same for opening new files, just replace b with f (for recursive, just like
" :find) or e (for non-recursive, just like :edit)
" 'f' for find
" 'e' for edit
nnoremap ,f :find<Space>
nnoremap ,e :edit<Space>
nnoremap ,sf :sfind<Space>
nnoremap ,vf :vert sfind<Space>
nnoremap ,tf :tabfind<Space>
nnoremap ,se :split<Space>
nnoremap ,ve :vsplit<Space>
nnoremap ,te :tabnew<Space>

" Juggling with windows
" Same bindings for split/vsplit/tab as above, just double the letter *or* wait
" for the timeout
nnoremap ,s :split<CR>
nnoremap ,ss :split<CR>
nnoremap ,t :tabnew<CR>
nnoremap ,tt :tabnew<CR>
nnoremap ,v :vsplit<CR>
nnoremap ,vv :vsplit<CR>

" Project-wide search
" 'g' for grep
nnoremap ,g :Grep<Space>

" Close stuff
" 'c' for close
nnoremap ,c :close<CR>
" 'tc' for tabclose
nnoremap ,tc :tabclose<CR>

" Space

" Add a command that allows you to reindent a range without moving the cursor
command! -range=% Equal let b:wv = winsaveview() | silent execute <line1> . ',' . <line2> . 'normal! ==' | call winrestview(b:wv)

" Auto-indent the whole file
" 'i' for indent
nnoremap <Space>i :Equal<CR>

" Sort the current paragraph alphabetically
" 's' for sort
nnoremap <Space>s mzvip:sort<CR>`z

" Redraw the screen
" 'r' for redraw
nnoremap <Space>r :redraw!<CR>

" Run the linter/compiler
" 'm' for make
nnoremap <Space>m :update<CR>:make<CR>

" Quick 'n' easy find-and-replace
"
" Repeat previous keystroke for current paragraph
" d for whole document

" The current word/selection
" No prefix
nnoremap <Space><Space> :'{,'}s/\<<C-r>=expand('<cword>')<CR>\>/
nnoremap <Space>d       :%s/\<<C-r>=expand('<cword>')<CR>\>/
xnoremap <Space><Space> y:'{,'}s/<C-r>=@<CR>/
xnoremap <Space>d       y:%s/<C-r>=@<CR>/

" Type a word
" f for FNR
nnoremap <Space>ff :'{,'}s/
nnoremap <Space>fd       :%s/
xnoremap <Space>ff :'<,'>s/

"
" Misc mappings
"

" Jump through incsearch matches with <Tab>
cnoremap <expr> <Tab>   getcmdtype()
      \ == "/" \|\| getcmdtype()
      \ == "?" ? "<CR>/<C-r>/" : "<C-z>"

cnoremap <expr> <S-Tab> getcmdtype()
      \ == "/" \|\| getcmdtype()
      \ == "?" ? "<CR>?<C-r>/" : "<S-Tab>"

" Mapping to search in the current screen
nnoremap <silent> \ :set scrolloff=0<CR>VHoL<Esc>:set scrolloff=1<CR>``<C-y>/\%V

" Code                 | Purpose
" ---                  | ---
" :set scrolloff=0<CR> | Disable scrolloff so that we can select everything
" VHol<Esc>            | Select everything on screen, then exit visual mode
" :set scrolloff=1<CR> | Enable scrolloff again
" ``                   | Jump back to the last position
" <C-y>                | Scroll up one line to correct for scrolloff changes
" /\%V                 | Start a search in the last visual selection

" Move around splits more easily
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move by screen lines, except when a count is given. This is for the relative
" line numbers used for quick jumps around.
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" Make Y behave like other capitals (why does everyone use this exact comment
" for this option? Because we all steal our vimrcs from other people? Or am
" I being cynical?).
nnoremap Y y$

" Autoexpansion
inoremap (<CR> (<CR>)<Esc>O
inoremap {<CR> {<CR>}<Esc>O
inoremap {; {<CR>};<Esc>O
inoremap {, {<CR>},<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap [; [<CR>];<Esc>O
inoremap [, [<CR>],<Esc>O

"
" Autocmds
"

" Show highlight group when pressing F10
nnoremap <F10> :echo "hi<"
      \ . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Set makeprg to the appropriate linter for a given filetype
autocmd vimrc FileType ruby setlocal makeprg=ruby\ -c\ %
autocmd vimrc FileType sh   setlocal makeprg=shellcheck\ --format=gcc\ %

" Only show the cursorline in the current window, but still display it once
" focus has been lost to make it easier to find the cursor
autocmd vimrc VimEnter,WinEnter * set cursorline
autocmd vimrc WinLeave * set nocursorline

"
" Colourscheme
"

" Colourscheme modifications

" Better syntax highlighting for VimScript
autocmd vimrc ColorScheme * hi! link vimAutoCmdSfxList Type
autocmd vimrc ColorScheme * hi! link vimFunction       Function
autocmd vimrc ColorScheme * hi! link vimIsCommand      Statement
autocmd vimrc ColorScheme * hi! link vimUserFunc       Function

" Un-reversed mode marker, in bold now
autocmd vimrc ColorScheme apprentice hi! ModeMsg cterm=bold,reverse gui=bold,reverse

" Make the selected completion entry grey and bold, retheming the rest of the
" completion menu to match better
autocmd vimrc ColorScheme apprentice hi! PmenuSel   ctermbg=240 guibg=#585858
      \ ctermfg=250 guifg=#bcbcbc cterm=bold gui=bold
autocmd vimrc ColorScheme apprentice hi! PmenuSbar  ctermbg=236 guibg=#303030
      \ cterm=NONE  gui=NONE
autocmd vimrc ColorScheme apprentice hi! PmenuThumb ctermbg=240 guibg=#585858
      \ cterm=NONE  gui=NONE

" Operator Mono-style italics
autocmd vimrc ColorScheme * hi! Comment cterm=italic gui=italic
autocmd vimrc ColorScheme * hi! String  cterm=italic gui=italic
autocmd vimrc ColorScheme * hi! Type    cterm=italic gui=italic
autocmd vimrc ColorScheme * hi! htmlArg cterm=italic gui=italic

" Acually set the colourscheme
colorscheme apprentice
