参阅官方文档
    https://jumpserver.readthedocs.io/zh/master/setup_by_ubuntu18.html

首先安装pyenv这个工具

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
apt-get install -y libsasl2-dev python-dev libldap2-dev libssl-dev
apt-get install -y libkrb5-dev



apt install -y mariadb-server
apt install libmariadb-dev-compat libmariadb-dev


apt-get -y install redis-server


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
apt-get install -y $(cat deb_requirements.txt)

$ pip install -r requirements.txt
确保已经载入 py3 虚拟环境, 中间如果遇到报错一般是依赖包没装全, 可以通过 搜索引擎 解决


apt install redis-server

apt install -y mysql-server
    ```
    create database jumpserver default charset 'utf8';　　//创建一个数据库jumpserver
    grant all on jumpserver.* to 'jumpserver'@'127.0.0.1' identified by '密码';　//创建一个用户jumpserver，把jumpserver数据库授权给他
    ```



## 修改 Jumpserver 配置文件

```
cd /opt/jumpserver
$ cp config_example.yml config.yml
cd /opt/jumpserver
$ cp config_example.yml config.yml

$ SECRET_KEY=`cat /dev/urandom | tr -dc A-Za-z0-9 | head -c 50`  # 生成随机SECRET_KEY
$ echo "SECRET_KEY=$SECRET_KEY" >> ~/.bashrc
$ BOOTSTRAP_TOKEN=`cat /dev/urandom | tr -dc A-Za-z0-9 | head -c 16`  # 生成随机BOOTSTRAP_TOKEN
$ echo "BOOTSTRAP_TOKEN=$BOOTSTRAP_TOKEN" >> ~/.bashrc

$ sed -i "s/SECRET_KEY:/SECRET_KEY: $SECRET_KEY/g" /opt/jumpserver/config.yml
$ sed -i "s/BOOTSTRAP_TOKEN:/BOOTSTRAP_TOKEN: $BOOTSTRAP_TOKEN/g" /opt/jumpserver/config.yml
$ sed -i "s/# DEBUG: true/DEBUG: false/g" /opt/jumpserver/config.yml
$ sed -i "s/# LOG_LEVEL: DEBUG/LOG_LEVEL: ERROR/g" /opt/jumpserver/config.yml
$ sed -i "s/# SESSION_EXPIRE_AT_BROWSER_CLOSE: false/SESSION_EXPIRE_AT_BROWSER_CLOSE: true/g" /opt/jumpserver/config.yml
$ sed -i "s/DB_PASSWORD: /DB_PASSWORD: $DB_PASSWORD/g" /opt/jumpserver/config.yml

$ echo -e "\033[31m 你的SECRET_KEY是 $SECRET_KEY \033[0m"
$ echo -e "\033[31m 你的BOOTSTRAP_TOKEN是 $BOOTSTRAP_TOKEN \033[0m"

$ vim config.yml  # 确认内容有没有错误

注意写 数据库 密码
```


## 运行 Jumpserver

```
$ cd /opt/jumpserver
$ ./jms start -d  # 后台运行使用 -d 参数./jms start -d

# 新版本更新了运行脚本, 使用方式./jms start|stop|status all  后台运行请添加 -d 参数

$ wget -O /lib/systemd/system/jms.service https://demo.jumpserver.org/download/shell/ubuntu/jms.service
$ chmod 755 /lib/systemd/system/jms.service
$ systemctl enable jms  # 配置自启

```



## 安装 SSH Server 和 WebSocket Server: koko

### 安装 Docker

安装通过 HTTPS 添加新存储库所需的依赖项：
    apt install apt-transport-https ca-certificates curl software-properties-common gnupg2

使用以下 curl 命令导入存储库的 GPG 密钥：

    root@debiantest1:~# curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

键入以下内容，将 Docker APT 存储库添加到系统的软件存储库列表中：

    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

确保您要从Docker repo而不是默认的Debian repo安装：

    apt-cache policy docker-ce

apt install docker-ce

curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://f1361db2.m.daocloud.io
$ systemctl restart docker.service
$ Server_IP=`ip addr | grep 'state UP' -A2 | grep inet | egrep -v '(127.0.0.1|inet6|docker)' | awk '{print $2}' | tr -d "addr:" | head -n 1 | cut -d / -f1`
$ echo -e "\033[31m 你的服务器IP是 $Server_IP \033[0m"


### 部署 koko

2019年9月30日，Jumpserver堡垒机发布V1.5.3版本。自 V1.5.3 版本起，Koko（即基于Go语言开发的SSH客户端）将担任Coco（即基于Python语言开发的SSH客户端）在Jumpserver项目中的角色，后续版本不会再对Coco进行维护。 

docker run --name jms_koko -d -p 2222:2222 -p 127.0.0.1:5000:5000 -e CORE_HOST=http://$Server_IP:8080 -e BOOTSTRAP_TOKEN=$BOOTSTRAP_TOKEN --restart=always wojiushixiaobai/jms_koko:1.5.6 --registry-mirror=https://docker.mirrors.ustc.edu.cn

    这个2222端口好像没有起作用啊???

## 安装 RDP Server 和 VNC Server: Guacamole

docker run --name jms_guacamole -d -p 127.0.0.1:8081:8080 -e JUMPSERVER_SERVER=http://$Server_IP:8080 -e BOOTSTRAP_TOKEN=$BOOTSTRAP_TOKEN --restart=always wojiushixiaobai/jms_guacamole:1.5.6


## 安装 Web Terminal 前端: Luna

### 部署 Luna

$ cd /opt/
$ wget https://github.com/jumpserver/luna/releases/download/1.5.6/luna.tar.gz

# 如果网络有问题导致下载无法完成可以使用下面地址
$ wget https://demo.jumpserver.org/download/luna/1.5.6/luna.tar.gz

$ tar xf luna.tar.gz
$ chown -R root:root luna


## 配置 Nginx 整合各组件

### 安装 Nginx

$ apt-get -y install curl gnupg2 ca-certificates lsb-release
$ add-apt-repository "deb http://nginx.org/packages/debian/ $(lsb_release -cs) nginx"
$ curl -fsSL http://nginx.org/keys/nginx_signing.key | sudo apt-key add -
$ apt-get update
$ apt-get -y install nginx

### 准备配置文件 /etc/nginx/conf.d/jumpserver.conf

mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.bak

vim /etc/nginx/conf.d/jumpserver.conf

server {
    listen 80;
    server_name _;

    client_max_body_size 100m;  # 录像及文件上传大小限制

    location /luna/ {
        try_files $uri / /index.html;
        alias /opt/luna/;
    }

    location /media/ {
        add_header Content-Encoding gzip;
        root /opt/jumpserver/data/;
    }

    location /static/ {
        root /opt/jumpserver/data/;
    }

    location /koko/ {
        proxy_pass       http://localhost:5000;
        proxy_buffering off;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        access_log off;
    }

    location /guacamole/ {
        proxy_pass       http://localhost:8081/;
        proxy_buffering off;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection $http_connection;
        access_log off;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }

    location /ws/ {
        proxy_pass http://localhost:8070;
        proxy_http_version 1.1;
        proxy_buffering off;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        access_log off;
    }

    location / {
        proxy_pass http://localhost:8080;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }

}


### 重启 Nginx

$ nginx -t  # 如果没有报错请继续
$ systemctl restart nginx


### 开始使用 Jumpserver

python run_server.py all

服务全部启动后, 访问 http://192.168.3.106

默认账号: admin 密码: admin

到Jumpserver 会话管理-终端管理 检查 koko Guacamole 等应用的注册

### 测试连接

如果登录客户端是 macOS 或 Linux, 登录语法如下
$ ssh -p2222 admin@192.168.244.144
$ sftp -P2222 admin@192.168.244.144
密码: admin

如果登录客户端是 Windows, Xshell Terminal 登录语法如下
$ ssh admin@192.168.244.144 2222
$ sftp admin@192.168.244.144 2222
密码: admin
如果能登陆代表部署成功

# sftp默认上传的位置在资产的 /tmp 目录下
# windows拖拽上传的位置在资产的 Guacamole RDP上的 G 目录下



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


