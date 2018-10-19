# My dotfiles

These are my dotfiles. They are managed through a small bash 
script (`link.sh`).

## A word of warning

Please do not install these dotfiles without going through them 
and understanding what everything contained within them does.

If you do still wish to install the dotfiles, take note that it is 
**highly** recommended to remove all configuration, fonts, and 
non-system applications from your machine first – after all, the 
provided installer is meant for fresh **macs**. The dotfiles will 
**not** work on other operating systems. To install the dotfiles 
automatically, run this command:

```
curl -sL --proto-redir -all,https https://git.io/fAaCY | bash
```

This will download an installer script (`install.sh`) which will:

1. Install [homebrew][homebrew] if it has not been installed yet
1. Clone this repository to `~/dotfiles` if it does not exist yet
1. Install all packages and software (`packages.sh`)
1. Set all settings to the way I like them (`macos`)
1. Link all configuration files (`link.sh`)

After the installer completes, it is recommended to reboot your 
machine.

## How this repo is structured

- All configuration files go into `etc/` with the leading dot 
  removed. Tools that follow the XDG Base Dir Spec are also placed 
  in this directory.

- Everything else (README, LICENSE, dependency files, installation 
  scripts, binaries) goes into the root of the repository

## My smart window title config

I have spent a considerable amount of time perfecting the window 
and tab titles used throughout my dotfiles. Presented here is an 
explanation of how they work.

### macOS's Terminal.app

Terminal.app supports an escape code that tells the terminal what 
file or directory is currently being used/viewed/worked on. Once 
this escape code has been set, the window title will display a 
proxy icon, along with the full or partial name of the file (this 
is configurable in Preferences>Your Profile>Window>Title).

I have exploited this functionality to set the window title to be 
the name of the file that is currently being edited in `(N)vim` or 
the working directory in `bash`. This all works inside `tmux` as 
well!

### Other terminal emulators

If you are running in a terminal emulator different from 
Terminal.app, my configuration will still work just fine, 
mimicking Terminal.app's output as much as possible. However, the 
proxy icon will not show up.

### tmux

In addition, if you are in `tmux`, the window title will also 
contain the name of the currently running program, the session 
name, and also the current filename or directory. Again, if you 
are running in Terminal.app, a proxy icon will appear.

## Note

Feel free to have a poke around, and steal anything you may find 
useful.

I use an Early 2015 MacBook Pro 13in base model running macOS 
Mojave.

[homebrew]: brew.sh
