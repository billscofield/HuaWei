
# macos commandline

open
    使用系统默认的软件打开文件

sudo spctl  --master-disable


control a   行首
control e   行尾

## network

ping


ifconfig

    **lo**          loopback or localhost       
    **en**          Ethernet                            以太网或802.11接口
    gif         Software Network Interface          软件网络接口，通用 IP-in-IP隧道
    stf         6to4 tunnel interface               ipv6 -> ipv4 通用接口
    fw          Firewire                            IP over FireWire （高速火线连接）
    vmnet       Virtual Interface                   虚拟接口
    awdl        airdrop peer to peer                apple airdrop 设备特有
    bridge      bridge                              桥接
    p2p         Point-toPoint                       点对点网络

    ifconfig | grep en

    ifconfig en0

    networksetup -listallhardwareports              // 查看网络接口简写信息
        可以看到 wifi 蓝牙等都是 en 开头的

ipconfig
    ipconfig getifaddr en0                          // IP address
    ipconfig getoption en0 router                   // gateway
    ipconfig getoption en0 domain_name_server       // DNS

    ifconfig en0 inet 192.168.1.1 netmask 255.255.255.0
    ipconfig set en0 (manual | inform) 192.168.1.1 255.255.0.0

netstat
    -p tcp/udp              // etc/protocols - /etc/services

    -l  Print full IPv6 address.        // netstat -an 也会显示，估计是 ipv6 的格式会不一样吧

    -L  Show the size of the various listen queues.  The first count shows the
        number of unaccepted connections.  The second count shows the amount
        of unaccepted incomplete connections.  The third count is the maximum
        number of queued connections.

    netstat -a              // all
    netstat -an
    netstat -anv
    netstat -anvp tcp
    netstat -anvp udp

    netstat -r
    netstat -aL
    netstat -anL

    netstat -al
    netstat -anl

    proto   Recv-Q  Send-Q  LocalAddress    ForeignAddress  state

lsof
    -i              // internet
    -i4
    -i6
    -iTCP
    -iTCP:80
    
    -i:3306

    -s 需要和 -i 配合使用，用于制定协议和状态
        lsof -iTCP -sTCP:LISTEN

    -n
    -P              // 端口号不进行转换

    COMMAND    PID    USER    FD    TYPE    DEVICE    SIZE/OFF    NODE(UDP/TCP)    NAME

networksetup




## 进程管理

ps
    -e/-A/-ax       // all processes

    -f              // Display the uid, pid, parent pid, recent CPU usage, process start time, controlling tty,
                    // elapsed CPU usage, and the associated command.

    -o pid,ppid,user,comm
        comm        // 一些参数不会显示
        command     // 会显示所有的参数信息
    -L              // List the set of keywords available for the -O and -o options.

    -a              // This will **skip** any processes which do not have a controlling terminal, unless the -x option is also specified.
    -x              // include processes which do not have a controlling terminal
    -p [pid]
    -u [user]


kill pid

killall 进程名（或部分进程名）

pkill 进程名（或部分进程名）

## 硬件信息

sudo powermetrics

    -s --samplers
        tasks             per task cpu usage and wakeup stats
        battery           battery and backlight info
        network           network usage info
        disk              disk usage info
        int_sources       interrupt sources information
        devices           device power states
        interrupts        interrupt distribution
        cpu_power         c-state residency, power and frequency info
        gpu_power         gpu c-state residency, p-state residency and frequency info
        gpu_agpm_stats    Statistics reported by AGPM
        smc               SMC sensors                               // may be short for "sensorimotor cortex"(感觉运动皮层)
        thermal           thermal pressure notifications
        sfi               selective forced idle information
        ioaf_perf_stats   Perf Statistics reported by IOAcceleratorFamily
        ltr               LTRs
        pch_stats         pch config and activity counter info
        flex_telemetry    flexible telemetry counter info
        powerstats_compat   powerstats compatibility mode
        nvme_ssd          NVMe power state information
        io_throttle_ssd   IO Throttling information

    and the following sampler groups are supported by --samplers:

        all           tasks,battery,network,disk,int_sources,devices,interrupts,cpu_power,gpu_power,gpu_agpm_stats,smc,thermal,sfi,ioaf_perf_stats,ltr,pch_stats,flex_telemetry,powerstats_compat,nvme_ssd,io_throttle_ssd
        default       tasks,battery,network,disk,interrupts,cpu_power,gpu_power,gpu_agpm_stats,sm



## 

root

shutdown 
    -h halt
    -s sleep
    -r reboot

    time
        now
        +分钟数
        hh:mm
        yymmddhhmm      // 年 月 日 时 分

    messages

    halt = shutdown -h now

reboot



