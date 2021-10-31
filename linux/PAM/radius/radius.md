
## RADIUS

RADIUS（Remote Authentication Dial-In User Server，远程认证拨号用户服务）是一种分布式的、C/S架构的信息交互协议，能包含网络不受未授权访问的干扰，常应用在既要求较高安全性、又允许远程用户访问的各种网络环境中。


协议定义了基于UDP（User Datagram Protocol）的RADIUS报文格式及其传输机制，并规定UDP端口1812、1813分别作为认证、计费端口。

如果是思科设备：认证和授权端口为UDP1645，计费端口1646.

RADIUS最初仅是针对拨号用户的AAA协议，后来随着用户接入方式的多样化发展，RADIUS也适应多种用户接入方式，如以太网接入等。它通过认证授权来提供接入服务，通过计费来收集、记录用户对网络资源的使用。






https://blog.csdn.net/qq_38265137/article/details/90723140

---

搭建freeradius+daloradius作为认证服务器

    https://blog.51cto.com/11555417/2059991
