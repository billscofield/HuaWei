### 进程的状态

1. R    TASK_RUNNING            可执行状态（RUNNING, READY)
2. S    TASK_INTERRUPTIBLE      可唤醒睡眠状态                  使用CPU时间超时后等待，CPU进行询问是否要使用CPU,可继续执行的状态(计算机自动调整的)
3. D    TASK_UNINTERRUPTIBLE    不可唤醒睡眠状态                某个条件没有满足，不能使用CPU，需要读写磁盘的时候(计算机自动调整的)
4. T    TASK_STOPPED            暂停状态                        被暂停，后台状态(人工调整的)
5. z    EXIT_ZOMBIE             僵死态                          退出时没有交出资源
   子进程的资源都是父进程给的，某种情况下，父进程挂了，子进程还在，此时子进程就成了孤儿进程
   孤儿进程执行完毕后，本应该父进程进行资源回收，但是父进程已经挂了，没有人回收孤儿进程的资源，此时孤儿进程就成了僵死态


    ps -ef -o stat       //所有进程的状态
        Ss+
        Ss+
        Ss+
        Ss+
        Ss
        S+
        Ss
        S+
        S+
        Ss
        R+
        Ss
        S+
        Ss+
        T1

pstree

进程是从上往下的，
进程是资源调度的最小单位
线程的资源是共享的进程的        任务：打扫房间，一个人一件一件干，




systemd 守护进程, 大Boss, 对子进程初始化, 


ps  process snapshot

BSD风格的
    a 与终端相关的(tty)
    x 与终端无关的(tty) 显示问号是因为 不知道tty是什么，有tty的是已经执行完毕了的
        带问号的 大多是子进程
    所有的就是 a+x 即 ps ax
    u  以用户为归类的准则
        没有u参数的手，PID 从小到大排序，
        有了u参数之后，类似 order by pid, group by user

        ```ps ax
        PID TTY      STAT   TIME COMMAND
            1 ?        Ss     1:06 /sbin/init
        
        TIME:进程占用CPU的时间


        ps aux
        USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
        root         1  0.0  0.2 170756  8576 ?        Ss   Apr04   1:06 /sbin/init

        VSZ: virtual size 虚拟内存占用量
        RSS: resident set size 常驻内存集大小
        ```

    f   进程的层级关系, 进程和子进程

    o   查看指定选项, pid,comm,nice,pri,pcpu,stat,ppid



UNIX风格
    -e  显示所有进程
    -f  完整格式信息
    -H  层级结构
    -o  查看指定选项 pid,comm,nice,%cpu,%mem,



WCHAN   address of the kernel function where the process is sleeping (use wchan if you want
        the kernel function name).  Running tasks will display a dash ('-') in this column.




### 进程过滤 pgrep

-u  uid     指定用户进程
    pgrep -u 0
    pgrep -u root

-U  name    指定用户进程
    发现-u 和 -U 可以混用

-t  tty
    pgrep -t pts/2
-l              显示进程名称
-a              显示进程名称的完整格式,包括参数
-P  parentid    显示指定进程的子进程

不能根据进程号来定精确定位某个进程, 比如 tmux 的进程, 所以使用 pidof


### pidof 根据进程名称获取pid

pidof tmux




## top

load average: 1分钟 5分钟 15分钟 负载
    任务队列中等待cpu处理的队列的长度，值越大，负载越高

%Cpu(s):  0.1 us,  0.1 sy,  0.0 ni,                     99.8 id,  0.0 wa,               0.0 hi,         0.0 si,         0.0 st
        用户空间 内核空间  优先级调整是占用的CPU量      空闲       等待输入输出(IO)     处理硬件中断    处理软件中断    虚拟化等待实际CPU的时间的百分比

st (Steal time)是当hypervisor服务另一个虚拟处理器的时候，虚拟CPU等待实际CPU的时间的百分比
Steal值比较高的话，你需要向主机供应商申请扩容虚拟机。服务器上的另一个虚拟机可能拥有更大更多的CPU时间片，你可能需要申请升级以与之竞争。另外，高steal值可能意味着主机供应商在服务器上过量地出售虚拟机。steal值还是不降的话，你应该寻找另一家服务供应商。

低steal值意味着你的应用程序在目前的虚拟机上运作良好。因为你的虚拟机不会经常地为了CPU时间与其它虚拟机激烈竞争，你的虚拟机会更快地响应。这一点也暗示了，你的主机供应商没有过量地出售虚拟服务，绝对是一件好事情。
http://www.91linux.com/html/article/cmd/top/20090417/16525.html

---
MiB Mem :   3946.4 total,    409.4 free,    487.3 used,   3049.7 buff/cache

buff:   写
cache:  读

buff/cache 可以被回收的

空闲总量：free + buff/cache

---
MiB Swap:   1021.0 total,    935.7 free,     85.2 used.   3158.2 avail Mem


  PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND

VIRT:virtual memory usage 
RES:resident memory usage 常驻内存
SHR:shared memory 
S:状态

DATA 
    1、数据占用的内存。如果top没有显示，按f键可以显示出来。 
    2、真正的该程序要求的数据空间，是真正在运行中要使用的。

whose current sort field is %CPU
Navigate with Up/Dn, Right selects for move then <Enter> or Left commits,
'd' or <Space> toggles display, 's' sets sort.  Use 'q' or <Esc> to end!


按f键触发选择列选项
默认按照 %cpu 排序 , 按 s 选择当前列排序
d 或者 空格 显示/隐藏
q 或者 Esc  退出






M %mem 排序
T Time+ 排序
l 隐藏显示 负载行




free 是真正尚未被使用的物理内存数量。
available 是应用程序认为可用内存数量，available = free + buffer + cache (注：只是大概的计算方法)

Linux 为了提升读写性能，会消耗一部分内存资源缓存磁盘数据，对于内核来说，buffer 和 cache 其实都属于已经被使用的内存。但当应用程序申请内存时，如果 free 内存不够，内核就会回收 buffer 和 cache 的内存来满足应用程序的请求。这就是稍后要说明的 buffer 和 cache。



