
https://forums.linuxmint.com/viewtopic.php?t=178626

/var/log/bootstrap.log

cdebootstrap 

    builds a basic Debian system of SUITE (e.g. etch, lenny, sid)
    into TARGET using the source specified in MIRROR.[...] The complete log is
    saved as /var/log/bootstrap.log in the new system.


http://manpages.ubuntu.com/manpages/impish/en/man1/cdebootstrap.1.html


http://www.bitsavers.org/pdf/dec/pdp7/




When a modern PC starts, the CPU begins loading instructions from a predefined,
standard address in memory(FFFF0, in hexadecimal). This memory location points
to the beginning of the BIOS, which then chooses(or lets us choose) a boot
device.




## centos 修改CentOS内核启动顺序

查看CentOS系统中内核数量与名字

    cat /boot/grub2/grub.cfg |grep menuentry

查看当前系统的默认启动内核名字

    grub2-editenv list

    saved_entry=CentOS Linux (3.10.0-1160.90.1.el7.x86_64) 7 (Core)

得到了当前启动的内核名字就可以做个判断了，启动的对不对，是不是出问题的内核。如
果有问题，那么可以通过修改默认启动内核的命令来修改，继续。

将默认启动内核修改成CentOS Linux (3.10.0-693.2.2.el7.x86_64) 7 (Core)这个

    grub2-set-default "CentOS Linux (3.10.0-693.2.2.el7.x86_64) 7 (Core)"


1. yum updat 可以升级内核
2. linux内核版本可以是多个，默认使用第一个引导，可以修改使用旧内核引导
3. 内核可以卸载
    rpm -qa | grep kernel #查看系统中的全部内核
    yum remove kernel-x.xx.x #卸载对应内核版本
