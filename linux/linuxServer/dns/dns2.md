
named.conf              设置一半的 named 参数，指向该服务器使用的域数据库
named.conf.options      全局选项
db.root                 跟服务器指向文件，无需更改
db.local                区域正解文件，将FQDN--->IP
db.127                  区域反解文件，将IP--->FQDN



其主配置文件/etc/named.conf的配置语句

1. acl 定义IP地址的访问控制列表

2. Control 定义ndc使用的控制通道

3. Include 把其他文件包含到配置文件中

4. Key 定义授权的安全密钥

5. Logging 定义日志写什么，写在哪

6. Options 定义全局配置选项和缺省值

7. Server 定义远程服务器的特征

8. Trunstred-keys 为服务器定义DNSSEC加密秘钥

9. Zone 定义一个区域

初始情况下，该配置文件内容如下（随版本变更可能会发生变化）：

```
zone "." {

type hint;

file "/etc/bind/db.root";

};

zone "localhost" {

type master;

file "/etc/bind/db.local";

}; 

zone "127.in-addr.arpa" {

type master;

file "/etc/bind/db.127";

};

include "/etc/bind/named.conf.options";
include "/etc/bind/named.conf.local";
include "/etc/bind/named.conf.default-zones";
```


其中type项的值：

Master：定义为域主服务器
Slave：定义为域辅服务器
Hint：定义为互联网中根域服务器

在Debian系统中，所有Options语句的配置内容，全部给移至named.conf.options中，以下是该文件的默认配置：

```
options {
    directory "/var/cache/bind";

    // If there is a firewall between you and nameservers you want
    // to talk to, you may need to fix the firewall to allow multiple
    // ports to talk.  See http://www.kb.cert.org/vuls/id/800113

    // If your ISP provided one or more IP addresses for stable
    // nameservers, you probably want to use them as forwarders.
    // Uncomment the following block, and insert the addresses replacing
    // the all-0's placeholder.

    // forwarders {
    //  0.0.0.0;
    // 
};

    //========================================================================
    // If BIND logs error messages about the root key being expired,
    // you will need to update your keys.  See https://www.isc.org/bind-keys
    //========================================================================
    dnssec-validation auto;

    auth-nxdomain no;    # conform to RFC1035
    listen-on-v6 { any;  };

};
```
