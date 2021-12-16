
links:

    https://www.cnblogs.com/ultranms/p/9254160.html


## free 输出简介

下面先解释一下输出的内容：

Mem 行(第二行)是内存的使用情况。
Swap 行(第三行)是交换空间的使用情况。
total 列显示系统总的可用物理内存和交换空间大小。
used 列显示已经被使用的物理内存和交换空间。
free 列显示还有多少物理内存和交换空间可用使用。
shared 列显示被共享使用的物理内存大小。
buff/cache 列显示被 buffer 和 cache 使用的物理内存大小。
available 列显示还可以被应用程序使用的物理内存大小。
    The “avail mem” value is the amount of memory that can be allocated to processes without causing more swapping.

我想只有在理解了一些基本概念之后，上面的输出才能帮助我们了解系统的内存状况。

```
|top - 20:46:39 up 6 days,  4:20, 10 users,  load average: 0.00, 0.01, 0.00
|Tasks: 143 total,   1 running, 141 sleeping,   0 stopped,   1 zombie
|%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
|MiB Mem :   7979.0 total,   6662.7 free,    452.6 used,    863.6 buff/cache
|MiB Swap:    975.0 total,    975.0 free,      0.0 used.   7213.5 avail Mem
|                                                               /|\
|                                                                |
|                                                          这是物理内存的
```

The Linux kernel also tries to reduce disk access times in various ways. It maintains a “disk cache” in RAM, where 
frequently used regions of the disk are stored. In addition, disk writes are stored to a “disk buffer”, and the 
kernel eventually writes them out to the disk. The total memory consumed by them is the “buff/cache” value. It might 
sound like a bad thing, but it really isn’t — memory used by the cache will be allocated to processes if needed.


## buff/cache

先来提一个问题： buffer 和 cache 应该是两种类型的内存，但是 free 命令为什么会把它们放在一起呢？
要回答这个问题需要我们做些准备工作。让我们先来搞清楚 buffer 与 cache 的含义。

buffer 在操作系统中指 buffer cache， 中文一般翻译为 "缓冲区"。要理解缓冲区，必须明确另外两个概念：
"扇区" 和 "块"。扇区是设备的最小寻址单元，也叫 "硬扇区" 或 "设备块"。块是操作系统中文件系统的
最小寻址单元，也叫 "文件块" 或 "I/O 块"。每个块包含一个或多个扇区，但大小不能超过一个页面，所以
一个页可以容纳一个或多个内存中的块。当一个块被调入内存时，它要存储在一个缓冲区中。每个缓冲区与一
个块对应，它相当于是磁盘块在内存中的表示(下图来自互联网)：



注意，buffer cache 只有块的概念而没有文件的概念，它只是把磁盘上的块直接搬到内存中而不关心块
中究竟存放的是什么格式的文件。

cache 在操作系统中指 page cache，中文一般翻译为 "页高速缓存"。页高速缓存是内核实现的磁盘缓存。
它主要用来减少对磁盘的 I/O 操作。具体地讲，是通过把磁盘中的数据缓存到物理内存中，把对磁盘的访
问变为对物理内存的访问。页高速缓存缓存的是内存页面。缓存中的页来自对普通文件、块设备文件(这个
指的就是 buffer cache 呀)和内存映射文件的读写。

页高速缓存对普通文件的缓存我们可以这样理解：当内核要读一个文件(比如 /etc/hosts)时，它会先检查
这个文件的数据是不是已经在页高速缓存中了。如果在，就放弃访问磁盘，直接从内存中读取。这个行为称
为缓存命中。如果数据不在缓存中，就是未命中缓存，此时内核就要调度块 I/O 操作从磁盘去读取数据。
然后内核将读来的数据放入页高速缓存中。这种缓存的目标是文件系统可以识别的文件(比如 /etc/hosts)。

页高速缓存对块设备文件的缓存就是我们在前面介绍的 buffer cahce。因为独立的磁盘块通过缓冲区也被
存入了页高速缓存(缓冲区最终是由页高速缓存来承载的)。

到这里我们应该搞清楚了：无论是缓冲区还是页高速缓存，它们的实现方式都是一样的。缓冲区只不过是一
种概念上比较特殊的页高速缓存罢了。

那么为什么 free 命令不直接称为 cache 而非要写成 buff/cache？ 这是因为缓冲区和页高速缓存的实现
并非天生就是统一的。在 linux 内核 2.4 中才将它们统一。

更早的内核中有两个独立的磁盘缓存：页高速缓存和缓冲区高速缓存。前者缓存页面，后者缓存缓冲区。

当你知道了这些故事之后，输出中列的名称可能已经不再重要了。


## free 与 available

在 free 命令的输出中，有一个 free 列，同时还有一个 available
列。这二者到底有何区别？ free 是真正尚未被使用的物理内存数量。至于 available
就比较有意思了，它是从应用程序的角度看到的可用内存数量。Linux
内核为了提升磁盘操作的性能，会消耗一部分内存去缓存磁盘数据，就是我们介绍的
buffer 和 cache。所以对于内核来说，buffer 和 cache
都属于已经被使用的内存。当应用程序需要内存时，如果没有足够的 free
内存可以用，内核就会从 buffer 和 cache
中回收内存来满足应用程序的请求。所以从应用程序的角度来说，available  = free +
buffer +
cache。请注意，这只是一个很理想的计算方式，实际中的数据往往有较大的误差。

## 交换空间(swap space) 

swap space 是磁盘上的一块区域，可以是一个分区，也可以是一个文件。所以具体的实现可以是 swap
分区也可以是 swap 文件。当系统物理内存吃紧时，Linux
会将内存中不常访问的数据保存到 swap
上，这样系统就有更多的物理内存为各个进程服务，而当系统需要访问 swap
上存储的内容时，再将 swap 上的数据加载到内存中，这就是常说的换出和换入。交换空间可以在一定程度
上缓解内存不足的情况，但是它需要读写磁盘数据，所以性能不是很高。


现在的机器一般都不太缺内存，如果系统默认还是使用了 swap
是不是会拖累系统的性能？理论上是的，但实际上可能性并不是很大。并且内核提供了一个叫做
swappiness 的参数，用于配置需要将内存中不常用的数据移到 swap
中去的紧迫程度。这个参数的取值范围是 0～100，0
告诉内核尽可能的不要将内存数据移到 swap
中，也即只有在迫不得已的情况下才这么做，而 100
告诉内核只要有可能，尽量的将内存中不常访问的数据移到 swap 中。在 ubuntu
系统中，swappiness 的默认值是 60。如果我们觉着内存充足，可以在 /etc/sysctl.conf
文件中设置 swappiness：

    vm.swappiness=10

如果系统的内存不足，则需要根据物理内存的大小来设置交换空间的大小。具体的策略网上有很丰富的资料，这里笔者不再赘述。

## /proc/meminfo 文件 

其实 free 命令中的信息都来自于 /proc/meminfo文件。/proc/meminfo 文件包含了更多更原始的信息，只是看起来不太直观：

    $ cat /proc/meminfo