##

DAS:直连式存储

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

软件定义的，统一存储解决方案的开源项目

分布式、可扩展、高性能、不存在单点故障 的存储系统


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
数个硬盘组合，容量大了，速度也快乐

万一数据坏掉呢？
    解决方案1
        备份，3个盘当一个,90T相当于30T
        将3个盘设为一个组，叫 PG, 逻辑盘？


acting set:一个列表，存的是3个OSD的编号，默认第一个是组长

librdb 把文件切成一个个的块 object，每个块最大4MB, 分别存到PG
1个object只能存在于一个PG
多个object能放到一个PG上


PG 对 osd daemon:   1对多
PG 对 object:       1对多
osd daemon 对 硬盘: 1对1

一个osd可以对应多个PG, PG 和 osd： 多对多的关系


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

