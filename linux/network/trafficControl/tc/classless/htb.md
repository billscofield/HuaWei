
# HTB


[官网](http://luxik.cdi.cz/~devik/qos/htb/)

## 1. Introduction 介绍

[link](https://www.linuxjournal.com/article/7562)
The HTB discipline uses the TBF algorithm to control the packets queued for
each defined class of service associated with it. 

The TBF algorithm provides traffic policing and traffic-shaping capabilities. A
detailed description of the TBF algorithm can be found in the Cisco IOS Quality
of Service Solutions Configuration Guide (see “Policing and Shaping Overview”).

TC is a user-level program that creates queues, classes and filters and
associates them with an output interface (see “tc—Linux QoS control tool” in
Resources). The filters can be set up based on the routing table, u32
classifiers and TOS classifiers.

Only the root queuing discipline should be defined as an HTB type; all the
other class instances use the FIFO queue (default).

The queuing process always starts at the root level and then, based on rules,
decides which class should receive the data. The tree of classes is traversed
until a matched leaf class is found (see “Hierarchical Token Bucket Theory”).

rate = the maximum bandwidth a class can use without borrowing from other classes.
ceiling = the maximum bandwidth that a class can use, which limits how much bandwidth the class can borrow.
burst = the amount of data that could be sent at the ceiling speed before moving to serve the next class.
cburst = the amount of data that could be sent at the wire speed before moving to serve the next class.




HTB is meant as a more understandable, intuitive(/ ɪnˈtuːɪtɪv /直觉的；有直觉力
的；易懂的，使用简便的) and faster replacement for the CBQ qdisc in Linux.

Both CBQ and HTB help you to control the use of the outbound bandwidth on a
given link. 

Both allow you to use one physical link to simulate several slower links and to
send different kinds of traffic on different simulated links.

In both cases, you have to specify how to divide the physical link into
simulated links and how to decide which simulated link to use for a given
packet to be sent.

This document shows you how to use HTB. Most sections have examples, charts
(with measured data) and discussion of particular problems.

This release of HTB should be also much more scalable. See comparison at HTB
home page.

Please read: tc tool (not only HTB) uses shortcuts to denote(标志，预示；表示)
units of rate.

    kbps means kilobytes
    kbit means kilobits

This is the most FAQ about tc in linux.


## 2. Link sharing 链路共享

我们有两不同的用户A和B, 都通过网卡 eth0 连接到 internet

1. clientA: 
    40kbps
        1. www  : 30kbps
        2. other: 10kbps

2. clientB:
    60kbps

|           main link
|          /    |    \
|     A/www   A/smtp  B


3. Any unused bandwidth can be used by any class which needs it (in proportion
   of its allocated share).
   任何没有用的带宽可以分配和其他需要带宽(在分配的总带宽允许的范围内的部分)

HTB ensures that the amount of service provided to each class is at least the
minimum of the amount it requests and the amount assigned to it.
HTB确保为每个类提供的服务量至少是它请求的量和分配给它的量的最小值。

When a class requests less than the amount assigned, the remaining (excess)
bandwidth is distributed to other classes which request service.

Note: 

    In the literature this is called "borrowing" the excess(过量) bandwidth()剩余带宽. 

    We use that term below to conform with the literature.
    为了与文献相符，我们在下面使用这个术语。

    We mention, however, that this seems like a bad term since there is no
    obligation(（法律上或道义上的）义务，责任) to repay the resource that was
    "borrowed".

Let's see what commands to use:

    ` tc qdisc add dev eth0 root handle 1: htb default 12

This command attaches queue discipline HTB to eth0 and gives it the "handle" 1:

This is just a name or identifier with which to refer to it below.

The default 12 means that any traffic that is not otherwise classified will be
assigned to class 1:12.

y is an integer identifying a class belonging to that qdisc
Y是一个整数，它标识了一个属于qdisc的类

```
tc class add dev eth0 parent 1:  classid 1:1  htb rate 100kbps ceil 100kbps 
tc class add dev eth0 parent 1:1 classid 1:10 htb rate 30kbps  ceil 100kbps
tc class add dev eth0 parent 1:1 classid 1:11 htb rate 10kbps  ceil 100kbps
tc class add dev eth0 parent 1:1 classid 1:12 htb rate 60kbps  ceil 100kbps
```

The first line creates a "root" class, 1:1 under the qdisc 1:. The definition
of a root class is one with the htb qdisc as its parent.

A root class, like other classes under an htb qdisc allows its children to
borrow from each other, **but one root class cannot borrow from another.**

We could have created the other three classes directly under the htb qdisc, but     // 平行的类之间是不能借用带宽的
then the excess bandwidth from one would not be available to the others.

In this case we do want to allow borrowing, so we have to create an extra class
to serve as the root and put the classes that will carry the real data under
that. These are defined by the next three lines. The ceil parameter is
described below.

Note:

    Sometimes people ask me why they have to repeat dev eth0 when they have
    already used handle or parent.

    The reason is that **handles are local to an interface,** e.g., eth0 and
    eth1 could each have classes with handle 1:1.

We also have to describe which packets belong in which class. This is really
not related to the HTB qdisc. See the tc filter documentation for details.

The commands will look something like this:

```
tc filter add dev eth0 protocol ip parent 1:0 prio 1 u32 match ip src 1.2.3.4 match ip dport 80 0xffff flowid 1:10
tc filter add dev eth0 protocol ip parent 1:0 prio 1 u32 match ip src 1.2.3.4 flowid 1:11
```

(We identify A by its IP address which we imagine here to be 1.2.3.4.)

Note:

    The U32 classifier has an undocumented design bug which causes duplicate
    entries to be listed by "tc filter show" when you use U32 classifiers with
    different prio values.

    U32分类器有一个没有文档证明的设计bug，当你使用U32分类器的不同prio值时，会导
    致重复的条目被“tc filter show”列出

You may notice that we didn't create a filter for the 1:12 class. It might be
more clear to do so, but this illustrates the use of the default. Any packet
not classified by the two rules above (any packet not from source address
1.2.3.4) will be put in class 1:12.

Now we can optionally(/ ˈɑːpʃənəlɪ /随意地) attach queuing disciplines to the
leaf classes. If none is specified the default is pfifo.

```
tc qdisc add dev eth0 parent 1:10 handle 20: pfifo limit 5
tc qdisc add dev eth0 parent 1:11 handle 30: pfifo limit 5
tc qdisc add dev eth0 parent 1:12 handle 40: sfq perturb 10
```

That's all the commands we need. Let's see what happens if we send packets of
each class at 90kbps and then stop sending packets of one class at a time.


0 for class 1:10, 1 for class 1:11, 2 for class 1:12

    1. 0 时刻
        
        Initially all classes generate 90kb.
        
        Since this is higher than any of the rates specified, each class is
        limited to its specified rate.

    2. time 3 时刻
        
        At time 3 when we stop sending class 0 packets,
        
        the rate allocated to class 0 is reallocated to the other two classes       // +30/7x1   +30/7x6
        in proportion(/ prəˈpɔːrʃn /比例,份额) to their allocations, 1 part
        class 1 to 6 parts class 2. (The increase in class 1 is hard to see
        because it's only 4 kbps.)

    3. time 9 时刻
        
        Similarly at time 9 when class 1 traffic stops its bandwidth is
        reallocated to the other two (and the increase in class 0 is similarly
        hard to see.)
        
    4. time 15 时刻
        
        At time 15 it's easier to see that the allocation to class 2 is divided     // +60/4x3    +60/4x1
        3 parts for class 0 to 1 part for class 1. 
    
    5. time 18 时刻
        
        At time 18 both class 1 and
        class 2 stop so class 0 gets all 90 kbps it requests.



It might be good time to touch concept of quantums(/ ˈkwɑːntəm /量子；量子论；
额（特指定额、定量）) now.

In fact when more classes want to borrow bandwidth they are each given some
number of bytes before serving other competing class.                               //???

This number is called quantum. You should see that if several classes are           // 尽管是平分,但是有个最小精度问题
competing for parent's bandwidth then they get it in proportion of their
quantums. It is important to know that for precise operation quantums need to
be as small as possible and larger than MTU.

Normaly you don't need to specify quantums manualy as HTB chooses precomputed
values.

It computes classe's quantum (when you add or change it) as its rate divided by     // quantum = rate / r2q
r2q global parameter. 

Its default value is 10 and because typical MTU is 1500 the default is good for
rates from 15 kBps (120 kbit).

For smaller minimal rates specify r2q 1 when creating qdisc - it is good from       // ???
12 kbit which should be enough.

If you will need you can specify quantum manualy when adding or changing the
class.

You can avoid warnings in log if precomputed value would be bad.

When you specify quantum on command line the r2q is ignored for that class.

This might seem like a good solution if A and B were not different customers.
However, if A is paying for 40kbps then he would probably prefer his unused WWW
bandwidth to go to his own other service rather than to B. 


## 3. Sharing hierarchy 共享层次

The problem from the previous chapter is solved by the class hierarchy in this
picture. Customer A is now explicitly(清楚明白的，明确的，详述的) represented
by its own class.

Recall from above that **the amount of service provided to each class is at least
the minimum of the amount it requests and the amount assigned to it.** This
applies to htb classes that are not parents of other htb classes. We call these
leaf classes. 

For htb classes that are parents of other htb classes, which we call interior
classes, the rule is that **the amount of service is at least the minumum of
the amount assigned to it and the sum of the amount requested by its
children.**

In this case we assign 40kbps to customer A. That means that if A requests less
than the allocated rate for WWW, the excess will be used for A's other traffic
(if there is demand for it), at least until the sum is 40kbps.

Notes:

    Packet classification rules can assign to inner nodes too. Then you have to
    attach other filter list to inner node. Finally you should reach leaf or
    special 1:0 class. The rate supplied for a parent should be the sum of the
    rates of its children.

The commands are now as follows:

```
tc class add dev eth0 parent 1: classid 1:1 htb rate 100kbps ceil 100kbps
tc class add dev eth0 parent 1:1 classid 1:2 htb rate 40kbps ceil 100kbps
tc class add dev eth0 parent 1:2 classid 1:10 htb rate 30kbps ceil 100kbps
tc class add dev eth0 parent 1:2 classid 1:11 htb rate 10kbps ceil 100kbps
tc class add dev eth0 parent 1:1 classid 1:12 htb rate 60kbps ceil 100kbps
```

We now turn to the graph showing the results of the hierarchical solution.

When A's WWW traffic stops, its assigned bandwidth is reallocated to A's other
traffic so that A's total bandwidth is still the assigned 40kbps.

If A were to request less than 40kbs in total then the excess would be given to B.


## 4. Rate ceiling 速率极限

The ceil argument specifies the maximum bandwidth that a class can use. This
limits how much bandwidth that class can borrow.

The default ceil is the same as the rate. (That's why we had to specify it in
the examples above to show borrowing.) We now change the ceil 100kbps for
classes 1:2 (A) and 1:11 (A's other) from the previous chapter to ceil 60kbps
and ceil 20kbps.

This feature should be useful for ISPs because they probably want to limit the
amount of service a given customer gets even when other customers are not
requesting service. (ISPs probably want customers to pay more money for better
service.)

Note that **root classes are not allowed to borrow, so there's really no point in
specifying a ceil for them.**

Notes:

    **The ceil for a class should always be at least as high as the rate. Also,
    the ceil for a class should always be at least as high as the ceil of any
    of its children.**

0

(https://stackoverflow.com/questions/46049140/traffic-shaping-tc-htb-burst-has-no-effect)

**ceil** specifies how much bandwidth a traffic class can borrow from a parent
class if there is spare bandwidth available from peer(同龄人) classes.

However ,when applied to the root qdisc there is no parent to borrow from - so
specifying ceil different to rate is meaningless for a class on a root qdisc.


## 5. Burst 突发,决堤

Networking hardware can only send one packet at a time and only at a hardware
dependent rate. 

Link sharing software(链路共享软件) can only use this ability to approximate(大         // ???
概的，近似的,接近) the effects of multiple links running at different (lower)
speeds.

**Therefore the rate and ceil are not really instantaneous(瞬间发生的，瞬间完成的)        // ???
measures but averages over the time that it takes to send many packets.**
因此，速率和ceil并不是真正的瞬时度量，而是发送许多数据包所需时间的平均值

**What really happens is that the traffic from one class is sent a few packets at
a time at the maximum speed and then other classes are served for a while.**
实际发生的情况是，来自一个类的流量以最大速度一次发送几个包，然后在一段时间内为
其他类提供服务

***The burst and cburst parameters control the amount of data that can be sent          // the unit of cburst and burst is package size??? without knowing cburst size how can we decide the size of burst?
at the maximum (hardware) speed without trying to serve another class.***

[Please note that in the actual implementation, tokens correspond to bytes, not packets.](https://www.lartc.org/howto/lartc.qdisc.classless.html)

If cburst is smaller (ideally one packet size) it shapes bursts to not exceed           // ???
ceil rate in the same way as TBF's peakrate does.

When you set burst for parent class smaller than for some child then you should
expect the parent class to get stuck sometimes (because child will drain more
than parent can handle). HTB will remember these negative bursts up to 1
minute.


You can ask why I want bursts. Well it is cheap and simple way how to improve
response times on congested(/ kənˈdʒestɪd /堵塞的，拥挤的)link.

For example www traffic is bursty(猝发性；丛发性；突爆性). You ask for page,
get it in burst and then read it. During that idle period burst will "charge"
again.

Note:
    The burst and cburst of a class should always be at least as high as that           // what is burst and cburst???
    of any of it children.


(https://stackoverflow.com/questions/46049140/traffic-shaping-tc-htb-burst-has-no-effect)

**burst** specifies the amount of packets that are sent (at full link speed)
from one class before stopping to serve another class, & the rate shaping being
achieved by averaging the bursts over time.
Burst指定在停止服务于另一个类之前，从一个类发送(以全链路速度)的数据包的数量，以
及通过在一段时间内平均突发实现的速率整形。

If applied to root with no child classes, it will only affect the accuracy of
the averaging (smoothing), & won't do anything to the true average rate.


## 6. Priorizing bandwidth share 带宽分配优先

Classes with higher priority are offered excess(超过，过量) bandwidth first.
But rules about guaranted rate and ceil are still met.



## 7. Understanding statistics 查看统计



## 8. Making, debugging and sending error reports 开发,调试和错误报告




HTB是一种classful qdisc，是一种分层分类流控方法，是Linux常用的一种流控配置。接下来就来看一下使用配置：

配置HTB需要四个步骤：

创建root qdisc
创建class
创建filter，关联到class
添加leaf class disc(非必需)


