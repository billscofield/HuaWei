# freeradius


ubuntu 18.04 源
lsb_release -c //查看版本号
    16.04 xenial
    18.04 bionic

```
# 阿里源
deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse


# 清华源
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
`````


## 安装mysql相关软件

apt install mysql-server
apt install mysql-client
aptinstall libmysqlclient-dev

## freeradius 有两种安装方式

1. 下载安装包 ./configure && make && make install
    这种方式的users配置文件是：/usr/local/etc/raddb/users

    apt install gcc gcc-c++

2. sudo apt-get install freeradius freeradius-mysql
    这种方式貌似也是官方推荐的
    这种方式的users配置文件是：/etc/freeradius/users

    然后在/usr/sbin/目录下创建软连接
        ln -s freeradius radiusd

    在运行radiusd时会说是端口已经被使用，是因为系统服务已经自动运行。关闭之后再运行即可：
        sudo service freeradius stop 
        sudo radiusd -X


我是首先使用第一种方式进行安装，测试不成功；然后进行了第二种方法的安装，经过测试发现第二种方式是ok的

在第二种方法之前我还进行了如下操作，下次可以试试不安装
    sudo apt-get  install libtalloc-dev
    sudo apt-get  install libssl-dev
    sudo apt-get  install openssl



### 测试

vi /usr/local/etc/raddb/user
radiusd -X //-X 调试模式启动
正常输出结果是：Ready to process requests

radtest steve testing localhost 0 testing123　　//"radtest [账号] [密码] [认证位址] [NAS端口] [秘钥]"  //“testing123”是FreeRADIUS和NAS的共享密钥，client.conf中有定义
验证通过的输出是包含：Access-Accept


## FreeRadius + Mysql集成

1. 创建数据库
    create database radius default character set utf8;

1. 导入数据表

    `````
    mysql -uroot -p radius</etc/freeradius/sql/mysql/schema.sql
    mysql -uroot -p radius</etc/freeradius/sql/mysql/nas.sql
    `````

### 数据表的设计和结构定义在下面的文件中：

1. /etc/raddb/sql/mysql/schema.sql 主数据库定义，7个表，包括
    1. radcheck 用户检查信息表
    1. radreply 用户回复信息表
    1. radgroupcheck 用户组检查信息表
    1. radgroupreply 用户组检查信息表
    1. radusergroup 用户和组关系表
    1. radacct 计费情况表
    1. radpostauth 认证后处理信息，可以包括认证请求成功和拒绝的记录。


1. /etc/raddb/sql/mysql/nas.sql 网络设备定义，只有一个表：
    1. nas网络设备表

下面的表用于一些扩展功能，可以按需导入。
    ippool.sql  ip池
    wimax.sql wimax设备支持
    cui.sql cui 支持

### 配置

1. vi /etc/freeradius/radiusd.conf
    取消 $INCLUDE sql.conf 的注释

2. vi /etc/freeradius/sql.conf
    取消 readclients = yes 的注释

3. vi /etc/freeradius/sites-enabled/default
   取消authorize{ 、accounting{ 字典的注释 
    authorize字典中注释掉 files,取消sql的注释
    accounting字典中,取消sql的注释

4. vi /etc/freeradius/sites-enabled/inner-tunnel
    authorize{ 中的
    files 添加注释
    取消 sql 的注释

5. vi /etc/freeradius/sql.conf
    修改mysql连接配置
    server = 'localhost'
    login = 'root'
    password = 'toor'
    radius_db = 'radius'

6. 在数据库中添加测试账号
    1. 建立组信息：（这些命令不用做任何修改，直接ctrl+c→ctrl+v就好了)
        mysql>insert into radgroupreply (groupname,attribute,op,value) values ('user','Auth-Type',':=','Local');
        mysql> insert into radgroupreply (groupname,attribute,op,value) values ('user','Service-Type',':=','Framed-User');
        mysql> insert into radgroupreply (groupname,attribute,op,value) values ('user','Framed-IP-Address',':=','255.255.255.255');
        mysql> insert into radgroupreply (groupname,attribute,op,value) values ('user','Framed-IP-Netmask',':=','255.255.255.0');
    1. 建立用户信息：
        mysql> insert into radcheck (username,attribute,op,value) values ('test','User-Password',':=','test');

    1. 将用户加入组中：
        mysql> insert into radusergroup (username,groupname) values ('test','user');
    1. 添加用户回复信息：
        mysql> insert  into radreply(username,attribute,op,value) values('test','Reply-Message','=','Yes,Good!');

    以上命令已添加了一个user组和一个用户，用户名密码都是“test”

7. 测试radius
    终端运行 freeradius -X，开启radius服务器

    重新开一个shell终端来执行下面的命令
    radtest test test localhost 0 testing123

## FreeRadius的web配置

apt install apache2
service apache2 status

在另外一台计算机浏览器中输入 freeradius的ip地址


apache2的web目录在：/var/www/html/


### DaloRADIUS

cd /var/www/html
aria2c https://github.com/lirantal/daloradius/archive/master.zip

unzip master.zip
mv daloradius-master/ daloradius
cd daloradius

配置daloradius，现在导入Daloradius mysql表：
    mysql -u root -p radius < contrib/db/fr2-mysql-daloradius-and-freeradius.sql 
    mysql -u root -p radius < contrib/db/mysql-daloradius.sql


然后更改http文件夹的权限并为daloradius配置文件设置正确的权限：

sudo chown -R www-data:www-data /var/www/html/daloradius/

sudo chmod 664 /var/www/html/daloradius/library/daloradius.conf.php

你现在应该修改filedaloradius.conf.php以调整MySQL数据库信息，打开daloradius.conf.php并添加数据库用户名，密码和数据库名称：

sudo vim /var/www/html/daloradius/library/daloradius.conf.php

特别需要配置的相关变量是：

CONFIG_DB_USER

CONFIG_DB_PASS

CONFIG_DB_NAME

为确保一切正常，请重新启动freeradius和apache2：



### 安装php

apt install php
apt-get install libapache2-mod-php

service apache2 restart
service php7.0-fpm  restart

a2enmod php7.0 报错 no module php   成功后还是不行

chmod 777 /var/www/


https://my.oschina.net/feanlau/blog/2001441
https://yq.aliyun.com/articles/585784



### 不解析php文件的可能原因

1. 未出现
如果访问PHP后缀的文件浏览器提示下载的话，说明服务器没有返回正确的Content-type。
解决方法主要是在Apache的httptd.conf配置文件中添加如下配置(前提是PHP作为模块加载到Apache中)

方法1:直接添加php对应type(不推荐)
    AddType application/x-httpd-php .php

方法2:将.php文件绑定到PHP脚本(官方推荐)
    AddHandler php7-script .php
    "php7-script"中的数字根据PHP版本填5或7




### 安装phpmyadmin
apt install phpmyadmin

配置文件路径：/etc/phpmyadmin
安装位置：/usr/share/phpmyadmin/

建立/var/www/html 下的软连接
    ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin

重启apache2
重启php



## 
https://blog.51cto.com/zlyang/1906894
https://blog.51cto.com/wzlinux/1737044

