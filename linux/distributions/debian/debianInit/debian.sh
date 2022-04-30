#!/usr/bin/bash 
# Author:	Bill Scofield 
# Ctime:	2021-06-02
# Description:	


#------------------------BEGIN ppa------------------------------
# debian 默认没有安装 add-apt-repository 命令

apt install -y software-properties-common
#------------------------END ppa------------------------------






apt install -y git curl wget tmux tree iftop build-essential cmake

apt install -y rsync inotify-tools





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
apt install -y ndiff


# NETSTAT
apt install -y net-tools


apt install -y netdiscover

# NSLOOKUP 
apt install -y dnsutils

# expect
apt install -y expect


# TO DOWNLOAD MY CONFIG FILES
mkdir -p /git/
git clone https://gitee.com/billscofield/debian-config.git /git/debian-config


#------------------------BEGIN ZSH & OH-MY-ZSH------------------------------
# ZSH
apt install -y zsh
chsh -s "$(which zsh)"


# INSTALL oh-my-zsh
# sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


git clone https://gitee.com/billscofield/oh-my-zsh ~/.oh-my-zsh
mv /root/.zshrc /root/.zshrc.bak
ln -s /git/debian-config/.zshrc /root/.zshrc

#------------------------END ZSH & OH-MY-ZSH------------------------------

# tmux 配置
ln -s -f /git/debian-config/.tmux.conf ~/.tmux.conf

# tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm




#------------------------BEGIN autojump------------------------------
# git clone git://github.com/joelthelion/autojump.git /git/software/autojump
git clone https://gitee.com/billscofield/autojump.git /git/software/autojump
python /git/software/autojump/install.py
#------------------------END autojump------------------------------


# xmodmap
apt-get install -y x11-xserver-utils
ln -s /git/debian-config/.xmodmap ~/.xmodmap


# 安装 NFS客户端
apt-get install -y nfs-common

# ntfs 支持
apt install -y ntfs-3g ntfs-3g-dev


# 桌面环境
apt install -y xorg-server xorg-xinit 
apt install -y xserver-xorg-input-evdev xserver-xorg-input-kbd
apt install -y xinit


apt install -y i3 feh compton
ln -s /git/debian-config/config.i3 /root/.config/i3/config -f

apt install -y i3lock-fancy


# ranger file manager
apt install -y ranger
ranger --copy-config=all
echo "map     cv console shell vim%space">>"${HOME}"/.config/ranger/rc.conf


#------------------------BEGIN cmus------------------------------

# Music player cmus
# It won't work from the repo, so you should install it from source
#apt install -y cmus

apt install -y libsystemd-dev

# NOTE: pay attention to the output 

#./configure CONFIG_PULSE=y CONFIG_ROAR=n DEBUG=2
# sed -i 's/CONFIG_ROAR = y/CONFIG_ROAR = n/' config.mk
# make -j 8
# make install 
# cmus
# :set output_plugin=pulse

#------------------------END cmus------------------------------


#------------------------BEGIN vlc----------------------------
apt install -y vlc

# "VLC is not supposed to be run as root. Sorry. If you need to use real-time
# priorities and/or privileged TCP ports you can use vlc-wrapper (make sure it
# is Set-UID root and cannot be run by non-trusted users first)."

sed -i 's/geteuid/getppid/' /usr/bin/vlc

#------------------------END vlc----------------------------


# whois   CNNIC(中国互联网络信息中心)
# port 43 TCP
apt-get install -y whois


# screen record
apt install -y asciinema




# PDF 
# zathura, It offers a vim-like experience and has a focus on keyboard
# interaction.  The key bindings, commands and most other settings can be
# customized.
apt install -y zathura

# Xournal++
# 手写可以


# markdown typora
# it is not free now from 2021.12
#wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
#add-apt-repository 'deb https://typora.io/linux ./'
#apt update
#apt install -y typora




#------------------------BEGIN GUI 编辑器 ------------------------------
#apt install -y gedit
apt install -y mousepad
#------------------------BEGIN GUI 编辑器 ------------------------------







#------------------------BEGIN VIM ------------------------------
## install dependencies
## 1. X11 header files
## I myself first installed a package "libgrafx11-1-dev", having no idea if
##this works

apt install -y libx11-dev libxt-dev

## 2. terminal library
## The ./configure installation prompts while having not install this, prompt
##"libncurses-dev"
apt install -y libncurses-dev

git clone https://gitee.com/billscofield/vim.git /git/software/vim

## 3. Install python3-dev, otherwise there will no python3-config-dir
apt install -y python3-dev

## configure vim source and install

cd /git/software/vim/ || exit

./configure --with-features=huge \
  --with-x \
  --enable-rubyinterp \
  --enable-python3interp \
  --with-python3-config-dir=/usr/lib/python3.7/config-3.7m-x86_64-linux-gnu \
  --enable-perlinterp \
  --enable-gui=auto \
  --enable-gtk2-check \
  --enable-gtk3-check \
  --enable-gnome-check \
  # 试试 -enable-gui=gtk3 \
  --enable-gui=gtk2 \
  --enable-cscope \
  --enable-luainterp \
  --enable-perlinterp \
  --enable-multibyte \
  --prefix=/usr/local/vimPython3

make install -j 8 && make install

# vundle
# git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://gitee.com/billscofield/vundle.vim.git ~/.vim/bundle/Vundle.vim


ln -s /git/debian-config/.vimrc ~/.vimrc


git clone https://gitee.com/billscofield/vundle.vim.git             ~/.vim/bundle/vundle.vim
git clone https://gitee.com/billscofield/emmet-vim                  ~/.vim/bundle/emmet-vim
git clone https://gitee.com/billscofield/auto-pairs                 ~/.vim/bundle/auto-pairs
git clone https://gitee.com/billscofield/vim-javascript             ~/.vim/bundle/vim-javascript
git clone https://gitee.com/billscofield/YouCompleteMe              ~/.vim/bundle/YouCompleteMe
git clone https://gitee.com/billscofield/tern_for_vim               ~/.vim/bundle/tern_for_vim
git clone https://gitee.com/billscofield/syntastic                  ~/.vim/bundle/syntastic
git clone https://gitee.com/billscofield/nerdtree                   ~/.vim/bundle/nerdtree
git clone https://gitee.com/billscofield/nerdtree-git-plugin        ~/.vim/bundle/nerdtree-git-plugin 
git clone https://gitee.com/billscofield/nerdcommenter              ~/.vim/bundle/nerdcommenter
git clone https://gitee.com/billscofield/vim-go                     ~/.vim/bundle/vim-go
git clone https://gitee.com/billscofield/vim-indent-guides          ~/.vim/bundle/vim-indent-guides
git clone https://gitee.com/billscofield/tagbar                     ~/.vim/bundle/tagbar
git clone https://gitee.com/billscofiled/vim-airline                ~/.vim/bundle/vim-airline
git clone https://gitee.com/billscofield/vim-airline-themes         ~/.vim/bundle/vim-airline-themes
git clone https://gitee.com/billscofield/vim-multiple-cursors       ~/.vim/bundle/vim-multiple-cursors
git clone https://gitee.com/billscofield/webapi-vim                 ~/.vim/bundle/webapi-vim
git clone https://gitee.com/billscofield/matchit.zip                ~/.vim/bundle/matchit.zip
git clone https://gitee.com/billscofield/SimpylFold                 ~/.vim/bundle/SimpylFold
git clone https://gitee.com/billscofield/vim-autopep8               ~/.vim/bundle/vim-autopep8
git clone https://gitee.com/billscofield/bufexplorer                ~/.vim/bundle/bufexplorer
git clone https://gitee.com/billscofield/taglist.git                ~/.vim/bundle/taglist
git clone https://gitee.com/billscofield/vim-gitgutter.git          ~/.vim/bundle/vim-gitgutter
git clone https://gitee.com/billscofield/vim-fugitive.git           ~/.vim/bundle/vim-fugitive
git clone https://gitee.com/billscofield/vim-surround.git           ~/.vim/bundle/vim-surround

git clone https://gitee.com/billscofield/gtk-vim-syntax.git         ~/.vim/
mkdir ~/.vim/after && mv ~/.vim/gtk-vim-syntax/c.vim.example ~/.vim/after/c.vim
mv ~/.vim/syntax ~/.vim/bundle

# Vi IMproved - enhanced vi editor (dummy package)
# to achive gtk syntax highlight
apt install vim-gtk




# golang
# to download without vpn is very slow, env cannot open the web
# we can download it in this site: https://studygolang.com/dl

export GOPROXY=https://mirrors.aliyun.com/goproxy/



# node.js
# npm install -g cnpm --registry=https://registry.nmp.taobao.org
# ERR! code CERT_HAS_EXPIRED
# thus try the two line below, but another err
npm cache clean --force
npm config set strict-ssl false

# the right method should be as follow:
# npm get registry   // get the current registry
npm config set registry http://registry.npm.taobao.org





# youcompleteme configure

cd /root/.vim/bundle/YouCompleteMe/ || exit
git submodule update --init --recursive
apt install -y python3-dev build-essential cmake vim-nox
apt install -y mono-complete golang nodejs default-jdk npm
python3 ~/.vim/bundle/Yo/bundle/YouCompleteMe/install.py --all

# you have to make sure the version ycm need
# wget https://github.com/ycm-core/llvm/releases/download/12.0.0/libclang-12.0.0-x86_64-unknown-linux-gnu.tar.bz2  -P /root/.vim/bundle/YouCompleteMe/third_party/ycmd/clang_archives



# ctags
apt install -y vim-runtime
apt install -y exuberant-ctags



#------------------------END VIM ------------------------------



apt-get install -y shellcheck


# fzf
apt-get install -y fzf

# axel：多线程下载工具，下载文件时可以替代curl、wget。
apt install -y axel

# multital
apt install -y multitail




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
apt install -y ibus ibus-pinyin

# 切换到ibus框架
im-config
#或者 im-config -s ibus


# 然后需要切换为 python2 

ibus-setup

# 配置 urxvt 支持 ibus
# Urxvt.inputMethod:ibus


ln -s /git/debian-config/.Xdefaults /root/.Xdefaults




#------------------------BEGIN virtual Python environment ------------------------------
# pyenv
git clone https://gitee.com/billscofield/pyenv.git ~/.pyenv
cd ~/.pyenv && src/configure && make -C src

# virtualenv
git clone https://gitee.com/billscofield/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
#------------------------END virtual Python environment  ------------------------------





#------------------------BEGIN MySQL ------------------------------

apt install -y ffmpeg

# If you want virtual camera support you need v4l2loopback-dkms installed. You
# can install it with the following command :
apt install -y v4l2loopback-dkms


apt isntall simplyscreenrecorder
apt install -y obs-studio

#------------------------BEGIN MySQL ------------------------------



#------------------------BEGIN Download Tools ------------------------------
apt install -y aria2
#https://github.com/ziahamza/webui-aria2
git clone https://gitee.com/billscofield/webui-aria2.git /git/software/webui-aria2
#------------------------END Download Tools ------------------------------








#------------------------BEGIN MySQL ------------------------------


apt install -y mycli

#------------------------END MySQL ------------------------------




#------------------------BEGIN texlive ------------------------------ #texlive
#是由国际TEX用户组（TEXUsers Group，TUG）整理和发布的TEX软件发行套装，包含与TEX
#系统相关的各种程序、编辑与查看工具、常用宏包及文档、常用字体及多国语言支持。

apt install -y texlive-full
#------------------------END texlive ------------------------------



# excellent tools
##------------------------ BEGIN geogebra ------------------------------
## 免费的数字工具, 用于课堂活动, 绘图计算, 几何作图, 白板协作等等
apt-get install geogebra
##------------------------ END geogebra ------------------------------



# json print
apt install -y jq



#-------------------------------NETWORK BEGIN-------------------------------
apt install -y libpcap-dev
apt install -y tcpdump

#---
apt install -y wireshark
#-------------------------------NETWORK END-------------------------------






#-------------------------------Docker BEGIN-------------------------------
# https://blog.csdn.net/baidu_41617231/article/details/120922974

# 1. to satisfy dependcy
apt install apt-transport-https ca-certificates curl software-properties-common gnupg2

# 2. 信任 Docker 的 GPG 公钥:
curl -fsSl https://download.docker.com/linux/debian/gpg | apt-key add -

# 3. 添加软件仓库:
add-apt-repository "deb [arch=amd64] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/debian $(lsb_release -cs) stable"

# 4. 安装
apt update && apt install docker-ce
#-------------------------------Docker END-------------------------------





#-------------------------------KVM BEGIN-------------------------------

apt install -y qemu qemu-kvm qemu-system qemu-utils


apt install -y libvirt-clients libvirt-daemon-system virtinst

#-------------------------------KVM END-------------------------------


#-------------------------------BAIDU BEGIN-------------------------------
git clone https://gitee.com/billscofield/BaiduPCS-Go.git /git/software/BaiduPCS-Go
#-------------------------------BAIDU END-------------------------------




#-------------------------------dlocate BEGIN-------------------------------
# fast alternative to dpkg -L and dpkg -S
# Uses GNU grep and text dumps of dpkg's data to greatly speed up finding out which
# package a file belongs to (i.e. a very fast dpkg -S). Many other uses,
# including options to view all files in a package, calculate disk space
# used, view and check md5sums, list man pages, etc.

apt install -y dlocate

#-------------------------------dlocate END-------------------------------

# rpm2cpio - tool to convert RPM package to CPIO archive
apt install -y rpm2cpio




apt install -y firefox-esr



# qt
wget https://d13lb3tujbc8s0.cloudfront.net/onlineinstallers/qt-unified-linux-x64-4.1.1-online.run



# sound
apt install -y alsa-utils

# screenshot
apt install flameshot


# lua

apt install -y luarocks

# drawingboard
apt install -y openboard


apt install -y zip unzip

apt install -y p7zip-full


# 对于系统的函数进行跳转
mkdir -p ~/.vim/tags/
ctags --fields=+iaS --extra=+q -R -f ~/.vim/tags/systags /usr/include /usr/local/include



apt install -y bc

# include cal,ncal
apt install -y bsdmainutils


# an editor for diagrams, graphs, charts etc.
apt install -y dia

# 用来观察特定进程的IO信息的。. 该脚本是用shell写的
apt install -y percona-toolkit



# dvd 刻录

apt install -y brasero
apt install -y k3b




pip install percol
