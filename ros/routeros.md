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
        Action:masquerade [,mɑːskə'reɪd; ,mæs-]']
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
    LAN <- 防火墙 TX()
    LAN -> 防火墙 RX()

对于WAN
    WAN <- 防火墙 TX()
    WAN -> 防火墙 RX()

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

Src. address 是指对哪些源地址进行伪装 ( 可以一个可以多个  ),
    Matches packets which source is equal to specified IP or falls into specified IP range.

Dst. address 是指发向哪些主机的数据包要进行伪装 ( 可以一个可以多个  ) ，
    Matches packets which destination is equal to specified IP or falls into specified IP range.

### srcnat & dstnat
中文名称：源地址转换。每个packet都有 source ip 和 destination ip, 把 source ip 替换的就是srcnat, 把destination ip 替换的就是 dstnat

### masquerade
在固定IP的上网方式上，srcnat 还好，WAN口的IP是固定不变的，但是在ADSL拨号上网的方式上，传统的srcnat 就显得有些不太方便了，每次拨号，WAN 口 IP 就会变化，所以 Action:masquerade 代表 srcnat 使用 WAN口 IP 替换源IP


### 源地址转换 chain:srcnat

内网地址转换为外网地址

General
    chain:          srcnat
    Src Address:    就是那些内网 IP 进行转换
    Dst Address: 
Advanced
    Src Address List: 同 General Src Address
    Dst Address List: 同 General Dst Address
Action:
    Action:masquerade

案例一:
    General 
        srcnat
    Action
        Action:masquerade

案例二
    General
        srcnat
        Out Interface:WAN口
    Action:
        Action:masquerade


案例三:
    General 
        srcnat
        Src Address:192.168.1.20          Src Address:192.168.1.0/24        Src Address:192.168.1.10-192.168.1.20

    Action
        Action:masquerade

案例四:(说这个比较高效)
    General 
        srcnat
    Action
        Action:src-nat
        To Address: WAN口地址
        To Ports:不选



### 目标地址转换 chain:dstnat
外网访问内网

General 
    Chain:dstnat
    Dst Address:    WAN口地址
    Protocol:       6 (tcp)
    Dst Port:       3389

Action
    Action:         dst-nat
    To Address:     192.168.10.110(内网服务器地址)
    To Port:        3389


做完之后可以直接在内网用WAN口地址访问?(11集)
   
 
案例二:

General 
    Chain:dstnat
    Protocol:       6 (tcp)
    Dst Port:       3389
    In interface:   WAN口

Action
    Action:         dst-nat
    To Address:     192.168.10.110(内网服务器地址)
    To Port:        3389


## mangle 标记

应该主要是用来标记不同的应用的流量来进行限速

ROS的精华和核心的东西就是 mangle

Forward         转发
Prerouting      路由之前
input           进入路由
output          从路由出去
Postrouting     路由之后

## VLAN

4095个

虚拟局域网 异地相同部门??? 
二层广播帧的传播范围就会被限制得小一些

## 映射和回流

### 映射
内网服务器暴露给互联网
IP -> Firewall -> NAT

General
    Chain:          dstnat
    Dst Address:    WAN口地址
    Protocol:       6
    Dst Port:       3389
Action:
    Action:         dst-nat
    To Address:     服务器地址
    To Port:        3389

### 回流
解决内网用户用对外的地址访问内网的服务器受限
只让那些设置了端口映像的回流即可

外网IP -> WAN口IP -> masquerade(内网的一个IP,或者说打了标记的LAN口IP) -> 内网服务器

内网服务器 -> 
    General
        chain:srcnat
        Dst Address:    内网服务器IP
        Protocol:       6(TCP)
        Port:           80
    Action
        Action:         masquerade      或者 Action: src-nat    To Address LAN口?


## VPN


## ROS 密码找回
Nova/store/user.dat

1. 清空密码
    U盘启动
    挂载
    /nova/store -> /rw/store/user.dat
    直接删除即可
    
1. 密码找回
    Ros Reader (U盘启动)

1. PXE网卡 破解
    Ros Reader 找回



## Simple Queue

General
        limit at:1M
        Max Limit:2M
    Burst
        Burst Limit         4M      突破速度
        Burst Threshold     1500K   突破阈值
        Burst Time          16      突破时间(秒)

    
burst time 时间内，速度没有达到 Max Limit, 速度最大可达 Burst Limit, 一旦平均速度达到Burst Threshold, 降至max limit, 保证 limit at 速度

主要用于开网页


## ROS 安全设置
1. 用户安全性
    1. Group
        1. Full Group 
        1. Normal Group
        1. Read Group
        1. Write Group

1. 服务安全性
    关闭不需要的服务
    限制某些IP才可以访问

1. 防火墙

## Hotspot 热点认证
一种基于 web 的认证, 经过认证后才可以上网

一般步骤
    1. 建立hotspot pool
    1. IP -> Hotspot
            名称
            选择地址池
            Shared Users: 可以有几个登录
            Rate Limit(rx/tx):速度限制
        Users 创建用户密码
            



## 防火墙

1. input
    进入路由器，packet 的目的地址是路由器的某一个接口

1. output
    从路由器出来，packet的源IP地址是路由器的某一个接口

1. forward
    原地址和目标地址均不是路由器的某个接口


实验一
    禁止内网 ping 路由器



## 总结关于内网IP访问Internet 之 srcnat
General中 out interface 写与不写
Action中 masquerade 与 (srcnat src address wan口)
方法一
    General
        chain:srcnat
        src address:不写
        out interface:wan口
    Action
        action:masquerade
方法二
    General
        chain:srcnat
        src address:不写
    Action
        action:masquerade

方法三
    General
        chain:srcnat
        src address:不写
    Action
        action:masquerade

