# qemu & kvm 

https://zhuanlan.zhihu.com/p/48664113

首先KVM（Kernel Virtual Machine）是Linux的一个内核驱动模块，它能够让Linux主机成
为一个Hypervisor（虚拟机监控器）。在支持VMX（Virtual Machine Extension）功能的
x86处理器中，Linux在原有的用户模式和内核模式中新增加了客户模式，并且客户模式也
拥有自己的内核模式和用户模式，虚拟机就是运行在客户模式中。KVM模块的职责就是打开
并初始化VMX功能，提供相应的接口以支持虚拟机的运行。

QEMU（quick emulator)本身并不包含或依赖KVM模块，而是一套由Fabrice Bellard编写的
模拟计算机的自由软件。QEMU虚拟机是一个纯软件的实现，可以在没有KVM模块的情况下独
立运行，但是性能比较低。QEMU有整套的虚拟机实现，包括处理器虚拟化、内存虚拟化以
及I/O设备的虚拟化。QEMU是一个用户空间的进程，需要通过特定的接口才能调用到KVM模
块提供的功能。从QEMU角度来看，虚拟机运行期间，QEMU通过KVM模块提供的系统调用接口
进行内核设置，由KVM模块负责将虚拟机置于处理器的特殊模式运行。QEMU使用了KVM模块
的虚拟化功能，为自己的虚拟机提供硬件虚拟化加速以提高虚拟机的性能。

KVM只模拟CPU和内存，因此一个客户机操作系统可以在宿主机上跑起来，但是你看不到它，
无法和它沟通。于是，有人修改了QEMU代码，把他模拟CPU、内存的代码换成KVM，而网卡、
显示器等留着，因此QEMU+KVM就成了一个完整的虚拟化平台。

KVM只是内核模块，用户并没法直接跟内核模块交互，需要借助用户空间的管理工具，而这
个工具就是QEMU。KVM和QEMU相辅相成，QEMU通过KVM达到了硬件虚拟化的速度，而KVM则通
过QEMU来模拟设备。对于KVM来说，其匹配的用户空间工具并不仅仅只有QEMU，还有其他的，
比如RedHat开发的libvirt、virsh、virt-manager等，QEMU并不是KVM的唯一选择。

所以简单直接的理解就是：QEMU是个计算机模拟器，而KVM为计算机的模拟提供加速功能。


## libvirt

为什么需要Libvirt？

Hypervisor 比如 qemu-kvm 的命令行虚拟机管理工具参数众多，难于使用。
Hypervisor 种类众多，没有统一的编程接口来管理它们，这对云环境来说非常重要。
没有统一的方式来方便地定义虚拟机相关的各种可管理对象。
Libvirt提供了什么？

1. 它提供统一、稳定、开放的源代码的应用程序接口（API）、守护进程 （libvirtd）和
   和一个默认命令行管理工具（virsh）。

1. 它提供了对虚拟化客户机和它的虚拟化设备、网络和存储的管理。

1. 它提供了一套较为稳定的C语言应用程序接口。目前，在其他一些流行的编程语言中也
   提供了对libvirt的绑定，在Python、Perl、Java、Ruby、PHP、OCaml等高级编程语言
   中已经有libvirt的程序库可以直接使用。

1. 它对多种不同的 Hypervisor 的支持是通过一种基于驱动程序的架构来实现的。
   libvirt 对不同的 Hypervisor 提供了不同的驱动，包括 Xen 的驱动，对QEMU/KVM 有
   QEMU 驱动，VMware 驱动等。在 libvirt 源代码中，可以很容易找到 qemu_driver.c、
   xen_driver.c、xenapi_driver.c、vmware_driver.c、vbox_driver.c 这样的驱动程序
   源代码文件。

1. 它作为中间适配层，让底层 Hypervisor 对上层用户空间的管理工具是可以做到完全透
   明的，因为 libvirt 屏蔽了底层各种 Hypervisor 的细节，为上层管理工具提供了一
   个统一的、较稳定的接口（API）。

1. 它使用 XML 来定义各种虚拟机相关的受管理对象。

   目前，libvirt 已经成为使用最为广泛的对各种虚拟机进行管理的工具和应用程序接口
   （API），而且一些常用的虚拟机管理工具（如virsh、virt-install、virt-manager等）
   和云计算框架平台（如OpenStack、OpenNebula、Eucalyptus等）都在底层使用libvirt
   的应用程序接口。


libvirt主要由三个部分组成，它们分别是：
    1. 应用程序编程接口(API)库
    2. 一个守护进程(libvirtd),这个守护进程可以分为两种：
        一种是root权限的libvirtd，其权限较大，可以做所有支持的管理工作；
        一种是普通用户权限的libvirtd，只能做比较受限的管理工作。
    3. 一个默认命令行管理工具(virsh)。



工具集合

    1. libvirt：操作和管理KVM虚机的虚拟化 API，使用 C 语言编写，可以由 Python,Ruby,
       Perl, PHP, Java 等语言调用。可以操作包括 KVM，vmware，XEN，Hyper-v, LXC 等在
       内的多种 Hypervisor。

    1. virsh：基于 libvirt 的 命令行工具 （CLI）

    1. virt-Manager：基于 libvirt 的 GUI 工具

    1. virt-v2v：虚机格式迁移工具

    1. virt-xxx 工具：包括 Virt-install （创建KVM虚机的命令行工具）， Virt-viewer
       （连接到虚机屏幕的工具），Virt-clone（虚机克隆工具），virt-top 等

    1. sVirt：安全工具


## qemu(dummy package)

apt-cache show qemu

fast processor emulator, dummy package QEMU is a fast processor emulator. Once
upon a time there was only one package named `qemu', with all functionality
included. 

These days, qemu become large and has been split into numerous packages.
Different packages provides entirely different services, and it is very
unlikely one will need all of them together. So current `qemu' package makes no
sense anymore, and is becoming a dummy package.  .  

1. If you want full system emulation of some architecture, install one or more
   of qemu-system-ARCH packages. 

1. If you want user-mode emulation, install qemu-user or qemu-user-static
   package. 

1. If you need utilities, use qemu-utils package.  .  This package can safely
   be removed.


## qemu-utils

This package provides QEMU related utilities:
    1. qemu-img: QEMU disk image utility
    1. qemu-io:  QEMU disk exerciser
    1. qemu-nbd: QEMU disk network block device server


## qemu-system

This metapackage provides the full system emulation binaries for all supported
targets, by depending on all per-architecture system emulation packages which
QEMU supports.







## install

apt install qemu-system-x86

apt install libvirt-clients

apt install libvirt-daemon-system
    # libvirt-daemon-system - Libvirt daemon configuration files

apt install virtinst
    # virtinst - utilities to create and edit virtual machines



systemctl status libvirtd

## usage

1. make sure libvirtd is running

    systemctl status libvirtd

2. libvirt的默认网络不处于活动状态
    
    virsh net-list --all

    # 1. 启动默认网络
        virsh net-start default
    
    # 2. 将默认网络配置为在启动时自动启动：
        virsh net-autostart default

    
