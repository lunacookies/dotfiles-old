" Make Nvim source the normal Vim directories so that this config can be used
" with it too
if has('nvim')
  set runtimepath^=~/.vim runtimepath+=~/.vim/after
  let &packpath = &runtimepath
endif

" Filetype detection
filetype plugin indent on

" Syntax highlighting
if !exists('g:syntax_on')
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
set noshowcmd
set path& | let &path .= "**"
set wildignorecase
set wildmenu

" Fixing Vim's crazy defaults
set backspace=indent,eol,start
set belloff=all
set display=lastline
set nostartofline
set nrformats-=octal
set numberwidth=5
set sessionoptions-=options

" Indentation
set autoindent
set shiftround
set smarttab

" Search and patterns
set hlsearch
set ignorecase
set incsearch
set smartcase

" Wrapping and scrolling
let &showbreak = '››› '
set breakindent
set breakindentopt=sbr
set colorcolumn=+1
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
set showcmd
set tabpagemax=50
if !has('nvim')
  set encoding=utf-8
  set ttyfast
endif
if has('nvim')
  set inccommand=split
endif

" Undo and annoying temporary files
set backupdir=/tmp//,.
set directory=/tmp//,.
if has('persistent_undo')
  set undofile
  set undodir=/tmp//,.
endif

" Fillchars

set fillchars+=vert:│
set fillchars+=fold:·
" Vim 8 does not have the ability to change this yet
if has('nvim')
  set fillchars+=eob:-
endif

"
" Statusline
"

set statusline=\     " Add space to start us off
set statusline+=%f\  " Filename relative to PWD
set statusline+=%w   " If we are in a preview window

" Flags

set statusline+=%r   " Readonly flag
set statusline+=%m   " Modified flag

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

" Smarter [g]<C-g> that omits some less useful information (e.g. how many
" characters or bytes there are in the current file)
nnoremap <C-g> :echo functions#smartgctrlg()<CR>
nnoremap g<C-g> :echo functions#smartgctrlg()<CR>

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
nnoremap ,c :close<CR>
nnoremap ,o :only<CR>

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
" <C-z>, which we now map to go to the next wildmenu completion item.
set wildcharm=<C-z>

" Use ripgrep if available, fall back to the silver searcher, then fall back to
" the system grep for grepping
if executable('rg')
  set grepprg=rg\ --vimgrep\ --ignore-case\ --column\ --fixed-strings
  set grepformat^=%f:%l:%c:%m
elseif executable('ag')
  set grepprg=ag\ --vimgrep\ --ignore-case\ --column\ --fixed-strings
  set grepformat^=%f:%l:%c:%m
else
  set grepprg=grep\ --recursive\ --ignore-case\ --fixed-strings
endif

" Smarter grep command
command! -nargs=+ -complete=file_in_path -bar Grep
      \ silent! grep! <q-args> | redraw!

nnoremap ,g :Grep<Space>

" Search in the current screen with \
nnoremap <silent> \ VHoL<Esc>``/\%V

" Code                 | Purpose
" ---                  | ---
" VHol<Esc>            | Select everything on screen, then exit visual mode
" ``                   | Jump back to the last position
" /\%V                 | Start a search in the last visual selection

" Juggling with formatting

" Keep cursor position when reformatting
command! -range=% Equal let b:wv = winsaveview() | silent execute <line1> . ',' . <line2> . 'normal! ==' | call winrestview(b:wv)

nnoremap ,i :Equal<CR>

" Juggling with substitutions

" Press gs after searching to substiture what you searched for with something
" else. Pressing gs in visual mode will use the visual selection as the range to
" substitute in.
nnoremap gs :%s///g<Left><Left>
xnoremap gs :s///g<Left><Left>

" Double-tap space to replace the word under the cursor in the paragraph. Use
" <Space>% to replace the word under the cursor in the whole file.
nnoremap <Space><Space> :'{,'}s/\<<C-r>=expand('<cword>')<CR>\>/
nnoremap <Space>%       :%s/\<<C-r>=expand('<cword>')<CR>\>/

"
" Autocmds
"

" Jump to the last known cursor position upon opening a file
autocmd vimrc BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   execute "normal! g`\""
      \ | endif

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

" Highlighted yank

" The autocommand event needed for highlighted yank to work is not present
" in some early versions of Vim 8, so we define a custom mapping that that
" imitates TextYankPost if it isn't present.
if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif

" Make the time the yanked area stays highlighted much shorter than the
" default of 1000 milliseconds
let g:highlightedyank_highlight_duration = 500

" Easy align

" Base mappings required by easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" µcomplete

" Required for µcomplete:
set completeopt=menuone,noselect,preview

" This variable stores which completion methods µcomplete will try to use first.
"
" For all files we want to complete file paths, and we want them to override any
" other completion methods. It is convenient for most languages to have previous
" words (e.g. variable names and keywords you have already used) override smart
" omnicompletion (most likely keywords you haven't used yet). However, as the
" majority of my VimL writing is my vimrc, and as there is little word reusage
" in a vimrc, we set Ex commands to override previous words.
let g:mucomplete#chains = {
      \ 'vim':      [ 'path', 'cmd', 'c-p' ],
      \ 'default':  [ 'path', 'c-p', 'omni' ],
      \ }

" NOTE: When I refer to 'previous words' in the above paragraph I am actually
" referring to keywords that match &complete
set complete=.,w,b

"
" Colours
"

" Colourscheme modifications

" Better syntax highlighting
autocmd vimrc ColorScheme * hi! link Noise                   Delimiter
autocmd vimrc ColorScheme * hi! link StringDelimiter         Delimiter
autocmd vimrc ColorScheme * hi! link rubyBlockParameter      Identifier
autocmd vimrc ColorScheme * hi! link rubyBlockParameterList  Delimiter
autocmd vimrc ColorScheme * hi! link rubyCurlyBlockDelimiter Delimiter
autocmd vimrc ColorScheme * hi! link rubyStringDelimiter     StringDelimiter
autocmd vimrc ColorScheme * hi! link shDerefSimple           Identifier
autocmd vimrc ColorScheme * hi! link shFor                   Identifier
autocmd vimrc ColorScheme * hi! link shQuote                 StringDelimiter
autocmd vimrc ColorScheme * hi! link vimAutoCmdSfxList       Type
autocmd vimrc ColorScheme * hi! link vimAutoEventList        Identifier
autocmd vimrc ColorScheme * hi! link vimFunction             Function
autocmd vimrc ColorScheme * hi! link vimHighlight            Statement
autocmd vimrc ColorScheme * hi! link vimUserFunc             Function
autocmd vimrc ColorScheme * hi! link zshDeref                Identifier
autocmd vimrc ColorScheme * hi! link zshFunction             Function
autocmd vimrc ColorScheme * hi! link zshOperator             Operator
autocmd vimrc ColorScheme * hi! link zshStringDelimiter      StringDelimiter
autocmd vimrc ColorScheme * hi! link zshSubst                Identifier
autocmd vimrc ColorScheme * hi! link zshSubstDelim           Delimiter
autocmd vimrc ColorScheme * hi! link zshVariableDef          Identifier

" Un-reversed mode marker, in bold now
autocmd vimrc ColorScheme apprentice hi! ModeMsg cterm=bold,reverse
      \ gui=bold,reverse

" Make the whole completion menu greyscale and closer in colour to the
" background
autocmd vimrc ColorScheme apprentice hi! Pmenu      ctermbg=236 guibg=#303030
      \ ctermfg=250 guifg=#bcbcbc cterm=NONE gui=NONE
autocmd vimrc ColorScheme apprentice hi! PmenuSel   ctermbg=238 guibg=#444444
      \ ctermfg=231 guifg=#ffffff cterm=NONE gui=NONE
autocmd vimrc ColorScheme apprentice hi! PmenuSbar  ctermbg=234 guibg=#1c1c1c
      \ cterm=NONE  gui=NONE
autocmd vimrc ColorScheme apprentice hi! PmenuThumb ctermbg=240 guibg=#585858
      \ cterm=NONE  gui=NONE

" Set colourscheme

colorscheme apprentice8
