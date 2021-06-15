## 网络连通性

### ping 

RTT(Round-Trip Time): 往返时延，在计算机网络中它也是一个重要的性能指标，它表示从
发送端发送数据开始，到发送端收到来自接收端的确认（接收端收到数据后便立即发送确
认），总共经历的时延;

    rtt min/avg/max/mdev = 4.131/4.131/4.131/0.000 ms

ping -I 网卡 <ip>

    Two character prefixes based on the type of interface:
        en — Ethernet
        sl — serial line IP (slip)
        wl — wlan
        ww — wwan
    Type off names:
        p<bus>s<slot>

    en代表以太网卡
    p3s0代表PCI接口的物理位置为(1, 0), 其中横座标代表bus，纵座标代表slot
    (https://blog.csdn.net/don_chiang709/article/details/89925602)
    (https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/)

ping -s 1500(byte) <ip>
        数据字段, 没有包括协议头等

### traceroute

traceroute -n

    -n 不解析域名

    *** 的表示拒绝该请求或全丢

traceroute -i <device>

### mtr(a network diagnostic tool) 比traceroute 更加直观，丢包率, traceroute的升级版本

mtr baidu.com
然后按
    h 帮助
    n 不解析(toggle DNS on/off)
    p pause(space to resume)

### nslookup 和 dig

用于域名解析

nslookup z.cn
nslookup z.cn 指定DNS进行解析

nslookup -type=mx hjimi.com 邮箱

nslookup -type=any hjimi.com

### dig, nslookup升级版本

dig z.cn

dig -t mx hjimi.com

dig -t any hjimi.com

dig +trace hjimi.com

    整个域名解析的流程追踪
    
dig @223.5.5.5 hjimi.com

    指定哪个DNS进行解析


### telnet

telnet hjimi.com 80

    测试网站是否可以访问


## 网卡别名修改

eth0 根据mac的大小，来0,1,2


## net-tools 和 iproute2

ip addr show 

    查看ip地址
    (ip a 简写)

ip link set up ens0

    启用网络设备

ip link set down ens0

    禁用网络设备

ip addr add 192.168.1.199/24 dev eth0

    临时ip,不会覆盖，而是添加

ip addr del 192.168.1.199/24 dev eth0

    删除临时ip

ip link set dev eth0 address FF:FF:FF:FF:FF:FF

    修改mac地址

ip route show

    查看路由(ip r)

ip route add default via 192.168.1.1 dev eth0
ip route replace default via 192.168.1.1 dev eth0
    添加默认路由

ip route add 172.16.16.0 via 192.168.1.1 dev eth0    

    添加静态路由

ip route delete 

    删除默认路由

ip neigh

    查看arp信息

ip neigh add 192.168.1.100 addr 00:0c:29:c0:5a:ef dev eth0

    添加arp绑定

ip neigh del 192.168.1.100 dev eth0

    删除arp绑定


查看网络连接

ss -ltp

    -t tcp

    -l listening

    -n numeric, do not try to resolve service names

    -p show process using socket

    -u udp
