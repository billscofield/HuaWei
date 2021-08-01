#!/usr/bin/bash 
# Author:	Bill Scofield 
# Ctime:	2021-06-02
# Description:	


#------------------------BEGIN ppa------------------------------
# debian 默认没有安装 add-apt-repository 命令

apt install software-properties-common
#------------------------END ppa------------------------------






apt install -y git curl wget tmux tree iftop rsync  build-essential cmake


# collects your Linux system information and display it on the terminal next to
# an image
apt install -y neofetch


apt install -y build-essential


#------------------------BEGIN terminal------------------------------
# terminal
# the command to use is urxvt
apt install -y rxvt-unicode

# CHANGE THE DEFAULT TERMINAL-EMULATOR
# THE DEFAULT WOULD BE /usr/bin/lxterm, WE CAN CHANGE TO /usr/bin/urxvt
update-alternatives --config x-terminal-emulator

#------------------------BEGIN terminal------------------------------

# ELINKS
apt install -y elinks


# SAR IS INVOLVED IN SYSSTAT
apt install -y sysstat


# SUDO 
apt install -y sudo


# STRACE
apt install -y strace


# NMAP
apt install -y nmap


# NETSTAT
apt install -y net-tools


apt install -y netdiscover

# NSLOOKUP 
apt install -y dnsutils


# TO DOWNLOAD MY CONFIG FILES
mkdir -p /git/software
git clone https://gitee.com/billscofield/ubuntuMate-config.git /git/ubuntuMate-config


#------------------------BEGIN ZSH & OH-MY-ZSH------------------------------
# ZSH
apt install -y zsh
chsh -s $(which zsh)


# INSTALL oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

mv /root/.zshrc /root/.zshrc.bak
ln -s /git/ubuntuMate-config/.zshrc /root/.zshrc

#------------------------END ZSH & OH-MY-ZSH------------------------------

# tmux 配置
ln -s /git/.tmux.conf ~/

# autojump
git clone git://github.com/joelthelion/autojump.git /git/software/autojump
python /git/software/autojump/install.py

# xmodmap
apt-get install -y x11-xserver-utils


# 安装 NFS客户端
apt-get install -y nfs-common

# ntfs 支持
apt install -y ntfs-3g ntfs-3g-dev


# 桌面环境
apt install -y xorg-server xorg-xinit 
apt install -y xserver-xorg-input-evdev xserver-xorg-input-kbd
apt install -y xinit


apt install -y i3 feh compton
ln -s /git/ubuntuMate-config/config.i3 /root/.config/i3/config -f

apt install i3lock-fancy


# 
apt install -y ranger


#------------------------BEGIN cmus------------------------------

# Music player cmus
# It won't work from the repo, so you should install it from source
#apt install -y cmus

apt install libsystemd-dev

# NOTE: pay attention to the output 

#./configure CONFIG_PULSE=y CONFIG_ROAR=n DEBUG=2
# sed -i 's/CONFIG_ROAR = y/CONFIG_ROAR = n/' config.mk
# make -j 8
# make install 
# cmus
# :set output_plugin=pulse

#------------------------END cmus------------------------------


#------------------------BEGIN vlc----------------------------
apt install vlc

# "VLC is not supposed to be run as root. Sorry. If you need to use real-time
# priorities and/or privileged TCP ports you can use vlc-wrapper (make sure it
# is Set-UID root and cannot be run by non-trusted users first)."

sed -i 's/geteuid/getppid/' /usr/bin/vlc

#------------------------END vlc----------------------------


# whois   CNNIC(中国互联网络信息中心)
# port 43 TCP
apt-get install -y whois


# screen record
apt install asciinema




# PDF 
# zathura, It offers a vim-like experience and has a focus on keyboard
# interaction.  The key bindings, commands and most other settings can be
# customized.
apt install zathura




#------------------------BEGIN VIM ------------------------------
## install dependencies
## 1. X11 header files
## I myself first installed a package "libgrafx11-1-dev", having no idea if
##this works

apt install -y libx11-dev libxt-dev

## 2. terminal library
## The ./configure installation prompts while having not install this, prompt
##"libncurses-dev"
apt install libncurses-dev
git clone https://gitee.com/billscofield/vim.git /git/software/vim

## 3. Install python3-dev, otherwise there will no python3-config-dir
apt install python3-dev

## configure vim source and install


make install -j 4

# vundle
# git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://gitee.com/billscofield/vundle.vim.git ~/.vim/bundle/Vundle.vim

#------------------------END VIM ------------------------------


# input method
#apt-get install -y fcitx

#wget http://cdn2.ime.sogou.com/dl/index/1571302197/sogoupinyin_2.3.1.0112_amd64.deb
#apt install -y sogoupinyin_2.3.1.0112_amd64.deb
#apt install -f
#apt install -y sogoupinyin_2.3.1.0112_amd64.deb
#fcitx-autostart
#reboot
#fcitx-configtool or fcitx-config-gtk3

# ibus
apt install ibus ibus-pinyin

# 切换到ibus框架
im-config
#或者 im-config -s ibus


# 然后需要切换为 python2 

ibus-setup

# 配置 urxvt 支持 ibus
# Urxvt.inputMethod:ibus





#------------------------BEGIN MySQL ------------------------------

apt install -y ffmpeg

# If you want virtual camera support you need v4l2loopback-dkms installed. You
# can install it with the following command :
apt install -y v4l2loopback-dkms

apt install -y obs-studio

#------------------------BEGIN MySQL ------------------------------



#------------------------BEGIN Download Tools ------------------------------
apt install -y aria2
#https://github.com/ziahamza/webui-aria2
git clone https://gitee.com/billscofield/webui-aria2.git /git/software/webui-aria2
#------------------------END Download Tools ------------------------------




#------------------------BEGIN MySQL ------------------------------


apt install mycli

#------------------------END MySQL ------------------------------


#------------------------BEGIN texlive ------------------------------ #texlive
#是由国际TEX用户组（TEXUsers Group，TUG）整理和发布的TEX软件发行套装，包含与TEX
#系统相关的各种程序、编辑与查看工具、常用宏包及文档、常用字体及多国语言支持。

apt install texlive-full
#------------------------END texlive ------------------------------



# excellent tools
##------------------------ BEGIN geogebra ------------------------------
## 免费的数字工具, 用于课堂活动, 绘图计算, 几何作图, 白板协作等等
apt-get install geogebra
##------------------------ END geogebra ------------------------------



#-------------------------------NETWORK BEGIN-------------------------------
apt install libpcap-dev
apt install tcpdump

#---
apt install wireshark
#-------------------------------NETWORK END-------------------------------


