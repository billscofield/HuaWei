https://www.bilibili.com/video/av59639498?p=3

## 安装
cd /usr/local/src

wget http://nginx.org/download/nginx-1.16.0.tar.gz

tar -zxf nginx-1.16.0.tar.gz

cd nginx

./configure --prefix=/usr/local/nginx

apt install -f
    apt install pcre  pcre-devel

./configure --prefix=/usr/local/nginx

make && make install

安装完成后 cd /usr/local/nginx, 有4个目录
    conf
    html
    logs
    sbin

./sbin/nginx    启动nginx

./sbin/nginx -h
    nginx -t        : test configuration and exit
    -s signal       : send signal to a master process: stop, quit, reopen, reload



## 信号量
kill -信号量 master进程号

TERM, INT   Quick shutdown
QUIT    Graceful shutdown
KILL    Halts a stubborn process
HUP 
        Configuration reload
        Start the new worker processes with a new configuration
        Gracefully shutdown the old worker processes

USR1    Reopen the log files    日志切割的时候用到
        记录的时候用的是 inum , 即使 mn 改名，还是写到原来的那个 inum 文件中
        kill -USR1 进程号
USR2    Upgrade Executable on the fly   平滑升级nginx
        
WINCH   Gracefully shutdown the worker processes

logs/nginx.pid 当前nginx的进程号
kill -USR1 $(cat /usr/local/nginx/log/nginx.pid)

kill -HUP master进程号


## conf

nginx.conf
```
worker_processes 1; # 一般设为线程数

events{
    worker_connections 1024; # 一个worker可以有多少个连接
}

http{
    server{ # 虚拟主机
        listen 80;  # 监听端口
        server_name localhost; # 监听域名
        
        location / {
            root    # 可以写相对nginx的路径/usr/local/nginx
        }
    }

    server{ # 虚拟主机
        listen 80;  # 监听端口
        server_name localhost; # 监听域名
        
        location / {
            proxy_pass http://192.168.10.171:8080;
        }
    }
}
```
