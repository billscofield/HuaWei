
# debian buster 卸载 mariadb 后重新安装，各种缺失文件

https://stackoverflow.com/questions/51317209/mariadb-10-3-8-installation-from-mariadb-repo-missing-files

    ` apt-get install --reinstall -o Dpkg::Options::="--force-confmiss" mariadb-server-10.3

        Created some files:
        /etc/mysql/conf.d
        /etc/init.d/mysql
        /etc/mysql/debian-start

And:

    ` apt-get install --reinstall -o Dpkg::Options::="--force-confmiss" mysql-common
        Created:
        /etc/mysql/my.cnf

但是还是起不来, 没有找到 /var/run/mysqld/mysqld.sock


## skip-grant-tables 

不用在配置文件中写 skip-grant-tables

systemctl stop mysql
mysqld_safe --skip-grant-tables &
mysql -uroot

结果发现只有一个 information_schema 数据库



## Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' 

https://serverfault.com/questions/279366/what-should-mysqld-sock-contain-why-dont-i-have-it

When you specify host=localhost, mysql client will try to login to mysql server using unix named pipe which requires a .sock file.

This can be bypassed by specifying host=127.0.0.1. This will make mysql client use TCP to connect to the server.

Taken from MySQL's documentation:

mysql --host=127.0.0.1 --port=3306 --user=your_uname --password=your_pass


**The socket file is created when the service is started and removed when the service is terminated.**

因为mysql 服务一直起不来


## MYSQL: ERROR 1049 (42000): Unknown database 'mysql'

Depending on how MySQL was installed, it is possible that the default MySQL database was NOT created. 



