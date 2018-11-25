# dotvim

These are my Vim configuration files. Go ahead and steal anything you want, just don’t steal the whole thing, as that just makes it harder for you to learn Vim.

## Installation

To install, just clone this repo into `~/.vim`:

    git clone -q https://github.com/arzg/dotvim.git $HOME/.vim

and make sure Vim is sourcing this repo’s `vimrc`:

    echo "runtime vimrc" > $HOME/.vimrc

Done! Note that if you’re using Nvim you will have to run this one-liner, which deletes your Nvim config and replaces it with a symlink to the regular Vim config:

    mkdir -p $HOME/.config/nvim; rm -r $HOME/.config/nvim && mkdir $HOME/.config/nvim && ln -shF $HOME/.vim/vimrc $HOME/.config/nvim/init.vim

## TODO

- Comfortable mappings for completion
- Auto tags
- Use tags more and learn good ways to make use of them
- CCR function for smart prompts in the Vim command line
- Smart CR function in insert mode for brace and XML tag expansion, canceling
  comments
- Make `grepprg` insensitive to regexen by default
   - Add `,G` mapping that greps with regex
   - Add family of grep mappings to visual mode, grepping for the selection
- Add quick search and replace mappings
