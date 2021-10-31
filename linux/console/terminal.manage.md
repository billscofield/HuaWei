https://stackoverflow.com/questions/51327691/what-are-the-diffrences-between-tput-cols-tput-lines-and-stty-size

what are the differences between tput and stty?

    1. tput depends on ncurses
    1. stty depends on coreutils and coreutils depends on ncurses

IMHO(in my humble opinion) tput is more basic and portable.
