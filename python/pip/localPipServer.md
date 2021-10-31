

## Debian/Ubuntu

https://segmentfault.com/a/1190000021290941

1. 安装pip工具

    root@ubuntu:/#apt-get install python-pip

1. 安装pip2py工具

    root@ubuntu:/1. pip install pip2pi

1. 创建保存pip源的目录

    root@ubuntu:/1. mkdir /export/pypi

1. 将相关pip源文件放置到目录下

    root@ubuntu:/1.  cd /export/pypi

1. 同步pip源到本地

    批量下载
    root@ubuntu:/export/pypi1. pip2tgz path -r requirements.txt

    单个下载
    root@ubuntu:/export/pypi1.  pip2tgz path package==1.0

1. 重建pip索引

    root@ubuntu:/export/pypi1.  cd ..
    root@ubuntu:/export1.  dir2pi pypi/

1. 安装apache

    root@ubuntu:/1. apt-get install apache2

1. 将pypi挂到web server下

    root@ubuntu:/export1.  cd /var/www/html/
    root@ubuntu:/var/www/html1.  ln -s /export/pypi pypi

1. 启动apache2

    root@ubuntu:/var/www/html1.  /etc/init.d/apache2 start

ok，搭建完成


## 设置本地pip配置文件，使用本地源

可以通入如下配置使用本地pip源

1. 配置easy_install使用本地pip源，如果没有文件/root/.pydistutils.cfg，则创建。

```
echo "[easy_install]" > /root/.pydistutils.cfg
echo "index-url = http://本地ip地址/pypi/simple" >> /root/.pydistutils.cfgeasy_install pip

```

1. 配置pip使用pip本地源

```
mkdir /root/.pip
echo "[global]" > /root/.pip/pip.conf
echo "index-url = http://本地ip地址/pypi/simple" >> /root/.pip/pip.conf
echo "trusted-host = 本地ip地址" >> /root/.pip/pip.conf

```


## 判断是否设置成功

pip install docker-py==1.6.0

 从上面可以看出，没有设置成功的话，其访问的路径是：

https://files.pythonhosted.org/packages


设置成功的话，其访问的路径为：

```
Looking in indexes: http://172.17.0.2/pypi/simple
Collecting docker-py==1.6.0
 Downloading http://172.17.0.2/pypi/simple/docker-py/docker-py-1.6.0.tar.gz (63kB)
Collecting requests>=2.5.2 (from docker-py==1.6.0)
 Downloading http://172.17.0.2/pypi/simple/requests/requests-2.20.1-py2.py3-none-any.whl (57kB)
Collecting six>=1.4.0 (from docker-py==1.6.0)
 Downloading http://172.17.0.2/pypi/simple/six/six-1.11.0-py2.py3-none-any.whl

```

会有如下显示：

    Looking in indexes: http://172.17.0.2/pypi/simple

