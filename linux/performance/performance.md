
## uptime

 06:15:20 up 1 min,  4 users,  load average: 1.23, 0.55, 0.20

w, top 的结果都包含了 uptime 的结果

也可以从 /proc/loadavg 中读取

System load averages is the average number of processes that are either in a runnable or uninterruptable state.  

A process  in  a  runnable state is either using the CPU or waiting to use the CPU.  
A process in uninterruptable state is waiting for some I/O access, eg waiting for disk.  

The averages are taken over the three time intervals.  
Load averages are not normalized for the number of CPUs in  a  system,  
so a load average of 1 means a single CPU system is loaded all the time while on a 4 CPU system it means it was idle 75% of the time.

平均负载：单位时间内处于可运行状态和不可中断状态的进程数

可运行状态：ps -aux 命令中看到的，处于R状态的进行

不可中断状态的进程：正处于内核态关键流程中的进程，并且这些流程是不可打断的，比如I/O, ps -aux 中的 D 状态(uninterruptible Sleep 或 Disk  Sleep)
比如，当一个进程向磁盘读写数据时，为了保证数据的一致性，在得到磁盘回复前，他是不能被其他进程或者中断打断的，这个时候的进程就处于不可中断状态。

所以，**不可中断状态实际上是系统对进程和硬件设备的一种保护机制。**

平均负载就是平均活跃进程数, 真正的概念叫做"指数衰减平均",是系统的一种更为快速的计算方式

**既然平均的是活跃进程数，那么最理想的，就是每个CPU上都刚好运行着一个进程，这样每个CPU都得到了充分利用。**比如当平均负载为2时，意味着什么?

    1. 在只有2个CPU的系统上，意味着所有的CPU都刚好被完全占用

    1. 在4个CPU的系统上，则意味着CPU有50%的空闲

    1. 而在只有1个CPU的系统中，则意味着有一半的进程竞争不到CPU

### 平均负载为多少时合理呢?

首先你要知道你有多少个CPU， 可以通过 top 命令或者从文件 /proc/cpuinfo 中读取

```
grep 'model name' /proc/cpuinfo | wc -l

model name      : Intel(R) Core(TM) i5-7200U CPU @ 2.50GHz
model name      : Intel(R) Core(TM) i5-7200U CPU @ 2.50GHz
model name      : Intel(R) Core(TM) i5-7200U CPU @ 2.50GHz
model name      : Intel(R) Core(TM) i5-7200U CPU @ 2.50GHz
```

1.73 0.60 7.98

在过去一分钟内，系统有73%的过载，而在15分钟内，有698%的过载，冲整体趋势来看，系统的负载在降低

一般来说，当平均负载高于CPU数量70%的时候，就应该分析排查负载过高的原因了。一旦负载过高，就可能导致进程响应变慢，进而影响服务的正常功能。


### 平均负载和CPU使用率

平均负载：单位时间内处于可运行状态和不可中断状态的进程数

CPU使用率：单位时间内CPU繁忙情况的统计，和平均负载并不一定完全对应

    1. CPU密集型进程, 使用大量 CPU 会导致平均负载升高，此时两者是一致的
    1. I/O 密集型进程, 等待I/O也会导致平均负载升高，但CPU使用率不一定很高
    1. 大量等待CPU的进程调度也会导致平均负载升高，此时的CPU使用率也会比较高


#### 具体案例分析

所用的命令 iostat, mpstat, pidstat , stress (apt install sysstat stress)

stress - tool to impose load on and stress test systems
stress是一个系统压力测试工具，这里我们用作异常进程模拟平均负载升高的场景

mpstat - Report processors related statistics.
mpstat 是一个常用的多核 CPU 性能分析工具，用来实时查看每个CPU的性能指标，以及所有CPU的平均指标

mpstat - Report processors related statistics.
pidstat 是一个常用的进程性能分析同居，用来实时查看进程的CPU、内存、I/O 以及上下文切换等性能指标


##### CPU 密集型进程

stress -c 1 -t 600

一分钟时观察uptime, 或者 top
一分钟时使用 mpstat -P ALL 5



``` iostat
Linux 4.19.0-9-amd64 (debian)   07/24/2020      _x86_64_        (4 CPU)

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
1.32    0.01    0.51    0.07    0.00   98.10

Device             tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sda              10.16       260.21        57.31     811535     178748
sdb               0.03         0.69         0.00       2144          0

```




