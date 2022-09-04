[link](baidubaike)
SMB(全称是Server Message Block)是一个协议名，它能被用于Web连接和客户端与服务器
之间的信息沟通。SMB最初是**IBM的贝瑞·费根鲍姆（Barry Feigenbaum）**研制的，其目的是
将DOS操作系统中的本地文件接口“中断13”改造为网络文件系统。

[link](https://www.educba.com/what-is-smb/)
IBM first created server Message Block (SMB) protocol in the 1980s. It is one of
the versions of the Common Internet File System (CIFS) to transfer the files
over the network. 

1. smb1.0

    SMB1 is very similar to the CIFS protocol that shares the files over a
    network to access them among the clients in an effective way. SMB was
    initially introduced to run on top of NetBIOS and TCP/IP interface.

2. smb2.0

    Microsoft then introduced version 2 to improve the incorrect usage of
    networking resources. SMB2 has reduced the “chattiness” of SMB1.0 Version
    file system protocol by reducing the number of commands and subcommands
    that are used to communicate the system to just nineteen commands. 

3. smb3.0

    Later SMB3.0 Version was introduced in WINDOWS 8 Server and windows server
    2012. It was introduced to improve the encryption level end to end.

4. smb3.1.1

    This version of SMB was introduced with Windows 10 Server and Windows
    server 2016. SMB 3.1.1 version uses AES encryption Algorithm to implements
    pre-authenticated security checks using the SHA-512 hash key.

SMB（ServerMessageBlock）协议作为**一种局域网文件共享传输协议**，常被用来作为共
享文件安全传输研究的平台。但是，SMB协议中采用控制文件安全传输的机制是**使用客户身
份验证的方式**，该方式通过客户端向服务器端发送验证密码来获取文件传输的权限，不过
针对该机制的网络攻击相对严重，攻击程序通过对验证密码的截获来窃取文件的访问权限，
局域网下文件传输的安全性得不到保障。


## What is Samba?

As the front page at samba.org says:

**Samba is the standard Windows interoperability([ˌɪntərˌɑːpərəˈbɪləti] 交互)
suite of programs for Linux and Unix.**

Since 1992, Samba has provided secure, stable and fast file and print services
for all clients using the SMB/CIFS protocol, such as all versions of DOS and
Windows, OS/2, Linux and many others.

Samba is an important component to seamlessly integrate Linux/Unix Servers and
Desktops into Active Directory environments. 

**It can function both as a domain controller or as a regular domain member.**

Samba is a software package that gives network administrators flexibility and
freedom in terms of setup, configuration, and choice of systems and equipment.
Because of all that it offers, Samba has grown in popularity, and continues to
do so, every year since its release in 1992.


[link](https://alternativeto.net/software/samba/)

Samba is described as 'is the standard Windows interoperability suite of
programs for Linux and Unix. Since 1992, Samba has provided secure, stable and
fast file and print services for all clients using the SMB/CIFS protocol, such
as all versions of DOS and Windows, OS/2, Linux and many others' and is a
popular app in the OS & Utilities category. There are more than 10 alternatives
to Samba for a variety of platforms, including Linux, Mac, Windows, Self-Hosted
solutions and Android.

The best alternative is Syncthing, which is both free and Open Source. Other
great apps like Samba are
    Onionshare (Free, Open Source)
    NitroShare (Free, Open Source)
    Magic Wormhole (Free, Open Source)
    Univention Corporate Server (Free, Open Source)


[link](https://www.ionos.com/digitalguide/server/know-how/server-message-block-smb/)

Besides the implementations of Server Message Block in the various Windows
editions, the protocol was integrated into numerous other software projects to
enable communication beyond the Microsoft family. The best-known SMB
implementations include the following:

    1. Samba: The software project Samba is probably the best-known example of
       an SMB implementation beyond Windows. Back in 1991, programmer Andrew
       Tridgell started developing the free software that enables communication
       in Unix/Linux systems via Server Message Block.

    2. Netsmb: Netsmb refers to implementations of the SMB client and server
       directly in the kernel of BSD operating systems. They were first
       released for OS FreeBSD 4.4, but are now available for a range of BSD
       systems –including NetBSD and macOS.

    3. YNQ: YNQ (formerly NQ) is an SMB library that implements the Server
       Message Block technology in embedded systems without Windows and thereby
       allows interoperability with Windows-based devices. YNQ has been
       developed by the Israeli software company Visuality Systems Ltd. since
       1998.

    4. FreeNAS: Anyone who wishes to run their own NAS server that supports the
       SMB protocol, will find a suitable solution in the open-source FreeNAS.
       The NAS software is based on **FreeBSD** and the OpenZFS file system.

    5. ConnectedNAS: ConnectedNAS, software developed by Connected Way, serves
       as an SMB server and client for Android devices. Users of the paid app
       can easily exchange data between the mobile device and other SMB devices
       –whether privately or within a company. For security reasons,
       ConnectedNAS only supports SMB from version 2.



[link](https://blog.csdn.net/qq_30782455/article/details/96345259)

Samba启动服务中的nmb是什么

组成Samba运行的有两个服务，一个是**SMB**，另一个是**NMB**；

SMB是Samba 的核心启动服务，主要负责建立 Linux Samba服务器与Samba客户机之间的对
话， 验证用户身份并提供对文件和打印系统的访问，只有SMB服务启动，才能实现文件的
共享，

    监听139 TCP端口；

Samba的smbd守护进程通常使用TCP/445进行SMB连接.出于基于TCP的NetBIOS向后兼容性,它
还侦听TCP/139.nmbd守护进程使用UDP/137和UDP/138提供基于TCP/IP网络的NetBIOS浏览支
持

而NMB服务是负责解析用的，类似与DNS实现的功能，NMB可以把Linux系统共享的工作组名
称与其IP对应起来，如果NMB服务没有启动，就只能通过IP来访问共享文件，

    监听137和138 UDP端口。

    netbios-ns  137/udp     NETBIOS Name Service¬
    netbios-dgm 138/udp     NETBIOS Datagram Service¬
    netbios-ssn 139/tcp     NETBIOS session service¬




[link](https://theinfinitekitchen.com/guide/what-is-smb-and-nmb-services/)

**nmbd is a server that understands and can reply to NetBIOS over IP name
service requests**, like those produced by SMB/CIFS clients such as Windows
95/98/ME, Windows NT, Windows 2000, Windows XP and LanManager clients. It also
participates in the browsing protocols which make up the Windows “Network
Neighborhood” view.

What is SMB and NMB?

    The Server Message Block protocol (also called Session Message Block,
    NetBIOS or LanManager protocol) is used on MS Windows 3.11, NT, 95/98, 2K
    and XP to share disks and printers.

What is SMB file Service?

    SMB stands for “Server Message Block.” It’s a file sharing protocol that
    was invented by IBM and has been around since the mid-eighties. The SMB
    protocol was designed to allow computers to read and write files to a
    remote host over a local area network (LAN).

就是说 netbios 是用于局域网的 DNS


身份验证和权限设置

    smbd 服务支持 user mode 和 domain mode 等身份验证和权限设置模式




## centos

samba           服务端          debian: samba
samba-client    客户端          debian: smbclient

/etc/samba/smb.conf

smbcontrol smbd reload-config       // 重新加载配置文件

    Use smbcontrol (man page) to reload the config with the lowest downtime and
    lowest-possible impact on services already using your shares. 

systemctl status **smb**

netstat -tlnpu | grep smb

    ```
    tcp        0      0 0.0.0.0:445             0.0.0.0:*               LISTEN      1447/smbd
    tcp        0      0 0.0.0.0:139             0.0.0.0:*               LISTEN      1447/smbd
    tcp6       0      0 :::445                  :::*                    LISTEN      1447/smbd
    tcp6       0      0 :::139                  :::*                    LISTEN      1447/smbd
    ```


访问 samba
    smbclient -L serverip       查看共享了哪些, 默认匿名用户密码为空, windows : \\serverip,

    -L|--list
        This option allows you to look at what services are available on a
        server. You use it as smbclient -L host and a list should appear.
        
        The -I option may be useful if your NetBIOS names don't match your
        TCP/IP DNS host names or if you are trying to reach a host on another
        network.

    -I|--ip-address IP-address

        IP address is the address of the server to connect to. It should be
        specified in standard "a.b.c.d" notation.
        
        Normally the client would attempt to locate a named SMB/CIFS server by
        looking it up via the NetBIOS name resolution mechanism described above
        in the name resolve order parameter above.




## /etc/samba/smb.conf

两种注视

    分号: 配置项
    井号: 说明信息

**Each section** in the configuration file (except for the [global] section)
describes **a shared resource** (known as a “share”). The section name is the
name of the shared resource and the parameters within the section define the
shares attributes.

There are **three special sections**, [global], [homes] and [printers], which are
described under special sections. The following notes apply to ordinary section
descriptions.

Sections are either file share services or printable services.

Sections may be designated guest services, in which case no password is
required to access them. A specified UNIX guest account is used to define
access privileges in this case.





[global] workgroup = SAMBA security = user / domain / ads / share / server user
    user 身份验证, 用户名密码
    share 匿名共享???

    server string = "hello bill"

        ```
        smbclient -L 10.0.6.51
        Enter WORKGROUP\root's password:
        Anonymous login successful
        
        Sharename       Type      Comment
        ---------       ----      -------
        print$          Disk      Printer Drivers
        IPC$            IPC       IPC Service ("hello bill")        // here
        SMB1 disabled -- no workgroup available
        ```
        
        This controls what string will show up in the printer comment box in print manager and next to the IPC
        connection in net view. It can be any string that you wish to show to your users.
        
        It also sets what will appear in browse lists next to the machine name.
        
        A %v will be replaced with the Samba version number., 
        Default: server string = Samba %v


[homes]
    comment = Home Directories      // 描述

    用户
    valid users = %S, %D%w%S        // 逗号隔开, 空格隔开
        
        A name starting with a '@' is interpreted as an NIS netgroup first (if
        your system supports NIS), and then as a UNIX group if the name was not
        found in the NIS netgroup database.
        
        A name starting with '+' is interpreted only by looking in the UNIX
        group database via the NSS getgrnam() interface. 
        
        A name starting with '&' is interpreted only by looking in the NIS
        netgroup database (this requires NIS to be working on your system).
        
        The characters '+' and '&' may be used at the start of the name in
        either order so the value +&group means check the UNIX group database,
        followed by the NIS netgroup database, and the value &+group means
        check the NIS netgroup database, followed by the UNIX group database
        (the same as the '@' prefix).
        
        The current servicename is substituted for %S. This is useful in the [homes] section.
        
        Default: invalid users =  # no invalid users
        
        Example: invalid users = root fred admin @wheel

    browseable = No                 // 可以设置隐藏目录, like hidden ssid    ?? printable = yes
        
        This controls whether this share is seen in the list of available
        shares in a net view and in the browse list.
        
        Default: browseable = yes

    read only = No
    inherit acls = Yes


    path = /data                    // 共享目录， [home] 不用写, 绝对路径
    public = yes                    // 允许匿名查看, 访问  ?? guest ok = yes
        public
        This parameter is a synonym for guest ok.
        
        多搜索 synonym



    设置目录只读
    readonly = yes
    readonly = no                   // 一般不用这个


    设置目录可写
    1. writable 格式
        writable = yes
        writable = no               // 只读

    2. write list 格式
        write list = 用户名         // writable = yes; write list = usera userb     只针对某些人开启写权限
        write list = @组名


    日志
    log file = /var/log/samba/log.%m
    max log size = 50               // KB
        %m
            the NetBIOS name of the client machine (very useful).
        %L
            the NetBIOS name of the server.


    level2 oplocks = yes / no




    和系统密码不一样
    [xsb]
    comment = xsb data
    security = user                 // 就不用写 public = no 了
    valid users = xsb01 xsb02       // valid users = @xsb
    passwd backend = smbpasswd
    passdb file = /etc/samba/smbpasswd      // 密码文件
    path = /data/company/xsb

        重启就会多一个文件 /etc/samba/smbpasswd

        添加组
            groupadd xsb
            useradd -g xsb -M -s /sbin/nologin xsb01
            useradd -g xsb -M -s /sbin/nologin xsb02
            添加 samba 帐号
            smbpasswd -a xsb01
            smbpasswd -a xsb02

            修改用户密码
            smbpasswd weijie //修改用户密码


            /etc/samba/smbpasswd 也类似 /etc/passwd 的格式

    Example 1: allow all IPs in 150.203.*.*; except one
    hosts allow = 150.203. EXCEPT 150.203.6.66

    Example 2: allow hosts that match the given network/netmask
    hosts allow = 150.203.15.0/255.255.255.0

    Example 3: allow a couple of hosts
    hosts allow = lapland, arvidsjaur

    Example 4: allow only hosts in NIS netgroup "foonet", but deny access from one particular host
    hosts allow = @foonet
    hosts deny = pirate

    Default: hosts allow =  # none (i.e., all hosts permitted access)



除了使用smbclient，还可以通过mount和smbcount挂载远程共享文件夹
mount -t smbfs -o username=administrator,password=123456 //192.168.0.1/tmp /mnt/tmp
smbmount //192.168.0.1/tmp /mnt/tmp -o username=administrator
