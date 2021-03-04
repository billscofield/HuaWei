

## fork()

SYNOPSIS
    #include <sys/types.h>
    #include <unistd.h>

    pid_t fork(void);



RETURN VALUE 
    On  success, the PID of the child process is returned in
    theparent, and 0 is returned in the child.  On failure, -1 is returned in the
    parent, no child process is created, and errno  is  set  appropri‐ ately.


## getpid() getppid()
