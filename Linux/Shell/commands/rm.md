

rm -r dir

The one will recurse into dir, removing all contents, and then the directory
itself. But as said, you can't remove the root directory anyway. On Linux, the
error you get is Device or resource busy, which is exactly what you get trying
to remove any directory holding a mounted filesystem. (It doesn't even bother
checking if the directory is empty before dropping that.)

For the same reason, you can't usually get the root directory empty either,
you'll have stuff like /proc and /sys (on Linux) mounted, and you can't remove
the mount points without unmounting them.

And well, strictly speaking, removing all files doesn't kill the system... It
just makes the usual paradigm of launching external programs to do stuff a bit
hard to use. But running programs that don't need any files on the file system
any longer wouldn't be affected. You might be able to try it with something
like the busybox shell, that has integrated rm and ls. (Booting up the next
time might be hard though, if your boot files were on a mounted filesystem.)




```
rm -rf /

    rm: it is dangerous to operate recursively on '/'

    rm: use --no-preserve-root to override this failsafe

rm -rf /*
    会进行删除

```

If there is no --preserver-root directive (bypassed or default), rm will
attempt to delete everything on the system



--no-preserve-root

    do not treat '/' specially


--preserve-root[=all]

do not remove '/' (default); with 'all', reject any command line argument on a
separate device from its parent


a separte device 是一台计算机的意思?

每一台计算机的父目录就是根目录?

下面 gnu 的一句话:

GNU rm normally declines to operate on any directory that resolves to /



```

https://www.gnu.org/software/coreutils/manual/html_node/Treating-_002f-specially.html#Treating-_002f-specially

```

Certain commands can operate destructively on entire hierarchies. For example,
if a user with appropriate privileges mistakenly runs ‘rm -rf / tmp/junk’, that
may remove all files on the entire system. Since there are so few legitimate
uses for such a command, GNU rm normally declines to operate on any directory
that resolves to /. If you really want to try to remove all the files on your
system, you can use the --no-preserve-root option, but the default behavior,
specified by the --preserve-root option, is safer for most purposes.

The commands chgrp, chmod and chown can also operate destructively on entire
hierarchies, so they too support these options. Although, unlike rm, they don’t
actually unlink files, these commands are arguably more dangerous when
operating recursively on /, since they often work much more quickly, and hence
damage more files before an alert user can interrupt them. Tradition and POSIX
require these commands to operate recursively on /, so they default to
--no-preserve-root, but using the --preserve-root option makes them safer for
most purposes. For convenience you can specify --preserve-root in an alias or
in a shell function.

Note that the --preserve-root option also ensures that chgrp and chown do not
modify / even when dereferencing a symlink pointing to /.




https://wiki.archlinux.org/title/File_permissions_and_attributes

Use the --preserve-root flag to prevent chmod from acting recursively on /

不允许从根目录开始递归 chmod


