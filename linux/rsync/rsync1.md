# inotify + rsync

## inotify + rsync

inotify: 内核的功能，监控磁盘文件的所有属性变化

2.6.13 以上内核才支持

pull 

    计划任务，做不到实时

    备份服务器去拉

push

    配合 inotify, push

    数据服务器 push

### rsync 服务器搭建

基准服务器  备份服务器

rsync 

    -v verbose

    -z 传输过程中使用压缩
    -z, --compress              compress file data during the transfer
        --compress-level=NUM    explicitly set compression level

#### 创建主配置文件 /etc/rsyncd.conf

创建主配置文件

    ```
    motd file = /etc/rsyncd.motd                        // 设置服务器信息提示文件，在该文件中编写提示信息
    address = 192.168.1.1                               // rsync 服务绑定IP
    port 873                                            // 默认服务端口 873
    log file = /var/log/rsyncd.log                      // 设置日志文件名，可通过log format参数设置日志格式
    pid file = /var/run/rsyncd.pid                      // 进程号文件位置
    uid = nobody                                        // 设置进行数据传输时所使用的帐户名或ID号，默认使用nobody
    gid = nobody                                        // 设置进行数据传输时所使用的组名或GID号，默认使用nobody
    read only = yes                                     // 是否允许客户端上传数据，yes表示不允许
    max connections =10                                 // 设置并发连接数，0表示无限制
    [common]                                            // 自定义模块名，rsync通过模块定义同步的目录，可定义多个
        exclude = test/                                 // exclude指定common目录下某个目录可以不同步数据
        auth users = tom, jerry                         // 设置允许连接服务器的账户，此账户可以是系统中不存在的用户
        secrets file = /etc/rysncd.secrets              // 密码验证文件名，该文件权限要求为只读，建议为600，仅在设置auth users后有效
        hosts allow = 192.168.0.0/255.255.255.0         // 设置哪些主机可以同步数据，多ip和网段之间使用空格分隔
        hosts deny=*                                    // 除了hosts allow定义的主机外，拒绝其他所有
        list = false                                    // 客户端请求显示模块列表时，本模块名称是否显示，默认为true
    [web]                                               // 共享名，用来连接，是写在url上的
        comment =                                       // 描述
        path = /data                                    // 实际共享目录
        read only = no                                  
        dont compress = *.gz *.bz2                      // 哪些文件不用压缩
        auth user = user1                               // 登录用户名
        secrets file = /etc/rsyncd_user.db              // 密码文件
    ```


创建密码文件

    ```
    vim /etc/rsyncd_user.db
    user1:12345

    chmod 600 /etc/rsyncd_user.db
    ```

启动服务

    rsync --daemon
    

设置映射用户对共享目录有权限(r)

    setfacl -m u:nobody:rwx /filesrc


下载

    格式: rsync -avz rsync://用户名@服务器地址/共享名 /本地目录

        --delete: 删除本地比服务器多出来的文件(源地址、基准服务器没有，目标地址、备份服务器有的删掉)


rsync 的免密登录

    客户端执行 export RSYNC_PASSWORD=虚拟用户密码





### 实现同步技术介绍

1. inotify + rsync 

1. sersync : 金山公司在 inotify 软件基础上开发



### 

```
/proc/sys/fs/inotify/max_queued_events  事件队列最大长度，默认16384,

    更改：vim /etc/sysctl.conf

    fs.inotify.max_queued_events=66666

/proc/sys/fs/inotify/max_user_instances 每个用户创建 inotify 实例最大值，defautl 128

    fs.inotify.max_user_instances=66666

/proc/sys/fs/inotify/max_user_watches   可以监视的文件数量(单进程), default 8192

    fs.inotify.max_user_watches=100000

```

和内核交互的工具: inotify-tools



inotify 两个监控命令:
    
    inotifywait: 用于持续监控，试试输出结果

    inotifywatch: 用于短期监控



inotifywait 命令格式

    inotifywait -mrq -e 事件1,事件2,... /监控目录 &

    -m: 始终保持时间监听状态

    -r: 递归

    -q: 只打印监控事件的信息

    -e <event>, --event <event>
        Listen for specific event(s) only.  The events which can be listened for are listed in the EVENTS section.  This option can be specified more than once.  If omitted, all events are listened for.

    EVENTS:

        move

        create

        delete

        modify

        attrib


    inotifywait -mrq -e move,delete,modify /data


单向脚本

```
#!/usr/bin/bash

a="inotifwai -mrq -e create,delete,modify /data"

b="rsync -avz /data/* root@192.168.1.1:/dataCopy"

$a | while read directory event file
do
    $b
done
```


