
/var/lib/dpkg/available
    the available file is only kept up-to-date when using dselect.

    man dpkg-query
        -p, --print-avail [package-name...]
            Display details about packages, as found in
            /var/lib/dpkg/available.  If no package-name is specified, it will
            display all package entries in the available database (since dpkg
            1.19.1).  When multiple package-name are listed, the requested
            available entries are separated by an empty line, with the same
            order as specified on the argument list.
            
            Users of APT-based frontends should use apt show package-name
            instead **as the available file is only kept up-to-date when using
            dselect.**
