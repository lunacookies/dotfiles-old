
" vim: set foldmethod=marker foldlevel=0 nomodeline:

" =============================================================================
" Plugins {{{1
" =============================================================================

packadd minpac

call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'}) " A minimal package manager for Vim

call minpac#add('SirVer/ultisnips')               " The ultimate snippet solution for Vim
call minpac#add('Yggdroot/indentLine')            " Indent guides
call minpac#add('ctrlpvim/ctrlp.vim')             " Fuzzy file, buffer, mru, tag, etc finder
call minpac#add('dag/vim-fish')                   " Vim support for editing fish scripts
call minpac#add('dbmrq/vim-ditto')                " Stop repeating yourself
call minpac#add('dhruvasagar/vim-table-mode')     " Vim table mode for instant table creation
call minpac#add('dkarter/bullets.vim')            " Automated bullet lists
call minpac#add('junegunn/goyo.vim')              " Distraction-free writing
call minpac#add('junegunn/limelight.vim')         " Hyper-focus writing
call minpac#add('junegunn/seoul256.vim')          " Low-contrast Vim colour scheme based on Seoul Colours
call minpac#add('junegunn/vim-easy-align')        " A Vim alignment plugin
call minpac#add('kana/vim-textobj-entire')        " Text objects for entire buffer
call minpac#add('kana/vim-textobj-indent')        " Text objects for indented blocks of lines
call minpac#add('kana/vim-textobj-line')          " Text objects for the current line
call minpac#add('kana/vim-textobj-user')          " Create your own text objects
call minpac#add('reedes/vim-litecorrect')         " Lightweight auto-correction
call minpac#add('scrooloose/nerdtree')            " A tree explorer plugin for Vim
call minpac#add('takac/vim-hardtime')             " Stop repeating hjkl
call minpac#add('tpope/vim-abolish')              " Act on multiple variants of a word
call minpac#add('tpope/vim-commentary')           " Comment stuff out
call minpac#add('tpope/vim-endwise')              " Wisely add matching closing structures
call minpac#add('tpope/vim-fugitive')             " Git wrapper for Vim
call minpac#add('tpope/vim-markdown')             " Vim Markdown runtime files
call minpac#add('tpope/vim-repeat')               " Repeat plugin maps
call minpac#add('tpope/vim-surround')             " Quoting/parenthesising made simple
call minpac#add('tpope/vim-unimpaired')           " Pairs of handy bracket mappings
call minpac#add('vim-airline/vim-airline')        " Statusline for Vim that's light as air
call minpac#add('vim-airline/vim-airline-themes') " A collection of themes for vim-airline
call minpac#add('w0rp/ale')                       " Asynchronous Lint Engine
call minpac#add('wincent/terminus')               " Enhanced terminal integration for Vim

" }}}1
" =============================================================================
" Pack command {{{1
" =============================================================================

command! Pack call minpac#clean() | call minpac#update()

" }}}1
" =============================================================================

