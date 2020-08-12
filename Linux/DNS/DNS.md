# DNS Domain Name Service

https://www.bilibili.com/video/av40331948/?p=70

## 什么叫域名

www.magedu.com 这是主机名,主机名也叫 FQDN:Full Qualified Domain Name 完全限定域名，完全合格域名

域是一个范围


magedu.com | .com  才是一个域名，
magedu.com 这个域下有很多主机，
    1. www.magedu.com
    1. mail.magedu.com
    1. ftp.magedu.com

## DNS 是用来干吗的

名称解析，Name Resolving, 查询数据库,实现 "FQDN 和 IP" 的对应关系,双向的

    MySQL是数据库管理软件
    一个文件也可以是一个数据库，只不过不易管理

用户名 到 id 也是名称解析
web服务 端口80 这也是名称解析

nsswitch:为多种需要实现名称解析的机制 提供名称解析的平台,类似淘宝，提供一个平台，主体是各个卖家

nsswitch 配置文件 /etc/nsswitch.conf

nsswitch 是一个平台，里边有库文件  libnss_files.so   libnss_dns.so

nsswitch 中有这么一行定义
    hosts:  files   dns
        files 就是靠 libnss_files.so 找的 /etc/hosts, 通过这个文件找FQDN和IP的对应关系
        dns 就是dns服务

当访问一个域名，没有IP对应关系的时候，调用库文件,完成从主机名到IP地址的转换，这个机制叫 stub resolver,姑且叫它名称解析器

这个名称解析器会通过某个库调用，找nsswitch中的配置，先找 files(host: files dns),如果没有则找 dns(hosts: files dns)

早期，计算机比较少，所以才会有/etc/hosts这个文件
    
随后出现了IANA(政府部门) 来管理、规范名称和IP的管理

然后交给了ICANN(无政府组织) 来管理最顶级的域

产生过程

1. 早期，客户机只要去IANA下载hosts文件即可,
1. 然后IANA建立了服务器，直接向IANA查询即可,集中式数据库
1. 然后一台server不够用了, IANA 建立了分布式数据库,封建制度
    不能越级指挥

    www.magedu.com.
    从小到大
    最后一个点表示根、根域
    自上而下的，每个part都知道自己的直接下级,每个下级都不知道自己的直接上级
    但是每个人都知道 根 在哪里




    根域
        1. .

    顶级域 TLD:Top Level Domain, 分为3类
        1. 组织域
            .com
            .org
            .net
            .cc

        1. 国家域
            .cn
            .us

        1. 新通用顶级域
            .red .top ...

        1. 反向域(将IP转换为FQDN)
            正向和反向用的不是同一个数据库


    DNS 缓存            
        比如hjimi下有1w个主机，都要访问www.google.com,每个client都要去根域查找吗?太浪费了，把DNS缓存到一个公共位置，DNS server

        递归方式
            根是不给任何人递归的
    
        迭代方式

        对客户端来说是递归的，客户端只发一次请求；对DNS服务器来说是迭代的,可能会有n次请求

        只有目标主机的直接上级返回的才是权威答案,否则是非权威答案

        缓存时间是由这个域服务器决定的

        内部的查找 外部的
        外部的查找 内部的
        内部的查找 内部的

        一台服务器可以给多个域,多维护几个数据库即可

        A 去访问www.magedu.com  根服务器内的数据库存储着这样的条目：
            .com    管理者的ns  ip 192.168.xxx.xxx
            去问上边这个人吧
            .magedu 这个域的管理者ns  ip 172.16.xxx.xxx
            去问上边这个人吧
        
        一个ip可以对应多个FQDN
        一个FQDN可以对应多个IP
            虽然有多个IP，但是也只返回一个，负载均衡，第一个访问，返回ipA,第二个访问，返回ipB
        

        请求一个不存在的域名，返回一个否定答案，否定答案也有缓存时间


        外部客户端的请求
            1. 返回权威答案 (递归客户端)
                比如客户端请求A公司下的一个FQDN
            1. 返回非权威答案 (非递归客户端) 
                比如Z公司客户端请求A公司下的一个FQDN
                同意请求给返回的，说明这两个公司是兄弟公司; 不同意，不给返回的是竞争对手，或没有关系
         
        
        根、.com  只做迭代，不做递归



    13台根服务器
        中国没有，一个原因是因为防火长城的原因

        a.root-server.net
        b.root-server.net
        ...
        m.root-server.net

        13台服务器的内容完全一致


## DNS服务器类型
    1. 主DNS服务器

    1. 备份DNS服务器

        1主多从
        在主DNS服务器增删改
        从DNS服务器自动从主DNS服务器同步数据
        
        主DNS服务器上增删改后，
        从DNS服务器在 一个时间后去主DNS服务器上pull数据，请求同步数据

        主DNS挂掉后，从DNS每隔一段时间后，进行请求，最后自己也挂掉

        几个重要指标

            1. 主DNS的每次增删改，都会产生一个新的序列号（serial number）

            1. 从DNS在刷新时间（refresh time）

            1. 重试时间（retry time）

            1. 过期时间（expire time）
                从DNS服务器自杀时间

            1. 否定答案的缓存时间（negative answer time）
        

1. 缓存DNS服务器
    不负责DNS解析，只负责缓存

1. 转发器
    不请求，只转发


## 资源记录

这个数据库中的每个条目称为一个资源记录（resource record,RR）

NAME                TTL(可以省略,而定义一个全局的TTL值,缓存时间)     IN(internet)    RRT(RR type)    VALUE
www.magedu.com.                                                      IN              A               1.1.1.1
1.1.1.1                                                              IN              PTR             www.magedu.com.

资源记录类型
    1. A(address)  : FQDN -> IPv4
    1. AAAA        : FQDN -> IPv6
    1. PTR(pointer): IP(IPv4 | IPv6) -> FQDN
    1. NS(Name Server):Zone NAME -> FQDN  (片长)    

        ```
        magedu.com.         60                                      IN              NS              ns.magedu.com.
        ns.magedu.com       600                                     IN              A               1.1.1.2

        这两个一般同时出现
        ```

    1. MX(mail eXchanger):Zone Name -> FQDN
        
        ```
        
        ZoneName    TTL     IN      MX      pri(优先级)     VALUE

        优先级：[0,99] 数字越小级别越高

        ```


## 实战 BIND
BIND 现在是由 ISC 负责维护，DHCP目前也是由 ISC 负责维护，所以可以去www.isc.org/downloads 不过貌似被和谐了











