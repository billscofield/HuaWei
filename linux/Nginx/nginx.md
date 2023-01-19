##

IO 复用
    Apache 是线程, 线程不稳定


## 1. 初识Nginx

http
反向代理
IMAP/POP3/SMTP 服务器


### 1. 什么是 nginx

优点

    1. 占用内存少, 高并发，高性能
    2. 可扩展性好
    3. 高可靠性
    4. 热部署
        不停止服务的情况下进行升级
    5. BSD许可证

组成

    1. Nginx 二进制可执行文件
        1. 由各模块源码编译出的一个文件
        2. 相当于一辆汽车
    1. Nginx.conf 配置文件
        1. 控制 Nginx 的行为
        2. 相当于驾驶员,各种功能由驾驶员决定开启与否
    1. access.log 访问日志
        1. 记录每一条 http 请求信息
        2. 相当于 GPS 轨迹
    1. error.log 错误日志
        1. 定位问题
        2. 相当于黑匣子

版本发布情况(mainline)
    feature功能
    bugfix bug修复
    change 重构

    1.偶数 mainline version
    1.奇数 stable version
    
版本选择

    开源版：nginx.org
    商业版：nginx.com(Nginx plus)
    阿里巴巴的Tengine
        没有办法和Nginx的官方版本同步升级
    OpenResty
        开源版 openresty.org
        商业版 openresty.com

### 2. 反向代理

1. 正向代理
    翻墙
    我的代理人
    我    ->    代理人    ->    它

2. 反向代理
    暴露的是代理服务器的地址，隐藏了真实服务器的IP地址
    我    <-    代理人    <-    它

### 3. 负载均衡

|           请求                查询
|   client  -------->  服务器  -------->  数据库
|           <--------          ---------
|           响应                

haproxy, lvx, 硬件, F5, netscaler

nginx 早期只支持 http, 后来也支持 tcp/udp


### 4. 动静分离

|   client --->    nginx --+-->  动态资源 ---> tomcat -> 动态资源(jsp,servlet)
|                          |
|                          |
|                          +---> 静态资源服务器

### 5. 支持动态 Web 服务扩展

PHP(fastcgi_pass)
JAVA(proxy_pass)
Python(uwsgi_pass)
...

Nginx 结合 FastCGI 运行 PHP 动态程序


### 6. 缓存

通过 proxy_cache 模块实现

squid, varnish, ats


## 应用场景

HTTP 服务器
FTP 服务器
反向代理
负载均衡

10W+的并发连接(取决于内存大小，极限能够到百万)
内存消耗低
高扩展性
高可靠性

nginx
apache
openresty
cloudflare


## 2. 安装

1. 方法一:

    apt install -y nginx

    yum install -y epel-release
    yum install -y nginx

2. 方法二:编译安装(推荐)
    
    wget http://nginx.org/download/nginx-1.22.1.tar.gz

    依赖:

        pcre
            apt-get install libpcre3 libpcre3-dev
            yum install pcre pcre-devel
        openssl
            apt-get install openssl libssl-dev
            yum install openssl openssl-devel
        zlib
            apt-get install zlib1g-dev
            zlib是提供数据压缩用的函式库


    下载
    目录介绍
        auto目录
            cc 编译
            lib
            os
        conf 示例文件
        contrib/vim/  vim语法着色文件支持
            cp -r contrib/vim/* ~/.vim/
        html
            50x.html 500错误文件
            index.html 默认启动文件
        man manual
        src 源代码

    configure
        看看configure 支持那些参数
        
        1. ./configure --help
            1. 目录类大块
            
            1. 使用哪些模块，不使用哪些模块
                --with-xxx
                    意味着不会默认编译进安装
                --without-xxx
                    意味着会默认编译进安装
                我安装的时候提示没有pcre模块: ./configure --prefix=/usr/local/nginx --with-pcre=pcre
                    --with-zlib=zlib

                    pcre:  Perl 5 Compatible Regular Expression Library
                        apt install -y libpcre3 libpcre3-dev
                
            1. 中间文件会放在 objs 文件夹中
                ngx_modules.c 决定哪些模块会编译进nginx

                ```
                useradd -M -s /sbin/nologin  www
                ./configure
                    --user=www
                    --group=www
                    --with-http_stub_status_module              // nginx 的状态
                    --with-http_ssl_module                      // https
                    --with-pcre


                Configuration summary
                + using system PCRE library
                + OpenSSL library is not used
                + using system zlib library

                nginx path prefix: "/opt/nginx1.22.1"
                nginx binary file: "/opt/nginx1.22.1/sbin/nginx"
                nginx modules path: "/opt/nginx1.22.1/modules"
                nginx configuration prefix: "/opt/nginx1.22.1/conf"
                nginx configuration file: "/opt/nginx1.22.1/conf/nginx.conf"
                nginx pid file: "/opt/nginx1.22.1/logs/nginx.pid"
                nginx error log file: "/opt/nginx1.22.1/logs/error.log"
                nginx http access log file: "/opt/nginx1.22.1/logs/access.log"
                nginx http client request body temporary files: "client_body_temp"
                nginx http proxy temporary files: "proxy_temp"
                nginx http fastcgi temporary files: "fastcgi_temp"
                nginx http uwsgi temporary files: "uwsgi_temp"
                nginx http scgi temporary files: "scgi_temp"
                ```
        
        2. make && make install
        
        3. /usr/local/nginx

1. 配置文件

    时间
        1. ms,milliseconds
        1. s,seconds
        1. m,minutes
        1. h,hours
        1. d,days
        1. w,weeks
        1. M,months,30days
        1. y,years,365days

    空间
        1.      bytes
        1. k/K  kilobytes
        1. m/M  megabytes
        1. g/G  gigabytes

## 卸载

首先停止服务
卸载 系统默认安装的,--purge包括配置文件
apt-get --purge remove nginx

apt autoremove  自动移除全部不使用的软件包

dpkg --get-selections | grep nginx  列出与 nginx 相关的软件，并删除显示的软件

apt --purge remove nginx-common

再次执行 dpkg --get-selections | grep nginx

which nginx  不再显示nginx




1. 使用
    -h,-?           :this help
    -c filename     :set configuration file 使用指定的配置文件
    -g directives   :set global directives out of configuration file 指定配置指令
    -p prefix       :set prefix path(default:/usr/share/nginx/  系统自带的) 指定运行目录
                                    (default:/usr/local/nginx/  本人编译安装的)
    -q              Suppress(封锁，隐瞒) non-error messages during configuration testing.]
    -t              :test configuration and exit    测试配置文件是否有语法错误
    -T              :test configuration, dump it and exit
    -v              :show version and exit
    -V              :show version and configure options then exit ./configure 的信息
    -s signal       :send singal to a master process: stop, quit, reopen, reload
        stop    :立刻停止服务
        quit    :优雅的停止服务
        reload  :重载配置文件(quit方式)
        reopen  :重新开始记录日志文件,换一个新的日志文件

1. 热部署
    生成新的 ./configure make 后的 nginx/objs/nginx 
    cp /usr/local/nginx/sbin/nginx /usr/local/nginx/sbin/nginx.old
    mv new_nginx /usr/local/nginx/sbin/nginx -f

    nginx -USR2 正在运行的 Nginx master 进程号
        使用新的 Nginx 启动一个进程,老的平滑过渡到新的
        ps -aux | grep nginx   发现老的已经不在坚挺80端口

    nginx -WINCH 老的Nginx master 进程号
        让老的 Nginx 优雅的关闭所有进程
        work process 会全部关闭，但是老的master不会自动关闭，允许我们做版本回退
        
1. 日志切割
        nginx reopen


## 基础命令

1. 版本号
    nginx -v
    nginx -V                // 会显示  configure 参数

2. 启动
    /usr/sbin/nginx
    systemctl restart nginx

3. 关闭
    nginx -s stop           // -s signal
    kill -term 主进程号

    强制关闭
        kill -9 主机称号

    优雅地关闭
        nginx -s quit
        kill -quit 主进程号

4. 重新加载
    nginx -s reload

5. 检查配置文件正确
    nginx -t




## service

``` debian11
[Unit]
Description=A high performance web server and a reverse proxy server
Documentation=man:nginx(8)
After=network.target nss-lookup.target

[Service]
Type=forking
PIDFile=/run/nginx.pid
ExecStartPre=/usr/sbin/nginx -t -q -g 'daemon on; master_process on;'
ExecStart=/usr/sbin/nginx -g 'daemon on; master_process on;'
ExecReload=/usr/sbin/nginx -g 'daemon on; master_process on;' -s reload
ExecStop=-/sbin/start-stop-daemon --quiet --stop --retry QUIT/5 --pidfile /run/nginx.pid
TimeoutStopSec=5
KillMode=mixed

[Install]
WantedBy=multi-user.target
```

是否以守护进程方式运行Nginx
    语法：daemon on | off; (默认是on)
是否以master/worker方式工作
    语法：master_process on | off; (默认on)

信号
    INT（快速关闭）—-是当用户键入<Control-C>时由终端驱动程序发送的信号。这是一
    个终止当前操作的请求，如果捕获了这个信号，一些简单的程序应该退出，或者允许
    自给被终止，这也是程序没有捕获到这个信号时的默认处理方法。拥有命令行或者输
    入模式的那些程序应该停止它们在做的事情，清除状态，并等待用户的再次输入。

    TERM（快速关闭）—-是请求彻底终止某项执行操作，它期望接收进程清除自给的状态
    并退出。

    HUP 平滑启动。如果想要更改配置而不需停止并重新启动服务，请使用该命令。在对
    配置文件作必要的更改后，发出该命令以动态更新服务配置。
        kill -HUP <pid>

    QUIT：从容关闭。
        kill -QUIT <pid>

    当我们使用kill pid时，实际相当于kill -15 pid。也就是说默认信号为15(SIGTERM)。
    使用kill -15时，系统会发送一个SIGTERM的信号给对应的程序。当程序接收到该信号
    后，具体要如何处理自己可以决定。

    因为kill -15信号只是通知对应的进程要进行"安全、干净的退出"，程序接到信号之
    后，退出前一般会进行一些"准备工作"，如资源释放、临时文件清理等等，如果准备
    工作做完了，再进行程序的终止。

    但是，如果在"准备工作"进行过程中，遇到阻塞或者其他问题导致无法成功，那么应
    用程序可以选择忽略该终止信号。

    这也就是为什么我们有的时候使用kill命令是没办法"杀死"应用的原因，因为默认的
    kill信号是SIGTERM（15），而SIGTERM（15）的信号是可以被阻塞和忽略的。

    和kill -15相比，kill -9就相对强硬得多，系统会发出SIGKILL信号，他要求接收到
    该信号的程序应该立即结束运行，不能被阻塞或者忽略。

    所以，kill -9在执行时，应用程序是没有时间进行"准备工作"的，所以这通常会带来
    一些副作用，数据丢失或者终端无法恢复到正常状态等。

    [link](https://cloud.tencent.com/developer/article/1797537)



```centos7
[Unit]
Description=The nginx HTTP and reverse proxy server
After=network-online.target remote-fs.target nss-lookup.target
Wants=network-online.target

[Service]
Type=forking
PIDFile=/run/nginx.pid
# Nginx will fail to start if /run/nginx.pid already exists but has the wrong
# SELinux context. This might happen when running `nginx -t` from the cmdline.
# https://bugzilla.redhat.com/show_bug.cgi?id=1268621
ExecStartPre=/usr/bin/rm -f /run/nginx.pid
ExecStartPre=/usr/sbin/nginx -t
ExecStart=/usr/sbin/nginx
ExecReload=/usr/sbin/nginx -s reload
KillSignal=SIGQUIT
TimeoutStopSec=5
KillMode=process
PrivateTmp=true

[Install]
WantedBy=multi-user.target

```

## 目录结构

编译安装的 nginx

conf
    nginx.conf
html
    默认页
logs
    access.log
    error.log
    nginx.pid



### 配置文件

centos
    /etc/nginx/nginx.conf

ubuntu
    /etc/nginx/conf.d/

---

```
worker_processes  1;

events {
    worker_connections  1024;                           // 事件驱动模块，每个 worker 可以建立多少个链接
}

http {
    include       mime.types;                           // 服务器返回给浏览器头中，标识文件类型, 可以手动编辑这个文件
    default_type  application/octet-stream;             // 如果 mime.types 中没有

    sendfile        on;                                 // 数据零拷贝，操作系统直接来读取该文件进行发送

    keepalive_timeout  65;

    server {                                            // 一个 server 代表一个虚拟主机 v-host
        listen       80;
        server_name  localhost;                         // 域名或者主机名(可以被解析的)

        location / {                                    // 域名后边的某个 uri
            root   html;                                // 相对 nginx 主目录的一个相对路径
            index  index.html index.htm;
        }

        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }
    }

    include /opt/nginx/conf.d/*.conf                    // 可以把其他的虚拟主机放到这个目录中进行分别的管理
}

```

``` /opt/nginx/conf.d/xiange.conf

server {
    listen 80;
    server_name *.xiange.com

    location / {                                        // 通配符，正则
        root    /opt/nginx/html/xiange.com;
        index   index.html;
    }
}

```




QPS: 


### 反向代理 proxy_pass

短网址
多用户二级域名
httpdns
    适用于 CS 架构, app

网关
    就像路由器就是一个网关，容易形成瓶颈

nginx 反向代理
    隧道式代理: 进出都得经过nginx

    DR (lvs 可以提供)
        用户请求 -网关-->  nginx ---> 业务服务器
            |                             |
            |                             |
            +-<----<---<---<---<---<---<--+

```
server {
    listen 80;
    server_name *.xiange.com
    location / {
        proxy_pass http://www.xiange.com;                       // 不支持 https
        #root    /opt/nginx/html/xiange.com;                    // 配置了 proxy_pass root 和 index 就失效了
        #index   index.html;                                    // 配置了 proxy_pass root 和 index 就失效了
    }
}

```

### 基于反向代理的负载均衡

算法:
    1. 轮询(默认) RR
        无法保持会话

    2. 权重 weight
        weight=1
        weight=1 down;                                          // 不参与负载均衡
        weight=1 backup;                                        // 只有它存在时这台主机才可用

    3. ip_hash
        实际中不会用, 而是用 lua 在 nginx 中写程序
        可以保持会话
        相同来源的 ip 指向相同的后端服务器

    4. least_conn
        实际中不会用, 而是用 lua 在 nginx 中写程序
        最少连接数
    
    5. fair
        实际中不会用, 而是用 lua 在 nginx 中写程序
        需要配合第三方插件
        根据后端服务器响应时间

    6. url_hash
        实际中不会用, 而是用 lua 在 nginx 中写程序
        需要配合第三方插件
        不能维持会话
        定向流量转发

        比如 http://a.com/register -> 哈希值 -> 注册服务器
             http://a.com/login    -> 哈希值 -> login服务器

    基于 session 


``` 1. 轮询
upstream httpds{                                                // 一个负载均衡的名称
    server 10.0.0.1:123;
    server 10.0.0.2:123;
}

server {
    listen 80;
    server_name liujiao.com;
    location / {
        proxy_pass http://httpds;                               // 上边那个负载均衡的名称
    }
}
```

``` 2. 权重 weight
upstream httpds{
    server 10.0.0.1:123 weight=9;
    server 10.0.0.2:123 weight=1;
    server 10.0.0.3:123 weight=1 down;
    server 10.0.0.3:123 weight=1 backup;
}

server {
    listen 80;
    server_name liujiao.com;
    location / {
        proxy_pass http://httpds;
    }
}
```




### 动静分离

适合小网站

```
server {
    listen 80;
    server_name liujiao.com;
    location / {
        proxy_pass http://10.0.0.4;
    }

    location /css {
        root html;
        index index.html index.htm;
    }

    location /js {
        root html;
        index index.html index.htm;
    }

    location /img {
        root html;
        index index.html index.htm;
    }

    location ~*/(js|img|css) {                      // 正则, 以 ~* 开始，不区分大小写
        root html;
        index index.html index.htm;
    }
}
```



### url rewrite

```
server {
    listen 80;
    server_name liujiao.com;

    location / {
        rewrite ^/2.html$       /index.jsp?pageNum=2    break;
        rewrite ^/([0-9]+).html$       /index.jsp?pageNum=$1    break;           $1 就是第一个组
        proxy_pass http://10.0.0.1;
    }
}

    除了 break 还有如下选项:
        last
        redirect:  302 临时重定向, 跳转到 /index.jsp?... 这个地址
        permanent: 301 永久重定向, 跳转到 /index.jsp?... 这个地址
```


### 防盗链

referer 参照页，引用页


```
server {
    listen 80;
    server_name liujiao.com;

    location / {
        rewrite ^/([0-9]+).html$       /index.jsp?pageNum=$1    break;           $1 就是第一个组
        proxy_pass http://10.0.0.1;
    }

    location ~*(js|img|js){
        valid_referers 10.0.0.1;
        #valid_referers none 10.0.0.1;              // 没有 referer 也可以访问
        if ($invalid_reA{
            return 403;
        })
    }
}
```



curl -I http://www.baidu.com            // 返回响应头
    -e   (HTTP)  Sends  the  "Referer Page" information to the HTTP server.
    -I   (HTTP/FTP/FILE) Fetch the HTTP-header only!




### https

```
server {
    listen 80;

    #SSL 默认访问端口号为 443
    listen 443 ssl; 

    #请填写绑定证书的域名
    server_name cloud.tencent.com; 

    #请填写证书文件的相对路径或绝对路径
    ssl_certificate cloud.tencent.com_bundle.crt; 

    #请填写私钥文件的相对路径或绝对路径
    ssl_certificate_key cloud.tencent.com.key; 
    ssl_session_timeout 5m;

    #请按照以下协议配置
    ssl_protocols TLSv1.2 TLSv1.3; 

    #请按照以下套件配置，配置加密套件，写法遵循 openssl 标准。
    ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:HIGH:!aNULL:!MD5:!RC4:!DHE; 

    ssl_prefer_server_ciphers on;

    location / {
        #网站主页路径。此路径仅供参考，具体请您按照实际目录操作。
        #例如，您的网站主页在 Nginx 服务器的 /etc/www 目录下，则请修改 root 后面的 html 为 /etc/www。
        root html; 
        index  index.html index.htm;
    }
}

```




集成环境(lnmp等)

    oneinstack




### 虚拟主机


    ```
    server {
            listen       80;
            # 配置了二级域名
            server_name  onenav.bitbeings.com;

            location / {
                # 表示代理的端口是本机的8001端口
                proxy_pass http://127.0.0.1:8001;
            }
        }
    ```
