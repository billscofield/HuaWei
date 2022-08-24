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


### 编译选项

1. --prefix=path

    定义一个目录，存放服务器上的文件 ，也就是nginx的安装目录。默认使用
    /usr/local/nginx。

2. --sbin-path=path

    设置nginx的可执行文件的路径，默认为 prefix/sbin/nginx.

3. --conf-path=path

    设置在nginx.conf配置文件的路径。nginx允许使用不同的配置文件启动，通过命令行
    中的-c选项。默认为prefix/conf/nginx.conf.

4. --pid-path=path

    设置nginx.pid文件，将存储的主进程的进程号。安装完成后，可以随时改变的文件名
    ， 在nginx.conf配置文件中使用 PID指令。默认情况下，文件名 为
    prefix/logs/nginx.pid.

5. --error-log-path=path

    设置主错误，警告，和诊断文件的名称。安装完成后，可以随时改变的文件名 ，在
    nginx.conf配置文件中 使用 的error_log指令。默认情况下，文件名 为
    prefix/logs/error.log.

6. --http-log-path=path

    设置主请求的HTTP服务器的日志文件的名称。安装完成后，可以随时改变的文件名 ，
    在nginx.conf配置文件中 使用 的access_log指令。默认情况下，文件名 为
    prefix/logs/access.log.

7. --lock-path=path

    指向lock文件（nginx.lock）（安装文件锁定，防止安装文件被别人利用，或自己误
    操作。）




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
