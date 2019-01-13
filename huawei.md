## about ensp
1. Enterprise Network Simulation Platform
1. 每台设备启动之后占用300MB左右的内存

## header
header login information "内容"     //输入密码之前的提示,不一定要是double quotes,首位两个字符一样即可
header shell information "内容"     //输入密码之后进入shell后的提示

## 文件
move
copy
delete /unreserved /force /quiet
    1. /unreserved 不可恢复
    1. /force 直接删除(5.11版本,switch),应该是改成/quiet了(5.13版本,router)
dir /all
    1. /all 显示回收站中的文件,被“[ ]”包含
undelete 文件   //恢复已删除、未彻底删除的文件
reset recycle-bin
    每个目录都有一个recycle-bin, 要清除recycle-bin, 就需要进入到这个目录，否则无法清除这个目录的recycle-bin
    即recycle-bin和目录是挂钩的

##  
1. display current-configuration
1. display cpu-defend
 
 
1. display cpu-usage configuration
1. display cpu-usage slave
1. display cpu-usage slot
 
 
1. display aaa
    1. configuration
    1. offline-record
        1. all
1. display access-user
1. display accounting-scheme
1. display acl
    1. 
1. display alarm
1. display anti-attack
 
1. display arp
1. display bridge mac-address // Bridge MAC
1. display bpdu mac-address   //BPDU message

## password
1. cipher   with cipher text
1. simple   in plain text

## vty
user-interface maximum-vty 15
user-interface vty 0 14
**user privilege level 2**
authentication-mode aaa
quit

aaa
local-user [用户名] password cipher [密码]
local-user [用户名] service-type telnet
  1. 8021x     802.1x user
  1. bind      Bind authentication user
  1. ftp       FTP user
  1. http      Http user
  1. ppp       PPP user
  1. ssh       SSH user
  1. telnet    Telnet  user
  1. terminal  Terminal user
  1. web       Web authentication user
  1. x25-pad   X25-pad user

vty 0 允许用户tom登录
是这样的逻辑?
    1. 只要设置了maximum-vty 15, 那每个用户都可以在这些个vty中登陆，
    1. 但是可以给不同的vty设置user privilege level, 
    1. 从而在不同的vty执行不同权限的命令?

## console
user-interface console 0 | user-interface current
authentication-mode password
set authentication password cipher [密码]
    * 用户模式下再次quit就可以密码进入了

## 时钟(用户视图)
1. clock timezone [设一个标识，如BeiJing] {add|minus} 8:00
1. clock datetime 18:00:00 2019-01-01
1. display clock utc
1. display clock


## user-interface
1. user-interface current
1. user-interface console 0
1. user-interface maximum-vty ? //the default value is 5

1. display user-interface
  1. +    : Current UI is active.
  1. F    : Current UI is active and work in async mode.
  1. Idx  : Absolute index of UIs.
  1. Type : Type and relative index of UIs.
  1. Privi: The privilege of UIs.
  1. ActualPrivi: The actual privilege of user-interface.
  1. Auth : The authentication mode of UIs.
      1. A: Authenticate use AAA.
      1. N: Current UI need not authentication.
      1. P: Authenticate use current UI's password.
  1. Int  : The physical location of UIs.

## 保存配置
save [文件名]   //default:vrpcfg.zip    .zip|.cfg
autosave interval on
autosave interval [时长]
autosave time [时间点]

交换机不支持 autosave ? 路由器可以

display startup //下次启动时所使用的启动文件情况
    * 为什么ensp 下 display startup 没有系统文件呢?

startup saved-configuration [配置文件]
startup system-software [系统文件]

compare configuration   //

## mac address
display mac-address




## STP
stp enable
stp mode {stp|mstp|rstp}

stp priority [优先级]   //[0,61440] 4096
    stp root primary
    stp root secondary

display stp brief



### problems
1. 备用端口的颜色也是绿色的，全部是绿色的，没有红色标识? 也不闪烁


## vlan
端口默认状态为hybird, 从display port vlan 中可以看出

port link-type access
port default vlan 10
或者这么加入到vlan
    1. 创建vlan10
        vlan 10
    1. 将0/0/9改为access
        interface ethernet 0/0/9
        port link-type access 
    1. 将端口加入到vlan
        port ethernet 0/0/9
        port ethernet 0/0/1 to 0/0/9    (批量) 
port link-type trunk
port trunk allow-pass vlan 10
    port trunk allow-pass vlan all


display port vlan
    如果是 port trunk allow-pass vlan all 的话，只是列出1-4094
display vlan
    会列出具体某个vlan包含哪些端口

display this    //查看这个端口的状态
display interface ethernet 0/0/0 //最详细的查看方法

两个vlan 共用一个网段，如何ping通?

undo vlan 10后在此创建 vlan 10,新创建的vlan 10 中不会包含任何端口

display vlan 后 ports 下面的 UT,GT 是什么意思?

### gvrp
garp (generic Attribute Registration Protocol,通用属性注册协议)

garp 包含了两个具体的协议
    1. **gvrp (garp vlan Registration Protocol)**
    1. gmrp (garp Multicast Registration Protocol)


手工创建的vlan称为静态vlan,通过GVRP创建的vlan称为动态vlan
display vlan type 静态为common, 动态为 dynamic

就是在边界switch上创建了静态vlan后，运行了GVRP的与之直接相连的switch就会自动接收到vlan信息，创建对应的vlan

只有从链路上接收到vlan属性注册报文的端口 才会注册到对应的vlan中

vlan属性的单向注册过程

查看是否开启gvrp
    display this(系统模式)
GVRP 只能用于trunk，Dynamic Vlan 不能将accesss端口加入其中

switch 1
    gvrp
    vlan 10
    quit

    interface ethernet 0/0/1
    port link-type access
    port default vlan 10

    interface ethernet 0/0/2
    port link-type trunk
    port trunk allow-pass all
    gvrp

switch 2
    gvrp

    interface ethernet 0/0/2
    port link-type trunk
    gvrp
    port trunk allow-pass vlan all

    interface ethernet 0/0/3
    port link-type trunk
    gvrp
    port trunk allow-pass vlan all

switch 3
    gvrp

    interface ethernet 0/0/3
    port link-type trunk
    gvrp
    port trunk allow-pass vlan all

    interface ethernet 0/0/1
    port link-type access


## DHCP
1. IETF 制订了 BOOTP(Bootstrap Protocol)专门用来解决IP地址等网络参数的配置问题
1. 后来为了弥补BOOTP的缺陷和不足，IETF又制订了DHCP(Dynamic Host Configuration Protocol),向后兼容BOOTP

DHCP Server/DHCP Client

工作流程
1. 发现(DHCP Client 寻找 DHCP Server的阶段)DHCPDISCOVER
    广播帧
        type 0x0800
        目的IP:255.255.255.255
        源IP:0.0.0.0
        协议字段的值是0x11, UDP
        **目的端口67**
        源端口68
        数据载荷是一个 DHCPDISCOVER消息

        transaction ID(交易号) 来标识请求者(4Bytes)
1. 提供 DHCPOFFER
    DHCPOFFER    
        源端口67
        目的端口68
        目的IP:255.255.255.255
        协议字段的值是0x11, UDP
        type 0x0800

        transaction ID(交易号) 来标识请求者
        
1. 请求 DHCPREQUEST
    PC1的DHCP Client 会发送一个广播帧，意图是向路由器R1上的DHCP Server提出请求，希望获取到该DHCP Server发送给自己的DHCPOFFER 消息中所提供的那个IP地址
    广播帧
        携带有R1上的DHCP Server 的标识(Server Identifier)

1. 确认 DHCPACK/DHCPNACK
    DHCP Server 向 DHCP Client 发送一个DHCPACK消息
        一个广播IP报文中
        目的MAC Address是PC1的MAC Address

        DHCPNACK 表示失败

    PC1 会将ip地址，DHCP Server 的 Server Identifier 记载硬盘，下次启动的时候，直接进入请求阶段

### 配置
dhcp enable
ip pool [pool-name]
network 192.168.1.0 mask 26
gateway-list 192.1668.1.1
lease day 2 hour 2

int g0/0/0
ip address 192.168.1.1 26
dhcp select global

display ip pool name dep1


## 华为产品
1. 3位数的华为路由器貌似都是跟家用路由器一样的
    AR201只有WAN可以直接配置IP，是interface Ethernet0/0/8，其它口要通过vlanif来配置IP
in1. t vlan 1
ip1.  add 192.168.1.1 24
AR201-S 报价(JD) 1839.00 

1. ar1220 ethernet 都是二层端口

dis ip interface brief命令查看哪个是三层口


## vim编辑器
set gcr=a:block-blinkon0
gcr 是 guicursor 的简写，a 表示所有模式，冒号后面是对应模式下的行为参数，每个参数用 - 分隔，block 说明用块状光标，blinkon 表示亮起光标时长，时长为零表示禁用闪烁。也可以是 blinkoff0 或者 blinkwait0。具体参考 :help gcr



## Problems
ensp 是否支持更换系统（像gns3)

开了8个switches, 2个终端
Jan 12 2019 00:44:59-08:00 Huawei %%01CPUUSAGE/4/CPU_USAGE_RESUME(l)[0]:CPU utilization recovered to the normal range.







