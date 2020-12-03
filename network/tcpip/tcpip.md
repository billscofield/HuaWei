
## 会话层

拿QQ来举例，QQ软件有一个端口号，但是不同人之间的会话是隔离的


## IP 是不可靠的

tcp 相当于卖家，ip 相当于物流，顾客收到货物后才会付款，但是 IP 不一定能送到


## ping -s 最大值

icmp payload 最大值是 1500Bytes

ip header 是 20Bytes

icmp header 是 8Bytes

1500 - 20 - 8 = 1472 Bytes

所以 ping -s 最大值是 1472 



### 路由跟踪 

linux
    ping -R <目标>

Cisco 路由器
    ping 
    根据提示进行设置



## telnet route-server.ip.att.net

用户名: rviews
密  码: rviews

查看全球 IP 路由信息
