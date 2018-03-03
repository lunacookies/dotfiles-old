" Statusline

set statusline=\ %f  " Path to the file
set statusline+=\ %m " Modified flag
set statusline+=\ %y " Filetype
set statusline+=%=   " Switch to the right side
set statusline+=%c\  " Current column
set statusline+=%l   " Current line
set statusline+=/%L  " Total lines
                     " ALE errors
set statusline+=\ %{ALEGetStatusLine()}\ 
                     " Git branch
set statusline+=\ %{fugitive#statusline()}\ 

