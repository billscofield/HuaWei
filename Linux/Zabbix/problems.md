
## raspbian 4 安装 zabbix 5.0 数据库遇到的问题

按照官方的方法安装完成后，导入数据库的时候，schema 脚本中 dbversion：

```
CREATE TABLE `dbversion` (
        `mandatory`              integer         DEFAULT '0'               NOT NULL,
        `optional`               integer         DEFAULT '0'               NOT NULL
) ENGINE=InnoDB;

INSERT INTO dbversion VALUES ('4000000','4000003');
```

在前端页面中进行配置的时候出现类似报错:

```
The frontend does not match Zabbix database. Current database version (mandatory/optional): 3040000/3040007. Required mandatory version: 3050162. Contact your system administrator.
```

我的mariadb --version:

    mysql  Ver 15.1 Distrib 10.3.27-MariaDB, for debian-linux-gnu (aarch64) using readline 5.2

应该是数据库版本的问题，但是这个版本号 30400000 是从哪里得来的??? 而且zabbix官方的5.0文档中关于数据库的描述

    ```
    https://www.zabbix.com/documentation/5.0/manual/installation/requirements
    /DATABASE MANAGEMENT SYSTEM

    Required if MySQL is used as Zabbix backend database. 
    InnoDB engine is required. 
    MariaDB (10.0.37 or later) also works with Zabbix.
    ```


我是选择重新安装了 zabbix 4.0 版本, 成功


users 表中的密码应该是md5加密的

    update users set passwd=md5("") where userid='1';


数据库状态查看

    systemctl status mariadb.service

配置MariaDB可远程连接

    /etc/mysql/mariadb.conf.d/50-server.cnf
    bind-address = 127.0.0.1                    // 表示只监听了127.0.0.1这个IP

需要学习下 mariadb 的配置

    https://blog.csdn.net/weixin_42236288/article/details/105880236


数据库字符编码问题

    utf8_bin将字符串中的每一个字符用二进制数据存储，区分大小写;

    utf8_genera_ci不区分大小写，ci为case insensitive的缩写，即大小写不敏感，为utf8默认编码。

可以尝试源码安装 mariadb 最新版本

下面的网址列出了所有的版本，会链接到 github

    https://mariadb.com/kb/en/getting-the-mariadb-source-code/


tar --list -f tar文件
