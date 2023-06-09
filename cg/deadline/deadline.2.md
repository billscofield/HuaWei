# Deadline

[官网](https://www.awsthinkbox.com/)

Deadline-10.1.23.6-linux-installers.tar
    Deadline-10.1.23.6-linux-installers.tar
        // 网络管理工具
        AWSPortalLink-1.1.23.1-linux-x64-installer.run

        // Deadline 客户端
        DeadlineClient-10.1.23.6-linux-x64-installer.run

        // Deadline 服务端
        DeadlineRepository-10.1.23.6-linux-x64-installer.run


## 图形化安装

### 1. 服务端

// 服务端
双击 DeadlineRepository-10.1.23.6-linux-x64-installer.run

// 安装路径，要安装到共享文件夹
默认：/opt/Thinkbox/DeadlineRepository10/
图形化手动选择的时候只要指定到 Thinkbox 即可，还会自动创建 DeadlineRepository10

// Database
    1) mongodb:使用 Mongodb
        ulimit -n to 200000
        /etc/init.d/Deadline10db 开机启动

        Download Mongodb or use already downloaded tar.gz package
        手动下载安装
        https://docs.thinkboxsoftware.com/products/deadline/10.1/1_User%20Manual/manual/install-db-repo-manual-db-install.html#install-manual-db-ref-label

        mongodb 安装位置, 默认 /opt/Thinkbox/DeadlineDatabase10, 也要放到共享文件夹

        Mongodb hostname/ip:  计算机名;ip地址   计算机名也可以用变量 @localhost 
        mongodb port: 27100

        Security(可以不勾选)
            Certificate Directory: /opt/Thinkbox/DeadlineDatabase10/certs/
            Certificate password:

            勾选的化，只有客户端 指定 Deadline10Client.pfx 文件，
            并且可以设置密码，

        Skip the Secrets Management installation



    2) DocumentDB: 使用现有的Mongodb数据库


### 2. 客户端

双击 DeadlineClient-10.1.23.6-linux-x64-installer.run

默认安装路径: /opt/Thinkbox/Deadline10

Installation Type:
    client

Direct Connection

Repository Directory: (服务端的路径) /opt/Thinkbox/DeadlineRepository10/

Database TLS Certificate: /opt/Thinkbox/DeadlineDatabase10/certs/Deadline10Client.pfx

Launch Worker When Launcher starts

install Launcher As A Daemon 设置自启动的用户, 默认计算机名

启动: deadline worker, 设置开机启动

launch monitor


第二台电脑安装客户端


### 3. deadline 卸载

服务端
    DeadlineRepository10/uninstall
    会询问是否卸载数据库

客户端

