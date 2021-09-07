
## RPC(Remote Procedure Call)

是一种协议, 可以有很多种实现

Hadoop中HDFS实现了RPC的通信协议


|   +-------------+             +-----------------+
|   | client call |             | server function |
|   +-------------+             +-----------------+
|       |    /|\                    |       /|\
|      \|/    |                     |        |
|   +-------------+             +----------------+
|   | client stub |             |  server stub   |
|   +-------------+             +----------------+
|       |    /|\                    |       /|\
|      \|/    |                    \|/       |
|   +-------------+             +----------------+
|   |   sockets   | <---------- |     sockets    |
|   +-------------+ ----------> +----------------+

客户端(Client)：服务调用方。

客户端存根(Client Stub)：存放服务端地址信息，将客户端的请求参数数据信息打包成网
络消息，再通过网络传输发送给服务端。

服务端存根(Server Stub)：接收客户端发送过来的请求消息并进行解包，然后再调用本地
服务进行处理。

服务端(Server)：服务的真正提供者。

Network Service：底层传输，可以是 TCP 或 HTTP。



简单的理解是一个节点请求另一个节点提供的服务

为什么RPC呢？就是无法在一个进程内，甚至一个计算机内通过本地调用的方式完成的需求，
比如比如不同的系统间的通讯，甚至不同的组织间的通讯。由于计算能力需要横向扩展，
需要在多台机器组成的集群上部署应用，

RPC的协议有很多，比如最早的CORBA，Java RMI，Web Service的RPC风格，Hessian，
Thrift，甚至Rest API。






https://www.jianshu.com/p/7d6853140e13

https://www.zhihu.com/question/25536695


