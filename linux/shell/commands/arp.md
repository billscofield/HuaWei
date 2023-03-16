Create a file and wirte binding information to it

    echo ‘192.168.1.1 00:02:B3:38:08:62 ‘ > /etc/ip-mac-binding

Set automatic binding at startup

    cho ‘arp -f /etc/ip-mac-binding ‘ >> /etc/rc.d/rc.local

1）查看arp缓存

    arp -nv

    Address                  HWtype  HWaddress           Flags Mask            Iface
    10.0.1.19                ether   14:a9:3e:7d:df:0c   C                     enp0s25
    10.0.1.15                ether   14:17:eb:9d:1f:09   CM                    enp0s25

    C: completed entry
    M: manual
    P: 好像是代理相关

    When adding proxy arp entries (that is those with the publish ("pub") flag
    set a netmask may be specified to proxy arp for entire subnets. This is not
    good practice, but is supported by older kernels because it can be useful.
    If the temp flag is not supplied entries will be permanent stored into the
    ARP cache. To simplify setting up entries for one of your network
    interfaces, you can use the "arp -Ds address ifname" form. In that case the
    hardware address is taken from the interface with the specified name.)


2）添加arp缓存条目

    arp -s 10.1.1.1 00:11:22:33:44:55:66

    set

3）删除arp缓存条目

    arp -d 10.1.10.118

4）指定回复的MAC地址

    arp -i eth0 -Ds 10.0.0.2 eth1 pub
    提示：当eth0收到IP地址为10.0.0.2的请求时，用eth1的MAC地址应答

net-tools
    arping
