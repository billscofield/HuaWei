## Linux Virtual Server

章文嵩

linuxvertualserver.org

根据 ip 和端口号进行分发

管理工具

    ipvsadm 手动管理工具

    keepalive 

LB
    负载均衡的软件  (LB Director 负载均衡器)
        - lvs
        - nginx
        - haproxy

    负载均衡的硬件
        - F5
        - Citrix, Netscaler
        - A10
        - 深信服
HA
    高可用(ha)
        keepalived 软件
        heartbeat 软件

HPC
    High performance, 高性能计算集群
    hadoop

## 4个IP

1. VIP(Virtual IP Address)

    虚拟IP地址: Director 用于想客户端提供服务的IP地址, 例如 baidu.com 解析到 VIP 上

2. RIP(Real Server IP Address)

    在集群下边的节点的IP地址

3. DIP(Director IP)

    链接内外网的IP, 是负载均衡器上的IP地址

4. CIP(Client IP Address)

    客户端IP


USER
shell       -> ipvsadm  / keepalived
kernel      -> IPVS(内核中的模块)
硬件

负载均衡
    - http 重定向(302)
    - DNS 负载均衡
    - 反向代理
        - squid
        - nginx
    - ip 负载均衡
    - 数据链路层均衡
    - F5 硬件 


## 4 种工作模式

1. dr (direct routing) 直接路由模式

    Virtual Server via Direct Routing(VS/DR)

    改写请求报文的目标 MAC 地址, 将请求发送给真实服务器，而真实服务器将响应后的
    处理结果直接返回给客户端

    一般是请求比较小，响应比较大

    ```
     +-------<----------------------+
     |                             /|\
    \|/                             |
    cip ---->----vip:dip--------->RIP(vip绑定到 lo上)
    ```

    RIP上要做 vip 的 arp 抑制

    1. 请求报文经过调度器，RS相应的保温无需经过调度器, 因此并发访问量大时使用效率很高(对比NAT)
    2. 因为是通过MAC地址，节点和调度器(director) 要在一个局域网内
    3. RS 节点的 VIP 绑定(lo:vip, lo1:vip) 和 ARP 抑制问题
    4. 无法更改请请求报文的目标端口
    5. 日 2000W PV 或并发请求1W 以下都可以考虑用 haproxy/nginx(LVS NAT 模式)

2. nat (Network Address Translation)模式

3. tnu 隧道

4. full nat 完全nat


### 1. dr(direct routing)


### 2. nat



### 3. tnu 隧道



### 4. full nat
