
lsblk

cfdisk /dev/sda
    EFI分区：1G    type: efi, 假设 /dev/sda1
    swap分区:2G    type: swap 假设 /dev/sda2
    根分区：       type: linux, 假设  /dev/sda3

    mkfs.fat -F 32 /dev/sda1
    mkswap /dev/sda2
    mkfs.ext4 /dev/sda3

    mount /dev/sda3 /mnt
    mount --mkdir /dev/sda1 /mnt/boot
    swapon /dev/sda2

    // 国内源

        vim /etc/pacman.d/mirrorlist
        Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch 写在最前边

    // 安装基本的系统到硬盘

        pacstrap -K /mnt base linux linux-firmware base-devel linux-headers
        pacstrap -K /mnt base linux-zen linux-firmware base-devel linux-zen-headers
            linux 是内核, linux-zen 内核，linux-hardened，linux-lts

    // 把当前的挂载信息载入系统

        genfstab -U /mnt >> /mnt/etc/fstab

    // 进入刚刚创建好的系统内

        arch-chroot /mnt

    // 设置时区：

        ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

    // 更新硬件时间(生成了/etc/adjtime)

        hwclock --systohc

    // 安装 vim

        pacman -Sy
        pacman -Sy vim

    // 语言

        /etc/locale.gen
            将对应的语言前的注释去掉
            en_US.UTF-8 UTF-8

        locale-gen 重新配置加载 locale.gen

        echo "LANG=en_US.UTF-8" >> /etc/locale.conf

    // 主机名

        vim /etc/hostname
            

    // root 密码

        passwd root

    // 安装引导系统

        pacman -S grub efibootmgr

        vim /etc/default/grub
        取消最后一行 `GRUB_DISABLE_OS_PROBER=false`的注释

        UEFI引导
        #grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
        grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
        // 生成 GRUB 配置文件
        grub-mkconfig -o /boot/grub/grub.cfg


    // 网络

        pacman -S networkmanager dhcpcd
        systemctl enable NetworkManager

    // sshd

        pacman -Sy openssh
        systemctl enable sshd


    // 重启

        exit && reboot

    // aur 仓库(需要首先安装 archlinuxcn 源)

        pacman -Sy paru

## i3wm

### archlinuxcn 源

Arch Linux 中文社区仓库 是由 Arch Linux 中文社区驱动的非官方用户仓库。包含中文
用户常用软件、工具、字体/美化包等。

    /etc/pacman.conf 最后添加

    ```

    [archlinuxcn]
    Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch

    ```

    安装 archlinuxcn-keyring 包导入 GPG key

        pacman -Sy archlinuxcn-keyring

pacman -S xorg-server xorg-xinit

pacman -S zsh feh compton i3 xfce4-terminal


### xinitrc 配置

创建xinitrc配置（就是复制，这个文件是startx启动时读取，下面只能有一行exec）

cp /etc/X11/xinit/xinitrc   /home/username/.xinitrc


## mate desktop

### 什么是 MATE 桌面?

当 GNOME 桌面从 GNOME 2 改变方向到 GNOME 3 时，改变了用户交互和界面，MATE 桌面
仍然延续了“较旧的”或者说“传统的” GNOME 2 的开发方向。因此，MATE 桌面环境保留了
Linux 中的传统桌面体验。它速度快，内存消耗低。在我看来，MATE 桌面环境是一个被低
估的桌面环境，需要更多的关注！

MATE 团队一直在继续开发，它是一个基于 GNOME 2 的流行桌面之一，但同时支持更新的
技术。你可以在其[官方网站](https://mate-desktop.org/)上了解更多信息。


### 安装 Xorg 服务器、显示管理器、MATE 桌面组件、控制器包以及其他应用程序

1. 安装 Xorg。安装大小大约为 80 MB。

    pacman -S --needed xorg

    ```

    pacman -S --needed xorg
    :: There are 48 members in group xorg:
    :: Repository extra
       1) xf86-video-vesa  2) xorg-bdftopcf  3) xorg-docs  4) xorg-font-util
       5) xorg-fonts-100dpi  6) xorg-fonts-75dpi  7) xorg-fonts-encodings  8) xorg-iceauth
       9) xorg-mkfontscale  10) xorg-server  11) xorg-server-common  12) xorg-server-devel
       13) xorg-server-xephyr  14) xorg-server-xnest  15) xorg-server-xvfb  16) xorg-sessreg
       17) xorg-setxkbmap  18) xorg-smproxy  19) xorg-x11perf  20) xorg-xauth
       21) xorg-xbacklight  22) xorg-xcmsdb  23) xorg-xcursorgen  24) xorg-xdpyinfo
       25) xorg-xdriinfo  26) xorg-xev  27) xorg-xgamma  28) xorg-xhost  29) xorg-xinput
       30) xorg-xkbcomp  31) xorg-xkbevd  32) xorg-xkbutils  33) xorg-xkill  34) xorg-xlsatoms
       35) xorg-xlsclients  36) xorg-xmodmap  37) xorg-xpr  38) xorg-xprop  39) xorg-xrandr
       40) xorg-xrdb  41) xorg-xrefresh  42) xorg-xset  43) xorg-xsetroot  44) xorg-xvinfo
       45) xorg-xwayland  46) xorg-xwd  47) xorg-xwininfo  48) xorg-xwud

    Enter a selection (default=all):

    ```

2. 安装显示管理器和 MATE 桌面组件。安装大小大约为 380 MB。

    pacman -S --needed mate mate-extra ttf-freefont lightdm lightdm-gtk-greeter

    ```

    :: There are 14 members in group mate:
    :: Repository extra
       1) caja  2) marco  3) mate-backgrounds  4) mate-control-center  5) mate-desktop  6) mate-icon-theme  7) mate-menus
       8) mate-notification-daemon  9) mate-panel  10) mate-polkit  11) mate-session-manager  12) mate-settings-daemon  
       13) mate-themes 14) mate-user-guide

    Enter a selection (default=all):

    ---

    :: There are 23 members in group mate-extra:
    :: Repository extra
        1) atril  2) caja-image-converter  3) caja-open-terminal  4) caja-sendto  5) caja-share  6) caja-wallpaper
        7) caja-xattr-tags 8) engrampa  9) eom  10) mate-applets  11) mate-calc  12) mate-icon-theme-faenza
        13) mate-media  14) mate-netbook 15) mate-power-manager  16) mate-screensaver  17) mate-sensors-applet
        18) mate-system-monitor  19) mate-terminal 20) mate-user-share  21) mate-utils  22) mozo  23) pluma

    Enter a selection (default=all):



    在 Arch Linux 中，很多时候 lightdm 显示管理器需要额外的配置才能正常启用。可
    以参考：[LightDM - ArchWiki](https://wiki.archlinux.org/title/LightDM)。除
    此之外，可以安装 lightdm-gtk-greeter-settings来对 lightdm-gtk-greeter 进行
    配置。

    ```

3. 安装应用软件：

    AUR Helper

    ```
    git clone https://aur.archlinux.org/yay-git.git
    cd yay
    makepkg -si
    ```

    这只是一个参考。你也可以安装你所需要的内容。

    pacman -S --needed firefox vlc filezilla leafpad xscreensaver archlinux-wallpaper

    pacman -Sy rsync


    ```
    pacman -Sy go
    yay -S google-chrome
    ```
