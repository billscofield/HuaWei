
## 基本 ACL

编号范围: [2000,2999]

报文的源IP地址


## 高级 ACL

编号范围: [3000,3999]

报文的源IP地址
报文的目的IP地址
报文优先级
IP承载的协议类型及特性等三、四层信息


## 二层 ACL

编号范围: [4000,4999]

报文的源MAC，目的MAC

802.1p优先级，链路层协议类型等二层信息


## 自定义 ACL

编号范围: [5000,5999]

用户自定义报文的偏移位置和偏移量，从报文中提取出相关内容等信息



acl [number] acl-number


基本ACL

rule [rule-id] {permit | deny}  [source {source-address sour-wildcard | any}] [time-range time-name]


rule [rule-id] {permit | deny} protocol [source {source-address sour-wildcard | any}]
    [destination {dest-address dest-mask | any}]
    [source-port ]
    [destination-port]
