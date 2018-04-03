" init.vim for macOS
" ==========================================================
" - /u/aramisreddit
" - github.com/aramisgithub

" Basics
" ----------------------------------------------------------

""" Create autocmd group
augroup vimrc
  autocmd!
augroup END

""" Map leader
let g:mapleader      = ' ' " Regular leader
let g:maplocalleader = ' ' " Local leader

""" Source config file function
function! s:SourceConfigFile(file)
  let a:file_splat = '~/.config/nvim/'
  for a:config_file in split(glob(a:file_splat), '\n')
    if filereadable(a:file)
      execute 'source' a:file
    endif
  endfor
endfunction

""" Install missing plugs
autocmd vimrc VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q
      \| endif

""" Install plug if not installed
if has('nvim')
  if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd vimrc VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
else
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd vimrc VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif

""" Source plugs
call plug#begin('~/.local/share/nvim/plugged')
call s:SourceConfigFile('plugs.vim')
source ~/.config/nvim/plugs.vim
call plug#end()

" Options
" ----------------------------------------------------------

colorscheme seoul256            " Set colourscheme
let &showbreak = '↳ '           " Show occurrences of wrapped text
set breakindent                 " Display indents before wrapped lines
set breakindentopt=sbr          " Display  showbreak  before indent
set clipboard=unnamed           " Use macOS clipboard
set colorcolumn=+1              " Show dark column after textwidth
set completeopt=menuone,preview " Show possible completions with preview
set conceallevel=0              " Never conceal
set encoding=utf-8              " Display UTF-8
set expandtab                   " Insert spaces when tab is pressed
set fillchars+=vert:\│          " Show clean separators in splits
set fillchars=fold:\            " Do not show dashes when folding
set foldenable                  " Always use folding
set foldlevel=2                 " Completely fold up files
set foldmethod=indent           " Fold based on indentation level
set formatoptions=1cjroq        " Auto-format comments
set gdefault                    " Replace all instances on a line by default
set guioptions=                 " Hide scrollbars in MacVim
set hidden                      " A buffer becomes hidden when abandoned
set hlsearch                    " Highlight search matches
set ignorecase                  " Ignore capitalisation …
set inccommand=split            " Live preview of substitute command
set lazyredraw                  " Prevent unnecessary redrawing
set linebreak                   " Wrap at words
set list                        " Enable showing invisibles
set listchars=trail:•           " Set invisibles
set modelines=3                 " Set how many lines are checked for set commands
set mouse=a                     " Use mouse
set nojoinspaces                " Insert only one space after punctuation
set noshowmode                  " Don't show standard mode indicator
set nostartofline               " Keep cursor on same column
set number                      " Absolute line numbers
set numberwidth=4               " Leave space for 2 digits in line numbers
set relativenumber              " Relative line numbers
set scrolloff=5                 " Leave a 5 line margin when scrolling
set sessionoptions-=folds       " Do not save manually created folds
set shiftround                  " Always set indentation to a multiple of 2
set shiftwidth=2                " 2 spaces for indentation
set shortmess=acIT              " Abbreviate error messages
set showcmd                     " Show Ex commands
set smartcase                   " … except if something has been capitalised
set softtabstop=2               " 2 spaces per tab
set spell                       " Spell check comments and text
set spelllang=en_gb             " Use British English
set splitbelow                  " Create new splits to the bottom
set splitright                  " Create new splits to the right
set synmaxcol=790               " Maximum column in which to syntax highlight
set termguicolors               " True colour
set textwidth=80                " 80 chars/line
set title                       " Show the window title
set titlestring+=%:t            " Show filename and file path in window title
set titlestring=                " Reset what shows in window title
set undofile                    " Keep undo history between sessions
set updatetime=1000             " Call CursorHold lint event after 1 second
set virtualedit=block           " Allow cursor placement where characters are not in Visual Block
set wildmode=full               " Complete the next full match
set wrap                        " Wrap text
setglobal fileencoding=utf-8    " Write UTF-8

" Statusline
" ----------------------------------------------------------

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

" Mappings
" ----------------------------------------------------------

""" Command-line mode
nnoremap <cr> :
xnoremap <cr> :

""" Escape from modes
inoremap jk <esc>`^
xnoremap fd <esc>
cnoremap jk <c-c>

""" Navigate splits faster
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

""" Markdown headers
nnoremap <leader>1 mmI#<space><esc>`m2l
nnoremap <leader>2 mmI##<space><esc>`m3l
nnoremap <leader>3 mmI###<space><esc>`m4l
nnoremap <leader>4 mmI####<space><esc>`m5l
nnoremap <leader>5 mmI#####<space><esc>`m6l
nnoremap <leader>6 mmI######<space><esc>`m7l

""" Move between errors/warnings
nnoremap ]r :ALENextWrap<cr>
nnoremap [r :ALEPreviousWrap<cr>

""" Undo points
inoremap ! !<C-g>u
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap : :<C-g>u
inoremap ; ;<C-g>u
inoremap ? ?<C-g>u

""" Make Y behave like other capitals
nnoremap Y y$

""" Alignment
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

""" Leader
nnoremap <leader><leader> <C-^>
nnoremap <leader>d :!open dict://<cword><cr><cr>
nnoremap <leader>fb :Buffers<cr>
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fl :Lines<cr>
nnoremap <leader>g :Goyo<cr>
nnoremap <leader>h :nohlsearch<cr>
nnoremap <leader>i mzgg=G`zzz
nnoremap <leader>l :Limelight!!<cr>
nnoremap <leader>q :quit<cr>
nnoremap <leader>s mzvip:sort<cr>`z
nnoremap <leader>w :update<cr>

" Autocmds
" ----------------------------------------------------------

""" Remove empty lines
autocmd vimrc VimLeave * if &filetype != 'gitcommit'
      \ | silent! call aramis#emptyline#remove()

""" Open help in new tabs
function! s:helptab()
  if &buftype==#'help'
    wincmd T
    nnoremap <buffer> q :q<cr>
  endif
endfunction
autocmd vimrc BufEnter *.txt call s:helptab()

""" Do not show whitespace in insert mode
autocmd vimrc InsertEnter * set nolist
autocmd vimrc InsertLeave * set list

