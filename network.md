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




## 硬件链路

### 拨号
拨号其实就是验证用户名和密码, 这是一个历史遗留下来的概念.

拨号网络最早来源于电话通信网络，就是打电话时，你必须先拨打电话号码，建立通信连接。打完电话挂机时，系统会自动断开链路。后来，在电话网基础上建立起来的计算机网络，上网连接也采用了类似的方式，即用户每次上网前，也需要先拨号建立连接，然后才能上网。只不过，计算机网络的拨号连接不是拨打电话号码，而是通过Windows自带的拨号软件，使用上网帐号和密码来进行拨号的。

非对称数字用户线路（ADSL，Asymmetric Digital Subscriber Line）是数字用户线路（xDSL，Digital Subscriber Line）服务中最流行的一种

在ADSL的数字线上进行拨号，不同于模拟电话线上用调制解调器的拨号，而采用专门的协议PPP over Ethernet，拨号后直接由验证服务器进行检验，用户需输入用户名与密码，检验通过后就建立起一条高速的用户数字；并分配相应的动态IP。

### FTTH (fiber-to-the-home)
FTTH是指从运营商机房的设备（OLT）一直到用户家中（光猫），全部采用‘光纤’为传输介质，将用户端设备接入互联网的一种接入方式。

ADSL是指从运营商机房的设备（DSLAM）一直到用户家中（猫），全部采用‘铜缆线’为传输介质，将用户端设备接入互联网的一种接入方式。

两种方式均可实现宽带接入，但有所区别，ADSL接入宽带带宽最高为8M，FTTH宽带现阶段带宽可达100M，后期还可实现1000M，FTTH接入是宽带接入的最优方式,


### 为什么宽带提供商允许多拨？

其中一个回答:
    就只是单纯的 pppoe 的 session 限制的问题啊，好奇这里有多少从来没看过文档的程序员
    https://www.v2ex.com/amp/t/563536

其中一个回答
    这个初衷是这样的：起初运营商默认是不允许使用路由器等 NAT 设备的，一个家庭宽带必然服务于整个家庭，这样矛盾就来了，一个家庭必然不止一个设备。基于这一点，运营商就想到一个办法，根据家庭宽带消费等级，分配不同数量的允许客户端。现在运营商默许了路由器的存在，一般新的套餐都不能多拨了，部分老套餐依然可以。
    所以当时每一个客户设备享用一个拨号通道？








