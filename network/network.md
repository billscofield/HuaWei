## 

## 基带传输和宽带传输的区别

1. 基带传输：信号源产生的原始电信号称为基带信号，将数字数据0、1直接用两种不同的
   电压表示，然后送到线路上去传输。

1. 宽带传输：将基带信号进行调制后形成模拟信号，然后采用频分复用技术实现宽带传输。

BASE是英文baseband的缩写，指的就是基带。表示没有使用频分复用或者其它频率转换技
术，每一个信号在一个单一频率上完全控制线缆。


1. 100BASE-T has three major standard versions in copper and fiber mediums:

    1. 100BASE-TX: Used for full-duplex point-to-point communication with two
       twisted cable pairs. One pair receives signals while the other sends
       them. 100BASE-TX uses an RJ-45 cable for physical connection and
       supports segment lengths of up to 100 meters.

    1. 100BASE-T4: One of the earliest Fast Ethernet versions. It uses CAT-3
       twisted pair cables, and requires four cable pairs for communication.
       One pair receives and one pair sends signals. The two remaining pairs
       are reserved and used as required.

    1. 100BASE-FX: This optical fiber cable standard uses thin infrared light
       wavelengths for communication via two twists of cable. The two strands
       are used to transmit and receive signals; one sends and the other
       receives to provide full-duplex communication. 100BASE-FX allows for a
       distance of up to six miles between two stations. A repeater is required
       every 165 yards over long haul distances.


1. CAT3,4,5,6

    没有电磁干扰的情况下，能够承载的最大数据传输速率

cat 5e      1Gbps       Enhanced
cat 6       1Gbps       10Gbps(cable length under 100 meters)
cat 6a      10Gbps      Augmented
cat 7       10Gbps      Added shielding to the wires(Cat6 的屏蔽版本)
cat 8       40Gbps      (distance up to 30 meters,屏蔽)


/etc/network/interface
auto eth0
iface eth0 inet dhcp

auto: the interface should be configured during boot time.
iface : interface
inet: interface uses TCP/IP networking.

That means interface eth0 should be configured during boot time , and interface
name eth0

uses TCP/IP protocol and can be configured by dhcp .

here is another 

    1. https://unix.stackexchange.com/questions/128439/good-detailed-explanation-of-etc-network-interfaces-syntax

互联网络分组交换(internet packet exchange, IPX)

OSI reference model 
    互操作性，简单，模块化设计和培训目的

应用层提供了人与应用程序交互的界面

    IOS(internetwork operation system)提供的CLI, web图形化界面，cisco路由器具有
    图形用户界面，称为安全设备管理器（security device manager,SDM)

    用用程序本身不是OSI参考模型的应用层：应用层为应用程序提供了知道网络存在和利
    用网络的方式。即应用层封装了一组协议和服务，应用程序使用它就可以访问网络资
    源。包括telnet,FTP，HTTP,POP3,SMTP会话层负责网络连接的建立、维持和终止，实
    际技术细节在传输层实现。其实例包括RPC和NFS

传输层

    它会**多路复用连接**，允许同一网络设备上的多个应用程序同时发送和接收数据

        两个设备间可能有多个连接，所以需要用多路复用功能以区分不同连接间传送的
        数据，传输层为每个连接分配一个源port,和目的port
        
        multiplexing (sometimes contracted to muxing) is a method by which
        multiple analog or digital signals are combined into one signal over a
        shared medium.  5个主要功能：连接管理，可靠和不可靠的数据传输，流控制，
        多路复用和分段。




## 硬件链路

### 拨号

拨号其实就是验证用户名和密码, 这是一个历史遗留下来的概念.

拨号网络最早来源于电话通信网络，就是打电话时，你必须先拨打电话号码，建立通信连
接。打完电话挂机时，系统会自动断开链路。后来，在电话网基础上建立起来的计算机网
络，上网连接也采用了类似的方式，即用户每次上网前，也需要先拨号建立连接，然后才
能上网。只不过，计算机网络的拨号连接不是拨打电话号码，而是通过Windows自带的拨号
软件，使用上网帐号和密码来进行拨号的。

非对称数字用户线路（ADSL，Asymmetric Digital Subscriber Line）是数字用户线路
（xDSL，Digital Subscriber Line）服务中最流行的一种

在ADSL的数字线上进行拨号，不同于模拟电话线上用调制解调器的拨号，而采用专门的协
议PPP over Ethernet，拨号后直接由验证服务器进行检验，用户需输入用户名与密码，检
验通过后就建立起一条高速的用户数字；并分配相应的动态IP。

### FTTH (fiber-to-the-home)

FTTH是指从运营商机房的设备（OLT）一直到用户家中（光猫），全部采用‘光纤’为传输介
质，将用户端设备接入互联网的一种接入方式。

ADSL是指从运营商机房的设备（DSLAM）一直到用户家中（猫），全部采用‘铜缆线’为传输
介质，将用户端设备接入互联网的一种接入方式。

两种方式均可实现宽带接入，但有所区别，ADSL接入宽带带宽最高为8M，FTTH宽带现阶段
带宽可达100M，后期还可实现1000M，FTTH接入是宽带接入的最优方式,


### 为什么宽带提供商允许多拨？

其中一个回答:

    就只是单纯的 pppoe 的 session 限制的问题啊，好奇这里有多少从来没看过文档的
    程序员

    https://www.v2ex.com/amp/t/563536

其中一个回答

    这个初衷是这样的：起初运营商默认是不允许使用路由器等 NAT 设备的，一个家庭宽
    带必然服务于整个家庭，这样矛盾就来了，一个家庭必然不止一个设备。基于这一点，
    运营商就想到一个办法，根据家庭宽带消费等级，分配不同数量的允许客户端。现在
    运营商默许了路由器的存在，一般新的套餐都不能多拨了，部分老套餐依然可以。所
    以当时每一个客户设备享用一个拨号通道？








