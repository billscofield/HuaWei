
## dump & restore

backup and restore for **ext2/3/4** filesystems This is a port of the 4.4BSD
filesystem backup suite.  Dump examines files on a filesystem and determines
which files need to be backed up. These files are copied to the given disk,
tape or other storage medium for safe keeping.


dump 是 Linux 下非常好用的备份工具，系统默认没有安装该工具

dump    [选项]    备份后的文件名    原文件或目录

0 级别指的就是完全备份，1～9 级别都是增量备份级别。

-[0-9]    

    有0-9十个备份等级，0为全备，1-9级别可以实现增量备份或差异备份，当备份级别相
    比0递增为增量备份，级别递减为差异备份。因为dump备份的时候只会备份比当前备份
    级别小的数据，如第一次采用0级别备份，第二次采用4级别，那么dump会备份0和4级
    别之间产生的数据，第三次采用7级别则会备份4级别之后的数据。

**需要注意的是**，只有在备份整个分区或整块硬盘时，才能支持 1～9 的增量备份级别；如
果只是备份某个文件或不是分区的目录，则只能使用 0 级别进行完全备份。

-v 显示过程

-j 和 tar 命令一样代表bz2格式压缩

-f  文件名    #指定备份后的文件名

-u  备份成功之后，把备份时间、备份级别以及实施备份的文件系统等信息，都记录在
    /etc/dumpdates 文件中；

-W  查询每个分区的备份情况

    /test/a/a.txt

    dump -0uf /home/a.bak /test/a

    DUMP: You can't update the dumpdates file when dumping a subdirectory




dump命令对于目录不支持增量备份，只能用0级别的全部备份



## restore

restore - restore files or file systems from backups made with dump


restore
    -f file

        Read the backup from file; file may be a special device file  like
            1. /dev/st0  (a  tape drive),
            2. /dev/sda1 (a disk drive),
            3. an ordinary file,
            4. or - (the standard input).
            5. If the name of the file is of the form host: file or user@host:
               file, restore  reads  from  the named file on the remote host
               using rmt(8) .

    -i

        This mode allows **interactive restoration of files from a dump**.
        After reading in the directory information from the dump, restore
        provides a shell like interface that allows the user  to  move around
        the directory tree selecting files to be extracted. The available
        commands are given below; for those commands that require an argument,
        the default is the current directory.


    restore -if /home/a.bak
