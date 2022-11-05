# How to install MongoDB on Debian 11

## install

1. Before adding the MongoDB repository to the system, it is necessary to
   install a package called gnupg2.

` sudo apt install gnupg2

2. After that, add the GPG key of the repository as follows

` wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -

3. Now add the MongoDB repository to your system by running
    
    Enable the MongoDB repository by creating a file
    /etc/apt/sources.list.d/mongodb-org-5.0.list and as the “bullseye” version
    of MongoDB is still not released so we use the “buster” version of MongoDB.


` echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/5.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list

    deb https://mirrors.tuna.tsinghua.edu.cn/mongodb/apt/debian bullseye/mongodb-org/5.0 main

4. Refresh APT to accept the new changes

` sudo apt update

5. Next, install MongoDB on Debian 11 by running

` sudo apt install mongodb-org


## centos7

安装文件列表

mongodb-org-server-5.0.3-1.el7.x86_64.rpm
mongodb-org-mongos-5.0.3-1.el7.x86_64.rpm
mongodb-org-shell-5.0.3-1.el7.x86_64.rpm
mongodb-database-tools-rhel70-x86_64-100.5.0.rpm

顺序安装



## 

访问数据库（默认无密码）

    mongo

设置登录账号

```
use admin       // admin 是数据库
db.createUser({user:"Admin", pwd:"Db0AdMiN1!", roles:[{role:"dbAdminAnyDatabase", db:"admin"}]})
```

/etc/mongod.conf
    security:
    authorization: enabled

systemctl restart mongod


mongo -u madmin -p



## MongoDB启动失败

/tmp/mongodb-27017.sock，若存在，删除后重启mongodb。这个主要是因为不正确关闭
mongodb导致的，正常关闭时这个文件会删除。








## 图形化工具

dbeaver

navicat

快到期之前，可以把之前连接的数据库通过 文件->导出连接，备份之前的数据库连接即可，下次激活后可以直接导入连接。Navicat Premium 16的试用期只有14天，执行下面两个命令，即可无限使用。

1. 关闭Navicat程序
2. 删除如下2个文件：

    rm -rf ~/.config/navicat
    rm -rf ~/.config/dconf/user

    lsof | grep navicat | grep \\.config  #用于列出当前系统打开navicat的工具

再次重新启动navicat即可。
