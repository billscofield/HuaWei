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
