
apt install coreutils

本机安装的和这个不一样吗？


    -n, --iterations=N  overwrite N times instead of the default (3)
        --random-source=FILE  get random bytes from FILE
    -s, --size=N   shred this many bytes (suffixes like K, M, G accepted)

    -u             deallocate and remove file after overwriting
        --remove[=HOW]  like -u but give control on HOW to delete;  See below

    -v, --verbose  show progress

    -x, --exact    do not round file sizes up to the next full block;
                   this is the default for non-regular files

    -z, --zero     add a final overwrite with zeros to hide shredding

    --version      output version information and exit

    Delete FILE(s) if --remove (-u) is specified.  The default is not to remove
    the files because it is common to operate on device files like /dev/hda,
    and those files usually should not be removed.

    The optional HOW parameter indicates how to remove a directory entry:
        'unlink' => use a standard unlink call.
        'wipe' => also first obfuscate bytes in the name.
        'wipesync' => also sync each obfuscated byte to the device.
    The default mode is 'wipesync', but note it can be expensive.

    CAUTION: shred assumes the file system and hardware overwrite data in
    place.  Although this is common, many platforms operate otherwise.  Also,
    backups and mirrors may contain unremovable copies that will let a shredded
    file be recovered later.  See the GNU coreutils manual for details.
