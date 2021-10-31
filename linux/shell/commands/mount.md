

/etc/fstab
/etc/mtab           // 同 /proc/mounts
/proc/mounts        // 同 /etc/mtab


mount --bind

我们可以通过mount --bind命令来将两个目录连接起来，mount --bind命令是将前一个目
录挂载到后一个目录上，所有对后一个目录的访问其实都是对前一个目录的访问，


mount --bind test1 test2为例，当mount --bind命令执行后，Linux将会把被挂载目录的
目录项（也就是该目录文件的block，记录了下级目录的信息）屏蔽，即test2的下级路径
被隐藏起来了（注意，只是隐藏不是删除，数据都没有改变，只是访问不到了）。同时，
内核将挂载目录（test1）的目录项记录在内存里的一个s_root对象里，在mount命令执行
时，VFS会创建一个vfsmount对象，这个对象里包含了整个文件系统所有的mount信息，其
中也会包括本次mount中的信息，这个对象是一个HASH值对应表（HASH值通过对路径字符串
的计算得来），表里就有 /test1 到 /test2 两个目录的HASH值对应关系。

命令执行完后，当访问 /test2下的文件时，系统会告知 /test2 的目录项被屏蔽掉了，自
动转到内存里找VFS，通过vfsmount了解到 /test2 和 /test1 的对应关系，从而读取到
/test1 的inode，这样在 /test2 下读到的全是 /test1 目录下的文件。

1.mount --bind连接的两个目录的inode号码并不一样，只是被挂载目录的block被屏蔽掉
，inode被重定向到挂载目录的inode（被挂载目录的inode和block依然没变）。

2.两个目录的对应关系存在于内存里，一旦重启挂载关系就不存在了。


mkdir /data/data1
mount /dev/sdb2 /data/data1
mount --bind /data/data1 /mnt       // --bind 必须是目录, 不能是设备文件

    mount --bind /dev/sdb1 /mnt     X, 错误


-n, --no-mtab

    Mount without writing in /etc/mtab.  This is necessary for example when /etc is on a read-only filesystem.

-L, --label label

    Mount the partition that has the specified label.

-U, --uuid uuid

    Mount the partition that has the specified uuid.

-o, --options opts

    Use the specified mount options.  The opts argument is a comma-separated
    list.  For example:

    mount LABEL=mydisk -o noatime,nodev,nosuid

    For more details, see the FILESYSTEM-INDEPENDENT MOUNT OPTIONS and
    FILESYSTEM-SPECIFIC MOUNT OPTIONS sections.

    remount：重新挂载此设备
    ro：以只读方式挂载此设备
    rw：以读写方式挂载此设备
    async：文件系统的所有 I/O 操作以 异步 方式完成
    sync：文件系统的所有 I/O 操作以 同步 方式完成
    atime：当文件或者目录被访问时，更新 inode 中时间戳信息
    noatime：当文件或者目录被访问时，不更新 inode 中时间戳信息
    auto：当使用 mount -a 选项时，自动挂载此设备
    noauto：当使用 mount -a 选项时，不挂载此设备，此设备只能通过 mount 显示指定设备名称完成挂载

    dev：此文件系统上允许创建字符设备或者块设备
    nodev：此文件系统上不允许创建字符设备或者块设备

    exec：此设备上允许执行二进制程序
    noexec：此设备上不允许执行二进制程序

    user：此设备允许普通用户执行挂载 mount 操作
    nouser：此设备不允许普通用户执行挂载 mount 操作

    suid：此设备上允许对文件或目录设定 suid 或 sgid 特殊权限
    nosuid：此设备上不允许对文件或目录设定 suid 或 sgid 特殊权限

    defaults：默认 -o 参数设定的参数，如果不加 -o ，也是默认使用 defaults 参数，其代表的默认参数为 rw, suid, dev, exec, auto, nouser, and async

--- 

!!!

在固件开发过程中常常遇到这样的情况：为测试某个新功能，必需修改某个系统文件。而
这个文件在只读文件系统上（总不能为一个小小的测试就重刷固件吧），或者是虽然文件
可写，但是自己对这个改动没有把握，不愿意直接修改。这时候mount --bind就是你的好
帮手。 假设我们要改的文件是/etc/hosts，可按下面的步骤操作： 

1. 把新的hosts文件放在/tmp下。当然也可放在硬盘或U盘上。 

2. mount --bind /tmp/hosts /etc/hosts       此时的/etc目录是可写的，所做修改不
   会应用到原来的/etc目录，可以放心测试。测试完成了执行 umount /etc/hosts 断开
   绑定。 



---

## What is a SR0 file?

Files that contain the .sr0 file extension are files that have been created by
the SecuROM CD/DVD-ROM copy protection software application. This software is
often used to prevent CDs and DVDs from being copied, thereby protecting the
copyrights of the product creators.

When the SecuROM application analyzes a program, an SR0 file is created. The
SR0 files contain the copy-protection information regarding the program that
has been analyzed by the software. Each program that the SecuROM program
analyzes will have its own SRO file associated with it.

The SR0 files that are created by SecuROM are stored in an encrypted and
compressed format.


---

https://superuser.com/questions/272657/whats-the-difference-between-dev-hdc-dev-sr0-dev-cdrom#:~:text=%2Fdev%2Fsr0%20%20is%20the%20first%20SCSI%20CD-ROM%20device,makes%20ATAPI%20CD-ROM%20devices%20appear%20to%20be%20SCSI.

/dev/sr0 is the first SCSI CD-ROM device in the system. This may be misleading
as SCSI and SATA are interchangeable in Linux terminology. There is also SCSI
emulation of ATAPI devices in some Unix systems (in FreeBSD it's called
ATAPICAM) which makes ATAPI CD-ROM devices appear to be SCSI. Some older
software is written purely to interface with SCSI peripherals and can't work
with ATAPI ones, so this emulation layer can be quite useful.



## options

man 5 nfs

```
_netdev

    The filesystem resides on a device that requires network access (used to
    prevent the system from attempting to mount these filesystems until the
    network has been enabled on the system).

nosuid 

    Do not allow set-user-ID or set-group-ID bits to take effect.

rsize

    The maximum number of bytes in each network READ request that the NFS
    client can receive when reading data from a  file  on  an  NFS server.
    The actual data payload size of each NFS READ request is equal to or
    smaller than the rsize setting. The largest read pay‐load supported by the
    Linux NFS client is 1,048,576 bytes (one megabyte).

    The rsize value is a positive integral multiple of 1024.

wsize

```



## swap

mkswap
    mkswap [options] device [size]


swapon, swapoff
    swapon [options] [specialfile...]
    swapoff [-va] [specialfile...]

    /proc/swaps

    -a  同 mount -a

    -L label
        Use the partition that has the specified label.  (For this, access to
        /proc/partitions is needed.)

    -s, --summary
        
        Display  swap  usage summary by device.  Equivalent to "cat
        /proc/swaps".  This output format is DEPRECATED in favour of --show
        that provides better control on output data.
        
        swapon -s



## /etc/fstab

1. The fifth field (fs_freq). 归档备份频率

    This field is used by dump(8) to determine which filesystems need to be
    dumped.  Defaults to zero (don't dump) if not present.

    对设备文件进行备份，注意在 CentOS7 中默认使用 xfs 文件系统，而此处所用的备
    份工具 dump 只能支持 ext 系列，所以在 CentOS7 中，默认没有 dump 命令，当然
    也不存在设备归档备份了，所以这个字段其实算得上“有名无实”。

    这里我们说下这个字段的常用代码：
        0：表示从不备份（几乎都是 0）
        1：一天备份一次
        2：隔天备份一次

    apt-cache show dump

1. The sixth field (fs_passno). 设备自检

    This  field is used by fsck(8) to determine the order in which filesystem
    checks are done at boot time.  The root filesystem should be speci‐fied
    with a fs_passno of 1.  Other filesystems should have a fs_passno of 2.
    Filesystems within a drive will be  checked  sequentially,  but filesystems
    on  different drives will be checked at the same time to utilize
    parallelism available in the hardware.  Defaults to zero (don't fsck) if
    not present.

    设备在启动时，可以选择使用 fsck 进行设备检测，该字段支持的值为：
        0：表示不自检
        1：表示首先自检，一般只有根会是1（The root filesystem should be specified with a fs_passno  of  1）
        2：表示次级自检，这个就可以设置为其他设备文件（other filesystems  should  have  a  fs_passno  of 2）
        ...

    一般设备文件我们不需要在启动时设置自检，这样每次设备启动时间太长，会直接影响到业务在线率。
