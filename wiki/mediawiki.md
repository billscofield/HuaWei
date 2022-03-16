## remi 源

yum install https://mirrors.aliyun.com/remi/enterprise/remi-release-7.rpm

Remi 源大家或许很少听说， 但是我们强烈推荐, 尤其对于不想编译最新版的 Linux 使用
者, 因为 Remi 源中的软件几乎都是最新稳定版.


## docker 



## nginx

[link](https://www.liuvv.com/p/ad42ac48.html)

yum install nginx


## php8.0

[link](https://www.liuvv.com/p/ad42ac48.html)

1. 自动安装找不到 php-fpm 在哪里启动了

    yum-config-manager --enable remi-php80

    yum install  php-cli php-fpm php-mysqlnd php-zip php-devel php-gd php-mbstring php-curl php-xml php-pear php-bcmath php-json php-redis  --skip-broken

2. 手动编译安装(debian)

    https://www.liuvv.com/p/ad42ac48.html

    ```
    apt install build-essential
    apt-get install pkg-config
    apt-get install libssl-dev              // no package openssl found
    apt-get install libsqlite3-dev          // no package sqlite3 found
    apt-get install zlib1g-dev              // no package zlib found
    apt-get install libcurl4-openssl-dev    // no package libcurl found
    apt-get install libpng-dev              // no package libpng found
    apt-get install libonig-dev             // no package oniguruma found
    apt-get install libzip-dev              // no package libzip found

    apt install -y pkg-config build-essential autoconf bison re2c libxml2-dev libsqlite3-dev libssl-dev libonig-dev libpng-dev zlib1g-dev libzip-dev

    ./configure --prefix=/usr/local/php8 --with-config-file-path=/usr/local/php8/etc --enable-fpm --enable-mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --enable-mysqlnd-compression-support  --with-zlib  --enable-xml --disable-rpath --enable-bcmath --enable-shmop --enable-sysvsem  --with-curl --enable-mbregex --enable-mbstring --enable-intl   --enable-ftp  --enable-gd-jis-conv  --with-openssl --with-mhash --enable-pcntl --enable-sockets   --enable-soap --with-gettext --enable-fileinfo --enable-opcache --with-pear --without-gdbm --enable-gd --enable-exif --with-zip

    make && make  install

    查看版本
    /usr/local/php8/bin/php -v
    ```

https://www.mediawiki.org/wiki/Compatibility

MediaWiki is not compatible with PHP 8 yet. See task T248925 for more information.




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



## mediawiki

1. LocalSettings.php not found - mediawiki installation

    From the MediaWiki website installation instructions:

    This is an index of all supported configuration options based on the DefaultSettings.php file.

    Never edit DefaultSettings.php; copy appropriate lines to LocalSettings.php instead and amend them as appropriate.
    Create your own LocalSettings.php by copying DefaultSettings.php, and then go through and delete the stuff you don't need/want.
