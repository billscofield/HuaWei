
1. Dokuwiki 是php的，所以要先搭建php环境，下载 apache和php，第1、2步下载完，相关的依赖都会下载

## Dokuwiki 安装
1. httpd
    yum -y install httpd
    // 在浏览器中输入http://localhost 如果现实It works则说明Apache安装成功，否则Apache未成功安装

2. php
    yum -y install php
    //重启Apache，以便Apache注册PHP模块 sudo /etc/init.d/apache2 restart

    ```
    测试PHP是否安装成功

    使用vi编辑器在/var/www/html目录下新建一个php脚本test.php

    vi /var/www/html/test.php
    在test.php中添加以下代码

    <?php
      phpinfo();
    ?> 
    再次登录网页，输入：localhost/test.php如果显示了php的版本信息等，那么就说明成功支持PHP,到此准备工作完毕。
    ```

因为用yum命令找不到安装包，所以直接去官网下载稳定版

3. 下载并解压dokuwiki程序包
    wget -c http://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz
    tar -zvxf dokuwiki-stable.tgz

    ```
    
    ```

apache 默认地址是 /var/www/html ，所以把dokuwiki程序包解压后放到此地址

4. 将解压后的文件夹移到 apache 默认路径中
    mv dokuwiki-2017-02-19e/ /var/www/html/wiki
    
    ``` ???
    设置权限，如果不设置权限会导致无法正常安装

    #data和conf目录需要写权限
    cd dokuwiki
    sudo chown -R www-data:www-data data conf
    ```

httpd 默认启动的用户及组是 apache，所以修改文件夹所属用户及组

5. 修改文件夹所属用户及组
    chown -R apache:apache /var/www/html/wiki

    ``` 链接3
    安装DokuWiki——在浏览器中输入安装: http://localhost/dokuwiki/install

    至此，安装成功。
    ```

6. 启动 httpd
    service httpd start

检查端口80是否有开通
    firewall 开通80端口
    firewall-cmd --zone=public --add-port=80/tcp --permanent
    firewall-cmd --reload

7. 访问 install.php 进行最后安装
    http://IP或者域名/wiki

8. 安装配置
    1. 维基名称：你wiki的名字，比如我的是Lainme's Blog
    1. 启用ACL（推荐）：即启用权限控制，这个保持默认（选中状态）
    1. 超级用户：输入超级用户的用户名
    1. 全名：超级用户的全名，和上一个一样就行
    1. E-Mail：超级用户的电子邮件地址
    1. 密码：超级用户的密码
    1. 请再输一次：再次输入密码
    1. 初始的ACL政策：全局权限控制策略，在下拉列表中选择一个合适的
    1. 开放的维基（任何人都有读、写、上传的权限）
    1. 公开的维基（任何人都有读的权限，只有注册用户才有写和上传的权限）
    1. 关闭的维基（只有注册用户才有读、写、上传的权限）

填写完成后按“保存”完成安装。现在再次进入http://IP或者域名/wiki，可以在右下角看到有个“登录”按钮，同时标题栏也变成了你设定的网站名称。

9. 安装成功后
    1. 删除 install.php
        rm -f /var/www/html/wiki/install.php
    2. 对URL进行过滤以保证数据安全
        vim /etc/httpd/conf/httpd.conf
        在 httpd.conf 添加下面代码

        ```
        <LocationMatch "/wiki/(data|conf|bin|inc)/">
        　　Order allow,deny
        　　Deny from all
        　　Satisfy all
        </LocationMatch>
        ```
    
10. 开机自启 apache
    chkconfig --levels 235 httpd on

### 遇到的问题1：Dokuwiki Setup Error
DokuWiki Setup Error

The datadir ('pages') at ./data/pages is not found, isn't accessible or writable. You should check your config and permission settings. Or maybe you want to run the installer?

解决方法：用yum命令先安装 httpd，再安装 php。开始的时候直接用 yum 安装 php，通过依赖会自动安装其他环境，包括 httpd，但是一直报 Dokuwiki Setup Error，网上都没有找到解决方法，后来重新搭一个环境，先装 httpd，再装 php，就没有出现这个错误了

### 遇到的问题2：如果访问时显示 403 Forbidden，需要关闭SELinux
查看SELinux状态：
1、/usr/sbin/sestatus -v ##如果SELinux status参数为enabled即为开启状态
SELinux status: enabled
2、getenforce ##也可以用这个命令检查

关闭SELinux：
    1. 临时关闭（不用重启机器）：
        setenforce 0 //设置SELinux 成为permissive模式
        //setenforce 1 设置SELinux 成为enforcing模式
    2. 修改配置文件需要重启机器：
        修改/etc/selinux/config 文件
        将SELINUX=enforcing改为SELINUX=disabled
        重启机器即可
### 链接
https://www.cnblogs.com/error503/p/8041982.html

https://thishosting.rocks/build-your-own-wiki-on-ubuntu-with-dokuwiki/

https://www.cnblogs.com/ljxxz/p/5079226.html

https://blog.csdn.net/wszll_Alex/article/details/80246588

https://www.linuxprobe.com/ubuntu-dokuwiki-wiki.html

https://www.dokuwiki.org/zh:install:ubuntu (official methods)

Dokuwiki系列教程
    1. https://blog.csdn.net/wszll_alex/article/category/7650010

使用教程
    1. http://www.360doc.com/content/15/0716/13/15077656_485261906.shtml
    1. dokuwiki注册及发邮件问题的解决
        1. http://www.fwolf.com/blog/post/82
    1. https://blog.csdn.net/leekwen/article/details/54907445

## Dokuwiki基本语法
维基语法，也支持Markdown语法

