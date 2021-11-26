## 1. urxvt unknown terminal type with ssh

[link](http://alemani.com/urxvt-unknown-terminal-type-with-ssh/#:~:text=%24%20clear%20%27rxvt-unicode-256color%27%3A%20unknown%20terminal%20type.%20This%20is,or%20.bashrc%20add%20one%20of%20the%20following%20lines.)

There are times when you log in via SSH into a server and your terminal is not
supported therefore sometimes not fully functional.

Something like this:

    ```
    $ clear
    'rxvt-unicode-256color': unknown terminal type.
    ```

This is quite easy to fix and as with many things with GNU/Linux there are
various ways you can do it, here are two.

The first solution you can try is to export the $TERM variable in either
.bash_profile or .bashrc add one of the following lines.

    ```
    export TERM='xterm-256color'
    export TERM='linux'
    ```

The second solution (and maybe a better one) would be to copy your terminal
profile known as terminfo file to the server in this case to your $HOME
directory.

First create the directory to keep the terminfo file in the server:

    ```
    mkdir -p ~/.terminfo/r 
    ```

Next, copy the matching file found on your local machine to the server, for
urxvt-unicode-256color would be:

    ```
    scp /usr/share/terminfo/r/rxvt-unicode-256color user@server.com:.terminfo/r
    ```

And that is all, new sessions will recognize and set the right $TERM.




liujiao> but the second method doesn't work for me, maybe needing a reboot ?
