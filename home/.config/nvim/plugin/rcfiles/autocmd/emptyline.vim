" Call remove empty lines function on save and buffer open
autocmd vimrc BufWritePre,BufReadPost,FileReadPost * if &filetype != 'gitcommit'
      \ | silent! call aramis#emptyline#remove()

