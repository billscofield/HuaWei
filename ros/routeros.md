## MikroTik
基于 Debian 开发，引导方式为 LILO(LInux Loader)
ros 2.x 3.x 4.x 5.x 6.x

MikroTik RouterOS 6.x – Linux Kernel version 3.3.5+


n:  next
p:  previous
i:  install 
a:  select all
q:  quit

MikroTik Login: admin
password      : 空


/interfaces print
/ip address add address=192.168.1.254/24 interface=ether1


/system reboot

## UPGRADE
winBox 连接上后标题栏上有版本号

官网下载升级包
下载的文件名都是大写的?
必须改成小写的才可以?

拖进winBox 的 FTP里边

system reboot

## 降级 DownGrade

降级包
改成小写
拖进winBox 的 FTP里边

system Packages -> Downgrade

## 管理工具

1. winBox
    tcp port 8291 
    或者通过 MAC 地址来登录

    安装完成后一般可以用 MAC 登录

    可以从 路由器的管理页面www 下载 winBox

1. telnet
    tcp port 23

1. ssh
    tcp port 22

1. webBox
    首先必须开启 www 服务, ip -> service
    也可以从这里下载 winBox

各端口可通过 ip -> service 查看

/system license print

## 组件

1. interface    网络接口
    ether1
    ether2
1. wireless     无线网络
1. bridge       桥接
1. ppp          虚拟拨号
1. ip
    ARP
    DHCP
    DNS
    Firewall
    motspot 热点认证
    Route
    Services
ports   端口

quenes          限速
drivers         设备
System          
    Identity    命名
    License     授权
    Packages
        无线组件啊,ppp啊等等安装 MikroTik RouterOS 时让你选装的组件
    Password
    Ports
    Reboot
    Schedule
    Scripts
    Shutdown
    Users
    Watchdog
   
    卸载某些包后如何重新安装?
        找到相应的包，FTP 上传即可 


## 固定IP上网

IP          10.172.16.117/24
GW          10.172.16.253/24
内网路由IP  192.168.1.254/24

一般步骤
    1. 确定内外网卡, 为方便记忆，重命名
        重命名为 LAN,WAN
            没有插外网线，LAN有流量
            或者看 MAC 地址
            来确定 LAN 口
    1. 增加IP地址
    1. 伪装(IP -> Firewall -> Nat)
        chain:srcnat
        src. Address:192.168.1.0/24
        Action:masquarade
    1. 路由(IP -> Routers)
        Destination:0.0.0.0/0
        Gateway:ISP IP(10.172.16.253/32)
        
        状态AS: Active, Static
    1. DNS(可省略 IP -> DNS)
        如果不设置的话，在 RouterOS 里是不能 ping 域名的

        勾选 Allow Remote Request

        此时就可以使用 RouterOS 的 LAN 口作为计算机的 DNS 地址


/interfaces address 

## PPPoE 拨号上网

一般步骤
    1. 区分内外网卡
    1. 建立 PPPoE 拨号
        方法一: Interface -> 加号(PPPoE)
        方法二: PPP
        
        General
            Name: 可以随便取一个
            Type: PPPoE Client
            Interface: WAN口

        Dial Out
            User:ISP用户名
            Password:ISP密码

            Dial on Demond(按需拨号)
        
        连接状态R: running

        Interface 可以看到 WAN 有个状态为 dynamic 的IP
    1. 伪装
        chain:srcnat
        action:masquarade
    1. 路由(ip -> routers)
        D: dynamic
        A: active
        C: connected
        
        Destination:0.0.0.0/24
        Gateway Interface:ADSL   wan口可以吗???

        或者 Interface 中勾选 "Add default route" 动态路由
    1. DNS
        
## 关于Rx 和 Tx
Tx 上传
Rx 下载
这两个概念都是相对于 RouterOS 来讲的

WAN--防火墙--LAN
从防火墙的角度看，RX 就是进入防火墙，TX就是走出防火墙

对于LAN
    LAN <- 防火墙 TX(下载)
    LAN -> 防火墙 RX(上传)

对于WAN
    WAN <- 防火墙 TX(下载)
    WAN -> 防火墙 RX(上传)

Name    TXRate      RXRate
LAN     10Mbps      1Kbps
WAN     1Kbps       10Mbps

## 关于伪装
General
    chain:srcnat
    (Src Address:!192.168.1.10) 这个IP不能上网
Action:
    Action:src-nat
    To Address:ADSL地址    




## PPP服务器
小区用的多,
PPPoE 有 server 和 client

一般步骤
1. ip 地址池
    /ip pool add name=pool-PPPOE ranges=1.1.1.1-1.1.1.10

    Next Pool: 当当前地址池用完之后用哪个地址池

1. 创建profile配置文件
    /ppp profile add name=profile_1M local-address=1.1.1.1 remote-address=pool-PPPOE
    dns-server=8.8.8.8,223.5.5.5 rate-limit=100K/1M only-one=yes
1. 创建 secret 账号
    /ppp secret add name=123 
1. 伪装


## DHCP
网吧
DHCP server udp 67
DHCP client udp 68

一般步骤
1. 建立DHCP地址池
    IP -> pool
1. 添加DHCP服务，规则,参数
    IP -> DHCP Server





## NAT
Dst-nat 目标地址转换,也就是我们说的端口映射

比如，我们内外有一台服务器IP地址是192.168.1.200，为了使外部网络能访问到我们内网的服务器，我们就必须使用 dst-nat
