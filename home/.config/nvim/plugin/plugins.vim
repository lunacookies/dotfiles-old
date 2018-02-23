
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'Raimondi/delimitMate'            " Insert mode auto-completion for pairs
Plug 'SirVer/ultisnips'                " The ultimate snippet solution for Vim
Plug 'Yggdroot/indentLine'             " Indent guides
Plug 'chriskempson/base16-vim'         " An architecture for building themes
Plug 'ctrlpvim/ctrlp.vim'              " Fuzzy file, buffer, mru, tag, etc finder
Plug 'dag/vim-fish'                    " Vim support for editing fish scripts
Plug 'dbmrq/vim-ditto'                 " Stop repeating yourself
Plug 'dhruvasagar/vim-table-mode'      " Vim table mode for instant table creation
Plug 'dkarter/bullets.vim'             " Automated bullet lists
Plug 'junegunn/goyo.vim'               " Distraction-free writing
Plug 'junegunn/limelight.vim'          " Hyper-focus writing
Plug 'junegunn/vim-easy-align'         " A Vim alignment plugin
Plug 'junegunn/vim-slash'              " Enhancing in-buffer search experience
Plug 'justinmk/vim-sneak'              " Two character f/t motion
Plug 'kana/vim-textobj-entire'         " Text objects for entire buffer
Plug 'kana/vim-textobj-indent'         " Text objects for indented blocks of lines
Plug 'kana/vim-textobj-line'           " Text objects for the current line
Plug 'kana/vim-textobj-user'           " Create your own text objects
Plug 'majutsushi/tagbar'               " Vim plugin that displays tags in a window
Plug 'reedes/vim-litecorrect'          " Lightweight auto-correction
Plug 'scrooloose/nerdtree'             " A tree explorer plugin for Vim
Plug 'takac/vim-hardtime'              " Stop repeating hjkl
Plug 'tpope/vim-abolish'               " Act on multiple variants of a word
Plug 'tpope/vim-commentary'            " Comment stuff out
Plug 'tpope/vim-endwise'               " Wisely add matching closing structures
Plug 'tpope/vim-fugitive'              " Git wrapper for Vim
Plug 'tpope/vim-markdown'              " Vim Markdown runtime files
Plug 'tpope/vim-repeat'                " Repeat plugin maps
Plug 'tpope/vim-rsi'                   " Readline style insertion
Plug 'tpope/vim-surround'              " Quoting/parenthesising made simple
Plug 'tpope/vim-unimpaired'            " Pairs of handy bracket mappings
Plug 'w0rp/ale'                        " Asynchronous Lint Engine
call plug#end()

