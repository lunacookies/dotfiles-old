#!/usr/bin/env zsh

# short holds the result we want to print
# full holds the full path up to the current segment
# part holds the current segment, will get as few characters as
# possible from cur, which is the full current segment

local short full part cur
local first
local -a split    # the array we loop over

# We do the (D) expansion right here and
# handle it later if it had any effect
split=(${(s:/:)${(Q)${(D)1:-$PWD}}})

if [[ $split == "" ]]; then
  REPLY=/
  return 0
fi

# Handling. Perhaps NOT use (D) above and check after shortening?
if [[ $split[1] = \~* ]]; then
  # named directory we skip shortening the first element
  # and manually prepend the first element to the return value
  first=$split[1]
  # full should already contain the first
  # component since we don't start there
  full=$~split[1]
  shift split
fi

# we don't want to end up with something like ~/
if (( $#split > 0 )); then
  part=/
fi

for cur ($split[1,-2]) {
  while {
    part+=$cur[1]
    cur=$cur[2,-1]
    local -a glob
    glob=( $full/$part*(-/N) )
    # continue adding if more than one directory matches or
    # the current string is . or ..
    # but stop if there are no more characters to add
    (( $#glob > 1 )) || [[ $part == (.|..) ]] && (( $#cur > 0 ))
  } { }

  full+=$part$cur
  short+=$part
  part=/
}

printf '%s' "$first$short$part$split[-1]"
return 0
