
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
