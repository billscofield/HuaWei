# iptables

工作于主机或网络的边界,对于进出主机或网络的的报文根据实现制定的规则进行检查匹配，对匹配到的报文进行相应处理的软件或硬件组件

    主机防火墙

    网络防火墙

        forward (/proc/sys/net/ipv4/ip_forward)


在内核空间中 TCP/IP 协议栈中得以实现

一个网卡可以配多个ip

selinux (生产中也是关闭的)，ids(入侵检测,然后交给防火墙)
    IDS 入侵检测，比如web服务器，应该只会去访问某个目录下的文件，结果他去访问别的文件或目录了，IDS 就发出报警，触发 Firewall
        相当于摄像头,在关键位置进行部署,具有滞后性
        HIDS host IDS
        NIDS network IDS
    钓鱼执法，蜜罐honeypot
IPS

iptables(生产中看情况，内网关闭，外网打开)
    大并发的情况，不能开iptables,影响性能，适用硬件防火墙

安全优化
    1. 尽可能不给服务器配置外网IP，可以通过代理转发
    1. 并发不是特别大的情况下在外网IP的环境，开启防火墙

/var/log/messages 出现kernel:nf_conntrack:table full, dropping packet 解决方案
    net.nf_conntrack_max=25000000
    https://www.bilibili.com/video/av45141902?from=search&seid=17505376879493340828


iptables 是基于内核的防火墙，配置完直接生效

netfilter/iptables
    netfilter是Linux内核的功能
    linux 2.4,2.6内核中集成的服务
    基于包过滤的防火墙
    前一代技术是 ipfwadm, ipchains 
    iptables 主要工作在OSI七层的2,3,4层
    iptables 也可以支持7层控制（但suqid代理+iptables 比较好)


## 相关概念

1. 容器：包含与属于的
1. Netfilter/iptables 是表的容器，iptables 包含的各个表
    raw
    mangle
    NAT(常用)
    filter(default)(常用)


1. iptables的表又是链的容器
    链(chains)
        prerouting
        forward
        input
        output
        postrouting

1. 链是规则的容器
1. 规则(policy)
    一条条过滤语句

所有链都要大写

防火墙的日志是 IDS,IPS等高级安全设备的基础

在网络中的位置
    网络边界

网络过滤的分解步骤
    获取
        嗅探
        正常请求
    识别
        协议头
        具体内容
    过滤
        丢弃
        修改
        放过
        记录日志

4表5链

内置的4张表
    1. raw
        1. nat的补充，关闭nat表上启用的**连接追踪机制**
        1. prerouting
        1. output
        1. 状态跟踪,

    1. mangle
        1. 拆解报文，做出修改，封装报文
        1. 用在修改数据包内容上，用来做流量整形的，给数据包打个标识，比如 TTL+1 默认的规则链有: 
            1. prerouting
            1. forward
            1. postrouting
            1. input
            1. output
    1. nat
        1. 
            1. prerouting
            1. postrouting
            1. output

    1. filter
        1. 负责过滤数据包，防火墙的主体职责
            1. input
            1. output
            1. forward

表 -> 链 -> 规则


表名不写默认是 filter, 链名不写默认全部


5个钩子
hooks function
iptables 规定钩子上的规则

iptable 运行在内核中的规则，

prerouting
    在路由选择前，是forward还是input
    
forward
input
output
postrouting





Netfilter/IPTable
    filter
        LOCAL_IN
        LOCAL_OUT
        FORWARD
    NAT
        PRE_ROUTING
        LOCAL_OUT
        LOCAL_IN
        POST_ROUTING
    mangle
        ALL HOOKS
    conntrack
        PRE_ROUTING
        LOCAL_OUT
        LOCAL_IN
        POST_ROUTING


表间的优先顺序
    raw > mangle > nat > filter

链上规则的次序，即为检查的次序，
    1. 同类规则(访问同一应用)，匹配范围小的放上面
    1. 不同类规则（访问不同应用）,使用频率大的放上面
    1. 合并相同的规则
    1. 默认策略
        1. 白名单
        1. 黑名单

规则
    1. 匹配条件
    1. 


默认只能是 ACCEPT 或 DROP， 不能是其他


## Options

-t --table

-A --append chain rule-specification

-C --check chain rule-specification

-D --delete chain 
    1. rule-specification
    1. rulenum

-E --rename-chain old-chain new-chain

-I --insert chain [rulenum] rule-specification

    iptables -t filter -I input 2 -p tcp --dport 22 -j DROP

-N --new-chain chain

-P --policy chain target

-R --replace chain rulenum rule-specification

-S --list-rules [chain]

---

-L --list [chain]

-n, --numeric
    Numeric output.  IP addresses and port numbers will be printed in numeric format.  By default, the program will try to display them 
    as host names, network names, or services (whenever applicable).

--line-numbers
    When listing rules, add line numbers to the beginning of each rule, corresponding to that rule's position in the chain.



---

-F --flush [chain]
    Flush the selected chain (all the chains in the table if none is given).  This is equivalent to deleting all the rules one by one.


-X --delete-chain [chain]
    Delete  the optional user-defined chain specified.  There must be no references to the chain.  
    If there are, you must delete or replace the referring rules before the chain can be deleted.  The chain must be empty,
    i.e. not contain any rules.  If no argument is given, it will attempt to delete every non-builtin chain in the table.


-Z --zero [chain [rulenum]]
   Zero the packet and byte counters in all chains, or only the given chain, or only the given rule in a chain. 
    It is legal to specify the -L, --list (list) option as well, to see the counters immediately before  they
    are cleared. (See above.)




netfilter控制点
                    路由决策
    preroutint    [routing-decision]  forward     postroutint

                    input                       output





iptables -t filter(default)


## -j 

ACCEPT
DROP
REJECT
LOG
SNAT
DNAT
REDIRECT




## 匹配

### 通用匹配

协议: -p
地址: -s  -d
接口: -i  -o

    iptables -A FORWARD -p !icmp -j ACCEPT

### 隐含匹配

端口匹配: --sport   --dport
ICMP类型: --icmp_type echo_request
        : --icmp_type echo_reply


### 显式匹配

-m multiport 1,2,3,4,5 -j DROP

-m state --state NEW,ESTABLISHED,RELATED
    NEW
    ESTABLISHED



## Examples

许本地计算机上的流量。这意味着接受服务器生成并发送给自己的流量。这允许服务相互交谈而不会被阻止:

    sudo iptables -A INPUT -i lo -j ACCEPT

允许所有已建立的连接和与已建立的连接相关的流量

    iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

 iptables -A INPUT -p tcp --dport 80 -j ACCEPT
 iptables -A INPUT -j DROP

 键入以下内容查看您的规则:

 sudo iptables -S

    -P INPUT ACCEPT
    -P FORWARD ACCEPT
    -P OUTPUT ACCEPT
    -A INPUT -s 10.0.45.4/32 -j ACCEPT
    -A INPUT -s 10.0.0.233/32 -j ACCEPT
    -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
    -A INPUT -p tcp -m tcp --dport 22 -j REJECT --reject-with icmp-port-unreachable
    -A INPUT -p icmp -j ACCEPT
    -A INPUT -i lo -j ACCEPT
    -A INPUT -j REJECT --reject-with icmp-host-prohibited
    -A FORWARD -j REJECT --reject-with icmp-host-prohibited


--list-rules -S [chain [rulenum]]
    Print the rules in a chain or all chains

--flush   -F [chain]          Delete all rules in  chain or all chains


--list-rules -S [chain [rulenum]]
    Print the rules in a chain or all chains

--flush   -F [chain]          Delete all rules in  chain or all chains




## 路由器

masquerade 伪装

    iptables -t nat -A POSTROUTING -o <external_interface> -j MASQUERADE

    iptables -t nat -A POSTROUTING -s '192.168.3.0/24' -o ppp0 -j MASQUERADE

- -t nat: Specifies the NAT table, where the MASQUERADE target is located.

- -A POSTROUTING: Appends the rule to the end of the POSTROUTING chain, which is executed after routing the packet.

- -s using the MASQUERADE target in the NAT table to perform Network Address
  Translation (NAT) for outgoing packets **from a specific source IP range**
  (192.168.1.0/24) destined for the internet via the specified external
  interface.

- -o <external_interface>: Specifies the outgoing network interface that connects to the internet.

- -j MASQUERADE: Specifies the target action, which is MASQUERADE in this case.

This rule tells iptables to perform IP masquerading on packets going out
through the specified <external_interface>, which is usually the interface
connected to the internet. By using MASQUERADE, all the outgoing packets from
devices on the local network will appear to come from the public IP address of
the external interface, allowing them to communicate with internet services and
receive responses back from the internet.

iptables -t nat -nL
