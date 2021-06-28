
https://www.bilibili.com/video/BV1AT4y1J7T6?p=2

## 虚拟化的定义

创建设备或资源的虚拟版本

##  虚拟化技术

系统虚拟化
存储虚拟化
网络虚拟化
GPU 虚拟化
软件虚拟化
硬件支持虚拟化

## 虚拟化历史

1960s Virtualization on mainframes

Virtualization on Unix systems

2000s VMware hypervisor for x86

Xen hypervisor for x86

KVM hypervisor

LXC / Docker

### 虚拟化的实现方式

1. 纯软件仿真

    通过模拟完整的硬件环境来虚拟化来宾平台

    产品或方案

        QEMU, Bochs, PearPC

1. 虚拟化层翻译

    采用虚拟机管理程序 Hypervisor

    Hypervisor 是一个软件曾或子系统, 也称为 VMM(Virtual Machine Monitor, 虚拟机监控器)

    1. 无硬件辅助的全虚拟化
        Hypervisor 运行在 Ring 0
        Guest OS 运行在 Ring 1

        机制：异常，捕获，翻译

        示例：
            VMware Workstation
            QEMU
            Virtual PC

    1.  半虚拟化 Para virtualization

        Hypervisor 运行在 Ring 0

        示例:
            Xen
    
    1. 硬件辅助的全虚拟化

        Full Virtualization with Hardware Assist

        Intel VT 和 AMD-V 创建一个新的 Ring -1  单独给 Hypervisor 使用

        示例：
            VMware ESXI
            Microsoft Hyper-V
            Xen3.0
            KVM

    1. LXC 和 Docker
        一种轻量级/操作系统虚拟化方式, 由 Linux 内核支持
        起源：chroot 系统调用，对当前程序及其子进程改变根目录
        优势：
            更快速的交付和部署


Hypervisor 的分类
    1974 年, 将 Hypervisor 分为两类

    裸金属型

    宿主型


## KVM

for Kernel-based Virtual Machine 

full virtualization solution 

It consists of a locadable kernel module


以色列的创业公司 Qumranet 创建了 KVM
2006年10月，正式宣布 KVM 的诞生
2007年2月发布的内核2.6.20中，正式包括了 KVM

2008年8月 Redhat 1.7美元收购

QEMU
    
    QEMU-KVM 从分支到与主干合并，QEMU 成立 KVM 在用户空间的管理工具


KVM体系结构

    KVM
        内核模块
        初始化CPU硬件，打开虚拟化模式，一直吃虚拟机的运行
        负责CPU,内存,中断控制器，时钟
        
    QEMU
        模拟网卡，显卡，存储控制器和硬盘
        
        QEMU是一款开源的模拟器及虚拟机监管器(Virtual Machine Monitor, VMM)。
        
        QEMU主要提供两种功能给用户使用。
            
            一是作为用户态模拟器，利用动态代码翻译机制来执行不同于主机架构的代码。
            
            二是作为虚拟机监管器，模拟全系统，利用其他VMM(Xen, KVM, etc)来使用
            硬件提供的虚拟化支持，创建接近于主机性能的虚拟机。
        
    libvirt
        它提供统一 API, 守护进程 libvirtd 和一个默认命令行管理工具 virsh



KVM 集中管理与控制
    示例:
        Ovirt

        WebVirtMgr

        ConVirt
            开源和商业版本

Hyperviso / VMM 的选择

    电信/ISP 公共云
        单一hypervisor
        KVM

    互联网公司
        单一hypervisor
        KVM

    Web托管和SAS细分市场
        单一或多个hypervisor

    企业

国产虚拟化解决方案概述
    H3: KVM
    红山: Xen
    华为: Xen -> KVM -> Xen
    浪潮: Xen
    普华: KVM
    锐捷: KVM
    深信服: KVM
    其他: KVM 居多

## 环境准备

### 生产环境硬件配置

CPU必须支持

实验环境的准备 Test Bed, 实验床,实验平台

KVM 嵌套虚拟化
    支持: ESXI, Hyper-V, KVM, Xen


centos 7 kikstart 


## Debian 10上安装KVM

启用硬件虚拟化扩展
    cat /proc/cpuinfo | grep --color vmx

    Intel : vmx
    AMD: svm

安装 KVM/QEMU

    apt install -y qemu qemu-kvm qemu-system qemu-utils

安装LibVirt：

    为了创建虚拟机并轻松管理它们，使用了libvirt。它是KVM和QEMU虚拟化的必备工具。

    apt install -y libvirt-clients libvirt-daemon-system virtinst

检查libvirtd服务是否以以下命令运行：

    $ sudo systemctl状态libvirtd

默认情况下，libvirt的默认网络不处于活动状态

    virsh net-list --all

为了使用libvirt创建虚拟机，默认网络必须处于活动状态。

    要启动默认网络，请运行以下命令：

    $ sudo virsh net-autostart default

图形化管理工具 virt-manager
    apt install virt-manager


## 创建KVM虚拟机

### 方式一：virt-manager

virt-manager: python 开发的图形化管理工具

iso 文件

    windows server 2003

磁盘空间

    8e LVM


fdisk /dev/sdb

    创建 sdb1 LVM

pvcreate /dev/sdb1

pvscan

vgcreate vmvg(自己起一个名字) /dev/sdb1

vgscan

vgdisplay vmvg
    Free PE / Size

lvcreate -n lvvm1 -l 上边那个大小 vmvg

vgdisplay vmvg

lvscan

mkfs.ext4 /dev/vmvg/lvvm1


安装完成后查看系统信息

storage format: qcow2

Disk bus: IDE


### 方式二: 
