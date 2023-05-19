# checkinstall

CheckInstall keeps track of all the files created or modified by your
installation script ("make install" "make install_modules", "setup", etc),
builds a standard binary package and installs it in your system giving you the
ability to uninstall it with your distribution's standard package management
utilities.

## For example

./configure ...

cd /usr/vim && sudo checkinstall

Or, if want to just create a package use --install=no option with checkinstall


## update-alternatives

1. update-alternatives --install

    Is a command in Linux that allows you to change the default alternative for
    a given program. This is useful when you have multiple versions of a
    program installed on your system and you want to select a specific version
    as the default.

    Here's the basic syntax of the `update-alternatives --install` command:

    `update-alternatives --install <link> <name> <path> <priority>`

    - `<link>` : the symbolic link that will be craeted
    - `<name>` : the name of the alternative
    - `<path>` : the path to the alternative executable
    - `<priority>` : the priority of the alternative(higher numbers mean higher priority)

    For example, let's say you have two versions of Python installed on your
    system: Python2.7 and Python 3.6. You can use `update-alternatives
    --install` to set up alternative for the `python` and  `python3` commands:

    ```
    update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1 1
    update-alternatives --install /usr/bin/python python /usr/bin/python3.6.1 2
    ```

2. update-alternatives --set

    `update-alternatives --set <name> <path>`

    - `<name>` : the name of the alternative
    - `<path>` : the path to the alternative executable

    ```
    update-alternatvies --set python /usr/bin/python2.7
    update-alternatives --set python3 /usr/bin/python3.6.1
    ```

3. update-alternat  --remove

    ```
    update-alternatives --remove python3 /usr/bin/python3.6.1
    ```
