# [Openmeetings](https://openmeetings.apache.org/index.html)


https://cwiki.apache.org/confluence/pages/viewpage.action?pageId=27837303
https://cwiki.apache.org/confluence/display/OPENMEETINGS/Live+iso+OpenMeetings+on+Ubuntu

## install

yum group install "development tools"

1. java

    export JAVA_HOME=/opt/jdk/
    export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH
    export JRE_HOME=/opt/jdk/jre
    export CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH


2. mysql

    yum install mariadb mariadb-server mariadb-devel -y

    启动并设置密码
    systemctl restart mariadb
    systemctl enable mariadb
    mysqladmin -uroot password 123456

    修改/etc/my.cnf文件
    vim /etc/my.cnf
    [client]
    default-character-set = utf8
    [mysqld]
    default-storage-engine = INNODB
    character-set-server = utf8
    collation-server = utf8_general_ci

    重启mysql并检查编码格式
    systemctl restart mariadb

    MariaDB [(none)]> show variables like '%char%';

    创建openmeetings库，使用UTF-8
    MariaDB [(none)]> create database openmeetings charset=utf8;



    yum install -y libjpeg libjpeg-devel freetype freetype-devel unzip gcc gcc-c++ ncurses ncurses-devel make zlib zlib-devel libtool bison bison-devel openssl-devel bzip2 bzip2-devel file-roller git autoconf automake pkgconfig 
    tomcat-native nmap vlc
3. ImageMagick

    是一个图象处理软件。它可以编辑、显示包括JPEG、TIFF、PNM、PNG、GIF和Photo CD
    在内的绝大多数当今最流行的图象格式。协助openoffice提供在线共享图片功能
    
        wget https://imagemagick.org/download/ImageMagick.tar.gz

        ./configure
        make && make install

        PREFIX          = /usr/local

    查看安装版本

        [root@openmeetings tools]# convert --version

4. GhostScript

    阅读开放性文件格式（如pdf）的软件。协助openoffice提供在线共享pdf功能

    ./configure
    编译安装
    make && make install

    查看安装版本
    [root@openmeetings tools]# gs -version


yasm

    wget http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz


sox
    wget https://sourceforge.net/projects/sox/files/sox/14.4.2/sox-14.4.2.tar.gz

