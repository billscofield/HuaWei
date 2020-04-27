
##

DAS:直连式存储
    Direct Attached Storage    
    主板上插硬盘而已

NAS:网络附加存储
    ftp,nfs,samba等
    通过网络共享的是目录

SAN:存储区域网络
    FC, iscsi
    通过网络，共享的是块设备(/dev/sda等)

分布式存储
    1. glusterfs
    1. moosefs
    1. hdfs
    1. fastdfs
    1. ceph
    


## ceph

教程
    https://ke.qq.com/webcourse/index.html#cid=450420&term_id=100538813&taid=4629442169593716&vid=5285890787841595884

软件定义的，统一存储解决方案的开源项目
    SDS 软件定义存储
    TCO 总体成本

统一存储: 同时提供对象存储、存储 和文件存储

分布式、可扩展、高性能、不存在单点故障 的存储系统


### 版本

Hammer      V0.94(LTS)  2015/4
Jewel       V10(LTS)    2015/11(发型日期)
Luminous    V12(LTS)    2017/8(发行日期)


摆脱专属硬件

轻松扩展到PB级别

EMC 全球顶级的硬件存储厂商
    专属硬件，只能用EMC的硬盘


加州大学 Santa Cruz 分校的 Sage Weil 在2003年专为博士论文设计的新一代自由软件分布式文件系统

2003-2007, 劳伦斯利弗莫尔国家实验室 赞助ceph初步研究工作

2006， LGPL

2007， ceph逐渐成熟，等待被孵化

2007-2011, Dreamhost(洛杉矶做虚拟主机和域名注册的公司) 培养ceph，ceph 具备了雏形，

2010年3月后的linux内核中，嵌入了ceph

2012年 Sage Weil 成立 Inktank,主要做ceph

2014.4 RedHat 收购了Inktank


LTS:长期支持版本

版本是安装a-z的顺序来的


## ceph现状

1. 作为云存储解决方案
1. 作为软件定义的解决方案
1. 作为统一存储解决方案
    对象
    块  (/dev/sda1)
    文件系统 (目录)


## 相关概念

    ```
                            file
        object1    object2    object3   ...

            PG1                             PG2                             PG3
    OSD Daemon1  OSD Daemon2         OSD Daemon3 osd daemon4        osd daemon5 osd daemon6
    Disk1        Disk2               Disk3       Disk4              Disk5       Disk6

    ```

一个 osd daemon 管理一个硬盘
数个硬盘组合，容量大了，速度也快了
Object Storage Daemon

万一数据坏掉呢？
    解决方案1
        备份，3个盘当一个,90T相当于30T
        将3个盘设为一个组，叫 PG, 逻辑盘？




MDS:Ceph metadata Server
    仅为Ceph FS 文件系统存储元数据

RADOS:
Librados:

RBD:提供持久块存储，瘦模式

RGW:提供对象存储服务



acting set:一个列表，存的是3个OSD的编号，默认第一个是组长

librdb 把文件切成一个个的块 object，每个块最大4MB, 分别存到PG
1个object只能存在于一个PG
多个object能放到一个PG上


PG 对 osd daemon:   1对多
PG 对 object:       1对多
osd daemon 对 硬盘: 1对1

一个osd可以对应多个PG, PG 和 osd： 多对多的关系

osd 越多，性能越高


osd daemon 每2s 向monitor汇报, 


三类集群
1. disk
2. osd daemon
3. monitor daemon(奇数个,为了选举)
    假如3个
    通过维护 
        cluster map
            monitor map
            osd map
            pg map
            crush map


        monitor1    monitor2    monitor3
        leader      和leader同步    和leader同步    
        paxos算法

    osd节点
        一个机器有多个硬盘，多个osd daemon


集群网络要是万兆网络



osd daemon功能
    1. 存储和复制
    1. 监控自己和组内其他osd daemon的状态


北向网络/集群网络:客户端进行访问
复制网络:osd daemon 之间进行数据复制



ceph osd pool create volumes 128(PG 个数)   可以弄多个pool

从中选择几个pg 称为 image(就是逻辑硬盘, 客户端用的盘)  动态扩容



客户端知道的是 pool id, 和 object id(文件分几个部分)



## 集群部署

1. 手动编译安装

1. 借助 ceph-deploy, saltstack等工具部署，0.8版本之后ceph推荐使用 ceph-deploy进行部署

硬件：
每个节点2个网卡，一内一外
节点准备
3个节点，配置OSD,1个monitors
每个节点运行2个ceph daemon(OSD和mon)
每OSD节点1个SSD日志盘，1个SATA容量1TB的数据盘

关闭iptables

设置主机名(/etc/hostname)并修改hosts文件
/etc/hosts
192.168.8.18 node0
192.168.8.19 node1
192.168.8.20 node2


设置时间同步
apt install ntp
/etc/ntp.conf
    添加一个内网的主机
    server 192.168.1.1      (admin的ip就可以)

添加官方证书
wget -q -O-'https://ceph.com/git/?p=ceph.git;a=blob_plain;f=keys/release.asc' | sudoapt-key add -

添加Ceph软件包源，用稳定版Ceph（如 cuttlefish 、 dumpling 、 emperor 、 firefly 等等）替换掉 {ceph-stable-release} 。例如：
echo debhttp://ceph.com/debian-{ceph-stable-release}/ $(lsb_release -sc) main | sudotee /etc/apt/sources.list.d/ceph.list

更新你的仓库，并安装 ceph-deploy ：
sudo apt-get update && sudo apt-getinstall ceph-deploy


创建 Ceph用户，并赋sudo权限，然后切换到cephuser，

sudo useradd -d /home/cephuser -m cephuser

sudo passwd cephuser

echo "cephuser ALL = (root)NOPASSWD:ALL" | sudotee/etc/sudoers.d/cephuser
sudo chmod 0440 /etc/sudoers.d/cephuser

配置无密码 SSH登录
ssh-keygen
把公钥拷贝到各 Ceph 节点
    ssh-copy-id cephuser@ceph-node3
    ssh-copy-id cephuser@ceph-node2
    ssh-copy-id cephuser@ceph-node3
    (/root/.ssh/authorized_keys)

清除旧的ceph相关的文件
ceph-deploy purgedata admin node1 node2 node3
ceph-deploy forgetkeys


admin节点（这里是node0) 上建立一个ceph集群目录:
mkdir /ceph ^^ cd /ceph

创建monitor
ceph-deploy new node0 node1 node2   # 3个monitor
执行之后生成ceph.con ceph.log ceph.on.keyring

调整ceph的默认参数






## 安装

教程
    https://edu.51cto.com/course/22554.html(付费课)

3台 ubuntu18.04.4 server

ubuntu18.04设置静态ip方法
    vi /etc/netplan/xxx.yaml
    netplan apply

修改hostname 
    vi /etc/hostname
    vi /etc/hosts
        192.168.200.111   ubuntu18-ceph-111
        192.168.200.112   ubuntu18-ceph-112
        192.168.200.113   ubuntu18-ceph-113

同时安装
    apt install ceph-deploy
    是所有机器都要安安装吗？应该不是, admin 安装即可

免密登录
    ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
        -P passphrase
            Provides the (old) passphrase.

        -p  Requests changing the passphrase of a private key
            file instead of creating a new private key.  The
            program will prompt for the file containing the pri‐
            vate key, for the old passphrase, and twice for the
            new passphrase.

        -f filename
            Specifies the filename of the key file.

    ssh-copy-id debian-ceph-001
        把本地公钥复制到远程主机,并获取远程主机的公钥;?需要一会儿输入远程主机密码
        会在本机的 ~/.ssh/ 下生成 known_hosts 文件
        会在远程主机生成 authorized_keys 文件

    ssh-copy-id debian-ceph-002
    ssh-copy-id debian-ceph-003


admin 节点上建立一个 ceph 集群目录
    mkdir /ceph && cd /ceph

    方式一：
        wget -q -O- 'https://download.ceph.com/keys/release.asc' | sudo apt-key add - 
        echo deb https://download.ceph.com/debian-nautilus/ $(lsb_release -sc) main | sudo tee /etc/apt/sources.list.d/ceph.list
            不过这个很慢，使用tsinghua源

    方式二：使用清华源
        这个好像没有启作用，用的tsinghua.list中的版本 luminous

        ceph-deploy install 时提示需要在osd上安装python2
            切换到 osd 主机，apt install python-minimal

        ceph版本配置

        export CEPH_DEPLOY_REPO_URL=https://mirror.tuna.tsinghua.edu.cn/ceph/debian-nautilus/
            这里使用网易源，安装ceph-mimic版本，如果需要更换版本，则配置为luminous版本

        export CEPH_DEPLOY_GPG_URL=https://mirror.tuna.tsinghua.edu.cn/ceph/keys/release.asc

        更换镜像源为Tsinghua源，执行apt-get update

        ceph-deploy install node1(主机名)

    方式三：???

        ceph-deploy install --release=?

创建 monitor

    cd /ecph/
    ceph-deploy new ubuntu18-ceph-111   或者 ceph-deploy new $(cat /etc/hostname)
        生成3个文件
        ceph.conf  ceph-deploy-ceph.log  ceph.mon.keyring

    修改 ceph.conf



每个节点安装 ceph
    每个节点安装 apt install python-minimal

    ceph-deploy install ubuntu18-ceph-111 ubuntu18-ceph-112 ubuntu18-ceph-113


    也可以一个一个安装
        ceph-deploy install ubuntu18-ceph-111
        ceph-deploy install ubuntu18-ceph-112
        ceph-deploy install ubuntu18-ceph-113

    常见错误:
        安装了清华源
        ceph-deploy install 主机名

        [ceph_deploy][ERROR ] RuntimeError: Failed to execute command: env DEBIAN_FRONTEND=noninteractive DEBIAN_PRIORITY=critical apt-get --assume-yes -q update
        这个[ERROR ]是因为[WARNIN] E: The repository 'http://download.ceph.com/debian-{ceph-stable-release} bionic Release' does not have a Release file.造成的。
    
    
扩展 monitor
    ceph-deploy mon add ubuntu18-ceph-112 --address 192.168.200.112
    ceph-deploy mon add ubuntu18-ceph-113 --address 192.168.200.113

    ceph -h | grep quorum
    
    ceph quorum_status    或者 ceph quorum_status --format=json_pretty

    admin 的 ceph.conf 怎么到了 /etc/ceph/ 下?
    在这个目录 运行 
        ceph-deploy --overwrite-conf config push ubuntu18-ceph-113 ubuntu18-ceph-113

    添加 mon
        ceph-deploy mon add ubuntu18-ceph-112 --address 192.168.200.112
        ceph-deploy mon add ubuntu18-ceph-113 --address 192.168.200.113

收集秘钥
    在admin上运行
    ceph-deploy mon create-initial

        -rw-------  1 root root     71 Apr 25 04:04 ceph.bootstrap-mds.keyring
        -rw-------  1 root root     71 Apr 25 04:04 ceph.bootstrap-mgr.keyring
        -rw-------  1 root root     71 Apr 25 04:04 ceph.bootstrap-osd.keyring
        -rw-------  1 root root     71 Apr 25 04:04 ceph.bootstrap-rgw.keyring
        -rw-------  1 root root     63 Apr 25 04:04 ceph.client.admin.keyring

操作 OSD 节点
    需要在当前目录下运行 /ceph/

    1. ubuntu18-ceph-111
        ceph-deploy disk zap ubuntu18-ceph-111:/dev/sdb
        ceph-deploy osd create ubuntu18-ceph-111:/dev/sdb

        ceph-deploy osd activate ubuntu18-ceph-111:/dev/sdb


    使用ceph –s查看ceph情况


ceph-deploy admin  ubuntu18-ceph-111 ubuntu18-ceph-112 ubuntu18-ceph-113




## osd

创建
    ceph osd pool create ceph-demo 64 64

查看
    ceph osd lspools

    ceph osd pool get ceph-demo pg_num

    ceph osd pool get ceph-demo pgp_num

    ceph osd pool get ceph-demo size    //副本数

    ceph osd pool get ceph-demo crush_rule  


rbd
    rbd create -p ceph-demo --image rbd-demo.img --size 1G 或者 rbd create ceph-demo/rbd-demo.img -s 1G
        -p      pool_name
        --image image_name
        --size  M/G/T (default M)


    rbd info ceph-demo/rbd-demo.img

    rbd -p ceph-demo ls


    rbd rm -p ceph-demo --image rbd-demo.img --size 1G 或者 rbd rm ceph-demo/rbd-demo.img -s 1G


    扩容/也可以缩小，但是不建议缩小

        rbd resize  ceph-demo/rbd-demo.img -size 2G

        还需要对这个硬盘进行
            resize2fs /dev/rdb0



    查看这个object在那个pg上
        ceph osd map ceph-demo rbd_data.xxx


ceph -s
ceph health detail

    cluster:
        id:     b9ef7f08-4fde-49aa-b163-b0d19b8af5bb
        health: HEALTH_WARN
        application not enabled on 1 pool(s)

    services:
        mon: 1 daemons, quorum ubuntu18-ceph-111
        mgr: ubuntu18-ceph-111(active)
        osd: 3 osds: 3 up, 3 in

    data:
        pools:   1 pools, 64 pgs
        objects: 5 objects, 261B
        usage:   3.01GiB used, 11.7GiB / 14.7GiB avail
        pgs:     64 active+clean

    root@ubuntu18-ceph-111:/ceph# ceph health detail

    HEALTH_WARN application not enabled on 1 pool(s)
    POOL_APP_NOT_ENABLED application not enabled on 1 pool(s)
    application not enabled on pool 'ceph-demo'
    use 'ceph osd pool application enable <pool-name> <app-name>', where <app-name> is 'cephfs', 'rbd', 'rgw', or freeform for custom applications.

    运行命令
        ceph osd pool application enable ceph-demo rbd

    ceph osd pool application get ceph-demo

    systemctl status ceph-mgr@ubuntu18-ceph-111
    ceph -s
