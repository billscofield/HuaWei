之前是ipfwadm

iptables 是 linux 2.4 2.6 内核中集成的服务

iptables 主要工作在 OSI 的234，也可以工作在7层

iptables -nvL

-L, --list [chain]

    List  all  rules  in the selected chain.  If no chain is selected, all
    chains are listed. Like every other iptables command, it applies to the
    specified table (filter is the default), so

-n, --numeric

    Numeric  output. IP addresses and port numbers will be printed in numeric
    format.

-v, --verbose

    Verbose output.  This option makes the list command show the interface name,
    the rule options (if any), and the TOS masks.  The  packet  and byte
    counters are also listed, with the suffix 'K', 'M' or 'G' for 1000, 1,000,
    000 and 1,000,000,000 multipliers respectively

4表5链

表(tables)
    raw
    mangle
    nat
    filter

链(chains), 关卡
    PREROUTING
    INPUT
    FORWARD
    OUTPUT
    POSTROUTING

表是链的容器

链是规则(policy)的容器


    |       +---------------------+
    |       |            用户空间 |
    |       | +-----------------+ |
    |       | | web服务         | |
    |       | +-----------------+ |
    |       |     |          |    |
    |       +---------------------+
    |       |     |          |    |
    |       | +-------+ +-------+ |
    |       | | INPUT | | OUTPUT| |
    |       | +-------+ +-------+ |
    |       |     |          |    |
    |       +---------------------+
    |       +---------------------+
    |       | 网卡                |
    |       +---------------------+
    |             |          |          +--------+
    |             |          +----------|        |
    |             +---------------------| client |
    |                                   +--------+


    |       +------------------------------------------------------------+
    |       |            用户空间                                        |
    |       | +-------------------------------------------------------+  |
    |       | | web服务                                               |  |
    |       | +-------------------------------------------------------+  |
    |       |                   |                                  |     |
    |       +------------------------------------------------------------+
    |       |                  /|\                                \|/    |
    |       |               +-------+                         +-------+  |
    |       |               | INPUT |                         | OUTPUT|  |
    |       |               +-------+                         +-------+  |
    |       |                  /|\                                \|/    |
    |       |                   |是                                |     |
    |       | +----------+      |              +-------+   +-----------+ |
    |       | |prerouting|->-是否为本机--否--> |forward|->-|postrouting|-|--->转发至其他主机
    |       | +----------+                     +-------+   +-----------+ |
    |       |    /|\                                           \|/       |
    |       +------------------------------------------------------------+
    |             |                                             |
    |       +------------------------------------------------------------+
    |       | 网卡                                                       |
    |       +------------------------------------------------------------+
    |             |                                             |          +--------+
    |             |                                             +----------|        |
    |             +--------------------------------------------------------| client |
    |                                                                      +--------+

根据上图，我们能够想象出某些常用场景中，报文的流向：

到本机某进程的报文：PREROUTING –> INPUT

由本机转发的报文：PREROUTING –> FORWARD –> POSTROUTING

由本机的某进程发出报文（通常为响应报文）：OUTPUT –> POSTROUTING


## 链的概念

现在，我们想象一下，这些”关卡”在iptables中为什么被称作”链”呢？我们知道，防火墙
的作用就在于对经过的报文匹配”规则”，然后执行对应的”动作”,所以，当报文经过这些关
卡的时候，则必须匹配这个关卡上的规则，但是，这个关卡上可能不止有一条规则，而是
有很多条规则，当我们把这些规则串到一个链条上的时候，就形成了”链”,所以，我们把每
一个”关卡”想象成如下图中的模样  ，这样来说，把他们称为”链”更为合适，每个经过这
个”关卡”的报文，都要将这条”链”上的所有规则匹配一遍，如果有符合条件的规则，则执
行规则对应的动作.

    +------------+  +-------+   +--------+    +---------+   +-------------+
    | prerouting |  | input |   | output |    | forward |   | postrouting |
    +------------+  +-------+   +--------+    +---------+   +-------------+
          |
        rule1

##表的概念

我们再想想另外一个问题，我们对每个”链”上都放置了一串规则，但是这些规则有些很相
似，比如，A类规则都是对IP或者端口的过滤，B类规则是修改报文，那么这个时候，我们
是不是能把实现相同功能的规则放在一起呢，必须能的。


我们把具有相同功能的规则的集合叫做”表”，所以说，不同功能的规则，我们可以放置在
不同的表中进行管理，而iptables已经为我们定义了4种表，每种表对应了不同的功能，而
我们定义的规则也都逃脱不了这4种功能的范围，所以，学习iptables之前，我们必须先搞
明白每种表 的作用。

iptables为我们提供了如下规则的分类，或者说，iptables为我们提供了如下”表”

    filter表：负责过滤功能，防火墙；内核模块：iptables_filter

    nat表：network address translation，网络地址转换功能；内核模块：iptable_nat

    mangle表：拆解报文，做出修改，并重新封装 的功能；iptable_mangle

    raw表：关闭nat表上启用的连接追踪机制；iptable_raw

也就是说，我们自定义的所有规则，都是这四种分类中的规则，或者说，所有规则都存在
于这4张”表”中。

每个”链”中的规则都存在于哪些”表”中。

    PREROUTING      的规则可以存在于：raw表     mangle表    nat表。

    INPUT           的规则可以存在于：mangle表  filter表，（centos7中还有nat表，centos6中没有）。

    FORWARD         的规则可以存在于：mangle表  filter表。

    OUTPUT          的规则可以存在于：raw表     mangle表    nat表   filter表。

    POSTROUTING     的规则可以存在于：mangle表  nat表。

## iptables-save

iptables-save — dump iptables rules

ip6tables-save — dump iptables rules

