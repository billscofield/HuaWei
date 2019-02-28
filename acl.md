访问控制列表（Access Control List)

由一系列permit 或 deny 语句组成

https://www.bilibili.com/video/av36773716?from=search&seid=1554408998681272506

源ip,目的ip,协议类型，源端口等,路由条目

## 分类
1. 基本访问控制列表
    只能对IP头中的源IP地址进行匹配
1. 高级访问控制列表

## 创建ACL
Basic Acl :     [2000,2999]
Advanced Acl :  [3000,3999]

可以命名

Rule 5 permit/deny 匹配条件
Rule 6 permit/deny 匹配条件
Rule 7 permit/deny 匹配条件
...
Rule N permit/deny 匹配条件
末尾隐含 permit any

rule 1 permit source 192.168.1.1 0.0.0.0


acl 2000  进入acl视图
rule 5（步长） permit/deny source src-address wildcard(反掩码,通配符,0表示匹配，1表示无所谓)


特殊的wildcard
    某一个ip
        192.168.1.1  0.0.0.0     192.168.1.1 0          精确匹配192.168.1.1
    
    全部ip
        0.0.0.0 255.255.255.255                     匹配any ip


例子
    192.168.1.0/24 奇数的ip地址

    192.168.1.---- ---1
                      这个1需要匹配,最后一个Byte的8bit中，前7个bit无所谓，最后一个需要严格匹配
    0.0.0.254
