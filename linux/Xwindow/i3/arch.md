# arch & i3

pacman -Sy xorg

pacman -Sy i3

    There are four members in group i3:
    1) i3-wm 2) i3locks 3) i3lock 4) i3status
    default=all

    ttf-font(There are 8 providers for ttf-font)

## 更改按键

xorg提供了修改硬件屏幕亮度,键盘键位…的很多文件。

    pacman -S xorg

    evtest

    systemd-hwdb update && udevadm trigger

## 软件

pacman -Sy dmenu


