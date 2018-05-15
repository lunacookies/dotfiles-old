# My dotfiles

These are my dotfiles. They are managed through a combination 
of `stow` and a small fish script(`stow.fish`).

## A word of warning

Please do not install these dotfiles without going through them 
and understanding what everything contained within them does.

If you do still wish to install the dotfiles, take note that it 
is **highly** recommended to remove all configuration, fonts, 
and non-system applications from your machine first -- after 
all, the provided installer is meant for fresh **macs**. The 
dotfiles will **not** work on other operating systems. To 
install the dotfiles automatically, run this command:

```
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/aramisgithub/dotfiles/master/install.sh | bash
```

This will download an installer script (`install.sh`) which 
will:

1. Install homebrew if it does not exist
1. Install homebrew git if it does not exist
1. If dotfiles directories already exist, end script. 
   Otherwise, clone repository to `~/dotfiles`.
1. Install all packages and software
1. Set all settings to the way I like them (`macos`)
1. Link all configuration files

After the installer completes, it is recommended to reboot 
your machine.

## How to add a program (foo) to the dotfiles

1. Add the command to install foo to `brew.sh`.

1. If foo's configuration files follow the XDG Base Directory 
   specification, then create a hierarchy like so:

   ```
   xdg
   └── foo
      └── foo
         └── config
   ```

   If they do *not* follow XDG, then create a hierarchy like 
   so:

   ```
   home
   └── foo
      └── .foorc
   ```

1. Run `stow.fish`

## Contact

You can find me on 
[reddit](https://reddit.com/u/aramisreddit), 
[twitter](https://twitter.com/aramistweets). Feel free to have a 
poke around, and steal anything you may find useful.

## Note

I use an Early 2015 MacBook Pro 13in base model running macOS 
Sierra.

