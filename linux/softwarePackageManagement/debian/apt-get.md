
clean

    removes all stored archives in your cache but lock file

    /var/cache/apt/archives
    /var/cache/apt/archives/partial/

autoclean

    it only removes package files that can no longer be downloaded, and are
    largely useless.

    autoclean: removes all stored archives in your cache for packages that can
    not be downloaded anymore (thus packages that are no longer in the repo or
    that have a newer version in the repo).

autoremove

    a whole different thing, this option makes apt look for packages that are
    installed as dependency of an already uninstalled package and removes them.
    This is used to clean up unused dependencies that remain on your system.
