centos


/etc/nginx/nginx.conf

## 三个主要模块

1. 全局块(核心模块)
    
    从配置文件开始到 event 之上的部分

    work_processes  auto;                  // 处理并发的数量, 基本一个 core 一个, 表示工作进程的数量

        worker_cpu_affinity，这个配置用于将worker process与指定cpu核绑定，降低
        由于多CPU核切换造成的寄存器等现场重建带来的性能损耗[link](http:
        //nginx.org/en/docs/ngx_core_module.html#worker_cpu_affinity)


2. event 块(事件驱动模块)

    主要影响 Nginx 与用户的网络连接

    1. 每个进程的最大连接数
    2. 哪种事件驱动模型, 默认 epoll
    3. 是否允许同时接受多个网络链接
    4. 开启多个网络链接序列化

    worker_connections 1024;                // 最大链接数,单个IP?


3. http 全局块

    include 配置文件
    mime.types
    log_format
    keepalive_timeout


    http 全局块也可以包含 Server 子块 location 子块

    include /etc/nginx/mime.types;
    default_type    字节流

### http 全局块 -> server 子块

配置虚拟主机的相关参数,一个 http 中可以有多个 server

server {
    listen  80;
    server_name _;
    root /usr/share/nginx/html;
    location /405.html {
    }
}

### http -> server -> location 块

配置请求的路由,以及各种页面的处理情况


### 主配置文件

/etc/nginx/nginx.conf

最后一行

    > include /etc/nginx/conf.d/*.conf;

### 子配置文件夹

/etc/nginx/nginx.conf.d/

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


### /etc/nginx/fastcgi_params

动态网站模块文件-python,php所需要的相关变量

### /etc/nginx/scgi_params

### /etc/nginx/uwscgi_params

### /etc/nginx/koi-utf

字符集, 文件编码

### /etc/nginx/win-utf

### /etc/nginx/koi-win

### /etc/nginx/mime.types

文件关联程序


### /etc/nginx/modules

三方模块

### /etc/sysconfig/nginx


### 启动

/usr/lib/systemd/system/nginx-debug.service     // nginx 调试程序启动脚本

/usr/lib/systemd/system/nginx.service

/usr/sbin/nginx


### 文档

/usr/share/doc/nginx-xxx
/usr/share/doc



/var/cache/nginx
/var/log/nginx/

/usr/lib64/nginx




## nginx 编译参数

nginx -V

--prefix=/etc/nginx
--sbin-path=/usr/sbin/nginx
--modules-path=/usr/lib/nginx/modules
--conf-path=/etc/nginx/nginx.conf
--error-log-path=/var/log/nginx/error.log
--http-log-path=/var/log/nginx/access.log
--pid-path=/var/run/nginx.pid
--lock-path=/var/run/nginx.lock
--http-client-body-temp-path=/var/cache/nginx/client_temp
--http-proxy-temp-path=/var/cache/nginx/proxy_temp
--http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp
--http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp
--http-scgi-temp-path=/var/cache/nginx/scgi_temp
--user=nginx
--group=nginx
--with-compat
--with-file-aio
--with-threads
--with-http_addition_module
--with-http_auth_request_module
--with-http_dav_module
--with-http_flv_module
--with-http_gunzip_module
--with-http_gzip_static_module
--with-http_mp4_module
--with-http_random_index_module
--with-http_realip_module
--with-http_secure_link_module
--with-http_slice_module
--with-http_ssl_module
--with-http_stub_status_module
--with-http_sub_module
--with-http_v2_module
--with-mail
--with-mail_ssl_module
--with-stream
--with-stream_realip_module
--with-stream_ssl_module
--with-stream_ssl_preread_module
--with-cc-opt='-g
-O2
-ffile-prefix-map=/data/builder/debuild/nginx-1.21.5/debian/debuild-base/nginx-1.21.5=.
-fstack-protector-strong
-Wformat
-Werror=format-security
-Wp,-D_FORTIFY_SOURCE=2
-fPIC'
--with-ld-opt='-Wl,-z,relro
-Wl,-z,now
-Wl,--as-needed
-pie'
