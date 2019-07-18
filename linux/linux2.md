
netcraft
    What’s that site running?
    还有一些安全类的资料

top500
    www.top500.org

SGI 图形工作站(Silicon Graphics)
    1997年, Linux 全面占领好莱坞
    SGI 不是 Linux 内核? 和 Linux 有什么区别?
    IRIX 是由硅谷图形公司 SGI 是以System V与BSD延伸程序为基础所发展成的UNIX操作系统，对于3-D视图和虚拟现实环境最优化了的应用软件。

6个主要的 Unix 变种
    1. SGI Irix
    1. IBM AIX
    1. Compaq Tru64 Unix
    1. Hewlett-Packard HP-UX
    1. SCO UnixWare
    1. Sun Solaris

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
        如果大于1，说明有硬链接文件
        注意, 硬链接和原文件是无法区分的
    第五列 文件大小，默认是字节(ll 会以人类可读的方式显示)
    第六列：文件最后修改时间(modify修改时间,实验得到)


tree -L(level) 2

touch 如果文件存在，则会修改文件的时间戳(访问时间access time，数据修改时间modify time，状态修改时间change time 都会改变)
    **Linux中文件没有创建时间**
    **这3个时间 可以用 stat 来查看**
        会显示有几个 block, 几个连接数, 引用计数
    
    touch -d 2010-01-01 文件    将文件的access time, modify time 更改, 但是 change time 会是 touch 时的时间
    touch -a 只修改访问时间
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
        相同的还有 mv -i
    -p 保留源文件的属性(所有者，所属组，权限和 **access,modify 时间,change时间会改变**)
        (touch -d)
        **所有者，所属组 不会改变是针对root用户cp别的用户的文件而言的，非root用户cp -p 其他用户的文件，所有者和所属组还是会变成自己的, 另外，access time, modify time 不会变，change time 会变更**
            你是一个普通用户，当然不能创建属于root用户的文件

    cp 文件，三个时间都会被修改, 

    -d --no-dereference(解除参照) --preserve=links 如果复制的是软连接，则还是复制软连接
        **如果复制软连接，没有 -d 选项，复制的是源文件**
        对硬链接无效

    -l 复制为硬链接，而非复制源文件

    -a -dpr
    
    -r recursive

    -n, --no-clobber
        do not overwrite an existing file (overrides a previous -i option)
    -f, --force
        if  an  existing  destination file cannot be opened, remove it and try again (this option is ignored when the -n option is also used)


mv  
    -n, --no-clobber(如果目标文件已经存在，不会覆盖移动，且不询问用户)
              do not overwrite an existing file
    -f, --force
        do not prompt before overwriting
    -i, --interactive
        prompt before overwrite

    
man 
    man -f  // 同whatis命令 , 显示有哪个级别的帮助
        whatis - display one-line manual page descriptions

        man -f passwd
        whatis passwd

    man -k  // 同apropos命令，查看命令名中包含指定字符串的所有相关命令的帮助
        apropos - search the manual page **names and descriptions**

        man -k user
        apropos user
        

info 是一套完整的资料，书籍，有章节，比如 info ls


whereis 
    whereis - locate the binary, source, and manual page files for a command
    -b 只查找二进制文件
    -m 只查找帮助文档

which - locate a command

whereis 和 which 只能索索系统命令的命令
locate 才是按照文件名搜索普通文件的命令

locate 
    locate - find files by name
    -i case insensitive

    数据库地址:/var/lib/mlocate/mlocate.db
    配置文件:/etc/updatedb.conf
        prune /pru:n/ 减少，减去

        prunefs= 忽略的文件系统
        prunepaths= 忽略的路径
        prunenames="忽略的文件"

find
    -iname 按照文件名搜索，不区分文件名大小写
    -size
        `b'    for 512-byte blocks (this is the default if no suffix is used)
        `c'    for bytes
        `w'    for two-byte words
        `k'    for Kilobytes (units of 1024 bytes)
        `M'    for Megabytes (units of 1048576 bytes)
        `G'    for Gigabytes (units of 1073741824 bytes)

## 文件大小

```
du -hs services
    20K     services
stat 文件
    File: 'services'
    size: 19605           Blocks: 40         IO Block: 4096   regular file

    %s     File's size in bytes.
    %b     The amount of disk space used for this file in 512-byte blocks.  Since disk space  is  allocated  in multiples  of  the  filesystem  block  size  this is usually greater than %s/512, but it can also be smaller if the file is a sparse file.

stat -c --format=Format
stat -c "%s %b" 文件

find . -size 19605c
```

du 
    du 默认是占用的磁盘大小，而不是文件本身大小

    -b, --bytes
          equivalent to '--apparent-size --block-size=1'  本质上还是计算占用磁盘空间大小，而不是文件本身大小，只不过假设一个 扇区(sector size)为 1byte 了
            --block-size=1 假设一个磁盘 block 是 1byte


wc -c filename
    -c 表示统计字符, 因为一个字符一个字节, 所以这样得到字节数



size        是文件的真实大小
blocks      是多少个磁盘512Byte, 也就是扇区大小
IO Block    是格式化磁盘的时候4K对齐的那个概念


### 总结
查看文件真实大小
    du -b 文件
    wc -c 文件
    stat -c %s 文件
    stat 文件 中的 size (byte)

占用空间
    du -h 文件
    stat 文件(Blocks*512byte)


ll 显示的大小是一个基于真实大小的大概值

硬件上的 block size, 应该是"sector size"

磁盘分区的"cylinder size"，用fdisk 可以查看。

spare file 稀疏文件



## 压缩
### zip
windows 上的格式

zip 目标名.zip 源文件1 源文件2 ...
zip -r 目标名.zip 源目录1 源目录2 源文件1 ...


unzip
    -d  extract files into exdir
    -l list files (short format)


zip 保留源文件
unzip 也保留源文件

### gz
gzip 源文件     不保留源文件
gzip -k 源文件  保留源文件
    -c, --stdout      write on standard output, keep original files unchanged
gzip -c 源文件> 目标名称.gz

gzip 只能压缩，不能打包

gzip -r 目录    将这个目录下的文件压缩
gunzip -r 目录

查看gz中的文件
    zcat gz文件   纯文本压缩的文件

gzip -1 --fast
gzip -9 --best


### bz2
bzip2 -k 源文件   保留源文件
bzip2 -c 源文件>目标文件.bz2

bunzip2

bzcat   纯文本压缩的文件


### tar
-c create a new archive
-f --file=archive
-v --verbose
-z --gzip --gunzip

-x --extract  extract files from an archive
-C --directory=DIR
-t --list   list the contents of an archive
-j --bzip2



## 关机
shutdown now
shutdown +1
shutdown 16:00
shutdown +10 "shutdown"

shutdown -r now
shutdown -r +1
shutdown -r 16:00
shutdown -r +10 "shutdown"

shutdown -c
