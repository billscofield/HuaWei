
QEMU 本身作为一套完整的 VMM 实现，包括了处理器虚拟化，内存虚拟化，以及模拟各类
虚拟设备的功能。QEMU 4.0.0 版本甚至几乎可以模拟任何硬件设备，但由于这些模拟都是
纯软件实现的，所以其性能低下。

在 KVM 开发者在对 QEMU 进行稍加改造后，QEMU 可以通过 KVM 对外暴露的 /dev/kvm 接
口来对其进行调用。从 QEMU 角度来看，也可以说是 QEMU 使用了 KVM 的处理器和内存虚
拟化功能，为自己的虚拟机提供了硬件辅助虚拟化加速。

基于libvirt的工具如virt-manager和virt-install提供了非常便捷的虚拟机管理接口，但
它们事实上上经二次开发后又封装了qemu-kvm的工具。因此，直接使用qemu-kvm命令也能
够完成此前的任务。

kvm 负责CPU和内存虚拟化，但kvm不能模拟其他设备
qemu 是模拟IO设备
libvirt 则是调用kvm虚拟化技术的接口用于管理的


apt-get install qemu-system libvirt-clients libvirt-daemon-system virt-manager

1. qemu

    apt-cache show qemu

    These days, qemu become large and has been split into numerous packages.
    Different packages provides entirely different services, and it is very
    unlikely one will need all of them together. So current `qemu' package
    makes no sense anymore, and is becoming a dummy package.

    If you want full system emulation of some architecture, install one or more
    of qemu-system-ARCH packages. If you want user-mode emulation, install
    qemu-user pr qemu-user-static package. If you need utilities, use
    qemu-utils package.

1. qemu-system-x86 && qemu-kvm

    qemu-system-x86 - QEMU full system emulation binaries (x86)
    qemu-kvm - QEMU Full virtualization on x86 hardware

    https://forum.openmediavault.org/index.php?thread/39333-having-trouble-installing-qemu-kvm-broken-packages/

    qemu-kvm- it's superseded by qemu-system-x86 which itself provides a wrapper to
    run qemu-system-x86 in kvm mode. If you're trying to install updates, update
    qemu-system-x86 first, ignoring qemu-kvm.

2. libvirt-clients

    用于管理虚拟化平台的软件,一般情况下，在安装 libvirt-daemon-system 时会自动安装此包。

3. virt-manager
    
    virt-manager ：基于 libvirt 的 GUI 工具 (图形用户界面)。

    Virt-manager的全称是虚拟机管理器，这种图形用户界面应用程序用于通过libvirt管
    理虚拟机。尽管它主要为KVM访客而创建，也可以管理XEN和LXC容器。它有嵌入式VNC
    和SPICE客户端查看应用程序，可查看运行中虚拟机的全屏控制台。

4. virtinst

    一组用于创建虚拟机的命令行工具，一般情况下，在安装 virt-manager 时会自动安装此包。

5. bridge-utils

    用于配置以太网桥的命令行工具。

    KVM 客户机网络连接有两种方式：

        用户网络（User Networking）：也就是NAT方式。让虚拟机访问主机、互联网或
        本地网络上的资源的简单方法，但是不能从网络或其他的客户机访问客户机，性
        能上也需要大的调整。
        
        虚拟网桥（Virtual Bridge）：也就是Bridge(桥接)方式。Bridge方式可以使虚
        拟机成为网络中具有独立IP的主机，因此客户机和子网里面的机器能够互相通信。
        这种方式要比用户网络复杂一些，但是设置好后客户机与互联网，客户机与主机
        之间的通信都很容易。




综上分析，实际上是两个步骤:

    1. apt install qemu-system

    2. apt install libvirt-daemon-system virt-manager

    lsmod | grep -i kvm
    systemctl status libvirtd


    cockpit(飞机驾驶舱)
    systemctl restart cockpit
    www.localhost:


/var/lib/libvirt/images



apt install libosinfo-bin
yum install osinfo-query

    Tools for querying the osinfo database via libosinfo libosinfo is a GObject
    based library API for managing information about operating systems,
    hypervisors and the (virtual) hardware devices they can support. 

    查询可以支持哪些系统


## 命令行方式安装

虚拟机配置文件
    /etc/libvirt/qemu

存储虚拟机的介质文件
    /var/lib/libvirt/images/
    qcow2文件


根据配置文件创建虚拟机
    cp /etc/libvirt/qemu/kali.xml  /etc/libvirt/qemu/kali2.xml
    cp /var/lib/libvirt/images/kali.qcow2 /var/lib/libvirt/images/kali2.qcow2
    
    修改 配置文件
        1. 实例名
        2. uuid
        3. 镜像名称 /var/lib/libvirt/
        4. mac地址，只能修改后半段
        5. memory 和 currentmemory 要一致

    virsh define /etc/libvirt/qemu/kali2.xml    // 创建虚拟机
    systemctl restart libvirtd

    开启路由转发
        vim /etc/sysctl.conf
            net.ipv4.ip_forward = 1
        syctl -p


## 升级配置

添加磁盘

1. 添加配置文件

```
<disk type='file' device='disk'>
    <driver name='qemu' type='qcow2'/>
    <source file='/var/lib/libvirt/images/kali2022-1.qcow2'/>
    <target dev='hdb' bus='ide'/>
    <address type='drive' controller='0' bus='0' target='0' unit='0'/>  //pci 要改 slot
</disk>¬

```
2. 创建磁盘

    qemu-img create -f qcow2 /var/lib/libvirt/images/kali2022-1.qcow2 2G

3. 重新定义

    virsh define /etc/libvirt/qemu/kali2022-1.xml


## 文本方式

virt-install
    -n              Name  of the new guest virtual machine instance.
    -r --memory     in MiB
    --disk
    --os-type
    --os-variant
    --vcpus
    --location
    -oconsole=ttyS0
    --nographics


## 存储池

KVM 必须配置一个目录当作它存储磁盘镜像(存储卷)的目录，我们称这个目录为存储池

默认存储池
    /var/lib/libvirt/images/


创建基于目录的存储池

    mkdir /data/vmfs -p
    virsh pool-define-as vmdisk --type dir --target /data/vmfs
    virsh pool-build vmdisk
    virsh pool-list --all       // 查看存储池

    virsh pool-autostart vmdisk


    virsh vol-create-as vmdisk 卷.qcow2 20G --format qcow2
        ll /data/vmfs/
        是动态
    
    在存储池中删除虚拟机存储卷
        virsh vol-delete --pool vmdisk hello.qcow2

    取消激活存储池
        virsh pool-destroy vmdisk

    删除存储池定义的目录 /data/vmfs
        virsh pool-delete vmdisk

    取消定义存储池
        virsh pool-undefine vmdisk




## 磁盘格式

1. raw

    原始格式，性能最好
    不支持快照

2. qcow
    
    cow(copy on write 写时复制), 性能远低于 raw, 所以有了 qcow2

3. qcow2

    性能还是不如 raw,
    支持快照

4. qed

    不支持快照


写时拷贝
    raw 立刻分配空间，不管你有没有用
    qcow2 只是承诺给你分配空间，用的时候才给你


创建磁盘文件
    1. qcow2 格式

        qemu-img create -f qcow2 /var/lib/libvirt/test.qcow2 20G

    2. raw

        qemu-img create -f raw /var/lib/libvirt/test.img 20G


    查看磁盘信息

        qemu-img info test.img

挂载磁盘

    apt install libguestfs-tools -y


    virt-df -h -d vm1
        -h|--human-readable
        -d|--domain guest    Add disks from libvirt guest


    virt-filesytems -d 虚拟机名字


挂载磁盘镜像分区到宿主机
    
    guestmount [--options] -d Guest -i [--ro] mountpoint
    guestmount -d vm1  -m /dev/centos/root --rw /mnt/

    guestumount /mnt/


## kvm 管理

1. 查看

    virsh list          //运行状态的虚拟机
    virsh list --all 

    virsh dumpxml vm1   // 查看这个虚拟机的配置文件

    virsh dumpxml vm1 >/etc/libvirt/qemu/vm6.xml

    virsh edit vm6
        直接用 vim 修改需要重启 libvirtd
        virsh edit 不用重启 libvirtd



    virsh start vm1
    virsh suspend vm1
    virsh resume vm1

    关闭
        方法一：virsh shutdown vm1
        方法二：virsh destroy vm1

    重启
        virsh reboot vm1

    重置
        virsh reset vm1
        断电，很快

    删除虚拟机
        virsh undefine vm1
        必须关机时才可以

        开机时运行这条命令，配置文件会被删除，磁盘文件还在


    开机自动启动
        virsh autostart vm1
        /etc/libvirt/qemu/autostart/vm1.xml
    
    取消自动启动
        virsh autostart --disable vm1

    查看所有自启动的
        virsh list --all --autostart


## 克隆

关机状态

virt-clone -o vm1 --auto-clone
    -o --original
    自动生成新的名字

virt-clone -o vm1 -n vm3 --auto-clone
    -n --name

virt-clone -o vm1 -n vm3 -f /var/lib/libvirt/images/vm4.qcow2
    -f --file 新客户端使用的磁盘镜像文件, 不必先存在

    --auto-clone
        Generate a new guest **name**, and **paths** for new storage.
        
        An example of possible generated output:
        
        Original name        : MyVM
        Generated clone name : MyVM-clone
        
        Original disk path   : /home/user/foobar.img
        Generated disk path  : /home/user/foobar-clone.img

自动生成了新的配置文件，name,uuid,path,mac,ip


## 增量镜像

通过以及基础镜像(node.img), 里面把各个虚拟机都需要的环境都搭建好，然后基于这个
镜像建立起一个个的增量镜像，每个增量镜像对已一个虚拟机，虚拟机对镜像中所有的改
变都记录在增量镜像中，基础镜像始终保持不变。

基本镜像文件: node.img  虚拟机id: node
增量镜像文件: node4.img 虚拟机id: node4

1. 创建增量镜像文件
    
    qemu-img create -b /var/lib/libvirt/images/node.img -f qcow2 /var/lib/libvirt/images/node4.img
    qemu-img info /var/lib/libvirt/images/node4.img

2. 配置文件

    cp /etc/libvirt/qemu/node.xml /etc/libvirt/qemu/node4.xml 

    name, uuid, mac, path

3. define

    virsh define /etc/libvirt/qemu/node4.xml

    virsh start node4

4. 测试

    宿主机
    du -h /var/lib/libvirt/images/node.img
    du -h /var/lib/libvirt/images/node4.img


## 快照

virsh snapshot-create-as vm2 vm2.snap

virsh snapshot-list vm2


格式转换

raw -> qcow2

    qemu-img convert -O qcow2 /var/lib/libvirt/images/vm2-1.raw /var/lib/libvirt/images/vm2-1.qcow2
        -O OUTPUT_FMT


修改配置文件，然后再重新define, 就可以拍快照了

查看
    virsh snapsht-list vm2


恢复快照
    virsh snapshot-revert vm2 vm2.snap3

删除快照
    virsh snapshot-delete --snapshotname vm2.snap3 vm2


## 网络

两个网络和一个接口
    nat:        default
    isolated:   隔离, 宿主机可以访问

    bridge 接口

虚拟交换机
    linux-bridge (linux 自带)
    ovs(open-Vswitch)

    brctl show(虚拟机关机状态时运行结果)
    bridge name     bridge id               STP enabled     interfaces
    anbox0          8000.8a159bbfdd35       no
    docker0         8000.02427d79b0a2       no
    virbr0          8000.525400e3823a       yes


    brctl show(虚拟机开机状态时运行结果)
    bridge name     bridge id               STP enabled     interfaces
    anbox0          8000.8a159bbfdd35       no
    docker0         8000.02427d79b0a2       no
    virbr0          8000.525400e3823a       yes             vnet2


    virbr0 虚拟交换机

    brctl delif virbr0 vnet2
        删除 virbr0 上的 vnet2 接口
        删除后虚拟机上不了网络

    brctl addif virbr0 vnet2
        添加后虚拟机又可以上网了


## 配置文件方式配置桥接

关闭虚拟机

touch /etc/sysconfig/networ-script/ifcfg-br0
```
TYPE=Bridge
NAME=br0
DEVICE=br0
ONBOOT="yes"
BOOTPROTO=static
IPADDR=10.0.0.1
GATEWAY=10.0.0.254
PREFIX=16
DNS1=8.8.8.8
```

修改物理机的网卡,如 em1
    echo > ifcfg-em1
    DEVICE="em1"
    ONBOOT="yes"
    BRIDGE=br0          // 桥接到 br0 上

systemctl restart libvirtd
systemctl restart network
