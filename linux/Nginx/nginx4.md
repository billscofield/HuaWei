engine X: 高性能的 Web 和 反向代理服务器

支持 http, https 和电子邮件代理协议

OpenResty 是基于 Nginx 和 Lua 实现的 Web 应用网关，继承了大量的第三方模块

    Nginx的山寨


/usr/local/openresty/

cd /usr/local/openresty/nginx/

```
    sbin
        nginx
    conf
        nginx.conf

    logs
        access.log 访问日志
        error.log 
    html
```

nginx.conf
```
worker_processes 1;  工作时占用的进程数

worker_connections 1024; 每个进程支持的并发请求,
    最大请求数 =  进程数 * 每进程支持的并发请求

http {

    log_format main(格式名称)   日志格式

    sendfile    on;             数据的传输，内核, 优化
    tcp_nopush  on;             优化项目

    keepalive_time 65;          长连接

    gzip on;                    开启压缩，会拉高cpu

    server {
        listen  80;
        server_name servera;

        # charset koi8-r 改为 utf-8
        
        location / {                                     //域名
            root    html/servera;                        //打开域名之后去哪个目录
            index   index.php index.html
        }

    }

    server {
        listen 8080;
        server_name serverb.com

        location /{
            root /html/serverb;
            index index.php index.html
        }
    }
}
```


./nginx -t 检查配置文件
./nginx -s stop         停止服务
./nginx -s reload       重新加载配置文件

netstat -tlnpu | grep nginx

vi /etc/hosts
    127.0.0.1  www.servera.com www.serverb.com


cd ../html

mkdir servera serverb

echo "serverA"> servera/index.html
echo "serverB"> serverb/index.html


curl http://www.servera.com:8000








全局

event

http

    http 全局块

    server 块, 虚拟主机

        
