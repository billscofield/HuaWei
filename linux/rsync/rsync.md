## 介绍

sync:同步

    刷新文件系统缓存，强制将修改过得数据块写入磁盘，并且更新超级块性能有影响

async:异步

    将数据先放到缓冲区，再周期性（一般是30s）的去同步到磁盘存在数据丢失的风险

重启时多敲几下sync

rsync: remote synchronous

    1. 可以镜像保存整个 "目录树" 和 "文件系统"
        光盘 iso9660

    1. 可以保留文件权限，时间，软硬链接，acl，文件属性(attributes)信息等

    1. 传输效率高，增量

    1. 支持匿名传输，方便网站镜像；也可以做验证，加强安全


依赖 ssh 的工具

    scp slogin sftp rsync

## 工作模式

需要确保时间一致

1. 本地模式(local)

    本地进行复制

    Local:  rsync [OPTION...] SRC... [DEST]

2. 远程模式(Access via remote shell)

    传输到远程主机

    Pull: rsync [OPTION...] [USER@]HOST:SRC... [DEST]           // 一个":"

    Push: rsync [OPTION...] SRC... [USER@]HOST:DEST


    ???
    rsync -avz -e "ssh -p22" ./file root@192.168.1.1:/tmp/

3. 服务器模式(Access via rsync daemon)

    rsync 工作在守护进程模式下

    Pull: rsync [OPTION...] [USER@]HOST::SRC... [DEST]
       rsync [OPTION...] rsync://[USER@]HOST[:PORT]/SRC... [DEST]

    Push: rsync [OPTION...] SRC... [USER@]HOST::DEST
       rsync [OPTION...] SRC... rsync://[USER@]HOST[:PORT]/DEST

4. 列表模式

    --list-only

    Usages with just one SRC arg and no DEST arg will list the source files
    instead of copying.

    As expected, if neither the source or destination path specify a remote
    host, the  copy  occurs  locally  (see also the --list-only option).



## 语法

rsync - a fast, versatile, remote (and local) file-copying tool

SYNOPSIS

    Local:  rsync [OPTION...] SRC... [DEST]

    Access via remote shell:
        Pull: rsync [OPTION...] [USER@]HOST:SRC... [DEST]
        Push: rsync [OPTION...] SRC... [USER@]HOST:DEST

    Access via rsync daemon:
        Pull: rsync [OPTION...] [USER@]HOST::SRC... [DEST]
           rsync [OPTION...] rsync://[USER@]HOST[:PORT]/SRC... [DEST]
        Push: rsync [OPTION...] SRC... [USER@]HOST::DEST
           rsync [OPTION...] SRC... rsync://[USER@]HOST[:PORT]/DEST

    Usages with just one SRC arg and no DEST arg will list the source files instead of copying.


Options

    -a 归档模式，递归的方式传输文件，并保持文件的属性, 等价于 -rlptgoD    

    -r 递归拷贝目录
    -l 保留软连接

    -L, --copy-links            transform symlink into referent file/dir
        --copy-unsafe-links     only "unsafe" symlinks are transformed
        --safe-links            ignore symlinks that point outside the tree
        --munge-links           munge symlinks to make them safer

    -p **保留原有权限** --perms  preserve permissions
    -t 保留原有时间(修改)   --times

    -g 保留属组权限
    -o 保留属主权限

    -D --devices --specials 表示支持 b,c,s,p 类型的文件
        1. l 软连接 
        1. p 管道
        1. f 普通文件 
        1. d 目录
        1. c 字符设备
            tty , 能够输入输出的
        1. b 块设备
        1. s socket
        
        ```
        --devices
              This  option  causes  rsync  to transfer **character and block device files** to the remote system to
              recreate these devices.  This option has no effect if the receiving  rsync  is  not  run  as  the
              super-user (see also the --super and --fake-super options).
       --specials
              This option causes rsync to transfer **special files** such as named sockets and fifos.
        
        ```








    --compress, -z

    --verbose, -v            increase verbosity



    -R 保留相对路径
        即第一个参数最后有没有"/", 效果同没有"/", 即都会把源的目录作为文件同步到 destination 文件夹下
        如果只是pull  rsync -avR /test/app ./   test也会过来,一直到"/"根目录，保持相对路径
        rsync -avR 192.168.10.1:/root/rsync/dir1 ./test2/
            test2
            └── root
                └── rsync
                    └── te
                        └── dir1
                            └── liujiao

    -H 保留硬链接
    -A 保留ACL策略
    -E 保留可执行权限
    
    -X, --xattrs                preserve extended attributes
        保留扩展属性信息
    
    -S, --sparse                turn sequences of nulls into sparse blocks
        --preallocate           allocate dest files before writing
        -n, --dry-run               perform a trial run with no changes made

    -e 指定要执行的远程 shell 命令

例子:


### 本机同步
    
```
rsync -av /dir1 /dir2
    将 /dir1 这个目录 同步到 /dir2下边
    所以，源目录要写成 source/ ,右边有个"/"
    目标目录可以有，也可以没有"/"
    **源是文件，目标是目录**

rsync -av ./dir1/* ./dir2
    将 /dir1/下的文件同步到 /dir2/下
    不会同步 删除的源文件

    --delete  delete extraneous files from dest dirs

    rsync -av --delete te/ two  //快速删除目标目录two中的所有内容
```


### 远程同步

rsync -av test_source/ 192.168.10.1:/root/test_destination

    如果在destination重命名了一个文件，再次执行上述命令，又会有一个新的未重命名
    的源文件，--delete可保证一致性



#### 使用ssh-copy-id 追加拷贝公钥到远程主机

ssh-copy-id -i 远程主机

ssh-copy-id命令可以把本地主机的公钥复制到远程主机的authorized_keys文件上，

ssh-copy-id命令也会给远程主机的用户主目录（home）和~/.ssh, 和
~/.ssh/authorized_keys设置合适的权限。

如果这个 “-i”选项已经给出了，然后这个认证文件（默认是~/.ssh/id_rsa.pub）被使用，
不管在你的ssh-agent那里是否有任何密钥。

-i 指定认证文件路径（默认是~/.ssh/id_rsa.pub）


### rsync 作为后台程序使用

默认不存在


cp /usr/share/doc/rsync/examples/rsyncd.conf /etc/rsyncd.conf

man rsyncd.conf

port 873 端口
    --port xxx


独立服务

    有自己的启动脚本 /etc/init.d/xx
    启动方式:service xx start

依赖服务

    没有自己的启动脚本
    依赖于xineted服务，xineted 是一个独立服务，作为一个管理者对轻量服务进行管理
    rsync, telnet
    省资源



man 5 rsyncd.conf


#### 1. rsyncd.conf 的构成

1. 全局参数(GLOBAL PARAMETERS)

    pid file: pid路径和名称

    port



2. 模块参数(MODULE PARAMETERS)

    [模块1]
        模块参数

    comment

    path: 指定备份

    use chroot

    log file: 日志文件和路径

    lock file: rsync 进程的锁文件的路径和名称

    daemon chroot

    max connections

    syslog facility

    read only
    write only

    list

    uid: 指定 rsync 以什么身份执行, 默认 nobody, 要写入的话,要确保此用户对该文件夹有权限
    gid: 指定 rsync 以什么身份执行

    auth_users: 非系统用户,保存在一个自定义的文件中, 访问模块需要使用的用户名,虚拟用户
        a comma and/or space-separated list of authorization rules.
        修改不用重启
        alias:aliaspassword
        bob:bobpassword
        
        **必须显示指出那些用户,否则即使用户在 rsyncd.secrets 中,也不能访问**
        
        chmod o= /etc/rsyncd.secrets            // others 要为零

    secrets file
        user1

    hosts allow
        a list of comma- and/or whitespace-separated patterns
    hosts deny

        
        两个参数均未指定:则全都可以访问
        仅有白名单:
        仅有黑名单:
        两者都有: 白名单优先,然后黑名单, 否则**允许**

    log format

    timeout: 空闲超时时间







    ```
    [web]
    path=/www
    usr chroot=no
    read only=false
    list=false              用户是否可以显示全部模块列表
    ```







后台运行方式
    rsync --daemon
        默认是 /etc/rsyncd.conf 配置文件, 即使是空的


    --port=

    --config=/path/confile


rsyncd.conf


默认不会对目标中多的文件进行删除


--delete: client 和 server 完全一致
    删除目标端(本地或服务器都可以)

    rsync -av --delete  ./ /root/Documents/lca/             // 源目录和目标目录结构一定要一样,不能一个是文件,一个是目录, ./* /  就不行


--dry-run, -n            perform a trial run with no changes made


--exclude: 排除文件
    --exclude a.txt                         // 单个文件
    --exclude {a.txt,file2,file3}           // 单个文件
    --exclude *.txt                         // 通配符

也可以在服务端进行设置/etc/rsyncd.conf
    [rsynctest]
    exclude=*.txt b.txt                     // space-separated list





1. 更改rsync创建文件的所有者
2. 更改rsync创建的文件的权限

incoming chmod

    This  parameter  allows  you to specify a set of comma-separated chmod
    strings that will affect the permissions of all incoming files (files that
    are being received by the daemon).  These changes happen after all other
    permission calculations, and this will even override destination-default
    and/or existing permissions when the client does not specify --perms.  See
    the description of the --chmod rsync option and the  chmod(1)  manpage for
    information on the format of this string.

outgoing chmod

    This  parameter  allows  you to specify a set of comma-separated chmod
    strings that will affect the permissions of all outgoing files (files that
    are being sent out from the daemon).  These changes happen first, making
    the sent permissions appear to be different than those stored in the
    filesystem itself.  For instance, you could disable group write permissions
    on the server while having it appear to be on to the  clients.   See  the
    description of the --chmod rsync option and the chmod(1) manpage for
    information on the format of this string.


    ```
    # 其他配置
    uid = www-data
    # 其他配置...
    incoming  chmod  = Du=r,Dg=r,Fu=rwx,Fgo=r

    #du是目录权限 d开头的是跟目录权限有关，fu是文件所有者，fgo用户组。

    ```

#### 2. 客户端


Pull: 
    rsync [OPTION...] [USER@]HOST::模块 [DEST]
        rsync alias@192.168.1.1::rsynctest

    rsync [OPTION...] rsync://[USER@]HOST[:PORT]/SRC... [DEST]
        rsync alias@192.168.1.1/rsynctest


    例如
        rsync -vrt --bwlimit=20480 rsync://rsync.mirrors.ustc.edu.cn/repo/debian        --bwlimit 单位是Kb
        
        rsync https://mirrors.tuna.tsinghua.edu.cn::debian
        rsync mirrors.tuna.tsinghua.edu.cn::debian

        客户端可以将密码写在文件中
        rsync rsync://192.168.1.1/rsynctest --password-file=/etc/rsync.pass     // 权限同样 others 0




Push:
    rsync [OPTION...] SRC... [USER@]HOST::模块
    rsync [OPTION...] SRC... rsync://[USER@]HOST[:PORT]/DEST






```
在代码源服务器上

[app1]   //模块名可自定义,就是 path 的别名
path = /app/java_project    //需要备份的文件
log file=/var/log/rsyncd


rsync -a 192.168.10.1:: 查看远程源代码配置的 pull 模块名

语法1:
    在源代码服务器上配置 /etc/rsyncd.conf 
        rsync --daemon
        不会拷贝最外层的目录，而是内部的全部文件

    在备份机上pull
        rsync -av 192.168.10.1::app1 本地目录        //不用输入密码???为什么
        将上述命令写进 .sh 脚本,添加可执行权限即可

        crontab -e
            f1 f2 f3 f4 f5   program
            f1 f2 f3 f4 f5  user   program
            分 时 日 月 星期 program
            当 f1 为 * 时表示每分钟都要执行 program，f2 为 * 时表示每小时都要执行程序，其馀类推
            当 f1 为 a-b 时表示从第 a 分钟到第 b 分钟这段时间内要执行，f2 为 a-b 时表示从第 a 到第 b 小时都要执行，其馀类推
            当 f1 为 */n 时表示每 n 分钟个时间间隔执行一次，f2 为 */n 表示每 n 小时个时间间隔执行一次，其馀类推
            当 f1 为 a, b, c,... 时表示第 a, b, c,... 分钟要执行，f2 为 a, b, c,... 时表示第 a, b, c...个小时要执行，其馀类推

            /root/1.sh &>/dev/null

        crontab -l  //查看计划任务



        rsync -av 备份目录 user@192.168.10.1::app1 
            使用了另外一个用户，提示模块只读

            read only: true->cannot upload
                the default is for all modules to be read only
            write only:

            配置文件中修改 read only = false
            rsync 写的时候是以什么身份运行的  man rsync  uid  gid
                uid   which is normall y the user "nobody"

                uid = 0
                gid = 0
            
语法2:
    rsync -av rsync://192.168.10.1/app1 本地目录

配置文件 /etc/rsyncd.conf

log file = 
path = 
read only = false
uid = 0
gid = 0

rsync -av /backup user@192.168.10.1::app1
    user1 但是是root身份运行 rsync
```



### rsync + inotify 实现实时同步

inotify 或者 sersync

    sersync 是 inotify 的封装
    
    监控发生了变化的文件



inotify 可以监控一个目录
inotify 安装到 备份源 服务器上

源码安装默认安装到 /usr/local/bin/
ls /usr/local/bin
    inotifywait                 // 等待目录发生改变 
    inotifywatch                // 用来进行统计


inotifywait [option] 文件1 文件2 ...

    -m --monitor   持续保持监听, 否则是监控到了一次就退出监控了

    -r --recursive  递归,
        The default maximum is 8192; it can be increased by writing to /proc/sys/fs/inotify/max_user_watches.

    --exclude <pattern>         // 区分大小写
    --excludei <pattern>        // 不区分大小写

    -q --quiet  print less(only print events,增加，删除，改变)



    -d, --daemon
        Same as --monitor, except run in the background logging events to a file that must be specified by --outfile. Implies --syslog.

    -o, --outfile <file>
        Output events to <file> rather than stdout.

    -s, --syslog
        Output errors to syslog(3) system log module rather than stderr.



    --timefmt <fmt>
        监控到事件触发后,输出的时间格式

    --format <fmt>              // 自定义输出格式

        %w  产生事件的监控**绝对路径**, 不一定就是发生事件的具体文件, 例如递归
            监控一个目录,该目录下的某文件产生事件,将输出该目录而非其内具体文件

        %f  文件
        %e  产生事件的具体名称

        %T  以 --timefmt 的格式**输出**发生事件的时间, --timefmt 必须定义, 定义了 %T, 就必须定义 --timefmt


        --format "%T"

    -e --event 
        access
        move            // 移走和delete不一样
        create
        modify
        delete
            A file or directory within a watched directory was deleted.
        attrib

        access
        open
        close_write
        close_nowrite
        close
            regardless of how it was opened.  Note that this is actually
            implemented simply by listening for both close_write and
            close_nowrite

        moved_to
            向监控目录下移入了文件或目录,也可以是在监控目录内部的移动
        moved_from
            将监控目录下文件或目录移动到其他地方,也可以是在监控目录内部的移动
        move
        unmount
        ...


    inotifywait -mrq --timefmt "%F %T" --format "%w%f %e %T"


    ```
    #!/bin/bash
    /usr/local/bin/inotifywait -mrq -e modify,delete,create,attrib,move /app/java_project
    while read events(变量)
    do
        rsync -a --delete /app/java_project/ 192.168.10.1::/backup
        echo "`date +%F\ %T` 出现事件$eventsi">>/var/log/rsync.log 2>&1
    done
    ```


    ```
    PROGRAM=/usr/bin/inotifywait
    EVENTS="create,delete,modify,attrib"
    FLAGS=-mrq

    lpath=/test/
    rhost=192.168.1.1
    secfile="/etc/rsync.password"


    ${PROGRAM} ${FLAGS} --format "%w%f" -e ${EVENTS} ${lpath} | while read line
    do
        rsync -az $line vuser@${rhost}::modetest --password-file='/etc/rsyncd.password'
    done
    ```
