SSL是Netscape开发的专门用户保护Web通讯的，目前版本为3.0。

最新版本的TLS(Transport Layer Security，传输层安全协议)是IETF(Internet
Engineering Task Force，Internet工程任务组)制定的一种新的协议。最新版本的TLS
1.0，它建立在SSL 3.0协议规范之上，是SSL 3.0的后续版本。两者差别极小，可以理解为
SSL 3.1

## stunnel

Stunnel是一个自由的跨平台软件，用于提供全局的TLS/SSL服务。针对本身无法进行TLS或
SSL通信的客户端及服务器，Stunnel可提供安全的加密连接。

1. 针对本身无法进行TLS或SSL通信的客户端及服务器，Stunnel可提供安全的加密连接
   （基于OpenSSL）；

2. 针对有访问限制的局域网，Stunnel提供加密的SSL连接解除防火墙和代理的限制直接和
   远端服务器理论上的任何网络服务连接。

Stunnel是基于OpenSSL的，所以他要求已经安装了OpenSSL,并进行了正确的配置。Stunnel
是开源的。Stunnel的源代码并非是一个完整的产品，因为它是基于OpenSSL的，编译和运
行它，需要有一个SSL库比如OpenSSL。


## stunnel4

Universal SSL tunnel for network daemons


apt install -y stunnel4
yum install -y stunnel.x86_64


tunnel 客户方式不需要证书。stunnel 服务方式需要一个证书文件。

在生成服务器的证书时，可以直接使用该命令

    openssl req -new -x509 -days 365 -nodes -config openssl.cnf -out stunnel.pem -keyout stunnel.pem

然后复制到/etc/stunnel/的目录下。这里特别需要注意与之前不同的一点是，在设置证书
的信息时Common Name 必须与本机的主机名一致！否则后面无法进行，会提示证书出错。



## 配置

this directory is initially empty, as the settings you may want for your
tunnels are completely system dependent.

A sample configuration file with defaults may be found at

    /usr/share/doc/stunnel4/examples/stunnel.conf-sample


### 服务端

client= no
    说明此配置文件是服务器

[应用服务名称]
accept = 指定的端口
    通俗的说就是客户端去连接的端口

connect =目标服务器IP:目标端口
    这里是服务器的端口


### 客户端

client = yes
[应用服务名称]
accept = 本地IP:目标端口
connect = ServerIP:指定的端口



## stunnel 的使用测试

首先将服务器打开

    openssl s_server -accept 6665 -key server.key -cert server.crt -Verify 1

打开客户端，输入命令：

    ./client -i127.0.0.1 -p6666

