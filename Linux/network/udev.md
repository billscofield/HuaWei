
udev 是Linux kernel 2.6系列的设备管理器。它主要的功能是管理/dev目录底下的设备节点。它同时也用来接替devfs及热插拔的功能，这意味着它要在添加/删除硬件时处理/dev目录以及所有用户空间的行为，包括加载固件及Linux 2.6.13内核。要想使用udev的最新版本依赖于升级后的的uevent接口是否是最新版本。

Linux 传统上使用静态设备创建方法，因此大量设备节点在 /dev 下创建（有时上千个），而不管相应的硬件设备是否真正存在。通常这由一个MAKEDEV脚本实现，这个脚本包含了许多通过世界上（有幽默意味，注）每一个可能存在的设备相关的主设备号和次设备号对mknod程序的调用。采用udev的方法，只有被内核检测到的设备才会获取为它们创建的设备节点。因为这些设备节点在每次系统启动时被创建，他们会被贮存在ramfs（一个内存中的文件系统，不占用任何磁盘空间）.设备节点不需要大量磁盘空间，因此它使用的内存可以忽略。


当一个新设备连 接被kernel监测到，kernel会产生一个hotplug event 并查找/proc/sys/kernel/hotplug去找出管理设备连接的用户空间程序。udev初始化脚本注册udev as this hander.当hotplug events发生时，kernel通知udev 去检测/sys 文件系统附属于这个新设备的信息并create 它的/dev/入口。
这带给我们一个问题：exists with udev,and likewise with devfs before it.？就像先有鸡还是先有蛋。大部分linux distrubtions
管 理加载模块通过/etc/modules.conf.access to 设备节点引起相应的kernel模块来加载。然而对于udev，这种方法不能正常工作，因为模块没有加载时，设备节点不存在。为了解决这个问题，模块脚本 加到了lfs-bootscripts包中，和/etc/sysconfig/modules在一起。通过添加module names到module file中，这些模块在计算机启动时被加载。这样，udev就可以去检测设备并创建相应的设备节点。
