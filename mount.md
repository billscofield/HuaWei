
## -o cp936 关于挂载时乱码
CP936和UTF-8本身和Python是毫无关联的。 
CP936其实就是GBK，IBM在发明Code Page的时候将GBK放在第936页，所以叫CP936。

至于GBK，百度百科就说的很清楚了：GBK全称《汉字内码扩展规范》（GBK即“国标”、“扩展”汉语拼音的第一个字母，英文名称：Chinese Internal Code Specification） ，中华人民共和国全国信息技术标准化技术委员会1995年12月1日制订，国家技术监督局标准化司、电子工业部科技与质量监督司1995年12月15日联合以技监标函1995 229号文件的形式，将它确定为技术规范指导性文件。这一版的GBK规范为1.0版。 
而UTF-8： UTF-8（8-bit Unicode Transformation Format）是一种针对Unicode的可变长度字符编码，又称万国码。由Ken Thompson于1992年创建。现在已经标准化为RFC 3629。UTF-8用1到6个字节编码UNICODE字符。用在网页上可以同一页面显示中文简体繁体及其它语言（如英文，日文，韩文）。

所以GBK和UTF-8简单的来说，区别就是编码方式不同，表示的文字范围不同。（UTF-8能表示更多的语言文字，更加通用）在Python里面，你需要注意你Python本身是否声明了字符编码类型（尤其是Py 2x），例如：#-- coding: UTF-8 -- 
以及，你是如何从外部文件或者网页读入字符的，他们的源编码类型是什么

https://blog.csdn.net/qq_35664774/article/details/79436991



mount [-t vfstype] [-o options] device dir

　　1. -t vfstype 指定文件系统的类型，通常不必指定。mount 会自动选择正确的类型。常用类型有：
    　　光盘或光盘镜像：iso9660
    　　DOS fat16文件系统：msdos
    　　Windows 9x fat32文件系统：vfat
    　　Windows NT ntfs文件系统：ntfs
    　　Mount Windows文件网络共享：smbfs
    　　UNIX(LINUX) 文件网络共享：nfs

　　2. -o options 主要用来描述设备或档案的挂接方式。常用的参数有：
    　　loop：用来把一个文件当成硬盘分区挂接上系统
    　　ro：采用只读方式挂接设备
    　　rw：采用读写方式挂接设备
    　　iocharset：指定访问文件系统所用字符集

　　3.device 要挂接(mount)的设备。

　　4.dir设备在系统上的挂接点(mount point)。


http://www.abcde.cn/knowledgebase/293/idc/Tejiachuxiao.html



## 为什么umount的时候老显示 device busy？
这是因为有程序正在访问这个设备，最简单的办法就是让访问该设备的程序退出以后再umount。可能有时候用户搞不清除究竟是什么程序在访问设备，如果用户不急着umount，则可以用:
CODE:
    umount -l /mnt/hda5
来卸载设备。选项 –l 并不是马上umount，而是在该目录空闲后再umount。

还可以先用命令 ps aux 来查看占用设备的程序PID，然后用命令kill来杀死占用设备的进程，这样就umount的非常放心了。

1. 方法一：
    fuser -m -v /nfs_old/
              用户  进程号  权限   命令
    /nfs_old/:   root  2699    ..c..  bash
                 root  2999    ..c..  su

    如上所示，有两个进程占用了，将其kill掉，再重新取消挂载。
    kill -9 2699 2999
    umount /nfs_old/

1. 方法二：
    umount  -l  /nfs_old/


1. 方法三：
    fuser -km /nfs_old/

https://www.cnblogs.com/webnote/p/6043434.html

## blkid主要用来对系统的块设备（包括交换分区）所使用的文件系统类型、LABEL、UUID等信息进行查询。

所以mount 的 -t 可以通过blkid进行查询


## 查看uuid

ls -l /dev/disk/by-uuid


## umount
-f --force
-l --lazy
-n --no-mtab

/etc/mtab 查看挂载的文件

umount [-fn] 设备文件名或挂载点

开机自动挂载
想要开机自动挂载，只需要在 /etc/fstab 文件里按照它的格式加上就行。

umount -fl


## 重新挂载 /home 分区

1.把新挂载的4T硬盘进行分区和格式化


2.创建目录
sudo mkdir /media/home

3.把/dev/sdb1挂载到/media/home
sudo mount /dev/sdb1 /media/home

4.同步/home到/media/home，同步时间根据数据量大小决定，建议在系统空闲时操作
sudo rsync -aXS /home/. /media/home/.

5.同步完成后重命名/home
sudo mv /home /home_old

6.新建/home
sudo mkdir /home

7.取消/dev/sdb1挂载
sudo umount /dev/sdb1

8.重新挂载/dev/sdb1到home
sudo mount /dev/sdb1 /home

9.查看/dev/sdb1的UUID
blkid



10.把UUID复制下来，修改/etc/fstab文件，实现开机自动挂载
sudo gedit /etc/fstab

在文件最后添加如下内容：

    UUID=8da46012-ab9c-434f-a855-2484112fd1a7 /home ext4 defaults,nodev,nosuid 0 2 


11.保存之后重启系统，查看分区的挂载情况
df –h



12.确认一切正常后删除/home_old
sudo rm -rf /home_old

至此，给/home增加空间的工作就完成了。

https://www.cnblogs.com/saszhuqing/p/8716644.html

## 关于 挂载附加选项

nodev, nosuid, and noexec are fstab options/(flags?) that can improve security of partitions.

It would be ideal if config directives are present in diskimage-builder, to allow an operator to set those values during image building.

rational for each option:

The nodev mount option prevents files from being interpreted as character or block devices. The only legitimate location for device files is the /dev directory located on the root partition. The only exception to this is chroot jails, for which it is not advised to set nodev on these filesystems.

The nosuid mount option can be used to prevent execution of setuid programs from partitions such as temp.

Allowing users to execute binaries from world-writable directories such as /tmp should never be necessary in normal operation and can expose the system to potential compromise.The noexec mount option can be used to prevent binaries from being executed out of /tmp

Each of the above is also requirement in security compliance governance bodies, such as CIS, DISA-STIG etc.



## 挂载 windows 共享文件夹

mount -t cifs //192.168.1.1/共享文件夹名  /挂载目录  -o username=administrator,password=12345,vers=2.0


redhat 要求windows主机必须开启:

    SMB 1.0/CIFS 文件共享支持

        SMB 1.0/CIFS 服务器

        SMB 1.0/CIFS 客户端

        SMB 1.0/CIFS 自动删除

    并写上版本, vers=2.0, 否则报错：Host is down

    必要时关闭防火墙
















