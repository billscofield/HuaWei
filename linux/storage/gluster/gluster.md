## 1. 概述入门

属于文件存储，速度较慢

GNU Cluster File System

redhat 于 2011 年收购 Gluster 公司，并将 GlusterFS 作为其大数据解决方案的一部分

分布式文件系统(Distributed File System)

    服务器指引其数据 分散的 存储到多个存储节点上, 以提供更快的速度、更大的容量
    及更好的冗余特性。

    1. 软件定义
    2. 无中心架构
    3. 全局统一命名空间
        通过分布式文件系统将物理分散的存储资源虚拟化成统一的存储池
        将 文件系统，卷管理，RAID 统一管理
    4. 高性能
    5. 高可用HA, 负载均衡LB
    6. 堆栈式用户空间设计
    7. Scale-Out 横向扩展(容量、性能)
    8. 高速网络通信
    9. 数据自动恢复


### 1. 弹性哈希算法

1. 无集中式元数据服务
    消除性能瓶颈
    提高可靠性
    扩展属性(Extended Attr)

+-----------+-----------------------+
|   Brick   |   Hash range          |
+-----------+-----------------------+
|   brick1  |   00000000 - 3fffffff |
+-----------+-----------------------+
|   brick2  |   4fffffff - 7fffffff |
+-----------+-----------------------+
|   brick3  |   8fffffff - bfffffff |
+-----------+-----------------------+
|   brick4  |   CFFFFFFF - FFFFFFFF |
+-----------+-----------------------+

1. 采用 Hash 算法定位文件
    基于路径和文件名
    一致性哈希 DHT

1. 弹性卷管理
    文件存储在逻辑卷中
    逻辑卷从物理存储池中划分
    逻辑可以在线进行扩容和缩减

## 2. 基本原理

设计目标
    1. Elasticity
        Flexibility adapt to growth/reduction
        add, delete volumes & users
    2. Scale linearly
    3. Eliminate metadata
    4. Simplicity


Brick
    

Translator

Volume

Node/Peer
    Server running the gluster daemon and sharing volumes

## 3. 对比


## 4. 应用场景





## 实践

    ```epel
    yum install -y epel-release

    sed -e 's!^metalink=!#metalink=!g' \
        -e 's!^#baseurl=!baseurl=!g' \
        -e 's!//download\.fedoraproject\.org/pub!//mirrors.tuna.tsinghua.edu.cn!g' \
        -e 's!http://mirrors\.tuna!https://mirrors.tuna!g' \
        -i /etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel-testing.repo
    ```

    ```
    [centos7-gluster.repo]
    name=CentOS-$releasever - Gluster 6
    baseurl=https://mirror.tuna.tsinghua.edu.cn/centos/7/storage/x86_64/gluster-9
    gpgcheck=0
    enabled=1
    ```

    yum install glusterfs-server



    gluster peer status

    gluster peer probe storage1
    gluster peer probe storage2
    gluster peer probe storage3
    gluster peer probe storage4

    gluster peer detach storage1
