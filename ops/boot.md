## BIOS and COMS

它是内置在主板的BIOS固件，电脑开机后由它通过读取 CMOS RAM 上的内容参数 初始化硬件然后搜索一个引导设备来启动，如硬盘、U盘或光驱等启动设备来启动相应的系统软件。

BIOS软件是存储在主板的BIOS芯片上的，这块芯片是只读（ROM）的，意味着即使电脑断电，芯片里的内容还是会保留不变的。

这些设置需要保存在一个可以修改的芯片上，就是RAM（Random Access Memory随机存储器）芯片。
这个芯片就是CMOS（Complementary Metal Oxide Semiconductor互补金属氧化物半导体）芯片。
CMOS芯片有个特点是断电之后数据会丢失，所以主板上都配有时钟电路（带有3V纽扣电池）来给CMOS芯片供电以保证数据不丢失。

## MBR 和 GRUB

MBR:Master Boot Record
GRUB:GRand Unified Bootloader

每块硬盘都有且只有一个这个东西

1. 零柱面 零磁头 1扇区 中的前446字节, 
1. 剩下另外的64个字节用于存储“硬盘分区表”DPT(Disk Partition Table)，
1. 最后两个字节“55，AA”是分区表结束的标志。
这个整体构成了硬盘的主引导扇区。


mbr是计算机最先执行的硬盘上的程序，但只有512字节大小。因为只有512字节，不能载入操作系统的核心，所以只能先载入一个可以载入计算机核心的程序，这个程序叫做引导程序。

grub就是一个引导程序(boot loader)
不同的操作系统都有其对应的boot loadr，如windows 的叫ntldr，linux的就有很多了，有grub grub2，Syslinux等

一般用windows的默认安装的引导程序即可，但是因为一个硬盘上可能有多个不同的系统（windows,linux,mac等），而windows的引导程序只能引导windows系列，所以都会有grub这样的可以识别多种系统的通用型的引导程序。

所以，和win的引导相比，grub的优势就是能引导多种系统。



活动分区这个概念主要是存在于Windows下，linux则没有这个概念。

因为window要将一个主分区设置为活动分区，然后将系统安装在这个被标记为活动分区的主分区上，这样windows的引导程序——ntldr才能判断windows系统被装在哪里了，然后再跳到该分区上引导系统


多系统引导

按下F2或DEL然后在BOOT菜单中选择这些硬件的启动顺序,
BIOS完成任务后，把指针指向了MBR, **该MBR就是你在BIOS的BOOT启动顺序所选择的安装了操作系统的 *那个设备的* MBR**

BIOS怎么知道MBR的地址?
    有一个硬件中断INT13会告诉BIOS外设的MBR地址。看看，看看！软件并不是万能的，它不能解决所有问题，软硬件结合才能最好的完成任务。

如何知道我的硬盘/U盘/光盘上有没有安装操作系统?
    首先，对于windows，之前我们讲到它要求一个主分区设置为活动分区，并把windows操作系统安装在该主分区。这个时候，windows的引导程序ntldr就会寻找到活动分区，并加载系统文件到内存。

    如果MBR上安装的是grub2，那么它就默认提供3大功能：
        A.提供**一块硬盘上所有安装的系统的选择菜单**
        B.**载入操作 linux 系统内核，移交控制权给内核**
        C.**将控制权移交给其他系统的boot loader**

    也就是说在grub2启动，在屏幕上呈现出操作系统的选择菜单，如果你并没有选择linux，而是选择了windows那么grub2就会把控制权交给ntldr，进而启动windows操作系统。


boot loader 最主要的作用就是识别自己的操作系统文件，并将它载入到内存


一块硬盘只有一个MBR，那么你装上了grub2之后，就不能再装windows的ntldr了，如果没有ntldr就载入不了windows的系统文件，启动不了系统。但现在我们很多人的电脑上都有双系统，那是怎么做到的呢？

每个分区都有一个引导扇区（boot sector）。那么当你把系统安装在某个分区时，它同时也会在该分区的 boot sector上安装它自己的boot loader。
因为一个分区只能装一个系统（注意是分区，不是一块硬盘），这样该分区上的系统就可以被该分区的 boot sector 上的 boot loader 引导了，不会有其他系统的 loader 来抢占这个位置。
但windowns除了在自己所在分区的boot sector上安装自己的boot loader，它还会在硬盘的MBR上也装上一份（linux的brub2不会这样）。所以，如果你先安装了linux，再装windows，那么最后MBR上就是ntldr，它是不会将控制权转交给别个系统的loader的，所以你也就启动不了linux。如下图所示：

---

安装启动引导器的设备
如果你要用Ubuntu的引导器代替Windows的引导器，就选 /dev/sda。
如果你要保留Windows的引导器，就选 /boot分区，但这样一来，装完Ubuntu重启后，只能启动Windows，还必须在Windows上面安装Easybcd、Grub4dos等等之类软件来添加Ubuntu启动项。


vmlinuz是可引导的、压缩的内核。“vm”代表“Virtual Memory”
Linux能够使用硬盘空间作为虚拟内存，因此得名“vm”。vmlinuz是可执行的Linux内核，它位于/boot/vmlinuz

initrd是“initial ramdisk”的简写。initrd一般被用来临时的引导硬件  到实际内核vmlinuz能够接管并继续引导的状态

???
/boot 就是放到这个分区的引导扇区了吗?应该不是
启动引导器设备如果是 /dev/sda 就是把 Grub 安装到了 MBR 中，那本分区中的引导扇区呢? 因为 MBR 的 BootLoader 要读取每一个分区的 引导扇区，所以这个分区也应该安装了 grub, 

---
GRUB的配置文件和内核在/boot分区
/BOOT和MBR不存在包含关系。GRUB第一阶段需要去MBR中去读引导程序，
**GRUB第二阶段需要到/boot分区读系统内核和配置文件。**
https://blog.csdn.net/wjc19911118/article/details/52052989


mbr中的启动程序的任务就是**在分区表中找到这个启动分区，然后将执行权力交给启动分区的引导程序，**至于这个引导程序如何做，那就交给操作系统的设计者来完成了，可以直接启动操作系统，也可以在启动操作系统前完成一些别的工作。



