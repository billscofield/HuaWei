

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



