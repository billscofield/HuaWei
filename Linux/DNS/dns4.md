
``` host
# host baidu.com
baidu.com has address 220.181.38.148
baidu.com has address 39.156.69.79
baidu.com mail is handled by 10 mx.maillb.baidu.com.
baidu.com mail is handled by 20 jpmx.baidu.com.
baidu.com mail is handled by 20 mx1.baidu.com.
baidu.com mail is handled by 15 mx.n.shifen.com.
baidu.com mail is handled by 20 mx50.baidu.com.


host www.baidu.com
www.baidu.com is an alias for www.a.shifen.com.             //别名, baidu.com 是别名???
www.a.shifen.com has address 61.135.169.125
www.a.shifen.com has address 61.135.169.121
www.a.shifen.com has IPv6 address 2408:80f0:410c:1c:0:ff:b00e:347f
www.a.shifen.com has IPv6 address 2408:80f0:410c:1d:0:ff:b07a:39af



src git:(master) host www.jd.com
www.jd.com is an alias for www.jd.com.gslb.qianxun.com.
www.jd.com.gslb.qianxun.com is an alias for www.jdcdn.com.
www.jdcdn.com is an alias for img2x-v6-sched.jcloudedge.com.
img2x-v6-sched.jcloudedge.com has address 220.194.105.131
img2x-v6-sched.jcloudedge.com has IPv6 address 2408:8710:20:1140:8000::3

```


``` nslookup
nslookup www.baidu.com
Server:         202.106.0.20
Address:        202.106.0.20#53

Non-authoritative answer:
www.baidu.com   canonical name = www.a.shifen.com.          //canonical name Name:   www.a.shifen.com
Address: 61.135.169.121
Name:   www.a.shifen.com
Address: 61.135.169.125
Name:   www.a.shifen.com
Address: 2408:80f0:410c:1c:0:ff:b00e:347f
Name:   www.a.shifen.com
Address: 2408:80f0:410c:1d:0:ff:b07a:39af



Server:         202.106.0.20
Address:        202.106.0.20#53

Non-authoritative answer:
www.jd.com      canonical name = www.jd.com.gslb.qianxun.com.
www.jd.com.gslb.qianxun.com     canonical name = www.jdcdn.com.
www.jdcdn.com   canonical name = img2x-v6-sched.jcloudedge.com.
Name:   img2x-v6-sched.jcloudedge.com
Address: 220.194.105.131
Name:   img2x-v6-sched.jcloudedge.com
Address: 2408:8710:20:1140:8000::3

```




``` dig
dig www.jd.com @8.8.8.8

; <<>> DiG 9.11.5-P4-5.1+deb10u1-Debian <<>> www.jd.com @8.8.8.8
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 28440
;; flags: qr rd ra; QUERY: 1, ANSWER: 4, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;www.jd.com.                    IN      A

;; ANSWER SECTION:
www.jd.com.             119     IN      CNAME   www.jd.com.gslb.qianxun.com.
www.jd.com.gslb.qianxun.com. 59 IN      CNAME   www.jdcdn.com.
www.jdcdn.com.          59      IN      CNAME   img2x-v6-sched.jcloudedge.com.
img2x-v6-sched.jcloudedge.com. 119 IN   A       220.194.105.131

;; Query time: 1123 msec
;; SERVER: 8.8.8.8#53(8.8.8.8)
;; WHEN: Wed Aug 12 08:40:09 CST 2020
;; MSG SIZE  rcvd: 157

```




## 配置


/etc/bind/named.conf
```
// This is the primary configuration file for the BIND DNS server named.
//
// Please read /usr/share/doc/bind9/README.Debian.gz for information on the     看这个文档
// structure of BIND configuration files in Debian, *BEFORE* you customize
// this configuration file.
//
// If you are just adding zones, please do that in /etc/bind/named.conf.local

include "/etc/bind/named.conf.options";
include "/etc/bind/named.conf.local";           //我们自定义的zone
    ---
    这里还包含了 私有地址的反向解析
    zone "10.in-addr.arpa"      { type master; file "/etc/bind/db.empty";  };

    zone "16.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty";  };
    zone "17.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty";  };
    zone "18.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty";  };
    zone "19.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty";  };
    zone "20.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty";  };
    zone "21.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty";  };
    zone "22.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty";  };
    zone "23.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty";  };
    zone "24.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty";  };
    zone "25.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty";  };
    zone "26.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty";  };
    zone "27.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty";  };
    zone "28.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty";  };
    zone "29.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty";  };
    zone "30.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty";  };
    zone "31.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty";  };

    zone "168.192.in-addr.arpa" { type master; file "/etc/bind/db.empty";  };




    我们自己创建zone的时候可以拷贝 /etc/bind/named.conf.default-zones 中的localhost域的配置文件, 一般以db.域
    和 
    zone "localhost" {
        type master;
        file "/etc/bind/db.local";
    };

        ;
        ; BIND data file for local loopback interface
        ;
        $TTL    604800
        @   IN  SOA localhost. root.localhost. (
                   2     ; Serial
              604800     ; Refresh
               86400     ; Retry
             2419200     ; Expire
             604800 )    ; Negative Cache TTL   如果这个数据库zone中，每笔RR记录都没有写TTL的话，就以这个SOA中设置的值为准
        ;
        @   IN  NS  localhost.
        @   IN  A   127.0.0.1
        @   IN  AAAA    ::1
        


    ---

include "/etc/bind/named.conf.default-zones";   //包含了根域的定义, localhost域 和 一些反向解析
    ---
    // prime the server with knowledge of the root servers
    zone "." {
        type hint;
        file "/usr/share/dns/root.hints";
    };

    // be authoritative for the localhost forward and reverse zones, and for
    // broadcast zones as per RFC 1912

    zone "localhost" {
        type master;
        file "/etc/bind/db.local";
    };

    zone "127.in-addr.arpa" {
        type master;
        file "/etc/bind/db.127";
    };

    zone "0.in-addr.arpa" {
        type master;
        file "/etc/bind/db.0";
    };

    zone "255.in-addr.arpa" {
        type master;
        file "/etc/bind/db.255";
    };
    ---

```

from /usr/share/doc/bind9/READEM>Debian.gz

The working directory for named is now **/var/cache/bind**.  Thus, any transient
files generated by named, such as database files for zones the daemon is
secondary for, will be written to the /var filesystem, where they belong.



## 日志

/var/log/syslog


## /etc/default/bind9

```
# run resolvconf?
RESOLVCONF=no

# startup options for the server
OPTIONS="-u bind"
```
