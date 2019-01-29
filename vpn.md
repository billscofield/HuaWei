## 隧道 
https://www.bilibili.com/video/av34517294/?p=4

vpn就是隧道

GRE、IPSec、SSL/TLS、VPN(WebVPN)、PPTP、L2TP  这些都是框架，相当于OSI，而不是具体的协议

## 内容概述
1. GRE隧道技术 (Tunnel)
1. 加密技术 加密算法 HMAC
1. IPSec (IP Security)
1. IPSec LAN-to-LAN VPN
1. IPSec Dynamic LAN-to-LAN VPN
1. GRE over IPSec
1. Dynamic Multipoint VPN (DMVPN)
1. IPSec VPN Feature
1. Easy VPN (EzVPN)
1. SSL VPN (Web VPN)
1. PPTP VPN
1. L2TP VPN


### GRE(Generic Routing Encapsulation)
    最简单的，保证私有性，没有加密的功能
    1. 接收原始IP数据包当作**乘客协议**，原始IP数据包包头的IP地址为私有IP地址
    1. 将原始IP数据包封装进GRE协议，GRE协议称为封装协议（Encapsulation Protocol），封装的包头IP地址为虚拟直连链路两端的IP地址
    1. 将整个GRE数据包当作数据，在外层封装公网IP包头，也就是隧道的起源和终点，从而路由到隧道终点

### IPSec   : Internet Protocol Security

https://en.wikipedia.org/wiki/IPsec

1. 除了实现隧道功能，还要实现数据安全
1. 功能
    1. 数据源认证
    1. 保护数据完整性
    1. 保证数据私密性
    1. 防止中间人攻击
    1. 防止数据被重放

1. 针对密钥加密   和  针对数据加密

1. 为IPSec服务的3个协议
    1. IKE(Internet Key Exchange) 密钥交换,保证密钥安全，对称加密
        为什么要用对称加密呢???
        密钥协商，防止中间人监听攻击

        1. 认证（Authentication） 核实对方身份，确定不是中间人
            1. Pre-Shared Keys (PSK) 预共享密钥
                首先核实对方身份，再共享密钥
                    比如网络管理员协商后，北京方预先设个密钥 123456,而上海方设个密钥 987654，这样在对话的时候就能核实身份了，中间人肯定不知道这两个密钥，也就不能被核实；如果中间人知道了，那就over了

                    就像接头暗号

                    核实完身份后再

                双方的密钥要一样吗?

            1. Publick Key Infrastructure(PKI)
                1. 利用证书

            1. RSA encrypted nonce

        1. IKE使用 Diffie-Hellman的算法，**针对密钥进行加密**,保护密钥
            1. Group1  密钥长度768bit
            1. Group2  密钥长度1024bit
            1. Group3  密钥长度1536bit
            
    1. ESP(Encapsulating Security Protocol) 保证数据安全
    1. AH(Authentication Header) 保证数据安全

1. SA(Security Association) 类似合同,发送方和接收方的合同
    1. IKE SA
    1. IPSec SA


#### security architecture
The IPsec is an open standard as a part of the IPv4 suite. IPsec uses the following protocols to perform various functions:

    1. Authentication Headers (AH) provides connectionless data integrity and data origin authentication for IP datagrams and provides protection against replay attacks.[10][11]

    1. Encapsulating Security Payloads (ESP) provides confidentiality, connectionless integrity, data-origin authentication, an anti-replay service (a form of partial sequence integrity), and limited traffic-flow confidentiality.[1]

    1. Security Associations (SA) provides the bundle of algorithms and data that provide the parameters necessary for AH and/or ESP operations. The Internet Security Association and Key Management Protocol (ISAKMP) provides a framework for authentication and key exchange,[12] with actual authenticated keying material provided either by manual configuration with pre-shared keys, Internet Key Exchange (IKE and IKEv2), Kerberized Internet Negotiation of Keys (KINK), or IPSECKEY DNS records.[13][14][15][16]




PPTP    :Point-to-Point Tunneling Protocol
L2TP    :Layer Two Tunneling Protocol


## 

https://www.cnblogs.com/linuxde/p/8729339.html


## GRE隧道:配置隧道接口IP地址有什么作用？

GRE隧道通常没有任何的加密机制，只是起到一个两边的动态路由协议通过隧道地址，建立起邻接关系和学习路由的目的，一般Ipsec无法传递动态路由信息，只能通过GRE隧道来弥补这个缺陷，这样就诞生了一种叫ipsec over gre的技术；
问题1：因为你的数据必须通过GRE隧道封装才能传递到对端，而通过GRE隧道必须要走GRE隧道接口才能穿过，而隧道的建立则在始末路由器上建立，所以这两个隧道接口必须配置在始末路由器上；

问题2：因为配置了隧道，就仿佛是两个设备通过直连线建立一般，一般两个路由器直连接口通信，必须得配置同一网段吧

问题3：配置隧道地址的主要目的，是通过路由将一些需要走隧道的数据转到隧道口通过隧道转发到对端，当然如果是两边的路由器需要通过GRE隧道建立动态路由邻接关系形成路由表，则可以这么认为；这只是建立隧道的其中一个目的。



### GRE
1. Generic Routing Encapsulation 通用路由封装协议
1. GRE is a tunneling protocol developed by Cisco Systems that can encapsulate a wide variety of network layer protocols inside virtual point-to-point links or point-to-multipoint links over an Internet Protocol network.

### PPTP
    1. The Point-to-Point Tunneling Protocol (PPTP) is an obsolete method for implementing virtual private networks. 
    1. PPTP has many well known security issues.


### IPSec
    1. In computing, Internet Protocol Security (IPsec) is a secure network protocol suite that authenticates and encrypts the packets of data sent over an internet protocol network. 
    1. It is used in virtual private networks (VPNs).



### 国外主机
https://my.vultr.com/deploy/    
    https://www.cnvultr.com/


### 搭建vpn教程
https://www.bilibili.com/video/av24382357/?spm_id_from=333.788.videocard.0
    https://raw.githubusercontent.com/hwdsl2/setup-ipsec-vpn/master/vpnsetup.sh (脚本文件)

https://segmentfault.com/a/1190000015067117?utm_source=tag-newest
https://blog.csdn.net/u201012980/article/details/79187765
https://blog.csdn.net/qq_33571718/article/details/81543408


ss(shadow sockets)
http://blog.51cto.com/14018334/2299803?cid=724705










## FS

对于一种密码系统，如果一个密钥被窃取，那么只有被这个密钥加密的数据会被窃取。
有一些加密系统的密钥都是从最开始的一个密钥导出的，所以如果第一个密钥被窃取，攻击者将可能收集到足够的信息来导出其它的密钥。
在使用PFS之前，PFS使得IPSEC第二阶段的密钥是从第一阶段的密钥导出的，使用PFS，使IPSEC的两个阶段的密钥是独立的。所以采用PFS来提高安全性。
要求一个密钥只能访问由它所保护的数据；用来产生密钥的元素一次一换，不能再产生其他的密钥；一个密钥被破解，并不影响其他密钥的安全性；PFS 特性是由DH算法保障的。

In cryptography, forward secrecy (FS), also known as perfect forward secrecy (PFS), is a feature of specific key agreement protocols that gives assurances your session keys will not be compromised even if the private key of the server is compromised.[1] Forward secrecy protects past sessions against future compromises of secret keys or passwords.[2] By generating a unique session key for every session a user initiates, even the compromise of a single session key will not affect any data other than that exchanged in the specific session protected by that particular key. Forward secrecy further protects data on the transport layer of a network that uses common SSL/TLS protocols, including OpenSSL, which had previously been affected by the Heartbleed exploit. If forward secrecy is used, encrypted communications and sessions recorded in the past cannot be retrieved and decrypted should long-term secret keys or passwords be compromised in the future, even if the adversary actively interfered, for example via a man-in-the-middle attack.

    (https://en.wikipedia.org/wiki/Forward_secrecy)




## 加密技术
加密算法
    1. 对称加密算法（私钥算法）
        1. DES(40bits  56bits 3DES(3倍的56bits 即168bits))
        1. AES(128-bit, 192-bit, 256-bit)

    1. 非对称加密算法（公钥算法）
        RSA:加密长度位数不定，由人工定义

Hash算法
    1. MD5 (Message Digest 5) 
        1. 将任何数据通过计算后输出**128-bit**长度的Hash值
    1. SHA-1 (Secure Hash Algorithm 1)
        1. 将任何数据通过计算后输出**160-bit**长度的Hash值

    不可逆



