
netcraft
    What’s that site running?
    还有一些安全类的资料

top500
    www.top500.org

SGI 图形工作站(Silicon Graphics)
    1997年, Linux 全面占领好莱坞
    SGI 不是 Linux 内核? 和 Linux 有什么区别?

linux 内核
    提供设备驱动，文件系统，进程管理，网络通信等功能的系统软件

Eric S. Raymound
    Given enough eyeballs, all bugs are shallow

MBR
    IDE硬盘最多有59个逻辑分区，加4个主分区最多能识别63个分区
    SCSI 硬盘最多有11个逻辑分区，加4个主分区最多能识别15个分区

格式化就是为了写入文件系统, 而不是清除数据
    ext3 支持最大16TB的分区 和 最大2TB的文件
    ext4 支持最大1EB的分区 和 最大16TB的文件, 支持无限量子目录
    fat32 最大支持32GB分区 和 最大4GB的文件
    ntfs 支持2TB分区 和 最大64GB的文件


IDE 也叫作 ATA 硬盘，PATA硬盘
    100MB/s
SCSI
    320MB/s
SATA
    600MB/s
    

当物理内存不够用的时候，就需要将物理内存中的一部分空间释放出来，以供当前运行的程序使用

LVM(逻辑卷管理) 和 磁盘阵列(RAID) 这两种分区管理方式支持动态的调整分区大小?

en_US.UTF-8
zh_CN.UTF-8


ls -l
    第二列是引用计数，文件的引用计数代表该文件的硬链接数，而目录的引用计数代表该目录有多少个一级子目录
    第五列 文件大小，默认是字节(ll 会以人类可读的方式显示)
    第六列：文件最后修改时间(属性修改+内容修改)


tree -L(level) 2

touch 如果文件存在，则会修改文件的时间戳(访问时间access time，数据修改时间modify time，状态修改时间change time 都会改变)
    **Linux中文件没有创建时间**
    **这3个时间 可以用 stat 来查看**
        会显示有几个 block, 几个连接数, 引用计数
    
    touch -d 2010-01-01 文件    将文件的access time, modify time 更改, 但是change time 会是 touch时的时间
    touch -a 只修改范文时间
    touch -m 只修改数据修改时间

    
查看 block size
    tune2fs -l /dev/nvme0n1p5
        tune2fs - adjust tunable filesystem parameters on ext2/ext3/ext4 filesystems
        调整和查看ext2/ext3文件系统的文件系统参数，Windows下面如果出现意外断电死机情况，下次开机一般都会出现系统自检。Linux系统下面也有文件系统自检，而且是可以通过tune2fs命令，自行定义自检周期及方式。

    stat 文件
        blocks 这个应该是硬件的sector size :512Byte
        IO Block ：4096 应该是文件系统的block size
        inode i节点
        -f 查看文件所在文件系统信息，而不是文件

    cat 会修改 access time
    echo >> 会修改 modify time, 此时数据变了，状态也随之改变，因此 change time 也变了
    如果只是修改文件的状态，则只有change time 改变，例如 chown root file1

cp 
    -i 询问，如果目标文件存在, 是否覆盖
    -p 保留源文件的属性(所有者，所属组，权限和时间)
