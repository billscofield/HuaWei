# Rocky

## 下载地址

https://dl.rockylinux.org/vault/rocky/

## app source

    sed -e 's|^mirrorlist=|#mirrorlist=|g' -e 's|^#baseurl=http://dl.rockylinux.org/$contentdir|baseurl=https://mirrors.aliyun.com/rockylinux|g' -i.bak /etc/yum.repos.d/Rocky-*.repo

    dnf makecache

## development tools

dnf group list

dnf group install -y "Development Tools"

dnf update 和 dnf upgrade 一样?

dnf -y install rpmconf yum-utils

rpmconf -a

dnf install -y rsync wget vim curl git unrar p7zip

## epel

和 centos 的一样？

dnf config-manager --set-enabled crb
dnf -y install epel-release

```
sed -e 's!^metalink=!#metalink=!g' \
    -e 's!^#baseurl=!baseurl=!g' \
    -e 's!https\?://download\.fedoraproject\.org/pub/epel!https://mirrors.cernet.edu.cn/epel!g' \
    -e 's!https\?://download\.example/pub/epel!https://mirrors.cernet.edu.cn/epel!g' \
    -i /etc/yum.repos.d/epel*.repo
```

yum install dkms

dnf install -y autofs


## nvidia

yum install -y epel
// yum -y install gcc kernel-devel "kernel-devel-uname-r == $(uname -r)" // == 已经废弃
yum -y install gcc kernel-devel "kernel-devel-uname-r = $(uname -r)"
yum install kernel-headers
yum install -y dkms

rpm -qa | grep -E "kernel-devel|kernel-headers"

[link](https://blog.csdn.net/yhl18931306541/article/details/129141060)
/usr/lib/modprobe.d/dist-blacklist.conf
/etc/modprobe.d/dccp-blacklist.conf
/etc/modprobe.d/blacklist-nouveau.conf
/etc/modprobe.d/blacklist.conf
/lib/modprobe.d/dist-blacklist.conf
    blacklist nouveau


mv /boot/initramfs-$(uname -r).img{,.ori}
dracut /boot/initramfs-$(uname -r).img $(uname -r)
这个貌似出错了，重启卡死在字符界面

---

bash -c "echo blacklist nouveau >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
dracut --force #更新内核

reboot
lsmod | grep nouveau

```
WARNING: This NVIDIA driver package includes Vulkan components, but no Vulkan ICD loader was detected on this
system. The NVIDIA Vulkan ICD will not function without the loader. Most distributions package the
Vulkan loader; try installing the "vulkan-loader", "vulkan-icd-loader", or "libvulkan1" package.
```
dnf install vulkan-loader

```
ERROR: Failed to run `/usr/sbin/dkms install --no-depmod -m nvidia -v 525.116.04 -k 4.18.0-477.21.1.el8_8.x86_64`:
    nvidia.ko.xz:
    Running module version sanity check.
    Module version 525.116.04 for nvidia.ko.xz
    exactly matches what is already found in kernel 4.18.0-477.21.1.el8_8.x86_64.
    DKMS will not replace this module.
    You may override by specifying --force.

    nvidia-uvm.ko.xz:
    Running module version sanity check.
    Module version 525.116.04 for nvidia-uvm.ko.xz
    exactly matches what is already found in kernel 4.18.0-477.21.1.el8_8.x86_64.
    DKMS will not replace this module.
    You may override by specifying --force.

    nvidia-modeset.ko.xz:
    Running module version sanity check.
    Module version 525.116.04 for nvidia-modeset.ko.xz
    exactly matches what is already found in kernel 4.18.0-477.21.1.el8_8.x86_64.
    DKMS will not replace this module.
    You may override by specifying --force.

    nvidia-drm.ko.xz:
    Running module version sanity check.
    Module version 525.116.04 for nvidia-drm.ko.xz
    exactly matches what is already found in kernel 4.18.0-477.21.1.el8_8.x86_64.
    DKMS will not replace this module.
    You may override by specifying --force.

    nvidia-peermem.ko.xz:
    Running module version sanity check.
    Module version 525.116.04 for nvidia-peermem.ko.xz
    exactly matches what is already found in kernel 4.18.0-477.21.1.el8_8.x86_64.
    DKMS will not replace this module.
    You may override by specifying --force.
    Error! Installation aborted.

```
