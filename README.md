# My dotfiles

These are my dotfiles. Feel free to have a poke around, and steal anything you 
may find useful.

## A word of warning

**Please do not install these dotfiles without going through them and 
understanding what everything contained within them does.**

To auto-install, run the below command (run on freshly factory reset Macs only):

```
curl -sL --proto-redir -all,https https://git.io/fAaCY | bash
```

This will download an installer script (`install.sh`) which will:

1. Install [homebrew][homebrew] if it has not been installed yet
1. Clone this repository to `~/dotfiles` if it does not exist yet
1. Set up some custom git hooks for refreshing zsh plugins
1. Install all packages and software (`packages.sh`)
1. Set all settings to the way I like them (`macos`)
1. Link all configuration files (`link.sh`)

Make sure to reboot your machine after the installer completes!

[homebrew]: brew.sh
