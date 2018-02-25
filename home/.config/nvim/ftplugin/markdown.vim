
set spell                  " Enable spellchecking
set textwidth=64           " Use a textwidth of 64
set formatoptions=tacwqn   " Automatically reflow text, but not code
call litecorrect#init()    " Enable autocorrection
set nowrap                 " Disable wrapping
DittoOn                    " Show overused words
call aramis#syntax#prose() " Set prose syntax mode
Goyo 67                    " Enable distaaction-free mode

