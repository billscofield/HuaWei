
## 线程的分离状态

线程的分离状态是线程的一种属性，线程的属性结构为：

```
typedef struct

{

int detachstate; //分离状态
int schedpolicy; //调度策略
structsched_param schedparam; //调度参数
int inheritsched; //线程继承性
int scope; //线程作用域
    PTHREAD_SCOPE_SYSTEM    系统范围内竞争, 简称SCS (Linux只支持SCS, 就是1对1模型)
    PTHREAD_SCOPE_PROCESS   进程范围内竞争, 简称PCS
size_t guardsize; //线程栈末尾的警戒缓冲区大小
int stackaddr_set;
void* stackaddr; //线程栈位置
size_t stacksize; //线程栈大小
} pthread_attr_t;


Inherit scheduler
Scheduling priority



```



```
线程的分离状态是指线程的生命结束后资源的回收是否受其他线程或者程序主线程的控制，
默认的线程分离状态为结合状态（join-able），需要由其他线程调用pthread_join(pthread_t
pth, void**rval)等待线程pth终止，并回收线程占用的系统资源，但是等待线程会被阻塞，
直到监控的线程终止。如果没有线程调用pthread_join函数，那么创建的线程资源在程序结束
前不会被系统自动回收。对于detach状态的线程，线程终止后系统会自动回收线程占用的资源。


可以通过pthread_getdetachstate函数获取线程的分离状态，也可以通过pthread_setdetachstate
函数设置线程的分离状态。

```

---

man sched_getscheduler

Normal Scheduling:
    SCHED_OTHER   the standard round-robin time-sharing policy;
    SCHED_BATCH   for "batch" style execution of processes; and
    SCHED_IDLE    for running very low priority background jobs.

    For each of the above policies, param->sched_priority must be 0.

    PR = 20 + Nice      [0,39]
    Nice = [-20,19], default 0; 友好值

    top->PR列 real-time 是显示 rt
    凡是PR值是负数的进程都是 real-time 进程

Various "real-time" policies are also supported, for special time-critical
applications that need precise control over the way in which  runnable threads
are selected for execution.  For the rules governing when a process may use
these policies, see sched(7).  The real-time policies that may be specified in
policy are:

    SCHED_FIFO    a first-in, first-out policy; and
    SCHED_RR      a round-robin policy.

For each of the above policies, param->sched_priority specifies a
scheduling priority for the thread.  This is a  number  in  the range
returned  by  calling  sched_get_priority_min(2) and
sched_get_priority_max(2) with the specified policy.  On Linux, these
system calls return, respectively, 1 and 99.


    PR = -1 - priority_value      = [-100,-2]       还是数字越小优先级越高
    priority_value = [1,99]


|   ------|----------|--|-|------------|-----PR
|       -100        -2 -1 0           39
|   
|   [-100,-2]       real-time
|   -1              priority=0时，表示normal的默认
|   [0,39]          normal default
|


通过 chrt -p 进程号， 返回调度策略和 priority_value


将指定的pid进程切换为实时的进程，并且设置其 priority_value
chrt -f -p 11 pid
    11: priority_value      [1,99]
    -f: FIFO
    


Normal
    抢占式

real-time 永远比 normal 优先级高
    real-time 都是静态优先级
    抢占式
