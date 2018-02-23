
" Call code syntax function in files other than markdown
autocmd vimrc WinEnter,BufEnter * if &filetype != "markdown"
      \ | call aramis#syntax#code()
      \ | endif

