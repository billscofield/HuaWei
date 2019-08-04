M.2接口，是一种新的主机接口方案，可以兼容多种通信协议，如sata、PCIe、USB、HSIC、UART、SMBus等。

M.2接口是为超极本（Ultrabook）量身定做的新一代接口标准，以取代原来的mSATA接口。无论是更小巧的规格尺寸，还是更高的传输性能，M.2都远胜于mSATA

M.2接口有两种类型：
    Socket 2（B key——ngff）支持SATA、PCI-E X2接口，而如果采用PCI-E x2接口标准，最大的读取速度可以达到700MB/s，写入也能达到550MB/s。
    Socket 3（M key——nvme）可支持PCI-E x4 接口，理论带宽可达4GB/s。


M.2这个接口的插槽端一共分为两种设计，
一种是支持“B key”的插槽，短的一段在左边，采用6pin设计；

另一种是支持“M key”的插槽，短的一段在右边。采用5pin设计。
采用b key的M.2插槽比较低端，只能走SATA或PCI-E X2通道，而采用M key的插槽就要高端一些了，走的是PCI-E X4通道。

http://tieba.baidu.com/p/5611611174

https://blog.csdn.net/hbcbgcx/article/details/85090700


## 首先认识下 host adapter 主控
In computer hardware, a host controller, host adapter, or host bus adapter (HBA) connects a computer, which acts as the host system, to other network and storage devices.[1] The terms are primarily used to refer to devices for connecting SCSI, Fibre Channel and SATA devices.[2] Devices for connecting to IDE, Ethernet, FireWire, USB and other systems may also be called host adapters.

Host adapters can be integrated in the motherboard or be on a separate expansion card.[3]
    说明是一种硬件

The term network interface controller (NIC) is more often used for devices connecting to computer networks, while the term converged network adapter can be applied when protocols such as iSCSI or Fibre Channel over Ethernet allow storage and network functionality over the same physical connection.

## AHCI 

The Advanced Host Controller Interface (AHCI) is a technical standard defined by Intel that specifies the operation of Serial ATA (SATA) host controllers in a non-implementation-specific manner in its motherboard chipsets.




AHCI 也好，IDE 也好，NVMe 也好，各种模式，需要相应的芯片去支持, 软件是建立在硬件的基础上的
