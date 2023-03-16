# RAID (Redundant Array of Independent Disk 独立冗余磁盘阵列)

## 历史及特点

加州大学伯克利分校1987年提出，最初是为了组合小的廉价磁盘来代替大的昂贵磁盘，同
时希望磁盘失效时不会使对数据的访问受损 失而开发出一定水平的数据保护技术。

RAID就是一种由多块廉价磁盘构成的冗余阵列，在操作系统下是作为一个独立的大型存储
设备出现。

RAID可以充分发 挥出多块硬盘的优势，可以提升硬盘速度，增大容量，提供容错功能够确
保数据安全性，易于管理的优点，在任何一块硬盘出现问题的情况下都可以继续工作，不
会 受到损坏硬盘的影响。

硬盘测试工具：Disk Speed Test(比较直观，类似汽车仪表)

## RAID 等级

1. RAID 0
    1. 是最早出现的RAID模式，即Data Stripping数据分条技术。
    2. 2块硬盘即可，成本低，可以提高整个磁盘的性能和吞吐量。
    3. 没有提供冗余或错误修复能力，但实现成本是最低的。
    4. 最大的缺点在于任何一块硬盘出现故障，整个系统将会受到破坏，可靠性仅为单独
       一块硬盘的1/N。
    5. 速度最快
    6. 个人用户

2. RAID 1
    1. RAID 1 称为磁盘镜像，原理是把一个磁盘的数据镜像到另一个磁盘上，也就是说
       数据在写入一块磁盘的同时，会在另一块闲置的磁盘上生成镜像文件，在不影响性
       能情况下最大限度的保证系统的可靠性和可修复性上，只要系统中任何一对镜像盘
       中至少有一块磁盘可以使用，甚至可以在一半数量的硬盘出现问题时系统都可以正
       常运行,
    2. 当一块硬盘失效时，系统会忽略该硬盘，转而使用剩余的镜像盘读写数据，具备很
       好的磁盘冗余能力。
    3. 虽然这样对数据来讲绝对安全，但是成本也会明显增加，磁盘利用率为50%，
    4. 另外，出现硬盘故障的RAID系统不再可靠，应当及时的更换损坏的硬盘，否则剩余
       的镜像盘也出现问题，那么整个系统就会崩溃。
    5. 更换新盘后原有数据会需要很长时间同步镜像，外界对数据的访问不会受到影响，
       只是这时整个系统的性能有所下降。
    6. 因此，RAID 1多用在保存关键性的重要数据的场合。
    7. RAID 1主要是通过二次读写实现磁盘镜像，所以磁盘控制器的负载也相当大，尤其
       是在需要频繁写入数据的环境中。为了避免出现性能瓶颈，使用多个磁盘控制器就
       显得很有必要。
    8. 是用于存放重要数据，如服务器和数据存储等

3. RAID 5
    1. 最少只需要3块硬盘
    2. 最多只能坏掉1块硬盘
    3. RAID 5具有和RAID 0相近似的数据读取速度，且磁盘空间利用率要比RAID 1高，存
       储成本相对较低，是目前运用较多的一种解决方案。
    4. 以奇偶校验作冗余
    5. 是一种存储性能、数据安全和存储成本兼顾的解决方案

    |             RAID 5
    | 硬盘        Disk1   Disk2   Disk3   Disk4   Disk5
    | 校验值例如  2     +   4   +   1   +   3   =  10

4. RAID 1|0
    1. 最少4块硬盘
    2. 其实就是RAID1 和 RAID0 的组合, 两块硬盘组成A(硬盘a 和硬盘b 构成RAID1),两
       块硬盘组成B(硬盘c 和硬盘d 构成RAID1),AB构成RAID0
    3. 在实际应用中较为常用

    |           RAID 1|0
    |              |
    |              | RAID0
    |       +------+--------+
    |       |               |
    |       A               B
    |   +---+---+       +---+---+
    |   |       |       |       |RAID1
    |   a       b       c       d

    从主通路分出两路,做Striping操作,即把数据分割,
    而这分出来的每一路则再分两路，做Mirroring操作，即互做镜像

    首先创建2个独立的Raid1，然后将这两个独立的Raid1组成一个Raid0


## 问题

1. linux 下如何查看raid信息
    1. https://blog.csdn.net/qq_21064841/article/details/53392746
    2. https://blog.csdn.net/harbor1981/article/details/42772377    (MegaCli)

[链接1] (https://blog.csdn.net/c1052981766/article/details/49612793)


## 软 RAID

mdadm - Tool to administer Linux MD arrays (software RAID)

## what is md

In the context of Linux, md stands for **"Multiple Devices" or "Multiple Disks."**
It is a Linux kernel subsystem that provides software RAID functionality,
allowing multiple physical disks to be combined into a logical volume for
improved performance, redundancy, or both. The md subsystem manages the array,
and the devices are accessed as a single block device. RAID levels 0, 1, 4, 5,
6, and 10 are supported by the md subsystem.


## To create a software RAID in CentOS 7, you can follow these steps:

1. yum install mdadm

2. Once mdadm is installed, create partitions on your disks. You can use the
   fdisk command to create partitions.

3. Create RAID devices by running the following command, replacing /dev/sda1
   and /dev/sdb1 with the partitions you want to use:

       mdadm --create /dev/md0 --level=1 --raid-devices=2 /dev/sda1 /dev/sdb1
       mdadm -C /dev/md0       -l1       -n=2             /dev/sda1 /dev/sdb1
       mdadm -C /dev/md0       -l1       -n=2             /dev/sda /dev/sdb

    This command creates a RAID 1 device called /dev/md0 using two partitions
    (/dev/sda1 and /dev/sdb1).

4. Once the RAID device is created, create a file system on it using the
   following command:

        mkfs.ext4 /dev/md0

5. Mount the RAID device using the following command:

        mount /dev/md0 /mnt/raid

6. To make the RAID device mount automatically at boot time, you need to add an
   entry to the /etc/fstab file. For example:

       /dev/md0   /mnt/raid   ext4   defaults   0 0

    -x, --spare-devices=
        Specify  the number of spare (eXtra) devices in the initial array. 
        热备盘数量

7. 查看

    watch -n1 "mdadm -D  /dev/md0"

        -D Print details of one or more md devices.

    mdadm /dev/md0 -f -r /dev/sdb
        -f force
        -r, --remove
            remove listed devices.  They must not be active.  i.e. they should
            be failed or spare devices.
