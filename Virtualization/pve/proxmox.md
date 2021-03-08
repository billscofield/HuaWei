创建CT: 创建OpenVZ架构虚拟机, 需要下载模板
创建虚拟机: 创建


在web界面，你就只能上传小于2G的ISO文件。
解决办法：
    通过sftp上传到以下目录就可以解决
    /var/lib/vz/template/iso

## 源的更换

目前Proxmox中文社区源已正式提供镜像服务，镜像更新频率为每10小时，镜像站机房存放在法国巴黎online机房使用阿里云、华为云融合提供国内CDN加速服务。 地址 http://download.proxmox.wiki

1. 删除企业源

    rm -rf /etc/apt/sources.list.d/pve-enterprise.list

1. 下载秘钥

    wget http://download.proxmox.com/debian/proxmox-ve-release-6.x.gpg -O /etc/apt/trusted.gpg.d/proxmox-ve-release-6.x.gpg

1. 添加社区源

    echo "deb http://download.proxmox.wiki/debian/pve stretch pve-no-subscription" >/etc/apt/sources.list.d/pve-install-repo.list

    建议同时使用国内debian源

    deb http://mirrors.aliyun.com/debian/ buster main non-free contrib
    deb-src http://mirrors.aliyun.com/debian/ buster main non-free contrib
    deb http://mirrors.aliyun.com/debian-security buster/updates main
    deb-src http://mirrors.aliyun.com/debian-security buster/updates main
    deb http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib
    deb-src http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib
    deb http://mirrors.aliyun.com/debian/ buster-backports main non-free contrib
    deb-src http://mirrors.aliyun.com/debian/ buster-backports main non-free contrib



中科大：deb https://mirrors.ustc.edu.cn/proxmox/debian/pve buster pve-no-subscription
清华： deb https://mirrors.tuna.tsinghua.edu.cn/proxmox/debian buster pve-no-subscription

1. 最后执行

    apt update
    apt update && apt dist-upgrade #如需升级pve，则执行该命令

## PVE命令行管理虚拟机启动和停止

1. 查看集群资源状况

    pvesh get /cluster/resources

    ┌───────────────────────┬─────────┬───────┬──────────┬─────────┬───────┬────────┬────────────┬────────────┬────────────┬──────┬──────┬───────────┬───────────┬────────────┐
    │ id                    │ type    │   cpu │ disk     │ hastate │ level │ maxcpu │    maxdisk │     maxmem │ mem        │ node │ pool │ status    │ storage   │     uptime │
    ╞═══════════════════════╪═════════╪═══════╪══════════╪═════════╪═══════╪════════╪════════════╪════════════╪════════════╪══════╪══════╪═══════════╪═══════════╪════════════╡
    │ node/pve              │ node    │ 1.71% │ 2.17 GiB │         │       │      8 │  27.19 GiB │   7.70 GiB │ 2.67 GiB   │ pve  │      │ online    │           │ 2h 19m 47s │
    ├───────────────────────┼─────────┼───────┼──────────┼─────────┼───────┼────────┼────────────┼────────────┼────────────┼──────┼──────┼───────────┼───────────┼────────────┤
    │ qemu/100              │ qemu    │ 1.29% │ 0.00 B   │         │       │      2 │ 100.00 GiB │   1.00 GiB │ 399.36 MiB │ pve  │      │ running   │           │ 1h 40m 14s │
    ├───────────────────────┼─────────┼───────┼──────────┼─────────┼───────┼────────┼────────────┼────────────┼────────────┼──────┼──────┼───────────┼───────────┼────────────┤
    │ qemu/101              │ qemu    │ 2.57% │ 0.00 B   │         │       │      1 │  50.00 GiB │ 512.00 MiB │ 159.16 MiB │ pve  │      │ running   │           │     7m 19s │
    ├───────────────────────┼─────────┼───────┼──────────┼─────────┼───────┼────────┼────────────┼────────────┼────────────┼──────┼──────┼───────────┼───────────┼────────────┤
    │ storage/pve/local     │ storage │       │ 2.17 GiB │         │       │        │  27.19 GiB │            │            │ pve  │      │ available │ local     │            │
    ├───────────────────────┼─────────┼───────┼──────────┼─────────┼───────┼────────┼────────────┼────────────┼────────────┼──────┼──────┼───────────┼───────────┼────────────┤
    │ storage/pve/local-lvm │ storage │       │ 4.80 GiB │         │       │        │  60.66 GiB │            │            │ pve  │      │ available │ local-lvm │            │
    ├───────────────────────┼─────────┼───────┼──────────┼─────────┼───────┼────────┼────────────┼────────────┼────────────┼──────┼──────┼───────────┼───────────┼────────────┤
    │ storage/pve/wd1t      │ storage │       │ 6.16 GiB │         │       │        │ 915.89 GiB │            │            │ pve  │      │ available │ wd1t      │            │
    └───────────────────────┴─────────┴───────┴──────────┴─────────┴───────┴────────┴────────────┴────────────┴────────────┴──────┴──────┴───────────┴───────────┴────────────┘


显示所有node
    pvesh get /nodes

    ```
    VMID NAME                 STATUS     MEM(MB)    BOOTDISK(GB) PID
    100 Debian               running    1024             100.00 8563
    101 DebianServer         running    1024              50.00 25636

    ```

显示某节点中的虚拟机
    pvesh get /nodes/<nodeid>/qemu

    ```
    pvesh get /nodes/pve/qemu
    ┌─────────┬──────┬──────┬──────┬────────────┬──────────┬──────────────┬───────┬───────────┬──────┬─────────┐
    │ status  │ vmid │ cpus │ lock │    maxdisk │   maxmem │ name         │   pid │ qmpstatus │ tags │  uptime │
    ╞═════════╪══════╪══════╪══════╪════════════╪══════════╪══════════════╪═══════╪═══════════╪══════╪═════════╡
    │ running │  101 │    1 │      │  50.00 GiB │ 1.00 GiB │ DebianServer │ 25636 │           │      │ 12m 39s │
    ├─────────┼──────┼──────┼──────┼────────────┼──────────┼──────────────┼───────┼───────────┼──────┼─────────┤
    │ running │  100 │    2 │      │ 100.00 GiB │ 1.00 GiB │ Debian       │  8563 │           │      │  2h 28s │
    └─────────┴──────┴──────┴──────┴────────────┴──────────┴──────────────┴───────┴───────────┴──────┴─────────┘

    ```



    ```
    root@pve:~# pvesh get /nodes/pve/qemu/101/status
    ┌──────────┐
    │ subdir   │
    ╞══════════╡
    │ current  │
    ├──────────┤
    │ reboot   │
    ├──────────┤
    │ reset    │
    ├──────────┤
    │ shutdown │
    ├──────────┤
    │ start    │
    ├──────────┤
    │ stop     │
    ├──────────┤
    │ suspend  │
    └──────────┘
    ```


显示某虚拟机状态
    pvesh get /nodes/<nodeid>/qemu/<vmid>/status/current

    root@pve:~# pvesh get /nodes/pve/qemu/101/status/current
    ┌───────────┬───────────────┐
    │ key       │ value         │
    ╞═══════════╪═══════════════╡
    │ cpus      │ 1             │
    ├───────────┼───────────────┤
    │ ha        │ {"managed":0} │
    ├───────────┼───────────────┤
    │ maxdisk   │ 50.00 GiB     │
    ├───────────┼───────────────┤
    │ maxmem    │ 1.00 GiB      │
    ├───────────┼───────────────┤
    │ name      │ DebianServer  │
    ├───────────┼───────────────┤
    │ pid       │ 25636         │
    ├───────────┼───────────────┤
    │ qmpstatus │ running       │
    ├───────────┼───────────────┤
    │ status    │ running       │
    ├───────────┼───────────────┤
    │ uptime    │ 14m 19s       │
    ├───────────┼───────────────┤
    │ vmid      │ 101           │
    └───────────┴───────────────┘


开启一个虚拟机 [注意是create哦,不是get了]
    pvesh create /nodes/<nodeid>/qemu/<vmid>/status/start

显示某节点下容器快照
    pvesh get /nodes/<nodeid>/lxc/<ctid>/snapshot

显示某节点的ZFS存储区
    pvesh get /nodes/<nodeid>/disks/zfs

显示某节点的磁盘列表
    pvesh get /nodes/<nodeid>/disks/list

1. 取得虚拟机当前状态

    pvesh get /nodes/<节点id>/qemu/<虚拟机id>/status/current

1. 关闭虚拟机

    pvesh create /nodes/<节点id>/qemu/<虚拟机id>/status/stop




## Proxmox ve 开启嵌套虚拟化

检测pve虚拟系统是否支持虚拟化

PVE虚拟出来的vm系统的cpu,默认不支持vmx，即不支持嵌套虚拟化，在虚拟机中使用命令来验证：

    egrep --color 'vmx|svm' /proc/cpuinfo

    没有输出即不支持，否则会高亮显示vmx或者svm。


有时为了测试和学习，需要开启pve的嵌套虚拟化，以便能在其系统中安装类似esxi，hyper-v之类的虚拟化软件，就需要开启pve的嵌套虚拟化功能了。

开启嵌套虚拟化步骤：

1. 开启pve主机的nested,关闭所有虚拟机

检查pve系统是否开启nested，运行命令：

    cat /sys/module/kvm_intel/parameters/nested
    N
    输出N，表示未开启，输出Y，表示已开启。

检查结果未开启，必须关闭所有的虚拟机系统，否则不能开启内核支持。

    modprobe -r kvm_intel
    modprobe kvm_intel nested=1
    cat /sys/module/kvm_intel/parameters/nested
    Y
    再次检查nested,输出Y，即为开启成功。

如果报错Module kvm_intel is in use，请检查你的虚拟机是否全部关闭。

2. 设置系统启动后自动开启nested

    echo "options kvm_intel nested=1" >> /etc/modprobe.d/modprobe.conf

这样系统重启会自动加载netsted，支持嵌套虚拟了。

3. 设置虚拟系统 vm 的 cpu 类型为host

    qm set <vmid> --cpu cputype=host
    例：qm set 101 --cpu cputype=host
    也可以在图形界面设置：选择vm,“硬件”–“处理器”–“类型”–“host"

4. 测试虚拟机系统是否已经开启了虚拟化

启动虚拟机，运行下面的命令：

    egrep --color 'vmx|svm' /proc/cpuinfo




备份路径
    /var/lib/vz/dump/

## 去除令人讨厌的弹窗

vi /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js 

搜索：data.status !== 'Active' 将其注释掉

if (这里改为false)

systemctl stop pveproxy.service
systemctl start pveproxy.service


## 添加设备

### 添加硬盘

1. 查看硬盘 

    fdisk -l 

1. 查看UUID 

    blkid

1. 分区和格式化

1. 写入 /etc/fstab

    UUID=xxx

1. 测试挂载

    mount -a

1. PVE管理页面添加存储

    数据中心->存储->添加->目录

    ID:   自定义id local
    目录: 硬盘挂载目录
    内容: 全选


## 硬件直通

### 硬盘/usb硬盘

查看你现在的存储设备的序列号:

ls /dev/disk/by-id

然后就能看到所有存储设备的序列号

记住这个序列号

然后输入以下代码(请把硬盘序列号换成你硬盘的,100换成你LEDE的虚拟机ID)

qm set 100 -sata1 /dev/disk/by-id/ata-WDC_WDXXXX_XXXX_XXXX

如果返回以下信息,说明已成功挂载

update VM 100: -sata1 /dev/disk/by-id/ata-WDC_WDXXXX_XXXX_XXXX

然后可以进入PVE管理网页,查看当前虚拟机的硬件中是否真的挂载成功.如果看到虚拟机硬件设备里有这个,就说明成功.


!!! 这个不是真正完全的直通，真正的直通是直通sata控制器，这样就能休眠，能看到smart信息，硬盘型号等等。







shell里面输入命令： nano /etc/default/grub

在里面找到：GRUB_CMDLINE_LINUX_DEFAULT="quiet"

然后修改为：GRUB_CMDLINE_LINUX_DEFAULT="quiet intel_iommu=on"

如果是amd cpu请改为：GRUB_CMDLINE_LINUX_DEFAULT="quiet amd_iommu=on"

在更新一下：update-grub

到这里先不要重启。

在PVE的shell中输入：nano /etc/modules  ，查看modules中是否有vfio、vfio_iommu_type1、vfio_pci、vfio_virqfd ，如果没有请添加。修改好就可以重启系统了。

虚拟机 -> 硬件 -> 添加 PCI 设备
