
# SSHFS

SSHFS itself is a file system in user space (FUSE) that uses the SSH File
Transfer Protocol (SFTP) to mount a remote file system. The sshfs command is a
client tool for using SSHFS to mount a remote file system from another server
locally on your machine.

Note: User space (or userland) is all operating system code that runs outside
of the Kernel.

While not as performant as a local file system, sshfs is an easy way to work
with files on another computer using local programs and tools. Best of all,
sshfs can be used by non-privileged users on the local machine (in fact, it is
recommended to not be root or to elevate one’s privileges while using sshfs),
and it requires no special software on the remote machine other than SSH with
SFTP enabled—a common setup.


## Installing sshfs

The sshfs tool is available from most distributions’ standard repositories and
is most easily installed using that distribution’s package manager. For Fedora,
installing sshfs is as easy as: dnf install fuse-sshfs. On Debian-based systems,
the package is simply sshfs.


## Mounting a remote file system

Once sshfs is installed, mounting a remote file
system safely over SSH is simple. According to the sshfs manual page (man
sshfs), the syntax for the command is: 

    sshfs [user@]host:[dir] mountpoint [options]


## Mount options

In most cases, the default sshfs command can be used as-is, but sshfs is far
from a simple command. There are tons of options and flags that cover a variety
of situations, including SSH and SFTP options, compression, etc. Check out the
sshfs manual (man sshfs) for more details on what is available.

One of the most useful options, however, is reconnect, which allows the client
to re-establish the connection to the remote system it is interrupted:

Use "-o reconect" to allow the client to reconnect 

    ` sshfs chris@zaphod:/home/chris/Pictures ~/mnt -o reconnect


## Mounting a remote file system on startup

The sshfs command can also be used in the client system’s /etc/fstab file to
automatically mount the remote file system. Use the normal fstab syntax,
including any options required, and use sshfs in place of the file system type:

    file: /etc/fstab

    ` chris@zaphod:/home/chris/Pictures /home/chris/mnt sshfs

Note that using sshfs with fstab file mounting the file system must be done as
root, so appropriate adjustments need to be made for SSH credentials, and
adequate precautions must be taken.


## Transport endpoint is not connected

You might receive a Transport endpoint is not connected error when the
connection is interrupted (say, if the client machine changes networks, or is
suspended). In this case, unmount the file system with the fusermount command,
as described above:

    ```
    [chris@marvin ~ ]$ ls ~/mnt
    ls: cannot access '/home/chris/mnt': Transport endpoint is not connected
    [chris@marvin ~ ]$ fusermount -u ~/mnt
    ```

Hopefully, this article gave you the basics needed to work with sshfs. It is a
great tool for working with remote file systems securely over an encrypted SSH
connection while mounted locally on your client computer. And as mentioned,
thanks to sshfs being a FUSE file system, even unprivileged users can use it
without requiring an administrator to set it up.
