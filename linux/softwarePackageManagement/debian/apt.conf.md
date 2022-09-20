

## apt.conf

the apt.conf has been replaced by apt.conf.d

ISC tools
    Internet Systems Consortium(/ kənˈsɔːtiəm /联合)

    ISC develops and distributes three open source Internet networking software
    packages:
        BIND 9,
        ISC DHCP,
        Kea DHCP,
        and operated the F Root domain server


    Lines starting with // are treated as comments (ignored). 

When an APT tool starts up it will read the configuration files in the following order:

    1. the file specified by the APT_CONFIG environment variable (if any)

    2. all files in Dir::Etc::Parts in alphanumeric ascending order which have
       either no or "conf" as filename extension and which only contain
       alphanumeric, hyphen (-), underscore (_) and period (.) characters.

       Otherwise APT will print a notice that it has ignored a file, unless
       that file matches a pattern in the Dir::Ignore-Files-Silently
       configuration list - in which case it will be silently ignored.

    3. the main configuration file specified by Dir::Etc::main

    4. all options set in the binary specific configuration subtree are moved
       into the root of the tree.

    5. the command line options are applied to override the configuration
       directives or to load even more configuration files.




