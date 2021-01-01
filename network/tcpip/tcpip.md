## 

B/S架构, 实际是C/S架构的泛化、特例, 将客户端泛化，中心还是 Server

应用程序通常是进程，下三层是在内核实现


UDP:
    TFTP
    DNS

TCP:
    FTP



## 会话层

拿QQ来举例，QQ软件有一个端口号，但是不同人之间的会话是隔离的

一个端口有很多会话; 一个大对数有很多芯



## IP 是不可靠的

tcp 相当于卖家，ip 相当于物流，顾客收到货物后才会付款，但是 IP(物流) 不一定能送到


## ping -s 最大值

1500 MTU   数据链路层的一个帧, 所以包含各种头部+数据

一个数据链路层帧最大值是 1500Bytes

ip header 是 20Bytes

icmp header 是 8Bytes

1500 - 20 - 8 = 1472 Bytes

所以 ping -s 最大值是 1472 


最基本的协议号、端口号

1. 以太网协议号(在数据链路层中表明)
    IPv4    : 0x0800
    IPv6    : 
    ARP     : 0x0806
    PPPOE   : 0x8863 0x8864

1. IP协议号(在网络层中表示)
    ICMP: 1
    TCP : 6
    UDP : 17
    GRE : 47
    ESP : 50
    AH  : 51

1. 端口号(在传输层表示)
    FTP     : 20(Data) 21(control)
    SSH     : 22
    SFTP    : 22
    Telnet  : 23
    SMTP    : 25
    POP3    : 110
     IMAP   : 143
    TACACS+ : 49
    HTTP    : 80
    HTTPS   : 443
    IKE     : 500
    Radius  : 1645 1646 1812 1813

    well-known ports: from 0 through 1023



                    +---+    +---+
                    |TCP|    |UDP|
                    +---+    +---+
    +----+  +----+    |        |
    |ICMP|  |IGMP|    |        |
    +----+  +----+    |        |
     |        |       |        |
      \       |       |       /
       \      |       |      /
        \     |       |     /
         \    |       |    /
          \   |       |   /
           \  |       |  /
         +----------------+   +---+   +----+
         |      IP        |   |ARP|   |RARP|
         +----------------+   +---+   +----+
                        |       |       / 
                         \      |      /
                          \     |     /
                           \    |    /
                            \   |   /
                           +---------+ 
                           | 以太网  |
                           +---------+ 


### 路由跟踪 

linux
    ping -R <目标>

Cisco 路由器
    ping 
    根据提示进行设置



## telnet route-server.ip.att.net

用户名: rviews
密  码: rviews

查看全球 IP 路由信息
