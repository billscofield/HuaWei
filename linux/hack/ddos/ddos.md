
## DDOS(Distributed Denial of Service)


## 常见类型

1. TCP SYN 泛洪攻击
    攻击目标: Web 服务器

1. CC 攻击
    攻击目标: Web 服务器

1. UDP flood
    攻击目标: 各种服务器

1. ICMP flood
    攻击目标: 各种服务器

1. DHCP flooding
    攻击目标: DHCP服务器

1. MAC flooding
    攻击目标: 交换机

1. 其他


## DDoS现状和典型案例

游戏公司
电商

目的
    商业恶性竞争
    敲诈勒索
    实施报复

摄像头僵尸网络军团


## DDoS 与 CC 攻击初体验

1. 软件: pentmenu

    功能: 包含大部分 Flooding 攻击模块

    git clone https://github.com/GinjaChris/pentmenu


1. 软件: dhcpig

    功能: DHCP flood 攻击

    依赖软件: scapy

    安装方式一

        apt install dhcpig

    安装方式一

        https://github.com/kamorin/DHCPig

    pig.py eth0


1. 软件: macof

    功能: mac flood

    https://github.com/WhiteWinterWolf/macof.py

    macos.py -i eth0


1. cc 攻击

    软件: ab

    -n: 多少个
    -c: 并发
    -t: 时间(秒)


## 防御DDoS方法

网络设备设施
    1. 扩充带宽硬抗
    2. 使用硬件防火墙
    3. 选择高性能设备

有效的抗D思想和方案
    1. 服务器负载均衡
    2. CDN流量清洗

预防为主思想
    1. 筛查系统漏洞
    2. 过滤不必要的服务和端口
    3. 系统资源优化
    4. 等等

