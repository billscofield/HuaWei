## 集中动态网站技术
Asp     和客户端不断开连接
.net
php     

查看apache2 版本
    apache2ctl -v

## 两种模式
1. Prefork模式
    Prefork MPM 使用多个子进程，每个子进程只有一个线程。每个进程在某个确定的时间只能维持一个连接。
1. Worker 模式
    Worker MPM使用多个子进程，每个子进程有多个线程。
    占用内存比Prefork低

## 安装 
apt install apache2    

配置文件 
    /etc/apache2/apache2.conf
    /etc/apach2/ports.conf


service apache2 graceful //优雅地重启
service apache2 graceful-stop //优雅地重启


logs,   文件夹



ServerAdmin 设置一个邮件地址，如果服务器有任何问题将发信到这个地址， 这个地址会在服务器产生的某些页面中出现。
DocumentRoot 是这个站点的根目录，这样 Apache2 启动时会扫描 /etc/apache2/sites-enabled 中可用的 website 配置并加载

默认的显示格式在/etc/apache2/mods-available/dir.conf文件中


## 配置多域 2.4.38 (Debian)

因为apache的版本不同，有的版本要求虚拟主机的扩展名为.conf
/etc/apache2/sites-available/SITENAME.conf

1. 修改hosts文件
    127.0.0.1 one.com

1. /var/www/one
    mkdir /var/www/one
    echo "this is one">/var/www/one/index.html

1. 创建站点

    ```
    cp sites-available/000-default.conf  one.conf

    <Directory /home/user/webroot>
        AllowOverride None
        Require all granted
    </Directory> 
    ```

1. a2ensite one 启用站点
    当我们执行了这两个命令之后会发现在 /etc/apache2/sites-enable/ 目录下出现了one 文件. 
    前面说过sites-enable是包含已经启用的站点配置的文件夹, 这就代表着. 我们通过a2ensite命令启用sites-available目录中的站点配置后, apache就会在sites-enable中创建一个对应的配置连接 . 
    那这样的话, 配置模块的 mods-available和mods-enable 目录是否也有同样的特点呢

a2dissite /etc/apache2/sites-available/www.example.com.conf




