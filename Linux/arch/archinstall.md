


iw wlp scan | grep SSID

wpa_passphrase  essid名称 密码 > wlanssid.conf      (wpa_supplicant)

wpa_supplicant -c wlanssid.conf -i wlp网卡名 &

sudo dhcpcd


---

或者

不懂的就去问 archwiki

pacman -S networkmanager
systemctl enable NetwortManager
systemctl start NetwortManager

pacman -S nm-connection-editor
pacman -S network-manager-applet        //托盘图标

systemctl restart NetwortManager

nohup nm-applet &

alacritty    //终端

find / -name "*alacritty*"  //寻找配置文件

cp /usr/share/doc/alacritty/example/alacritty.yml   ~/.config/alacritty/        调整字体


sudo pacman -Ss brightnessctl       //屏幕亮度

pacman -S tlp   //省电
sudo tlp start


pacman -Ss python

pacman -S v2ray         代理软件

pacman -S vlc
pacman -S mplayer

pacman -S bind-tools    (nslookup)


pacman -Ss grub-customizer

打开 /etc/pacman.conf 中的 [multilib]

添加清华大学源

pacman -Ss screenkey(需要先安装下边这个)
pacman -S archlinuxcn-keyring





设置安装时的字体

    setfont /usr/share/kbd/consolefonts/一个字体文件

更改键盘布局
    
    loadkeys colemak    //colemak 键盘布局

更改键盘按键

    vim keys.conf       //什么名字都行
    ```
    keycode 1 = Caps_Lock   //1:Esc
    keycode 58 = Escape     //58:Caps_Lock
    ```
    loadkeys keys.conf

vim
    vi ~/.vimrc
    ```
    syntax on
    set et
    set ts=4
    set shiftwidth=4

    ```

配置网络

    ifconfig ens18 inet 192.168.200.120 netmask 255.255.255.0 boradcase 192.168.200.255

    vim /etc/resolv.conf    //设置dns

    route add default gw 192.168.200.254




## 源

/etc/pacman.conf

取消对 #Color 的注释, 安装软件的时候的日志是有颜色的


[core]
Include = /etc/pacman.d/mirrorlist

[extra]
Include = /etc/pacman.d/mirrorlist

[tyextra]
Include = /etc/pacman.d/mirrorlist



vi /etc/pacman.d/mirrorlist

搜索所有的 #China, 放到最上边


## 安装

pacstrap

mount /dev/sda2 /mnt        // 根目录
mkdir /mnt/boot             
mount /dev/sda1 /mnt/boot   //引导

pacstrap /mnt base base-devel linux linux-firmware

    genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc

exit

vim /mnt/etc/local.gen
/en_US.UTF-8 UTF-8
arch-chroot /mnt
locale-gen              //根据/mnt/etc/local.gen 生成


vim /mnt/etc/
    LANG=en_US.UTF-8


vim /mnt/hostname
vim /mnt/etc/hosts


arch-chroot /mnt
passwd                  //创建密码


pacman -S grub efibootmgr intel-ucode os-prober
mkdir /boot/grup
grub-mkconfig > /boot/grub/grub.cfg
grub-install --target=x86_64-efi --efi-directory=/boot



pacman -S vi zsh wpa_supplicant dhcpcd
exit

reboot

拔U盘


pacman -Syyu        //更新

pacman -S man 

useradd -m -G wheel david

passwd david

vi /etc/sudoers

    去掉注释 # %wheel ALL=(ALL) ALL

su - david

sudo pacman -Syyu


## 图形界面

sudo pacman -S xorg xorg-server

sudo pacman -S i3    //kde gnome deepin


pacman -Ss fcitx
sudo pacman -S fcitx-im
pacman -Ss pinyin
sudo pacman -S fcitx-sunpinyin
fcitx                           //启动fcitx,右下角
sudo pacman -S chromium
mod + f 全屏模式

pacman -Ss wqy                  //安装字体

vi ~/.config/i3/config
    bindsym $mod+b exec "chromium"



