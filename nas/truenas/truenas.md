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


