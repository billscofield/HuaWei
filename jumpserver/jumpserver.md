首先安装pyenv这个工具：

```
git clone git://github.com/yyuu/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
exec $SHELL -l
```
　　

可以通过下面这个命令查看可以安装的python的版本：

pyenv install --list

## 在安装python之前，要先安装python的一些依赖包：

apt-get install libc6-dev gcc
apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm

然后就可以安装python了：

pyenv install 3.6.5 -v

安装完以后需要更新一下数据库：

pyenv rehash

查看当前安装的python的版本：
pyenv versions
```
* system (set by /home/seisman/.pyenv/version)
3.6.5
```

设置全局的python版本：
pyenv global 3.6.5
pyenv versions
```
system
* 3.6.5 (set by /home/seisman/.pyenv/version)
```
现在python的版本变成3.6.5了，可以使用pyenv local或pyenv shell临时改变python的版本。


cd /opt
$ git clone --depth=1 https://github.com/jumpserver/jumpserver.git

cd /opt/jumpserver/requirements
Ubuntu: apt-get install -y $(cat deb_requirements.txt)

$ pip install -r requirements.txt
确保已经载入 py3 虚拟环境, 中间如果遇到报错一般是依赖包没装全, 可以通过 搜索引擎 解决


apt install redis-server

apt install -y mysql-server
    ```
    create database jumpserver default charset 'utf8';　　//创建一个数据库jumpserver
    grant all on jumpserver.* to 'jumpserver'@'127.0.0.1' identified by '密码';　//创建一个用户jumpserver，把jumpserver数据库授权给他
    ```


cd /opt/jumpserver
$ cp config_example.yml config.yml




## 问题

1. 启动tomcat服务报错

```
Cannot find bin/catalina.sh 
The file is absent or does not have executepermission 
This file is needed to run thisprogram 

原因： 没有权限
解决 ： chmod 777 *.sh
```


1. jumpserver.conf nginx配置文件
    https://docs.jumpserver.org/zh/docs/faq_install.html
    参考上面的链接中的地址，不过没有写 server_name, 自己补充上去就可以



1. 启动 jumpserver 后, 访问 8080 端口页面显示不正常
这是因为你在 config.yml 里面设置了 DEBUG: false
跟着教程继续操作, 后面搭建 nginx 代理即可正常访问


1. 不能创建文件夹，文件，上传文件的问题??? 文件管理

1. 如何查看 jumpserver 的版本???







# jumpserver

https://github.com/jumpserver/jumpserver

可以先看看 wiki


http://study.magedu.com/course/76





## 重置密码

管理密码忘记了或者重置管理员密码
$ source /opt/py3/bin/activate
$ cd /opt/jumpserver/apps
$ python manage.py changepassword  <user_name>

新建超级用户的命令如下命令
$ python manage.py createsuperuser --username=user --email=user@domain.com


