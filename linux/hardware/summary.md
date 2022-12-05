
parallel / ˈpærəlel / 同时发生的；（计算机）并行的；并联的

[link](https://en.wikipedia.org/wiki/Parallel_ATA#IDE_and_ATA-1)

ATA(Advanced Technology Attachment)

Parallel ATA (PATA), originally AT Attachment, also known as IDE, is a standard
interface designed for IBM PC-compatible computers. It was first developed by
Western Digital and Compaq in 1986 for compatible hard drives and CD or DVD
drives. The connection is used for storage devices such as hard disk drives,
floppy disk drives, and optical disc drives in computers.


IDE(Integrated Drive Electronic) 电子集成驱动器

    它的本意是指把“硬盘控制器”与“盘体”集成在一起的硬盘驱动器。把盘体与控制器集成在
    一起的做法减少了硬盘接口的电缆数目与长度，数据传输的可靠性得到了增强，硬盘制造
    起来变得更容易，因为硬盘生产厂商不需要再担心自己的硬盘是否与其它厂商生产的控制
    器兼容。对用户而言，硬盘安装起来也更为方便。




ATA硬盘是传统的桌面级硬盘，通常也被称为IDE(Integrated Drive Electronics)硬盘，
这是一种并行总线硬盘，转速为7200RPM，主流容量通常有80GB、250GB等。ATA 发展至今
经过多次修改和升级，每新一代的接口都建立在前一代标准之上，并保持着向后兼容性。
到目前为止，一共推出 7 个版本：

    ATA-1 、 ATA-2 、 ATA-3 、 ATA-4 、 ATA-5 、ATA-6 、 ATA-7 。

ATA-7 是 ATA 接口的最后一个版本，也叫 ATA133 。 ATA133 支持133 MB/s 数据传输速度。


## SATA（Serial ATA）

SATA口的硬盘又叫串口硬盘，从名称上我们就可以看出来这种类型的硬盘是ATA硬盘的升级
版（可能 不太严谨）！这种硬盘采用点对点的连接方式，支持热插拔

版本        带宽        速度        数据线最大长度
SATA3.0     6Gb/s       600MB/s     2米
SATA2.0     3Gb/s       300MB/s     1.5米
SATA1.0     1.5Gb/s     150MB/s     1米
PATA        1Gb/s       133MB/s     0.5米


## SCSI（Small Computer System Interface）

SCSI 直译为小型计算机系统专用接口。它是一种连接主机和外围设备的接口，支持包括硬
盘、光驱及扫描仪在内的多种设备。**SCSI 总线是一种并行总线**，常用于企业级存储领域。
其优点是适应面广，性能高，硬盘转速快（15000RPM），缓存容量大，CPU占用率低，扩展
性远优于IDE硬盘，并且支持热插拔。

SCSI占用CPU极低，在多任务系统中占有着明显的优势。由于SCSI卡本身带有CPU，可处理
一切SCSI设备的事务，在工作时主机CPU只要 向SCSI卡发出工作指令，SCSI卡就会自己进
行工作，工作结束后返回工作结果给CPU，在整个过程中，CPU均可以进行自身工作。


## SAS（Serial Attached SCSI）

SAS跟SATA 硬盘有点类似，都是采用串行技术以获得更高的传输速度。SAS 的接口技术可
以向下兼容SATA 。具体来说，二者的兼容性主要体现在物理层和协议层的兼容。在物理层，
SAS 接口和SATA 接口完全兼容，**SATA 硬盘可以直接使用在SAS 的环境中**，从接口标准上
而言，SATA 是SAS 的一个子标准，因此SAS 控制器可以直接操控SATA 硬盘，但是SAS 却
不能直接使用在SATA 的环境中，SATA 控制器并不能对SAS 硬盘进行控制。SAS是一种全双
工、点对点、双端口的接口。


## FC(Fiber Channel)

FC即为光纤通道技术，最早应用于SAN （存储局域网络）
