# composer

作曲家

作者
    德国 Nils Adermann
    比利时 Jordi Boggiano

[官网](https://getcomposer.org/)

[](packagist.com)
[](packagist.org)

阿里

    composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
    composer config -g -l
        json 文件所在目录执行

三大部分

1. 仓库，公共库/私有库
2. 命令行客户端
3. 自动加载代码, PSR0 - PSR4 规范

## 客户端安装和使用

需要 php 开启 openssl 支持

    curl -sS https://getcomposer.org/installer | php
    mv composer.phar /usr/local/bin/composer

如果你之前已经安装过，那么切换到你的应用根目录下面，然后执行下面的命令进行更新：

    composer update topthink/framework

    更新操作会删除thinkphp目录重新下载安装新版本，但不会影响app目录，因此不要在
    核心框架目录添加任何应用代码和类库。

安装 monolog
    composer require monolog/monolog
    或者
    创建 json 文件, composer install

## packagist仓库

## 常用命令

    composer list                               查看所有命令

    composer composer 命令名称 --help           产看某个命令的帮助

    composer -V                                 查看当前版本
    composer self-update                        软件自身更新

    composer show <package>                     显示包信息

        先在有 composer.json 的目录执行 composer show; 会列出当前项目安装了哪些
        包,然后 composer show topthink/framework 来显示这个包的信息

        注意 topthink/framework 并不是一个具体的包, 可能是个虚拟包? show 不到

    search <package>    查询包(联网查询简单信息)

