KVM

Kernel-based Virtual Machine

是一个开源的系统虚拟化模块，自 linux2.6.20 之后集成在 Linux 的各个主要发行版本中。

它使用 Linux 自身的调度器进行管理，所以相对于 Xen, 其核心源码很少。

它一成为学术界的主流VMM（虚拟机监控器）之一

KVM的虚拟化需要硬件的支持(如 Intel VT 技术 or AMD V 技术)

是第一个正和岛 Linux 内核的虚拟化技术。

在 KVM 模型中，每一个虚拟机都是一个由 Linux 调度程序管理的标准进程，你可以**在用户空间启动客户机操作系统**
    一个普通的 Linux 进程有两种运行模式：内核和用户。
    KVM 增加了第三种模式：客户模式(有自己的内核和用户模式)

Xen ，只能支持和物理机系统一样的操作系统。跑不了 windows
KVM 支持其他操作系统

虚拟化 CPU 性能计数器(官方文档)
    如果打算使用性能监控应用程序(如VTune 或 OProfile)优化或调试虚拟机中运行的软件，可以打开此功能


64bit 才支持

查看自己的CPU是否支持全虚拟化技术
Intel : cat /proc/cpuinfo | grep --color vmx
AMD   : cat /proc/cpuinfo | grep --color svm
