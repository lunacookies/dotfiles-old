# My dotfiles

These are my dotfiles. They are managed through a combination of 
`stow` and a small bash script (`stow.sh`).

## A word of warning

Please do not install these dotfiles without going through them 
and understanding what everything contained within them does.

If you do still wish to install the dotfiles, take note that it is 
**highly** recommended to remove all configuration, fonts, and 
non-system applications from your machine first -- after all, the 
provided installer is meant for fresh **macs**. The dotfiles will 
**not** work on other operating systems. To install the dotfiles 
automatically, run this command:

```
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/aramisgithub/dotfiles/master/install.sh | bash
```

This will download an installer script (`install.sh`) which will:

1. Install homebrew if it does not exist
1. Install homebrew git if it does not exist
1. If dotfiles directories already exist, end script. Otherwise, 
   clone repository to `~/dotfiles`.
1. Install all packages and software
1. Set all settings to the way I like them (`macos`)
1. Link all configuration files

After the installer completes, it is recommended to reboot your 
machine.

## How to add a program (foo) to the dotfiles

1. Add the command to install foo to `brew.sh`.

1. If foo's configuration files follow the XDG Base Directory 
   specification, then create a hierarchy like so:

   ```
   xdg
   └── foo
      └── config
   ```

   If they do *not* follow XDG, then create a hierarchy like so:

   ```
   home
   └── foo
      └── .foorc
   ```

1. Run `stow.sh`

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
the name of the file that is currently being edited in `(n)vim` or 
the working directory in `zsh`. This all works inside `tmux` as 
well!

## Other terminal emulators

If you are running in a terminal emulator different from 
Terminal.app, my configuration will still work just fine, 
mimicking Terminal.app's output as much as possible.

### `tmux`

In addition, if you are in `tmux`, the window title will also 
contain the name of the currently running program, the session 
name, and also the current filename or directory. Again, if you 
are running in Terminal.app, a proxy icon will appear.

## Note

Feel free to have a poke around, and steal anything you may find 
useful.

I use an Early 2015 MacBook Pro 13in base model running macOS High 
Sierra.

