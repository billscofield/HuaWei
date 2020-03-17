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


## ceph现状

1. 作为云存储解决方案
1. 作为软件定义的解决方案
1. 作为统一存储解决方案
    对象
    块
    文件系统


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
        
