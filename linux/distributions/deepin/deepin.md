# Deepin

## 1. Install

首先使用 PE 工具把磁盘清空，这个 deepin 不太友好

safe graphics 没有显卡驱动

只设置/boot 和 / 分区即可

## dedit

ln -sf /bin/deepin-editor /bin/dedit

## Nvidia

lshw -numeric -C display

ERROR: The installation was canceled due to the availability or presence of an
alternate driver installation. Please see /var/log/nvidia-installer.log for
more details.


apt autoremove nvidia
apt autoremove nvidia-*

/etc/modprobe.d/blacklist.conf

blacklist nouveau
blacklist lbm-nouveau
options nouveau modeset=0
alias nouveau off
alias lbm-nouveau off

update-initramfs -u

lsmod | grep -i nouveau

systemctl stop lightdm

---

The installation was canceled due to the availability or presence of an alternate driver installation.
Please see /var/log/nvidia-installer.log for more details.

apt remove glx-alternative-nvidia
将所有看到的 nvidia 相关的包卸载

## 更改启动背景

设置 / General Setting / Boot Menu / 图片直接拖进去就行

并开启 `Theme`

## /boot/grub/grub.cfg

// 分辨率
set gfxmode=auto

// 延时

timeout, 默认是30s

## 全名

写在 /etc/passwd 中的 comment 字段中

确定是哪个桌面管理器可以看 /etc/passwd, gdm / lightdm


## Display

Night Shift: 自动色温

## browser

edge

## Video Player

apt install vlc

## Sound

Volume Boost : 音量增强

## File Manager

dde-file-manager

root 运行有问题

## deepin-lianliankan

卸载不了？

## ~/Picutres

Wallpapers -> /usr/share/wallpapers

## /usr/share/applications

## 玲珑

ll-cli

apt-cache search linglong


ll-cli list

    org.deepin.gomoku

ll-cli uninstall org.deepin.gomoku

查看 ll-cli 是哪个包的命令

    dpkg -S ll-cli -> linglong-bin

列出 linglong-bin 的所有

    dpkg -L linglong-bin


strings $(which ll-cli) | grep linglong | grep -v ^_ | less

findmnt


/persistent/linglong/config.json

sqlite /persistent/longlong/linglong.db
> .schema
> .output appInfoDbVersion



https://store-llrepo.deepin.com/repos/repo/refs/heads/



## Deepin-wine

[deepin wiki](https://wiki.deepin.org/zh/home)



## kshutdown

## deep-wine6-stable

/usr/bin/deepin-wine6-stable   a bash file

    win32 -> /opt/deepin-wine6-stable/bin/wine
    win64 -> /opt/deepin-wine6-stable/bin/wine64

都安装在了 /opt/app/ 下


## 查看 deepin 是基于哪个 debian 的

cat /etc/debian_version

10.10

## 手动安装 winehq

https://forum.winehq.org/viewtopic.php?f=8&t=32192

FAudio for Debian 10 and Ubuntu 18.04
Post by dimesio » Thu Mar 28, 2019 8:30 pm

2021-11-10 update: Beginning with Wine 6.21, FAudio is no longer a dependency of Wine, and users of the current winehq-devel and winehq-staging packages do not need to install it. Users on Debian 10 and Ubuntu 18.04 who wish to install a winehq-stable 6.0.x package will still need to install FAudio following the instructions below.

Original message:
Thanks to Cybermax, we have FAudio packages on the OBS for Debian 10 and Ubuntu 18.04. The WineHQ wine-devel and wine-staging packages for those distros are built against them and will require them as a dependency. Beginning with Wine 5.0, the wine-stable packages will also require FAudio.

Note: FAudio for Ubuntu 19.10 and later, and Debian bullseye and later, are provided by those distros. If you are unable to install them from your distro repository, ask for help on your distro's forum.

Because FAudio is not part of the Wine Project, the FAudio packages are not distributed from the download server here, but can be obtained directly from the OBS.

Debian 10: https://download.opensuse.org/repositor ... Debian_10/

Ubuntu 18.04 and Linux Mint 19.x: https://download.opensuse.org/repositor ... ntu_18.04/

The quickest and easiest way to satisfy the new dependency is to download and install both the i386 and amd64 libfaudio0 packages before attempting to upgrade or install a WineHQ package. By installing the downloaded packages locally, you will not have to add the OBS repository. This only has to be done once.

For users who prefer to add the OBS repository, see the detailed instructions in a post below.



如果是 debian10, 需要安装那些依赖
WineHQ 安装包安装于 Debian 10 或更新的版本时，会要求安装 libfaudio0 依赖

sudo dpkg --add-architecture i386

wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo mv winehq.key /usr/share/keyrings/winehq-archive.key

wget -nc https://dl.winehq.org/wine-builds/debian/dists/buster/winehq-buster.sources
sudo mv winehq-buster.sources /etc/apt/sources.list.d/

apt update
apt install --install-recommends winehq-stable

wine --version

第一次启动wine执行exe时或者执行`winecfg`时会自动跳出页面询问你是否下载，此时点击同意等待安装即可

最开始会生成一个默认的wine容器，其目录是/home/用户名/.wine,将执行程序文件放在该目录下，
再使用命令`wine 程序名.exe`即可执行。


winecfg

    - windows version: windows 10

    - Desktop Integration
        显示了 Windows 10 库中的文件夹和linux路径的映射关系

    - Drives
        驱动器映射路径


    如果中文乱码：
        把 simsun.ttc  zh.reg 放到 /home/xxx/.wine/drive_c/windows/Fonts
        terminal 执行 regedit zh.reg


desktop 启动文件路径：/usr/share/applications/

## hdr exr 看图软件

chaos palyer

卸载
    开始菜单 / uninstall xxx

## Quick Time Player

有 ubuntu 版本


## wine7.0 支持的软件

- Quick Time Player
- Chaos Player
- PFTrack(也有 centos7 版本, 收费), 3D 跟踪

## wine7.0 目前不支持的软件

腾讯会议，高版本打不开，低版本报错



## maya

Program Files/autodesk/maya2024/resources/I10n/zh_CN
    移动到 linux 上，简单修改下就可以中文

