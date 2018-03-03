" Call remove empty lines function on save and buffer open
autocmd vimrc BufWritePre,BufReadPost,FileReadPost * silent! call aramis#emptyline#remove()

