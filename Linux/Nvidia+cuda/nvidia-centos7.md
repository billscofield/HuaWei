
## 检查显卡的识别状况

在执行下述所有步骤之前，必须确保当前系统已经正确识别到 NVIDIA 的显卡，否则在显卡没有被正常识别的情况下，
执行后续的安装步骤都是徒劳的。此时可以执行以下命令，若可以输出相关信息，则说明显卡能被系统正常识别。否
则请重新插拔显卡，或者检查主板是否需要跳线或者设置 BIOS 才能正确识别独立显卡。

> lspci | grep "NVIDIA"


## 安装软件依赖

> yum -y install gcc gcc-c++ wget


## 安装 NVIDIA 显卡检测工具

```
导入key
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org

安装elrepo源
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm

安装检测工具
yum install nvidia-detect

检测显卡，正常情况下会输出最新且适用当前显卡的驱动程序的版本号信息
nvidia-detect -v

提示：不建议使用rpmfusion安装Nvidia的显卡驱动，因为开源的显卡驱动在性能方面跟Nvidia官方的闭源显卡驱动有一定的差距
```

## 下载 NVIDIA 驱动程序

根据显卡检测结果，在 NVIDIA 官网下载对应版本的 Linux 显卡驱动程序。


## 屏蔽系统自带的 Nouveau 显卡驱动

通过vim编辑器更改配置文件，按照以下内容进行修改

```
vim /lib/modprobe.d/dist-blacklist.conf

blacklist nouveau               #添加此行
options nouveau modeset=0       #添加此行
# blacklist nvidiafb            #将nvidiafb的这一行注释掉

```

## 重建 initramfs image

```
备份
mv /boot/initramfs-$(uname -r).img /boot/initramfs-$(uname -r).img.bak

重建
dracut /boot/initramfs-$(uname -r).img $(uname -r)

```


## 重启系统

```
修改系统运行级别为纯文本模式
systemctl set-default multi-user.target

重启系统
reboot

系统重启完成后，在纯文本模式下使用root用户登录进系统

查看nouveau显卡驱动是否已经被禁用，若此命令执行完之后没有输出相关信息，则说明已经被禁用
lsmod | grep nouveau

如果没有显示相关的内容，说明已禁用。

```


## 安装 NVIDIA 显卡驱动（纯文本模式下）

```
文件授权
chmod +x NVIDIA-Linux-x86_64-384.59.run

安装显卡驱动
./NVIDIA-Linux-x86_64-384.59.run

安装过程中，选择accept；如果提示是否编译DKMS模块，选择yes（方便以后升级系统内核）；如果提示要修改xorg.conf，选择yes；

查看显卡驱动的安装状态，若此命令执行完之后正常输出显卡状态相关的信息，则说明Nvidia显卡驱动安装成功
nvidia-smi

修改系统运行级别为图形模式
systemctl set-default graphical.target

重启系统
reboot

重启完成后，若成功进入GNOME的桌面环境，执行此命令可以调出图形界面来配置显卡（可选操作）
nvidia-settings

```


## 卸载 NVIDIA 显卡驱动（可选操作）

如果显卡驱动安装和系统重启完成后，无法正常进入 GHOME 的桌面环境，此时可以在另一台机器上通过远程 SSH 使用 root 用户登录进系统，
然后手动执行以下命令卸载 NVIDIA 的显卡驱动程序（在纯文本模式下）。特别注意：当 NVIDIA 的显卡驱动被卸载后，需要启用系统自带的 
Nouveau 显卡驱动 和 还原 initramfs image，否则系统会因缺少显卡驱动而无法正常显示。

> ./NVIDIA-Linux-x86_64-430.40.run --uninstall


## 系统内核更新问题

如果系统更新内核并重启后，显示器无法显示 GNOME 桌面环境（一般是因为显卡驱动丢失导致显示器无法显示桌面环境，但大多数情况下 Centos 
系统已经启动成功），此时可以在另一台机器上通过 SSH 远程登录进旧的 Centos 系统，然后按照上面的步骤重新安装 NVIDIA 的显卡驱动（如果
安装程序提示显卡驱动已存在，手动卸载显卡驱动后，再重新安装即可）。

## 主板启用独立显卡

一般的桌面主板（家用）可以自动检测到独立显卡并启用，但是部分主板（例如服务器主板），则需要在 BIOS 里将板载显卡或者 CPU 的核显屏蔽掉，
个别品牌可能需要通过主板跳线的方式屏蔽板载显卡或者 CPU 的核显。超微的服务器主板一般需要在 BIOS 里设置板载显卡的屏蔽，否则独立显卡
无法正常识别。启用独立显卡之后，超微的部分服务器主板在系统刚启动的时候，显示器不会显示任何内容（黑屏 + 无信号输出）；因为服务器主板
开机自检的耗时较长，此时一般需要耐心等待几十秒甚至更久，显示器才会显示硬件自检和系统启动相关的信息。

## 补充说明

一般情况下，只要 Centos 系统可以正常识别到 NVIDIA 的显卡，同时显示器与 NVIDIA 的显卡正确连接上；那么即使不安装 NVIDIA 的显卡驱动程序，
在系统启动的时候，显示器都可以正常显示硬件自检和系统启动相关的信息（可能会延时显示）；唯一的问题是在系统正常启动完成后，显示器没办法
显示 GNOME 桌面环境。


## nvidia-smi 命令输出的信息


https://www.techgrow.cn/posts/3a164cac.html



在安装一台 dell 服务器的  rtx 4000 显卡驱动，只能使用 NVIDIA-Linux-x86_64-418.88.run ， 其他版本的驱动均安装不上, 无语

run 文件可以用 vim 打开，里边部分代码是加密的


/usr/share/doc/NVIDIA_GLX-1.0/README.txt    这个是 nvidia 的 manual
