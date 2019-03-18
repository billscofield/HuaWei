/etc/network/interface
auto eth0
iface eth0 inet dhcp

auto: the interface should be configured during boot time.
iface : interface
inet: interface uses TCP/IP networking.

That means interface eth0 should be configured during boot time , and interface name eth0

uses TCP/IP protocol and can be configured by dhcp .

here is another 
    1. https://unix.stackexchange.com/questions/128439/good-detailed-explanation-of-etc-network-interfaces-syntax

互联网络分组交换(internet packet exchange, IPX)

OSI reference model 
    互操作性，简单，模块化设计和培训目的

应用层提供了人与应用程序交互的界面
    IOS(internetwork operation system)提供的CLI, web图形化界面，cisco路由器具有图形用户界面，称为安全设备管理器（security device manager,SDM)
    用用程序本身不是OSI参考模型的应用层：应用层为应用程序提供了知道网络存在和利用网络的方式。即应用层封装了一组协议和服务，应用程序使用它就可以访问网络资源。
        包括telnet,FTP，HTTP,POP3,SMTP
会话层负责网络连接的建立、维持和终止，实际技术细节在传输层实现。其实例包括RPC和NFS

传输层
    它会**多路复用连接**，允许同一网络设备上的多个应用程序同时发送和接收数据
        两个设备间可能有多个连接，所以需要用多路复用功能以区分不同连接间传送的数据，传输层为每个连接分配一个源port,和目的port
         multiplexing (sometimes contracted to muxing) is a method by which multiple analog or digital signals are combined into one signal over a shared medium. 
    5个主要功能：连接管理，可靠和不可靠的数据传输，流控制，多路复用和分段。


