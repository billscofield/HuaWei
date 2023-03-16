## 1. MegaCli简介

MegaCli 是由 LSI 原厂提供的 LSI MegaRaid 阵列卡管理工具。
他可以查看当前 RAID 卡的所有信息，包括 RAID 卡型号、类型、磁盘状态、电池状态等等。

[官网](http://www.lsi.com/)

LSI Corporation was acquired by Avago Technologies (now known as Broadcom Inc.)
on May 6, 2014

wegt https://docs.broadcom.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/8-07-10_MegaCLI_Linux.zip 
unzip 8-07-10_MegaCLI_Linux.zip 
yum localinstall 8.07.10_MegaCLI_Linux/Linux\ MegaCLI\ 8.07.10/MegaCli-8.07.10-1.noarch.rpm

### 1. Megacli概念

适配器，物理驱动器和虚拟驱动器

在我们通过megacli命令之前，我们需要遵循megacli概念。

    1. 适配器(Adapter) - 我们要使用的物理控制器，由id（通常为0）表示。
        The physical controller which we are going to use, represented by id (usually 0).
    2. 机柜(Enclosure 围场) - 物理机箱所附的物理驱动器，以id为代表，例如254,252等。
        The physical chassis the physical drives attached to, represented by id, such as 254,252 etc.
    3. 物理驱动器 - **附加到控制器的物理硬盘**，由id，0,1,2,3等代表
        Physical Drives - Physical Hard Disks attached to controller, represented by id, 0,1,2,3 etc.
    4. 虚拟驱动器 - 这些驱动器包含物理驱动器，并等同于由id，0,1,2,3等代表的RAID设备。
        Physical Hard Disks attached to controller, represented by id, 0,1,2,3 etc.

### 2. Common Parameters

Many of the commands of MegaCli make use of the following parameters:

1. -aN

    Specifies the **adapter**. Use -a0 for the first adapter, -a1 for the second,
    or -aALL for all adapters.

2. -PhysDrv [E:S]

    Specifies a **physical drive**. E is the enclosure ID, as returned by MegaCli
    -EncInfo -aALL. For dataset1, the possible enclosure IDs are 16 and 41. If
    more than one drive has to be specified, the drives are written in the form
    [E:S, E:S, ...].

3. -Lx

    Specifies a **virtual drive** (aka RAID array) (where x is a number starting
    with zero or the string all).

## 2. StorCli

StorCLI 是 MegaCLI 的继承者，允许命令行工具管理和控制 LSI MegaRAID 控制器。
MegaCli是 LSI 公司官方提供的 SCSI 卡管理工具，由于 LSI 被收购变成了现在的
Broadcom，所以现在想下载 MegaCli，需要去 Broadcom 官网查找 Legacy 产品支持，搜
索 MegaRAID 即可。现在官方有 storcli，已经基本代替了 megacli，整合了 LSI 和
3ware 所有产品。

安装方面比较简单，megacli 还要 Lib_Utils 的支持，而 storcli 只用一个 rpm 包就可
以下载，去 Broadcom [官网](https://www.broadcom.com/site-search?q=storcli)去找
就行了

storcli 支持 json 格式输出，信息解析更加方便

安装完后，默认位置在 /opt/Mega/storcli下面

### 1. Raid卡信息查询

通过以下命令可以大致确定使用的的Raid的厂商和型号

1. dmesg |grep raid 
2. cat /proc/scsi/scsi 
3. lspci |grep -i raid

### 2. 常用命令

参数释义：

    /cx = Controller ID
    /vx = Virtual Drive Number.
    /ex = Enclosure ID
    /sx = Slot ID

    storcli64 -h                                                     查看帮助信息

    storcli64 show                                                   查看RAID卡、系统内核、主机名等信息

    storcli64 /c0 show all                                           查看第一块RAID卡版本、功能、状态、以及raid卡下的物理磁、逻辑盘信息。c0代表第一块raid卡，如果有多块则命令以此类推。

    storcli64 /c0 show freespace                                     查看第一块RAID卡剩下的磁盘空间

    storcli64 /c0 show rebuildrate                                   查看第一块RAID卡rebuildrate速度

    storcli64 /c0 download file=mr3108fw.rom                         升级第一块RAID卡固件

    storcli64 /c0 restart                                            升级固件后重启RAID卡以便新固件及时生效

    storcli64 /c0 flushcache                                         清除第一块RAID卡缓存

    storcli64 /c0 /eall /sall show all                               查看第一块RAID卡上物理磁盘详细信息

    storcli64 /c0 /e252 /s0 start locate                             定位第一块RAID上某块物理磁盘，物理磁盘的绿色的定位灯会闪烁。 e代表Enclosure，s代表Slot或PD

    storcli64 /c0  /ex /sx stop locate                               停止定位，定位灯停止闪烁。

    storcli64 /c0 /e252 /sall show rebuild                           查看磁盘重建进度

    storcli64 /c0 /ex /sx start rebuild                              开始重建

    storcli64 /c0 /ex /sx stop rebuild                               停止重建

    storcli64 /c0 /ex /sx add hostsparedrive dgs=0                   设置某块物理磁盘为磁盘组0的热备盘，如果不指定dgs，则为该RAID卡上全局热备盘。

    storcli64 /c0 /ex /sx delete hostsparedrive                      删除热备磁盘

    storcli64 /c0 add vd each type=raid0 drives=252:0,1,2,3          单独为每一块物理磁盘创建raid0
    storcli64 /c0 add vd type=raid5 size=all names=tmp1 drives=32:2-4                                由第3、4、5块物理磁盘来构建RAID5，分配所有空间的逻辑磁盘命名tmp1。

    storcli64 /c0 add vd type=raid10 size=all names=tmp1 drives=32:0-3 pdperarray=2                  
        由前四块物理磁盘构建raid10，分配所有空间的逻辑磁盘命名为tmp1。（注意：LSI
        SAS3108最多支持64个RAID，创建10/50/60时，必须指定pdperarray参数。如果没有这
        个参数，是创建不成功的。这个参数的含义是：Specifies the number of physical
        drives per array. The default value is automatically chosen。）

    storcli64 /c0 add vd type=raid10 size=100GB,200GB names=tmp1,tmp2 drives=32:0-3 pdperarray=2        由前四块物理磁盘构建raid10，分别分配多个逻辑磁盘。

    storcli64 /c0 add vd type=raid10 size=all names=tmp3 drives=32:0-3 pdperarray=2                     剩下的所有空间分配给逻辑磁盘tmp3。

    storcli64 /c0 /vall show all                                    显示第一块RAID卡上所有逻辑磁盘相关信息，也可指定某个逻辑磁盘v0，v1等等。

    storcli64 /c0 /v0 show                                          显示第一块RAID卡上第一个逻辑磁盘信息

    storcli64 /c0 /v0 del force                                     强制删除某个逻辑磁盘

    storcli64 /c0 /bbu show all                                     显示bbu信息

    storcli64 /c0 /vall set wrcache=wt/wb/awb                       设置写策略

    storcli64 /c0 show alarm                                        查看报警器信息

    storcli64 /c0 set alarm=silence                                 暂时关闭报警器鸣叫

    storcli64 /c0 set alarm=off                                     始终关闭报警器鸣叫

    storcli64 /c0 /e252 /s3 set good                                改变插入的物理磁盘的状态

    storcli64 /c0 /e252 /s3 start initialization                    初始化某个物理磁盘

    storcli64 /c0 /e252 /s3 show initialization                     查看某个初始化的物理磁盘进度

    storcli64 /c0 /v0 set wrcache=wt                                修改vd的写策略

    storcli64 /c0 /v0 set rdcache=nora                              修改vd的读策略

    storcli64 /c0 /fall show                                        查看foreign信息

    storcli64 /c0 /fall import                                      导入foreign

    storcli64 /c0 show termlog type=contents                        在线查看日志

    storcli64 /c0 show termlog type=contents | grep "rebuild"       在线查看日志抽取关键字

    storcli64 /c0 show events file=/home/eventreports               将日志存储为文件

### 下载安装

从 https://www.broadcom.com 官网下载对应工具即可,也可以上服务器品牌官网支持页下
载该工具, 比如联想官网

https: //download.lenovo.com/pccbbs/thinkservers/ul_avago_storcli_1.18.11_anyos.zip
