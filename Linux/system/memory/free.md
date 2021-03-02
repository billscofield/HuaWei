links:
    
    https://www.cnblogs.com/ultranms/p/9254160.html

    https://www.cnblogs.com/pc-boke/articles/10213695.html

### free 
 
|          total    used     free   shared  buff/cache   available
| Mem:     7.8Gi   440Mi    5.9Gi     51Mi       1.5Gi       7.0Gi
| Swap:    974Mi      0B    974Mi
|



Linux服务器运行一段时间后，由于其内存管理机制，会将暂时不用的内存转为buff/cache，
这样在程序使用到这一部分数据时，能够很快的取出，从而提高系统的运行效率，所以这也
正是linux内存管理中非常出色的一点，所以乍一看内存剩余的非常少，但是在程序真正需
要内存空间时，linux会将缓存让出给程序使用，这样达到对内存的最充分利用，所以真正
剩余的内存是 free+buff/cache#

**但是有些时候大量的缓存占据空间，这时候应用程序会去使用swap交换空间，从而使系统变慢，
这时候需要手动去释放内存，释放内存的时候。**


说到清理内存，那么不得不提到/proc这一个虚拟文件系统，这里面的数据和文件都是内存中
的实时数据，很多参数的获取都可以从下面相应的文件中得到，比如查看某一进程占用的内
存大小和各项参数，cpu和主板的详细信息，显卡的参数等等；相应的关于内存的管理方式是
在 **/proc/sys/vm/drop_chches** 文件中，一定要注意这个文件中存放的并不是具体的内存内容，
而是 0-3 这几个数字，通过文件大小只有1B也可以知道，而这些代号分别告诉系统代表不同的含义如下：

    

    /proc/sys/vm/drop_caches
    ```
    0：是系统默认值，默认情况下表示不释放内存，由操作系统自动管理

    1：释放页缓存

    2：释放dentries和inodes

    3：释放所有缓存
    ```

    请首先执行  sync 


所以根据上面的说明，分别将1,2,3这3个数字重定向到drop_caches中可以实现内存的释放，
一般释放内存都是重定向 3 到文件中，释放所有的缓存


```Problems

cat: /proc/sys/vm/drop_caches: Permission denied            // debian

ll /proc/sys/vm/drop_caches         
-rw-r--r-- 1 root root 0 Mar  2 11:24 /proc/sys/vm/drop_caches  // centos 有 r 权限

--w------- 1 root root 0 Mar  2 11:38 /proc/sys/vm/drop_caches  // debian 只有 w 权限






echo 0 > /proc/sys/vm/drop_caches                           // debian and centos 
bash: echo: write error: Invalid argument

个人理解：“0”只是初始值(虚拟值)，而设置成“1”或“2”或“3”，只是去执行清理相应缓存的一个动作，
而不是状态，所以没必要再将/proc/sys/vm/drop_caches设置为0。另外，Linux的drop_caches只给了
使用者三个选项1，2，3；所以当赋值0的时候系统报“无效论证”，因为0只能给系统用

```

一：只释放页缓存，

1、 free -h 查看当前内存剩余

2、linux查看哪些进程用了swap

    iostat 查看 SWAPIN 列和 COMMAND 列

3、首先写缓存到文件系统:

    sync

4、释放内存(页缓存buff/cache)：

    echo 1 > /proc/sys/vm/drop_caches

5、查看内存剩余：

　　

　　会发现内存被释放了，可用内存确实变为1.8G左右

6、到这里内存就释放完了，现在drop_caches中的值为1，如果现在想让操作系统重新分配内存，那么设置drop_caches的值为0即可：

echo 0 > /proc/sys/vm/drop_caches
　　另外需要注意的是，在生产环境中的服务器我们不要频繁的去释放内存，只在必要时候清理内存即可，更重要的是我们应该从应用程序层面去优化内存的利用和释放，经常清理内存可能只是暂时屏蔽的应用程序中的一些bug，所以更重要的是程序的调优，其他的交给操作系统来管理
