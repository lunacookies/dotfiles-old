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
" Minpac
"

" Minpac is a script that handles downloading and updating Vim plugins. As this
" config supports minimum Vim 8+ and the latest version of Nvim, we can rely on
" the built in packages feature.
"
" As all minpac does is download and update plugins (it doesn't handle runtime
" path management) we don't have to load it if we don't have any plugins we
" want to install or update; the plugins are already in the correct directories,
" where packages will handle loading them automatically.

" Define a command that cleans up unused plugins, installs any missing ones, and
" updates them all. It needs to load minpac to do these things.
command! Pack
      \ packadd minpac |
      \ source $MYVIMRC |
      \ call minpac#clean() |
      \ call minpac#update()
" Same as above, just quit when done
command! PackAndQuit
      \ packadd minpac |
      \ source $MYVIMRC |
      \ call minpac#clean() |
      \ call minpac#update('', {'do': 'quitall'})

" Only run minpac code if minpac has been loaded
if exists('*minpac#init')
  call minpac#init()

  " Let minpac manage itself
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Subtle enhancements
  call minpac#add('alvan/vim-closetag')
  call minpac#add('machakann/vim-highlightedyank')
  call minpac#add('romainl/vim-cool')
  call minpac#add('romainl/vim-qf')
  call minpac#add('rstacruz/vim-closer')
  call minpac#add('sgur/vim-editorconfig')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-endwise')
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('wellle/targets.vim')

  " Big, new features
  call minpac#add('junegunn/vim-easy-align')
  call minpac#add('lifepillar/vim-mucomplete')
  call minpac#add('tpope/vim-fugitive')

  " Language support
  call minpac#add('arzg/vim-ruby')
  call minpac#add('cakebaker/scss-syntax.vim')
  call minpac#add('hail2u/vim-css3-syntax')
  call minpac#add('kchmck/vim-coffee-script')
  call minpac#add('lifepillar/vim-colortemplate')
  call minpac#add('othree/html5.vim')
  call minpac#add('pangloss/vim-javascript')
  call minpac#add('tpope/vim-git')

  " Colours
  call minpac#add('lifepillar/vim-solarized8')

endif

"
" Options
"

" Basic
set clipboard=unnamed
set hidden
set laststatus=2
set number
set path& | let &path .= "**"
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
autocmd vimrc ColorScheme * hi! link Noise             Delimiter
autocmd vimrc ColorScheme * hi! link shDerefSimple     Identifier
autocmd vimrc ColorScheme * hi! link vimAutoCmdSfxList Type
autocmd vimrc ColorScheme * hi! link vimAutoEventList  Identifier
autocmd vimrc ColorScheme * hi! link vimFunction       Function
autocmd vimrc ColorScheme * hi! link vimHighlight      Statement
autocmd vimrc ColorScheme * hi! link vimUserFunc       Function
autocmd vimrc ColorScheme * hi! link zshBrackets       Delimiter
autocmd vimrc ColorScheme * hi! link zshDeref          Identifier
autocmd vimrc ColorScheme * hi! link zshFunction       Identifier
autocmd vimrc ColorScheme * hi! link zshParentheses    Delimiter
autocmd vimrc ColorScheme * hi! link zshSubst          Identifier
autocmd vimrc ColorScheme * hi! link zshSubstDelim     Delimiter

" Use the completion menu from the flat variant
autocmd vimrc ColorScheme solarized8 hi! Pmenu      cterm=reverse ctermfg=7
      \ ctermbg=11 gui=reverse guifg=#eee8d5 guibg=#657b83
autocmd vimrc ColorScheme solarized8 hi! PmenuSel   cterm=reverse ctermfg=14
      \ ctermbg=15 gui=reverse guifg=#93a1a1 guibg=#fdf6e3
autocmd vimrc ColorScheme solarized8 hi! PmenuSbar  cterm=reverse ctermfg=7
      \ ctermbg=14 gui=reverse guifg=#eee8d5 guibg=#93a1a1
autocmd vimrc ColorScheme solarized8 hi! PmenuThumb cterm=reverse ctermfg=12
      \ ctermbg=15 gui=reverse guifg=#839496 guibg=#fdf6e3

" More prominent MatchParen
autocmd vimrc ColorScheme solarized8 hi! MatchParen cterm=NONE ctermfg=15
      \ ctermbg=14 gui=NONE guifg=#fdf6e3 guibg=#93A1A1

" Set colourscheme

" Use all the language-specific colours from the original Solarized
let g:solarized_extra_hi_groups = 1

" Unfortunately Solarized 8 uses &background to figure out whether to use the
" dark or light variant, instead of using two separate colourschemes.
" Additionally, I use $THEME to store whether I'm using a light theme
" or a dark theme, so we set &background based on this variable.
if $THEME == 'light'
  set background=light
elseif $THEME == 'dark'
  set background=dark
else
  set background=light
endif

set termguicolors
colorscheme solarized8
