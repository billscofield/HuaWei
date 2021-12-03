
nginx
php72
mariadb

yum install -y centos-release-scl
修改 zabbix.repo enable [zabbix-frontend]


---

server:
    rpm -ivh https://mirror.tuna.tsinghua.edu.cn/zabbix/zabbix/5.0/rhel/7/x86_64/zabbix-server-pgsql-5.0.9-1.el7.x86_64.rpm

client:
    rpm -ivh https://mirror.tuna.tsinghua.edu.cn/zabbix/zabbix/5.0/rhel/7/x86_64/zabbix-agent2-5.0.9-1.el7.x86_64.rpm

web-mysql:
    rpm -ivh https://mirror.tuna.tsinghua.edu.cn/zabbix/zabbix/5.0/rhel/7/x86_64/frontend/zabbix-web-mysql-scl-php73-5.0.9-1.el7.noarch.rpm

nginx:
    rpm -ivh https://mirror.tuna.tsinghua.edu.cn/zabbix/zabbix/5.0/rhel/7/x86_64/frontend/zabbix-nginx-conf-scl-5.0.9-1.el7.noarch.rpm


1. mysql 数据库

    rpm -ivh https://mirror.tuna.tsinghua.edu.cn/zabbix/zabbix/5.0/rhel/7/x86_64/zabbix-proxy-mysql-5.0.9-1.el7.x86_64.rpm

    或者直接 yum install mariadb-server

    create database zabbix character set utf8 collate utf8_bin;

    rpm -qa | grep zabbix-server-mysql

        zcat create.sq.gz >zabbix.sql   添加 USE zabbix;
        mysql <zabbix.sql
        grant all on zabbix.* to zabbix@localhost identified by 'zabbix'

2. 服务器

    vim /etc/zabbix/zabbix_server.conf

        DBName=zabbix
        DBUser=zabbix
        DBPassword=zabbix

3. 前端

    php
        cd /etc/opt/rh/
        cd rh-php72
        
        vim php-fpm.d/zabbix.conf
            listen.acl_users = apache,nginx
            php_value[date.timezone] = Asiz/Shanghai

    nginx
        cd /etc/opt/rh/
        cd rh-nginx116/nginx
        
        cd conf.d/zabbix.conf
            listen
            server_name
        
        cd ..
        vim nginx.conf
            看下端口是不是80 和 zabbix 冲突

systemctl start zabbix-server.service  rh-php72-php-fpm.service rh-nginx116-nginx.service

默认帐号密码
    Admin
    zabbix

