nginx
lvs
apache
haproxy

## haproxy

tcp/http
算法比较多
性能好，**基于事件驱动的连接处理模式**和**单进程处理模式**
拥有出色的监控页面
功能强大的 ACL 支持

yum install -y epel-release

yum install haproxy

    haproxy.x86_64 : TCP/HTTP proxy and load balancer for high availability environments


    vim-haproxy - syntax highlighting for HAProxy configuration files
    haproxy - fast and reliable load balancing reverse proxy

    ```
                +-----
                |
                | 前端          后端
   Client       |
                |
                |
                |
                +-----
    ```

vim /etc/haproxy/haproxy.cfg

global
defaults
frontend
backend
listen

```
1. global          // 全局配置段
    log 127.0.0.1 local3 info           // 日志, local3:日志对象，需要在 syslog 中配置
    maxconn     4000                    // 用户最大连接数
    user        haproxy
    group       haproxy
    uid
    gid
    nbproc      1                       // number proc 进程个数
    daemon                              // 守护进程方式运行
    pidfile     /var/run/haproxy.pid

    ```
    $ModLoad imudp                  // 取消注释
    $UDPServerRun 514               // 取消注释
    $ModLoad imtcp                  // 取消注释
    $InputTCPServerRun 514          // 取消注释
    ```

2. defaults        // 针对listen 和 backend 块如果没有配置，则使用本章节的默认配置
    log         global          // 使用全局日志,即 global 的部分
    mode        http            // 模式,7层还是4层 tcp
    maxconn     3000            // 高于 global 优先级

    retries     3               // 健康检查，3次连接失败就认为服务不可用
    option      redispatch      // 服务不可用后的操作，重定向到其他健康的服务器(redispatch:再发送)

    stats       uri /haproxy    // 开启 haproxy 的web界面模块      浏览器 IP/haproxy(stats 同 sttaus 状态)
    stats       uri /admin?stats    // 开启 haproxy 的web界面模块      浏览器 IP/haproxy(stats 同 sttaus 状态)
    stats       realm Private lands //
    stats       auth  admin:a   // 认证
    stats       hide-version    // 隐藏统计页面上的 haproxy 版本信息

    contimeout  5000            // timeout connect; haproxy 将客户端请求转发至后端服务器的超时时间, timeout connect
    clitimeout  5000            // timeout client; **haproxy 作为客户**，和后端服务器之间空闲连接的超时时间 timeout client
    srvtimeout  5000            // timeout server; **haproxy 作为服务器**，和用户之间空闲连接的超时时间 timeout server

    option      abortonclose    // 关闭连接的选项

3. frontend http-in             // 前端配置段, 针对用户侧的配置, http-in 是一个名字
    bind 0.0.0.0:80             // 绑定监听的IP和端口
    mode http                   // 7层负载
    log  global                 // 使用全局日志
    option httplog              // 丰富日志内容
    option httpclose            // 每次请求完毕后，关闭http通道

    acl html url_reg -i \.html$ // acl 名称为 html, 以 html 结尾的url时, -i:忽略大小写
    use_backend html-server if html     // 如果满足上面的条件，则推送给后端服务器 html-server

    default_backend html-server         // 默认的后端服务器

4. backend html-server             // 后端配置段, 针对后端服务器的配置
    mode http
    balance roundrobin                          // 负载算法，此处是轮询

    option httpchk GET /index.html              // 使用get进行健康检查

    cookie SERVERID insert indirect nocache     // 负载的同时，根据插入的 cookie SERVERID 值进行会话保持，将相同的请求转发给相同的服务器

    server html-A 10.0.0.1:80 weight 1 cookie 3 check inter 20000 rise 2 fall 5     // 一定要写上端口号
    server html-A 10.0.0.2:80 weight 1 cookie 4 check inter 20000 rise 2 fall 5     // 针对 cookie 为 4 的 健康检查间隔为 2s, 连续2成功则OK， 5次失败则标记为有问题
        check inter 2000 每隔2秒检测依次健康

    cookie SERVERID insert nocache
    #为每个服务器定义一个cookie名称标识
    server web01 172.16.1.7:8888 check port 8888 inter 3s rise 2 fall 3 maxconn 2000 maxqueue 1000 weight 1 cookie web1
    server web02 172.16.1.8:8888 check port 8888 inter 3s rise 2 fall 3 maxconn 2000 maxqueue 1000 weight 1 cookie web2
```

动静分离的一个例子

```
frontend http-in
    bind 0.0.0.0:80
    mode http
    log global
    option httplog
    option httpclose

    acl php url_reg -i \.php$
    acl html url_reg -i \.html$
    use_backend php-server if php
    use_backend html-server if html
    default_backend html-server

backend php-server
    balance roundrobin
    cookie SERVERID insert nocache
    server php-A 10.0.0.1:80 weight 1 cookie php-A check inter 2000 rise 2 fall 5
    server php-B 10.0.0.2:80 weight 1 cookie php-B check inter 2000 rise 2 fall 5

backend html-server
    balance roundrobin
    cookie SERVERID insert nocache
    server html-A 10.0.0.10:80 weight 1 cookie html-A check inter 2000 rise 2 fall 5
    server html-B 10.0.0.11:80 weight 1 cookie html-B check inter 2000 rise 2 fall 5

```



vim /etc/rsyslog.conf
```添加
这6个取消注释
$ModLoad imuxsock   # provides support for local system logging (e.g. via logger command)
$ModLoad imjournal  # provides access to the systemd journal

$ModLoad imudp
$UDPServerRun 514

$ModLoad imtcp
$InputTCPServerRun 514


添加ljkkkk
local3.*    /var/log/haproxy.log
```




```
frontend main *:80
    default_backend app

backend app
    balance     roudrobin                   // 调度算法
    server app1 10.0.0.1:80 check         // check: 支持健康状况检测
    server app2 10.0.0.2:80 check         // check: 支持健康状况检测
```

systemctl restart haproxy

app1 server
yum install httpd


app2 server
yum install httpd




启动 haproxy 的状态监控

```
listen status
    bind *:9876
    status enable
    stats hide-version
    status uri /haproxyadmin?stats
    status realm "only\ admin"
    status auth admin:password
    stats admin if TRUE
```

systemctl restart haproxy

curl 





keeplived 对 haproxy 的健康检查
