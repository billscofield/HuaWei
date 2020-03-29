## eve-ng
 A new generation software for networking labs.
 Eve-NG is a new generation software for networking lab. It can be considered the next major version of iou-web, but the software has been forked from UNetLab. The major advantage over GNS3 and iou-web itself is about multi-hypervisor support within a single entity. UNetLab allows to design labs using IOU, Dynamips and QEMU nodes without dealing with multi virtual machines: everything run inside a UNetLab host, and a lab is a single file including all information needed.


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

1. iol需要将iol镜像、iourc文件(iol的license文件)、CiscoIOUKeygen.py（用于生成license），将上面三个文件传到/opt/unetlab/addons/iol/bin目录下，再用python CiscoIOUKeygen.py生成license，
    [license]
    eve-ng = 972f30267ef51616;
    将这两行粘贴进/opt/unetlab/addons/iol/bin/iourc文件中，然后用/opt/unetlab/wrappers/unl_wrapper -a fixpermissions修复权限就行了

1. qemu镜像解压rar压缩包比如将asav-941-200目录直接传到/qemu目录下，后用/opt/unetlab/wrappers/unl_wrapper -a fixpermissions修复权限



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

在EVE-NG中双击设备使用SecureCRT对设备进行调试连接时，会出现每次连接不同设备时都会打开一个新的SecureCRT窗口，而不是在一个窗口中添加一个新的标签页，这就会导致在实验模拟时会有N多的SecureCRT窗口，非常的麻烦。
如果有如此困扰的朋友可以使用下面方法解决，不会打开新窗口，而是在一个窗口中添加标签页。清爽舒服！

 

1.关闭SecureCRT / FX的所有实例

2.找到SecureCRT的配置文件目录，不知道在哪里的，可以在Options -> Global Options -> General -> Configuration Paths 中查看，
默认为：C:\Users\用户名\AppData\Roaming\VanDyke\Config

3.找到并打开Global.ini文件

4.找到包含“Single Instance”的行，将其改为 D:"Single Instance"=00000001

5.保存关闭，重新打开。
