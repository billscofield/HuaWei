links:

    https://blog.csdn.net/skiwnc/article/details/84100095

## ulimit

man bash

-a     All current limits are reported
-n     The maximum number of open file descriptors (most systems do not allow this value to be set)
-u     The maximum number of processes available to a single user
-p     The pipe size in 512-byte blocks (this may not be set)

-b     The maximum socket buffer size
-c     The maximum size of core files created
-d     The maximum size of a process's data segment
-e     The maximum scheduling priority ("nice")
-f     The maximum size of files written by the shell and its children
-i     The maximum number of pending signals
-k     The maximum number of kqueues that may be allocated
-l     The maximum size that may be locked into memory
-m     The maximum resident set size (many systems do not honor this limit)
-q     The maximum number of bytes in POSIX message queues
-r     The maximum real-time scheduling priority
-s     The maximum stack size
-t     The maximum amount of cpu time in seconds
-v     The maximum amount of virtual memory available to the shell and, on some systems, to its children
-x     The maximum number of file locks
-P     The maximum number of pseudoterminals
-T     The maximum number of threads


查看当前系统打开的文件数量: lsof | wc -l

查看当前进程的打开文件数量：lsof -p pid | wc -l      （lsof -p 1234 | wc -l  ）

查看当前进程的最大可以打开的文件数：cat /proc/PID/limits  (如果通过ulimit -n 设置或者修改/etc/security/limits.conf，看看进程是否生效)

查看系统总限制打开文件的最大数量：cat /proc/sys/fs/file-max

lsof只能以root权限执行。



文件标识符概念:
Linux系统中， 每当进程打开一个文件时，系统就为其分配一个唯一的整型文件描述符，用来标识该文件

配置文件:

    /etc/security/limits.conf，和/etc/security/limits.d/目录

    /etc/security/limits.conf,此文件设置通过PAM登录的用户的资源限制

    /etc/security/limits.d/目录,默认存在一个*-nproc.conf文件,用于限制用户的线程限制,(centos7 有，debian10 没有)

    /etc/security/limits.d/里面的配置会覆盖/etc/security/limits.conf的配置,如在/etc/security/limits.conf上有针对某一个用户的配置时,/etc/security/limits.d目录下的配置文件也有该用户的配置,最终会取决于/etc/security/limits.d目录下的配置文件



## /etc/security/ulimit.conf

Each line describes a limit for a user in the form:

<domain>        <type>  <item>  <value>

Where:
<domain> can be:
    1. a user name
    1. a group name, with @group syntax
    1. the wildcard *, for default entry
    1. the wildcard %, can be also used with %group syntax, for maxlogin limit
    1. NOTE: group and wildcard limits are not applied to root.

    To apply a limit to the root user, <domain> must be the literal username root.

<type> can have the two values:
    1. "soft" for enforcing the soft limits
    1. "hard" for enforcing hard limits

<item> can be one of the following:
    1. core - limits the core file size (KB)
    1. data - max data size (KB)
    1. fsize - maximum filesize (KB)
    1. memlock - max locked-in-memory address space (KB)
    1. nofile - max number of open file descriptors
    1. rss - max resident set size (KB)
    1. stack - max stack size (KB)
    1. cpu - max CPU time (MIN)
    1. nproc - max number of processes
    1. as - address space limit (KB)
    1. maxlogins - max number of logins for this user
    1. maxsyslogins - max number of logins on the system
    1. priority - the priority to run user process with
    1. locks - max number of file locks the user can hold
    1. sigpending - max number of pending signals
    1. msgqueue - max memory used by POSIX message queues (bytes)
    1. nice - max nice priority allowed to raise to values: [-20, 19]
    1. rtprio - max realtime priority
    1. chroot - change root to directory (Debian-specific)



## debian的默认

-t: cpu time (seconds)              unlimited
-f: file size (blocks)              unlimited
-d: data seg size (kbytes)          unlimited
-s: stack size (kbytes)             8192
-c: core file size (blocks)         0
-m: resident set size (kbytes)      unlimited
-u: processes                       31799
-n: file descriptors                1024
-l: locked-in-memory size (kbytes)  65536
-v: address space (kbytes)          unlimited
-x: file locks                      unlimited
-i: pending signals                 31799
-q: bytes in POSIX msg queues       819200
-e: max nice                        0
-r: max rt priority                 0
-N 15:                              unlimited


## centos7

cpu time               (seconds, -t) unlimited
file size               (blocks, -f) unlimited
data seg size           (kbytes, -d) unlimited
stack size              (kbytes, -s) 8192
core file size          (blocks, -c) 0
max memory size         (kbytes, -m) unlimited
max user processes              (-u) 63173
open files                      (-n) 1024
max locked memory       (kbytes, -l) 64
virtual memory          (kbytes, -v) unlimited
file locks                      (-x) unlimited
pending signals                 (-i) 63173
POSIX message queues     (bytes, -q) 819200
scheduling priority             (-e) 0
real-time priority              (-r) 0
pipe size            (512 bytes, -p) 8








