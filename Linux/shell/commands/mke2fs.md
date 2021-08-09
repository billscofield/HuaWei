
-N number-of-inodes

    Overrides the default calculation of the number of inodes that should be
    reserved for the filesystem (which is based on the number of  blocks and
    the b ytes-per-inode ratio).  This allows the user to specify the number of
    desired inodes directly.


-t fs-type

    Specify  the  filesystem type (i.e., ext2, ext3, ext4, etc.) that is to be
    created.  If this option is not specified, mke2fs will pick a de‐fault
    either via how the command was run (for example, using a name of the form
    mkfs.ext2, mkfs.ext3, etc.) or via a default as  defined  by the
    /etc/mke2fs.conf file.  This option controls which filesystem options are
    used by default, based on the fstypes configuration stanza in
    /etc/mke2fs.conf.

    If the -O option is used to explicitly add or remove filesystem options
    that should be set in the newly created  filesystem,  the  resulting
    filesystem  may not be supported by the requested fs-type.  (e.g., "mke2fs
    -t ext3 -O extent /dev/sdXX" will create a filesystem that is not supported
    by the ext3 implementation as found in the Linux kernel; and "mke2fs -t
    ext3 -O ^has_journal /dev/hdXX" will create  a  filesystem that does not
    have a journal and hence will not be supported by the ext3 filesystem code
    in the Linux kernel.)


