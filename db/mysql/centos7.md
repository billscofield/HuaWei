## mysql

rpm -Uvh https://dev.mysql.com/get/mysql80-community-release
yum install -y mysql80-community-release-el7-6.noarch.rpm
rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022
    /etc/pki/rpm-gpg/RPM-GPG-KEY-mysql这一步签名验证失败。mysql官网解决方案，使
    用的4.1以上版本的rpm的话，除了import mysql的公钥到个人用户的配置中，还需要
    import mysql的公钥到RPM的配置中。

yum --enablerepo=mysql80-community install mysql-community-server

systemctl restart mysqld
systemctl enable mysqld

cat /var/log/mysqld.log | grep "password"

mysql_secure_installation



## php8.0

yum install https://mirrors.tuna.tsinghua.edu.cn/remi/enterprise/remi-release-7.rpm

yum -y install yum-utils
    yum-config-manager


yum -y install php php-{cli,fpm,fileinfo,ldap,mysqlnd,zip,devel,gd,mbstring,curl,xml,xmlrpc,pear,bcmath,json}


## nginx

yum install -y nginx
systemctl restart nginx
systemctl enable nginx
