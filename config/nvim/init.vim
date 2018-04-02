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

set hidden                      " A buffer becomes hidden when abandoned
set noshowmode                  " Don't show standard mode indicator
set number                      " Absolute line numbers
set relativenumber              " Relative line numbers
set showcmd                     " Show Ex commands

colorscheme seoul256            " Set colourscheme
set synmaxcol=790               " Maximum column in which to syntax highlight
set termguicolors               " True colour

set completeopt=menuone,preview " Show possible completions with preview
set gdefault                    " Replace all instances on a line by default
set wildmode=full               " Complete the next full match

set clipboard=unnamed           " Use macOS clipboard
set formatoptions=1cjroq        " Auto-format comments
set modelines=3                 " Set how many lines are checked for set commands
set mouse=a                     " Use mouse
set nojoinspaces                " Insert only one space after punctuation
set nostartofline               " Keep cursor on same column
set spell                       " Spell check comments and text
set spelllang=en_gb             " Use British English
set textwidth=79                " 79 chars/line
set virtualedit=block           " Allow cursor placement where characters are not in Visual Block
if exists('&fixeol')            " Handle end of lines at end of files
  set nofixeol
endif

set encoding=utf-8              " Display UTF-8
set sessionoptions-=folds       " Do not save manually created folds
set undofile                    " Keep undo history between sessions
setglobal fileencoding=utf-8    " Write UTF-8

set expandtab                   " Insert spaces when tab is pressed
set shiftround                  " Always set indentation to a multiple of 2
set shiftwidth=2                " 2 spaces for indentation
set softtabstop=2               " 2 spaces per tab

set fillchars=fold:\            " Do not show dashes when folding
set foldenable                  " Always use folding
set foldlevel=4                 " Completely fold up files
set foldmethod=indent           " Fold based on indentation level

set conceallevel=0              " Never conceal
set cursorline                  " Always show cursor guide
set fillchars+=vert:\│          " Show clean separators in splits
set guioptions=                 " Hide scrollbars in MacVim
set lazyredraw                  " Prevent unnecessary redrawing
set list                        " Enable showing invisibles
set listchars=trail:•           " Set invisibles
set numberwidth=4               " Leave space for 2 digits in line numbers
set shortmess=acIT              " Abbreviate error messages

set hlsearch                    " Highlight search matches
set ignorecase                  " Ignore capitalisation …
set smartcase                   " … except if something has been capitalised
set inccommand=split            " Live preview of substitute command

set title                       " Show the window title
set titlestring+=%:t            " Show filename and file path in window title
set titlestring=                " Reset what shows in window title

let &showbreak = '↳ '           " Show occurrences of wrapped text
set breakindent                 " Display indents before wrapped lines
set breakindentopt=sbr          " Display  showbreak  before indent
set linebreak                   " Wrap at words
set wrap                        " Wrap text

" Statusline
" ----------------------------------------------------------

""" ALE statusline function
function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? 'OK' : printf(
        \   '%dW %dE',
        \   l:all_non_errors,
        \   l:all_errors
        \)
endfunction

""" Set statusline
set statusline=%{LinterStatus()}
set statusline=\ %f  " Path to the file
set statusline+=\ %m " Modified flag
set statusline+=\ %y " Filetype
set statusline+=%=   " Switch to the right side
set statusline+=%c\  " Current column
set statusline+=%l   " Current line
set statusline+=/%L  " Total lines
" ALE errors
set statusline+=\ %{LinterStatus()}\ 
" Git branch
set statusline+=\ %{fugitive#statusline()}\ 

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
nnoremap <leader>h :nohl<cr>
nnoremap <leader>l :Limelight!!<cr>
nnoremap <leader>q :wq<cr>
nnoremap <leader>s mz:w<cr>`z`

" Autocmds
" ----------------------------------------------------------

" Remove empty lines
autocmd vimrc BufWritePre,BufReadPost,FileReadPost * if &filetype != 'gitcommit'
      \ | silent! call aramis#emptyline#remove()

" Open help in new tabs
function! s:helptab()
  if &buftype==#'help'
    wincmd T
    nnoremap <buffer> q :q<cr>
  endif
endfunction
autocmd vimrc BufEnter *.txt call s:helptab()

" Call code syntax function in all files
autocmd vimrc WinEnter,BufEnter * call aramis#syntax#code()

