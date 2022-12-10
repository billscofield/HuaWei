
服务端不支持 centos7 默认安装，需要编译安装


## nginx + php

```
[nginx-stable]
name= Nginx Stable
baseurl=http://10.0.8.55/nginx/centos/$releasever/$basearch/
gpgcheck=0

```

php

    我们在安装php时，系统的yum源中php版本太老，但是编译安装又太烦，这时我们可以
    使用webtatic源来yum安装较新版本的php。

        https://mirror.webtatic.com/yum/

```
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm   // 依赖 epel-release
yum install -y php72w-cli php72w-fpm php72w-gd php72w-mbstring php72w-bcmath php72w-xml php72w-ldap php72w-mysqlnd nginx

rpm -qa | egrep 'nginx|php'

php72w-gd-7.2.34-1.w7.x86_64
php72w-mysqlnd-7.2.34-1.w7.x86_64
php72w-cli-7.2.34-1.w7.x86_64
php72w-mbstring-7.2.34-1.w7.x86_64
nginx-1.22.1-1.el7.ngx.x86_64
php72w-common-7.2.34-1.w7.x86_64
php72w-pdo-7.2.34-1.w7.x86_64
php72w-xml-7.2.34-1.w7.x86_64
php72w-fpm-7.2.34-1.w7.x86_64
php72w-ldap-7.2.34-1.w7.x86_64

```

### 1. nginx 配置

``` /etc/nginx/conf.d
server {
    listen       80;
    server_name  zabbix6server.com

    access_log  /var/log/nginx/host.access.log  main;

    root /usr/share/nginx/zabbix6server;
    location / {
        index  index.php;
    }


    location ~ \.php$ {
        fastcgi_pass   127.0.0.1:9000;
        fastcgi_index  index.php;
        fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
        include        fastcgi_params;
    }
}

```


### 2. php 配置

sed -r '/^(user|group)/s#apache#nginx#g' /etc/php-fpm.d/www.conf    // 代检查
egrep '^(user|group)' www.conf

    user = nginx
    group = nginx


### 3. 测试

    ```/usr/share/nginx/zabbix6server/index.php
    <?php
    phpinfo();
    ?>
    ```

systemctl enable nginx php-fpm
systemctl restart nginx php-fpm


## mariadb > 10.5

```
https://mirrors.ustc.edu.cn/mariadb/mariadb-10.5.18/yum/centos7-amd64

yum install mariadb-server
```

rpm -qa | grep -i mariadb

systemctl enable mariadb
systemctl restart mariadb

配置

    mysql_secure_installation

        Switch to unix_socket authentication [Y/n] n

    创建库,用户
        create database zabbix character set utf8mb4 collate utf8mb4_bin;
        CREATE USER 'zabbix'@'%' IDENTIFIED BY 'zabbix';
        grant all privileges on *.* to 'zabbix'@'%';
        flush privileges;
        quit;

    导入初始架构和数据，系统将提示您输入新创建的密码。

        wget https://cdn.zabbix.com/zabbix/sources/stable/6.0/zabbix-6.0.12.tar.gz
            schema.sql                  表结构
            images.sql
            data.sql                    数据

            double.sql
            history_pk_prepare.sql

            Makefile.am
            Makefile.in


        mysql --default-character-set=utf8mb4 -uzabbix -p zabbix < schema.sql


## 编译安装 zabbix-server

1. 编译安装 zabbix-server

    安装依赖
        一个个试出来的

        yum install -y mysql-devel pcre-devel openssl-devel zlib-devel libxml2-devel net-snmp-devel net-snmp libssh2-devel OpenIPMI-devel libevent-devel openldap-devel libcurl-devel

    cd /root/zabbix-6.0.12

        ./configure                             // 默认 /usr/local/下边
            --sysconfdir=/etc/zabbix/           // 更改到 /etc/zabbix
            --enable-server                     // 安装的是服务端
            --with-mysql                        // 开启对 mysql 的支持
            --with-net-snmp                     // 开启 zabbix 的功能
            --with-libxml2
            --with-ssh2
            --with-openipmi
            --with-zlib
            --with-libpthread
            --with-libevent
            --with-openssl
            --with-ldap
            --with-libcurl
            --with-libpcre
        make install


    ```
    yum group install "Development tools
    ./configure --sysconfdir=/etc/zabbix/ --enable-server --with-mysql --with-net-snmp --with-libxml2 --with-ssh2 --with-openipmi --with-zlib --with-libpthread --with-libevent --with-openssl --with-ldap --with-libcurl --with-libpcre

    Configuration:

  Detected OS:           linux-gnu
  Install path:          /usr/local
  Compilation arch:      linux

  Compiler:              cc
  Compiler flags:         -g -O2

  Library-specific flags:
    database:              -I/usr/include/mysql -I/usr/include/mysql/mysql
    libpcre:
    libXML2:               -I/usr/include/libxml2
    Net-SNMP:               -I/usr/local/include -I/usr/lib64/perl5/CORE -I. -I/usr/include
    OpenIPMI:              -I/usr/include
    libssh2:               -I/usr/include
    TLS:                   -I/usr/include
    LDAP:                  -I/usr/include
    libevent:              -I/usr/include

  Enable server:         yes
  Server details:
    With database:         MySQL
    WEB Monitoring:        cURL
      SSL certificates:      /usr/local/share/zabbix/ssl/certs
      SSL keys:              /usr/local/share/zabbix/ssl/keys
    SNMP:                  yes
    IPMI:                  yes
    SSH:                   yes (libssh2)
    TLS:                   OpenSSL
    ODBC:                  no
    Linker flags:           -L/usr/lib64   -L/usr/lib64/      -L/usr/lib  -L/usr/lib -L/usr/lib -L/usr/lib -L/usr/lib -L/usr/lib -L/usr/lib  -rdynamic
    Libraries:              -lmariadb     -lxml2    -lnetsnmp -lssh2  -lOpenIPMI -lOpenIPMIposix -lz -lpthread -levent -lssl -lcrypto -lldap -llber   -lcurl -lm -ldl  -lresolv -lpcre
    Configuration file:    /etc/zabbix/zabbix_server.conf
    External scripts:      /usr/local/share/zabbix/externalscripts
    Alert scripts:         /usr/local/share/zabbix/alertscripts
    Modules:               /usr/local/lib/modules

    Enable proxy:          no
    Enable agent:          no
    Enable agent 2:        no
    Enable web service:    no
    Enable Java gateway:   no
    LDAP support:          yes
    IPv6 support:          no
    ***********************************************************
    *            Now run 'make install'                       *
    *                                                         *
    *            Thank you for using Zabbix!                  *
    *              <http://www.zabbix.com>                    *
    ***********************************************************

    ```

2. 修改 zabbix 服务端配置文件

    /etc/zabbix/zabbix_server.conf

    DBName=zabbix #数据库名称
    DBUser=zabbix #数据库用户名
    DBPassword=zabbix #数据库密码
    DBPort=3306
    ListenPort=10051
    LogFile=/var/log/zabbix/zabbix_server.log
    Timeout=4
    LogSlowQueries=3000
    StatsAllowedIP=127.0.0.1

3. 自动 zabbix 服务端

    zabbix_server
    useradd -s /sbin/nologin   -M zabbix


    zabbix_server
    ps -ef | grep zabbix
    ss -tlnpu | grep 10051

4. 书写 systemctl 文件

``` /usr/lib/systemd/system/zabbix-server-mysql.service

[Unit]
Description=Zabbix Server with MySQL DB
After=syslog.target network.target mysqld.service

[Service]
Type=simple
ExecStart=/usr/local/sbin/zabbix_server -f
User=zabbix

[Install]
WantedBy=multi-user.target
```
    -f --foreground                Run Zabbix server in foreground

systemctl daemon-reload
pkill zabbix_server
systemctl restart zabbix-server
systemctl enable zabbix-server


## zabbix-web

```
cp -r /root/zabbix-6.0.12/ui/*   /usr/share/nginx/zabbix6server
chown -R nginx:nginx /usr/share/nginx/zabbix6server/
```

## 访问

http://zabbix6server.com/

    PHP option "post_max_size"      8M      16M
    PHP option "max_execution_time" 30      300
    PHP option "max_input_time"     60      300
    PHP bcmath                      off

    systemctl restart php-fpm


    Zabbix server name: 是一个展示名字
    时区 不用修改配置文件了
    Configuration file "conf/zabbix.conf.php" created.
        /usr/share/nginx/zabbix6server/conf/
        上边的配置都修改在这里了

    Admin
    zabbix


## zabbix-agent

zabbix-agent2 独立进程方式, 一个进程多个县城技术运行



yum install -y https://mirror.tuna.tsinghua.edu.cn/zabbix/zabbix/6.0/rhel/7/x86_64/zabbix-agent2-6.0.7-1.el7.x86_64.rpm

/etc/zabbix/zabbix_agent2.conf
```
Server=127.0.0.1                    
ServerActive=127.0.0.1              
Hostname=Zabbix server              
```

```
grep '^[a-Z]' /etc/zabbix/zabbix_agent2.conf
    PidFile=/run/zabbix/zabbix_agent2.pid
    LogFile=/var/log/zabbix/zabbix_agent2.log
    LogFileSize=0
    Server=127.0.0.1
    ServerActive=127.0.0.1
    Hostname=Zabbix server
    Include=/etc/zabbix/zabbix_agent2.d/*.conf
    ControlSocket=/tmp/agent.sock
    Include=./zabbix_agent2.d/plugins.d/*.conf
```

systemctl restart zabbix-agent2.service
systemctl enable zabbix-agent2.service




## 界面

左上角 System information 就是 zabbix-server 的一些信息

yum install -y stress
    
    stress -c 8 -timeout 999


中文乱码: zabbix 字体
    /usr/share/nginx/zabbix6server/assets/fonts/DejaVuSans.ttf
    cp simfang.ttf /usr/share/nginx/zabbix6server/assets/fonts/DejaVuSans.ttf



/etc/zabbix/zabbix_server.conf
/var/log/zabbix/zabbix_server.log
/usr/lib/systemd/system/zabbix-server.service
/usr/local/share/zabbix/alertscripts/                   用于实现报警的脚本

/etc/zabbix/zabbix_agent2.conf
/etc/zabbix/zabbix_agent2.d                             自定义监控的配置会放在这里





## 

sed -i 's#Server=127.0.0.1#Server=10.0.28.20#g' /etc/zabbix/zabbix_agent2.conf
systemctl enable zabbix-agent2
systemctl restart zabbix-agent2

重启服务端就可以快速看到客户端数据

```
localip=$(ip a | grep inet | grep brd | grep 10.0 | awk '{print $2}' | awk -F/ '{print $1}')
serverip=10.0.28.20

cat >/etc/zabbix/zabbix_agent2.conf <<EOF
PidFile=/run/zabbix/zabbix_agent2.pid
LogFile=/var/log/zabbix/zabbix_agent2.log
LogFileSize=0
Server=${serverip}
ServerActive=${serverip}
Hostname=${localip}
Include=/etc/zabbix/zabbix_agent2.d/*.conf
ControlSocket=/tmp/agent.sock
Include=./zabbix_agent2.d/plugins.d/*.conf
EOF
```

systemctl restart zabbix-agent2
systemctl enable zabbix-agent2





## 自定义监控

1. 没有我们需要的对象
2. 默认监控模板项目太多


案例

1. 监控80端口

    客户端
        1. 取到需要的值
        2. 按照 zabbix 的格式，书写配置文件
        3. 重启客户端并在服务端进行测试

    服务端
        web 键值和监控项进行关联
        web 页面测试

        图形
        触发器


    ss -tlnpu | grep -w :80 | wc -l

    /etc/zabbix/zabbix_agent2.d/web.conf
    ```
    #UserParameter=key,cmd
    # key 键值对名
    # cmd 命令或脚本
    UserParameter=check.ngx, ss -tlnpu | grep -w :80 | wc -l
    或者
    UserParameter=check.ngx, sh /a.sh
    ```

    systemctl restart zabbix-agent2

    客户端本地测试
        zabbix_agent2 -t check.ngx    -> [s|1]
            -t --test
                s 表示 text 类型

            [m|ZBX_NOTSUPPORTED]        // 一般是键值对名字写错了，或者没有重启 zabbix-agent2

    服务端测试
        yum install https://mirror.tuna.tsinghua.edu.cn/zabbix/zabbix/6.0/rhel/7/x86_64/zabbix-get-6.0.7-1.el7.x86_64.rpm
        zabbix-get -s clientIP  -p 10050 -k 键值名
        zabbix-get -s clientIP  -p 10050 -k system.hostname
        zabbix-get -s clientIP  -p 10050 -k check.nginx



    Get Value : zabbix-get
    Get Value and tet: zabbix-get + 前端页面获取数据

图形


触发器
    功能: 函数, 对数据进行处理
    zabbix6
        last(/web01/check.ngx)=0

    <zabbix6
        { web01:check.ngx.last() } = 0

    事件成功迭代
        恢复表达式
            last(/web01/check.ngx) <> 0


    Allow manual close  // 允许手动关闭


常用键值

```

```


## 



