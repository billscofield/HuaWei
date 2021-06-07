#!/usr/bin/bash 
# Author:	Bill Scofield 
# Ctime:	2021-06-02
# Description:	

apt install -y git curl wget tmux tree iftop rsync 


# collects your Linux system information and display it on the terminal next to an image
apt install -y neofetch


# terminal
# rxvt-unicode
apt install -y build-essential


# sysstat 包含了 sar 
apt install sysstat


# zsh
apt install zsh
chsh -s $(which zsh)


# netstat
apt install -y net-tools

# nslookup 
apt install -y dnsutils


mkdir /gitstore
git clone https://gitee.com/billscofield/ubuntuMate-config.git /gitstore/ubuntuMate-config

# 安装 oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# tmux 配置
ln -s /gitstore/.tmux.conf ~/

# 安装 NFS客户端
apt-get install nfs-common

# ntfs 支持
apt install -y ntfs-3g ntfs-3g-dev


# 桌面环境
apt install -y xorg-server xorg-xinit 
apt install -y xserver-xorg-input-evdev xserver-xorg-input-kbd
apt install -y xinit


apt install -y i3 feh compto
ln -s /gitstore/ubuntuMate-config/config.i3 /root/.config/i3/config -f

apt install i3lock-fancy


apt install -y ranger


#apt install cmus



# vim


