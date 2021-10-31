

以下内容摘自 wiki.archlinux.org

## CDM

CDM is a minimalistic, yet full-featured replacement for display managers lik SLiM,SDDM and GDM that provides a fast, dialogbased login system without the overhead of X Window System, Written in pure bash, CDM has almost no dependencies, yet supports multiple users/sessions and can start virtually any desktop environment or window manager.


## Install

1. Install the cdm package or the cdm-git package

1. Ensure no other display managers get started by disabling their systemd services with systemctl disable

    systemctl disable gdm.service

    There is no need to enable a systemd service for CDM. Rather, a script called **zzz-cdm.sh** will be placed into /etc/profile.d

    this script is run when you login to a login shell

    Since the script is placed in the global /etc/profile.d directory, CDM will be run for all users who login on tty1.
    if you would rather it only run for you, take away executable permissions from /etc/profile.d/zzz-cdm.sh and copy the contents of that file
    into your ~/.bash_profile for bash, or ~/.zprofile for zsh

## Configuration

/etc/cdmrc

you can also have user specific config files by copying /etc/cdmrc to $HOME/.cdmrc

Menu items
    order of items in these arrays is important, items with the same index describe the same menu item.

    1. binlist
        contain commands which are executed
        
    1. namelist
        contain names which are shown in the menu

    1. flaglist
        contain type of the programs specified in binlist
        either 'X' for X sessions or 'C' for console programs
        Basically X ssessions are started using startx(the item in binlist is argument of startx command)
        and console programs are started using exec.

## Theming

Themes are located in /usr/share/cdm/themes

```/etc/cdmrc
dialogrc=/usr/share/cdm/themes/cdm  
```

the best way to start a new theme would be to duplicate and edit an existing theme
