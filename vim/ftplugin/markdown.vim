setlocal spell                " Enable spellchecking
setlocal textwidth=64         " Use a textwidth of 64
setlocal formatoptions=tacwqn " Automatically reflow text, but not code
call aramis#syntax#prose()    " Call markdown syntax function
Goyo 67                       " Enable distraction-free mode

