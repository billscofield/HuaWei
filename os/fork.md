

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



子进程是完全复制过去, 所以不影响父进程



孤儿进程->托管给系统进程(pid=1)

父进程一定要等待子进程结束才退出来, 用 wail(NULL), 父进程进入 wait 状态,等待子进程结束再返回到父进程 ready 状态
