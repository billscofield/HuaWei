
## centos6.8

光盘 / rescue installed system

原来的系统根目录会挂载到 /mnt/sysimage

chroot /mnt/sysimage

exit
reboot

## centos7

Troubleshooting / rescue a CentOS System

原来的系统根目录会挂载到 /mnt/sysimage

chroot /mnt/sysimage

## 前 446 字节

1. 弄坏前 446 字节

    查看前 512 个字节
        hexdump -C -n 512 /dev/sda

    dd if=/dev/zero of=/dev/sda bs=1 count=446

2. 重启电脑

    进光盘，secue 模式

    chroot /mnt/sysimage

    将引导写入 446 字节(centos6)
    grub-install /dev/sda

    将引导写入 446 字节(centos7)
    grub2-install /dev/sda

    exit && reboot

## 删除了 /boot/grub2/grub.cfg(centos7)

删除了 /boot/grub/grub.cfg(centos6)

rm -rf /boot/grub2

重启

进 secue 模式

chroot /mnt/sysimage

grub2-install /dev/sda 此时还没有 grub.cfg 配置文件

生成 grub.cfg

    cd /boot/grub2
    grub2-mkconfig -o /boot/grub2/grub.cfg

    centos6 需要手动创建这个文件

exit && reboot

## 
