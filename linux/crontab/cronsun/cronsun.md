# cronsun

- [cronsun](https://github.com/shunfei/cronsun/releases)
- [cronsun wiki](https://github.com/shunfei/cronsun/wiki)
- [etcd](https://github.com/etcd-io/etcd/releases/tag/v3.3.13)

## 1. cronsun 简介

cronsun 是一个分布式任务系统，单个结点和 linux 机器上的 crontab 近似。支持界面
管理机器上的任务，支持任务失败邮件提醒，安装简单，使用方便，是替换 crontab 一个
不错的选择。

cronsun 是为了解决多台 linix 机器上crontab 任务管理不方便的问题，同时提供任务高
可用的支持（当某个节点死机的时候可以自动调度到正常的节点执行）。

[github](https://github.com/shunfei/cronsun)

## 2. cronsun特性：

- 方便对多台服务器上面的定时任务进行集中式管理
- 任务调度时间粒度支持到秒级别
- 任务失败自动重试
- 任务可靠性保障（从N个节点里面挑一个可用节点来执行任务）
- 简洁易用的管理后台，支持多语言
- 任务日志查看
- 任务失败邮件告警（也支持自定义http告警接口）
- 用户验证与授权

## 3. 安装

1. 下载 cronsun

    [下载地址](https://github.com/shunfei/cronsun/releases/)

    https://github.com/shunfei/cronsun/releases/download/v0.3.5/cronsun-v0.3.5-linux-amd64.zip

    熟悉go的同学也可以使用源码安装。

    解压文件

        - cronnode: 负责调度和执行任务的
        - cronweb: 负责管理任务、查看任务执行日志的
        - conf: db/web/sercuriry等配置文件

2. 安装 etcd(主要用于分布式配置共享和服务发现)

    源码安装：https://github.com/etcd-io/etcd/releases/download/v3.3.10/etcd-v3.3.10-linux-amd64.tar.gz

    default.etcd:   数据存储目录
    etcd:  etcd二进制启动文件
    etcdctl:  可以操作etcd的工具

3. 安装mongodb

4. 启动服务

    1. etcd

        进入etcd安装的目录：  ./etcd 

        默认侦听的客户端地址为： http://localhost:2379，  这个可以修改配置文件

        ./etcd --listen-client-urls 'http://0.0.0.0:2379' --advertise-client-urls http://0.0.0.0:2379

    2. 动mongodb：

        进入安装目录： ./mongod

    3. 启动cronsun节点(slave servers)：

        cronsun server 不需要运行这个

        在启动之前，需要修改conf下的db.conf

        mongodb的连接地址：

        ```
        {
            "Hosts": [
                "<cronsun server ip>:27017"
            ],
        }
        ```

        etcd.conf 配置

        etcd服务连接的地址

        ```
        {
            "Endpoints":[
                "http://<cronsun server ip>:2379"
            ],
        }
        ```

        进入安装目录： ./cronnode -conf conf/base.json

    4. 启动cronweb（管理脚本的界面）：

        进入安装目录：./cronweb -conf conf/base.json

    5. 全部服务启动完毕，打开网址： 主机:7079/ui/#/node， 本文为： 192.168.10.116:7079/ui/#/node

        默认登录账号密码： admin@admin.com /  admin

    6. 浏览器打开 serverip:7079

        此时可以看到 Total nodes 已经有了

## 备份与恢复cronsun的任务数据

cronsun提供的csctl工具可以备份和恢复cronsun的任务数据。

1. 备份数据

    请将 --conf 修改为你自己保存的 base.json 文件的路径
    --file 为备份文件路径，会自动加上 .zip 后缀，这里不需要写后缀

    csctl backup --conf={/path/to/base.json} --dir=./ --file=cronsun_data

2. 恢复数据

    请将 --conf 修改为你自己保存的 base.json 文件的路径
    --file 为备份文件路径

    csctl restore --conf={/path/to/base.json} --file=./cronsun_data.zip



## etcd 数据库问题

1. 查看 etcd的 使用情况

    export ETCDCTL_API=3
    etcdctl endpoint status --write-out table

    报错:Error: dial tcp 127.0.0.1:2379: getsockopt: connection refused

2. 获取历史版本号

    etcdctl endpoint status --write-out="json" | egrep -o '"revision":[0-9]*' | egrep -o '[0-9].*'

    127

3. 压缩旧版本

    etcdctl compact 127

4. 整理磁盘碎片 

    etcdctl defrag

5. 再次查看etcd db大小

    ./etcdctl endpoint status --write-out table

6. 修改etcd 配置调整大小

    --quota-backend-bytes '0'
        raise alarms when backend size exceeds the given quota (0 defaults to low space quota).

    vim /lib/systemd/system/etcd.service 

        ExecStart=/bin/bash -c "GOMAXPROCS=$(nproc) /usr/bin/etcd --quota-backend-bytes=10240000000"

        更好地利用服务器的多核处理能力，我们可以通过设置GOMAXPROCS来实现更高效的并发编程
        nproc - print the number of processing units available


    systemctl daemon-reload

## 数据库

mongo

use cronssun

db.stats();
