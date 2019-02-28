# software Router

## 品牌
1. routeros
1. 海蜘蛛
1. openwrt
1. pfsense
1. m0n0wall
1. 爱快
1. LEDE
    Linux嵌入式开发环境项目（Linux Embedded Development Environment，LEDE），是路由器固件项目OpenWRT的一个复刻分支项目，并继承原来OpenWRT的开发目标。


## What’s a Virtual Router (vRouter)?
https://www.sdxcentral.com/networking/nfv/mano-lso/definitions/whats-a-virtual-router-vrouter/

## NFV - Computer Definition
    (Network Functions Virtualization) Virtualizing networking functions in commodity hardware rather than specialized devices. NFV is complementary to software-defined networking, in which fixed-function routing has been placed under software control. NFV deals with the many other devices in a network. For example, with NFV, dedicated hardware boxes such as CDN appliances, access servers, WAN accelerators and monitors become virtual appliances in standard server hardware. See software-defined networking, virtual appliance and virtual router.



## RouterOS
公司名称
    MikroTik(Mikrotiks SIA)
    东欧小国拉脱维亚

官网
    www.mikrotik.com
    www.routeros.com

最初 MikroTik 开发RouterOS 目的是解决无线局域网传输问题（WLAN），后来通过不断扩展功能实现了各种功能的应用

在国内最大的使用人群是网吧和小区宽带、这个和国外的情况有点差别，在国外 RouterOS 不仅用于解决路由管理，大多应用在 WLAN 的覆盖和传输，RouterOS 在基于 802.11abgn 协议上的高带宽传输有自己的明显优势，特别是他独有的 Nstrem 和 Nv2 协议。

从最开始的网吧多线路与流控和小区宽带，后来的 VPN 方案解和企业管理

如对一些功能提供较开放的设置，特别脚本编写，灵活的处理各种功能，让管理员能对路由器进行一些弹性的控制！


MikroTik  发展历程：
    1. 1995 年开始基于 WISP 方案解决；
    1. 1996 年将无线 ISP 计划推向全球；
    1. 1997 年开发 RouterOS 的软件，基于 Intel（PC）解决路由技术问题；
    1. 2002 年拥有 RouterBOARD 的硬件。

等级
    level 0
    level 3
    level 4
    level 5
    level 6


x86 硬件支持
    1. AMD、Intel、VIA 和其他 兼容的 x86 平台
    1. SMP – RouterOS 3.0 后兼容的多核心处理器和多处理器（RouterOS v5.x 对多核心处理做更好的优化）
    1. 内存：最小 32MB， 最大：RouterOS v2.9 仅支持 1G 内存，RouterOS v3.0 后支持 2G 内存
    1. 存储：IDE、SATA,、CF 存储卡、USB、DOM 闪存盘和 SCSI（5.x 版本），最小需要 64MB 空间， 建议系统硬盘不大于 80G
    1. Linux v2.6 内核支持的扩展槽 PCI、PCI-e、PCI-X


连接
    1. 如果不想这么麻烦，可以不设置ip，点击winbox的...，会自动看到routeros的mac地址，用这个地址进行连接，当然必须要在同一个网段下才可以。
        https://www.cnblogs.com/EasonJim/p/9548984.html
    1. WinBox
        1. Winbox 是 RouterOS 的一个 Windows 远程图形管理软件，使用 TCP 端口 8291
        1. 在VMware中配置好路由器后，登陆管理地址就可以下载WinBox了
    1. 本地 teminal console - PS/2 或 USB 键盘和 VGA 显示卡进行控制
    1. Serial console – 任何 (默认使用 COM1) RS232 异步串口，串口默认设置为 9600bit/s, 8 data bits, 1 stop bit, no parity, hardware (RTS/CTS) flow control。
    1. Telnet – telnet 服务默认运行在 TCP 端口 23
    1. SSH - SSH (安全 shell) 服务默认运行在 TCP 端口 22
    1. MAC Telnet - MikroTik MAC Telnet 协议被默认启用在所以类以太网卡接口上。

QoS
    简单快速的 QoS 工具(Simple queues)

监控软件
    Dude
        https://www.iiiff.com/article/96890

        6.37以下的版本，winbox会有安装后不显示Dude栏的问题，所以尽量安装更新版本
        dude版本需要跟ROS版本一致

安装
    所有 RouterBOARD 重装都必须通过 Netinstall



## 虚拟机安装教程
注意点
    1. 内核版本
        1. RouterOS 5.21
            LINUX内核版本为2.6.35
        1. RouterOS 6.x
            LINUX内核版本为3.3.5+
    1. 硬盘只能用IDE硬盘

操作
    1. p 上一个
    1. n 下一个
    1. spacebar 确定
    1. a :all
    1. M :minimum
    1. i : to install locally 
    1. q : cancel and reboot

输入a选择全部,i 安装
don't keep old configuration


## 实际操作

1. interface   ,     print          查看网卡信息
1. /    返回根目录
1. ip   ,   address     进入ip地址配置目录
    1. add address 192.168.1.1/24 interface 网卡名


### 开启ftp服务
IP>services>ftp>available from
    192.168.1.0/24

还需要有相关的人员可以对其进行操作
system>users>group>
    新增一个 ftp group
然后在ftp group 中添加一个用户
    设置密码
    allowed address 默认0.0.0.0即可

### 增加Users
system>Users


### 备份
1. 网页端
    files > backup
        文件名
        可以选一个密码用于恢复时
        可以选择是否加密(Encrypt)

1. telnet下载备份
    telnet 10.0.1.11
    用户名，密码
    system backup save name=文件名
    file print
    上下键

    恢复备份文件
        system backup load name=文件名

1. ftp下载备份文件
    1. cmd方式
        cmd
        ftp
        o 10.0.1.11
        用户名,密码
        ls (我用的ftpuser1，提示没有权限;用admin登陆 ls 没反应-> cannot build data connection)
        get 文件名
        put 文件名  （上传文件）

    1. 浏览器可以，没有问题

### wan口
address :   ip address add address 192.168.2.1/30 interface wan
gateway :   ip route ,add gateway 192.168.2.2
    A:active
    C:connected
    D:dynamic
    S:static
dns     :   ip dns, set server 8.8.8.8,8.8.4.4,223.5.5.5,223.6.6.6
ping测试:   tool ping,???  //命令行里边的ping不好用啊



## 重启
/system reboot













