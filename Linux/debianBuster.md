## how to switch keymaps in X-window system

## how to switch keymap in tty

tty and X-window are different from each other

## add a shortcut 

## go to tty

/etc/init.d/gdm3 stop

ctrl alt F3

## permit root to login

/etc/gdm3/daemon.conf
    [security]
    AllowRoot = true

/etc/pam.d/
    comment line that match '!=root quiet'
