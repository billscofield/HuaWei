
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
|   模式切换


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
    |   heap    |       堆内存: 用于程序**运行时(runtime)**的动态内存分配
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

        ```

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











