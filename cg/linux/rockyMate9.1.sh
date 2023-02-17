#!/usr/bin/env bash
# Author: Bill Scofield
# Ctime : 2023-02-01
# Description:	
#


# 更换国内源
#
sed -e 's|^mirrorlist=|#mirrorlist=|g' \
    -e 's|^#baseurl=http://dl.rockylinux.org/$contentdir|baseurl=https://mirrors.ustc.edu.cn/rocky|g' \
    -i.bak \
    /etc/yum.repos.d/rocky-extras.repo \
    /etc/yum.repos.d/rocky.repo

dnf makecache


dnf install -y rsync
dnf install -y expect
dnf install -y vim

dnf install -y dnf-utils


# 自动挂载服务器盘
yum install -y autofs
yum install -y nfs-utils
rsync -av /root/initial/config/autofs/auto.nfs /etc/
rsync -av /root/initial/config/autofs/autoefx.nfs /etc/

echo '/mnt /etc/auto.nfs'>>/etc/auto.master



systemctl enable autofs --now
ln -sf /mnt/output /output



# stop selinux

setenfore 0

grep -w "SELINUX=disabled" /etc/selinux/config
if [ $? -ne 0  ];then
    sed -i '/^SELINUX=/d' /etc/selinux/config
    echo "SELINUX=disabled" >>/etc/selinux/config
fi


# firewalld
systemctl disable firewalld --now


# ssh
systemctl enable sshd --now
mkdir -p /root/.ssh/ && chmod 700 /root/.ssh
# 添加公钥



# development tools
#dnf group list
dnf groupinstall "Development Tools"


dnf install -y git
dnf install -y tree
dnf install -y wget
dnf install -y tmux
dnf install -y iftop
dnf install -y nethogs
dnf install -y terminator
#dnf install -y guake   // no this package






# vlc
dnf install epel-release rpmfusion-free-release
dnf install vlc


# microsoft edge
# https://idroot.us/install-microsoft-edge-rocky-linux-9/
dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/edge
rpm --import https://packages.microsoft.com/keys/microsoft.asc
dnf install -y microsoft-edge-stable


# pidgin
# https://pidgin.im/development/building/2.x.y/
tar xjvf pidgin-2.x.y.tar.bz2
cd pidgin-2.x.y
./configure && make && sudo make install
# You must have GLib 2.16.0 or newer development headers installed to build.
# If you have these installed already you may need to install pkg-config



# libreoffice
yum install -y libreoffice-*


## input
dnf install -y ibus ibus-libpinyin
#加入系统启动，方法是：设置=>会话和启动=>加入路径 /usr/bin/ibus-demon
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
dnf install -y im-chooser

# virtualbox
dnf install epel-release -y
dnf install wget curl gcc make perl bzip2 dkms kernel-devel kernel-headers  -y

dnf config-manager --add-repo=https://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo
dnf search virtualbox
dnf install -y VirtualBox









# houdini
rsync -av /root/initial/packages/personalconfig/houdini/.sesi_licenses.pref /etc/skel/
yum install -y libnsl


# shotgun
echo "10.0.0.234 shotgun.zhuiguang.com">>/etc/hosts





# dcv
# nothing provides libcrypto.so.10()(64bit) needed by nice-xdcv-2019.1.226-1.el7.x86_64
dnf install compat-openssl11
# 没有10的版本



# 显卡
sed -i 's/quiet/quiet nouveau.modeset=0/' /etc/default/grub
grub2-mkconfig -o /boot/grub2/grub.cfg
systemctl stop lightdm


# shutter
dnf install -y snapd
systemctl enable --now snapd.socket
ln -s /var/lib/snapd/snap /snap
snap install shutter


# shotgrid rv
yum install -y tcsh
yum install -y mesa-libGLU

libgcrypt.so.11: cannot open shared object file: No such file or directory

# python2.7.5



# maya2022

yum install -y libpng libpng-devel

#libssl.so.10
# 在具有正常1.0版本的同版本机器：
# scp libcrypto.so.1.0.2k <目标机器>/lib64/
# scp libssl.so.1.0.2k <目标机器>/lib64/
#
# # 在问题机器上恢复链接
# cd /lib64/
# ls -l libcrypto.*
# ln -sf libssl.so.1.0.2k libssl.so.10
# ln -sf libcrypto.so.1.0.2k libcrypto.so.10
# https://199604.com/1710


# libXp.so.6
yum install -y libXp-1.0.3-11.el9

#D-Bus library appears to be incorrectly set up: see the manual page for dbus-uuidgen to correct this issue. (UUID file '/var/lib/dbus/machine-id' should contain a hex string of length 32, not length 36, with no other text; UUID file '/etc/machine-id' should contain a hex string of length 32, not length 36, with no other text)
#   D-Bus not built with -rdynamic so unable to print a backtrace




# nuke
