
https://www.bilibili.com/video/BV1ZQ4y1N7dX?p=10

https://www.bilibili.com/video/BV1wf4y127hJ?from=search&seid=3610264506415945908

无人值守安装

1. kickstart

1. cobbler
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
