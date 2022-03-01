[link](baidubaike)
SMB(全称是Server Message Block)是一个协议名，它能被用于Web连接和客户端与服务器
之间的信息沟通。SMB最初是**IBM的贝瑞·费根鲍姆（Barry Feigenbaum）**研制的，其目的是
将DOS操作系统中的本地文件接口“中断13”改造为网络文件系统。

[link](https://www.educba.com/what-is-smb/)
BM first created server Message Block (SMB) protocol in the 1980s. It is one of
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
享文件安全传输研究的平台。但是，SMB协议中采用控制文件安全传输的机制是使用客户身
份验证的方式，该方式通过客户端向服务器端发送验证密码来获取文件传输的权限，不过
针对该机制的网络攻击相对严重，攻击程序通过对验证密码的截获来窃取文件的访问权限，
局域网下文件传输的安全性得不到保障。


## What is Samba?

As the front page at samba.org says:

**Samba is the standard Windows interoperability suite of programs for Linux
and Unix.**

Since 1992, Samba has provided secure, stable and fast file and print services
for all clients using the SMB/CIFS protocol, such as all versions of DOS and
Windows, OS/2, Linux and many others.

Samba is an important component to seamlessly integrate Linux/Unix Servers and
Desktops into Active Directory environments. It can function both as a domain
controller or as a regular domain member.

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
solutions and Android. The best alternative is Syncthing, which is both free
and Open Source. Other great apps like Samba are Onionshare (Free, Open Source),
NitroShare (Free, Open Source), Magic Wormhole (Free, Open Source) and
Univention Corporate Server (Free, Open Source).


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
       The NAS software is based on FreeBSD and the OpenZFS file system.

    5. ConnectedNAS: ConnectedNAS, software developed by Connected Way, serves
       as an SMB server and client for Android devices. Users of the paid app
       can easily exchange data between the mobile device and other SMB devices
       –whether privately or within a company. For security reasons,
       ConnectedNAS only supports SMB from version 2.



[link](https://blog.csdn.net/qq_30782455/article/details/96345259)

Samba启动服务中的nmb是什么

组成Samba运行的有两个服务，一个是SMB，另一个是NMB；SMB是Samba 的核心启动服务，
主要负责建立 Linux Samba服务器与Samba客户机之间的对话， 验证用户身份并提供对文
件和打印系统的访问，只有SMB服务启动，才能实现文件的共享，监听139 TCP端口；

而NMB服务是负责解析用的，类似与DNS实现的功能，NMB可以把Linux系统共享的工作组名
称与其IP对应起来，如果NMB服务没有启动，就只能通过IP来访问共享文件，监听137和138
UDP端口。

