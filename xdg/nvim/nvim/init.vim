" vim: set foldmethod=marker foldlevel=0 nomodeline:

" aramis' init.vim


""
"" Basics
""

" Create autocmd group
augroup vimrc
  autocmd!
augroup END

" Map leader
let mapleader      = ' ' " Regular leader
let maplocalleader = ' ' " Local leader


""
"" Plugs
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

" General utilities

Plug 'mhinz/vim-sayonara'   " Close windows in a smart way
Plug 'romainl/vim-cool'     " Better search
Plug 'sheerun/vim-polyglot' " Syntax for many languages
Plug 'tpope/vim-endwise'    " Auto-close if's and for's
Plug 'tpope/vim-eunuch'     " UNIX command helpers
Plug 'tpope/vim-repeat'     " Repeat plugin maps
Plug 'tpope/vim-sensible'   " Sets a bunch of sensible settings
Plug 'tpope/vim-unimpaired' " Many mappings in the style of [s

" Operators and textobjects

Plug 'AndrewRadev/splitjoin.vim' " Switch between single and multiline code
Plug 'junegunn/vim-easy-align'   " Alignments
Plug 'justinmk/vim-sneak'        " Two character f
Plug 'kana/vim-textobj-entire'   " Textobj for entire buffer
Plug 'kana/vim-textobj-indent'   " Textobj for common indentation level
Plug 'kana/vim-textobj-line'     " Textobj targeting the current line
Plug 'kana/vim-textobj-user'     " Backend for custom textobj
Plug 'tomtom/tcomment_vim'       " Comment out code
Plug 'tpope/vim-surround'        " Easily change delimiters
Plug 'wellle/targets.vim'        " Access textobj from anywhere in line

" Everything else

Plug '/usr/local/opt/fzf'
Plug 'Raimondi/delimitMate'           " Auto-close pairs
Plug 'ajh17/VimCompletesMe'           " Completion
Plug 'christoomey/vim-tmux-navigator' " Move seamlessly between tmux and vim
Plug 'junegunn/fzf.vim'               " Fuzzy finding
Plug 'junegunn/goyo.vim'              " Distraction-free mode
Plug 'junegunn/limelight.vim'         " Focus mode

call plug#end()


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

" fzf

" Set colours
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment']
      \ }

" Do not show statusline in fzf
autocmd vimrc FileType fzf set noshowmode noruler
      \| autocmd BufLeave <buffer> set showmode ruler

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

let g:limelight_conceal_ctermfg     = '240' " Set dimmed paragraph colour
let g:limelight_priority            = -1    " Don't overrule hlsearch

" Polyglot

let g:polyglot_disabled = ['markdown'] " Disable plasticboy markdown

" Sneak

let g:sneak#use_ic_scs = 1 " Use ignorecase + smartcase
let g:sneak#label      = 1 " Use label mode


""
"" Options
""

let &showbreak = '↳ '           " Show occurrences of wrapped text
set breakindent                 " Display indents before wrapped lines
set breakindentopt=sbr          " Display  showbreak  before indent
set clipboard=unnamed           " Use macOS clipboard
set colorcolumn=+1              " Show vertical line after textwidth
set completeopt=menuone,preview " Show possible completions with preview
set conceallevel=0              " Never conceal
set encoding=utf-8              " Display UTF-8
set expandtab                   " Insert spaces when tab is pressed
set foldenable                  " Always use folding
set foldlevel=3                 " Almost never fold by default
set foldmethod=indent           " Fold based on indentation level
set formatoptions=1acjqr        " Auto-format comments
set gdefault                    " Replace all instances on a line by default
set guioptions=                 " Hide scrollbars in MacVim
set hidden                      " A buffer becomes hidden when abandoned
set hlsearch                    " Highlight search matches
set ignorecase smartcase        " Smarter capitalisation when searching
set lazyredraw                  " Don't redraw during macros
set linebreak                   " Don't break words
set list                        " Show invisibles
set listchars=trail:•           " Display a bullet point on trailing spacess
set modelines=1                 " Check one line for modeline
set mouse=a                     " Enable mouse
set nojoinspaces                " Insert only one space after punctuation
set nostartofline               " Keep cursor on same column
set number                      " Show absolute line numbers
set relativenumber              " Show relative line numbers
set sessionoptions-=folds       " Do not save manually created folds
set shiftround                  " Always set indentation to a multiple of 2
set shiftwidth=2                " 2 spaces for indentation
set shortmess=acIT              " Abbreviate error messages
set showcmd                     " Tells you if you press a non-alphabetic key
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
set virtualedit=block           " Allow cursor placement anywhere in V-block
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
nnoremap <CR> :
xnoremap <CR> :

" Easier fzf
nnoremap <silent> gb :Buffers<CR>
nnoremap <silent> gf :Files<CR>
nnoremap <silent> gl :Lines<CR>

" Escape from modes
inoremap jk <Esc>`^
xnoremap fd <Esc>
cnoremap jk <C-c>

" Move between errors/warnings
nnoremap ]w :ALENextWrap<CR>
nnoremap [w :ALEPreviousWrap<CR>

" Undo points
inoremap ! !<C-g>u
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap : :<C-g>u
inoremap ; ;<C-g>u
inoremap ? ?<C-g>u

" Move by screen lines, except when a count is given. This is for the relative
" line numbers used for quick jumps around.
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" Make Y behave like other capitals
nnoremap Y y$

" Alignment
nmap <Leader>" mz<Plug>(EasyAlign)ip*"`z
nmap <Leader># mz<Plug>(EasyAlign)ip*#`z
nmap <Leader>% mz<Plug>(EasyAlign)ip*%`z
nmap <Leader>& mz<Plug>(EasyAlign)ip*&`z
nmap <Leader>' mz<Plug>(EasyAlign)ip*"`z
nmap <Leader>, mz<Plug>(EasyAlign)ip*,`z
nmap <Leader>. mz<Plug>(EasyAlign)ip*.`z
nmap <Leader>: mz<Plug>(EasyAlign)ip*:`z
nmap <Leader>= mz<Plug>(EasyAlign)ip*=`z
nmap <Leader>t mz<Plug>(EasyAlign)ip*\|`z
xmap <Leader>" mz<Plug>(EasyAlign)*"`z
xmap <Leader># mz<Plug>(EasyAlign)*#`z
xmap <Leader>% mz<Plug>(EasyAlign)*%`z
xmap <Leader>& mz<Plug>(EasyAlign)*&`z
xmap <Leader>' mz<Plug>(EasyAlign)*"`z
xmap <Leader>, mz<Plug>(EasyAlign)*,`z
xmap <Leader>. mz<Plug>(EasyAlign)*.`z
xmap <Leader>: mz<Plug>(EasyAlign)*:`z
xmap <Leader>= mz<Plug>(EasyAlign)*=`z
xmap <Leader>t mz<Plug>(EasyAlign)*\|`z

" Leader
nnoremap <Leader><Leader> :bnext<CR>
nnoremap <Leader>a :call aramis#functions#pandocconvertarticle()<CR>
nnoremap <Leader>c :call aramis#functions#pandocclean()<CR>
nnoremap <Leader>d :!open dict://<cword><CR><CR>
nnoremap <Leader>f mzgggqG`z
nnoremap <Leader>g :Goyo<CR>
nnoremap <Leader>h :nohlsearch<CR>
nnoremap <Leader>i mzgg=G`zzz
nnoremap <Leader>l :Limelight!!<CR>
nnoremap <Leader>p :call aramis#functions#pandocconvertpres()<CR>
nnoremap <Leader>q :wq<CR>
nnoremap <Leader>r :call aramis#functions#pandocconvertreport()<CR>
nnoremap <Leader>s mzvip:sort<CR>`z
nnoremap <Leader>x :Sayonara<CR>


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


""
"" Colourscheme
""

" Better syntax hghlighting
autocmd vimrc ColorScheme * highlight! link Sneak Search
autocmd vimrc ColorScheme * highlight! link vimAutoCmdSfxList Type
autocmd vimrc ColorScheme * highlight! link vimIsCommand Statement

" Set colourscheme
colorscheme term

