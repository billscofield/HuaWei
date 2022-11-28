## rsync

应该是 remote synchronize
linux系统下的数据镜像备份工具


rsync - a fast, versatile, remote (and local) file-copying tool
    versatile 多才多艺的，有多种技能的；多用途的，多功能的

    1. 目的是实现**本地主机** 和 **远程主机**上的文件同步
    2. 也可实现本地不同路径下文件的同步
    3. **不能实现远程路径1到远程路径2的同步(scp可以实现)**

    想让目标主机上的文件和本地主机上的文件保持同步，是以本地主机上的文件为同步
    基准，将本地主机上的文件作为源文件推送到目标主机上。

    想让本地主机上的文件和目标主机上的文件保持同步，则以目标主机上的文件为同步
    基准，将目标主机上的文件作为源文件拉取到本地主机上。

    在同步过程中必然会设计到源和目标两文件之间版本控制的问题，

rsync 同步过程中由两部分模式组成

    1. 检查模式：决定哪些文件需要同步

        1. 按照指定规则来检查哪些文件需要被同步，例如哪些文件是明确被排除不传输
           的

        2. rsync 默认使用**quick check 算法**比较源和目标，也可改变 "quick check"的
           检查模式, 比如 --size-only选项表示 "quick check" 将仅检查文件大小不
           同的文件作为待传输文件

        3. 检查模式的自定义性事非常有弹性的

    2. 同步模式：文件同步时的模式

        1. 文件被确定要同步后，再同步过程发生之前要做哪些额外的工作。例如：

            1. 是否要删除源主机上没有但目标主机上有的文件

            1. 是否要先备份已存在的目标文件

            1. 是否要追踪链接文件等额外操作

        1. rsync提供非常多的选项使得同步模式变得更具有弹性

    3. 为rsync手动指定同步模式的选项更常见一些，只有在有特殊需求时才指定检查模
       式，因为大多数检查模式选项都可能会影响rsync的性能

1. 特点
    1. 变量复制，第一次同步时，rsync会复制全部内容，但在下一次只传输修改过的文件
    1. 压缩传输：rsync在传输数据的过程中可以实行压缩操作，可节省带宽
    1. 安全：可以使用scp, ssh 等方式来传输文件，也可以通过直接的socket连接
    1. 支持匿名传输：以方便进行网站镜像
    1. 选择性保持：符号链接，硬链接，文件属性，权限，时间等

1. 常见备份分类

    1. 完整备份

        每次备份都是从**备份源**将所有的文件或目录**备份到目的地**

    2. 差异备份

        备份上次完全备份以后有变化的数据
            1. 针对的是上次的完全备份
            2. 备份过程中不清除存档

    3. **增量备份** Incremental Backup

        备份上次备份以后有变化的数据,
            1. **不管是哪种类型的备份，有变化的数据就备份**
            2. **会清除存档属性**
    

采用C/S model

    port:873


发起端和备份源

    4个名词
        1. 发起端：负责发起 rsync 同步操作的客户机，通知服务器:"我要备份你的数据"
        1. 备份源：负责响应来自客户机 rsync 同步操作的服务器，需要备份的服务器
        1. 服务端：运行 rsyncd 服务，需要备份的服务器
        1. 客户端：存放备份数据

两种数据同步方式
    1. 推push
        1. 1台主机负责把数据传送给其他主机，服务器开销很大
        1. 目的主机配置为 rsync 服务器，源主机周期性的使用 rsync 命令把要同步的目录推过去
    1. 拉pull
        1. 所有主机定时去找一主机拉数据，可能会导致数据缓慢
        1. 源主机配置为 rsync 服务器，目的主机周期性的使用 rsync 命令把要同步的目录拉过来
    
工作原理
    Xinetd

安装

    ```
    vi /etc/xinetd.d/rsync 
        disable = no
    service xinetd restart
    netstat -antup | grep 873
    ```

rsync 命令和 scp 命令相似
    rsync --version

    -a, --archive   archive mode 权限保存模式，相当于 -rlptgoD 参数，存档，递归，保持属性等
    -r, --recursive     递归处理
    -p, --perms     保留档案权限，文件原有属性
    -t, --times     保留时间点，文件原有时间
    -g, --group     保留原有属组
    -o, --owner     保留档案所有者(root only)
    -D, --devices   保留device资讯(root only)
    -l, --links     复制所有的连接，拷贝连接文件
    -z, --compress  压缩模式，当资料在传送到目的端进行档案压缩 -azP
    -H, --hard-links    保留硬连接文件
    -A, --acls          保留ACL属性文件，需要配合 --perms
    -v, --verbose   //-vvvv
    -u, --update    仅仅进行更新，也就是跳过已经存在的目标位置，并且文件时间要晚于要备份的文件，不覆盖新的文件

    --port=PORT     定义rsyncd(daemon)要运行的port(default 873)
    --delete        删除那些目标位置有的文件 而备份源没有的文件
    --password-file=FILE    从FILE中得到密码
    --bwlimit=KBPS          限制I/O带宽
    --filter "filename"     需要过滤的文件
    --exclude=filename      需要过滤的文件
    --progress              show progress during transfer
    -P = --partial --progress   //--partial：keep partially transferred files
    -n --dry-run            仅测试传输，而不实际传输。常常和"-vvvv"配合使用来查看rsync时如何工作的
    --version

    rsync [OPTION]... SRC [SRC]... DEST

    注意点：
        源路径如果是一个目录的话，带上尾随斜线和不带尾随斜线时不一样的
            1. 不带尾随斜线表示：整个目录包括目录本身
            1. 带上尾随斜线表示：目录中的文件，不包括目录本身
            
            ```
            rsync -a /etc /tmp
                会在 /tmp目录下创建etc目录
            rsync -a /etc/ /tmp/
                不会在 /tmp目录下创建etc目录，源路径/etc中的所有文件都直接放在/tmp目录下
            ```

链接
    https://www.cnblogs.com/f-ck-need-u/p/7220009.html
    https://segmentfault.com/a/1190000015669114

### 实例

```
useradd -m rget
useradd -m rput
echo "123456" | passwd --stdin rget
echo "123456" | passwd --stdin rput

# 设置rget权限
setfacl -R -m user:rget:rwx /var/www/html/
setfacl -R -m user:rput:rwx /var/www/html/

rsync -azP --delete rget@192.168.1.63:/var/www/html/ /web-back/

见链接1
```





链接：
    1. https://www.bilibili.com/video/av22230865?from=search&seid=16834230796075374550
    1. https://www.bilibili.com/video/av30970430/?spm_id_from=333.788.videocard.2

## scp

scp 无法备份大量数据

rsync不支持远程到远程的拷贝，但scp支持


## 扩展内容

### xinetd

链接
    1. https://blog.csdn.net/u010454729/article/details/39778213

1. xinetd即extended internet daemon，xinetd是新一代的网络守护进程服务程序，又叫超级Internet服务器。

1. 经常用来管理多种轻量级Internet服务。 xinetd提供类似于inetd+tcp_wrapper的功能，但是更加强大和安全。





