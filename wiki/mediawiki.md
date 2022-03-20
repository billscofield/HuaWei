## remi 源

yum install https://mirrors.aliyun.com/remi/enterprise/remi-release-7.rpm

Remi 源大家或许很少听说， 但是我们强烈推荐, 尤其对于不想编译最新版的 Linux 使用
者, 因为 Remi 源中的软件几乎都是最新稳定版.


## docker 

apt install docker-ce -y
apt install docker-ce=<ver> -y


## nginx

[link](https://www.liuvv.com/p/ad42ac48.html)

yum install nginx


apt-cache madison nginx     // 查看支持哪些版本

nginx.conf
    user www-data;           // 一般systemctl在启动nginx和php-fpm的时候默认是以root权限执行的，为了安全起见，nginx和php-fpm会在启动的配置文件中指明他们所需的权限

php-fpm所需的权限一般在pool里面指定比如:/etc/php/7.2/fpm/pool.d/www.conf 里面

## php8.0

[link](https://www.liuvv.com/p/ad42ac48.html)

1. 自动安装找不到 php-fpm 在哪里启动了

    yum-config-manager --enable remi-php80

    yum install  php-cli php-fpm php-mysqlnd php-zip php-devel php-gd php-mbstring php-curl php-xml php-pear php-bcmath php-json php-redis  --skip-broken

2. 手动编译安装(debian)

    

    https://www.liuvv.com/p/ad42ac48.html

    ```
    apt install apt-transport-https ca-certificates

    deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free
    # deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free
    deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free
    # deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free
    deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free
    # deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free
    deb https://mirrors.tuna.tsinghua.edu.cn/debian-security bullseye-security main contrib non-free
    # deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security bullseye-security main contrib non-free




    apt install build-essential
    apt-get install pkg-config
    apt-get install libssl-dev              // no package openssl found
    apt-get install libsqlite3-dev          // no package sqlite3 found
    apt-get install zlib1g-dev              // no package zlib found
    apt-get install libcurl4-openssl-dev    // no package libcurl found
    apt-get install libpng-dev              // no package libpng found
    apt-get install libonig-dev             // no package oniguruma found
    apt-get install libzip-dev              // no package libzip found

    apt-get install libxml2 libxml2-dev     // No package 'libxml-2.0' found

    apt install -y pkg-config build-essential autoconf bison re2c libxml2-dev libsqlite3-dev libssl-dev libonig-dev libpng-dev zlib1g-dev libzip-dev

    ./configure --prefix=/usr/local/php8 --with-config-file-path=/usr/local/php8/etc --enable-fpm --enable-mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --enable-mysqlnd-compression-support  --with-zlib  --enable-xml --disable-rpath --enable-bcmath --enable-shmop --enable-sysvsem  --with-curl --enable-mbregex --enable-mbstring --enable-intl   --enable-ftp  --enable-gd-jis-conv  --with-openssl --with-mhash --enable-pcntl --enable-sockets   --enable-soap --with-gettext --enable-fileinfo --enable-opcache --with-pear --without-gdbm --enable-gd --enable-exif --with-zip

    make && make  install

    查看版本
    /usr/local/php8/bin/php -v
    ```

https://www.mediawiki.org/wiki/Compatibility

MediaWiki is not compatible with PHP 8 yet. See task T248925 for more information.

### 7.4.9


debian

    看了 tsinghua的源，php 是7.4.28的

    手工编译安装 7.4.9

    https://www.php.net/distributions/php-7.4.9.tar.gz

    apt install nginx


/usr/local/php749/etc/php-fpm.d/www.conf
    listen = /usr/local/php749/var/run/php7.4-fpm.sock          // nginx 要一致, 这样就不会监听 9000端口了(二选一)
    listen.owner = www-data                                     // 默认root， nginx 没有权限
    listen.group = www-data                                     // 默认root， nginx 没有权限




访问时候

LocalSettings.php not found.


[link](https://www.shuzhiduo.com/A/LPdorybw53/)
错误提示 
Warning:
open(F:/689phpsessiondatasess_66a39376b873f4daecf239891edc98b5,
O_RDWR) failed 
分析及解决方法 
出现这样的错误语句一般是因为你的php.ini中关于session.save_path一项没有设置好，解决的方法是将session.save_path和session.cookie_path
设置置为 
session_save_path = c: emp 
session.cookie_path = c: emp 




如果你的php是编译安装的，那么默认是没有php.ini的，你必须自行去源码包里边拷贝。
运行phpinfo（）命令可以看到php指定的配置文件路径，把配置文件放到这个路径中即可

    /usr/local/php749/etc
    
    在源文件中叫做:
        ./php.ini-production
        ./php.ini-development



    


## nginx 调用 php



## 打包镜像并上传至 qingcloud 私人仓库


1. 打包镜像

    docker commit [选项] <容器ID或容器名>  [<仓库名>[;<标签>]]

    docker commit --author "Liu Jiao <billscofield@126.com>" --message "nginx and php8-compiled" 12e0f3cd3dd3 mediawiki:0.01

2. 登录仓库
    
    docker login [OPTIONS] [SERVER]

    docker login -u xxx SERVER

    cat pwd.txt | docker login -u poloyy --password-stdin               // 通过密码文件登录


docker login -u {username} -p {password} dockerhub.qingcloud.com

docker tag mediawiki:0.02 dockerhub.qingcloud.com/mediawiki/mediawiki:0.02
docker push dockerhub.qingcloud.com/mediawiki/mediawiki:0.02



## mysql



```

docker run -itd --name mediawikimysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD="xibbaz"  -v /data/docker/mediawikimysql/var/lib/mysql:/var/lib/mysql  xxx



skip-grant-tables





CREATE DATABASE my_wiki;
create user xxx identified by 
grant all on xx.x to xxx@'%'
GRANT INDEX, CREATE, SELECT, INSERT, UPDATE, DELETE, ALTER, LOCK TABLES ON my_wiki.* TO 'sammy'@'localhost' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;
exit
```


## mediawiki

1. LocalSettings.php not found - mediawiki installation

    From the MediaWiki website installation instructions:

    This is an index of all supported configuration options based on the DefaultSettings.php file.

    Never edit DefaultSettings.php; copy appropriate lines to LocalSettings.php instead and amend them as appropriate.
    Create your own LocalSettings.php by copying DefaultSettings.php, and then go through and delete the stuff you don't need/want.



页面配置完毕后，该页面正在自动为我们下载一个名为 LocalSettings.php 的文件。想要成功完成安装，需要将该文件移动到服务器上。因此在完成下载之前，请不要关闭该页面，以免下载失败！

现在我们将下载的文件，移动到服务器的 /var/www/html 站点根目录下 。




