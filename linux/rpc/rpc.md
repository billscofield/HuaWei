
## RPC(Remote Procedure Call)

是一种通信协议, 可以有很多种实现

在我自己的机器上调用运行了 RPC 服务的机器上的程序

通过网络从远程计算机上请求服务，而不需要了解底层的网络技术

有多种实现方式，如 Java, C

Hadoop 中 HDFS 实现了 RPC 的通信协议


|   +-------------+             +-----------------+
|   | client call |             | server function |
|   +-------------+             +-----------------+
|       |    /|\                    |       /|\
|      \|/    |                     |        |
|   +-------------+             +----------------+
|   | client stub |存根         |  server stub   |存根(应该就是类似程序的接口)
|   +-------------+             +----------------+
|       |    /|\                    |       /|\
|      \|/    |                    \|/       |
|   +-------------+             +----------------+
|   |   sockets   | <---------- |     sockets    |  发布一个接口, 必须指定一个签名
|   +-------------+ ----------> +----------------+
|          RPC 协议
|   
|   1. 得到一个签名, 必须和服务端一样
|   2. 得到服务器端发布的对象（代理对象）




客户端(Client)：服务调用方。

客户端存根(Client Stub)：存放服务端地址信息，将客户端的请求参数数据信息打包成网
络消息，再通过网络传输发送给服务端。

服务端存根(Server Stub)：接收客户端发送过来的请求消息并进行解包，然后再调用本地
服务进行处理。

服务端(Server)：服务的真正提供者。

Network Service：底层传输，可以是 TCP 或 HTTP。



简单的理解是一个节点请求另一个节点提供的服务

为什么 RPC 呢？就是无法在一个进程内，甚至一个计算机内通过本地调用的方式完成的需
求，比如比如不同的系统间的通讯，甚至不同的组织间的通讯。由于计算能力需要横向扩
展，需要在多台机器组成的集群上部署应用，

RPC 的协议有很多，比如最早的 CORBA，Java RMI，Web Service的RPC风格，Hessian，
Thrift，甚至Rest API。



https://www.jianshu.com/p/7d6853140e13

https://www.zhihu.com/question/25536695


---

https://unix.stackexchange.com/questions/234154/exactly-what-does-rpcbind-do


The rpcbind utilit maps RPC services to the ports on which they listen.
RPC processes notify rpcbind when they start, registering the ports they are
listening on and the RPC program numbers they expect to serve.
The client system then contacts rpcbind on the server with a particular RPC program
number.

The rpcbind service redirects the client to the proper port number so it can
communicate with the requested service




rpcinfo
program version netid     address                service    owner
100000    3    tcp6      ::.0.111               portmapper superuser
100000    4    udp6      ::.0.111               portmapper superuser
100000    3    udp6      ::.0.111               portmapper superuser
100000    4    tcp       0.0.0.0.0.111          portmapper superuser
100000    3    tcp       0.0.0.0.0.111          portmapper superuser
100000    2    tcp       0.0.0.0.0.111          portmapper superuser


8.1" is the two bytes of the port number. 2049 = (8 * 256) + 1."


### Understanding RPC

Remote Procedure Call (RPC) is an inter-process communication technique to allow client and server software to communicate on a network. The RPC protocol is based on a client/server model. 


The client makes a procedure call that appears to be local but is actually run on a remote computer. During this process, the procedure call arguments are bundled and passed through the network to the server. The arguments are then unpacked and run on the server. 


The result is again bundled and passed back to the client, where it is converted to a return value for the client's procedure call.

### What is Rpcbind?

Rpcbind accepts port reservations from local RPC services. These ports are then made available (or advertised) so the corresponding remote RPC services can access them. The rpcbind service responds to requests for RPC services and sets up connections to the requested RPC service. 


For example, NFSv3 is an RPC service. We will discuss more details later.


1. rpcbind工具可以将RPC程序号码和通用地址互相转换。要让某主机能向远程主机的服务发起RPC调用， 则该主机上的rpcbind必须处于已运行状态。
1. 当RPC服务启动后，它会告诉rpcbind它监听在哪个地址上，还会告诉它为服务准备好提供的PRC程序 号码。当客户端要向某个给定的程序号码发起RPC调用时，它首先会联系服务端的rpcbind以确定RPC 请求应该发送到哪个地址上。
1. rpcbind工具应该在所有RPC管理的服务(rpc service)启动之前启动。一般来说，标准的rpc服务由端 口监视器来启动，因此rpcbind必须在端口监视器被调用之前已经启动完成。
1. 当rpcbind工具已经启动后，它会检查特定的name-to-address的转换调用功能是否正确执行。如果失 败，则网络配置数据库会被认为过期，由于RPC管理的服务在这种情况下无法正确运行，rpcbind会输 出这些信息并终止。
1. 另外，rpcbind工具只能由super-user启动


### Tips For RPCbind
When a client wishes to make an RPC call to a given program number, it first contacts rpcbind on the server machine to determine the address where RPC requests should be sent.

    1. It tells rpcbind the address at which it is listening, and the RPC program numbers it is prepared to serve. 
    2. It checks that certain name-to-address translation-calls function correctly. 
    3. The rpcbind utility should be started before any other RPC service. 
    4. The rpcbind utility can only be started by the super-user.

### Check RPCbind on Linux

We can use the following commands to check Rpcbind is running or not.

systemctl status rpcbind

We can use **rpcinfo** command to check if the RPC service is registered or not. Normally this command will respond with all the registered RPC services running on the server. 


The listing displays the program number, version, protocol, port, and service name. One of those listed is the mountd service:

We can also use rpcinfo to unregister an RPC service. When used with the –d option, we can delete registration for a service. For example, xxxx is running on the local system. we could unregister it as follows: rpcinfo  -d xxxx 1. 

### portmap是什么
Linux 的 rpc 服务，它相应 rpc 服务的请求和与请求的 rpc 服务建立连接.



当一个RPC服务器启动时，会选择一个空闲的端口号并在上面监听（每次启动后的端口
号各不相同），同时它作为一个可用的服务会在portmap进程注册。一个RPC服务器对
应惟一一个RPC程序号，RPC服务器告诉portmap进程它在哪个端口号上监听连接请求和
为哪个RPC程序号提供服务。经过这个过程，portmap进程就知道了每一个已注册的RPC
服务器所用的Internet端口号，而且还知道哪个程序号在这个端口上是可用的。
portmap进程维护着一张RPC程序号到Internet端口号之间的映射表，它的字段包括程
序号、版本号、所用协议、端口号和服务名，portmap进程通过这张映射表来提供程序
号-端口号之间的转化功能

如果portmap进程停止了运行或异常终止，那么该系统上的所有RPC服务器必须重新启动。
首先停止NFS服务器上的所有NFS服务进程，然后启动portmap进程，再启动服务器上的NFS
进程。

portmap进程一般使用TCP/UDP的111端口。
