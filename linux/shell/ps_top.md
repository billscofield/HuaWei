a   Lift the BSD-style "only yourself" restriction

x   Lift the BSD-style "must have a tty" restriction

u   Display user-oriented format.

ps aux  which is better formatted according to the user.

---

o format
    Specify user-defined format.  Identical to -o and --format.
O is preloaded o (overloaded).  The BSD O option can act like -O (user-defined output format with some common fields predefined) 
    添加了一些预定义的常用的表头



top 默认3秒一更新，enter立即更新
    -d delay-time
        top -d 1
    h   help
    m   memory栏 图形化显示
    1   所有CPU负载情况
    z   彩色

    load verage: cpu 负载
        1   100%    

    KiB     buff/cache  缓存到内存中

    VIRT    virtual memory size (KiB)
    RES     Resident Memory Size (KiB)
    SHR     Shared Memory Size (KiB)
    TIME+   分:秒.毫秒
        sha1sum /dev/zero

    
    M   按内存使用排序
    P   按 CPU 使用排序
    N   按 PID 的大小排序
    R   对排序进行反转
    f   自定义显示字段
        W 进行保存，保存到 ~/.toprc
    <   向前
    >   向后

    
top -p pid
    -p pid1,pid2
    -u 指定用户
    -n 几次
