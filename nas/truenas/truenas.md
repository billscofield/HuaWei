# TrueNas

[官网](https://www.truenas.com/)

TrueNAS Minimum Requirements

    1. 64-Bit CPU
    2. 16 GB of RAM Memory
    3. 16 GB Boot Drive (SSD Encouraged)
    4. At Least One Attached Disk
    5. Network Port
    6. Hardware RAID Not Required

## 三个产品分类

1. TrueNAS Core

    Single Node
    Scale-Up SAN/NAS/Object Storage Software
    Plugins And VMs
    Free To Download & Use
    Community-Supported

    Free BSD

2. TrueNAS enterprise

    Single & Dual Node Edition
    Scale-Up SAN/NAS/Object Storage Appliances
    High Availability
    Enterprise Reliability & Features
    24×7 Professional Support

    这个没有下载链接

3. TrueNAS Scale

    Combined Single & Multi-Node Edition
    Scale-Out SAN/NAS/Object Software & Appliances
    Linux Containers And VMs
    Free To Download & Use
    Community Or Enterprise Support

    Based on debian

## 安装

32G 的固态就好, 大的也没用，剩下的空间没有办法用来存储的

容器也是安装在存储上, 不是安装在系统盘上的

同时选择两个可以进行 raid0

1. Configure Network Interface

    提示出所有可以配置的网卡，选择网卡

    Remove the current settings of this interface ? 
        选择 no

    Configure interface for DHCP ? 
        选择 no

    Configure IPv4?
        y
    Interface Name:         是Description
        自己写个名字
    IPv4 Address: 固定IP地址

网页登录
    网关要在网页上修改

存储
    Create Pool
        存储池的名字是不能修改的

        阵列
            stripe   raid0
            
            mirror  每个硬盘都写一样的
            
            raid-z  raid-5
            
            raid-z2 raid-6(损失2个)
    
        pool 实际上是被挂载到 /mnt/下 poolname

        dateset 数据集(文件夹, 有一些设置可用)


degraded 降级
resilvering / diˈsɪlvər / 重新挂银

### 假如一个硬盘坏掉如何修复

storage / 右边的 Pool Operations / status 
    将掉的磁盘(removed)拔掉，插上新的，右键 replace 即可
    
邮件报警
    设置 root 帐号的邮箱(发送到的邮箱)
    smtp


ZFS
    dataset(数据集) 就是大概文件夹的概念
    sync 缓存的写入方式
        Standard    由客户端决定?
        Always      写入到硬盘才提示完成
        Disabled    写入到缓存就提示完成

    Compress

    Encryption Options
        默认继承存储池的加密
        Key加密
        字符串加密

    ZFS Deduplication 
        去重
        会给CPU比较大的压力
        对文件分块计算

    Case Sensitive
        大小写敏感
    
    Share Type
        Generic     这个就ok
        SMB

    Quota for this dataset              这个数据集的最大可用空间, quota /ˈkwəʊtə/ 配额
    Reserved space fro this dataset     提前为本数据集保留多少空间

    ACL Mode
        Passthrough 传递


权限
    UGO 权限


## ssh

/etc/ssh/sshd_config
    PermitRootLogin yes

systemctl restart ssh

## 关于 apt

/bin/apt 默认取消了执行权限

    加上了执行权限也没有公钥
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EB3E94ADBE1229CF
        错了，是要将 apt-key 加上执行权限

还需要将 /bin/apt-key 添加执行权限

    chmod +x /bin/apt-key





## 加入 ad 域 或者 LDAP

右上角 i 图标


## 
