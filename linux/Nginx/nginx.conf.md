
## 三个主要模块

1. 全局块(核心模块)
    
    从配置文件开始到 event 之上的部分

    work_processes  auto;                  // 处理并发的数量, 基本一个 core 一个


2. event 块(事件驱动模块)

    主要影响 Nginx 与用户的网络连接

    每个进程的最大连接数
    哪种事件驱动模型
    是否允许同时接受多个网络链接
    开启多个网络链接序列化

    worker_connections 1024;                // 最大链接数,单个IP?




3. http 块

    http 块也可以包含 Server 块 location 块

    include /etc/nginx/mime.types;
    default_type    字节流



### http -> server 块

配置虚拟主机的相关参数,一个 http 中可以有多个 server

server {
    listen  80;
    
    location 
}

### http -> server -> location 块

配置请求的路由,以及各种页面的处理情况




### 子配置文件

//早期的版本的 default 是放在 /etc/nginx/nginx.conf 中, 
/etc/nginx/conf.d/default.conf 


Server {
    listen 80;
    server_name localhost;      // 服务器域名 www.aaa.com, 有多个虚拟主机时,可以根据这个 switch

    #access_log  /var/log/nginx/host.access.log  main;  // 注释掉就是主配文件中的

    location / {
        root /usr/share/nginx/html;         // 网站的根目录
        index index.html  index.htm;

        autoindex on;                       // 开启目录浏览功能；
        autoindex_exact_size off;           // 关闭详细文件大小统计，让文件大小显示MB，GB单位，默认为b；
        autoindex_localtime on;             // 开启以服务器本地时区显示文件修改日期！
    }
}

多个网站就在 /etc/nginx/conf.d/ 下边写配置文件
