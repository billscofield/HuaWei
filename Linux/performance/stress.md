## stress

主要用来模拟系统负载较高时的场景



-c, --cpu N                 产生 N 个进程，每个进程都反复不停的计算随机数的平方根
                            spawn([spɔːn] 产卵，大量生产) N workers spinning on sqrt()  (spin /spin/快速螺旋,自旋)

-m, --vm N                  产生 N 个进程，每个进程不断分配和释放内存
                            spawn N workers spinning on malloc()/free()     // mal   loc; malloc()内存分配函数

    --vm-bytes B                指定分配内存的大小
                                malloc B bytes per vm worker (default is 256MB)

    --vm-stride B               不断的给部分内存赋值，让 COW(Copy On Write)发生
                                touch a byte every B bytes (default is 4096)

    --vm-hang N                 指示每个消耗内存的进程在分配到内存后转入睡眠状态 N 秒，然后释放内存，一直重复执行这个过程
                                sleep N secs before free (default none, 0 is inf)

    --vm-keep                   一直占用内存，区别于不断的释放和重新分配(默认是不断释放并重新分配内存)
                                redirty memory instead of freeing and reallocating

-i, --io N                  产生 N 个进程，每个进程反复调用 sync() 将内存上的内容写到硬盘上
                            spawn N workers spinning on sync()


-d, --hadd N                产生 N 个不断执行 write 和 unlink 函数的进程(创建文件，写入内容，删除文件), 通过mkstemp()函数写入当前目录
                            spawn N workers spinning on write()/unlink()

    --hadd-bytes B              指定文件大小
                                write B bytes per hdd worker (default is 1GB)


-t, --timeout N             在 N 秒后结束程序, stress 程序运行多长时间
                            timeout after N seconds

--backoff N                 让新 fork 出来的进程 sleep N 微秒再开始运行。 
                            wait factor of N **microseconds** before work starts


-q, --quiet                 程序在运行的过程中不输出信息

-n, --dry-run               输出程序会做什么而并不实际执行相关的操作
                            show what would have been done


--version                   显示版本号

-v, --verbose               显示详细的信息




Example: stress --cpu 8 --io 4 --vm 2 --vm-bytes 128M --timeout 10s

Note: Numbers may be suffixed with s,m,h,d,y (time) or B,K,M,G (size).

stress --cpu 4

stress --vm 2 --vm-bytes 300M --vm-keep

stress --vm 2 --vm-bytes 500M --vm-hang 5


除了单独指定某一类的选项，还可以同时执行多个类型的任务，比如产生 3 个 CPU 进程、3 个 IO 进程、2 个10M 的 vm 进程，并且每个 vm 进程中不循环分配释放内存：

$ stress --cpu 3 --io 3 --vm 2 --vm-bytes 10M --vm-keep


### 消耗 CPU 资源

stress 消耗 CPU 资源的方式是通过调用 sqrt 函数计算由 rand 函数产生的随机数的平方根实现的。下面的命令会产生 4 个这样的进程不断的进行计算：

stress -c 4
stress --cpu 4


使用 top(uptime) 命令查看 CPU 的状态 和使用 mpstat -P ALL 60 1 查看结果，觉得uptime的结果有点搞不明白，这个是如何平均的

我是4个CPU，只使用1个CPU，mpstat 的ALL结果是25%



