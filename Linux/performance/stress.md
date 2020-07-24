-c, --cpu N                 产生 N 个进程，每个进程都反复不停的计算随机数的平方根
-i, --io N                  产生 N 个进程，每个进程反复调用 sync() 将内存上的内容写到硬盘上
-m, --vm N                  产生 N 个进程，每个进程不断分配和释放内存
--vm-bytes B                指定分配内存的大小
--vm-stride B               不断的给部分内存赋值，让 COW(Copy On Write)发生
    --vm-hang N             指示每个消耗内存的进程在分配到内存后转入睡眠状态 N 秒，然后释放内存，一直重复执行这个过程
    --vm-keep               一直占用内存，区别于不断的释放和重新分配(默认是不断释放并重新分配内存)
-d, --hadd N                产生 N 个不断执行 write 和 unlink 函数的进程(创建文件，写入内容，删除文件)
    --hadd-bytes B          指定文件大小
    -t, --timeout N         在 N 秒后结束程序        
    --backoff N             等待N微妙后开始运行
    -q, --quiet             程序在运行的过程中不输出信息
    -n, --dry-run           输出程序会做什么而并不实际执行相关的操作
    --version               显示版本号
    -v, --verbose           显示详细的信息


### 消耗 CPU 资源

stress 消耗 CPU 资源的方式是通过调用 sqrt 函数计算由 rand 函数产生的随机数的平方根实现的。下面的命令会产生 4 个这样的进程不断的进行计算：

stress -c 1

使用 top(uptime) 命令查看 CPU 的状态 和使用 mpstat -P ALL 60 1 查看结果，觉得uptime的结果有点搞不明白，这个是如何平均的

我是4个CPU，只使用1个CPU，mpstat 的ALL结果是25%，是明白的; 但是uptime竟然是1,是不明白的...



