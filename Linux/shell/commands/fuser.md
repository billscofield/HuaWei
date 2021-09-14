
-k, --kill

    Kill  processes  accessing the file.  Unless changed with -SIGNAL, SIGKILL
    is sent.  An fuser process never kills itself, but may kill other fuser
    processes.  The effective user ID of the process executing fuser is set to
    its real user ID before attempting to kill.


 -m NAME , --mount NAME

    NAME  specifies  a  file  on a mounted file system or a block device that
    is mounted.  All processes accessing files on that file system are listed.
    If a directory file is specified, it is automatically changed to NAME/.  to
    use any file system that might be mounted on  that  di‐rectory.

    找出使用这个文件、目录的进程号
