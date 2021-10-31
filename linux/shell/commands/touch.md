

**ctime reflects the last update to the inode behind a file, and always reflects
the current time.**

1. use -a option to make touch only update the access time field of a file:

    touch -at 200010161000 a.txt

1. updating the modification date only, use -m option:

    ubuntu$ touch -mt 200510161000 ./try


