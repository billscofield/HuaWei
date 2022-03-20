
## 一、反向代理实例1

1. 反向代理

    www.baidu.com   nginx   ---+-->     tomcat
                               |
                               +-->     tomcat
                               |
                               +-->     tomcat


    docker run -d --name nginx01 -p 8001:80 -p 8080:8080 -p 8081:8081 -p 8082:8082 -p 9001:9001 debian:latest

    apt update
    apt install vim -y
    apt install nginx -y
    apt install wget -y

    apt install -y default-jdk
    wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.76/bin/apache-tomcat-8.5.76.tar.gz
    tar xf apache-tomcat-8.5.76.tar.gz -C /opt/
    cd /opt/apache-tomcat-8.5.76/bin/
    startup.sh

    tail -f logs/catalina.out   // tomcat日志文件

    ss -tlnpu


    具体配置

    ```
    #root /var/www/html;        // 不注释掉的话有些资源不会被加载
    location / {
        proxy_pass http://127.0.0.1:8080;
    }
    ```


## 反向代理实例2

www.baidu.com/edu   nginx   ---+-->     :8080
www.baidu.com/vod   nginx   ---+-->     :8081

准备两个 tomcat

    mkdir 8080 8081
    tar xf apache-tomcat-8.5.76.tar.gz -C /opt/8080/
    tar xf apache-tomcat-8.5.76.tar.gz -C /opt/8081/

    cd /opt/8081/tomcat/conf
    vim server.xml
    8005 -> 8015        shutdown
    8080 -> 8081
    8009 -> 8019

创建文件夹
    /opt/tomcat8080/webapps/edu/index.html      127.0.0.1:8080/edu
    /opt/tomcat8081/webapps/edu/index.html      127.0.0.1:8081/vod

    ``` /etc/nginx/nginx.conf

    Server{

        location ~ /edu/ {
            proxy_pass http://127.0.0.1:8080;
        }
        
        location ~ /vod/ {
            proxy_pass http://127.0.0.1:8081;
        }
    }

    127.0.0.1:9001/edu/                         最后一个"/"必须存在
    127.0.0.1:9001/vod/
    ```

    ```
    =   严格匹配
    ~   表示 uri 中包含正则表达式，case sensitive
    ~*  表示 uri 中包含正则表达式，case insensitive
    ~~  表示 
    ```


## 二、负载均衡实例1

浏览器访问  192.168.17.129/edu/a.html

nginx 主机 

两台 tomcat 主机(8080, 8081)
    webapps 中创建 edu/a.html

    ``` /etc/nginx/nginx.conf

    http {
        upstream myserver{          是域名吗?
            server 1.1.1.1:8080 weight=1;       ------> +
            server 1.1.1.2:8081 weight=1;       ------> +   // 不能夸域吗? 如 www.baidu.com
        }                                               |   拦截nginx到 1.1.1.1 h
                                                        +-->
        server{                                         |
            server_name 本季ip;                         |
            location / {                                |
                proxy_pass http://myserever;     -------+
            }
        }
    }
    ```

分配方式

    1. 轮询(default)
        
        **每个请求按照时间顺序逐一分配到不同的后端服务器，如果后端服务器 down 掉，能自动剔除**

    2. weight(权重)
        
        默认为1， 权重越高被分配的客户端就越多

    3. ip_hash
        
        直接添加 ip_hash
        
        每个请求按访问 ip 的hash结果分配, 这样每个访客固定访问一个后端服务器,
        可以解决 session 的问题, 例如:
            
        ```
        upstream server_pool{
            ip_hash;
            server 10.0.0.1:80;
            server 10.0.0.2:80;
        }
        ```

    4. fair(第三方)
        
        按后端服务器的响应时间来分配请求，响应时间越短的优先分配


## 三、动静分离

简单来说就是把动态和静态**请求**分开, 大致分为两种实现方式:

1. 纯粹的把静态文件独立成单独的域名，放在独立的服务器上，也是目前主流推荐的方案

2. 动态文件和静态文件混合在一起发布，通过 nginx 来分开

通过 location 指定不同的后缀名实现不同的全年请求转发. 通过 expires 参数设置，可
以使浏览器还春过期时间，减少于服务器之前的请求和流量.

具体 expires 定义: 是给一个资源设定一个过期时间，也就是说无需去服务端验证，直接
通过浏览器自身确认是否过期即可，所以不会产生额外的流量。

这种方法非常适合不经常变动的资源。(如果经常更新的文件，不建议使用 expires 来缓存)

    3d 表示这3天内访问这个URL，发送一个请求，比对服务器该文件最后更新时间没变化，
    则不会从服务器抓取，返回状态码 304, 如果有修改，则直接从服务器重新下载，返
    回状态码 200

    浏览器产生缓存


实验准备

    静态资源位置:
        /data/img/a.jpg
        /data/www/a.html

        ```
        location /www/ {
            root /data/;
            index index.html index.htm;
            expires 1d;
        }

        location /img/ {
            root /data/;
            autoindex on;       // 这个必须要有, 列出文件夹中的内容
        }
        ```



## 四、高可用集群




            nginx1(主)       tomcat1
            10.0.0.1

client

            nginx1(从)       tomcat1
            10.0.0.2


    nginx 需要用到 keepalived , 对外提供一个虚拟 IP(如:10.0.0.3)
    keepalived 起到一个路由的作用


准备工作
    1. 两台 nginx, 同时安装 keepalived
    2. 两台 tomcat

    apt install keepalived      // 77MB

    debian 的配置文件是以 sample文件夹的形式存在于 /usr/share/doc/keepalived/sample/中

    生效地址是: /etc/keepalived/

    ```/etc/keepalived/keepalived.conf

    global_defs {               // 全局定义
        
        router_id LVS_DEVEL     // 主机的名字，写在 /etc/hosts 
    }


    vrrp_script chk_http_port {
        script      "/usr/local/src/nginx_check.sh"
        interval    2                       // 检测脚本执行的间隔
        weight      2                       // 如果脚本执行成功，就把当前主机权重设置为 weight的值
    }


    vrrp_instance VI_1 {
        state BACKUP            // 主为 MASTER, 从为 BACKUP
        interface ens33         // 网卡
        virtual_router_id   51  // 主从机器的 virtual_router_id 必须相同
        priority 100            // 主备机器的优先级， 主机值较大，备用机较小
        advert_int 1            // 时间间隔，心跳
        virtual_ipaddress {
            10.0.0.2            // 虚拟地址
        }
    }

    ```

    ```nginx_check.sh
    #!/usr/bin/env bash
    A=$(ps -C nginx --no-header | wc -l)
    if [ $A -eq 0 ];then
        /usr/sbin/nginx
        sleep 2
        if [ $(ps -C nginx --no-header | wc -l) -eq 0 ];then
            killall keepalived
        fi
    fi
    ```

