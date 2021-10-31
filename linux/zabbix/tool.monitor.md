
服务器硬件

    apt-cache show ipmitool

cpu
    lscpu

    uptime

    top

        1 running   

        TIME+: 累计时间  minutes:seconds.hundredths

    htop

    glances

    w

进程

    top -> task

内存

    free: The information is gathered by parsing /proc/meminfo.

        -k, --kibi
            Display the amount of memory in kibibytes.  This is the default.


    vmstat

网络
    
    ip 

    ifconfig

    route

    iftop

    glances

    nethogs


io

    iotop
    
    iostat(sysstat包)

    dstat(dstat)

    df -h
    df -i

磁盘
    
    vmstat -d
    vmstat -D
    vmstat -p


tcp 状态

    netstat
        

    ss
        ss -an | awk '{print $2}' | sort | uniq -c

        通过读取 proc 



