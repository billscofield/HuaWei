
## 1. 相关概念

流量控制的一个基本概念是队列(Qdisc)，每个网卡都与一个队列(Qdisc)相联系， 每当内
核需要将报文分组从网卡发送出去， 都会首先将该报文分组添加到该网卡所配置的队列中，
由该队列决定报文分组的发送顺序。因此可以说，所有的流量控制都发生在队列中

有些队列的功能是非常简单的，它们对报文分组实行先来先走的策略。有些队列则功能复
杂，会将不同的报文分组进行排队、分类，并根据不同的原则，以不同的顺序发送队列中
的报文分组。为实现这样的功能，这些复杂的队列需要使用不同的过滤器(Filter)来把报
文分组分成不同的类别(Class)。这里把这些复杂的队列称为可分类(ClassfuI)的队列。


通常， 要实现功能强大的流量控制，可分类的队列是必不可少的。因此，类别(class)和
过滤器(Filter)也是流量控制的另外两个重要的基本概念。

下图所示的是一个可分类队列的例子。

|       +----------+            +-------+--------+
|   --->| 过滤器 1 |----------->| 类别1 | 子队列 |--->
|       +----------+            +-------+--------+
|
|
|
|       +----------+
|   --->| 过滤器 2 |-----+
|       +----------+     |
|                        |      +-------+--------+
|                        +----->| 类别1 | 子队列 |--->
|                        |      +-------+--------+
|       +----------+     |
|   --->| 过滤器 3 |-----+
|       +----------+
|


**类别(Class)和过滤器(Filter)是队列的内部结构**，并且可分类的队列可以包含多个类
别，同时，一个类别又可以进一步包含有子队列，或者子类别。所有进入该类别的报文分
组可以依据不同的原则放入不同的子队列 或子类别中，以此类推。而过滤器(Filter)是队
列用来对数据报文进行分类的工具，它决定一个数据报文将被分配到哪个类别中。



The default qdisc under Linux is the **pfifo_fast**, which is slightly more complex than the FIFO.


filter用来将数据包划分到具体的控制策略中，包括以下几种：
    u32：根据协议、IP、端口等过滤数据包
    fwmark：根据iptables MARK来过滤数据包
    tos：根据tos字段过滤数据包




## Linux Advanced Routing & Traffic Control HOWTO

[link](https://berthub.eu/lartc/lartc.qdisc.classful.html)


Classful qdiscs are very useful if you have different kinds of traffic which
should have differing treatment. One of the classful qdiscs is called 'CBQ' ,
'Class Based Queueing' and it is so widely mentioned that

people identify queueing with classes solely with CBQ, but this is not the case.
人们仅用CBQ来识别排队与类

CBQ is merely the oldest kid on the block(街区里最大的孩子) - and also the most
complex one. It may not always do what you want.

This may come (as something of a shock, 震惊) to many who fell for(爱上，倾心)
the 'sendmail effect', which teaches us that any complex technology which
doesn't come with documentation must be the best available.(It's funny)

When traffic enters a classful qdisc, it needs to be sent to any of the classes
within - it needs to be 'classified'. To determine what to do with a packet,
the so called 'filters' are consulted(请教). 

The filters attached to that qdisc then return with a decision, and the qdisc       // qdisk 包含 filters
uses this to enqueue the packet into one of the classes. 

Each subclass may try other filters to see if further instructions apply. If        // class 也可以包含 filters?
not, the class enqueues the packet to the qdisc it contains.                        // 怎么理解呢?

Besides containing other qdiscs, most classful qdiscs also perform shaping.
This is useful to perform both packet scheduling (with SFQ, for example) and
rate control. 


9.5.2. The qdisc family: roots, handles, siblings and parents

Each interface has one egress 'root qdisc', by default the earlier mentioned
classless pfifo_fast queueing discipline.

Each qdisc can be assigned a handle, which can be used by later configuration
statements to refer to that qdisc. 

The handles of these qdiscs consist of two parts, a major number and a minor
number. It is habitual([həˈbɪtʃuəl],习惯上的) to name the root qdisc '1:',
which is equal to '1:0'.  The minor number of a qdisc is always 0.

Classes need to have the same major number as their parent.

Recapping(recap, 扼要重述，摘要说明), a typical hierarchy might look like this:

|       root 1:
|         |
|       _1:1_
|       /  |  \
|      /   |   \
|     /    |    \
|    10:   11:   12:
|   /   \       /   \
| 10:1  10:2   12:1  12:2


You should *not* imagine the kernel to be at the apex([ˈeɪpeks] 顶点，最高点)
of the tree and the network below, that is just not the case.

Packets get enqueued and dequeued at the root qdisc, which is the only thing        // where is the root qdisc???
the kernel talks to.

A packet might get classified in a chain like this:

1: -> 1:1 -> 12: -> 12:2

The packet now resides in a queue in a qdisc attached to class 12:2.                // 包现在驻留在一个队列中，这个队列规则附属于类 12:2

However, this is also possible:

1: -> 12:2

In this case, a filter attached to the root decided to send the packet directly     // ???
to 12:2.


9.5.2.2. How packets are dequeued to the hardware

When the kernel decides that it needs to extract packets to send to the
interface, the root qdisc 1: gets a dequeue request, which is passed to 1:1,
which is in turn passed to 10:, 11: and 12:, which each query their siblings,
and try to dequeue() from them. In this case, the kernel needs to walk the
entire tree, because only 12:2 contains a packet.

In short, nested classes ONLY talk to their parent qdiscs, never to an              // ???
interface. Only the root qdisc gets dequeued by the kernel!


The upshot(结果,结局) of this is that classes never get dequeued faster than        // ???
their parents allow. And this is exactly what we want: this way we can have SFQ
in an inner class, which doesn't do any shaping, only scheduling, and have a
shaping outer qdisc, which does the shaping.


9.5.3. The PRIO qdisc

The PRIO qdisc doesn't actually shape, it only subdivides(细分) traffic based
on how you configured your filters. 

You can consider the PRIO qdisc a kind of pfifo_fast on stereoids, whereby(其中)
each band is a separate class instead of a simple FIFO.

When a packet is enqueued to the PRIO qdisc, a class is chosen based on the
filter commands you gave. By default, three classes are created. These classes
by default contain pure FIFO qdiscs with no internal structure, but you can
replace these by any qdisc you have available.

Whenever a packet needs to be dequeued, class :1 is tried first. Higher classes
are only used if lower bands all did not give up a packet.

This qdisc is very useful in case you want to prioritize(/ praɪˈɔːrətaɪz /按优
先顺序列出；优先考虑（处理）) certain kinds of traffic without using only
TOS-flags but using all the power of the tc filters.  It can also contain more
all qdiscs, whereas pfifo_fast is limited to simple fifo qdiscs.

Because it doesn't actually shape, the same warning as for SFQ holds: either
use it only if your physical link is really full or wrap it inside a classful
qdisc that does shape. The last holds for almost all cablemodems and DSL
devices.

In formal words, the PRIO qdisc is a Work-Conserving(保护，保存；节省，节约) scheduler.




## 

htb

https://blog.csdn.net/eydwyz/article/details/53390294

r2q：在规则中的作用是用来分配剩余带宽的全局变量，它的默认值为10

quantum与r2q的关系为quantum=rate/r2q，quantum的值必须在1500到60000之间，值越小
越好

每个规则的quantum的值就是从父类借用带宽的因子（也就是每个子类每次可以从父类借用
空闲带宽的大小）也可以说是与其他子类同时从父类借带宽的比例。

rate单位为Mbit时，上限临界值为 0.7左右，即r2q最小要设为0.7。rate单位为Gbit时，
上限临界值为700左右，即r2q最小要设为700。

## CLASSLESS QDisc

    sfq

        是Stochastic Fairness Queueing的简写。它按照会话(session--对应于每个TCP
        连接或者UDP流)为流量进行排序，然后循环发送每个会话的数据包。


## CLASSFUL QDISC

    HTB

        HTB是Hierarchy Token Bucket的缩写。
        
        通过在实践基础上的改进，它实现了一个丰富的连接共享类别体系。使用HTB可以
        很容易地保证每个类别的带宽，虽然它也允许特定的类可以突破带宽上限，占用
        别的类的带宽。
        
        HTB可以通过TBF(Token Bucket Filter)实现带宽限制，也能够划分类别的优先级。


1. 创建队列

    1. tc qdisc add dev eth1 root handle 1: prio
        
        为网卡eth1建议一个队列,名字为root，句柄为1

    2. tc qdisc add dev eth1 root handle 1:htb default 11
        
        为网卡eth1添加root根队列
        "handle 1:"表示队列的句柄为1:
        "htb"表示要添加的队列为HTB队列，命令最后的"default 11"是htb特有的队列参数，意思是所有未分类的流量都将分配给类别1:11。

    3. tc qdisc add dev xgbe0 root handle 1:0 cbq bandwidth 100Mbit avpkt 1000 cell 8
        
        为网卡xbge0创建一个cbq队列
        限制网卡总带宽为100Mbit/s
        avpkt表示平均包大小，单位字节, avpkt 1000表示平均包大小为1000B
        cell表示一个数据包被发送出去的平均时间，通常设置为8，必须是2的整数次幂




2. 可以利用下面这三个命令为根队列1创建三个类别，分别是1:11、1:12和1:13，它们分别占用40、40和20mbit的带宽。

    tc class add dev eth1 parent 1: classid 1:11 htb rate 40mbit ceil 40mbit
    tc class add dev eth1 parent 1: classid 1:12 htb rate 40mbit ceil 40mbit
    tc class add dev eth1 parent 1: cllassid 1:13 htb rate 20mbit ceil 20mbit

        "parent 1:"表示类别的父亲为根队列1: 
        "classid1:11"表示创建一个标识为1:11的类别
        "rate 40mbit"表示系统将为该类别确保带宽40mbit
        "ceil 40mbit"，表示该类别的最高可占用带宽为40mbit。




## 2. 使用TC

在Linux中，流量控制都是通过TC这个工具来完成的。通常，要对网卡进行流量控制的配置，
需要进行如下的步骤：

    1. 为网卡配置一个队列；
    2. 在该队列上建立分类；
    3. 根据需要建立子队列和子分类；
    4. 为每个分类建立过滤器。




### synopsys

    tc [ OPTIONS  ] qdisc  [ add | change | replace | link | delete  ] dev DEV [ parent qdisc-id | root  ] [ handle qdisc-id  ] [ ingress_block BLOCK_INDEX  ] [ egress_block BLOCK_INDEX  ] qdisc [ qdisc specific parameters  ]
    tc [ OPTIONS  ] class  [ add | change | replace | delete  ] dev DEV parent qdisc-id [ classid class-id  ] qdisc [ qdisc specific parameters  ]
    tc [ OPTIONS  ] filter [ add | change | replace | delete | get  ] dev DEV [ parent qdisc-id | root  ] [ handle filter-id  ] protocol protocol prio priority filtertype [ filtertype specific parameters  ] flowid flow-id
    tc [ OPTIONS  ] filter [ add | change | replace | delete | get  ] block BLOCK_INDEX [ handle filter-id  ] protocol protocol prio priority filtertype [ filtertype specific parameters  ] flowid flow-id

    tc [ OPTIONS  ] chain [ add | delete | get  ] dev DEV [ parent qdisc-id | root  ] filtertype [ filtertype specific parameters  ]
    tc [ OPTIONS  ] chain [ add | delete | get  ] block BLOCK_INDEX filtertype [ filtertype specific parameters  ]

    tc [ OPTIONS  ] [ FORMAT  ] qdisc { show | list  } [ dev DEV  ] [ root | ingress | handle QHANDLE | parent CLASSID  ] [ invisible  ]
    tc [ OPTIONS  ] [ FORMAT  ] class show dev DEV
    tc [ OPTIONS  ]             filter show             dev     DEV             // 也可以用 ls
    tc [ OPTIONS  ]             filter show             block   BLOCK_INDEX     // 也可以用 ls
    tc [ OPTIONS  ]             chain  show             dev     DEV             // 也可以用 ls
    tc [ OPTIONS  ]             chain  show             block   BLOCK_INDEX     // 也可以用 ls

    tc [ OPTIONS  ] monitor [ file FILENAME  ]

    OPTIONS := { [ -force  ] -b[atch] [ filename  ] | [ -n[etns] name  ] | [ -N[umeric]  ] | [ -nm | -nam[es]  ] | [ { -cf | -c[onf]  } [ filename  ]  ] [ -t[imestamp]  ] | [ -t[short] | [ -o[neline]  ] }

    FORMAT := { -s[tatistics] | -d[etails] | -r[aw] | -i[ec] | -g[raph] | -j[json] | -p[retty] | -col[or]  }


#### FORMAT

The show command has additional formatting options:

    -s, -stats, -statistics
        
        output more statistics about packet usage.

    -d, -details
        
        output more detailed information about rates and cell sizes.

    -r, -raw
        
        output raw hex values for handles.

    -p, -pretty

        for u32 filter, decode offset and mask values to equivalent filter
        commands based on TCP/IP.
        
        In JSON output, add whitespace to improve readability.

    -iec   
        
        print rates in **IEC units** (ie. 1K = 1024).

    -g, -graph

        shows classes as ASCII graph.
        
        Prints generic stats info under each class if -s option was specified.
        Classes can be filtered only by dev option.

    -c[color][={always|auto|never}

        Configure color output. If parameter is omitted or always, color output
        is enabled regardless of stdout state. If parameter is auto, stdout is
        checked to be a terminal before enabling  color  output.  If  parameter
        is never, color output is disabled. If specified multiple times, the
        last one takes precedence. This flag is ignored if -json is also given.

    -j, -json
        Display results in JSON format.

    -nm, -name
        resolve class name from /etc/iproute2/tc_cls file or from file
        specified by -cf option. This file is just a mapping of classid to
        class name:
        
            ```
            # Here is comment
            1:40   voip # Here is another comment
            1:50   web
            1:60   ftp
            1:2    home
            ```

        tc will not fail if -nm was specified without -cf option but /etc/iproute2/tc_cls file does not exist, which makes it possible to pass -nm option for creating tc alias.



### View your current qdisc:

    > tc qdisc show dev enp0s1

Inspect the current qdisc counters:

    ```
    > tc -s qdisc show dev enp0s1

    qdisc fq_codel 0: root refcnt 2 limit 10240p flows 1024 quantum 1514 target 5.0ms interval 100.0ms memory_limit 32Mb ecn
    Sent 1008193 bytes 5559 pkt (dropped 233, overlimits 55 requeues 77)
    backlog 0b 0p requeues 0
    ....
    ```


    dropped - the number of times a packet is dropped because all queues are full
    overlimits - the number of times the configured link capacity is filled
    sent - the number of dequeues
