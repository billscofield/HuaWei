
### ip

redhat 
    systemctl restart network

debian 
    systemctl restart networking


### ping

-b     Allow pinging a broadcast address.


### netstat

net-tools

This package includes the important tools for controlling the network
subsystem of the Linux kernel.  This includes arp, ifconfig, netstat,
rarp, nameif and route.  Additionally, this package contains utilities
relating to particular network hardware types (plipconfig, slattach,
mii-tool) and advanced aspects of IP configuration (iptunnel, ipmaddr).


-a, --all
    Show both listening and non-listening sockets.  With the --interfaces option, show interfaces that are not up

-c, --continuous
    This will cause netstat to print the selected information every second continuously.

-C
    Print routing information from the route cache.

--route, -r
    Display the kernel routing tables. See the description in route(8) for details.  netstat -r and route -e produce 
    the same out‐put.


### 修改 MAC 地址

方法一: 

    修改 /etc/network/interfaces, 加一行 hwaddress ether ##:##:##:##:##:##

方法二:
    
    hw ehter <mac addr.>

方法三:

    ip link set dev enp0s31f6 down
    ip link set dev enp0s31f6 address XX:XX:XX:XX:XX:XX
    ip link set dev enp0s31f6 up
    ip link show enp0s31f6

方法四:

    1、以 root 身份使用编辑器打开 /etc/init.d/networking；

    2、搜索 case "$1"

    3、在start) 下面添加

        ifconfig 网卡名(eg:eth0) hw ether xx:xx:xx:xx:xx:xx (新的的mac地址)


###  修改 DNS  ???

debian 10 buster 中直接修改 /etc/resolv.conf


但是有点迷惑

1. /etc/resolvconf/resolv.conf.d/base
    
    一说这个文件

1. /etc/systemd/resolv.conf     (This file is part of systemd.)
    systemctl restart systemd-resolved.service

    这种方法不会更新 /etc/resolv.conf, nslookup 还是用的原来的, 如果删除 /etc/resolv.conf, 会找不到 DNS

    但是 resolvectl status 却显示 current DNS 是 /etc/systemd/resolv.conf 中设置的

ubuntu中 /etc/resolv.conf 是链接文件

    lrwxrwxrwx 1 root root 39 8月  26 19:05 resolv.conf -> ../run/systemd/resolve/stub-resolv.conf

    ```
    # This file is managed by man:systemd-resolved(8). Do not edit.
    #
    # This is a dynamic resolv.conf file for connecting local clients to the
    # internal DNS stub resolver of systemd-resolved. This file lists all
    # configured search domains.
    #
    # Run "systemd-resolve --status" to see details about the uplink DNS servers
    # currently in use.
    #
    # Third party programs must not access this file directly, but only through the
    # symlink at /etc/resolv.conf. To manage man:resolv.conf(5) in a different way,
    # replace this symlink by a static file or a different symlink.
    #
    # See man:systemd-resolved.service(8) for details about the supported modes of
    # operation for /etc/resolv.conf.

    nameserver 127.0.0.53
    options edns0

    ```



### write

write user [tty]

双方都要运行，没有运行的不能发送


### wall


### mail

N 代表未读
& 提示读哪一封邮件
h 列出
d 删除


### lspic

lspic | grep -i ethernet

### nmcli (network-manager)


### ethtool

apt install ethtool

query or control network driver and hardware settings

ethtool ens18


ethtool -p|--identify DEVNAME   [ TIME-IN-SECONDS  ]        (ethtool -h)

    Show visible port identification (e.g. blinking)

    ethtool -p ens18 10


禁止 ping
    echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_all

### curl

测端口

curl ip:port



