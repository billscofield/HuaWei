## 通过路由器连接的两个网络

端系统      end system
中间系统    intermediate system

## 大多知名端口为奇数的由来

这是有历史原因的，因为这些端口号都是从 NCP 端口号派生出来的(NCP,即网络控制协议，是 ARPNET 的运输层协议，是 TCP 的前身). 
NCP 是单工的，因此每个应用程序需要两个连接，需要预留一对奇数和偶数端口号。
当TCP 和 UDP 称为标准的运输层协议时，每个应用程序只需要一个端口号，因此就是用了 NCP 中的奇数.


广播和组播会发给环回口


《TCP/IP 视频讲解 计算机网络》    38 分钟 ，环回口的妙用


路径MTU，这个路径方向上最小的那个MTU, PMTU


arp 的情况
    直连网络还是非直连网络
    直连网络，直接发arp 主机请求
    非直连，arp 下一条(网关) arp 请求


ICMP 报文通常被 IP 层或更高层协议（TCP,UDP）使用

## ICMP 返回 IP Header + 8 Bytes TCP/UDP Header

https://docs.appneta.com/diagnostics/message-2.html

一台主机的可达性可能不只取决于IP层是否可达，还取决于使用何种协议以及端口号

The IP header plus the first 8 bytes of the original packet's data is returned to the sender


Unix 系统在实现 ping 程序时是把 ICMP 报文中的 Identifier(标识符) 字段设置成发送进程的 ID(进程) 号.
这样即使在同一台主机上同时运行了多个 ping 程序实例, ping 程序也可以识别出返回的信息

windows 下，不管开多少个窗口, ping 的 identifier 都是相同的，而且每增加一个出去的 ping 包，序列号增加 256


```
Identifier (BE)
Identifier (LE)
Sequence (BE)
Sequence (LE)
```

wireshark考虑到window系统与Linux系统发出的ping报文（主要指ping应用字段而非包含IP头的ping包）的字节顺序不一样（windows为LE：little-endian byte order，Linux为BE：big-endian），别分告诉信息，其本质内容是没有不变的，只是表达形式不同。




并不是所有的路由器都支持 Source and Record Route 功能


## traceroute 原理

它发送一份 TTL字段为1的IP数据报给目的主机。处理这份数据报的第一个路由器将 TTL值减 1,丢弃该数据报,并发回一份超时I C M P报文。这样就得到了该路径中的第一个路由器的地址。
然后 Traceroute 程序发送一份T T L值为2的数据报,这样我们就可以得到第二个路由器的地址。继续这个过程直至该数据报到达目的主机。但是目的主机哪怕接收到 TTL 值为1的I P数据报,
也不会丢弃该数据报并产生一份超时 I C M P报文,这是因为数据报已经到达其最终目的地。那么我们该如何判断是否已经到达目的主机了呢?

Traceroute程序发送一份 UDP 数据报给目的主机,但它选择一个不可能的值作为 UDP 端口号(大于 30 000),使目的主机的任何一个应用程序都不可能使用该端口。因为,当该数据报到达时,
将使目的主机的 UDP 模块产生一份“端口不可达”错误的 ICMP 报文。这样, Traceroute 程序所要做的就是区分接收到的 ICMP 报文是超时还是端口不可达,以判断什么时候结束。



## DSCP 差分服务代码点（Differentiated Services Code Point）

加速转发（EF）  101110(46)     101100(44)

                                ------------------------>优先级大

类选择器Class Selector（CS）    class1      class2      class3      class4  优先级大
LowDrop                         001010      010010      011010      100010      |
Mediumdrop                      001100      010100      011100      100100      |
HighDrop                        001110      010110      011110      100110      |


尽力服务（DF） 000000

前3bit为优先级位，越大优先级越高
随后2bit为丢弃位，越大优先级越低
第5bit恒为零

例如
AF：XY  X(取值为1,2,3,4)，Y(取值为1,2,3)，共可标记12类，
AF：41优先级大于AF：42，
AF：11优先级小于AF：23。
