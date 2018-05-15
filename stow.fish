#!/usr/bin/env fish

cd ~/dotfiles/

cd xdg

for xdgconf in (ls .)
  stow --target=$HOME/.config $xdgconf
end

cd ..
cd home

for homeconf in  (ls .);
  stow --target=$HOME $homeconf
end

