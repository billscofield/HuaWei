links:
    https://javawind.net/p131

    https://blog.csdn.net/zxh2075/article/details/78612617

    https://www.booleanworld.com/guide-linux-top-command/

## linux top命令 VIRT, RES, SHR, DATA 的含义

### VIRT：virtual memory usage 虚拟内存

The total amount of virtual memory used by the task. 
It includes all code, data and shared libraries plus pages that have been swapped out.

1. 进程“需要的”虚拟内存大小，包括进程使用的库、代码、数据等, 以及malloc、new分配的堆空间和分配的栈空间等；

2. 假如进程申请100m的内存，但实际只使用了10m，那么它会增长100m，而不是实际的使用量

3. VIRT = SWAP + RES

### RES：resident memory usage  (KB) 常驻内存, 驻留内存空间

The non-swapped physical memory a task has used.

1. 进程当前使用的内存大小，但不包括swap out
2. 包含其他进程的共享
3. 如果申请100m的内存，实际使用10m，它只增长10m，与VIRT相反
4. 关于库占用内存的情况，它只统计加载的库文件所占内存大小

### SHR：shared memory 共享内存 (KB)

The amount of shared memory used by a task. 
It simply reflects memory that could be potentially shared with other processes. 

1、除了自身进程的共享内存，也包括其他进程的共享内存
2、虽然进程只使用了几个共享库的函数，但它包含了整个共享库的大小
3、计算某个进程所占的物理内存大小公式：RES – SHR
4、swap out后，它将会降下来

### SWAP Swapped size (KB)

The swapped out portion of a task’s total virtual memory image. 

(换出一个任务的总虚拟镜像的一部分)只是说明了交换的内存来自虚拟内存，但没说明把什么样的内存交换出去。

### DATA (KB) -- Data + Stack Size (KiB)

The amount of private memory reserved by a process.  It is also known as the Data Resident Set or DRS.  
Such memory may not yet be mapped to physical  memory  (RES)  but will always be included in the virtual memory (VIRT) amount.


1、数据占用的内存。如果top没有显示，按f键可以显示出来。
2、真正的该程序要求的数据空间，是真正在运行中要使用的。

## top 运行中可以通过 top 的内部命令对进程的显示方式进行控制。内部命令如下：

s – 改变画面更新频率
l – 关闭或开启第一部分第一行 top 信息的表示
t – 关闭或开启第一部分第二行 Tasks 和第三行 Cpus 信息的表示
m – 关闭或开启第一部分第四行 Mem 和 第五行 Swap 信息的表示
N – 以 PID 的大小的顺序排列表示进程列表
P – 以 CPU 占用率大小的顺序排列进程列表
M – 以内存占用率大小的顺序排列进程列表
h – 显示帮助
n – 设置在进程列表所显示进程的数量
q – 退出 top
s – 改变画面更新周期


序号    列名        含义
a       PID         进程id
b       PPID        父进程id
c       RUSER       Real user name
d       UID         进程所有者的用户id
e       USER        进程所有者的用户名
f       GROUP       进程所有者的组名
g       TTY         启动进程的终端名。不是从终端启动的进程则显示为 ?
h       PR          优先级
i       NI          nice值。负值表示高优先级，正值表示低优先级
j       P           最后使用的CPU，仅在多CPU环境下有意义
k       %CPU        上次更新到现在的CPU时间占用百分比
l       TIME        进程使用的CPU时间总计，单位秒
m       TIME+       进程使用的CPU时间总计，单位1/100秒
n       %MEM        进程使用的物理内存百分比
o       VIRT        进程使用的虚拟内存总量，单位kb。VIRT=SWAP+RES
p       SWAP        进程使用的虚拟内存中，被换出的大小，单位kb。
q       RES         进程使用的、未被换出的物理内存大小，单位kb。RES=CODE+DATA
r       CODE        可执行代码占用的物理内存大小，单位kb
s       DATA        可执行代码以外的部分(数据段+栈)占用的物理内存大小，单位kb
t       SHR         共享内存大小，单位kb
u       nFLT        页面错误次数
v       nDRT        最后一次写入到现在，被修改过的页面数。
w       S           进程状态。（D=不可中断的睡眠状态，R=运行，S=睡眠，T=跟踪/停止，Z=僵尸进程）
x       COMMAND     命令名/命令行
y       WCHAN       若该进程在睡眠，则显示睡眠中的系统函数名
z       Flags       任务标志，参考 sched.h

默认情况下仅显示比较重要的 PID、USER、PR、NI、VIRT、RES、SHR、S、%CPU、%MEM、TIME+、COMMAND 列。可以通过下面的快捷键来更改显示内容。

通过 f 键可以选择显示的内容。按 f 键之后会显示列的列表，按 a-z 即可显示或隐藏对应的列，最后按回车键确定。

按 o 键可以改变列的显示顺序。按小写的 a-z 可以将相应的列向右移动，而大写的 A-Z 可以将相应的列向左移动。最后按回车键确定。

按大写的 F 或 O 键，然后按 a-z 可以将进程按照相应的列进行排序。而大写的 R 键可以将当前的排序倒转。






In Linux, a process may be in of these states:

    Runnable (R): A process in this state is either executing on the CPU, or it is present on the run queue, ready to be executed.

    Interruptible sleep (S): Processes in this state are waiting for an event to complete.

    Uninterruptible sleep (D): In this case, a process is waiting for an I/O operation to complete.

    Stopped (T): These processes have been stopped by a job control signal (such as by pressing Ctrl+Z) or because they are being traced.

    Zombie (Z): The kernel maintains various data structures in memory to keep track of processes. 
        A process may create a number of child processes, and they may exit while the parent is still around. 
        However, these data structures must be kept around until the parent obtains the status of the child processes. 
        Such terminated processes whose data structures are still around are called zombies.

    Processes in the D and S states are shown in “sleeping”, and those in the T state are shown in “stopped”. The number of zombies are shown as the “zombie” value.



A process with a high “nice” value is “nicer” to other processes, and gets a low priority.
Similarly, processes with a lower “nice” gets higher priority.



Interrupts are signals to the processor about an event that requires immediate attention. 

Hardware interrupts are typically used by peripherals to tell the system about events, such as a keypress on a keyboard. 

On the other hand, software interrupts are generated due to specific instructions executed on the processor. 

In either case, the OS handles them, and the time spent on handling hardware and software interrupts are given by hi and si respectively.




"Load" is a measure of the amount of computational work a system performs. 
On Linux, the load is the number of processes in the R and D states at any given moment. 
The “load average” value gives you a relative measure of how long you must wait for things to get done.

Let us consider a few examples to understand this concept. On a single core system, a load average of 0.4 
means the system is doing only 40% of work it can do. A load average of 1 means that the system is exactly 
at capacity — the system will be overloaded by adding even a little bit of additional work. A system with 
a load average of 2.12 means that it is overloaded by 112% more work than it can handle.

On a multi-core system, you should first divide the load average with the number of CPU cores to get a similar measure.

In addition, “load average” isn’t actually the typical “average” most of us know. It is an 
“exponential moving average“, which means a small part of the previous load averages are factored into the current value. 
If you’re interested, this article covers all the technical details.


