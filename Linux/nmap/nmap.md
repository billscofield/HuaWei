## Network Mapper

Nmap脚本引擎（NSE）和 Lua编程语言
    nmap script engine
whereis nmap
cd /usr/share/nmap/script/     kali是安装在这里
    script.db 数据库, 显示了每个的功能分类categories
        Entry { filename = "afp-serverinfo.nse", categories = { "default", "discovery", "safe",  }  }

均是以nse结尾的脚本

### 更新脚本库

nmap --script-update

/usr/share/nmap/script/


---
If no host discovery options are given, Nmap sends an ICMP echo request, a TCP SYN packet to port 443, a TCP ACK packet to port 80, and an ICMP timestamp request. (For IPv6, the ICMP timestamp
request is omitted because it is not part of ICMPv6.) 

These defaults are equivalent to the -PE -PS443 -PA80 -PP options. -sn 就是这个的集合-PE -PS443 -PA80 -PP

The exceptions to this are the ARP (for IPv4) and Neighbor Discovery (for IPv6) scans which are used for any targets on a local ethernet network. 

---

`ARP/Neighbor Discovery (-PR) is done by default against targets on a local ethernet network even if you specify other -P* options, because it is almost always faster and more effective.








### target specification

-iL 要以空格，tab 换行分割

-iR 0:无休止

    nmap -sS -PS80 -iR 0 
        SYN
        -PS


### 主机发现 Host Discovery

192.168.0-255.1     不包含0和255?
192.168.1,2,3,4.1

-sn (No port scan)
    not to do a port scan after host discovery

    consists of by default. 
        1. an ICMP echo request,    -PE ?-PO1
        1. TCP SYN to port 443,     -PS443
        1. TCP ACK to port 80,      -PA80
        1. ICMP timestamp request   -PP
    In previous releases of Nmap, -sn was known as -sP.

    The -sn option can be combined with any of the discovery probe types (the -P* options, excluding -Pn) for greater flexibility. 
    If any of those probe type and port number options are used, the default probes are overridden. 


-Pn
    skip the Nmap discovery stage altogether.
    对于那些知道是up状态的机器

    Nmap only performs heavy probing such as port scans, version detection, or OS detection against hosts that are found to be up.

-sL: 
    Since the idea is to simply print a list of target hosts, options for higher level functionality such as port scanning, OS detection, or ping scanning cannot be combined with this. 
    If you wish to disable ping scanning while still performing such higher level functionality, read up on the -Pn (skip ping) option.

    相当于给你列出这个网段有哪些机器，帮你做数学题而已

    例如
        nmap 192.168.1.0/29 -sL

        Starting Nmap 7.80 ( https://nmap.org  ) at 2020-03-10 07:00 CST
        Nmap scan report for bogon (192.168.1.0)
        Nmap scan report for bogon (192.168.1.1)
        Nmap scan report for bogon (192.168.1.2)
        Nmap scan report for bogon (192.168.1.3)
        Nmap scan report for bogon (192.168.1.4)
        Nmap scan report for bogon (192.168.1.5)
        Nmap scan report for bogon (192.168.1.6)
        Nmap scan report for bogon (192.168.1.7)
        Nmap done: 8 IP addresses (0 hosts up) scanned in 0.50 seconds


-sn 和 -PO1 还是不一样
    ➜  ~ nmap -sn 172.20.10.1
    Starting Nmap 7.80 ( https://nmap.org  ) at 2020-03-10 07:19 CST
    Nmap scan report for bogon (172.20.10.1)
    Host is up (0.0069s latency).
    MAC Address: 76:9F:13:F1:37:64 (Unknown)
    Nmap done: 1 IP address (1 host up) scanned in 0.10 seconds

    ➜  ~ nmap -PO1 172.20.10.1
    Starting Nmap 7.80 ( https://nmap.org  ) at 2020-03-10 07:19 CST
    Nmap scan report for bogon (172.20.10.1)
    Host is up (0.0032s latency).
    Not shown: 829 closed ports, 168 filtered ports
    PORT      STATE SERVICE
    21/tcp    open  ftp
    53/tcp    open  domain
    62078/tcp open  iphone-sync
    MAC Address: 76:9F:13:F1:37:64 (Unknown)

    -sn 发现主机后不扫描端口




### 关于 TCP
Urgent      当==1时，表明此报文应尽交给下层
Ack         当==1时才有意义
Push        当==1是，表明此报文应尽快交给上层
Reset       ==1时，表名出现严重错误，必须释放连接，然后再重建连接。
            还用来拒绝一个不法的报文段或拒绝打开一个连接
Synchronize Syn==1,ACK=0 表明这是一个请求报文
Final       ==1时，表名欲发送的字符串已经发完，并请求释放传输连接


SYN---->
<-----SYN ACK
ACK---->



-------->Final
<--------ACK
<--------Final
-------->ACK

### 关于 ICMP差错报文 Internet Control Message Protocol

1. ICMP目标不可达信息
    IP路由器无法将IP数据报发送给目的地址时，会给发送端主机返回一个目标不可达ICMP信息，并标明不可达的具体原因

1. ICMP 重定向消息
    如果路由器发现发送端主机使用次优路径发送数据时，则改路由返回一个ICMP重定向消息给发送端主机，该消息包含了最有路由信息
    

1. ICMP 超时消息
    TTL，每经过一个路由就会减少1，直到减到0时该IP数据报被丢弃, 此时路由器发送一个ICMP超时消息给发送端主机

1. 源抑制消息
    如果速度达到路由器或链路的饱和状态，路由器发出一个ICMP源抑制消息


ICMP 回送消息(echo) 
    判断发送数据包是否成功到达对端的消息
    可以向对端主机发送回送请求消息，
    也可以接收对端主机回来的回送应答消息

ICMP 时间戳消息
    Timestamp is used for time synchronization.
    可以向那些主机发送ICMP时间戳请求消息，然后通过接受ICMP时间戳应答消息获取时间信息

ICMP 地址掩码消息
    Address mask request is normally sent by a host to a router in order to obtain an appropriate subnet mask
    

    ```
    -P* 
    -P0
    -PS
        发送syn
            若是closed, 返回RST
            若是opened, 返回SYN/ACK, 然后发送RST

        默认80端口
        -PS25,29-90,80  不能有空格
    
    -PA
        直接发送ACK(第三部),返回RST则说明活着
        -PA25,29-90,80  不能有空格

    -PU(ICMP)
        发送empty数据报，大部分open端口会直接忽略, closed端口会返回一个不可达包信息
        所以要用不经常用的端口

    -PE ICMP echo   和ping有什么区别
    -PP ICMP timestamp
    -PM ICMP Netmask

    -PR(Arp Ping)
        ARP scan puts Nmap and its optimized algorithms in charge of ARP requests. (arp扫描使nmap及其优化算法负责arp请求)
        And if it gets a response back, Nmap doesn't even need to worry about the IP-based ping packets since it already knows the host is up. 
        This makes ARP scan much faster and more reliable than IP-based scans. 
        So it is done by default when scanning ethernet (hosts that Nmap detects) are on a local ethernet network. 
        Even if different ping types (such as -PE or -PS) are specified, Nmap uses ARP instead for any of the targets which are on the same LAN. 
        If you absolutely don't want to do an ARP scan, specify --disable-arp-ping.

    ```

### 服务指纹信息
包括服务端口，服务名，版本


### 端口状态

Open: 开发状态
Closed: 关闭状态
Filtered
UnFiltered
Opened/Unfiltered
Closed/Unfiltered






-A (Aggressive侵略性 scan options)
    This option enables additional advanced and aggressive options. 
    Presently this enables 
        OS detection (-O), 
        version scanning (-sV), 
        script scanning (-sC)
        traceroute (--traceroute).  

    More features may be added in the future. 
    The point is to enable a comprehensive set of scan options without people having to remember a large set of flags. 
    However, because script scanning with the default set is considered intrusive, you should not use -A against target networks without permission. 
    This option only enables features, and not timing options (such as -T4) or verbosity options (-v) that you might want as well. 
    Options which require privileges (e.g. root access) such as OS detection and traceroute will only be enabled if those privileges are available.




-T paranoid|sneaky|polite|normal|aggressive|insane (Set a timing template)
    While the fine-grained timing controls discussed in the previous section are powerful and effective, some people find them confusing. Moreover, choosing the appropriate values can sometimes
    take more time than the scan you are trying to optimize. Fortunately, Nmap offers a simpler approach, with six timing templates. You can specify them with the -T option and their number
    (0–5) or their name. The template names are 
        paranoid (0), 
        sneaky (1), 
        polite (2), 
        normal (3), 
        aggressive (4), 
        and insane (5). 

    The first two are for IDS evasion. 
    Polite mode slows down the scan to use less bandwidth and target machine resources. 
    Normal mode is the default and so -T3 does nothing. 
    Aggressive mode speeds scans up by making the assumption that you are on a reasonably fast and reliable network. 
    insane mode assumes that you are on an extraordinarily fast network or are willing to sacrifice some accuracy for speed.


    These templates allow the user to specify how aggressive they wish to be, while leaving Nmap to pick the exact timing values. The templates also make some minor speed adjustments for which
    fine-grained control options do not currently exist. For example, -T4 prohibits the dynamic scan delay from exceeding 10 ms for TCP ports and -T5 caps that value at 5 ms. Templates can be
    used in combination with fine-grained controls, and the fine-grained controls that you specify will take precedence over the timing template default for that parameter. I recommend using -T4
    when scanning reasonably modern and reliable networks. Keep that option even when you add fine-grained controls so that you benefit from those extra minor optimizations that it enables.

    If you are on a decent broadband or ethernet connection, I would recommend always using -T4. Some people love -T5 though it is too aggressive for my taste. People sometimes specify -T2
    because they think it is less likely to crash hosts or because they consider themselves to be polite in general. They often don't realize just how slow -T polite really is. Their scan may
    take ten times longer than a default scan. Machine crashes and bandwidth problems are rare with the default timing options (-T3) and so I normally recommend that for cautious scanners.
    Omitting version detection is far more effective than playing with timing values at reducing these problems.

    While -T0 and -T1 may be useful for avoiding IDS alerts, they will take an extraordinarily long time to scan thousands of machines or ports. For such a long scan, you may prefer to set the
    exact timing values you need rather than rely on the canned -T0 and -T1 values.

    The main effects of T0 are serializing the scan so only one port is scanned at a time, and waiting five minutes between sending each probe.  T1 and T2 are similar but they only wait 15
    seconds and 0.4 seconds, respectively, between probes.  T3 is Nmap's default behavior, which includes parallelization.  -T4 does the equivalent of --max-rtt-timeout 1250ms --min-rtt-timeout
    100ms --initial-rtt-timeout 500ms --max-retries 6 and sets the maximum TCP scan delay to 10 milliseconds.  T5 does the equivalent of --max-rtt-timeout 300ms --min-rtt-timeout 50ms
    --initial-rtt-timeout 250ms --max-retries 2 --host-timeout 15m --script-timeout 10m as well as setting the maximum TCP scan delay to 5 ms.





例子：
    nmap -T4 -A -v Target

    ```
    nmap -T4 -A 192.168.200.254

    Starting Nmap 7.70 ( https://nmap.org  ) at 2020-03-10 20:12 CST
    Nmap scan report for localhost (192.168.200.254)
    Host is up (0.00031s latency).
    Not shown: 993 closed ports
    PORT     STATE SERVICE        VERSION
    21/tcp   open  ftp            MikroTik router ftpd 6.43.16
    | ftp-syst:
    |_  SYST: UNIX MikroTik 6.43.16
    22/tcp   open  ssh            MikroTik RouterOS sshd (protocol 2.0)
    | ssh-hostkey:
    |   1024 f4:69:f6:33:88:cb:ef:08:3d:67:58:bf:a8:d1:f8:08 (DSA)
    |_  2048 a1:fb:22:d7:14:f3:da:6c:f7:82:7e:02:9a:e3:10:eb (RSA)
    23/tcp   open  telnet         Linux telnetd
    53/tcp   open  domain         (generic dns response: NOTIMP)
    80/tcp   open  http           MikroTik router config httpd
    | http-robots.txt: 1 disallowed entry
    |_/
    |_http-title: RouterOS router configuration page
    2000/tcp open  bandwidth-test MikroTik bandwidth-test server
    8291/tcp open  unknown
    1 service unrecognized despite returning data. If you know the service/version, please submit the following fingerprint at https://nmap.org/cgi-bin/submit.cgi?new-service :
    SF-Port53-TCP:V=7.70%I=7%D=3/10%Time=5E67845E%P=x86_64-pc-linux-gnu%r(DNSV
    SF:ersionBindReqTCP,E,"\0\x0c\0\x06\x81\x84\0\0\0\0\0\0\0\0")%r(DNSStatusR
    SF:equestTCP,E,"\0\x0c\0\0\x90\x84\0\0\0\0\0\0\0\0");
    MAC Address: 7E:6D:49:0C:20:24 (Unknown)
    Device type: general purpose
    Running: Linux 2.6.X|3.X
    OS CPE: cpe:/o:linux:linux_kernel:2.6 cpe:/o:linux:linux_kernel:3
    OS details: Linux 2.6.32 - 3.10
    Network Distance: 1 hop
    Service Info: OSs: Linux, RouterOS; Device: router; CPE: cpe:/o:mikrotik:routeros, cpe:/o:linux:linux_kernel

    TRACEROUTE
    HOP RTT     ADDRESS
    1   0.31 ms localhost (192.168.200.254)

    OS and Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
    Nmap done: 1 IP address (1 host up) scanned in 170.74 seconds
    ```


    nmap -sC -sV -O Target
        -sC --script=default
        -O (Enable OS detection)
           Enables OS detection, as discussed above. Alternatively, you can use -A to enable OS detection along with other things.

    ```
    nmap -sC -sV -O 192.168.200.254
    Starting Nmap 7.70 ( https://nmap.org  ) at 2020-03-10 20:22 CST
    Nmap scan report for localhost (192.168.200.254)
    Host is up (0.00024s latency).
    Not shown: 993 closed ports
    PORT     STATE SERVICE        VERSION
    21/tcp   open  ftp            MikroTik router ftpd 6.43.16
    | ftp-syst:
    |_  SYST: UNIX MikroTik 6.43.16
    22/tcp   open  ssh            MikroTik RouterOS sshd (protocol 2.0)
    | ssh-hostkey:
    |   1024 f4:69:f6:33:88:cb:ef:08:3d:67:58:bf:a8:d1:f8:08 (DSA)
    |_  2048 a1:fb:22:d7:14:f3:da:6c:f7:82:7e:02:9a:e3:10:eb (RSA)
    23/tcp   open  telnet         Linux telnetd
    53/tcp   open  domain         (generic dns response: NOTIMP)
    80/tcp   open  http           MikroTik router config httpd
    | http-robots.txt: 1 disallowed entry
    |_/
    |_http-title: RouterOS router configuration page
    2000/tcp open  bandwidth-test MikroTik bandwidth-test server
    8291/tcp open  unknown
    1 service unrecognized despite returning data. If you know the service/version, please submit the following fingerprint at https://nmap.org/cgi-bin/submit.cgi?new-service :
    SF-Port53-TCP:V=7.70%I=7%D=3/10%Time=5E678681%P=x86_64-pc-linux-gnu%r(DNSV
    SF:ersionBindReqTCP,E,"\0\x0c\0\x06\x81\x84\0\0\0\0\0\0\0\0")%r(DNSStatusR
    SF:equestTCP,E,"\0\x0c\0\0\x90\x84\0\0\0\0\0\0\0\0");
    MAC Address: 7E:6D:49:0C:20:24 (Unknown)
    Device type: general purpose
    Running: Linux 2.6.X|3.X
    OS CPE: cpe:/o:linux:linux_kernel:2.6 cpe:/o:linux:linux_kernel:3
    OS details: Linux 2.6.32 - 3.10
    Network Distance: 1 hop
    Service Info: OSs: Linux, RouterOS; Device: router; CPE: cpe:/o:mikrotik:routeros, cpe:/o:linux:linux_kernel

    OS and Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
    Nmap done: 1 IP address (1 host up) scanned in 170.78 seconds
    ```


    nmap -p80 192.168.200.254
    仅仅扫描这个端口

    Starting Nmap 7.70 ( https://nmap.org  ) at 2020-03-10 20:35 CST
    Nmap scan report for localhost (192.168.200.254)
    Host is up (0.00033s latency).

    PORT   STATE SERVICE
    80/tcp open  http
    MAC Address: 7E:6D:49:0C:20:24 (Unknown)

    Nmap done: 1 IP address (1 host up) scanned in 7.03 seconds
     



-p port ranges (Only scan specified ports)
    This option specifies which ports you want to scan and overrides the default. Individual port numbers are OK, as are ranges separated by a hyphen (e.g.  1-1023). 
    The beginning and/or end values of a range may be omitted, causing Nmap to use 1 and 65535, respectively. 
    So you can specify **-p-** to scan ports from 1 through 65535. 
    Scanning port zero is allowed if you specify it explicitly. 
    For IP protocol scanning (-sO), this option specifies the protocol numbers you wish to scan for (0–255).

    When scanning a combination of protocols (e.g. TCP and UDP), you can specify a particular protocol by preceding the port numbers by 
        T: for TCP, 
        U: for UDP, 
        S: for SCTP, 
        P: for IP
    Protocol. 

    The qualifier lasts until you specify another qualifier. For example, the argument 
        -p U:53,111,137,T:21-25,80,139,8080 
    would scan UDP ports 53, 111,and 137, as well as the listed TCP ports. 

    Note that to scan both UDP and TCP, you have to specify -sU and at least one TCP scan type (such as -sS, -sF, or -sT). 
    If no protocol qualifier is given, the port numbers are added to all protocol lists.  
    Ports can also be specified by name according to what the port is referred to in the nmap-services. You can even use the wildcards * and ?  with the names. 
    For example, to scan FTP and all ports whose names begin with “http”, use -p ftp,http*. 
    Be careful about shell expansions and quote the argument to -p if unsure.

    Ranges of ports can be surrounded by square brackets to indicate ports inside that range that appear in nmap-services. 
    For example, the following will scan all ports in nmap-services equal to or below 1024: 
        -p [-1024]
    Be careful with shell expansions and quote the argument to -p if unsure.





-e <iface>: Use specified interface





### NSE

nmap --script 脚本名称 Target

vuln 漏洞 vulnerability [ˌvʌlnrˈbɪlti]
    nmap -sV --script vuln TARGET


exploit [ɪkˈsplɔɪt] 溢出?




### ndff
apt install ndiff

Utility to compare the results of Nmap scans

ndiff [options] {a.xml} {b.xml}




## 发现的问题

不管是 host discovery 阶段还是 port scan 阶段，如果不指定 端口号，并没有单单扫描默认端口号，而是扫描了很多

只有当指定 例如-p22 的时候, 会进行精确扫描

配合 tcpdump -n src host 192.168.220.2 -w 文件.pcap




