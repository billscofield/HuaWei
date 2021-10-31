links:

    https://www.kancloud.cn/kun95/bird_linux/807546

    鸟哥的私房菜

## 

它最大的问题在于『权限』方面的概念！ 因为在客户端与服务器端可能必须要具备相同的
账号才能够存取某些目录或档案

NFS 的启动需要透过所谓的远程过程调用 (RPC)，也就是说，我们并不是只要启动 NFS 就
好了， 还需要启动 RPC 这个服务才行

是由 Sun 这家公司所发展出来的

它最大的功能就是可以透过网络，让不同的机器、不同的操作系统、可以彼此分享个别的
档案 (share files)


基本上 NFS 这个服务的埠口开在 2049, NFS 其他的程序是随机取用一些未被使用的小于
1024 的埠口来作为传输之用。


RPC 最主要的功能就是在指定每个 NFS 功能所对应的 port number ，并且回报给客户端，
让客户端可以连结到正确的埠口上去。

当服务器在启动 NFS 时会随机取用数个埠口，并主动的向 RPC 注册，因此 RPC 可以知道
每个埠口对应的 NFS 功能，

然后 RPC 又是固定使用 port 111 来监听客户端的需求并回报客户端正确的埠口


要启动 NFS 之前，RPC 就要先启动了，否则 NFS 会无法向 RPC 注册

另外，RPC 若重新启动时，原本注册的数据会不见，因此 RPC 重新启动后，它管理的所有
服务都需要重新启动来重新向 RPC 注册

RPC 需要服务器和客户端都安装

不论是客户端还是服务器端，要使用 NFS 时，两者都需要启动 RPC 才行


NFS 必须要有 RPC 存在时才能成功的提供服务，因此我们称 NFS 为 RPC server 的一种



NFS 服务器主要的任务是进行文件系统的分享，文件系统的分享则与权限有关。 所以 NFS
服务器启动时至少需要两个 daemons ，

    一个管理客户端是否能够登入的问题， 

    一个管理客户端能够取得的权限。


    rpc.nfsd：

        最主要的 NFS 服务器服务提供商。管理客户端是否能够使用服务器文件系统挂载
        信息等， 其中还包含这个登入者的 ID 的判别
        
    rpc.mountd
        
        管理 NFS 的文件系统！
        
        当客户端顺利的通过 rpc.nfsd 而登入服务器之后，在他可以使用 NFS 服务器提
        供的档案之前，还会经过档案权限 (就是那个 -rwxrwxrwx 与 owner, group 那
        几个权限啦) 的认证程序！
        
        他会去读 NFS 的配置文件 /etc/exports 来比对客户端的权限，当通过这一关之
        后客户端就可以取得使用 NFS 档案的权限啦！
        
    rpc.lockd (非必要)
        
        用在管理档案的锁定 (lock) 用途。为何档案需要『锁定』呢？ 因为既然分享的
        NFS 档案可以让客户端使用，那么当多个客户端同时尝试写入某个档案时， 就可
        能对于该档案造成一些问题！
        
        这个 rpc.lockd 则可以用来克服这个问题。 
        
        但 rpc.lockd 必须要同时在客户端与服务器端都开启才行！此外， rpc.lockd
        也常与 rpc.statd 同时启用。
        
    rpc.statd (非必要)

        用来检查档案的一致性，与 rpc.lockd 有关！若发生因为客户端同时使用同一档
        案造成档案可能有所损毁时， rpc.statd 可以用来检测并尝试恢复该档案。
        
        与 rpc.lockd 同样的，这个功能必须要在服务器端与客户端都启动才会生效。


nfs.service
nfs-lock.service           
nfslock.service            
nfs-mountd.service         
nfs-server.service         

nfs-blkmap.service         
nfs-config.service         
nfs-idmap.service          
nfs-rquotad.service        
nfs-secure.service         
nfs-idmapd.service         
nfs-secure-server.service  
nfs-utils.service


/usr/lib/systemd/system/nfs-server.service


一般 NFS 的匿名者会以 UID 为 65534 为其使用者，早期的 Linux distributions 这个
65534 的账号名称通常是 nobody ，CentOS 则取名为 nfsnobody 


NFS 服务器有开放可写入的权限 (与 /etc/exports 设定有关)；

实际的档案权限具有可写入 (w) 的权限。


### NFS Server 端的设定

RPC 主程序：rpcbind

    在 CentOS 5.x 以前这个软件称为 portmap，在 CentOS 6.x 之后才称为 rpcbind 

    systemctl status rpcbind.service

NFS 主程序：nfs-utils

    就是提供 rpc.nfsd 及 rpc.mountd 这两个 NFS daemons 与其他相关 documents 与
    说明文件、执行文件等的软件

    systemctl status nfs.service


NFS 会直接使用到核心功能，所以你的核心必须要有支持 NFS 才行


    ```
    1. 主要配置文件：/etc/exports
        
    2. NFS 文件系统维护指令：/usr/sbin/exportfs
        
    3. 分享资源的登录档：/var/lib/nfs/*tab

        etab
            /nfspublic      *(ro,sync,wdelay,hide,nocrossmnt,secure,root_squash,no_all_squash,no_subtree_check,secure_locks,acl,no_pnfs,anonuid=65534,anongid=65534,sec=sys,ro,secure,root_squash,no_all_squash)
        
        rmtab
        
        xtab
        
        在 NFS 服务器的登录文件都放置到 /var/lib/nfs/ 目录里面，在该目录下有两个比较重要的登录档， 
            
            一个是 etab ，主要记录了 NFS 所分享出来的目录的完整权限设定值；
            
            另一个 xtab 则记录曾经链接到此 NFS 服务器的相关客户端数据。
            
    4. 客户端查询服务器分享资源的指令：/usr/sbin/showmount

        exportfs 是用在 NFS Server 端，而 showmount 则主要用在 Client 端。这个
        showmount 可以用来察看 NFS 分享出来的目录资源！

    ```


#### /etc/exports

```
/tmp         192.168.100.0/24(ro)   localhost(rw)   *.ev.ncku.edu.tw(ro,sync)

[分享目录]   [第一部主机(权限)]     [可以用主机名]    [也可以用通配符]

```

sync async 

    sync 代表数据会同步写入到内存与硬盘中，

    async 则代表数据会先暂存于内存当中，而非直接写入硬盘！

no_root_squash 

    root_squash 客户端使用 NFS 文件系统的账号若为 root 时，系统该如何判断这个账
    号的身份？预设的情况下，

    客户端 root 的身份会由 root_squash 的设定压缩成 nfsnobody， 如此对服务器的
    系统会较有保障。

    但如果你想要开放客户端使用 root 身份来操作服务器的文件系统，那么这里就得要
    开 no_root_squash 才行！

all_squash 不论登入 NFS 的使用者身份为何， 他的身份都会被压缩成为匿名用户，通常
也就是 nobody(nfsnobody)


anonuid anongid 

    anon 意指 anonymous (匿名者) 前面关于 squash 提到的匿名用户的 UID 设定值，
    通常为 nobody(nfsnobody)，但是你可以自行设定这个 UID 的值！

    当然，这个 UID 必需要存在于你的 /etc/passwd 当中！ anonuid 指的是 UID 而 anongid 则是群组的 GID 


案例:

同一目录针对不同范围开放不同权限

    ```

    vim /etc/exports

    /home/public  192.168.100.0/24(rw)    *(ro)

    // 继续累加在后面，注意，我有将主机与网域分为两段 (用空白隔开) 喔！

    通配符仅能用在主机名的分辨上面，IP 或网段就只能用 192.168.100.0/24 的状况， 不可以使用 192.168.100.* 

    ```

  
开放匿名登录的情况我要让 \*.centos.vbird 网域的主机，登入我的 NFS 主机时，可以
存取 /home/linux ，

但是他们存数据的时候，我希望他们的 UID 与 GID 都变成 45 这个身份的使用者，假设
我 NFS 服务器上的 UID 45 与 GID 45 的用户/组名为 nfsanon

    ```

    /home/linux *.centos.vbird(rw,sync,all_squash,anonuid=45,anongid=45)

    ```


客户端与服务器端的账号并未相同时：

    服务器端没有uid=600的账号，客户端uid=600的账号为AAA，创建后，所有者会是600      !!!



/var/log/messages 




那我怎么知道每个 RPC 服务的注册状况？没关系，你可以使用 rpcinfo 来观察的。

[root@www ~]# rpcinfo -p [IP|hostname]

[root@www ~]# rpcinfo -t|-u  IP|hostname 程序名称

选项与参数：

    -p ：针对某 IP (未写则预设为本机) 显示出所有的 port 与 porgram 的信息；

    -t ：针对某主机的某支程序检查其 TCP 封包所在的软件版本；

    -u ：针对某主机的某支程序检查其 UDP 封包所在的软件版本；


    程序代号 NFS版本 封包类型 埠口  服务名称


rpcinfo [-n portnum] [-t] host prognum [versnum]

    rpcinfo -t localhost nfs

    -t      Make an RPC call to procedure 0 of prognum on the specified host using TCP, 

            and report whether a response was received. This option is made
            obsolete by the -T option as shown in the third synopsis.





showmount [-ae] [hostname|IP]

    选项与参数：

    -a ：显示目前主机与客户端的 NFS 联机分享的状态；

    -e ：显示某部主机的 /etc/exports 所分享的目录数据。



CentOS 6.x 有提供一个固定特定 NFS 服务的埠口配置文件，那就是 /etc/sysconfig/nfs 啦！ 

你在这个档案里面就能够指定特定的埠口，这样每次启动 nfs 时，相关服务启动的埠口就
会固定，如此一来， 我们就能够设定正确的防火墙

    ```

    RQUOTAD_PORT=1001   <==约在 13 行左右
    LOCKD_TCPPORT=30001 <==约在 21 行左右
    LOCKD_UDPPORT=30001 <==约在 23 行左右
    MOUNTD_PORT=1002    <==约在 41 行左右

    ```
