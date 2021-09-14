
## fusermount

mount and unmount FUSE filesystems

Filesystem  in  Userspace  (FUSE)  is a simple interface for userspace programs
to export a virtual filesystem to the Linux kernel. It also aims to provide a
secure method for non privileged users to create and mount their own filesystem
implementations.

fusermount is a program to unmount FUSE filesystems.

    -u  unmount.

    -q  quiet.

    -z  lazy unmount.

    fusermount -uz
