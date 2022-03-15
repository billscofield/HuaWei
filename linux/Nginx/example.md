
## 反向代理实例1

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


## 负载均衡实例1

浏览器访问  192.168.17.129/edu/a.html

nginx 主机 

两台 tomcat 主机(8080, 8081)
    webapps 中创建 edu/a.html

    ``` /etc/nginx/nginx.conf

    http {
        upstream myserver{          是域名吗?
            ip_hash;
            server 1.1.1.1:8080 weight=1;       ------> +
            server 1.1.1.2:8081 weight=1;       ------> +
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

