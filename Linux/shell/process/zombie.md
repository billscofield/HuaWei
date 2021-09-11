ps -A/-e -ostat,ppid,pid,cmd | grep -e '^[Zz]'

命令注解：

    -A 参数列出所有进程

    -o 自定义输出字段，我们设定显示字段为stat（状态），ppid（父进程pid），pid（进程pid），cmd（命令行）这四个参数

因为状态为 z 或者 Z的进程为僵尸进程，所以我们使用grep 抓取stat 状态为zZ进程；

运行结果如下所示：

    Z 12334 12339 /path/cmd

这时，我们可以使用kill -HUP 12339 来杀掉这个僵尸进程；

运行后，在此运行ps -A/-e -ostat,ppid,pid,cmd | grep -e '^[Zz]' 来确认是否将僵尸进程杀死；

如果kill 子进程的无效，可以尝试kill 其父进程来解决问题，例如上面父进程pid 为12334，那么我们就运行 kill -HUP 12334 来解决问题；
