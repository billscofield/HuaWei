# squid

高性能的代理缓存服务器

Squid 用一个单独的，非模块化的，I/O 驱动的进程来处理所有的客户端请求。

https://www.php.cn/code/24973.html

使用内存或硬盘来缓存

传统代理:普通代理服务，手动设置，例如qq，网页

透明代理:客户机不需要指定代理服务器的地址和端口，而是通过默认路由、防火墙策略将web访问重定向给代理服务器

反向代理:

正向代理隐藏真实客户端，反向代理隐藏真实服务端
    科学上网工具扮演的就是典型的正向代理角色
    Nginx就是性能非常好的反向代理服务器，用来做负载均衡

缓存服务器和CDN的区别???

## Squid 介绍

squid-cache.org

PORT:3128/tcp

缓存服务器介绍
    缓存服务器(cache server),即用来存储(介质为内存及硬盘)用户访问的网页、图片、文件等信息的专用服务器。
    缓存服务器往往已是代理服务器。
    代理 和 缓存对用户是透明的

目前国内常用的缓存服务器有: squid, varnish, nginx, ats

squid 历史比较悠久

视频网站百分之80，90的内容在 squid, cdn 上
taobao首页等

国内基本上90%以上的商业CDN公司，都在用 squid, 比如 蓝汛、网宿、帝联, 新浪在用 ats

官网
www.squid-cache.org

squid 权威指南

有ACL

应用层防火墙

不是所有应用程序都支持代理选项

不用开路由转发功能

## web 缓存相关概念

cache 命中: 用户请求数据，这个数据就在cache服务器中, 而不是去访问最终的服务器

cache 命中率: 所有客户端http请求中命中的比例，cache命中所占比例, 一般 30%-60% 之间

Web缓存典型的cache命中率在30% 到 60% 之间。

预热或者预取
    新的资源主动推送

轻松应对IDC机房带宽突然暴涨问题

2. 存储空间满或者对象自身过期，cache server 会清除这些缓存对象已释放空间给新对象, 如何解决?
    1. 加大内存和硬盘
    2. 过期时间设置的长一些
    3. 缓存参数设置大一些, 
    4. 分资源缓存

cache 确认
    数据的一致性
    保证不给用户返回过期的数据

## 代理服务器原理

squid 访问控制
缓存服务器

传统代理服务器
    需要客户机在浏览器中指定代理服务器的地址、端口

透明代理服务器
    需要设置防火墙策略将客户机的 web 访问数据交给代理服务程序处理

反向代理服务器
    是指代理服务器来接受 internet 上的连接请求,然后将请求转发给内部网络上的服务
    器，并将从服务器上得到的结果返回给 internet 上请求连接的客户端，

## 

因为 squid 对每个缓存响应使用少数内存
每G磁盘空间需要 32M 左右内存(经验值)

做好时间同步

web服务器做测试用

/usr/local/squid
    1. bin
    1. etc
    1. libexec
        包含了辅助程序
    1. sbin
        squid    主程序
    1. share
    1. var
        ./var/log
        ./var/cache


port 3128

    蓝汛是一家CDN服务提供商家，目前ChinaCache在全世界拥有17000多台服务器，遍布
    全球超过120个大中城市，为国内外上万家知名企业提供网络应用基础服务，业务遍及
    欧洲、亚洲、美洲和大洋洲。

## 安装

debian 10

apt install squid

dpkg -s squid

egrep -e "^#|^$" /etc/squid/squid.conf

/etc/squid/squid.conf
    http_port 192.168.1.1:3128                  设置监听的IP与端口号
    cache_mem 64 MB                             提供给 squid 使用的内存
    maximum_object_size 4 MB                    缓存的最大文件, 默认4MB
    reply_body_max_size 10 MB allow all         客户通过代理下载文件的最大限制
    minium_object_size 0 KB                     缓存的最小文件大小
    cache_dir ufs /var/spool/squid 100 16 256   
        ufs:
        100:缓存大小 MB
        16:16个一级目录
        256:每个一级目录有256个二级目录
    ccess_log /var/log/squid/cache.log         日志
    logfile_rotate 60                           log轮询60天
    cache_swap_hight 95                         cache目录使用量大于95%时，开始清理旧的cache
    cache_swap_ low 90                          cache目录清理到90%时停止
    acl localnet src 192.168.1.0/24             定义本地网段
    http_access allow localnet                  允许本地网段使用
    http_access deny all                        拒绝所有

    visible_hostname XXX                        主机名,报错时显示的, 这个必须写
    cache_mgr XXX                               管理员邮箱

strings 0000000X 来查看缓存内容

### 普通代理

    192.168.1.0/24                                          网页服务

    +-------+               +--------------+                 +----------+
    |PC机器 |---------------| Squid Server |-----------------| Internet |
    +-------+               +--------------+                 +----------+

    192.168.1.100/24    192.168.1.254/24   200.100.100.1   200.100.100.2

    vi /etc/squid/squid.conf 

    cache_mem 64 MB                             提供给squid使用的内存
    cache_dir ufs /var/spool/squid 100 16 256

    maximum_object_size 4 MB                    缓存的最大文件, 默认4MB
    access_log /var/log/squid/cache.log         日志

    visible_hostname XXX                        主机名
    cache_mgr XXX                               管理员邮箱

    service squid stop
    squid -z
        -z        Create missing swap directories and then exit. 即 cache_dir
    service squid start

    客户机不用写网关
    配置客户机的网页代理
        192.168.1.254  3128

    ---

    ```/etc/squid/squid.conf
    http_port 192.168.1.1:3128 
    visible_hostname 192.168.1.1
    acl innet src 192.168.10.0/24
        #innet acl名字
    acl all src 0.0.0.0/0.0.0.0
    http_access allow innit
    http_access deny all
    ```
    service squid restart   会自动初始化缓存目录

    access_log /var/log/squid
        cache.log   缓存日志
        squid.out   错误信息
        store.log   存储日志???访问外部服务器日志

### 透明代理

原理 = Squid + iptables

    http_port 3128 transparent      就改变这一项即可

    squid -k reconfig

    /proc/sys/net/ipv4/ip_forward

    sysctl -p

    添加防火墙规则
        ip tables -t nat -I PREROUTING -i eth0 -s 192.168.1.0/24 -p tcp --dport 80 -j REDIRECT --to-port 3128

    客户机网关指向代理服务器
        反正你也上不了网

#### ACL列表

acl 名称 类型 内容

http_access 动作 acl名称

    类型:
        src             源IP
        dst             目的IP
        port            端口
        time            时间
        maxconn         最大连接
        url_regex       url正则过滤
        urlpath_regex   urlpath正则过滤
        
        srcdomain       源域名
        dstdomain       目的域名
    内容: 

acl LAN1 src 192.168.1.0/24
acl PC1 src 192.168.1.1/32
acl Blk_Domain dstdomain .qq.com .kaixin001.com
acl Work_Hours time MTWTF 08:00-17:30
acl Max20_Conn maxconn 20
acl Blk_URL url_regex -i ^rtsp://^mms://
    -i 忽略大小写
acl Blk_words urlpath_regex -i sex adult
acl RealFile urlpath_regex -i \.rmvb$ \.rm$


http_access deny LAN1 Blk_URL           拒绝 LAN1 中的机器访问 Blk_URL; 拒绝谁干嘛
http_access deny LAN1 Blk_Words
http_access deny PC1 RealFile
http_access deny PC1 Max20_Conn
http_access allow LAN1 Work_Hours


没有设置任何规则时，将拒绝所有请求

有规则，但找不到匹配项时，将采用与最后一条规则相反的权限，即如果最后一条规则是
allow,那么久拒绝，否则就允许

### 反向代理

    |                                 ----------web1    1.1.1.2
    |   +--------+    1.163 +-----+ +
    |   |Internet|----------|Squid|- 1.1.1.1
    |   +--------+          +-----+ +
    |  192.168.1.0/24                 -----------web2    1.1.1.3

    http_port 公网:80 vhost     //vhost 虚拟80端口
    visible_hostname 公网
    acl all src 0.0.0.0/0.0.0.0
    http_access allow all
    cache_peer 1.1.1.2 parent 80 0 originserver weight=1  
    cache_peer 1.1.1.3 parent 80 0 originserver weight=1

    service squid restart

    cache_peer 1.1.1.2 parent 80 0 originserver name=a
    cache_peer 1.1.1.3 parent 80 0 originserver name=b
    cache_peer_domain a www.lamp.com
    cache_peer_domain b www.web.com
    cache_peer_access a allow all
    cache_peer_access b allow all

重新加载配置文件

    squid -k reconfig

---

## what is icp_port  of squid

**ICP (Internet Cache Protocol)** is a lightweight protocol used by caching
proxy servers to communicate with each other to optimize web content delivery.
The `icp_port` in Squid is the port number used for ICP queries and replies
between Squid caching peers.

When Squid receives a request for a web resource, it checks if the resource is
available in its cache. If it's not available, Squid can forward the request to
another caching proxy server using ICP queries. The other proxy server will
respond with the location of the requested resource, allowing Squid to retrieve
it and return it to the client.

By default, Squid uses port 3130 for ICP queries and replies, but this can be
changed using the icp_port configuration directive in the squid.conf file.

/etc/services
    icpv2  3130/tcp    # Internet Cache Protocol V2 (Squid)
    icpv2  3130/udp    # Internet Cache Protocol V2 (Squid)

## what is cache_peer in squid?

In Squid, cache_peer is a configuration directive used to define a parent or
sibling cache server that can be used to forward and/or retrieve cached
content.

When Squid receives a request for content that is not in its own cache, it can
forward the request to a configured parent or sibling cache using the
cache_peer directive. The parent or sibling cache will then check if it has the
requested content in its own cache and respond back to the Squid proxy server
with the content if it is available.

This mechanism is used to reduce the load on the origin server and also to
speed up access to frequently accessed content by using cached copies from
other cache servers in the network.

cache_peer邻居分为parent(父邻居),sibling(子邻居); parent和sibling的区别在于父邻
居能为子cache转发丢失的Cache,而子邻居不可能

cache_peer通过cache_peer_access和cache_peer_domain来控制邻居的访问. 二者的区别
在于前者一般需要先定义一个ACL而后者都直接匹配相应的域名就可以了



## ?

```
# name=a表示给cache_peer一个别名
# 从客户端过来的请求，如果是 www.serverA.com，则Squid向 Server 192.168.1.50的端口81发送请求
cache_peer 192.168.1.50 parent 81 0 no-query originserver weight=1 name=a
cache_peer 192.168.1.50 parent 82 0 no-query originserver weight=1 name=b
cache_peer 192.168.1.50 parent 83 0 no-query originserver weight=1 name=c

cache_peer_domain a www.serverA.com
cache_peer_domain b www.serverB.com
cache_peer_domain c www.serverC.com

# 设置访问权限，允许所有外部客户端访问 a b c
cache_peer_access a allow all
cache_peer_access b allow all
cache_peer_access c allow all

```

## cache_peer 的定义格式

```
cache_peer hostname type 3128 3130
hostname 是用来指定获取缓冲的PROXY主机的名字
type 是PROXY主机的类型，有PARENT SIBLING两种
3128：HTTP_PORT
3130:ICP_PORT
```

附加配置选项
    1. no-query:不做查询操作，直接获取数据
    2. no-netdb-exchange：代理服务器之间不交互信息
    3. no-digest:代理服务器之间不做摘要表查询，直接用icp协议沟通（同级代理）
    4. proxy-only:直接获取对方缓冲，转交给代理服务器的客户端，而不存入本地
    5. round-robin：如果设置数部上层服务器，那么轮流查询父级服务器
    6. LOGIN=USER:PASSWD：要求对方做帐号及密码验证，例如
        cache_peer 192.168.1.41 sibling 3128 3130 login=kao:123456
    7. A



## how a squid transfer all local data stream to father squid

```bash
cache_peer <parent_squid_server> parent <parent_port> 0 no-query default never_direct allow all

cache_peer 10.35.94.161 parent  3128 0 no-query default
```

1. The cache_peer directive instructs Squid to use the parent Squid server as a cache peer.

2. `<parent_squid_server>`: the IP address or hostname of the parent Squid server 

3. The parent option specifies that the parent Squid server should be used as an upstream proxy.

4. `<parent_port>`: the port number used by the parent Squid server.

5. The ICP_PORT

6. The no-query option disables the use of ICP queries to retrieve objects from the parent Squid server. 

7. The default option sets the cache hierarchy type to "parent".

8. The never_direct directive is used to ensure that all requests are forwarded to the parent Squid server.

9. The allow all option allows all requests to be forwarded to the parent Squid server.

## `cache_dir` in squid.conf

The cache_dir directive in the Squid configuration file (squid.conf) specifies
the location and characteristics of the cache directory that Squid will use to
store cached objects.

Here is the format of the cache_dir directive:

    cache_dir type directory [options]

1. type specifies the type of cache directory to use. Squid supports the following types:
    1. aufs: An aufs (Another Union File System) cache directory that provides
       good performance and scalability.
    2. diskd: A disk-based cache directory that uses a separate disk I/O
       process for better performance.
    3. rock: A hybrid cache directory that combines the best features of aufs
       and diskd.
    4. ufs: A standard Unix filesystem-based cache directory that is simple and
       easy to use, but less performant and scalable than aufs or diskd.

2. directory specifies the path to the cache directory. This can be an absolute
   or relative path.

3. options is an optional list of additional configuration options for the
   cache directory. Some common options include:
    1. ufs: ufs-specific options that control **cache size**, **file system
       permissions**, and **disk I/O parameters**.
           cache_dir ufs /var/spool/squid 100 16 256
       This creates a ufs-based cache directory at /var/spool/squid with a
       maximum size of 100 MB, 16 first-level subdirectories, and 256
       second-level subdirectories.
    2. aufs: aufs-specific options that control **cache size**, **file system
       permissions**, and **disk I/O parameters**.
            cache_dir aufs /var/spool/squid-cache 100 16 256
        This creates an aufs-based cache directory at /var/spool/squid-cache
        with a maximum size of 100 MB, 16 first-level subdirectories, and 256
        second-level subdirectories.
    3. diskd: diskd-specific options that control **cache size**, **disk I/O
       parameters**, and **the number of disk I/O processes to use**.
           cache_dir diskd /var/spool/squid-cache 100 16 256
       This creates a diskd-based cache directory at /var/spool/squid-cache
       with a maximum size of 100 MB, 16 first-level subdirectories, and 256
       second-level subdirectories.

The `cache_dir` directive can appear multiple times in the Squid configuration
file, allowing you to create multiple cache directories of different types and
sizes.

## Verification steps

To verify that the proxy works correctly, download a web page using the curl
utility:

    curl -O -L "https://www.redhat.com/index.html" -x "proxy.example.com:3128"
        -x, --proxy <[protocol://][user:password@]proxyhost[:port]>

If curl does not display any error and the index.html file was downloaded to
the current directory, the proxy works.

[参考1](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/deploying_different_types_of_servers/configuring-the-squid-caching-proxy-server_deploying-different-types-of-servers#configuring-the-squid-service-to-listen-on-a-specific-port-or-ip-address_configuring-the-squid-caching-proxy-server)

[参考2](https://wiki.squid-cache.org/ConfigExamples/)
