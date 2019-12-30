## ros 结合 nfdump 进行用户上网日志记录


http://nfdump.sourceforge.net/

NetFlow是一种网络监测功能，可以收集进入及离开网络界面的IP封包的数量及资讯，最早由思科公司研发，应用在路由器及交换器等产品上。
经由分析Netflow收集到的资讯，网络管理人员可以知道封包的来源及目的地，网络服务的种类，以及造成网络壅塞的原因

nfdump(netflow dump转储) 是一款开源的netflow收集、存储、过滤、统计分析软件。

nfdump包含了五个命令：
    1. nfcapd - netflow capture daemon.  
        Reads the netflow data from the network and stores the data into files. Automatically rotate files every n minutes. ( typically ever 5 min  ) nfcapd reads netflow v5, v7 and v9 flows transparently. You need one nfcapd process for each netflow stream.

    1. nfdump - netflow dump.
        Reads the netflow data from the files stored by nfcapd. It's syntax is similar to tcpdump. If you like tcpdump you will like nfdump. Displays netflow data and can create lots of top N statistics of flows IP addresses, ports etc ordered by whatever order you like.

    1. nfprofile - netflow profiler.
        Reads the netflow data from the files stored by nfcapd. Filters the netflow data according to the specified filter sets ( profiles  ) and stores the filtered data into files for later use. 

    1. nfreplay - netflow replay
        Reads the netflow data from the files stored by nfcapd and sends it over the network to another host.

    1. nfclean.pl - cleanup old data
        Sample script to cleanup old data. You may run this script every hour or so.

    1. ft2nfdump - Read and convert flow-tools data.
        Reads flow-tools data from files or from stdin in a chain of flow-tools commands and converts the data into nfdump format to be processed by nfdump.


### 安装
apt install nfdump

nfcapd -z -w -D -T all -p 2155 -l /data/flows -S 1 -P /var/lib/nfcapd.pid

-z      - Compress flows in output file.
-w      - Sync file rotation with next 5min (default) interval
-D      - Fork to background
-T      - Include extension tags in records.
all
-p      - portnum      listen on port portnum
-l      - basdir       set the output directory. (no default)
-S      - subdir       Sub directory format. see nfcapd(1) for format
                        0 default     没有层级结构
                        1 %Y/%m/%d year/month/day
                        2 %Y/%m/%d/%H year/month/day/hour
                        3 %Y/%W/%u year/week_of_year/day_of_week
                        4 %Y/%W/%u/%H year/week_of_year/day_of_week/hour
                        5 %Y/%j year/day-of-year
                        6 %Y/%j/%H year/day-of-year/hour
                        7 %Y-%m-%d year-month-day
                        8 %Y-%m-%d/%H year-month-day/hour
-P      - pidfile      set the PID file



nfdump -R nfcapd.201905161615
Date first seen          Duration Proto      Src IP Addr:Port          Dst IP Addr:Port   Packets    Bytes Flows
2019-05-16 16:17:07.635     0.000 UDP      192.168.30.32:9011  ->        10.0.0.83:9011         1      332     1
2019-05-16 16:17:07.635     0.000 UDP          10.0.1.42:9012  ->   172.16.188.254:19938        1      110     1
2019-05-16 16:17:07.635     0.000 UDP          10.0.1.42:9012  ->   172.16.188.254:65199        1      110     1
2019-05-16 16:17:07.635     0.000 UDP          10.0.1.42:64400 ->   172.16.188.254:52798        1      110     1
2019-05-16 16:17:07.635     0.000 UDP          10.0.1.42:64400 ->   172.16.188.254:56046        1      110     1
2019-05-16 16:17:07.635     0.000 UDP          10.0.1.42:64400 ->   172.16.188.254:57136        1      110     1
2019-05-16 16:17:07.635     0.000 UDP          10.0.1.42:64400 ->   172.16.188.254:57964        1      110     1
2019-05-16 16:17:07.635     0.000 UDP          10.0.1.42:64400 ->   172.16.188.254:63716        1      110     1
2019-05-16 16:17:07.635     0.000 UDP          10.0.1.42:64400 ->   172.16.188.254:55926        1      110     1
