1. ping
    -I interface
    -i interval
        The default is to wait for one second between each packet normally, or
        not to wait in flood mode. Only super-user may set interval to values
        less than 0.2 seconds.

    -c count
    -W timeout
    -s packetsize
        Specifies the number of data bytes to be sent. The default is 56, which
        translates into 64 ICMP data bytes when combined with the 8 bytes of
        ICMP header data.

        icmp 8Bytes
        ip   20Bytes

        size = mtu - 20 - 8


    -t ttl
    -T timestamp

2. traceroute
    都是网关ip
    发3次

    -n      Do not try to map IP addresses to host names when displaying them.
    -i      interface
    -t      tos

3. mtr
    
    mtr-tiny 是命令行的, 运行时还是执行 mtr
    mtr 是窗口的

    apt install mtr-tiny

    INTERACTIVE CONTROL
        mtr can be controlled while it is running with the following keys:
          ?|h     help
          p       pause (SPACE to resume)
          d       switching display mode
          e       toggle MPLS information on/off
          n       toggle DNS on/off
          r       reset all counters
          o str   set the columns to display, default str='LRS N BAWV'
          j       toggle latency(LS NABWV)/jitter(DR AGJMXI) stats
          c <n>   report cycle n, default n=infinite
          i <n>   set the ping interval to n seconds, default n=1
          f <n>   set the initial time-to-live(ttl), default n=1
          m <n>   set the max time-to-live, default n= # of hops
          s <n>   set the packet size to n or random(n<0)
          b <c>   set ping bit pattern to c(0..255) or random(c<0)
          Q <t>   set ping packet's TOS to t
          u       switch between ICMP ECHO and UDP datagrams
          y       switching IP info
          z       toggle ASN info on/off
          q       exit



4. nslookup

    -type=mx
         =any

5. dig
    
    dig -t mx

    dig -t any

    dig +trace 
        域名流程追踪

    dig @dnsserver baidu.com

6. telnet
    
    telnet xxx 80

# iproute2

net-tools   iproute2

## ip

ip - show / manipulate routing, network devices, interfaces and tunnels

ip [ OPTIONS  ] OBJECT { COMMAND | help  }

OBJECT := { link | address | addrlabel | route | rule | neigh | ntable | tunnel | tuntap | maddress | mroute | mrule | monitor | xfrm | netns |
       l2tp | tcp_metrics | token | macsec | vrf | mptcp }

OPTIONS := { -V[ersion] | -h[uman-readable] | -s[tatistics] | -d[etails] | -r[esolve] | -iec | -f[amily] { inet | inet6 | link  } | -4 | -6 | -I |
        -D | -B | -0 | -l[oops] { maximum-addr-flush-attempts  } | -o[neline] | -rc[vbuf] [size] | -t[imestamp] | -ts[hort] | -n[etns] name |
        -N[umeric] | -a[ll] | -c[olor] | -br[ief] | -j[son] | -p[retty] }






## 策略路由

### 1. 查看策略数据库

    ip rule show

        0:	from all lookup local
        32766:	from all lookup main
        32767:	from all lookup default

### 2. 添加规则

必须先确定好“条件”、“优先级别”及“路由表ID”，此后才可以执行添加规则的操作。

1. 条件

    条件是用来决定哪类数据包可以符合这项规则，而可用来匹配的字段为Source IP、
    Destination IP、Type of Service、fwmark及dev等

    1. Source IP

        根据来源端IP来决定数据包参考哪个路由表发送出去。以下两个示例分别指出，
        如果数据包的来源端IP是192.168.1.10，就参考路由表10；
        如果来源端IP为192.168.2.0/24网段的IP，就参考路由表20。

        ```
        ip rule add from 192.168.1.10   table 10 
        ip rule add from 192.168.2.0/24 table 20
        ```

    2. Destination IP
        
        根据目的端IP来决定数据包参考哪个路由表发送出去。以下两个示例分别指出，
        如果目的端IP是168.95.1.1，就参考路由表10；
        如果目的端IP是168.95.0.0/24网段的IP，就参考路由表20。

        ```
        ip rule add to 168.95.1.1    table 10
        ip rule add to 168.95.0.0/24 table 20
        ```

    3. fwmark

        将fwmark作为匹配条件时，必须搭配Netfilter一起使用， 这看起来很麻烦， 却
        是最灵活的匹配条件。如图所示，某公司对外有三条ADSL，我们希望
            所有HTTP协议经由第一条ADS L
            SMTP及POP3经由第二条ADSL
            其余流量则经由第三条ADSL
        可以使用如下的命令组合来达到这样的目的：

        |   +-------------------+
        |   |       ISP         |
        |   +-------------------+
        |      |      |       |
        |     1|     2|      3|
        |      |      |       |
        |   +-------------------+
        |   |eth0   eth1    eth2|
        |   |                   |
        |   |       eth3        |
        |   +-------------------+
        |             |        
        |             |        

        ```
        iptables -t mangle -A FORWARD -i eth3 -p tcp --dport 80 -j MARK --set-mark 1
        iptables -t mangle -A FORWARD -i eth3 -p tcp --dport 25 -j MARK --set-mark 2
        iptables -t mangle -A FORWARD -i eth3 -p tcp --dport 110 -j MARK --set-mark 2
        iptables -t mangle -A FORWARD -i eth3 -j MARK -set-mark 3
        
        ip rule add fwmark 1 table 1
        ip rule add fwmark 2 table 2
        ip rule add fwmark 3 table 3
        ```
    4. dev

        最后，还可以使用数据包输入的接口来作为判断依据，如图所示，我们希望
        凡是由eth2接口送入的数据包都由eth0接口转发出去，由eth3接口送入的数据包
        都由eth1接口转发出去。以下命令组合将能满足我们的要求：

        
        |           |
        |   +-----------------+
        |   |      eth0       |
        |   |                 |
        |---|eth1         eth2|---
        |   |                 |
        |   |      eth3       |
        |   +-----------------+
        |           |

        ```
        ip rule add dev eth2 table 1
        ip rule add dev eth3 table 3
        ```

### 3. 优先级别

我们执行ip rule show命令所显示内容的第一个字段就是优先级别，数字越小，代表优先
级别越高

默认优先级别0、32766及32767已被占用，因此，在添加规则时，如果没有特别设置优先级
别，那么，优先级别默认会从32766开始递减

如果我们需要特别设置优先级别，可以在ip rule add命令的最后加上prio XXX参数

```
ip rule show

0:	from all lookup local
32766:	from all lookup main
32767:	from all lookup default

ip rule add from 192.168.1.0/24 table 1 prio 10
ip rule add from 192.168.2.0/24 table 2 prio 20


ip rule show

0:	from all lookup local
10:	from 192.168.1.0/24 lookup 1
20:	from 192.168.2.0/24 lookup 2
32766:	from all lookup main
32767:	from all lookup default
```

路由表ID

    在Linux的基于策略的路由中，路由表用ID来表示，但如有必要，还可以用ID与名称对照表
    将ID转换成名称。

### 4. 删除规则

可以分别使用“优先级别”、“条件”及“路由表”当中任何一个唯一的值来设置所需删除的规则

ip rule del prio 10

ip rule del from 192.168.1.0/24

ip rule del table 1

ip rule del from 192.168.1.0/24 table 1 prio 10

## 2. 路由表管理

由于route -n命令已经完全不适合在基于策略的路由使用，因此，route命令仅能操作一个
特定的路由表，但在基于策略的路由中，会同时存在多个路由表，请放弃这个路由管理工
具，取而代之的依然是ip命令。接下来将讨论如何使用ip命令来管理路由表。

Linux最多可以支持255张路由表，其中有3张表是内置的


### 1. 查看路由表内容

ip route show

ip route show table main

```
            网关
default via 192.168.61.1 dev enp2s0 
172.17.0.0/16 dev docker0 proto kernel scope link src 172.17.0.1 linkdown 
192.168.61.0/24 dev enp2s0 proto kernel scope link src 192.168.61.103 
                                                        本机网卡的IP地址
```

|  src1 +------------+              +----
|net1 --| eth0       |         via  |
|       |        eth2|---------网关-|
|net2 --| eth1       |              |
|  src2 +------------+              +----


在默认情况下，系统有三个路由表，这三个路由表的功能如下：

    1. local：路由表local包含本机路由及广播信息。例如，在本机上执行ssh
       127.0.0.1时，就会参考这份路由表的内容，在正常情况下，只要配置好网卡的网
       络设置，就会自动生成local路由表的内容，我们应该也不必修改其内容。
       
       本地接口地址，广播地址，已及NAT地址都放在这个表。
       
       该路由表由系统自动维护，管理员不能直接修改。

    2. main：使用传统命令route -n所看到的路由表就是main的内容。Linux系统在默认
       情况下使用这份路由表的内容来传输数据包，因此，其内容极为重要，在正常情况
       下，只要配置好网卡的网络设置，就会自动生成main路由表的内容。

    3. default：最后是default路由表，这个路由表在默认情况下内容为空；除非有特别
       的要求，否则保持其内容为空即可。



### 2. 添加路由

ip route show table main
ip route add 192.168.1.0/24 via 10.10.15.50 table main
ip route show table main



单纯添加路由表并无意义，因为新增出来的路由表，系统默认是不会去使用的，如果要将
路由添加到main以外的路由表，只有先添加“规则”才能确定新的路由表名称(Table ID)，
有了新的路由表之后，才会把路由添加到新的路由表中。

1. 首先使用ip rule show.来查询RPDB的当前状态，可以看到目前只有三条默认规则，

2. 使用ip rule add命令来添加一条规则.此时系统内就多了一个有用的路由表，其路由表ID为10

        ip rule add from 192.168.1.0/24 table 10

    我们可以立即使用ip route show命令来查看这个新的路由表，其内容默认为空

        ip route show table 10

    接着可以在这个新路由表中添加路由，在此使用iproute add命令来添加路由，我们决
    定凡是来自于192.168.1.0/24网段的数据包，都从eth1接口将数据包送离本机，因此，
    必须完整编写eth1接口的路由。

        ip route add 192.168.1.0/24 dev eth1 table 10
        ip route add default via 192.168.1.254 table 10

        ip rotue add 172.16.0.0/16  dev eth2

### 3. 删除路由

可以使用ip命令来方便地删除路由，我们使用以下示例来说明如何删除路由。

1. 首先将路由表10的内容显示出来.，可以看到路由表10中当前有两条路由，

    ip route show table 10

2. 接着使用ip route del命令删除默认路由，在此别忘了指定我们所要删除的是路由表
   10，否则默认会删除路由表main的默认路由，

    ip route del default table 10

3. 接着再使用ip route show 命令查看路由表10，此时路由表10的默认路由已经不存在了

4. 再次使用ip route del命令删除192.168.122.0/24的路由.，最后可以看到路由表10中
   已经没有任何路由了。

    ip route del 192.168.1.0/24 table 10


