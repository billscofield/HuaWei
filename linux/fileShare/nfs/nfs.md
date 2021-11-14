
##

NFS 是一种文件系统，可以在远程主机中直接挂载到系统中

基于内核的文件系统。SUN 公司开发, 基于 RPC 实现.

多个用户同时挂载, 同时访问同一个文件, 可能会导致冲突, 要处理一致性问题

使用非固定端口


|                     +--------+
|                +--->|用户进程|<----+
|                |    +--------+     |
|                |                   | NFS客户端                       NFS 服务端
|       +--------|-------------------|----------+   +-----------------------------------------------+
|       |       \|/                 \|/         |   |                                               |
|       |   +------------+  +----------------+  |   |   +----------------+      +-------+           |
|       |   |本地文件访问|  |RPC服务(portmap)|  |   |   |RPC服务(portman)| <--- |NFS服务|           |
|       |   +------------+  +----------------+  |   |   +----------------+      +-------+           |
|       |       /|\                 /|\         |   |          /|\                  |               |
|       |        |                   |          |   |           |                   |               |
|       |        |                  \|/         |   |          \|/                 \|/              |
|       |        |          +----------------+  |   |   +----------------+      +--------------+    |
|       |        |          | TCP/IP 协议栈  |  |   |   | TCP/IP 协议栈  |      | 本地文件访问 |    |
|       |        |          +----------------+  |   |   +----------------+      +--------------+    |
|       |        |                  /|\         |   |          /|\                                  |
|       |        |                   |          |   |           |                                   |
|       +--------|-------------------|----------+   +-----------|-----------------------------------+
|                |                   |                          |
|               \|/                  |                          |
|            本地磁盘                +--------------------------+


早期叫 portmap, 现在叫 rpcbind

    apt-cache show rpcbind

    systemctl status rpcbind            // rpcbind.service - RPC bind portmap service
    systemctl status rpcbind.socket

    端口号: 111

    rpcinfo 查看rpc服务注册情况
        
        -p  显示所有的端口和程序信息


特点:
    会有很多个客户端进行挂载，所以会涉及数据一致性,
    端口不固定


    家目录漫游
    




    
### nfs 相关软件包

1. debian

    nfs-kernel-server - support for NFS kernel server           // 服务端

    libnfs-utils - NFS client library (binaries)

    nfs-common - NFS support files common to client and server, 挂载时需要 mount.nfs


2. centos

    yum install nfs-utils                                       // 服务端, 会自动安装 rpcbind 依赖, mount.nfs

    systemctl status nfs-server



## 通用

会有很多子进程, 主要进程有:

    rpc.nfsd    最主要的NFS进程,管理客户端是否可以登录
    rpc.mountd  挂载和卸载NFS文件系统，包括权限管理
    rpc.lockd   非必要，管理文件琐, 避免同时写 出错
    rpc.statd   非必要, 检查文件一致性, 可修复文件

日志
    /var/lib/nfs/

配置文件
    /etc/exports                                                // 并不是由 nfs-kernel-server 提供
    /etc/exports.d/*.exports    // debian 并没有这个文件夹

    ```
    目录    共享给谁(选项1,选项2), 默认ro

    /data/www   *       // 默认只读
    /data/www   *()       // 默认只读
    /data/www   10.0.0.0/24
    /data/www   10.0.0.1

    ---

    /data/www   *(ro)  10.0.0.1(rw)
    ```

    exportfs -r     // 更改配置文件后重新加载配置文件

    exportfs -v     // 当前服务器共享出来的目录

### 选项

ro,rw

async           异步,数据变化后不立即写入磁盘，先写入缓冲区中, 

sync            同步(默认),立即写入

wdelay          (默认)：检查是否有相关的写操作，如果有则将这些写操作一起执行，这样可以提高效率。

no_wdelay       若有写操作则立即执行，应与sync配合使用。

root_squash     远程 root 映射为 nfsnobody, centos8 为 nobody

no_root_squash  远程 root 还是 root

all_squash      所有用户(包括root)都映射为 nfsnobody, centos8 为 nobody

no_all_squash   (默认)保留文件的UID和GID

anonuid 和 anongid  指明匿名用户映射为特定用户UID和GID, 而非nfsnobody, 可配合 all_squash 使用

    anonuid=1001,anongid=1000

subtree_check   若输出目录是一个子目录，则nfs服务器将检查其父目录的权限。

no_subtree_check    (默认)此选项打开会有轻度的安全问题，但是会增加可靠性。

    This option disables subtree checking, which has mild security implications,
    but can improve reliability in some circumstances.

    表示禁用子树检查。如果禁用子树检查会提高效率，但会降低其安全性。

secure      （默认）:限制客户端只能从小于1024的tcp/ip端口连接服务器。

insecure     允许客户端大于1024的tcp/ip端口连接服务器。

命令
    showmount
        
        -e or --exports
            Show the NFS server's export list
            // 查看NFS服务器有哪些共享
        
        
        -d <server-ip or hostname> :显示被客户机挂载的目录。-d 或--directories
        
        -a <server-ip or hostname>:列出nfs服务器的所有客户端主机及所连接的目录，即挂载点

    
    exportfs 
        -u：卸载单一目录（和-a一起使用为卸载所有/etc/exports文件中的目录）
        
        -r：重新读取/etc/exports文件的设置，并使设置立即生效，而不重启服务。并同步更新/var/lib/nfs/xtab
        
        -rv:重新输出共享目录。
        
        -a  Export or unexport all directories.

    mount.nfs
        



权限(root_squash, 默认的)

    客户端的root用户映射为服务器的 nfsnobody 用户, centos8 中叫 nobody ,名称不一样,但是id 一样

    只给 nfsnobody/nobody 权限即可

    root_squash 权限压缩

    no_all_squash 其他人, 在服务器端只显示 id, 客户端还是原来的用户, 如果服务器端有id相同的用户, 那所有者就是这个服务器端用户

        all_squash 会覆盖 no_root_squash
        
        但是如果两个客户端的两个帐号id一样, 权限就一样了, 
        
        所以在以后创建帐号时, 都要指定相同id
        
        解决方案: LDAP 或域

win10 可以挂载,启用NFS功能, 还要特定版本才可以



检查挂载是否成功:

    mount |grep nfs

永久挂载

    10.0.1.101.188:/nfsshare    /mnt/nfsshare   nfs     defaults 0 0

NFS工具





## autofs

yum install autofs          apt install autofs

systemctl status autofs

### 配置文件

/etc/auto.master

相对路径法
    /misc/cd        dirname/basename
    
    /etc/auto.master 
        dirname     子配置文件路径
         
        子配置文件自己定义
        
        ```
        /etc/auto.master
        /misc   /etc/auto.misc
        
        子配置文件
        cd  -fstype=iso9660,ro,nosuid,nodev  :/dev/cdrom
        
        ---
        
        nfs例子
        /etc/auto.master
        /misc   /etc/auto.misc
        
        /etc/auto.misc
        nfs(本地目录名)     -fstype=nfs 10.0.0.1:/var/www
        ```

        本级的目录要和服务器的目录同名
        *  server:/export/&
    
    父母录不需要提前创建


例题: 将10.0.0.1:/var/www 挂载到 /home/nfs

    /etc/autofs.master
        /home   /etc/auto.home                  // /home 下的所有文件都由 autofs 决定
    /etc/auto.home
        nfs -type=nfs  10.0.0.1:/var/www

    systemctl restart autofs

    但是会有一个问题, 会覆盖/home 目录, 其他文件夹不见了


绝对路径法

    /etc/auto.master

        /-  子配置文件

    子配置文件

        /home/nfs   -type=nfs   10.0.0.1:/var/www


例题: /home 目录

    NFS服务器创建用户和相应的家目录, 将用户wang的价目录共享

    useradd -d /data/wang wang
    vim /etc/exports.d/test.exports
        /data/wang *(rw,anonuid=1000,anongid=1000,all_sqush)

    第一台主机
        useradd -M wang                 // 需要指定价目录吧???
        vim /etc/auto.master
            /home /etc/homeauto
        vim /etc/homeauto
            * -fstype=nfs  192.168.1.1:/data/&

    第二台主机
        /etc/auto.master
            /- /etc/homeauto
        /etc/homeauto
            /home/wang  -fstype=nfs 192.168.1.1:/data/wang
