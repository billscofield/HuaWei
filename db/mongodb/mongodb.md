# How to install MongoDB on Debian 11

非关系型数据库


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



## (mongosh](https://www.mongodb.com/try/download/shell)

macos 需要单独进行安装客户端

mongos 15 is the interface between your application and a sharded cluster. As
the error states, you need to pass in the --configdb parameter with your list
of config servers.

Are you instead meaning to run mognosh which is the new MongoDB shell command
line interface? If so, have you downloaded 330 the tool yet? mongosh is not
included with the server install.


export PATH=/usr/local/mongodb/bin:$PATH
数据存放路径：
    sudo mkdir -p /usr/local/var/mongodb
日志文件路径：
    sudo mkdir -p /usr/local/var/log/mongodb
接下来要确保当前用户对以上两个目录有读写的权限：
    sudo chown runoob /usr/local/var/mongodb
    sudo chown runoob /usr/local/var/log/mongodb

使用以下命令在后台启动 mongodb：
    mongod --dbpath /usr/local/var/mongodb --logpath /usr/local/var/log/mongodb/mongo.log --fork
    --dbpath 设置数据存放目录
    --logpath 设置日志存放目录
    --fork 在后台运行

如果不想在后端运行，而是在控制台上查看运行过程可以直接设置配置文件启动：
    mongod --config /usr/local/etc/mongod.conf

查看 mongod 服务是否启动：
    ps aux | grep mongod

mongodb使用了27017端口，因此在浏览器中打开http://localhost:27017 出现如下提示即说明连接成功了。
    It looks like you are trying to access MongoDB over HTTP on the native driver port.


cannot be opened because the developer cannot be verified的解决办法
    xattr -d com.apple.quarantine 被拦截的执行文件



## 使用

### 命令行

1. 显示所有数据库(并不是所有,空的不显示)
    show dbs

    admin
    config
    local

2. 当前数据库
    db

3. 切换/创建数据库
    use 库名            // 区分大小写

4. 集合/数据表
    查看当前库中有哪些集合
    
    show collections

5. 数据
    
    1. 添加数据, 如果该集合不存在则自动创建

    ```
    db.集合s.insert({
        name:'张三',
        age:18,
        gender:'boy'
    })

    自动创建一个 _id 字段
    ```

    show collections

    2. 查看某个集合中的所有数据

        db.集合.find()
        db.集合.find().pretty()

### 图形化



### node

npm install mongoose --save




usersModel.create({
    username:'abc',
    password:'123'
})


usersModel.deleteOne({
    username:'zhangsan'
})

usersModel.deleteMany({
    username:'zhangsan'
})

usersModel.updateOne({
    username:'lisi',password:'123'
},

{
    username:'lisi',password:'234'
})


上述方法都是异步的，且这些方法的返回值都是 Promise 对象，因此需要通过  await  和 async 




## 三层框架

MVC 架构

后端分为 3 层


前端    ->    后端服务器    ->      数据库

前端    ->        表现层 ->  服务层  -> 持久层      -> 数据库

    表现层: 
    服务层: 业务逻辑
    持久层: 数据库



1. routers/
    require('./dao/database.js')

2. service/
    usersService.js

    暴露给一层, 结果返回给自己
    暴露给三层, 结果返回给自己

3. dao/
    database.js
    models/
        usersModel.js
    usersDao.js
        暴露给

