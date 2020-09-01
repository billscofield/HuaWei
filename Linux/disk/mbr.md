备份MBR：

    dd if=/dev/sda1 of=/root/mbr bs=512 count=1

恢复MBR：

    dd if=/root/mbr of=/dev/sda1 bs=512 count=1

恢复分区表：

    dd if=/root/mbr of=/dev/sda1 bs=512 skip=446 count=66

注：mbr大小512 所以bs=512 count=1

bs=512 skip=446 count=66 用来确定分区表在备份文件中的位置


55AA



分区的时候 0,2048, 不能选，是因为这个是系统的 loader 所在


grub1版本

    ll /boot/grub/stage1 是 linux 自己的 loader, 将其放到 mbr 的 loader, 446字节

    grub 的内置文件系统是依靠 stage1_5 这些文件定义的
        exfat.stage1_5

    而后开始读取 stage2, 开始真正的读取配置文件 grub.conf, 解析 /boot/grub/grub.conf
        (grub2：/boot/grub/grub.cfg      /etc/default/grub)

        splashimage(hd0,0)/grub/splash.xpm.gz   图片
            
            grub 用 hd 表示, 从零开始

            initrd /initramfs-2.6.32-642.el6.x86_64.img         存在内存中的系统 init ramfs


    /lib/modules/内核版本名/       内核模块



    /sbin/init

    /etc/rc.d/rc.sysinit    系统初始化脚本，设置主机名, 挂载/etc/fstab 等

    /etc/rc.d/rc 脚本

        /etc/rcN.d 下的 K 开头的全部杀掉
        /etc/rcN.d 下的 S 开头的全部开启

        每一个 rcN.d 目录内最后都会有一个 S99local 文件，指向 ../rc.local 脚本(空)

    /etc/rc.d/rc.local
        系统根据 runlevel 执行完 /etc/rc.d/rcN.d 中的脚本后，调用 /etc/rc.d/rc.local
        可以写我们要启动的脚本


    /sbin/mingetty 启动终端




https://space.bilibili.com/480933314/video
