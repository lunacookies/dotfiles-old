" aramis' init.vim


""
"" Basics
""

" Create autocmd group
augroup vimrc
  autocmd!
augroup END

" Map leader
let g:mapleader      = ' ' " Regular leader
let g:maplocalleader = ' ' " Local leader


""
"" Plugin
""

" Install missing plugs
autocmd vimrc VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q
      \| endif

" Install plug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd vimrc VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mhinz/vim-sayonara'
Plug 'romainl/vim-cool'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'wellle/targets.vim'

call plug#end()


""
"" Colourscheme
""

" Operator Mono-style italic syntax kighlighting
autocmd vimrc ColorScheme * highlight Comment    gui=italic cterm=italic
autocmd vimrc ColorScheme * highlight Identifier gui=italic cterm=italic
autocmd vimrc ColorScheme * highlight Special    gui=italic cterm=italic
autocmd vimrc ColorScheme * highlight Type       gui=italic cterm=italic
autocmd vimrc ColorScheme * highlight htmlArg    gui=italic cterm=italic

" More syntax hghlighting in autocmds
autocmd vimrc ColorScheme * highlight! link vimAutoCmdSfxList Type

autocmd vimrc ColorScheme * highlight clear ALEErrorSign
autocmd vimrc ColorScheme * highlight clear ALEWarningSign
autocmd vimrc ColorScheme * highlight clear SignColumn

" Set colourscheme
colorscheme ubuntu


""
"" Options
""

let &showbreak = '↳ '           " Show occurrences of wrapped text
set breakindent                 " Display indents before wrapped lines
set breakindentopt=sbr          " Display  showbreak  before indent
set clipboard=unnamed           " Use macOS clipboard
set colorcolumn=+1              " Show dark column after textwidth
set completeopt=menuone,preview " Show possible completions with preview
set conceallevel=0              " Never conceal
set encoding=utf-8              " Display UTF-8
set expandtab                   " Insert spaces when tab is pressed
set foldenable                  " Always use folding
set foldlevel=3                 " Almost never fold by default
set foldmethod=indent           " Fold based on indentation level
set formatoptions=1cjroq        " Auto-format comments
set gdefault                    " Replace all instances on a line by default
set guioptions=                 " Hide scrollbars in MacVim
set hidden                      " A buffer becomes hidden when abandoned
set hlsearch                    " Highlight search matches
set ignorecase                  " Ignore capitalisation …
set lazyredraw                  " Prevent unnecessary redrawing
set linebreak                   " Wrap at words
set list                        " Enable showing invisibles
set listchars=trail:•           " Set invisibles
set modelines=1                 " Set how many lines are checked for set commands
set mouse=a                     " Use mouse
set nojoinspaces                " Insert only one space after punctuation
set noshowmode                  " Don't show standard mode indicator
set nospell                     " Do not spell check
set nostartofline               " Keep cursor on same column
" set scrolloff=5                 " Leave a 5 line margin when scrolling
set sessionoptions-=folds       " Do not save manually created folds
set shiftround                  " Always set indentation to a multiple of 2
set shiftwidth=2                " 2 spaces for indentation
set shortmess=acIT              " Abbreviate error messages
set showcmd                     " Show Ex commands
set smartcase                   " … except if something has been capitalised
set softtabstop=2               " 2 spaces per tab
set spelllang=en_gb             " Use British English
set splitbelow                  " Create new splits to the bottom
set splitright                  " Create new splits to the right
set synmaxcol=790               " Maximum column in which to syntax highlight
set textwidth=80                " 80 chars/line
set title                       " Show the window title
set titlestring=%t              " Show filename and file path in window title
set undofile                    " Keep undo history between sessions
set updatetime=1000             " Call CursorHold lint event after 1 second
set virtualedit=block           " Allow cursor placement where characters are not in Visual Block
set wildmode=full               " Complete the next full match
set wrap                        " Wrap text
setglobal fileencoding=utf-8    " Write UTF-8


""
"" Neovim
""

" Live preview of substitute command
if has('nvim')
  set inccommand=split
endif

" Blinking cursor
if has('nvim')
  set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
        \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
        \,sm:block-blinkwait175-blinkoff150-blinkon175
endif


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
nnoremap <cr> :
xnoremap <cr> :

" Escape from modes
inoremap jk <esc>
xnoremap fd <esc>
cnoremap jk <c-c>

" Tabs
nnoremap gt :tabnew<cr>
nnoremap ]t :tabnext<cr>
nnoremap ]t :tabprev<cr>

" Markdown headers
nnoremap <leader>1 mmI#<space><esc>`m2l
nnoremap <leader>2 mmI##<space><esc>`m3l
nnoremap <leader>3 mmI###<space><esc>`m4l
nnoremap <leader>4 mmI####<space><esc>`m5l
nnoremap <leader>5 mmI#####<space><esc>`m6l
nnoremap <leader>6 mmI######<space><esc>`m7l

" Move between errors/warnings
nnoremap ]w :ALENextWrap<cr>
nnoremap [w :ALEPreviousWrap<cr>

" Undo points
inoremap ! !<C-g>u
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap : :<C-g>u
inoremap ; ;<C-g>u
inoremap ? ?<C-g>u

" Make Y behave like other capitals
nnoremap Y y$

" Alignment
nmap <leader>" mz<Plug>(EasyAlign)ip*"`z
nmap <leader># mz<Plug>(EasyAlign)ip*#`z
nmap <leader>% mz<Plug>(EasyAlign)ip*%`z
nmap <leader>& mz<Plug>(EasyAlign)ip*&`z
nmap <leader>' mz<Plug>(EasyAlign)ip*"`z
nmap <leader>, mz<Plug>(EasyAlign)ip*,`z
nmap <leader>. mz<Plug>(EasyAlign)ip*.`z
nmap <leader>: mz<Plug>(EasyAlign)ip*:`z
nmap <leader>= mz<Plug>(EasyAlign)ip*=`z
nmap <leader>t mz<Plug>(EasyAlign)ip*\|`z
xmap <leader>" mz<Plug>(EasyAlign)*"`z
xmap <leader># mz<Plug>(EasyAlign)*#`z
xmap <leader>% mz<Plug>(EasyAlign)*%`z
xmap <leader>& mz<Plug>(EasyAlign)*&`z
xmap <leader>' mz<Plug>(EasyAlign)*"`z
xmap <leader>, mz<Plug>(EasyAlign)*,`z
xmap <leader>. mz<Plug>(EasyAlign)*.`z
xmap <leader>: mz<Plug>(EasyAlign)*:`z
xmap <leader>= mz<Plug>(EasyAlign)*=`z
xmap <leader>t mz<Plug>(EasyAlign)*\|`z

" Leader
nmap <leader>t mz<Plug>(EasyAlign)ip*\|`z
nnoremap <leader><leader> :bnext<cr>
nnoremap <leader>a :call aramis#pandoc#convertarticle()<cr>
nnoremap <leader>c :call aramis#pandoc#clean()<cr>
nnoremap <leader>d :!open dict://<cword><cr><cr>
nnoremap <leader>f mzgggqG`z
nnoremap <leader>g :Goyo<cr>
nnoremap <leader>h :nohlsearch<cr>
nnoremap <leader>i mzgg=G`zzz
nnoremap <leader>l :Limelight!!<cr>
nnoremap <leader>p :call aramis#pandoc#convertpres()<cr>
nnoremap <leader>q :wq<cr>
nnoremap <leader>r :call aramis#pandoc#convertreport()<cr>
nnoremap <leader>s mzvip:sort<cr>`z
nnoremap <leader>x :Sayonara<cr>
nnoremap <silent> <leader>fb :Buffers<cr>
nnoremap <silent> <leader>ff :Files<cr>
nnoremap <silent> <leader>fl :Lines<cr>
xmap <leader>t mz<Plug>(EasyAlign)*\|`z


""
"" Autocmds
""

" Do not show whitespace in insert mode
autocmd vimrc InsertEnter * set nolist
autocmd vimrc InsertLeave * set list

" Set tmux window name to vim filename
autocmd vimrc BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%:t"))

" Write name of current markdown file to ~/.currentfile for automatic LaTeX
" compilation
autocmd vimrc BufReadPost,BufWritePost,FileReadPost,BufNewFile *.md call system('echo ' . expand('%:p') . ' > $HOME/.currentfile')

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

