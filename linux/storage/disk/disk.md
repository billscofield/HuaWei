# disk

## 寻址方式

### CHS

需要分别存储CHS的三个参数(称为3D参数)
Cylinder: 10bit 柱面地址
Header:   8bit  磁头地址
Sector:   6bit  存储扇区地址
一个扇区 512B

这样使用CHS寻址一块应按最大容量为 256 × 1024 × 63 × 512B = 8064 MB

### LBA

Logical Block Addressing

LBA编址方式将CHS这种三维寻址方式转变为一维的线性寻址，它把硬盘所有的物理扇区的
C/H/S 编号通过一定的规则转变为一线性的编号，系统效率得到大大提高，避免了繁琐的
磁头/柱面/扇区的寻址方式。在访问硬盘时，由硬盘控制器再将这种逻辑地址转换为实际
硬盘的物理地址

DG显示的255个磁头数只是逻辑磁头而已

#### 疑问:

那也就是还是需要3D参数喽? 那3D参数的大小应该扩大了吧?

## 硬盘技术

### 叠瓦式磁记录 Shingled Magnetic Recording, 简称 SMR

采用了磁道重叠技术

技术原理是：利用读磁头的宽度低于写磁头的特性，把整个磁道的宽度则设计成读磁头的
宽度。

在实际应用当中，SMR硬盘的读取功能和传统硬盘一样，但是数据写入的效率则远远低于传
统硬盘。

SMR磁道

    +-----------------------+
  写| 读取                  |
    -------------------------
  入|                       |
    +-----------------------+

传统磁道

    +-----------------------+
  写|                       |
    -------------------------
      读取
    -------------------------
  入|                       |
    +-----------------------+

## sata

https://zh.wikipedia.org/wiki/SATA

带宽速度换算

需要注意的是，在一些新的技术标准中，为了防止数据在高速传输中出错而加入校验码，
比如PCI-E 2.0、USB 3.0和SATA 3.0中采用的是8/10编码，每10位编码中只有8位是真实数
据，这时单位换算就不再是1:8而是1:10，USB 3.0的5Gbps速度实际上是理论500MB/s而非
理论625MB/s，SATA 6Gbps的理论速度则是600MB/s而非750MB/s。


所谓3Gb/s的算法，3000MHz的频率x每次发送一个数据x 80%(8b/10b的编码) / 8 bits per
byte = 300MBytes/s，同理1.5Gb/s也是这样可算成150MB/s，也就是一般我们在买硬盘时
，有时候会看到SATA 150MB/s / 300MB/s，有时候又会看到SATA 1.5Gb/s / 3Gb/s的缘故
。

以USB 3.0而言，它拥有5Gbps的带宽，每次发送一个数据x 80%(8b/10b的编码) / 8 bits
per byte = 500MBytes/s，所以USB 3.0的带宽比SATA 3.0的600MB/s还来的小。

版本            带宽    理论速度    编码
SATA Express    16Gb/s  1969MB/s    128b/130b
SATA 3.0        6Gb/s   600MB/s     8b/10b
SATA 2.0        3Gb/s   300MB/s     8b/10b
SATA 1.0        1.5Gb/s 150MB/s     8b/10b

1、sata其实是scsi体系里抽取出的一部分，也就是说scsi能兼容sata，但sata反过来就不
行。

2、scsi本质上还是为服务器准备的磁盘系统，它非常强调所有的控制可以由scsi体系自己
完成，不需要cpu控制，所以scsi非常省资源，而sata需要cpu介入控制传输过程。

## dm-0

centos 中

https://qastack.cn/superuser/131519/what-is-this-dm-0-device

## 查看 uuid

UUID (globally unique identifier)，唯一的身份识别

ll -a /dev/disk/by-uuid

或者

blkid

ubuntu 添加了一块硬盘后会自动挂载，如果不想让其自动挂载可以:

vi /etc/fstab

uuid号  挂载点  ext4    noauto  0   0卷标  挂载点  ext4    noauto  0   0

## 为什么硬盘用10进制

International System of Units (SI)

International Electronical Commission (国际电子委员会)

为了设计和制造的方便，不是故意弄虚作假。在计算机里，10跟引脚可以表示2的10次方即
1024，20跟引脚可以表示2的20次方。硬盘是磁道，没有必要麻麻烦烦地用1024为单位，直
接以1000计算更方便。

相对来说，因为 NAND 存储芯片一开始是小容量使用，计算机使用二进制，寻址直接用 2
的多少次方便于读取数据，而正好对齐 2 的多少次方是一件很“省脑子”的行为。所以
NAND 从一开始就是按照二进制来设计存储器容量。硬盘一开始是为了压榨存储容量，尽可
能多的存储数据，从以前几百K的硬盘开始就是如此。所以硬盘一个碟片能实现多少容量，
要看技术，而不是看设计了。但是因为硬盘容量的需求不同，需要弹性化的提供不同容量
的硬盘，那么硬盘一般就是看自己实现的容量多少，之后取整凑数方便。所以硬盘按10进
制，主要还是为了便于计算。比如硬盘单碟 2T ，那么一面就是 1T ，4T 就是双碟装，8T
就是 4 碟装。并不需要凑 2 的多少次方来便于寻址，硬盘有自己的寻址规范。这个寻址
规范，好像是3个还是4个参数组成，你只要让硬盘凑满后面两个参数，前面的那个数字就
是 10 进制涨上去的。当然，现在的寻址已经不是这种方式了，但是本身还是有“传统”在
里面延续。

https://www.zhihu.com/question/29936422

Storage companies use decimal prefixes (such as kilo-, mega-, giga-, tera-,
etc.) rather than binary prefixes (kibi-, mebi-, gibi-, tebi-, etc.) because it
simplifies marketing and communication with customers. Using decimal prefixes
makes the numbers easier to understand for non-technical people and aligns with
the way most people understand numbers.

However, this practice can lead to confusion when comparing storage capacity
reported by the manufacturer to the actual capacity reported by the operating
system or other software that uses binary prefixes. This is because the decimal
prefixes used by the manufacturer denote units based on powers of 10, whereas
the binary prefixes used by the operating system denote units based on powers
of 2. As a result, a storage device advertised as having a capacity of 1
terabyte (TB) by the manufacturer may only appear as around 931 gigabytes (GB)
in the operating system.

## 硬盘信息检查工具

smartmontools - control and monitor storage systems using S.M.A.R.T.

    smartctl -a /dev/sda

## 硬盘测试工具

macos
    aja system test lite
    Blackmagic Disk Speed Test

windows: 
    CrystalDiskMark
    IOMeter

Linux:
    Fio
    dd

## MBPS(吞吐率)

代表一个硬盘内每秒传输的数据量。如果要衡量一个硬盘的连续读写速度，使用大文件进
行测试并以MB/s为单位计算出其吞吐量便能很好地展现出其在连续读写上的能力。

## IOPS

IOPS是指单位时间内系统能处理的I/O请求数量，一般以每秒处理的I/O请求数量为单位，
I/O请求通常为读或写数据操作请求。

随机读写频繁的应用，如小文件存储(图片)、OLTP数据库、邮件服务器，关注随机读写性
能，IOPS是关键衡量指标。

顺序读写频繁的应用，传输大量连续数据，如电视台的视频编辑，视频点播VOD(Video On
Demand)，关注连续读写性能。数据吞吐量是关键衡量指标。

但是在日常使用和游戏中，碰见像游戏下载等大文件读写的机会其实是少之又少的，我们
遇到的更多是随机读取情况，比如系统调用和游戏加载等。于是在这个时候，运用吞吐量
来衡量一个硬盘随机读取的性能便显得有说欠缺，因为一般来说这些数据区块在体积上都
比较小，因此我们要考虑的便不是这个硬盘能够在一秒内搬多少东西，而是在一秒内可以
搬多少次。所以，这就是IOPS诞生的原因。

一个硬盘的随机读取IOPS主要由其主控和接口决定。在测试硬盘随机读取性能上，大部分
软件会使用4KB大小的数据区块作为测试基准。

    以希捷酷鱼510系列固态硬盘为例，由于其搭载的主控支持NVMe 1.3协议，所以在4KB
    随机读取上可达到100,096 IOPS，写入上也高达896,000 IOPS。

    相比之下，使用SATA规范的固态硬盘只有60,000 IOPS左右，因此这也是NVMe固态硬盘
    缘何越来越受欢迎的原因。
