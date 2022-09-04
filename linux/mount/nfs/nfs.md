## server 安装

apt install nfs-kernel-server


## client 安装

apt install nfs-common

## 

showmount

    -a or --all

        List both the **client hostname** or IP address and **mounted
        directory** in host:dir format. This info should not be considered
        reliable. See the notes on rmtab in rpc.mountd(8).

    -d or --directories

        List only the directories mounted by some client.

    -e or --exports

        Show the NFS server's export list.


启动rpcbind、nfs服务
    systemctl start rpcbind
    systemctl start nfs-server
    systemctl restart nfs-kernel-server.service
    systemctl restart nfs-server

查看 RPC 服务的注册状况    
    rpcinfo -p localhost

nfsstat
    查看NFS的运行状态

## NFS共享的常用参数(export options)

ro                      只读访问

rw
    读写访问

    The default is to disallow any request which changes the filesystem.
    Allow  both  read  and write requests on this NFS volume.
    This can also be made explicit by using the ro option.


sync

    This option enables the NFS server to reply to requests only after the
    changes have been committed to stable storage.

    ensures that any changes made to the shared directory is synchronized
    **between the server and the client.**

    sync：文件同时写入硬盘和内存；

async

    This option allows the NFS server to violate the NFS protocol and reply to
    requests before any changes made by that request have been committed to
    stable storage (e.g. disc drive).

    Using this option usually improves performance, but at the cost that an
    unclean server restart (i.e. a crash) can cause data to be lost or
    corrupted.


secure

    NFS通过1024以下的安全TCP/IP端口发送

    secure This option requires that requests originate on an Internet port
    less  than  IPPORT_RESERVED  (1024).  This option is on by default. To turn
    it off, specify insecure.


insecure                NFS通过1024以上的端口发送

wdelay
    如果多个用户要写入NFS目录，则归组写入(默认)
    
    This option enables the NFS server to delay committing a write request to a
    disc if it suspects that another related write request may be in progress
    or may arrive soon.

no_wdelay
    如果多个用户要写入NFS目录，则立即写入，当使用async时，无需此设置。

    This option enables the NFS server to allow multiple write requests to be
    committed to disc within a single operation. This feature can improve
    performance, but if an NFS server receives many small requests, this
    behavior can serve to degrade performance. You should be aware that this
    option has no effect if async is also set.

hide                    在NFS共享目录中不共享其子目录

no_hide                 共享NFS目录的子目录

subtree_check
    default
    如果共享/usr/bin之类的子目录时，强制NFS检查父目录的权限(默认)

    If a subdirectory of a filesystem is exported, but the whole filesystem
    isn't then whenever a NFS request arrives, the server must check not only
    that the accessed file is in the appropriate filesystem (which is  easy)
    but also that it is in the exported tree (which is harder). This check is
    called the subtree_check.

    ensures that in case a directory instead of a block device is exported, the
    NFS server must check the existence of files in the shared directory for
    every request made.

no_subtree_check        和上面相对，不检查父目录权限

    Sometimes subtree checking can produce problems when a requested file is
    renamed while the client has the file open. If many such situations are
    anticipated, it might be better to set no_subtree_check. 

    specifies that the NFS server should not verify the availability of the
    files in the export for every request.
    

all_squash              共享文件的UID和GID映射匿名用户anonymous，适合公用目录。
no_all_squash           保留共享文件的UID和GID(默认)
    ???winwindows呢？ mac 呢? linux 1111 就1111？如果 server 上也有 1111 呢?

anonuid
    匿名用户的UID值，通常是nobody或nfsnobody，可以在此处自行设定；
anongid
    匿名用户的GID值。

    anonuid and anongid options (default=65534)

root_squash

    root用户的所有请求映射成如anonymous用户一样的权限(默认)

    maps the remote root user privileges into a non-privileged user on the NFS
    server.

    NFS客户端连接服务端时如果使用的是root的话，那么对服务端分享的目录来说，拥有
    匿名用户权限，通常他将使用nobody或nfsnobody身份；

no_root_squash


    allows remote user to access the share with full privileges of the root
    user on the NFS server.

    NFS客户端连接服务端时如果使用的是root的话，那么对服务端分享的目录来说，也拥
    有root权限。显然开启这项是不安全的。

anonuid=xxx             指定NFS服务器/etc/passwd文件中匿名用户的UID


### mount

nosuid

    Do not honor set-user-ID and set-group-ID bits or file capabilities when
    executing programs from  this filesystem.




## NFSv4 with Kerberos

https://ubuntu.com/server/docs/service-nfs




## debian

/etc/idmapd.conf



## mac mount problems

chown on a mounted NFS partition gives "Operation not permitted"

or returned nothing, but didn't work




