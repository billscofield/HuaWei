


## DNS


## 1. 安装

yum install -y bind bind-chroot
    bind-chroot 选装

    bind-utils bind-devel



## 2. 配置文件

主配文件
    /etc/named.conf

    ```
    options {
        全局选项
    };

    zone "zonename" {
        区域
    }

    logging{
        日志
    }

    include
    ```

    root:named  640



区域数据库文件
    /var/named/

named-checkconf                                             // 检查配置文件
named-checkzone  liujiao.com /var/named/liujiao.com.zon     // 检查区域文件



### 主配文件

监听在53/udp，53/tcp端口,TCP用来区域传送； UDP用来解析

```
options {
    listen-on port 53 { 网卡IP地址;  };                         // any;
    directory   "/var/named";                                   // 区域数据库文件, /var/named/chroot/etc/???
    //dump-file   "/var/named/data/cache_dump.db";              // rndc 用的，可以不写


    //statistics-file "/var/named/data/named_stats.txt";        // rndc 用的，可以不写
    //zone-statistics yes;                                      // ???

    //enpty-zones-enable no;
    //forwarders { 202.106.0.20; 8.8.8.8; };

    //memstatistics-file "/var/named/data/named_mem_stats.txt"; // rndc 用的，可以不写
    //recursing-file  "/var/named/data/named.recursing";        // rndc 用的，可以不写
    //secroots-file   "/var/named/data/named.secroots";         // rndc 用的，可以不写
    allow-query     { localhost;  };                            // 将 localhost 改为 any;    192.168.1.0/16;10.0.0.0/16;

    recursion yes;                                              // 递归
    //dnssec-enable yes;                                        // 公私钥
    //bindkeys-file "/etc/named.root.key";
    
    pid-file "/run/named/named.pid";                            //
    session-keyfile "/run/named/session.key";                   //???
};

// ???日志分两种，告警和访问

logging {
    channel default_debug {
            file "data/named.run";
            severity dynamic;
    };
};  // 这个是默认的



logging {
    channel warngin {
        file "/var/named/chroot/var/log/dns_warning" versions 10 size 10m;
        severity warning;                                       // 告警日志
        print-category yes;
        print-severity yes;
        print-time yes;
    };

    channel general_dns {
        file "/var/named/chroot/var/log/dns_log" versions 10 size 100m;     // 轮转 最多10个
        severity info;                                          // 访问日志
        print-category yes;
        print-severity yes;
        print-time yes;
    };

    category default {
        warning;
    };

    category queries {
        general_dns;
    };
};


include "/var/named/chroot/etc/view.conf";




zone "." IN {
    type hint;
    file "named.ca";        // 相对于上边的 directory 配置目录
};


include "/etc/named.rfc1912.zones";         // 
include "/etc/named.root.key";              // 密钥
```

**在 Bind 主配置文件中，zone 语句后定义的域对于数据文件的简写来说非常重要，如果区
域数据文件中不以 . 结尾的名称后会被自动加上该域名称**








只用修改 listen ,allow query 即可




named-checkconf /var/named/chroot/etc/named.conf

/var/named/named.ca             // 根 区域数据库文件 [a,m]
/var/named/named.empty          // 正向的
var/named/named.loopback        // 反向的


### 区域数据库文件解析

主要由资源记录(RR,resource record)组成。

常见资源记录类型：SOA、NS、MX、A、AAAA、PTR、CNAME。

    SOA：start of authority，起始授权记录，一个区域解析库有且只能有一个SOA记录，且必须放在所有资源记录的第一条。
    NS：name service，域名服务记录，一个区域解析库可以有多个NS记录，一个NS记录表示一台DNS服务器，其中一个为主的，其余的为辅的。
    MX：mail exchanger,邮件交换记录,用于标明域内邮件服务器的地址的记录，MX记录可以有多个，其MX记录有优先级的概念，优先级 0-99，数字越小，优先级越高。
    A：address，地址记录，也就是从FQDN–>IPv4
    AAAA：address，地址记录，从FQDN–>IPv6
    PTR：pointer，主要用于实现IP–>FQDN
    CNAME：别名
    TXT: 文本字符串，长度限制512Bytes, 通常作 SPF 记录(反垃圾邮件)

宏定义: 以$开头
注释是分号

区域数据文件一般放在 /var/named/ 目录下




[wikipedia](https://en.wikipedia.org/wiki/Domain_Name_System#Resource_records)

Each record has a type (name and number), an expiration time (time to live), a
class, and type-specific data.

The CLASS of a record is set to IN (for Internet) for common DNS records
involving Internet hostnames, servers, or IP addresses. In addition, the
classes Chaos (CH) and Hesiod (HS) exist.[48] Each class is an independent name
space with potentially different delegations of DNS zones.


语法：NAME [TTL] IN RR_TYPE VALUE
    name ttl class type value 

    NAME：当前区域的区域名称
    IN 表示internet 在DNS报文中由classify字段表示（互联网上我见过的都是IN，至于其他的暂时不知道）
    resource records (RRs)


    对于涉及Internet主机名，服务器或IP地址的常见DNS记录，记录的CLASS设置为IN
    （对于Internet）。此外，还存在混沌（CH）和Hesiod（HS）类。 每个类都是一个独
    立的名称空间，其中DNS区域的委派可能不同。

```
$TTL 3H                                     // 缓存时间，D 天
@       IN SOA  @ rname.invalid. (
// 1.@: 要解析的域名    2.IN: 解释说明    3.SOA: 起始授权    4.@: 解析本域名的DNS    5.管理员邮箱
        0       ; serial                    // 该序号作为slave与master更新的依据,建议的格式为YYYYMMDDnn 其中nn为修订号;不能超过10位
        1D      ; refresh                   // slave 每隔多久进行一次主动更新。
        1H      ; retry                     // 如果到了refresh的时间，但是slave却无法连接master时，那么多久之后，slave会再次的主动尝试与主机连线。应该小于 refresh 
        1W      ; expire                    // 如果slave一直无法与master连接上，那么经过多久的时间后，则命令slave不要在连接master了
        3H )    ; minimum                   // 非权威应答的ttl, 缓存DNS服务器可以缓存记录多长时间
    NS      @                               // NS: 名称服务器(Name server的缩写) 这个zone的查询请向后面这部主机请求。如果此zone有两部以上的DNS服务器负责时，就必须写两个NS，而NS后面接的主机名称必须要有ip的对应，这时需要A记录。
                                            // sfn.cn. 86400 IN NS ns1.sfn.cn.
    A       127.0.0.1                       // IPv4
    AAAA    ::1                             // IPv6

```


管理员邮箱本来应该是“root@localhost.”的格式，不过因为@已经被作为特殊代码(zone)，
所以就用小数点来取代，因此email就成为"root.localhost."


先在/etc/named.conf 中加入要包含的区域数据库文件


```/var/named/liujiao.zone
zone "liujiao.com" IN {
    type master;                    
    file "liujiao.com.zone";        // 区域数据库文件,相对路径(directory参数)或绝对路径
    allow-update {ip|acl};          // 是否允许动态更新
};
```


type
    hint:       根
    master:     主
    slave:      从
    forward:    

---

```/etc/named.conf

zone "liujiao.com" IN {
    type: master;
    file: "liujiao.com.zone";
    allow-update {10.0.0.1;10.0.0.2};
};
```


SOA 只能有一条，而且必须是第一条记录
    最主要的值是DNS服务器的FQDN

```liujiao.com.zone   chgrp named liujiao.com.zone
liujiao.com.  600  IN  SOA  ns1.liujiao.com.  liujiao.liujiao.com. (0 xxx)
liujiao.com.  600  IN  NS   ns1.liujiao.com.
ns1.liujiao.com.  600  IN  A  10.0.0.1
www.liujiao.com.  600  IN  A  10.0.0.2
eshop.liujioa.com. 600 IN  CNAME www

---

$TTL 1D
liujiao.com.    IN  SOA  ns1.liujiao.com. rname.invalid. ( 0 10800 900 604800 86400)
                    NS   ns1.liujiao.com.
ns1                 A    10.0.0.1
www                 A    10.0.0.10
                    AAAA ::1
news                CNAME   www

```

$ORIGIN defines a base name from which 'unqualified' names (those without a
terminating dot) substitutions are made when processing the zone file.

When set to only a dot . that means that only a dot is going to be
added/substituted. That’s all.


ip addr add 10.0.0.1/16 dev eth0


### 反解域

反向区域名称为逆向网络地址加.in_addr.arpa
    10.4.7.11 
    7.4.10.in-addr.arpa

1. 先在 /etc/named.rfc1912.zones 中添加区域文件

```
zone "7.4.10.in-addr.arpa" IN{
    type master;
    file "7.4.10.in-addr.arpa.zone";
    allow-update {10.0.0.1; 10.0.0.2};
};
```

2. 创建反向区域文件

```/var/named/7.4.10.in-addr.arpa.zone
$TTL 600
@   IN  SOA ns1.liujiao.com. liujiao.liujiao.com. (xxx)
@   IN  NS  ns1.liujiao.com.

$ORIGIN 7.4.10.in-addr.arpa.
11  PTR  a.liujiao.com.

```


dig -t PTR 11.7.4.10.in-addr.arpa @10.4.7.11 +short


## 3. DNS 启动

方法一:(不使用 chroot)

    systemctl restart named


方法二:(使用 chroot)

    /var/named/chroot/

    cp -p /etc/named.conf /var/named/chroot/etc/
    cp -p /var/named/named.* /var/named/chroot/var/named/
    cp -p /var/named/named.localhost /var/named/chroot/var/named/liujiao.com.zone

    systemctl restart named-chroot


## 测试

host www.liujiao.com
host news.liujiao.com

nslookup www.liujiao.com
nslookup news.liujiao.com

dig www.liujiao.com



## DNS 常用工具

yum install -y bind-utils

1. nslookup
    不能找 PTR 记录

2. host
    host -t <type> <name> <server>
    host -t A baidu.com 8.8.8.8

3. dig
    
    dig -t <type> -x <addr> name @DNS服务器

    dig -t A baidu.com @8.8.8.8 +short

    dig -t A baidu.com @8.8.8.8 +tcp         // 使用 tcp 端口
    dig -t A baidu.com @8.8.8.8 +notcp       

    dig -t A baidu.com @8.8.8.8 +recurse     // 递归(default)
    dig -t A baidu.com @8.8.8.8 +norecurse   // 迭代


    dig -t PTR 11.7.4.10.in-addr.arpa. @8.8.8.8. +short
    dig -t PTR -x 10.4.7.11 @8.8.8.8 +short

    digt -t A
    

4. nsupdate
    只有交互式用法，和 nslookup 类似
    需要在 zone 配置文件里声明 allow-update { acl; };

    ```
    nsupdate
    server 10.4.7.11
    update add a.b.com A 10.4.7.20

    dig -t A a.b.com @10.4.7.11 +short
    ```

    不会写道 zone 里，会写道 xxx.com.zone.jnr 里, 不是文本文件

    ```
    nsupdate
    server 10.4.7.11
    update del a.b.com
    send
    quit
    ```
    还是写道 jnr 文件里


    不支持直接更改，先删除，再添加

    不需要更新 serial
    不需要重启 named 服务
    可以通过配置acl实现远程管理

    无法使用文本软件打开
    只能完全以来区域传送查看所有区域的记录
        dig -t AXFR xxx.xxx.com @DNS-IP
    操作复杂
    存在远程管理安全隐患


## 主辅同步

1. slave 版本必须 <= master 版本

2. 主DNS的 named.conf 里要配置 
    allow-transfer { 10.4.7.12; };
    also-notify { 10.4.7.12; };

3. 辅助DNS的主配之文件里 option 段
    masterfile-format text;

4. 辅助DNS上创建自定义正解区域文件

    type slave;
    masters 主DNS-IP;

    ``` /etc/named.rfc1912.zones
    zone "host.com" IN {
        type slave;
        masters { 10.4.7.11 };
        file "slaves/host.com.zone";
    };
    ```

    systemctl restart named

    会将主DNS的区域文件同步到本机的 /var/named/slave/ 下, 即上边的 file 参数

5. 启动 slave 前,检查完全区域传送
    dig -t axfr @主DNS-IP

6. 辅助DNS不可主动修改DNS数据库文件


静态域
    主DNS修改后，要修改 serial ，restart 主named

动态域(allow-updte)
    主DNS
        nsupdate add ...
        send
        quit
        dig -t ...
    辅DNS
        dig -t ...

    发现辅DNS直接被同步了
    不需要重启 named
    对主DNS增删改查,辅DNS都是直接同步的, 仅限于 nsupdate, 手动修改主DNS的区域配置文件是不生效的

## 

    ```od.com.zone
    $ORIGIN .
    $TTL 600

    od.com  IN  SOA ns1.od.com. admin.admin.com. ( xxx )
    @       IN  NS  ns1.od.com.
    @       IN  NS  ns2.od.com.

    $ORIGIN od.com.
    $TTL 60
    ns1     IN  A   10.0.0.1
    ns2     IN  A   10.0.0.2
    ```

    chgrp named od.com.zone
    chmod 640 od.com.zone

    named-checkzone od.com.zone od.com.zone

    systemctl restart named

    dig -t A ns1.od.com    @xxx




/etc/resolve.conf

    search liujiao.com          // 可以不用写 FQDN, 只写主机
    nameserver 1.1.1.1


## rndc 远程管理DNS

1. 在服务端生成 rndc-key (rndc-confgen -r /dev/urandom)(安装bind的时候就已经生成了)
    ```
    # Use with the following in named.conf, adjusting the allow list as needed:
    # key "rndc-key" {
    #       algorithm hmac-md5;
    #       secret "tmemSM1y3Khk6Y5BgyS+zw==";
    };
    # controls {        // acl 
    #       inet 127.0.0.1 port 953         // 更改监听IP
    #               allow { 127.0.0.1;  } keys { "rndc-key";  };    // 远程管理主机
    #};
    ```
    将上述内容添加到 named.conf

    主辅 named.conf 都使用上边的，删除辅助DNS 的 /etc/rndc.conf
    restart named


2. 在named.conf 里配置 rndc.key, 并配置 acl
3. 在远程管理主机安装 rndc 软件，并配置 /etc/rndc.conf (bind软件)


rndc status

### 管理静态域

rndc reload od.com



### 管理动态域



## 智能 DNS

1. bind9 内置的 4 个 acl
    1. any
    2. localhost        // 本地回环，也监听本地地址 netstat -tanpu | grep 53
    3. none
    4. localnet

2. 自定义 acl

    简单 acl
    ```
    acl "simpl"{
        10.0.0.1; 192.168.1.1;
    };
    ```

    复杂 acl

    ```
    acl "complex" {
        "simpl";        // 嵌套简单acl
        10.0.1.0/24;
        !172.16.0.1/24;
        {10.0.0.1;10.0.0.2};
        localhost;
    };
    ```

    使用 acl 
        allow-update { "simpl" };
        allow-transfer { "complex" };

3. DNS 的 view 功能
    
    view 语句定义了试图功能。视图是 bind9 提供的强大的新功能，允许DNS 服务器根
    据客户端的不同，有区别的回答 DNS 查询，每个视图定义了一个被特定客户端子集见
    到的 DNS 名称空间。这个功能在一台主机上运行多个形式上独立的 DNS 服务器时特
    别有用.


## 公网DNS

bind-chroot 和 dnssec




## web DNS


https://blog.stanley.wang/2018/12/16/%E5%AE%9E%E9%AA%8C%E6%96%87%E6%A1%A38%EF%BC%9A%E4%BC%81%E4%B8%9A%E7%BA%A7Web%20DNS%E5%AE%9E%E6%88%98/

NamedManager

    https://repos.jethrocarr.com/pub/jethrocarr/linux/centos/7/jethrocarr-custom/x86_64/

    wget https://repos.jethrocarr.com/pub/jethrocarr/linux/centos/7/jethrocarr-custom/x86_64/namedmanager-bind-1.9.0-2.el7.centos.noarch.rpm
    wget https://repos.jethrocarr.com/pub/jethrocarr/linux/centos/7/jethrocarr-custom/x86_64/namedmanager-www-1.9.0-2.el7.centos.noarch.rpm

    yum localinstall ./*


    默认用户名密码： setup/setup123
