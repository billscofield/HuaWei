## 常见隧道

pptp
ipsec
ssh
LVS
    TUN(ipip)模式




tun和tap是两个虚拟的网络设备，通过读写它们，可以实现操作底层的数据包。tap模拟了以太网设备从而可以处理第二层的数据包--帧，而tun则模拟了网络层设备，它可以处理第三层的数据包--IP数据包。


                        Internet
        VPN网关           隧道             VPN网关



### VPN 分类

1. 个人电脑远程拨号到企业办公网络

    a. 员工出差，访问内部的域控、OA
    b. 运维人员 IDC 内网服务器, 无固定IP


1. 企业内部网络之间 VPN 服务
    
    公司分支机构的局域网


1. 公司多 IDC 机房之间


1. 企业外部 VPN 服务
    
    供应商、合作伙伴的 LAN 和本公司的 LAN 之间建立的 VPN 服务

1. 访问国外网站


### 常见隧道协议

1. PPTP

    点到点隧道协议，是由 微软 和 3COM 等公司开发

    开源软件

    客户端到企业

    只能在两端点间建立 单一隧道

    没有供隧道验证

1. L2TP(Layer 2 Tunneling Protocol)

    第二层隧道协议, IETF 基于 L2F(Cisco的第二层转发协议)开发,
    
    支持在两端点间建立 多隧道

    可以提供隧道验证

    一般和 IPSec 同时使用, 由 IPSEC 提供隧道验证

    自身不提供加密和保密, 所以一般和 IPSEC 一同使用

1. IPSec

    IP 安全协议(IP Security)
    实际上是一套协议包而不是一个独立的协议
    IPSec 隧道模式是封装、路由与解封装的整个过程

    一般用于两机房或多地公司之间

    当以隧道模式使用 IPSec 时，其只为 IP 通讯提供封装。
    
    使用 IPSec 隧道模式主要是为了与其他不支持 IPSec 上的 L2TP 或 PPTP VPN隧道技术的路由器、网关或终端系统之间的相互操作

1. SSL VPN
    
    有许多子协议组成。主要是 握手协议 和 记录协议

    SSL 独立于应用，因此任何一个应用程序都可以使用

    典型的 SSL VPN 应用是 OpenVPN

        大量使用了 OpenSSL加密库，以及SSL/TLS协议

        C/S架构, 不是基于 Web 的 VPN 软件，也不与 IPSec 及其他 VPN 软件包兼容


### 实现 VPN 功能的常见开源软件

1. PPTP VPN

    最大的优势在于 无需在 windows 客户端单独安装 VPN 客户端软件，windows 默认就支持 PPTP VPN 拨号连接功能

    很多地方不支持

1. SSL VPN

    OpenVPN
    
    除了PPTP的使用场景, 还适合异地公司之间

    需要单独安装客户端软件

1. IPSec VPN
    
    openswan

    异地的两个或多个公司, 两个或以上异地企业一般中这个


### VPN 使用建议

开源产品，省钱，扩展性强(高可用), 二次开发

硬件产品, 防火墙、负载均衡等硬件产品都附带 VPN 功能。


### OpenVPN

可以使用预设的私钥，第三方证书，或者用户名/密码 来进行身份验证

可以在全平台运行, C/S 架构，不予 IPSec 和 PPTP 兼容


#### SSL 和 TLS 协议介绍

SSL Secure Sockets Layer

诞生的目的：
    为网络通信提供安全及数据完整性保障

后来 IETF 将 SSL 做了标准化，称其为 TLS (Transport Layer Security)

其基础是 PKI(Publick key In

#### OpenVPN 通信原理过程

客户端和服务器通过协商主密钥???

客户端和服务端都要有相同 CA 签发的证书, 双方通过交换证书验证双方的合法性已决定时候建立VPN连接???how, 然后使用对方CA把自己目前使用的数据加密算法加密后
发给对方


#### 身份验证方式

1. 预享密钥
    只能用于建立点对点的VPN

1. 第三方证书
    
1. 用户名/密码


#### 通信原理

OpenVPN 所有的通信都基于一个单一的端口(默认是1194), 默认使用UDP协议，同时支持 TCP 协议

能通过大多数的代理服务器，并且能够在 NAT 环境中很好工作

服务端具有想客户端"推送"某些网络配置信息的功能, 这些信息包括：IP地址，路由设置等

提供了两种虚拟网络接口: 通用 **Tun/Tap** 驱动, 通过他们，可以建立三层IP隧道，或者虚拟二层以太网，

传送的数据可通过LZO算法压缩
    这个软件叫 lzop
    apt install lzop

技术核心是虚拟网卡，其次是SSL协议的实现

2.0之后的版本每个进程可以同时管理数个并发的隧道

OpenVPN使用通用网络协议(TCP UDP)的特点使它成为 IPSec 等协议的理想替代，尤其是在 ISP 过滤某些特定 VPN 协议的情况下。


##### 

添加路由，用NAT

IPSec 的话 两端都是Server???

#### 试验环境

OpenVPN 服务器双网卡
    10.0.0.28   外网
    GW:10.0.0.254
    DNS:223.5.5.5

    172.16.1.28 内网
    GW:无

Server 1
    172.16.1.17
    GW:无
    

笔记本
    10.0.0.0/24 DHCP

需求
    在远端通过VPN客户端拨号到VPNServer, 然后在笔记本上可以直接访问 VPNServer 所在局域网内的多个 server


配置vpn时间同步

    ntpdate pool.ntp.org






#### 配置服务器

apt install openvpn

git clone https://github.com/OpenVPN/easy-rsa.git

cp -r /usr/share/easy-rsa /etc/openvpn/

公钥体系
    ./easyrsa init-pki


创建CA证书
    ./easyrsa build-ca nopass
    /etc/openvpn/easy-rsa/pki/ca.crt
    这样一来，在pki和pki/private文件夹中会生成ca.crt和ca.key文件


生成服务器证书请求文件和私钥
    ./easyrsa gen-req server nopass
        req: /etc/openvpn/easy-rsa/pki/reqs/server.req
        key: /etc/openvpn/easy-rsa/pki/private/server.key


    mv pki/reqs/server.req pki/reqs/server.csr


导入请求
    ./easyrsa import-req pki/reqs/server2.req server
        这里的server是前面指定的服务器名称

        The request has been successfully imported with a short name of: server
        You may now use this name to perform signing operations on this request.


签发请求
    ./easyrsa sign-req server server
        第一个server是请求类型，可以是client或者server，第二个server是前面指定的服务器名称

        /etc/openvpn/easy-rsa/pki/issued/server.crt

生成加密文件
    ./easyrsa gen-dh
        DH parameters of size 2048 created at /etc/openvpn/easy-rsa/pki/dh.pem


    openvpn --genkey --secret ta.key

        2048 bit OpenVPN static key

        --genkey        : Generate a random key to be used as a shared secret,
                  for use with the --secret option.

        --secret f [d]  : Enable Static Key encryption mode (non-TLS).
                  Use shared secret file f, generate with --genkey.
                  The optional d parameter controls key directionality.
                  If d is specified, use separate keys for each
                  direction, set d=0 on one side of the connection,
                  and d=1 on the other side.


这样一来，服务器端的所有文件就全部生成完毕，下面开始生成客户端所需文件。



mkdir -p ~/client-configs/keys

./easyrsa gen-req client1 nopass

    生成客户端请求文件，考虑到可能会有几个客户端，所以这里叫client1

    Keypair and certificate request completed. Your files are:
    req: /root/easy-rsa/easyrsa3/pki/reqs/client1.req
    key: /root/easy-rsa/easyrsa3/pki/private/client1.key

首先修改一下客户端请求文件的名称：
    mv pki/reqs/client1.req pki/reqs/client.csr

导入请求文件：

    ./easyrsa import-req pki/reqs/client.csr client1
        这里的client1是前面指定的客户端名称

        The request has been successfully imported with a short name of: client1
        You may now use this name to perform signing operations on this request.


签发请求：

    ./easyrsa sign-req client client1

        Certificate created at: /root/easy-rsa/easyrsa3/pki/issued/client1.crt


cp pki/issued/client1.crt ta.key pki/ca.crt ~/client-configs/keys/
