## 

/etc/security/limits.d/目录下，里面配置会覆盖/etc/security/limits.conf的配置

## 语法

<domain>　　 <type>　　 <item> 　　 <value>

## type

soft 指的是当前系统生效的设置值（警告）

hard 表明系统中所能设定的最大值（错误）

soft 的限制不能比har 限制高，- 表明同时设置了 soft 和 hard 的值

## item

nofile - 打开的文件描述符的最大数目**（经常设置）**
noproc - 进程程最大数量

core - 限制内核文件的大小（KB）

date - 最大数据大小（KB）

fsize - 最大文件大小（KB）

memlock - 最大锁定内存地址空间（KB）

rss - 最大持久设置大小（KB）

stack - 最大堆栈大小（KB）

cpu - 最大CPU时间（min）

as - 地址空间限制（KB）

maxlogins - 此用户的最大登录数量

maxsyslogins - 在系统上登录的最大数目

priority - 优先级运行用户进程

locks -  文件的最大数量锁定用户可容纳

sigpending - 最大挂起信号的数量

msgqueue - 通过POSIX消息队列使用的最大内存（字节）

nice - 最大不错优先允许提高到值：[-20，19]

rtprio - 最大实时优先

ulimit 命令是用来设置shell启动进程所占用的资源限制的，而nofile是一个有限的值，
并不是 unlimited 的。设置该值的时候不能超出nr_open定义的范围（在2.6.25内核之前
nr_open定义为1024x1024）。 

nr_open是一个进程最多同时打开的文件句柄数量,默认nr_open的值为1048576，可以通过
cat /proc/sys/fs/nr_open查看。

如果我们想要增大nofile的值，比如300万，则首先需要修改nr_open的值，通过直接
sysctl -w fs.nr_open=或者直接写入sysctl.conf文件来修改nr_open的值，之后在增大
nofile的值。

## ulimit命令

ulimit -a
    open files                      (-n) 1024
    max user processes              (-u) unlimited

    core file size          (blocks, -c) 0
    data seg size           (kbytes, -d) unlimited
    scheduling priority             (-e) 0
    file size               (blocks, -f) unlimited
    pending signals                 (-i) 706823
    max locked memory       (kbytes, -l) 64
    max memory size         (kbytes, -m) unlimited
    pipe size            (512 bytes, -p) 8
    POSIX message queues     (bytes, -q) 819200
    real-time priority              (-r) 0
    stack size              (kbytes, -s) 8192
    cpu time               (seconds, -t) unlimited
    virtual memory          (kbytes, -v) unlimited
    file locks                      (-x) unlimited

## 系统级别设置

查看系统最大文件描述符

    cat /proc/sys/fs/file-max

临时性设置系统最大文件描述符

    echo 1000000 > /proc/sys/fs/file-max

永久性设置

    在/etc/sysctl.conf中设置，应该设什么值是最佳实践？比如8G的内存，设为8192/2 * 256 = 524288

    fs.file-max = 1000000

## 用户级别设置

1. 查看 ulimit命令，-n 默认查看的是soft limit，这个值是从
   /etc/security/limits.conf文件的 soft nofile 655350来的

        ulimit -n
        170000

    查看hard limit
        ulimit -Hn
         170000

2. 设置

    临时性：

    通过ulimit -Sn设置最soft limit，注意soft limit必须小于hard limit

        ulimit -Sn 160000

    通过 ulimit -Hn设置最Hard limit

        ulimit -Hn 160000


   同时设置soft limit和hard limit。对于非root用户只能设置比原来小的hard limit。

        ulimit -n 180000

    永久性：

    root权限下，在/etc/security/limits.conf中添加如下两行，星表示所有用户，重启生效

    ` * soft nofile 102400

    ` * hard nofile 104800

    还有一点要注意的就是 hard limit不能大于/proc/sys/fs/nr_open，假如hard limit大于nr_open，注销后将无法正常登录

## file-max > nr_open

`/proc/sys/fs/nr_open` and `/proc/sys/fs/file-max` are both kernel parameters
related to file handling in Linux.

`/proc/sys/fs/nr_open` specifies the maximum number of file handles (i.e., open
files) that can be held by the kernel at one time. This limit applies to all
processes on the system. By default, this value is set to 1048576.

`/proc/sys/fs/file-max` specifies the system-wide maximum number of open file
handles. This includes all files opened by all processes, as well as files that
the kernel may open for its own purposes. By default, this value is set to an
arbitrarily high value, which is determined by the system's memory capacity.

In summary, `/proc/sys/fs/nr_open` sets the per-process limit for file handles,
while `/proc/sys/fs/file-max` sets the system-wide limit.

### what is `nr_open` short for

`nr_open` is short for **"number of open files"**. It is a system-wide limit on
the maximum number of file handles that can be opened at the same time by all
processes on the system. The limit is enforced by the kernel to prevent
processes from opening too many files and exhausting system resources such as
memory and CPU time. The default value of `nr_open` can vary between different
operating systems and distributions, but it is typically in the range of tens
of thousands to millions of files.

From openai

---

nr_open
file-max

    ulimit其实就是对单一程序的限制,进程级别的
    file-max是所有时程最大的文件数
    nr_open是单个进程可分配的最大文件数
        cat /proc/sys/fs/nr_open


    ulimit其实就是对单一程序的限制,进程级别的

    系统总限制:/proc/sys/fs/file-max
    通过 man 5 proc 找到file-max的解释：
    file-max指定了系统范围内所有进程可以打开的文件句柄的数量限制---kernel-level

    可以通过cat查看目前的值，echo来立刻修改
    echo 10000 > /proc/sys/fs/file-max
    另外还有一个，/proc/sys/fs/file-nr
    只读，可以看到整个系统目前使用的文件句柄数量



    nr_open:
        This denotes the maximum number of file-handles a process can
        allocate. Default value is 1024*1024 (1048576) which should be
        enough for most machines. Actual limit depends on RLIMIT_NOFILE
        resource limit.

        The default value fs.nr_open is 1024*1024 = 1048576 defined in kernel code.

        The maximum value of fs.nr_open is limited to sysctl_nr_open_max in
        kernel, which is 2147483584 on x86_64.

    file-max
        The value in file-max denotes the maximum number of file-
        handles that the Linux kernel will allocate. When you get lots
        of error messages about running out of file handles, you might
        want to increase this limit

**file-max是所有进程最大的文件数**

**nr_open是单个进程可分配的最大文件数**, 所以在我们使用ulimit或limits.conf来设置时，
如果要超过默认的1048576值时需要先增大nr_open值(sysctl -w fs.nr_open=100000000或
者直接写入sysctl.conf文件)。:queues ulimit其实就是对单一程序的限制,进程级别的



There are many place have the max limits about the open files:

    /proc/sys/fs/file-max
    /proc/sys/fs/nr_open

    /etc/security/limits.conf
    /etc/systemd/system.conf

    ulimit -n
    /proc/pid/limits

更改方法
    cat /proc/sys/fs/nr_open
    ulimit -n xxx
    修改 /etc/security/limits.conf

    使用ulimt -n命令进行测试，如果小于系统允许的最大值，设置成功，大于最大值，系统会报错提示。


---

阅读0.11版的内核源码时，在linux-0.11/fs/pipe.c中，函数sys_pipe()里面出现了2个宏
定义，NR_OPEN 与 NR_FILE。下面说明一下它们的区别：

    1. NR_OPEN is the maximum number of files that can be opened by process。

        NR_OPEN是一个进程可以打开的最大文件数。
        A process cannot use more than NR_OPEN file descriptors.
        一个进程不能使用超过NR_OPEN文件描述符。

    2. NR_FILE is the limit on total number of files in the system at any given point in time

        NR_FILE 是系统在某一给定时刻，限制的文件总数
