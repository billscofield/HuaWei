

### 最小要求

4核, 8G内存, 40G硬盘

### 修改 MySQL 默认密码

安装完成后，重启, 会提示修改 MySQL 默认密码

默认密码是 : zstack.mysql.password



#### 如果是 PVE 安装 ZStack, 需要开启嵌套虚拟化
    1. 需要开启嵌套虚拟检测pve虚拟系统是否支持虚拟化
        PVE虚拟出来的vm系统的cpu,默认不支持vmx，即不支持嵌套虚拟化，在虚拟机中使用命令来验证：
        
        egrep --color 'vmx|svm' /proc/cpuinfo
        没有输出即不支持，否则会高亮显示vmx或者svm。

##### 开启嵌套虚拟化步骤：

```
1.开启pve主机的nested,关闭所有虚拟机
检查pve系统是否开启nested，运行命令：

# cat /sys/module/kvm_intel/parameters/nested
N
输出N，表示未开启，输出Y，表示已开启。

检查结果未开启，必须关闭所有的虚拟机系统，否则不能开启内核支持。

# modprobe -r kvm_intel
# modprobe kvm_intel nested=1
# cat /sys/module/kvm_intel/parameters/nested
Y
再次检查nested,输出Y，即为开启成功。

如果报错Module kvm_intel is in use，请检查你的虚拟机是否全部关闭。

2.设置系统启动后自动开启nested
# echo "options kvm_intel nested=1" >> /etc/modprobe.d/modprobe.conf

这样系统重启会自动加载netsted，支持嵌套虚拟了。

3.设置虚拟系统vm的cpu类型为host
# qm set <vmid> --cpu cputype=host
例：qm set 101 --cpu cputype=host
也可以在图形界面设置：选择vm,“硬件”–“处理器”–“类型”–“host"

4.测试虚拟机系统是否已经开启了虚拟化
启动虚拟机，运行下面的命令：

# egrep --color 'vmx|svm' /proc/cpuinfo

你会看到输出中有vmx或者svm的，表示此虚拟系统已经支持了虚拟化，如果是win系统，可以支持在win系统上安装其它的虚拟化软件了。
```

##### 查看开启虚拟化情况，如果有返回值，则表示开启成功。

cat /proc/cpuinfo | grep "vmx|svx"


#### 如果打开云主机控制台，没有进入 Login 

vi /etcmodprobe.d/kvm-nested.conf，在最后面加上ept=0，保存退出

然后关闭控制台界面并停止云主机

再次回到系统后台或crt工具登陆后（vmware装的那个系统）输入：
    rmmod kvm-intel 
    modprobe kvm-intel ept=0 unrestricted_guest=0


### 初始化 zstack

端口 5000

账号 admin

密码 password

区域 -> 集群 -> 物理机 -> 镜像服务器 -> 主存储 -> 计算规格 -> 镜像 -> 二层网络 -> 三层网络





## 离线安装

离线安装ZStack：

安装系统后，root的用户密码是password，通过以下方法离线安装ZStack。

下载ZStack离线安装包(e.g.wget -O http://cdn.zstack.io/product_downloads/zstack-enterprise/enterprise2.0/zstack-installer-2.0.0.bin )到任意目录(假定文件名为zstack-installer.bin)； 在此目录下执行“bash zstack-installer.bin -o”即可完成相应安装。 安装过程如果提示错误，可参考相应错误提示进行处理。如果无法正常安装可发送相应错误日志到官方讨论群寻求帮助。 安装完毕可参考相应的提示，访问对应的URL打开ZStack Web UI。

升级ZStack定制版ISO的yum源：

如果用户在之前使用了ZStack定制版 CentOS 7.2 低版本的ISO（例如1.2版本）安装好了系统，在升级ZStack之前，需要先升级相关的yum源。 升级步骤如下：

cd /opt/

    wget http://cdn.zstack.io/community/downloads/iso/ZStack-x86_64-DVD-2.0.0.iso

    wget http://cdn.zstack.io/product_downloads/scripts/zstack-upgrade

    bash /opt/zstack-upgrade ZStack-x86_64-DVD-2.0.0.iso
