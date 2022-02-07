kali 下 maridb 密码忘记的解决方案

/usr/bin/mysqld_safe --skip-grant-tables

另外一个 terminal 中 
mysql -uroot -p 回车

use mysql;
select host,user,password,authentication_string from user;
update user set authentication_string=password('密码') where user='root'
flush privileges;?

关闭 /usr/bin/mysqld_safe --skip-grant-tables 终端

应该需要 service mysql restart

mysql -uroot -p
