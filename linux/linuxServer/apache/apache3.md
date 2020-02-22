httpd is the same as apache2. 

It depends on the OS you use. 

For example in RHEL 6.2 it is called httpd and in Ubuntu it is called apache2.


init 进程 开启 http守护进程(root)   开启 子进程(工作进程)

## 3种工作模式

Multi-Processing Module (MPM) implements a hybrid multi-process multi-threaded server

是Apache2引入的一个概念，多路处理模块，就是将结构模块化。把核心任务处理作为一个可插拔的模块，即MPM，使其能针对不同的环境进行优化。在这个情况下，就诞生出了处理模式的概念。处理模式在Unix/Linux下现在分为 Prefork、Worker、Event 三种。

https://www.cnblogs.com/linguoguo/p/5508116.html

1. prefork
    
    每个进程只开一个线程
    
1. worker

    每个进程可开多个线程, 其中有一个监听线程

1. event

    解决了 keep-alive 场景下, 
    有一个专门的线程来管理这些 keep-alive 类型的线程
    不能在 https 访问下工作

    keep-alive
        keepalive_timeout
        http 采用 keepalive 来减少 TCP 连接数据量

查看目前的模式

    apache2 -V | grep -i "Server MPM"


指定方式
    在编译时，在选项中指定： --with-mpm=XXX



    /etc/apache2/
    |-- apache2.conf
    |   `--  ports.conf
    |-- mods-enabled
    |   |-- *.load
    |   `-- *.conf
    |-- conf-enabled
    |   `-- *.conf
    `-- sites-enabled
        `-- *.conf


They are activated by symlinking available configuration files from their
respective *-available/ counterparts. These should be managed by using our
helpers **a2enmod/a2dismod, a2ensite/a2dissite and a2enconf/a2disconf**. See
their respective man pages for detailed information.


1. ServerRoot: The top of the directory tree under which the server's configuration, error, and log files are kept.

    Do NOT add a slash at the end of the directory path.

    ServerRoot "/etc/apache2"


1. PidFile: The file in which the server should record its process identification number when it starts.

    This needs to be set in /etc/apache2/envvars

1. KeepAlive: Whether or not to allow persistent connections (more than one request per connection). Set to "Off" to deactivate.

1. MaxKeepAliveRequests: The maximum number of requests to allow during a persistent connection. Set to 0 to allow an unlimited amount.

1. KeepAliveTimeout: Number of seconds to wait for the next request from the same client on the same connection.

1. # These need to be set in /etc/apache2/envvars
    User ${APACHE_RUN_USER}     -> www-data
    Group ${APACHE_RUN_GROUP}   -> www-data

1. HostnameLookups: Log the names of clients or just their IP addresses

1. # Include module configuration:
    IncludeOptional mods-enabled/*.load
    IncludeOptional mods-enabled/*.conf

1. Include list of ports to listen on
    Include ports.conf


apachectl -t //测试配置文件


### 目录别名

```
alias /qun "/liujiao/morning"

<Directory /liujiao>    目录后边没有 slash
    Options
    AllowOverride
    Require
</Directory>

<Directory /liujiao/morning>
    Options
    AllowOverride
    Require
</Directory>
```



### DocumentRoot    默认根目录

/etc/apache2/sites-enabled/000-default.conf
    DocumentRoot /var/www/html

我们改成 /liujiao

但是同时我们还要在主配置文件中添加这个目录的权限相关内容

<Directory /liujiao>
    Options
    AllowOverride
    Require
</Directory>

/home/bill 这样的根目录也可以

### DirectoryIndex

在 debian 中, 这个实在模块中设置的，mods-available/dir.conf

### 日志

在 envvars 文件中存有日志的路径变量, APACHE_LOG_DIR

访问日志  access.log
错误日志  error.log


### 虚拟主机

将 /etc/apache2/sites-enabled 中指向的软连接文件复制为 sina.conf 和 sohu.conf

推荐将网站的目录和 sites-avialable 写在一个文件中

```
<Directory "/liujiao/sohu">
Options Indexes FollowSymLinks
AllowOverride None
Require all granted
</Directory>

<VirtualHost *:80>
# The ServerName directive sets the request scheme, hostname and port that
# the server uses to identify itself. This is used when creating
# redirection URLs. In the context of virtual hosts, the ServerName
# specifies what hostname must appear in the request's Host: header to
# match this virtual host. For the default virtual host (this file) this
# value is not decisive as it is used as a last resort host regardless.
# However, you must set it for any further virtual host explicitly.
#ServerName www.example.com

    ServerAdmin webmaster@localhost
#DocumentRoot /var/www/html
    DocumentRoot /liujiao/sohu/
    ServerName www.sohu.com

# Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
# error, crit, alert, emerg.
# It is also possible to configure the loglevel for particular
# modules, e.g.
#LogLevel info ssl:warn

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

# For most configuration files from conf-available/, which are
# enabled or disabled at a global level, it is possible to
# include a line for only one particular virtual host. For example the
# following line enables the CGI configuration for this host only
# after it has been globally disabled with "a2disconf".
#Include conf-available/serve-cgi-bin.conf
    </VirtualHost>

同样的设置 sina.conf


a2ensite sina.conf
a2ensite sohu.conf


步骤二:
    设置 hosts文件 或者 DNS, 本次实验以本机为例子，设置 /etc/hosts 文件

    192.168.3.105   www.sina.com
    192.168.3.105   www.sohu.com


步骤三：
    curl www.sina.com
    curl www.sohu.com

    ```






### 域名跳转

    sohu.com -> sina.com

    301 永久跳转
    302 临时跳转

    条件
    虚拟主机正常访问

步骤一:

    a2enmod rewrite

步骤二:

    ```
    sites-enabled/sohu.conf

    <Directory "/liujiao/sohu">
        Options Index FollowSymLinks
        **Allowoverride All**
        Require all granted
    </Directory>
    ```

步骤三:

    vi /liujiao/sohu/.htaccess
        RewriteEngine on
        RewriteCond %{HTTP_HOST} ^http://www.sohu.com
        RewriteRule ^(.*)$ http://www.sina.com/$1 [R=permanent,L]

步骤四：

    systemctl restart apache2.service

    curl www.sohu.com



### Apache + openssl 实现 https

mods-available/ssl.conf
a2enmode ssl
systemctl restart apache2.service
apachectl -M    //查看已经启用的模块

mkdir /etc/apache2/cert ; cd /etc/apache2/cert
openssl genrsa -out ca.key 1024     //创建私钥
openssl req -new -key ca.key -out atguigu.csr

openssl x509 -req -days 365 -sha256 -in atguigu.csr -signkey ca.key -out atguigu.crt



















