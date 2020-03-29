ICMP (ping, trace)is a layer 3 protocol suite within the TCP/IP suite, doesnt test any layer 4 or above functions, therefore, it has no TCP/UDP layer 4 port number. The sub protocols within it do. 

You can block echo replies by closing port 7. That is how you get to be not pinged on the net.

TCP and UDP have an Echo Service on Port 7, sometimes called TCP-Ping/UDP-Ping, but they have nothing to do with ICMP


Destination Unreachable messages are generated for several reasons, including unable to reach a network, a host, a port, or a protocol.

 Only one process at a time can bind to TCP port 12345, but one process can bind to TCP port 12345 at the same time another process binds to UDP port 12345



The echo protocol (RFC862) is used for measuring roundtrip times and stuff alike. Traditionally inetd has been responsible for implementing echo functionality, but iirc sfos doesn't have inetd. Anyhow, the protocol itself is quite obsolete and has been superseded by icmp echo.


## port 7

https://en.wikipedia.org/wiki/Echo_Protocol


A host may connect to a server that supports the Echo Protocol using the Transmission Control Protocol (TCP) or the User Datagram Protocol (UDP) on the well-known port number 7. The server sends back an identical copy of the data it received.

How to enable echo service for tcp or udp on well-known port 7

On UNIX-like operating systems an echo server is built into the inetd family of daemons. The echo service is usually not enabled by default. It may be enabled by adding the following lines to the file /etc/inetd.conf and telling inetd to reload its configuration

```
echo   stream  tcp     nowait  root    internal
echo   dgram   udp     wait    root    internal
```

service inetd restart

'Ctrl' +  ' ] ' 一起按退出



## List of TCP and UDP port numbers
https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers
列举了差不多所有的 well-known ports



由于 Internet 协议本身的缺陷,IP包中包括的源地址是可以伪装的


ping 

    -M
        prohibit [prˈhɪbɪt] 禁止

        pmtudisc

        **路径MTU发现**是用来确定到达目的地的路径中最大传输单元(MTU)的大小。
        通过在IP报头中设置不分片DF(Don't Fragment)标志来探测路径中的MTU值, 如果路径中设备的MTU值小于此报文长度，并且发现DF标志，就会发回一个Internet控制消息协议(ICMP)(类型3、代码4需要分片的消息ICMP_FRAG_NEEDED)，消息中包含它可接受的MTU值。

        IP_PMTUDISC_DONT策略表示从不设置DF位，即不进行PMTU发现

        pmtudisc_option may be either 
            1. do (prohibit fragmentation, even local one), 

            1. want (do PMTU discovery, fragment locally when packet size is large), 
                表示允许PMTU发现， 当包很大的时候在本机就做IP分片

            1. dont (do not set DF flag).
                表示强制不阻止分片


        ping -c 2 -s 1500 -M do z.cn
        
        ping -c 2 -s 1472 -M do z.cn
            MTU:            1500
            IP Header:      20
            ICMP Header:    8
            Data Max:       1472


        DF的默认值，如果 -s <= 1472 则不分片, 否则进行分片
        如果设置 -M do 则强制不分片
        如果设置 -M dont 

    -s packetsize
        Specifies the number of data bytes to be sent. The default is 56, which translates into 64 ICMP data bytes
        when combined with the 8 bytes of ICMP header data.

        是icmp data 的大小，不包含Icmp头部、ip头部 



