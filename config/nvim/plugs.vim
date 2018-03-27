Plug 'w0rp/ale'                " Asynchronous Lint Engine
Plug 'tpope/vim-commentary'    " Comment stuff out
Plug 'junegunn/vim-easy-align' " A Vim alignment plugin

" Allow alignment of % character
let g:easy_align_delimiters = {
      \  '%': { 'pattern': '%\+', 'delimiter_align': 'l', 'ignore_groups': ['!Comment']  },
      \ }

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

Plug 'tpope/vim-endwise'  " Wisely add matching closing structures
Plug 'tpope/vim-fugitive' " Git wrapper for Vim
Plug '/usr/local/opt/fzf' " The command-line fuzzy finder
Plug 'junegunn/fzf.vim'   " fzf on Vim

let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'right': '~20%' }
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'Normal', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment']
      \ }

Plug 'junegunn/goyo.vim' " Distraction-free writing

let g:goyo_width  = 67 " Leave a few extra chars more than textwidth
let g:goyo_linenr = 1  " Show line numbers in goyo mode

function! s:goyo_enter()     " On goyo enter:
  set nolist                 " Disable invisibles
  set noshowmode             " Don't show current mode
  set noshowcmd              " Don't show last command
  call aramis#syntax#prose() " Call prose syntax function
  set scrolloff=999          " Centre current line
  set nocursorline           " Don't show cursor guide
  Limelight                  " Enable paragraph focus mode
endfunction

function! s:goyo_leave()     " On goyo exit:
  set nolist                 " Disable invisibles
  set showmode               " Show current mode
  set showcmd                " Show last command
  call aramis#syntax#prose() " Call prose syntax function
  set scrolloff=1            " Show 1 lines of context when scrolling
  set cursorline             " Show cursor guide
  Limelight!                 " Disable paragraph focus mode
endfunction

" Activate respective function on goyo enter and leave
autocmd! vimrc User GoyoEnter nested call <sid>goyo_enter()
autocmd! vimrc User GoyoLeave nested call <sid>goyo_leave()

Plug 'skwp/greplace.vim' " Global search and replace for Vim

Plug 'nanotech/jellybeans.vim' " A colourful, dark colour scheme for Vim yess

let g:jellybeans_overrides = {
      \    'SpellBad': { 'guibg': 'NONE', 'ctermbg': 'NONE' },
      \    'SpellCap': { 'guibg': 'NONE', 'ctermbg': 'NONE' },
      \    'SpellRare': { 'guibg': 'NONE', 'ctermbg': 'NONE' },
      \    'SpellLocal': { 'guibg': 'NONE', 'ctermbg': 'NONE' },
      \}

Plug 'junegunn/limelight.vim' " Hyper-focus writing

let g:limelight_priority            = -1  " Don't overrule hlsearch
let g:limelight_default_coefficient = 0.6 " Dim other paragraphs more

Plug 'sheerun/vim-polyglot' " A solid language pack for Vim

let g:polyglot_disabled = ['markdown']

Plug 'tpope/vim-repeat'   " Repeat plugin maps
Plug 'tpope/vim-sensible' " Defaults everyone can agree on
Plug 'justinmk/vim-sneak' " Two character f/t motion

let g:sneak#use_ic_scs = 1 " Use case settings from vimrc

" Make sneak highlighting the same as search results
hi! link Sneak Search

Plug 'tpope/vim-surround'   " Quoting/parenthesising made simple
Plug 'tpope/vim-unimpaired' " Pairs of handy bracket mappings

