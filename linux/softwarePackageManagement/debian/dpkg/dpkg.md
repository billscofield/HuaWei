# DPKG


## Configuration

1. /etc/dpkg/dpkg.cfg

    This file contains the global configuration options for dpkg. It can be
    used to change the default behavior of dpkg and control various settings
    like package compression and error handling.

    This file can contain default options for dpkg.  All command-line options
    are allowed.  Values can be specified by putting them after the option,
    separated by whitespace and/or an '=' sign.

    Do not enable debsig-verify by default; since the distribution is not using
    embedded signatures, debsig-verify would reject all packages.

    ```
    no-debsig¬
    log /var/log/dpkg.log
    ```


dpkg --configure -a
dpkg-reconfigure
