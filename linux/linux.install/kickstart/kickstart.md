
https://www.bilibili.com/video/BV1ZQ4y1N7dX?p=10

https://www.bilibili.com/video/BV1wf4y127hJ?from=search&seid=3610264506415945908

系统安装程序 anaconda 就是我们安装 centos 时候的那个安装程序
    gui
    tui

hexdump isolinux/boot.cat -C
    第一阶段
    55 aa

hexdump isolinux/isolinux.bin -C


cat isolinux.cfg安装目录菜单

        install or upgrade an existing system
        install system with basic video driver
            boot: 可以输入 linux / sescue / vesa / local
            boot:linux askmethod        // 手动指定安装源，网络/dvd/
                URL:                    // boot.iso 只用来引导，可以把这个刻成光盘
                    http://10.0.0.1/centos/6/
                    

    timeout 600     //  单位是 十分之一秒
    背景图片 splash.jpg

    initrd.img


anaconda-ks.cfg
install.log
    安装的包
install.log.syslog
    安装过程



yum install system-cofig-kickstart // 图形化的 ks 定制软件
    安装 centos7 的时候好像有个bug, 不能选择安装哪些包
        /etc/yum.repos.d/base.repo
            将 [base] 改为别的名字，如 [development], 就可以了???
ksvalidator ks.cfg      // 语法检查

``` 
# 可以参考官方手册

#version=DEVEL
# System authorization information
auth --enableshadow --passalgo=sha512

# Use CDROM installation media
cdrom                                   // 或者 url --url="http://10.0.0.1/cblr/links/CentOS76-x86_64"

# Use graphical install
graphical

reboot              // 手动添加的，可以最后自动重启???

# Run the Setup Agent on first boot
firstboot --enable
ignoredisk --only-use=sda

# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us'

# System language
lang en_US.UTF-8

# Network information           // 网卡名可以设置为 eth0 ？
network  --bootproto=dhcp --device=enp0s3 --ipv6=auto --activate
network  --hostname=localhost.localdomain

# Root password
rootpw --iscrypted $6$Vm/NAjQrB/.MRyhN$Q8t3IuRUJlUq6LVNS1lMldKTvuCnkRAAtFiio2bvvp6trxNmcuZed0rZ6tWZlxzmKMNsXjth0ga6Da/7YJGtR/

# System services
services --disabled="chronyd"

# System timezone
timezone Asia/Shanghai --isUtc --nontp

# System bootloader configuration
bootloader --location=mbr --boot-drive=sda
autopart --type=lvm

# Partition clearing information
clearpart --none --initlabel

%packages
@^minimal           // @ 包组
@core

%end

%addon com_redhat_kdump --disable --reserve-mb='auto'

%end

%anaconda
pwpolicy root --minlen=6 --minquality=1 --notstrict --nochanges --notempty
pwpolicy user --minlen=6 --minquality=1 --notstrict --nochanges --emptyok
pwpolicy luks --minlen=6 --minquality=1 --notstrict --nochanges --notempty
%end
```

yum groupinstall Desktop
    /var/log/yum.log
    yum history

    startx

menu
```
label dsktop
    menu label ^Automatic Desktop Install
    kernel vmlinuz
    append initrd=initrd.img ks=ftp://
label mini
    menu label ^Automatic mini Install
    kernel vmlinuz
    append initrd=initrd.img ks=ftp://10.0.0.1/pub/2.cfg
label manual
    menu label ^manual mini Install
    kernel vmlinuz
    append initrd=initrd.img
label local
    menu default
    menu label boot from ^local drive
    localboot 0xffff
```





无人值守安

1. kickstart
    cp centos6ks.cfg /var/ftp/pub
    service vsftp status

    boot: linux ks=ftp://10.0.0.1/pub/centos6ks.cfg

2. 创建 iso 文件(仅仅引导)
    1. cp -r /misc/cd/isolinux/ /tmp/myiso/
    2. vim /tmp/myiso/isolinux/isolinux.cfg
    ```
    initrd=initrd.img text ks=cdrom:/myks.cfg
    ```
    3. cp /root/myks.cfg /tmp/myiso
    4. 创建 iso 文件
        cd /tmp
        mkisofs -R -J -T -v --no-emul-boot --boot-load-size 4 --boot-info-table -V "CentOS 6.9 x86_64 boot" -b isolinux/isolinux.bin -c isolinux/boot.cat -o /root/boot.iso mysio/
        以上命令的路径都是相对于光盘的根，而和工作目录无关
            -o 指定映像文件的名称
            -b isolinux/isolinux.bin    指定在制作可开机光盘时所需的开机映像文件
            -c 制作可开机光盘时，会将开机映像文件中的 no-eltorito-catalog 全部内容做成一个文件
            --no-emul-boot 非模拟模式启动
            -boot-load-size 4   设置载入部分的数量
            -R --rock   使用 Rock RidgeExtensions
            -J --joliet     使用 Joliet 格式的目录与文件名称
            -v --verbose
            -T 或 -translation-table 建立文件名的转换表, 适用于不支持 Rock Ridge Extensions 的系统上
    5. 创建 u 盘启动盘
        dd if=/dev/sr0 of=/dev/sdb

3. 创建完整 iso 
    cp -rv /misc/cd/* /app/centos6/
    cd centos6
    find -name TRANS.TBL -exec rm {} \;         // mkisofs 会生成

    cp /app/centos6/repodata/xxxx.xml /root/
    rm /app/centos6/repodata/*
    createrepo -g /root/xxxxx.xml  /app/centos6/

    cdrom

    menu
        ks=cdrom:/centos6.cfg

    cp centos6.cfg  /app/centos6/centos6.cfg

    mkisofs


    用u 盘的话还要: /usr/bin/isohybrid /root/centos6.iso

4. cobbler
    更加简单

https://wiki.debian.org/AutomatedInstallation

Kickstart is not available for Debian.

Kickstart is the automated installation method for **Redhat and Fedora Linux distributions**. A system administrator creates a file (called a Kickstart file) which describes the configuration and the required setup.

in ubuntu the pkg-name is "system-config-kickstart"

Cobbler is a Python Framework to manage unattended Linux installs (PXE, DHCP, kickstart, etc) mostly aimed at RPM based distributions.


## Tools for Debian

Debian Installer Preseed
    apt-cache show debian-installer

Fully Automatic Installation can install and configure Debian and RPM based distributions
    apt-cache search fai-
    apt install fai-server

## 原理

kickstart 和 cobbler 由红帽开发

在安装过程中记录人工干预填写的各种参数，并生成一个名为ks.cfg的文件
如果安装过程中要填写参数，首先查找ks.cfg文件，没有则弹出对话框


cobbler 是对kickstart的封装

## PXE

pre-boot execution environment 预启动执行环境

通过网络接口启动计算机，不依赖本地存储设备(如硬盘)或本地已安装的操作系统

由 Intel 和 Systemsoft 于 1999年9月20日公布的技术

C/S 架构

PXE 客户端会调用 IP, UDP, DHCP, TFTP 等协议

    客户端发送UDP 给 DHCP 请求 IP
    客户端请求TFTP 下载启动文件
    客户端请求HTTP 下载应答文件

### 

DHCP




### ubuntu

apt install system-config-kickstart
