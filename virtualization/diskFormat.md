https://www.cnblogs.com/lsgxeva/p/9565813.html

## raw

(default) the raw format is a plain binary image of the disc image, and is very
portable. On filesystems that support sparse files, images in this format only
use the space actually used by the data recorded in them.

老牌的格式了，用一个字来说就是裸，也就是赤裸裸，你随便dd一个file就模拟了一个raw
格式的镜像。由于裸的彻底，性能上来说的话还是不错的。目前来看，KVM和XEN默认的格
式好像还是这个格式。因为其原始，有很多原生的特性，例如直接挂载也是一件简单的事
情。裸的好处还有就是简单，支持转换成其它格式的虚拟机镜像对裸露的它来说还是很简
单的（如果其它格式需要转换，有时候还是需要它做为中间格式），空间使用来看，这个
很像磁盘，使用多少就是多少（du -h看到的大小就是使用大小），但如果你要把整块磁盘
都拿走的话得全盘拿了（copy镜像的时候），会比较消耗网络带宽和I/O。接下来还有个有
趣的问题，如果那天你的硬盘用着用着不够用了，你咋办，在买一块盘。但raw格式的就比
较犀利了，可以在原来的盘上追加空间：

    dd if=/dev/zero of=zeros.raw bs=1024k count=4096（先创建4G的空间）

    cat foresight.img zeros.raw > new-foresight.img（追加到原有的镜像之后）

当然，好东西是吹出来的，谁用谁知道，还是有挺多问题的。由于原生的裸格式，不支持
snapshot也是很正常的。传说有朋友用版本管理软件对raw格式的文件做版本管理从而达到
snapshot的能力，估计可行，但没试过，这里也不妄加评论。但如果你使用LVM的裸设备，
那就另当别论。说到LVM还是十分的犀利的，当年用LVM做虚拟机的镜像，那性能杠杠的。
而且现在好多兄弟用虚拟化都采用LVM来做的。在LVM上做了很多的优化，国外听说也有朋
友在LVM增量备份方面做了很多的工作。目前来LVM的snapshot、性能、可扩展性方面都还
是有相当的效果的。目前来看的话，备份的话也问题不大。就是在虚拟机迁移方面还是有
很大的限制。但目前虚拟化的现状来看，真正需要热迁移的情况目前需求还不是是否的强
烈。虽然使用LVM做虚拟机镜像的相关公开资料比较少，但目前来看牺牲一点灵活性，换取
性能和便于管理还是不错的选择。

对于LVM相关的特性及使用可以参考如下链接：

http://www.ibm.com/developerworks/linux/library/l-lvm2/index.html


## cow

copy-on-write format, supported for historical reasons only and not available
to QEMU on Windows曾经qemu的写时拷贝的镜像格式，目前由于历史遗留原因不支持窗口
模式。从某种意义上来说是个弃婴，还没得它成熟就死在腹中，后来被qcow格式所取代。

## qcow

the old QEMU copy-on-write format, supported for historical reasons and
superseded by qcow2

一代的qemu的cow格式，刚刚出现的时候有比较好的特性，但其性能和raw格式对比还是有
很大的差距，目前已经被新版本的qcow2取代。其性能可以查看如下链接：

http://www.linux-kvm.org/page/Qcow2

## qcow2

QEMU copy-on-write format with a range of special features, including the
ability to take multiple snapshots, smaller images on filesystems that don’t
support sparse files, optional AES encryption, and optional zlib compression

现在比较主流的一种虚拟化镜像格式，经过一代的优化，目前qcow2的性能上接近raw裸格
式的性能，这个也算是redhat的官方渠道了，哈哈，希望有朋友能拍他们砖：

https://fedoraproject.org/wiki/Features/KVM_qcow2_Performance

对于qcow2的格式，几点还是比较突出的，qcow2的snapshot，可以在镜像上做N多个快照：

    1. 更小的存储空间，即使是不支持holes的文件系统也可以（这下du -h和ls -lh看到
       的就一样了）

    1. Copy-on-write support, where the image only represents changes made to
       an underlying disk image（这个特性SUN ZFS表现的淋漓尽致）

    1. 支持多个snapshot，对历史snapshot进行管理

    1. 支持zlib的磁盘压缩

    1. 支持AES的加密

## vmdk 

VMware 3 & 4, or 6 image format, for exchanging images with that product

VMware的格式，这个格式说的蛋疼一点就有点牛X，原本VMware就是做虚拟化起家，自己做
了一个集群的VMDK的pool，做了自己的虚拟机镜像格式。又拉着一些公司搞了一个OVF的统
一封包。从性能和功能上来说，vmdk应该算最出色的，由于vmdk结合了VMware的很多能力
，目前来看，KVM和XEN使用这种格式的情况不是太多。但就VMware的Esxi来看，它的稳定
性和各方面的能力还是可圈可点。


## vdi

VirtualBox 1.1 compatible image format, for exchanging images with VirtualBox.

SUN收购了VirtualBox，Oracle又收购了SUN，这么说呢，vdi也算虚拟化这方面的一朵奇葩
，可惜的是入主的两家公司。SUN太专注于技术（可以说是IT技术最前端也不为过），
Oracle又是开源杀手（mysql的没落）。单纯从能力上来说vdi在VirtualBox上的表现还是
不错的。也是不错的workstation级别的产品。
