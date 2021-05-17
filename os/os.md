links:

    https://www.bilibili.com/video/BV1bf4y147PZ?p=12&t=2024

    1. 该课程的所有课程讲义pdf文档均上传至Github，请移步至 github.com#youngyt/LinuxOS_Course

    2. 课程所使用的教材是 Operating System Concepts 9th Edition, Abraham Silberschatz. (有中文版，机械工业出版社出版) 

    3. 课件资料中原创部分在转载时请注明出处，谢谢！ 

    4. 有任何问题可以留言或发邮件至：youngyt@gmail.com 
    作者：Y4NGY
    https://www.bilibili.com/read/cv5786137
    出处： bilibili


## 操作系统

各种操作系统, 简单的复杂的，计算机操作系统是一个复杂的操作系统

计算机系统由硬件、软件和数据组成

ALTAIR 8800为例

    前边是一个 Operating Panel, 一排一排的LED灯(作为输出设备), 一排排的开关(作为输入设备)


Interface(接口，界面)

    硬件-硬件
        USB,HDMI,DP
    软件-硬件
        Instruction(指令集)
    软件-软件
        API(application Programming Interface) 如 stdio.h


    ABI: application binary interface

        和硬件相关, 编译后

    
    跨平台:

        编译前 + 编译后 都要可以跨平台




Virtual Machine

    操作系统向用户提供一个容易理解的计算机(虚拟的计算机), 用户对这个虚拟计算机的操作都会被
    操作系统转成对计算机硬件的操作。

|    Application
|                            Virtual Machine Interface
|    Operating System
|                            Physical Machine Interface
|    Hardware


操作系统能做什么?
    
    从用户的角度:
        提供良好的用户界面
        标准的函数库

    从系统的角度:
        管理资源
            硬件，软件
            申请资源时的冲突


So, what is computer?
    1. OS acts an intermediary between 'user of a computer' and the computer hardware

    1. the purpose of an operating system is to provide an environment in which a user
       can execute programs in a convient and efficient manner.

    1. an OS is software that manages the computer hardware. 

### 计算机系统组成(Computer System Organization)

各个部分通过总线(bus)连接

每个设备还都有一个与之对应的适配器、控制器, 然后这个适配器或控制器通过bus和彼此连在一起。


1. 硬盘

    磁道
    扇区 512Byte
    柱面

    0柱面，0磁头，1扇区  被称为引导扇区, 记录着 MBR(Main Boot Record), 它用于硬盘启动是将系统
    控制全转给用户制定的、在分区表中登记了某个操作系统分区

    MBR 是在分区的时候由软件写入该扇区的，不属于任何系统
    MBR对所有的操作系统一视同仁，具有公共引导的特性


    Bootstrap(本意是靴子上的鞋带)
        谚语：Pull oneself up by one's bootstraps., 引意为不可能的任务
        
        bootloader 载入内存

    中断
        当有随机事件(Event)发生时，CPU收到一个中断(Interrupt)信号, 可以是硬中断或软件中断
            事件一般都是随机的
        
        CPU会停下正在做的事，转而执行中断处理程序，执行完毕后会回到之前被中断的地方继续执行
        
        **OS is an INTERRUPT driven system**


        exception:异常,也是中断

    |   +-------+                   |                                 +-----------+
    |   |process|   exception       |interrupt                        | Process   |
    |   |execu  |------------+      |                        +---->---| executing |
    |   +-------+            |      |                        |        +-----------+
    |                       \|/    \|/                       |
    |                   +------------------+        +------------------+                    user mod
    |  -----------------| enter the kernel |--------| leave the kernel |---------------------------------
    |                   +------------------+        +------------------+                    kernel mod
    |                           |                            |
    |                          \|/                          \|/
    |                       +-----------------------------------+
    |                       |   Exception/Interrupt handler     |
    |                       +-----------------------------------+





    存储系统
        CPU负责将指令(Instruction)从内存(Memory)读入，所以程序必须在内存中才能运行
        
        内存以字节为存储单位，每个字节都有一个地址与之对应。通过 load/store 指令即可访问指定地址的内存数据
            
            load: 将内存数据装入寄存器(Register)
            store: 将寄存器数据写入内存

    存储层次图
        Register            // 寄存器
        Cache               // 缓存
        Main memory         // 内存
        ---
        solid-state disk    // 固态硬盘
        magnetic disk       // 磁盘
        optical disk        // 光盘
        magnetic tapes      // 磁带

        由上到下速度越来越慢，但是容量越来越大
        上三层是易失性存储(Volatile Memory)

    I/O结构
        IO设备是计算机体系结构中种类最丰富的设备类型，而且他有着很强的扩展性
        管理IO设备是操作系统非常重要的组成部分，操作系统中有一个专门的IO子系统负责完成这项工作



|
|                                           +------------+
|                                           |            |
|                                           |            |
|   +--------+      +------------+      +--------+       |      +-----+
|   |   IO   |      | Controller |      | Device | OS    |<---> | CPU |
|   | Device | <--->| Adapter    | <--->| Driver |       |      |     |
|   +--------+      +------------+      +--------+       |      +-----+
|                                           |            |
|                                           |            |
|                                           +------------+
|

    操作系统需要知道这个 Adapter/controller 是如何使用的，需要一个该 Adapter 的驱动程序


### 计算机体系结构

Single-processor System

    只有一颗 CPU, 执行通用指令集

    带有其他专用处理器，为特定设备服务，如：磁盘、键盘、图形控制器等, 如南桥

        他们能够执行的指令有限，不处理用户进程
        
        操作系统会向他们发出任务，并监控他们的状态

Multiprocessor/Multicore System

    有两个或多个紧密通信的CPU, 它们共享计算机总线、时钟、内存和外设等
    
        非对称处理 (Asymmetric multiprocessing)
            有一个主CPU，其他是从CPU
            
        对称处理(Symmetric MultiProcessing,SMP)
            每个CPU 都是独立的，同等地位的

集群系统 Clustered System

    该系统由若干节点(node)通过网络连接在一起，每个节点可为单处理器系统或多处理器系统，节点之间是
    松耦合(loosely coupled) 关系
        
        高可用性(high availability)
        
        高性能计算(high-performance computing)

    就是现在的 Cloud Computing



### 操作系统结构

单用户单道模式
    单道程序不能让CPU和IO设备始终忙碌

多道程序设计
    前提条件：硬件支持
    

分时系统(time sharing), 也称多任务系统(multi tasking), 是多道程序设计的延伸
    允许多个用户共享一台计算机
    用户只有输入和输出设备
    为每个用户轮流分配等量的CPU时间
    用户从发出指令到得到结果的时间称为响应时间, 响应时间和用户数量成正比

    地一个分时系统CTSS由MIT于1962年开发出来

引发的其他模式
    处理器调度(CPU Scheduling)
    交换(Swapping)
        多道程序
    虚拟内存(Virtual Memory)
    磁盘管理(Disk Management)
    同步(Synchronization)
        商量好的，就像接力，一定是前边那个人把接力棒交给我，我才能跑
    异步时间(随机)
        自己想什么时候跑什么时候跑, 容易产生死锁
    死锁(Deadlock)

---

操作系统的服务
    
    为用户
        User Interface
            GUI
            batch 批处理
            Command line
    为程序员
        System Call


    +---------+ +------------+ +---------+ +---------------+ +------------+ +------------+
    |program  | | IO         | | File    | | communication | | Resource   | | accounting |
    |execution| | Operations | | Systems | |               | | allocation | |            |
    +---------+ +------------+ +---------+ +---------------+ +------------+ +------------+
    +---------+ +----------------+ 
    |error    | | protection and |
    |detection| | security       |
    +---------+ +----------------+ 


    almost all operating system have a user interface(UI). It offers a way for users to interface with OS.

    CLI(Command line interface) 
        command interpreter(命令解释器) shell
    GUI(Graphic User interface)
    Batch 
        It is a file which contains commands and directives

    
    系统调用(system calls)
        系统调用的实现代码是操作系统级别的
        程序员也不是直接使用系统调用，而是使用系统调用的接口API间接访问系统调用
        API 是指明了参数和返回值的一组函数

        ```
        printf 是 standard C library 提供的API
        printf 函数(API)的调用引发了对应的系统调用 write 的执行
        write执行结束时的返回值传递回用户程序
        ```


    双重模式(Dual mode)
        现代计算机系统有一个特殊的硬件，用于划分系统的运行状态，至少需要两种单独运行模式:
            用户模式(user mode): 执行用户代码
            内核模式(kernel mode): 执行操作系统代码
        实现方式
            用一个**硬件模式位**表示当前模式：0表示内核模式，1表示用户模式

    运行模式的切换
        系统调用发生在内核模式, 当调用printf时，要使用系统调用write, 会进入内核模式，然后返回用户模式



    Trap Mechanism (陷阱机制)

|   user process
|
|   (user process executing)   (calls system call)
|        -->-------------------+                   +------>---
|                               \                 /                                     user mode(mode bit=1)
| ------------------------------------------------------------------------------
|                          (trap) \             /(return)                               kernel mode(mode bit=0)
|                                  \           /
|                                   +------>--+
|   模式切换                   |----|         |----|
|                               开销           开销

系统调用的实现机制
    
    每一个系统调用都有一个唯一的数字编号(而不是说直接调用比如write)，被称为系统调用号

    用户代码调用API时，API中会向[系统调用接口]指明所要用的系统调用号，操作系统内核中维护了一张索引表，依据这个调用号
    可以检索到系统调用代码在内核中的位置




操作系统的构建方式

    Multics (multiplexed information and computer system) 多路信息计算系统 (多道)

    设计目标

    机制与策略的分离
        机制(mechanism):如何做,    CPU调度
        策略(policy): 做什么
        微内核操作系统 Mach、Darwin -> macos



GNU/Linux
    open-source
    closed-source
    hybrid operating system(混合的)

    source code VS binary code
    源代码          二进制

    
    Debian
        for those seeking a truly free Linux distribution with no proprietary drivers, firmware of software, 
        then Debian is for you. The grandfather of Linux.
    Arch
        A rolling release distribution meaning that you don't have to install new versions of the operating system
        at any point because it updates itself.



## 进程概念

进程的定义

    A program is a passive(被动的) entity, such as a file containing a list of instructions stored 
    on disk(often called an executable file)
        被动的，不会自己运行起来

    A program becomes a process when an executable file is loaded into memory

    A process is an active entity, with a program counter(程序计数器) specifing the next instruction
    to execute a set of associated resources

        程序计数器(PC)是一个CPU中的寄存器,里面存放下一跳要执行指令的内存地址，

    
    +-----------+
    |   stack   |       栈内存: 用于存放局部变量，函数返回地址
    +-----------+
    | \|/       |
    |           |
    |     /|\   |
    +-----------+
    |   heap    |       堆内存: 用于程序**运行时(runtime)**的动态内存分配, 用malloc函数申请内存
    +-----------+
    |   data    |       全局和静态变量数据
    +-----------+
    |   text    |       代码
    +-----------+

    栈内存和堆内存其实占用的是一块内存空间，只是stack是从上往下增长，而heap是从下往上增长


    并发的进程
        Concurrency: the fact of two or more events or circumstances(环境、状态) happening or existing at the same time.
            同一个时间存在 exist
            
        与“并行”的区别
            同时在运行, running
            
        进程并发的动机: 多道程序设计

    并发进程共享CPU
        并发进程可能无法一次性执行完毕，会走走停停
        一个进程在执行过程中可能会被另一个进程替换占有CPU,这个过程叫做"进程切换"
        
        process 1       -------      ---   ---- -----
        process 2              --       -                   进程切换switch
        process 3                --      --    -  

    进程是资源分配、保护和调度的基本单位


进程的状态(Process state)
    进程在执行期间自身的状态
    有三种基本状态
        运行态(running)    
        就绪态(ready)   : 等待分配CPU
        等待态(waiting) : 进程在等待某些时间的发生(比如IO操作结束或是一个信号)
        
        ```
        a = 1
        printf('hello')         // 在向屏幕输出，进行IO操作，假如很漫长，会进入等待状态，让出CPU
        b = 1
        
        ```
            
        new
        finish
        
        这是5种状态的,还有7种状态的

进程何时离开CPU
    内部事件
        进程主动放弃(yield)CPU， 进入等待/终止状态(所有的IO操作都是这样设定的，进行IO操作就会主动放弃CPU)
        E.g 使用I/O设备，(非)正常结束
    外部事件
        进程被剥夺CPU使用权，进入就绪状态，这个动作叫[抢占(preempt)]
        E.g 时间片到达，高优先权进程到达


## 进程调度(Process scheduling)

是什么触发了进程切换?

进程切换时，CPU做了什么?

中断源
    外中断: 来自CPU之外的硬件中断信号(一般直接称之为中断)
        如时钟中断，键盘中断，外围设备中断
        外部中断均是异步中断(随机的)
    
    内中断(异常Exception): 来自CPU内部，指令执行过程中发生的终端，属于同步中断
        硬件异常：掉电，奇偶校验错误
        程序异常：非法操作，地址越界，断点，除数为灵
        系统调用


    | mode switch
    |
    |   +-------+                   |                                 +-----------+
    |   |process|   exception       |interrupt                        | Process   |
    |   |execu  |------------+      |                        +---->---| executing |
    |   +-------+            |      |                        |        +-----------+
    |                       \|/    \|/                       |                                  user mod
    |                   +-------------------+        +------------------------------------------------+                    
    |  -----------------| saving the context|--------| 1. select a process to restarot and resume     |------------------
    |          Trap     | of the executing  |        | 2. restore the context of the selected process |
    |                   |                   |        | 3. resume excution of the selected process     |
    |                   +-------------------+        +------------------------------------------------+
    |                           |                           /|\ LPSW (内核模式回到用户模式指令)        kernel mod
    |                          \|/                           |
    |                       +------------------------------------------------------+
    |                       | 1. Determing the cause of the exception or interrupt |
    |                       | 2. handle the exception/interrupt                    |
    |                       +------------------------------------------------------+


    特权指令和非特权指令
        Privileged Instruction
            The instructions that can run only in Kernel Mode are called Privileged Instructions
                1. I/O instructions and Halt in instructions
                2. Turn off all interrupts
                3. Set the Timer
                4. Process switching
        Non-Privileged Instructions
            The Instructions that can run only in User Mode are called Non-Privileged Instructions

        中断是用户态向核心态转换的唯一途径。系统调用实质上也是有一种中断
        
        OS 提供 Load PSW 指令装载用户进程返回用户状态

    
    切换过程
        保存被终端进程的上下文信息(context)
        修改被中断进程的控制信息(如状态等)
        将被中断的进程加入相应的状态队列
        调度一个新的进程并回复他的上下文信息

    进程控制块
        每一个进程都有一块区域存放该进程的控制信息,这个区域叫做 [进程控制块]
        A process Control Block(PCB) contains many pieces of information associated with a specifit process.
        
        +--------------------+
        | process state      |      就绪，执行，等待
        +--------------------+
        | process number     |      pid
        +--------------------+
        | program counter    |      下一跳要执行的指令
        +--------------------+
        | registers          |      寄存器的值
        +--------------------+
        | memory limits      |      
        +--------------------+
        | list of open files |
        +--------------------+
        | ...                |
        +--------------------+

    一个完整的进程, 进程上下文
        +---------------
        | PCB
        +---------------
        | Stack
        +---------------
        | heap
        +---------------
        | data
        +---------------
        | text
        +---------------

        进程队列，是交叉离散存放的
        +---------------
        | PCB 1
        +---------------
        | Stack 2
        +---------------
        | heap 3
        +---------------
        | data 2 
        +---------------
        | text 1 
        +---------------
        | PCB 3
        +---------------
        | ...
        +---------------


    进程队列(Process queues)

        就绪队列
            只是连接了PCB
        
        等待队列


    |   ```
    |   #include <stdio.h>
    |   #include <sys/types.h>          // /usr/include/x86_64-linux-gnu/sys/types.h
    |   #include <unistd.h>             // 是C和C++程序设计语言中提供对  POSIX 操作系统API的访问功能的头文件的名称。
    |                                   // 对于类 Unix 系统，unistd.h 中所定义的接口通常都是大量针对系统调用的封装（英语：wrapper functions），如 fork、pipe 以及各种 I/O 原语（read、write、close 等等）。
    |                                   // 此处是调用 fork 函数
    |
    |   int main(int argc, char const *argv[]){
    |       pid_t pid;                  // pid_t定义的类型都是进程号类型
    |       pid_t cid;
    |       
    |       printf("Before fork Process id: %d\n", getpid());
    |
    |       fork();                     // fork: 分叉, fork 下边的代码会执行两边，父进程和子进程都会执行，并发地执行
    |
    |       printf("After fork Process id: %d\n", getpid());
    |
    |       pause();
    |
    |       return 0;
    |   }
    |
    |   ```

    进程调度

    ready queue ------------->------------------CPU----->--     
    |                                              ----->-+
    |                                                     |
    IO ---- < IO queue       <      IO request  --------<-+
    |                                                     |
    |                                                     |
   /|\ ----------------------<     time slice expired --<-+
    |                                                     |
    |                                                     |
    |  <   child executes    <     fork a child  -------<-+
    |                                                     |
    |                                                     |
    +  <   interrupt occurs  <     wait for an interrupt<-+





### Trhead 线程


    +-----------+       +-----------+
    |   stack   |       |   stack   |
    +-----------+       +-----------+
    |   heap    |       |   heap    |
    +-----------+       +-----------+
    |   data    |       |   data    |
    +-----------+       +-----------+
    |  执行流1  |       |  执行流2  |
    +-----------+       +-----------+


    好处: 得到两个执行流[并发的]
    略势：浪费资源，一个很小的任务，都要完全复制

    所以引入线程的概念

    
    +-----------+
    |   stack   |
    +-----------+
    |   heap    |
    +-----------+
    |   data    |
    +-----------+
    |执行流1 & 2|   在同一个进程中实现两个并发的执行流, 叫做线程
    +-----------+

    线程: 进程当中的执行流



    拷贝数据的例子


|   +--------+-----------+  用户发出取消拷贝指令，线程2进入就绪队列等待执行，以便取消线程1
|   |        |           |  4               3
|   | 线程1  | 线程2     |------>  CPU   cpu 去执行其他任务
|   | copy   | waitAbort |         /|\
|   +--------+-----------+          |
|       |                     1     |
|       +---------------------------+ 
|       | 2, 然后线程1 进入 wait 状态
|      \|/
|    Disk Copy


    也可一开一个子进程，但是
        线程更加省资源
        线程间通信也更省资源


    动机:

        一个应用通常需要同时处理很多工作，比如web浏览器,可能需要同时处理文字、图片、视频,
        这些同时执行的任务可称为“执行流”， 我们不希望他们是顺序执行的
        
        早期，每个执行流都要创建一个进程来实现，的那是进程的创建需要消耗大量的时间和资源
        
        还需要硬件的支持，如多个CPU，或者1个CPU多个核心
        
        现在, 和一个应用相关的所有执行任务都装在一个进程里，这些进程内部的执行任务就是
        "线程"(Thread)



    +------------------------+
    |  code |   data | files |  
    +------------------------+
    |register|stach|heap |...|
    +------------------------+          单线程
    |                        |
    |       thread   \|/     |
    |                        |
    +------------------------+



    +------------------------+
    |  code |   data | files |  共享的 data:全局变量,静态变量; code:代码; files: 打开的文件 
    +------------------------+
    | stack    |  stack      |  非共享的, 局部变量，函数返回值
    +----------+-------------+          
    |          |             |
    | thread1  | thread2 |...|  多线程
    |          |             |
    +------------------------+

    
    多线程的优点:
        响应性: 响应速度快, 不需要重新开辟内存，复制
        资源共享
        经济: 避免浪费资源，进程切换
        可伸缩性: 多核, 可以实现并行

    A thread is a basic unit of CUP utilization(利用); 
    it comprises a thread id, a program counter, a register set, and a stack
    
    It shares with other threads belonging to the same process its 
    code section,  data section, and other operating-system resources,such as open files and signals

    A traditional (or heavyweight) process has a single thread of control. 
    If a process has multiple threads of control, it can perform more than one task at a time
        heavyweight 重量级
        lightweight 轻量级






多线程模型
    links:
        http://c.biancheng.net/view/1220.html
    
    多核编程
        在多处理器系统中，多核心编程机制让应用程序可以更有效地将自身的多个执行任务(并发的线程)
        分散到不同的处理器上运行，以实现并行计算
        
        
        single core:        T1  T2  T3  T4  T1  T2  T3  T4  T1  T2  ...
        
        --------->-------Time------------->-------
        
        core 1              T1  T3  T1  T3  ...
        
        core 2              T2  T4  T2  T4  ...
        
        
        用户线程ULT(User Level Thread)
        内核线程KLT(Kernel Level Thread)




    Many:1 模型

    |   userThread1 userThread2 userThread3 ...             线程1、2、3 可能是多个进程的线程
    |           \       |       /
    |            \      |      /
    |             \     |     /
    |            kernel thread 1                            单核CPU


    1:1 模型
        每一个用户线程和一个核心线程一一对应
        
        好处：带来真正的并行运算
        缺点：内核开销(时间和空间上)
            建一个用户线程就要创建一个相应的内核线程。由于创建内核线程的开销会影响应用程序的性能，
            所以这种模型的大多数实现限制了系统支持的线程数量。

    M:M 模型

        KLT 的数量肯定是小于 CPU 的数量, KLT 去争夺CPU的时间，KLT 相当于用户线程的代理人
        
        
        多路复用多个用户级线程到同样数量或更少数量的内核线程。内核线程的数量可能与特定应用程序
        或特定机器有关（应用程序在多处理器上比在单处理器上可能分配到更多数量的线程）。
        
        现在我们考虑一下这些设计对并发性的影响。虽然多对一模型允许开发人员创建任意多的用户线程，
        但是由于内核只能一次调度一个线程，所以并未增加并发性。虽然一对一模型提供了更大的并发性，
        但是开发人员应小心，不要在应用程序内创建太多线程（有时系统可能会限制创建线程的数量）。
     
        多对多模型没有这两个缺点：开发人员可以创建任意多的用户线程，并且相应内核线程能在多处理
        器系统上并发执行。而且，当一个线程执行阻塞系统调用时，内核可以调度另一个线程来执行。
     
        多对多模型的一种变种仍然多路复用多个用户级线程到同样数量或更少数量的内核线程，但也允许
        绑定某个用户线程到一个内核线程。这个变种，有时称为双层模型

    |
    |   ULT1 ULT2 ULT3      ULT4            用户线程
    |    \    |    /         |
    |     \   |   /          |
    |      \  |  /           |
    |       \ | /            |
    |         +              |              多了一层管理层，实现起来较为复杂
    |        / \             |
    |    KLT1   KLT2       KLT3             内核线程

        M:M 模型历史上叫做  NGPT(Netxt Generation POSIX Threads)
        1:1 模型历史上叫做  NPTL(Native POSIX Thread Library) 原生
            可以看wiki
                The NGPT project was subsequently abandoned in mid-2003 after merging its best feature into NPTL;
                所以现在是1：1模型


线程库    
    
    Thread Library 为程序员提供创建和管理线程的API
        POSIX Pthreads: POSIX用户线程库和内核线程库(POSIX threads)
        Windows Threads: windows 内核线程库
        Java Threads: 依据所依赖的操作系统而定

    Pthreads 是 POSIX 标准定义的线程创建与同步API。不同的操作系统对该标准的实现不禁相同
    

实验1
    使用Pthreads库创建多个线程，并观察线程的并发执行现象以及数据共享关系

实验2
    Monte Carlo 技术计算Pi值(多线程)
        Pi = 4 x 圆内点数/总的点数

    主线程结束，会回收所有的资源，所以如果没有 pthread_join(等待子线程执行完毕), 子线程的输出就没有去执行了
        a.c 是正常的情况
        b.c 是主线程没有等待子线程执行的情况

    <stdlib.h>      rand() 随机数
    <time.h>


## CPU Scheduling (CPU 调度)

    burst: 突发，迸发

    load store      |
    add store       |--> CPU burst
    read from file  |



    +------------+
    |wait for I/O|      I/O burst
    +------------+




    长进程: 占用CPU时间长的
    短进程: 占用CPU时间短的


    |       <CPU-BURST Duration>

   /|\ frequency
    |
    |
    |  
    | .
    |..
    |...
    |...
    |...
    |...
    |...................
    |........................................
    +------------------------------------------------>  
        8   16  24  32  40
        burst duration(millionseconds)

    很少部分程序所需CUP时长8ms之内，叫做CPU-bound program cpu密集型程序
    8ms之外的一些程序叫做 I/O-bound program, I/O 密集型程序


    CPU-bound program: 
    I/O-bound program: 

    





CPU 调度程序

    Whenever the CUP becomes idle, the operating system must select one of the processes in the ready queue
    to be excuted. The selection proess is carried out by the CPU schedule.(基于单处理器)

    抢占调度 

    非抢占调度 
        一旦某个进程的到CPU，就会一直占用到终止或等待(比如自己要I/O)状态。调度程序不会把它赶出去




CPU调度准则
    
    一个调度程序




调度算法性能的衡量

    CUP利用率
    响应时间: 从提交任务到第一次响应的时间。(交互系统)
    等待时间(Waiting time)    : 进程**累计在就绪队列**中等待的时间
    周转时间(Turn Around Time): 从提交到完成的时间

    吞吐率  : 每个时钟单位处理的任务数
    公平性  : 以合理的方式让各个进程共享CPU. 避免某些进程的不到CPU，导致饥饿现象



    --->---------->------>------>------->terminated
    提交   等待1    CPU1   等待2   CPU2


    作业(job) == 进程(process)
    假设作业i提交给系统的时刻是Ts, 完成的时刻是Tf, 所需运行时间是Tk, 那么:
        周转时间 Ti = Tf - Ts 
       
        平均作业周转时间T(假设并发了n个job)
        T = 并发的作业的平均值 


### 调度算法

FCFS(First-Come, First-Served) 先来先服务, 先进先出
    
    早期系统里，FCFS意味着一个程序会一直运行到结束(即使出现等待IO的情况,也会一直占用CPU)
    如今，当一个程序阻塞时，会让出CPU，进入等待/阻塞队列

    是**非抢占式**调度算法

    例题:
    
    3个Job所需CPU时间
    Process     Time
    P1          28
    P2          9
    P3          3
    
    如果三个进程的到达顺序是: P1, P2, P3
    
    +-------------+---------+-----+
    | P1          | P2      | P3  |
    +-------------+---------+-----+
    0            28        37    40
    
    
    等待时间分别是: P1=0; P2=28; P3=37
   
    平均等待时间是: (0+28+37)/3 = 22
    平均作业周转时间: (28+37+40)/3 = 35


    如果三个进程的到达顺序是: P1, P2, P3
    
    +-----+--------+-------------+
    | P3  |   P2   |         P3  |
    +-----+--------+-------------+
    0     3        12            40
    
    
    等待时间分别是: P3=0; P2=3; P1=12
   
    平均等待时间是: (0+3+12)/3 = 5
    平均作业周转时间: (3+12+40)/3 = 18


    显然第二种排列方式比第一种好，平均作业周转时间缩短为18
    
    FCFS的优缺点:
        系统默认的调度算法
        简单易行
        如果短作业处在长作业的后面将导致**周围时间变长**。如同超市排队结算



时间片轮转(Round robin), 简写为 RR
    robin n. 知更鸟

    针对分时系统(Time Sharing System) 

    每个进程都可以的到相同的CPU时间(CPU时间片，time slice), 当时间片到达，进程将
    被剥夺 CPU 并加入到就绪队列的尾部

    是抢占式调度算法

        假设就绪队列中有n个进程，时间片为q
        
        每个进程获得 1/n 的CPU时间，大约是q个时间单位
        
        没有进程等待时间会超过(n-1)q

    例题(时间片=20)
        
        Process         CPU Time
        P1              68
        P2              53
        P3              24
        P4              8
        
        +---------------------------------------------------+
        | P1 | P2 | P3 | P4| P1 | P2 | P3 | P1 |   P2|  P1  |
        +---------------------------------------------------+
        0   20   40   60   68  88   108  112  132   145     153
        
        等待时间：
            P1=(68-20)+(112-88)+(145-132)=85
            P2=20 + (88-40) + (132-108) = 92
            P3=40 + (108-60) = 88
            P4=60
        平均等待时间 = (85+92+88+60)/4=81.25
        平均周转时间 = (153 + 145 + 112 + 68)/4 = 119.5


    RR算法分析
        时间片(time slice)选取
            取值太小: 进程切换开销显著增大(不能小于进程切换的时间)
            取值太大: 响应速度下降(取值无穷大将退化成FCFS)
            一般的时间片取值范围:10ms-100ms
            上下文切换的时间大概是0.1ms-1ms(1%的CPU时间片开销)
        RR算法优点
            公平
        RR算法缺点
            对长作业带来额外的切换开销

    比较FCFS和RR

        10 个进程，每个花费100个CPU时间
            假设RR时间片为1
            所有进程同时在就绪队列中
            
        结束时间
            +--------+--------+-----+
            | 进程号 |  FCFS  | RR  |
            +--------+--------+-----+
            | 1      |  100   | 901 |
            +--------+--------+-----+
            | 2      |  200   | 902 |
            +--------+--------+-----+
            | ...    |  ...   | ... |
            +--------+--------+-----+
            | 99     |  900   | 999 |
            +--------+--------+-----+
            | 100    |  1000  | 1000|
            +--------+--------+-----+
            
            RR 的周转时间更加糟糕




最短作业优先(SJF)   Shortest Job First

    下一次调度总是选择所需要CPU时间最短的那个作业(进程).

    假设非抢占式

        到达系统时间        所需CUP时间
    P1     0                8
    P2     1                4
    P3     2                9
    P4     3                5
        
        +----------------------------------+
        | P1    | p2 |  P4    |     P3     |
        +----------------------------------+
        0       8   12       17            26

    也可以改造成抢占式SRTF


    SJF/SRTF 算法分析
        该算法总是将短进程移到长进程之前执行，因此平均的等待时间最小
        
        饥饿现象: 长进程可能长时间无法获得CU
        
        预测技术
            该算法需要事先知道进程所需的CPU时间
            预测一个进程的CPU时间并非易事
            
        优点:
            优化了响应时间
        缺点:
            难以预测作业CPU时间(很难实现)
            不公平算法
    


优先级调度(Priority)

    优先级通常为固定区间的数字，如[0,10]

        数字的大小与优先级高低的关系在不同的系统中实现不一样，
        Linux中，0为最高优先级, 数字越小，优先级越高

    调度策略
        下一次调度总是选择优先级最高的进程
        
        SJF 是优先级调度的一个特例，CPU时间越短越优先

    优先级调度可以是抢占式，也可以是非抢占式


    优先级的定义
        静态优先级
            优先级保持不变，但会出现不公平(饥饿)现象
            
        动态优先级(退化Aging)
            根据进程占用CPU时间：当进程占有CPU时间愈长，则慢慢降低它的优先级
            根据进程占用CPU时间：当进程在就绪队列中等待时间愈长，则慢慢提升它的优先级


没有最好的算法，只有最合适的算法



长程调度
    将硬盘上的程序调度到内存

CPU调度(短程调度)
    将内存上的程序和CPU之间互相调度
    
中程调度
    和swap有关



### 线程调度


thread 

ps -eLf
    -L     Show threads, possibly with LWP and NLWP columns.


### 并发进程之间的关系

独立关系
    并发进程分别在自己的变量集合上运行,如 chrome 和 music

交互关系
    并发进程执行过程中需要共享或交换数据
    交互的并发进程之间存在[竞争]和[协作]的关系


需要交互的进程
    竞争(race)
        critical section 临界区
        Race Condition 竞争条件

    协作(cooperation)
    

异步 Asynchronous means RANDOM(随机，随行)
    
    竞争条件(race condition,翻译成竞争情况会更好): 多个进程并发操作同一个数据
    导致执行结果依赖于特定的进程执行顺序。

    交互的进程不能让其随意进行，需要同步协作

同步
    Process Synchronization means a mechanism to maintain the cosistency of data(数据一致性)
    shared in cooperative process.
    
    
    同步工具
        Mutex lock  互斥锁
        Semaphore   信号量




#### 临界区问题 Critical(关键的)-section problem


each concurrent process has a segment of code, called a critical section, in which the process
may be changing common variables, updating a table, writing a file, and so on.
访问公共区域的一段代码, 

the important feature of the system is that, when one process is executing in its critical
section, no other process is allowed to execute in its critical section. That is, no two 
processes are executing in their critical sections at the same time.


The critical-section problem is to design a protocol that the processes can use to cooperate


进程进出临界区协议

```
do {
    entry section           // 进程进入临界区前要在 entry section 请求许可
        critical section
    exit section
    remainder section       // 离开临界区后在 exit section 要归还许可
}
```

临界区管理准则
    
    Mutual 相互的 exclusion 排斥 (Mutex): 互斥
    Progress: 前进,进步, 如果临界区没有程序，就一定能放一个进程进去
    Bounded waiting: 有限等待(等待时间不能是无限的)

    有空让进
    择一而入
    无空等待
    有限等待
    让权等待(临界区中的进程不能无限使用)


    喂金鱼
        撑死
        饿死

    对于计算机而言，饿死更好一些


    软件解决临界区管理
        需要较高的编程技巧
        连个进程的实现代码是不对称的
        两个住梦的软件爱你方案
            Peterson
            Dekker






#### 互斥锁 MUTEX LOCKS

Operating-systems designers build software tools to solve the critical-section proble.
This simplest of these tools is the mutex lock.

    A process must acquire the lock before entering a critical section

    It must release the lock when it exits the critical section

    


Alice               Tom

lock()              lock()                上锁:等待锁至打开状态；获得锁并上锁
if (no feed){       if(no feed){        |
    feed fish       feed fish           | 临界区
}                   }                   |

leave lock()        leave lock()



原子操作(原语) atomic operations
    Mean the operation can NOT be interrupted while it's running

原子操作(原语)是操作系统重要的组成部分，下面2条硬件指令都是原子操作，他们可以被用来
实现对临界区的管理(也就是锁)
    
    test_and_set()
    compare_and_swap()


    ```
    bool ts(bool* target){              就是 test_and_set()
        bool result = *target
        *target = false;
        return result;                  总是返回传进去的那个值，传进去的那个值总是被置为false
    }
    完成了两个操作，test和set， 这个是不会被打断的




    bool availabel = true;  // unclocked



    第一第二个进程分别来执行这段语句, 试着分析
    lock(){
        while(!ts(&available))                      // 是占用cpu的，忙式等待
            do nothing;
    }

    unlock(){
        available = true;
    }
    ```



    忙式等待(Busy Waiting) 
        占用CPU执行空循环实现等待
       
    这种类型的互斥锁也被称为"自旋锁(spin lock)"
        缺点: 浪费CPU周期，可以将进程插入等待队列以让出CPU的使用权
        
        优点: 进程在等待时没有上下文切换，对于使用锁时间不长的进程，自旋锁还是可以接受的;在
        多处理器系统中，自旋锁的优势更加明显。
        
        自旋锁的时间可能比进程切换更少


    进程锁和线程锁是不一样的

    ```
    pthread_mutex_t lock=PTHREAD_MUTEX_INITIALIZER;             // 创建一个锁

    pthread_mutex_lock(&lock);                                  // 上锁
    pthread_mutex_unlock(&lock);                                // 开锁
    ```


### 信号量

竞争是特殊的协作关系

信号量主要用来解决协作关系, 特殊情况下也可以解决竞争关系

信号量(Semaphore)是一种比互斥锁更强大的同步工具，他可以提供更高级的方法来同步并发操作
    1965年由荷兰Dijkstra提出

A semaphore S is an integer variable that, apart from initialization, is accessed only through two
standard atomic operations: 除了初始化你可以操作外，其他时候只能被这两个原子操作来操作
    P(proberen in Dutch)  荷兰语:测试
    V(verhogen in Dutch)  荷兰语:增加

P: wait()   operation
V: signal() operation

PV操作是原子操作
    


信号量的实现

    ```
    P(s信号量){                 测试和0的关系，小于零，等待;大于零，减去1
        while(s<=0)             减去1, 表示关灯，对别人不可用, 同上节
            do nothing;
        s--;
    }


    V(s信号量){                 增加1, 表示可用
        s++;
    }
    ```

    s value     |        s<=0       |       s=1     |    s>1
    P(s)        |    busy waiting   |       s=0     |   s=s-1
    V(s)        |       s=s+1       |       s=2     |   s=s+1


信号量的使用
    Binary Semaphore 二值信号量

        二值信号量的值只能是0或1,通常将其初始化为1,用于实现互斥锁的功能
        
        semaphore mutex = 1;
        process Pi{
            P(mutex);
            critical sectiion
            V(mutex);
        }

    Counting Semaphore 一般信号量
        可以取值任何值，用于控制并发进程对共享资源的访问
        
        semaphore road = 2;         只能有两个人来访问使用资源
        process CARi{
            P(road);
            
            pass the fork
            in the road
            
            V(road);
        }

    PV 操作必须是成对出现的，否则信号量的值不能回到初始值



## P20 进程和内存空间


交替执行的是指令，而不是程序

```
cat a.c
#include <stdio.h>

int sum(int x, int y){
  3     return x * y;
  4 


int main(void){
  7     sum(2,3);
  8     return 0;
  9 
}

gcc -g -c a.c
    -g  用于调试

objdump -d a.o


a.o:     file format elf64-x86-64

反汇编代码如下:
Disassembly of section .text:

0000000000000000 <sum>:                                 起始地址
 0:   55                      push   %rbp                   
 1:   48 89 e5                mov    %rsp,%rbp
 4:   89 7d fc                mov    %edi,-0x4(%rbp)
 7:   89 75 f8                mov    %esi,-0x8(%rbp)
 a:   8b 45 fc                mov    -0x4(%rbp),%eax
 d:   0f af 45 f8             imul   -0x8(%rbp),%eax
11:   5d                      pop    %rbp
12:   c3                      retq

0000000000000013 <main>:                                起始地址
13:   55                      push   %rbp
14:   48 89 e5                mov    %rsp,%rbp
17:   be 03 00 00 00          mov    $0x3,%esi          参数
1c:   bf 02 00 00 00          mov    $0x2,%edi          参数
21:   e8 00 00 00 00          callq  26 <main+0x13>     调用
26:   b8 00 00 00 00          mov    $0x0,%eax          主函数的return
2b:   5d                      pop    %rbp               主函数的return
2c:   c3                      retq                      主函数的return

```

$1 最左边的0:,1:,... 都是16进制逻辑地址(虚拟地址)
    都是从0开始
    
$4 列是汇编指令
$2 列是汇编指令对应的机器代码
    一个16进制占用 1 Byte



gcc a.c

objdump -d a.out


物理地址是内存单元看到的地址
    CPU 在执行指令的时候，比如上面的 call 660, 会先将逻辑地址经过一个 MMU(Memory Management Unit)
    进行计算得出物理地址

    物理地址 = 基址 + 逻辑地址


进程的内存映射
    以32位机器为例，地址总线32位，寻址空间4GB
    每一个进程都可以获得一个4GB 的逻辑空间(虚拟空间)
    内核空间和用户空间

|   0xFFFFFFFF  +---------------+
|               | Kernel Space  |
|    1GB        | Virtual add   |
|   0xC0000000  +---------------+
|               |               |
|               |               |
|               | User Space    |
|    1GB        | Virtual add   |
|               |               |
|               +---------------+

|               +---------------+
|               | Stack 
|               |   \|/
|               |   
|               +---------------+


cat /proc/PID号/status
cat /proc/PID号/maps

➜  liu cat /proc/2139/maps
56379fe7a000-56379fe7b000 r--p 00000000 08:01 4196955                    /root/liu/a.out
...
7ff5b399c000-7ff5b39e8000 r--p 0016a000 08:01 1182550                    /usr/lib/x86_64-linux-gnu/libc-2.28.so
...
7ffd353b3000-7ffd353d4000 rw-p 00000000 00:00 0                          [stack]
7ffd353dd000-7ffd353e0000 r--p 00000000 00:00 0                          [vvar]
7ffd353e0000-7ffd353e2000 r-xp 00000000 00:00 0                          [vdso]

地址范围                  权限  偏移量  设备号  inode                    相关的文件


