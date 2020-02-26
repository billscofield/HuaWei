# DNS(Domain Name System)

IANA(The Internet Assigned Numbers Authority,互联网数字分配机构)
    好拗口。。。可以第一个重读
ICANN(The Internet Corporation for Assigned Names and Numbers)互联网名称与数字地址分配机构

## 第一阶段

/etc/hosts
域名所有者向 INTERNIC 注册，用户去 INTERNIC 同步，然后才可以上网

/etc/hosts 格式
IP 主机名1 主机名2 ...

在私有网络内部，最好将所有的私有 IP 与主机名对应 都写到这个文件中

## 第二阶段

伯克里（Berkeley Internet Name Domain,BIND)分布式、阶层式

分布式：每个层管理自己的数据库

树形结构，将主机名的管理 分配在不同层级的 DNS 服务器当中，并进行分层管理,每一台 DNS 服务器记忆的信息就不会很多
每个上一层的DNS服务器所记录的信息，其实只有其下一层的主机名而已, 至于再下一层，则直接授权给下层的某台主机来管理

完整主机名：FQDN(Full Qualified Domain Name)
    主机名 域名(hostname and domain name) 以及由 这两则组成的完整主机名 FQDN

    区域

    www是主机名

    并不是以小点(.)来区分 domain name 和 hostname,某些时刻，hostname 也会包含小点

/etc/resolv.conf
    nameserver 192.168.10.131
    nameserver 192.168.10.132

## DNS 的阶层式结构
最上方一定是 .(dot) 这个DNS服务器(称为root)
    最早它只管理 .com、.edu、.gov、.org、.net、.mil 这种特殊区域，以国家分类的第二层主机名, 这两者称为 Top Level Domains(TLDs)
    一般顶级域名 (General TLDs,gTLD),如 .com .org .gov 等
    地区顶级层域名 (Country Code TLDs, ccTLD), 如 .cn .jp .uk


dig(domain information groper)
    dig --help
    dig -h  for complete list of options

    dig +trace [FQDN]   trace delegation(授权，委托) down from root

通过DNS查询主机名IP的流程    
    收到用户请求
    root\二层\三层...
    记录缓存 
    回报用户

分层的好处
    自己管理一块区域
    缓存时间
    可持续向下授权(子域名授权)


DNS 使用的 port number
    /etc/services

    domain      53/tcp              # Domain Name Server
    domain      53/udp
    
    通常 DNS 使用 UDP 来查询，但是出现问题获取不到时，就会使用 TCP
    DNS 的 daemon (就是named) 会同时启动 TCP 和 UDP 的 port 53


合法 DNS 的关键
    1. FQDN
    1. 申请到合法的区域查询授权

    拥有区域查询权后，所有的主机名信息都以自己为准，与上层无关

DNS 系统记录的信息
    1. 记录服务器所在的 NS(NameServer) 标志
    1. 记录主机名对应的 A(Address)标志

    我们再网络上面查询到的最终结果，都是查询 IP(IP Address)的，因此最终的标志要找的是 A 这个记录才对。

    去注册时，记录在ISP的DNS服务器名称是 dns.mengbaoxiaopu.org, 该记录其实就是 NS, 并非 A



DNS 数据库的记录：正解，反解，Zone的意义
    正解：从主机名查询到IP的流程
    反解：从IP反解析到主机名的流程
    **区域：不论正解还是反解，每个域的记录就是一个区域(zone)**

正解
    SOA:开始验证(Start of Authority)
    NA: 就是名称服务器(Name Server),后面记录的数据是DNS服务器的意思
    A : 就是地址的缩写(Address),后面记录的是IP的对应

反解?
    能够设置反解的就只有IP的拥有者，

    除了 SOA,NS 外，最重要的就是
        PTR: 就是指向(Pointer)，后面记录的是 反解到主机名

每台 DNS 服务器都需要知道的正解 Zone:hint
    这个记录(.)的Zone的类型，就被我们称为 hint 类型，这几乎是每个DNS服务器都需要知道的 Zone
    一台简单的 DNS 服务器，基本上就要有两个Zone才行，一个是 hint，一个是关于自己域的正解 Zone
        hint (root) : 记录.的Zone
        vbird.org : 记录 .vbird.org 这个正解的Zone


相关配置文件
/etc/hosts
/etc/resolv.conf
/etc/nsswitch.conf 决定先使用 /etc/hosts 还是 /etc/resolv.conf
    hosts:          files dns
    files 代表 /etc/hosts
    dns 代表 /etc/resolv.conf




正解，反解查询命令
    host
        host [-a] FQDN [server IP]
        host -l domain [server IP]

        [server IP] 使用这个dns服务器进行解析
            host www.baidu.com 8.8.8.8

        -a equivalent to -v -t ANY
        -v verbose
        -t specifies the query type
        -l list all hosts in a domain, using AXFR(若后面那个domain设置允许 allow-transfer时，则列出该 domain所管理的所有主机名对应数据)

        host -l vbird.org
        
    nslookup
    dig
        +trace : 就是从 . 开始追踪
        -t type : 查询的数据主要有 MX, NS, SOA, A, AAAA, PTR, CNAME 等类型
        -x      : 查询反解信息, 非常重要的项目

        ;;QUESTION SECTION
        ;;ANSWER SECTION
        ;;AUTHORITY SECTION:是由哪台DNS服务器提供的答案, 这里包含DNS服务器的相关信息，如 缓存时间
            dig -t SOA sound.hjimi.cn
            

        dig -x 8.8.8.8
        dig -x 120.114.100.20



树的最大深度不得超过127层，树中每个节点最长可以存储63个字符
[a,m] 根域服务器

反向域：名字为 in-addr.arpa
    dig -x 8.8.8.8
    ;; QUESTION SECTION
    ;8.8.8.8.in-addr.arpa

每一个区都有自己的授权服务器，(Zone)资源记录








递归查询
    一般情况下，从PC客户端到本地DNS服务器是属于递归查询，
迭代查询
    DNS服务器之间的交互查询时迭代查询




DNS资源记录
    SOA资源记录
        一个区域只允许存在唯一的SOA记录
    NS资源记录
        该域名由哪个DNS服务器进行解析
        每个区在根处至少包含一个NS记录
    A资源记录
        FQDN 到 IP地址
    AAAA
        IPV6
    PTR资源记录
        把IP映射到FQDN
    CNAME资源记录
        别名记录，创建特定FQDN的别名
        用户可以使用 CNAME 记录来隐藏用户网络的实现细节，使连接的客户机无法知道真正的域名
        例如ping baidu.com 解析到了百度的别名服务器，百度有个 cname=www.a.shifen.com 的别名
    MX 邮件交换资源记录

rndc 953端口
    DNS主从同步


bind8、bind9

## bilibili 视频教程
需要安装
    bind
    bind-chroot
        bind-chroot 是bind的一个功能，使bind在一个chroot的模式下运行，也就是说，bind运行时的/(根)目录并不是系统真正的根目录，只是系统中的一个子目录而已，这样做的目的是为了提高安全性
        在 chroot 模式下，bind 可以访问的范围仅限于这个子目录的范围里，无法进一步提升，无法进入到系统的其他目录中
    bind-utils 客户端工具，默认安装

## bind9 源码安装
ARM(Administrative Reference Manual)
bind9.14.2.tar.gz (https://downloads.isc.org/isc/bind9/9.14.2/bind-9.14.2.tar.gz)

???安装前查看一下,安装后启动服务再看一下,进行比较, 看看区别
    mount 查看


重要目录
    bin(全部BIND二进制源代码，包括named)
    contrib(一些工具) 
    doc(BIND的文档，包括资源手册)
    lib(BIND使用的库的源代码)
    make(makefile文件). 


./configure --prefix=/usr/local/bind9 --sysconfdir=/etc/bind9
    etc/bind是配置文件的路径也就是 name.conf 的位置

    Configured paths:
        prefix: /usr/local/bind9
        sysconfdir: ${prefix}/etc
        localstatedir: ${prefix}/var


make 
make install



配置环境变量
    vi /etc/profile
    export PATH=/usr/local/bind9/sbin:/usr/local/bind9/bin:$PATH
    source /etc/profile
    
    或者

    ln -s /usr/local/bind/bin/* /usr/bin/
    ln -s /usr/local/bind/sbin/* /usr/sbin/

生成rndc控制命令的key
    /usr/local/bind9/sbin/rndc-confgen > /usr/local/etc/rndc.conf
    tail -n 10 /usr/local/bind9/etc/named/rndc.conf | head -n 9 | sed 's/#\ //g' > /usr/local/bind9/etc/named/named.conf

named.conf 主配置文件
    named.conf主配置文件  （bind安装源码文件中有提供named.conf的示例文件，bin/tests/named.conf）
    
    options //全局options
    {
        directory "/usr/local/bind/var"; //域名文件存放的绝对路径,zone file 文件
        pid-file "named.pid"; //如果bind启动，自动会在/usr/local/named/var目录生成一个named.pid文件，打开文件就是named进程的ID
        
        dump-file "cache_dump.db";　//设置服务器缓存数据文件的路径(rndc dumpdb转储数据的文件)
        statistics-file "named_stats.txt"; //设置服务器统计信息文件的路径(rndc stats追加统计数据的文件)

        allow-query { any;  }; //定义可使用这个DNS服务器的客户端，这里为任意主机都允许。

        forward-only;   //让DNS仅进行forward, 即使有 . 这个zone file, 也不会使用
        forwarders {8.8.8.8;202.106.0.20;}; 　//指定一个转发DNS，当本地域名服务器无法解析的域名，就会被转发至前向DNS进行解析。

    };

    logging //日志
    {
        channel default_debug {
            file "named.run";
            severity dynamic;};
    };

    这部分是日志的设置，上面是一个Bind预定义通道，写这部分是为了说明Bind的日志可以非常细化的处理。这部分详细定义还是很复杂的，自己去看看相关资料吧！

　　其中最主要的是file “named.run”; 这一句指定了日志文件的位置，要正常启动named，必须要保证这一文件是存在的，并且named进程对它有读写权限。

　　severity是指定记录消息的级别。在bind中主要有以下几个级别(按照严重性递减的顺序)：critical、error、warning、notice、info、debug[level]、dynamic。定义了某个级别后，系统会记录包括该级别以及比该级别更严重的级别的所有消息。比如定义级别为error，则会记录critical和error两个级别的信息。一般情况下，我们记录到info级别就可以了。



    定义根区域、本地域的正反解、自定义域的正反解

    　　A、定义根区域
        zone "." IN
        {
            type hint; //根域名服务器
            file "named.root"; //存放在/usr/local/bind/var目录，文件名为named.root
        };

        B、定义本地域的正反解
        zone "localhost" IN
        {
            type master; //类型为主域名服务器
            file "named.localhost"; //本地正向解析的区文件
            allow-update {none;};　//不允许动态更新本区的数据
        };

        zone "0.0.127.in-addr.arpa" IN 
        {
            type master; //类型为主域名服务器
            file "named.127.0.0"; //本地反向解析的文件
            allow-update {none;};
        };



配置一个最简单的 cache-only forward DNS server
    named.conf{
        listen-on port  53   {any;};
        allow-query {any;};
        forward only;
        forwarders  {
            202.106.0.20;
            8.8.8.8.8;
        };
    };

    named 

    netstat -tlnpu | grep 53
    netstat -tlnpu | grep named















