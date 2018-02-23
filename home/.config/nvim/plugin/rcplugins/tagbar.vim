
Plug 'majutsushi/tagbar' " Vim plugin that displays tags in a window

let g:tagbar_compact=1            " Don't show help marker
let g:tagbar_iconchars=['▸', '▾'] " Keep arrow icons consistent with NERDTree

" Map <leader>t to toggle tagbar
nnoremap <leader>t :TagbarToggle<CR>

