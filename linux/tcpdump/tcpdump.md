
links:

    https://www.cnblogs.com/createyuan/archive/2014/03/31/3636098.html

    https://www.tcpdump.org/


Tcpdump requires libpcap, which is a library for network packet capture. If
it's not installed, it will be automatically added as a dependency.

tcpdump
    --list-interfaces (or -D for short) to see which interfaces are available for capture


TCP Flags Flags [P.] 
    S   |   SYN     |   Connection Start
    F   |   FIN     |   Connection Finish
    P   |   PUS     |   HData push
    R   |   RST     |   Connection reset
    .   |   ACK     |   Acknowledgment

    [S.] for a SYN-ACK packet.


seq 196:568

    the sequence number of the data contained in the packet. For the first
    packet captured, this is an absolute number. Subsequent packets use a
    relative number to make it easier to follow. In this example, the sequence
    is seq 196:568, which means this packet contains bytes 196 to 568 of this
    flow.


This is followed by the Ack Number: ack 1. In this case, it is 1 since this is
the side sending data. For the side receiving data, this field represents the
next expected byte (data) on this flow. For example, the Ack number for the
next packet in this flow would be 568.


The next field is the window size win 309, which represents the number of bytes
available in the receiving buffer, followed by TCP options such as the MSS
(Maximum Segment Size) or Window Scale. 


Finally, we have the packet length, length 372, which represents the length, in
bytes, of the payload data. The length is the difference between the last and
first bytes in the sequence number.



You can create more complex expressions by grouping filter with parentheses. In
this case, enclose the entire filter expression with quotation marks to prevent
the shell from confusing them with shell expressions:

```
tcpdump -i any -c5 -nn "port 80 and (src 192.168.122.98 or src 54.204.39.132)" 
```


Changing packet size in the capture file

    By default, when capturing packets into a file, it will save only 68 bytes
    of the data from each packet. Rest of the information will be thrown away.

        tcpdump -w file.cap -s 0


Printing content of the packet

    -x command line switch will make tcpdump to print each packet in
    hexadecimal format. Number of bytes that will be printed remains somewhat a
    mystery. As is, it will print first 82 bytes of the packet, excluding
    ethernet header. You can control number of bytes printed using -s command
    line switch.

    In case you want to see ethernet header as well, use -xx. It will cause
    tcpdump to print extra 14 bytes for ethernet header.


tcpdump src net 67.207.148.0 mask 255.255.255.0
tcpdump src net 67.207.148.0/24


less and greater qualifiers tell tcpdump that you are interested in packets
whose length is less or greater than value you specified.

    tcpdump -ni eth1 greater 1000

    Will capture only packets whose size is greater than 1000 bytes.



tcpdump -XX greater 100 and \(src host google.com or src host microsoft.com\)

and and or keywords in tcpdump filter language have same precedence and
evaluated left to right. This means that without brackets, tcpdump could have
captured packets from microsoft.com disregarding packet size. With brackets,
tcpdump first makes sure that all packets are greater than 100 bytes and only
then checks their origin.

Note the backslash symbol (“\”) before brackets. We have to place them before
brackets because of shell. Unix shell has special understanding of what
brackets used for. Hence we have to tell shell to leave these particular
brackets alone and pass them as they are to tcpdump. Backslash characters do
exactly this.







promiscuous [prəˈmɪskjuəs]  adj. 混杂的；杂乱的


-i interface
    --interface=interface
       Listen on interface.  If unspecified, tcpdump searches the system interface list for the lowest num‐
       bered, configured up interface (excluding  loopback),  which  may  turn  out  to  be,  for  example,
       ``eth0''.

       On  Linux systems with 2.2 or later kernels, an interface argument of ``any'' can be used to capture
       packets from all interfaces.  Note that captures on the ``any'' device will not be done in promiscuous mode.

       If  the  -D flag is supported, an interface number as printed by that flag can be used as the interface argument, if no interface on the system has that number as a name.


-S
    --absolute-tcp-sequence-numbers
        Print absolute, rather than relative, TCP sequence numbers.



-s snaplen
    --snapshot-length=snaplen
        Snarf snaplen bytes of data from each packet rather than the default of 262144 bytes.  
        Packets truncated because of a limited snapshot are indicated in the output with ``[|proto]'',  where  proto  is
        the  name of the protocol level at which the truncation has occurred.  
        Note that taking larger snapshots both increases the amount of time it takes to process packets and, effectively, decreases  the amount  of  packet  buffering.   
        This may cause packets to be lost.  
        You should limit snaplen to the smallest number that will capture the protocol information you're interested in.  
        Setting snaplen to 0  sets it to the default of 262144, for backwards compatibility with recent older versions of tcpdump.


-w file
    Write the raw packets to file rather than parsing and printing them out.  
    They can later be  printed with the -r option.  Standard output is used if file is ``-''.

    This  output  will  be  buffered if written to a file or pipe, so a program reading from the file or
    pipe may not see packets for an arbitrary amount of time after they are received.  Use the  -U  flag
    to cause packets to be written as soon as they are received.

    The  MIME  type application/vnd.tcpdump.pcap has been registered with IANA for pcap files. The file‐
    name extension .pcap appears to be the most commonly used along with .cap and .dmp.  Tcpdump  itself
    doesn't  check  the  extension  when reading capture files and doesn't add an extension when writing
    them (it uses magic numbers in the file header instead). However, many operating systems and  appli‐
    cations will use the extension if it is present and adding one (e.g. .pcap) is recommended.

    See pcap-savefile(5) for a description of the file format.

    -w a.pcap



-n     Don't convert addresses (i.e., host addresses, port numbers, etc.) to names.

-N     Don't  print domain name qualification of host names.  E.g., if you give this flag then tcpdump will
       print ``nic'' instead of ``nic.ddn.mil''.

-c count
    Exit after receiving count packets.

host
    using host, you can see traffic that’s going to or from hostValue

src / dst
    If you only want to see traffic in one direction or the other, you can use src and dst.

net
    To find packets going to or from a particular network or subnet, use the net option.


src host 192.168.200.2 | src 192.168.200.2
dst host 192.168.200.2 | dst 192.168.200.2

tcpdump -n tcp port 53 -r 文件.pcat
tcpdump -n udp port 53 -r 文件.pcat



-x  When parsing and printing, in addition to printing  the  headers  of  each  packet,
    print the data of each packet (minus its link level header) in hex.  The smaller of
    the entire packet or snaplen bytes will be printed.  Note that this is  the  entire
    link-layer  packet,  so for link layers that pad (e.g. Ethernet), the padding bytes
    will also be printed when the higher layer packet is shorter than the required pad‐
    ding.

-xx When  parsing  and  printing,  in  addition to printing the headers of each packet,
    print the data of each packet, including its link level header, in hex.

-X  When parsing and printing, in addition to printing  the  headers  of  each  packet,
    **print the data of each packet (minus its link level header) in hex and ASCII.**  This
    is very handy for analysing new protocols.

-XX When parsing and printing, in addition to printing  the  headers  of  each  packet,
    print the data of each packet, including its link level header, in hex and ASCII.



-n     不把网络地址转换成名字；
-nn    不进行端口名称的转换。
-t 　  在输出的每一行不打印时间戳
-vv    输出详细的报文信息；
-c     在收到指定的包的数目后，tcpdump就会停止
-e     在输出行打印出数据链路层的头部信息
-r     从指定的文件中读取包(这些包一般通过-w选项产生)
-w     直接将包写入文件中，并不分析和打印出来

-X     直接解包内容

使用-A选项，则tcpdump只会显示ASCII形式的数据包内容，不会再以十六进制形式显示；

使用-XX选项，则tcpdump会从以太网部分就开始显示网络包内容，而不是仅从网络层协议开始显示。

使用-D选项，则tcpdump会列出所有可以选择的抓包对象。--list-interfaces

    tcpdump -D

-e选项的输出中，会发现有oui Unknown的字样，这oui是什么东东呢？在这里顺便科普一下咯：
OUI，即Organizationally unique identifier，是“组织唯一标识符”，在任何一块网卡（NIC）中烧录的6字节MAC地址中，前3个字节体现了OUI，其表明了NIC的制造组织。通常情况下，该标识符是唯一的。


-l 选项的作用就是将tcpdump的输出变为“行缓冲”方式，这样可以确保tcpdump遇到的内容一旦是换行符即将缓冲的内容输出到标准输出，以便于利用管道或重定向方式来进行后续处理。

    --immediate-mode
        
        Capture in "immediate mode".  In this mode, packets are delivered to tcpdump as soon as they arrive, rather than being buffered for efficiency.  
        This is the default when printing packets rather than saving packets to a ``savefile'' if the packets are being printed to a terminal rather than to a file or pipe.

众所周知，Linux/UNIX的标准I/O提供了

    全缓冲

    行缓冲

    无缓冲

三种缓冲方式。

标准错误是不带缓冲的，终端设备常为行缓冲，而其他情况默认都是全缓冲的。

大家在使用tcpdump时，有时会有这样的需求：“对于tcpdump输出的内容，提取每一行的第一个域，即”时间域”，并输出出来，为后续统计所用”，

这种场景下，我们就需要使用到-l来将默认的全缓冲变为行缓冲了。

如果不加-l选项，那么只有全缓冲区满，才会输出一次，这样不仅会导致输出是间隔不顺畅的，而且当你ctrl-c时，很可能会断到一行的半截，损坏统计数据的完整性。



做过网络流量分析的同学，或许都有一个共同的需求，那就是“流量保存”和“流量回放”，这就恰好对应了今天要讲解的-w选项和-r选项。


    “流量保存”就是把抓到的网络包能存储到磁盘上，保存下来，为后续使用。

    “流量回放”就是把历史上的某一时间段的流量，重新模拟回放出来，用于流量分析。

---

表达式中的关键字

1. 关于类型的关键字

    主要包括host(默认)，net，port

2. 确定传输方向的关键字
    
    主要包括src，dst ,dst or src(默认), dst and src

3. 协议关键字
    
    主要包括fddi,ip,arp,rarp,tcp,udp等类型，默认是监听所有协议，Fddi指明是在FDDI(分布式光纤数据接口网络)上的特定的网络协议，实际上
    它是"ether"的别名，fddi和ether具有类似的源地址和目的地址，所以可以将fddi协议包当作ether的包进行处理和分析。

4. 三种逻辑运算
    
    取非运算是 'not ' '! ';与运算是'and','&&';或运算是'or' ,'||'；

5. 除了这三种类型的关键字之外，其他重要的关键字如下：

    gateway, broadcast,less, greater,
    










## 读取抓包文件

-r file

    Read packets from file (which was created with the -w option or by other
    tools that  write  pcap  or pcap-ng files).  Standard input is used if file
    is ``-''.

-A

    Print each packet (minus its link level header) in ASCII.  Handy for capturing web pages.

-X

    When parsing and printing, in addition to printing the headers of each
    packet, print the data of each packet (minus its link level header) in hex
    and ASCII.  This is very handy for analysing new protocols.

-XX

    When parsing and printing, in addition to printing the headers of each
    packet, print the data of each packet, including its link level header, in
    hex and ASCII.







tcpdump -i ens18 -n -s 0 -w test.pcap      全部的流量

tcpdump -i ens18 -n -s 1 port 22 -w test.pcap

tcpdump -A -r test.pcap

tcpdump -A -n 'tcp[13]=24' -r http.cap
tcp报文 flags 为24(push + ack)






组播地址：239.255.255.250是SSDP(简单服务发现协议)，这是路由器的UPNP服务使用的协议。





表达式

    而在单个过滤器里，常常会判断一条件是否成立，这时候，就要使用下面两个符号

    =：判断二者相等
    ==：判断二者相等
    !=：判断二者不相等
    当你使用这两个符号时，tcpdump 还提供了一些关键字的接口来方便我们进行判断，比如

    if：表示网卡接口名、
    proc：表示进程名
    pid：表示进程 id
    svc：表示 service class
    dir：表示方向，in 和 out
    eproc：表示 effective process name
    epid：表示 effective process ID
    比如我现在要过滤来自进程名为 nc 发出的流经 en0 网卡的数据包，或者不流经 en0 的入方向数据包，可以这样子写

    $ tcpdump "( if=en0 and proc =nc  ) || (if != en0 and dir=in)"






    https://baijiahao.baidu.com/s?id=1671144485218215170&wfr=spider&for=pc

    可以通过手册页来详细阅读 #man  pcap-filter

    你会发现，过滤表达式大体可以分成三种过滤条件，“类型”、“方向”和“协议”，这三种条件的搭配组合就构成了我们的过滤表达式。

    根据 tcpflags 进行过滤

    tcpdump 'tcp[tcpflags] & tcp-syn != 0 and not dst host qiyi.com'
    tcpdump 'ip[2:2] > 576'
    tcpdump 'ether[0] & 1 = 0 and ip[16] >= 224'

    即 proto [expr : size]语法

    expr用来指定数据报偏移量，表示从某个协议的数据报的第多少位开始提取内容，默认的起始位置是0；而size表示从偏移量的位置开始提取多少个字节，可以设置为1、2、4。

    如果只设置了expr，而没有设置size，则默认提取1个字节。比如ip[2:2]，就表示提取出第3、4个字节；而ip[0]则表示提取ip协议头的第一个字节。

    在我们提取了特定内容之后，我们就需要设置我们的过滤条件了，我们可用的“比较操作符”包括：>，<，>=，<=，=，!=，总共有6个。

    ip[0] & 0xf != 5

    IP协议的第0-4位，表示IP版本号，可以是IPv4（值为0100）或者IPv6（0110）；第5-8位表示首部长度，单位是“4字节”，如果首部长度为默认的20字节的话，此值应为5，即”0101″。

    ip[0]则是取这两个域的合体。0xf中的0x表示十六进制，f是十六进制数，转换成8位的二进制数是“0000 1111”。而5是一个十进制数，它转换成8位二进制数为”0000 0101″。

    有了上面这些分析，大家应该可以很清楚的知道，这个语句中!=的左侧部分就是提取IP包首部长度域，如果首部长度不等于5，就满足过滤条件。言下之意也就是说，要求IP包的首部中含有可选字段。
    大家可能已经有所体会，在写过滤表达式时，你需要把协议格式完全背在脑子里，才能把表达式写对。可这对大多数人来说，可能有些困难。为了让tcpdump工具更人性化一些，有一些常用的偏移量，可以通过一些名称来代替，比如icmptype表示ICMP协议的类型域、icmpcode表示ICMP的code域，tcpflags则表示TCP协议的标志字段域。
    更进一步的，对于ICMP的类型域，可以用这些名称具体指代：icmp-echoreply, icmp-unreach, icmp-sourcequench, icmp-redirect, icmp-echo, icmp-routeradvert, icmp-routersolicit, icmp-timxceed, icmp-paramprob, icmp-tstamp, icmp-tstampreply, icmp-ireq, icmp-ireqreply, icmp-maskreq, icmp-maskreply。
    而对于TCP协议的标志字段域，则可以细分为tcp-fin, tcp-syn, tcp-rst, tcp-push, tcp-ack, tcp-urg。
    如果一个过滤表达式有多个过滤条件，那么就需要使用逻辑符了，其中，!或not都可以表示“否定”，&&与and都可以表示“与”，而||与or都可以表示“或”。
