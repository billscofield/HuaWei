
## snaps 介绍

Snaps 是由 Canonical(开发ubuntu的公司) 公司为 Ubuntu 开发的，并随后移植到其他的 Linux 发行版，如
Arch、Gentoo、Fedora 等等。

由于一个 snap 包中含有软件的二进制文件和其所需的所有依赖和库，所以可以在无视软
件版本、在任意 Linux 发行版上安装软件。

类似于 mac

Snaps本质上是与其依赖项一起压缩的应用程序，以及如何在安装它们的系统上运行和与其
他软件交互的描述。Snaps是安全的，它们主要设计为沙箱并与其他系统软件隔离。

不管底层系统如何，Snaps都可轻松安装，升级，降级和移除。因此，Snaps很容易安装在
任何基于Linux的系统上。 Canonical甚至正在开发Snaps作为Ubuntu的物联网设备和称为
Ubuntu Core的大型容器部署的新包装媒体。 


安装 snap

    apt install snapd

## 主要操作

1. 增

    snap install <package-name>
        
        --channel=


2. 删

    snap remove <snap软件包名>

3. 改 更新已安装的snap包，请按名称指定包。

    snap refresh package-name

    即使安装了软件，也可以更改 channel , 然后进行更新
        
        snap refesh --channel=XXX   vlc

    还原到原来的版本
        
        snap revert XXX

4. 查 
    
    snap find <软件包>                      // 搜索snap服务器上的软件包

    snap info <软件包>                      // 应该是从服务器查询的结果

    snap list                               // 列出本计算机上所有已经安装的snap软件



可以在 https://snapcraft.io 上搜索软件
