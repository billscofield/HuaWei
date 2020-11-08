
## snaps 介绍

Snaps 是由 Canonical 公司为 Ubuntu 开发的，并随后移植到其他的 Linux 发行版，如 Arch、Gentoo、Fedora 等等。
由于一个 snap 包中含有软件的二进制文件和其所需的所有依赖和库，所以可以在无视软件版本、在任意 Linux 发行版上安装软件。

Snaps本质上是与其依赖项一起压缩的应用程序，以及如何在安装它们的系统上运行和与其他软件交互的描述。Snaps是安全的，它们主要设计为沙箱并与其他系统软件隔离。

不管底层系统如何，Snaps都可轻松安装，升级，降级和移除。因此，Snaps很容易安装在任何基于Linux的系统上。 Canonical甚至正在开发Snaps作为Ubuntu的物联网设备和称为Ubuntu Core的大型容器部署的新包装媒体。 


## 主要操作

### 安装

apt install snapd


### 搜索snap软件包

snap find

snap find <软件包>

### 安装snap软件包

snap install <package-name>

### 更新已安装的snap包，请按名称指定包。

$ sudo snap refresh package-name
