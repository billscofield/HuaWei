## eve-ng

Emulated Virtual Environment 仿真虚拟环境

A new generation software for networking labs.

Eve-NG is a new generation software for networking lab. It can be considered
the next major version of iou-web, but the software has been forked from
UNetLab. The major advantage over GNS3 and iou-web itself is about
multi-hypervisor support within a single entity. UNetLab allows to design labs
using IOU, Dynamips and QEMU nodes without dealing with multi virtual machines:
everything run inside a UNetLab host, and a lab is a single file including all
information needed.

2017年发布第一版, 是定制的 Ubuntu 操作系统

## 安装

有很多种安装方法

## 文件格式

OVA file is an Open Virtual Appliance. 
An Open Virtualization Appliance (OVA) package is a single file archive of the 
    .ovf file, 
    .vhd file, 
    .mf file and, if applicable, the 
    .cert file.

.vhd Virtual Hard Disk Image
.ovf Open Virtualization Format Data

### ubuntu 安装

下载并添加EVE-NG源的密钥
    wget -O - http://www.eve-ng.net/repo/eczema@ecze.com. gpg.key | sudo apt-key add 


添加EVE-NG的更新源，并进行软件更新。
    add-apt-repository "deb [arch=amd64]  http://www. eve-ng.net/repo xenial main"
    apt-get update


下面执行安装EVE-NG的命令。系统会自动检索出需要哪些安装包，并自动下载安装。
    DEBIAN_FRONTEND=noninteractive apt-get -y install eve-ng


安装完成后，就可以进行EVE-NG的初始化操作了。这种安装方式是通过网络安装的，始终安装的是版。可以使用命令通过网络在线时时更新。

    apt-get update  
    apt-get upgrade 

## IOU

IOU 是 IOS on UNIX 的简写，也称为 IOL(IOS on Linux), 是运行在 UNIX/Linux 环境下的 IOS 模拟器，其命令集是完整的

Web IOU
IOU的拓扑搭建需要使用命令行和vi编辑器，不够直观和方便，因此有人开发出 Web 操作界面，称为 WebIOU


## 

/opt/unetlab/html/include/

/opt/unetlab/html/templates/设备配置文件.yml

/opt/unetlab/html/images/icons/

/opt/unetlab/addons/qemu/

    cd /opt/unetlab/wrappers/unl_wrapper -a fixpermissions
        Eve License Host Error (97).    说明没有激活

## 导入 vmdk

mkdir -p /opt/unetlab/addons/qemu/mikrotik-6.46.4/

qemu-img convert -f vmdk -O qcow2 chr-6.46.4.vmdk mikrotik6.46.4.qcow2

/opt/unetlab/wrappers/unl_wrapper -a fixpermissions

## 三种

eve-ng实际上 用的web-iou里面的os，华为的还没试过。

需要添加镜像，镜像保存目录：/opt/unetlab/addons下有/dynamips、/iol、/qemu镜像目录。

1. dynamips镜像上传到/dynamips后用/opt/unetlab/wrappers/unl_wrapper -a fixpermissions修复权限

2. iol需要将iol镜像、iourc文件(iol的license文件)、CiscoIOUKeygen.py（用于生成license），将上面三个文件传到/opt/unetlab/addons/iol/bin目录下，再用python CiscoIOUKeygen.py生成license，
    [license]
    eve-ng = 972f30267ef51616;
    将这两行粘贴进/opt/unetlab/addons/iol/bin/iourc文件中，然后用/opt/unetlab/wrappers/unl_wrapper -a fixpermissions修复权限就行了

    https://github.com/obscur95/gns3-server/blob/master/IOU/

    python3 CiscoIOUKeygen.py | grep -A 1 'license' > iourc

    iourc 文件生成一次即可，后续其他路由器镜像上传至 /bin/ 目录即可使用，注意修改 777 权限

3. qemu镜像解压rar压缩包比如将asav-941-200目录直接传到/qemu目录下，后用/opt/unetlab/wrappers/unl_wrapper -a fixpermissions修复权限

    在 /opt/unetlab/addons/qemu 建立一个 vios-xxx 目录
    上传路由器镜像到这个目录
    chmod 777 -R ./*

## 添加linux

qcow2

linux-centos7.1

root 密码 eve@123


## 关于激活

购前须知！
    1. 购买PRO前，需要提供PRO主机的request，以及接收lic的邮箱地址（非常重要!!!）
    2. lic绑定生成request主机硬件配置状态（可以一直离线使用），如需更改eve主机硬件配置或将eve主机进行迁移则必须联网并自动激活；如需要激活新主机，则需要把邮箱里的lic上传到新主机，并联网自动激活
    3. eve主机建议一直联网使用，每次重新激活会从官方lic服务器获取24h时效激活token，到期必须联网重新获取
    4. 相同lic只能有一个绑定的主机在线，如检测到多个主机则全部失效
    5. 每隔15分钟自动检测lic主机在线状态
    6. 鉴于lic机制问题，针对esx集群环境，建议将eve虚拟机固定在某个esx主机，以免产生自动迁移导致lic即时失效，实验出现问题！


我的EVE错误提示："Eve host license host error (97)"？

答：如果EVE长时间处于离线状态，并且在开机后，EVE虚拟机还没有收到可用的license token，则可能会发生这种情况，它通常在15分钟内自动解决。
要强制EVE PRO License 验证，请执行以下操作：
1. 确保EVE联网并且FQDN设置正确。你必须能否ping通域名，比如：www.eve-ng.net。
2. 然后在EVE CLI执行命令：systemctl restart licserver
3. 等待3-5分钟后，用修复权限命令检查license ：/opt/unetlab/wrappers/unl_wrapper -a fixpermissions
必须显示这个才是已激活：Online Check state: Valid

## EVE-NG 中使用 SecureCRT 合并tab标签

在EVE-NG中双击设备使用SecureCRT对设备进行调试连接时，会出现每次连接不同设备时都
会打开一个新的SecureCRT窗口，而不是在一个窗口中添加一个新的标签页，这就会导致在
实验模拟时会有N多的SecureCRT窗口，非常的麻烦。

如果有如此困扰的朋友可以使用下面方法解决，不会打开新窗口，而是在一个窗口中添加
标签页。清爽舒服！

1. 关闭SecureCRT / FX的所有实例

2. 找到SecureCRT的配置文件目录，不知道在哪里的，可以在Options -> Global Options -> General -> Configuration Paths 中查看，
默认为：C:\Users\用户名\AppData\Roaming\VanDyke\Config

3. 找到并打开Global.ini文件

4. 找到包含“Single Instance”的行，将其改为 D:"Single Instance"=00000001

5. 保存关闭，重新打开。


## 帐号密码

root/eve
admin/eve


## 支持的3大组建

1. Dynamips

    Dynamips 是一个基于虚拟化技术的模拟器(emulator), 用于模拟思科的路由器，基于它演变的模拟器有小凡、工大瑞普、GNS3等

2. IOL

    IOL(iso on Linux) 是指将思科的路由器、交换机 ios 系统运行在 Linux 操作系统之上

    基于它演变的模拟器有 WEB-IOU

3. QEMU

    QEMU(Quick Emulator) 是一套开源产品，是纯软件实现的虚拟化模拟器，几乎可以模拟任何硬件设备

4. Docker

5. VPCS

## 导入镜像

1. Dynamips

    将镜像上传到 /opt/unetlab/addons/dynamips
    chmod -R 777 /opt/unetlab/addons/dynamips

    添加路由器

    Add folder / Add new Lab    -> /opt/unetlab/labs/

    右键 / add node


## 基本操作

1. Node

2. 添加网络

    Type: bridege/cloud
        bridge: 傻瓜交换机, 集线器
        cloud: 桥接到外界的设备, 桥接到真实网络

3. Picture

4. Custom Shape

5. Text

wipe

Export CFG
    这一步操作后 wipe 就不管用了

    左侧栏目有个 Startup Config, Export CFG 后 Startup configuration 就是这个保存的了

    在左侧的 Startup configuration 中可以进行修改



## 实验1

1. VPC:
    // 设置 ip 和网关
    ip 12.1.1.1/24 12.1.1.2

    自动获取IP
    ip dhcp

    设置 DNS
    ip dns 8.8.8.8

    show ip

    save

    ping 

    抓取所有 PC 报文
    set dump detail all

2. r1

    en
    conf t
    int e0/0
    ip addr 12.1.1.2 255.255.255.0
    no shut

    int e0/1
    ip addr 23.1.1.2 255.255.255.0
    no shut

    show ip inter brief

    router eigrp 9

3 r2

    int gi0/0
    int gi0/1

    ip dhcp pool A
    network 34.1.1.10 /24
    default-router 34.1.1.1
    exit
    ip dhcp excluded-address 34.1.1.1 34.1.1.10

    router eigrp 90
    no au
    net 0.0.0.0



## h3c VSR-2000 路由器

eve-ng 里边没有这个

1. vim /opt/unetlab/html/includes/init.php

2. /opt/unetlab/html/templates/intel 添加vsr-2000模板文件

3. cp a10.yaml vsr.yaml

4. 图标文件

    放到 /opt/unetlab/html/images/icons/

    https://zhiliao.h3c.com/theme/imgStandard
    图标最好是 50左右的, 不要太大

5. 镜像

    /opt/unetlab/addons/qemu/vsr-2000

    前缀一定是 vsr-

## 将 linux.iso 镜像转换为 QEMU.qcow2

目标: 任何 iso 后缀系统能够为 eve 系统所模拟和使用

1. 上传 iso 文件到 qemu 目录

2. 新建 hda.qcow2 虚拟磁盘

3. 安装 centos 系统

4. 压缩并移动 hda.qcow2 镜像


具体步骤:

1. mkdir /opt/unetlab/addons/qemu/linux-liujiao

2. mv ceentos7.iso /opt/unetlab/addons/qemu/linux-liujiao/cdrom.iso

3. 在 /opt/unetlab/addons/qemu/linux-liujiao/新建 hda.qcow2 虚拟磁盘

    /opt/qemu/bin/qemu-img create -f qcow2 hdaqcow2 40G

4. 安装系统，压缩并移动 hda.qcow2 镜像

    在试验台 添加这个节点
    正常安装系统，最后不要点击安装界面的 reboot, 而是在节点上右键 stop, 并删掉 cdrom.iso
    再重新启动这个节点

    cd /opt/unetlab/tmp/0/
    这下边有很多编号，是这个试验台所在的 uuid
    进入这个节点的编号文件夹
    压缩 hda.qcow2 并移动到 /opt/unetlab/addons/qemu/linux-liujiao/

        /opt/qemu/bin/qemu-img convert -c -p -O qcow2 hda.qcow2 /opt/unetlab/addons/qemu/linux-liujiao/hda.qcow2

            '-c' indicates that target image must be compressed (qcow format only)
            '-p' show progress of command (only certain commands)
            -O output_fmt
            '-f' first image format
            '-F' second image format

    二次压缩 hda.qcow2

        virt-sparsify --compress hda.qcow2 a.qcow2
        mv a.qcow2 hda.qcow2

## vmware 中的虚拟机转移到 eve 中

vmdk 拷贝到 eve 中 /opt/unetlab/addons/qemu/linux-vmdk-zabbix

/opt/qemu/bin/qemu-img convert -f vmdk -O qcow2 zabbix.vmdk hda.qcow2

新建 Linux zabbix 节点并运行


## img 文件转换为 qcow2

/opt/qemu/bin/qemu-img convert -f raw -O qcow2 win2003.img hda.qcow2

## ova 文件转换为 qcow2

解压后发现是 .vmdk 文件

## EVE 桥接连通外部网络

eve 中 
    eth0
    pnet0 对应 真实的网卡 eth0
    cloud0 对应 eth0

    eth1
    pnet1 对应 真实的网卡 eth1


    如果 eve 是在 Vmware 中的 nat 网卡，那 dhcp 得到的就是 eve eth0 分配的 ip
    如果 eve 是在实体机中的，那也是从 eve 所使用的服务器一样的, eve 此时相当于Vmware中的桥接

Cloud0 
Cloud1
CloudN 具体的网卡

## 在线升级 EVE 系统

apt update
apt-get dist-upgrade -y
dpkg -l eve-ng

## EVE 备份和恢复

## EVE 扩展磁盘空间

VMware 添加硬盘


## 即开即用版 EVE
