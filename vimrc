" Make Nvim source the normal Vim directories so that this config can be used
" with it too
if has('nvim')
  set runtimepath^=~/.vim runtimepath+=~/.vim/after
  let &packpath = &runtimepath
endif

" Filetype detection
filetype plugin indent on

" Syntax highlighting
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Load matchit.vim
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
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
set nostartofline
set nrformats-=octal
set sessionoptions-=options

" Indentation
set autoindent
set shiftround
set smarttab

" Search and patterns
set ignorecase
set incsearch
set smartcase

" Wrapping and scrolling
let &showbreak = '››› '
set breakindent
set breakindentopt=sbr
set linebreak
set sidescroll=1
set sidescrolloff=5

" Splits
set splitbelow
set splitright

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

" Undo and annoying temporary files
set backupdir=/tmp//,.
set directory=/tmp//,.
if has('persistent_undo')
  set undofile
  set undodir=/tmp//,.
endif

" Dynamic cursor shape
if has('nvim')
  set guicursor=n-v:block,i-ve-c-ci:ver25,r-cr:hor20,o:hor50,n:blinkon0
else
  let &t_SI.="\e[5 q"
  let &t_SR.="\e[4 q"
  let &t_EI.="\e[1 q"
endif

"
" Statusline
"

set statusline=\     " Add space to start us off
set statusline+=%f\  " Filename relative to PWD
set statusline+=%y\  " Filetype

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
" Mappings
"

" I aim to make these mappings subtly and slight improvements upon Vim defaults,
" meaning that if I try to use them on a vanilla Vim, there will only be a small
" annoyance, and a similar behaviour will occur.

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

" Use <F10> to display the highlight group under the cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"
" Juggling
"

" A few cstom setting/commands/mappings that aim to lightly augument Vim through
" common patterns (e.g. comma mappings)

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

" Juggling with searches

" Jump through incsearch matches with <Tab>
cnoremap <expr> <Tab>   getcmdtype()
      \ == "/" \|\| getcmdtype()
      \ == "?" ? "<CR>/<C-r>/" : "<C-z>"
cnoremap <expr> <S-Tab> getcmdtype()
      \ == "/" \|\| getcmdtype()
      \ == "?" ? "<CR>?<C-r>/" : "<S-Tab>"

" NOTE: This is required because the above mappings remap <Tab> to jump to the
" next incsearch match, but if we press <Tab> while _not_ searching they return
" <C-z>, which we now map to go to the next wildmode completion item.
set wildcharm=<C-z>

" Use ripgrep if available, fall back to the silver searcher, then fall back to
" the system grep for grepping
if executable('rg')
  set grepprg=rg\ --vimgrep\ --ignore-case\ --column
  set grepformat^=%f:%l:%c:%m
elseif executable('ag')
  set grepprg=ag\ --vimgrep\ --ignore-case\ --column
  set grepformat^=%f:%l:%c:%m
else
  set grepprg=grep\ --recursive\ --ignore-case
endif

" Smarter grep command
command! -nargs=+ -complete=file_in_path -bar Grep
      \ silent! grep! <q-args> | redraw!

nnoremap ,g :Grep<Space>

" Juggling with formatting

" Keep cursor position when reformatting
command! -range=% Equal let b:wv = winsaveview() | silent execute <line1> . ',' . <line2> . 'normal! ==' | call winrestview(b:wv)

nnoremap ,i :Equal<CR>

"
" Autocmds
"

" Jump to the last known cursor position upon opening a file
autocmd vimrc BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   execute "normal! g`\""
      \ | endif

" Save on focus lost
autocmd vimrc FocusLost * update

" Use completion based on the syntax highlighting in the current file if a
" smarter method of completion has not yet been defined.
autocmd vimrc FileType *
      \	if &omnifunc == "" |
      \	  setlocal omnifunc=syntaxcomplete#Complete |
      \	endif

" Hide cursorline in insert mode and all windows apart from the current one
autocmd vimrc InsertEnter       * setlocal nocursorline
autocmd vimrc InsertLeave       * setlocal cursorline
autocmd vimrc VimEnter,WinEnter * setlocal cursorline
autocmd vimrc WinLeave          * setlocal nocursorline

"
" Plugin config
"

" Netrw

let g:netrw_banner    = 0    " Hide annoying 'help' banner
let g:netrw_liststyle = 3    " Use tree view
let g:netrw_winsize   = '30' " Smaller default window size

" Cool

let g:CoolTotalMatches = 1 " Show total of matches in the command line

"
" Colours
"

colorscheme apprentice
