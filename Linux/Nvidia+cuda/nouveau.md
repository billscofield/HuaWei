nouveau [nuvεl] 法语:
    新出现的, 初次显露的;新创的;新制成的

The nouveau project aims to build high-quality, free/libre software drivers for nVidia cards. “Nouveau” [nuvo] is the French word for “new”. Nouveau is composed of a Linux kernel KMS driver (nouveau), Gallium3D drivers in Mesa, and the Xorg DDX (xf86-video-nouveau). The kernel components have also been ported to NetBSD.


Xort 针对 NVIDIA 公司的显卡提供了 nouveau 这个驱动模块


## linux内核的modeset=0 或者 nomodeset参数的作用是什么啊?

字符界面也可以打开bai framebuffer 来提供 2D 加速，图形显示du的功能。不过有的时候如果有问题，内核还会继续设置显示模式而导致显示不正常。
这个时候这个命令就让内核不再去设置显示模式而保证系统还可以进入字符界面。不过当然就是标准的显示状态了，至少能用的显示状态。

T470 竟然有独立显卡
    lspci | grep -Ei '(vga|nvidia|display)'

    00:02.0 VGA compatible controller: Intel Corporation HD Graphics 620 (rev 02)
    02:00.0 3D controller: NVIDIA Corporation GM108M [GeForce 940MX] (rev a2)

    不过 Nvidia 的官网并没有提供 Linux 版本64bit 驱动，仅有32bit 驱动
