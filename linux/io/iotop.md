## iotop python编写
apt install iotop


-o --only               只显示有io操作的进程
-b --batch              批量显示，无交互，主要用作记录到文件。
-n NUM：                显示NUM次，主要用于非交互式模式。
-d SEC  --delay=SEC     间隔SEC秒显示一次。
-p PID                  监控的进程pid。
-u USER                 监控的进程用户。


iotop常用快捷键：

左右箭头：改变排序方式，默认是按IO排序。
r：改变排序顺序。
o：只显示有IO输出的进程。
p：进程/线程的显示方式的切换。
a：显示累积使用量。
q：退出


## sysstat 
### iostat
iostat -t 
    有个设备叫做 dm-0 dm-1
    ```
dm是device mapper（设备映射）的意思
最常见的一种情况，就是如果设备用LUKS加密，那么解密之后的映射设备就是
dm-X，比如dm-0、dm-1什么的


---
dm-0, dm-1的实体可以通过下面几个命令看出，lvm会把每个lv连接到一个/dev/dm-x的设备档，这个设备档并不是一个真正的磁盘，所以不会有分区表存在，不能把dm设备分区

1) iostat -d 1 ,可以查看device的实时I/O

2）dmsetup ls
      dmsetup info 可以来查看dm设备（lvm）映射情况，可以看到主设备号，次设备号，看不到物理硬盘信息（sda/sdb）

----
http://blog.sina.com.cn/s/blog_7ab16a1e0101fzsh.html

dmsetup ls
lvdisplay






----
    ```

### mpstat
