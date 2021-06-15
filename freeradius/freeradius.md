apt install apache2 php7.0 libapache2-mod-php7.0

    vi /var/www/html/phpinfo.php
        <?php
        phpinfo();
        ?>

apt install mysql-server mysql-client libmysql-dev

apt install phpmyadmin

    ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin

apt install freeradius

    ps -aux | grep freeradius 
    kill -9 
    freeradius -X


daloRADIUS 登录后报错:No such file or directory in /var/www/html/daloradius/library/opendb.php on

    命令行： wget http://pear.php.net/go-pear.phar | php
    命令行：php go-pear.phar
    如果没有你试一下:装完后就可以使用pear来安装DB了
        pear install DB

    用户名：administrator
    密码：radius
