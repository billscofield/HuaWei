links:

    https://www.centos.bz/2017/07/zabbix-auto-discovery-disk-io-perf/

    good:

    https://www.kernel.org/doc/Documentation/ABI/testing/procfs-diskstats

    https://www.kernel.org/doc/Documentation/iostats.txt

一. 基本概念

1. 读/写IO
最为常见说法，读IO，就是发指令，从磁盘读取某段扇区的内容。指令一般是通知磁盘开始扇区位置，然后给出需要从这个初始扇区往后读取的连续扇区个数，同时给出动作是读，还是写。磁盘收到这条指令，就会按照指令的要求，读或者写数据。控制器发出的这种指令＋数据，就是一次IO，读或者写。

2. 大/小块IO
指控制器的指令中给出的连续读取扇区数目的多少，如果数目很大，比如128，64等等，就应该算是大块IO，如果很小，比如1， 4，8等等，就应该算是小块IO，大块和小块之间，没有明确的界限。

3. 连续/随机IO
连续和随机，是指本次IO给出的初始扇区地址，和上一次IO的结束扇区地址，是不是完全连续的，或者相隔不多的，如果是，则本次IO应该算是一个连续IO，如果相差太大，则算一次随机IO。连续IO，因为本次初始扇区和上次结束扇区相隔很近，则磁头几乎不用换道或换道时间极短；如果相差太大，则磁头需要很长的换道时间，如果随机IO很多，导致磁头不停换道，效率大大降底。

4. 顺序/并发IO
这个的意思是，磁盘控制器每一次对磁盘组发出的指令套（指完成一个事物所需要的指令或者数据），是一条还是多条。如果是一条，则控制器缓存中的IO队列，只能一个一个的来，此时是顺序IO；如果控制器可以同时对磁盘组中的多块磁盘，同时发出指令套，则每次就可以执行多个IO，此时就是并发IO模式。并发IO模式提高了效率和速度。

5. IO并发几率
单盘，IO并发几率为0，因为一块磁盘同时只可以进行一次IO。对于raid0，2块盘情况下，条带深度比较大的时候（条带太小不能并发IO，下面会讲到），并发2个IO的几率为1/2。其他情况请自行运算。

6. IOPS
即每秒进行读写（I/O）操作的次数，一个IO所用的时间＝寻道时间＋数据传输时间。 IOPS＝IO并发系数/（寻道时间＋数据传输时间），由于寻道时间相对传输时间，大几个数量级，所以影响IOPS的关键因素，就是降底寻道时间，而在连续IO的情况下，寻道时间很短，仅在换磁道时候需要寻道。在这个前提下，传输时间越少，IOPS就越高。

7. 每秒IO吞吐量
显然，每秒IO吞吐量＝IOPS乘以平均IO SIZE。 Io size越大，IOPS越高，每秒IO吞吐量就越高。

8. 设磁头每秒读写数据速度为V，V为定值
则IOPS＝IO并发系数/（寻道时间＋IO SIZE/V），代入，得每秒IO吞吐量＝IO并发系数乘IO SIZE乘V/（V乘寻道时间＋IO SIZE）。我们可以看出影响每秒IO吞吐量的最大因素，就是IO SIZE和寻道时间，IO SIZE越大，寻道时间越小，吞吐量越高。相比能显著影响IOPS的因素，只有一个，就是寻道时间。

二. 监控磁盘IO的基本原理:通过分析/proc/diskstats文件，来对IO的性能进行监控。
1. 第一至第三个域
分别是主设备号，次设备号，设备名称

2. 第4个域
读完成次数 —– 读磁盘的次数，成功完成读的总次数。（number of issued reads. This is the total number of reads completed successfully.）

3. 第5个域
合并读完成次数， 第9个域：合并写完成次数。为了效率可能会合并相邻的读和写。从而两次4K的读在它最终被处理到磁盘上之前可能会变成一次8K的读，才被计数（和排队），因此只有一次I/O操作。这个域使你知道这样的操作有多频繁。（number of reads merged）

4. 第6个域
读扇区的次数，成功读过的扇区总次数。（number of sectors read. This is the total number of sectors read successfully.）

5. 第7个域

```
读花费的毫秒数，这是所有读操作所花费的毫秒数（用__make_request()到end_that_request_last()测量）。（number of milliseconds spent reading. This is the total number of milliseconds spent by all reads (as measured from __make_request() to end_that_request_last()).）

```

6. 第8个域
写完成次数 —-写完成的次数，成功写完成的总次数。（number of writes completed. This is the total number of writes completed successfully.）

7. 第9个域
合并写完成次数 —–合并写次数。（number of writes merged Reads and writes which are adjacent to each other may be merged for efficiency. Thus two 4K reads may become one 8K read before it is ultimately handed to the disk, and so it will be counted (and queued) as only one I/O. This field lets you know how often this was done.）

8. 第10个域
写扇区次数 —- 写扇区的次数，成功写扇区总次数。（number of sectors written. This is the total number of sectors written successfully.）

9. 第11个域
```
写操作花费的毫秒数 — 写花费的毫秒数，这是所有写操作所花费的毫秒数（用__make_request()到end_that_request_last()测量）。（number of milliseconds spent writing This is the total number of milliseconds spent by all writes (as measured from __make_request() to end_that_request_last()).）

```

10. 第12个域
正在处理的输入/输出请求数 — -I/O的当前进度，只有这个域应该是0。当请求被交给适当的request_queue_t时增加和请求完成时减小。（number of I/Os currently in progress. The only field that should go to zero. Incremented as requests are given to appropriate request_queue_t and decremented as they finish.）

11. 第13个域
输入/输出操作花费的毫秒数 —-花在I/O操作上的毫秒数，这个域会增长只要field 9不为0。（number of milliseconds spent doing I/Os. This field is increased so long as field 9 is nonzero.）

12. 第14个域
输入/输出操作花费的加权毫秒数 —– 加权， 花在I/O操作上的毫秒数，在每次I/O开始，I/O结束，I/O合并时这个域都会增加。这可以给I/O完成时间和存储那些可以累积的提供一个便利的测量标准。（number of milliseconds spent doing I/Os. This field is incremented at each I/O start, I/O completion, I/O merge, or read of these stats by the number of I/Os in progress (field 9) times the number of milliseconds spent doing I/O since the last update of this field. This can provide an easy measure of both I/O completion time and the backlog that may be accumulating.）





---

The /proc/diskstats file displays the I/O statistics
		of block devices. Each line contains the following 14
		fields:

		==  ===================================
		 1  major number
		 2  minor mumber
		 3  device name
		 4  reads completed successfully
		 5  reads merged
		 6  sectors read
		 7  time spent reading (ms)
		 8  writes completed
		 9  writes merged
		10  sectors written
		11  time spent writing (ms)
		12  I/Os currently in progress
		13  time spent doing I/Os (ms)
		14  weighted time spent doing I/Os (ms)
		==  ===================================

		Kernel 4.18+ appends four more fields for discard
		tracking putting the total at 18:

		==  ===================================
		15  discards completed successfully
		16  discards merged
		17  sectors discarded
		18  time spent discarding
		==  ===================================

		Kernel 5.5+ appends two more fields for flush requests:

		==  =====================================
		19  flush requests completed successfully
		20  time spent flushing
		==  =====================================

		For more details refer to Documentation/admin-guide/iostats.rst
