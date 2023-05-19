#! /usr/bin/env bash
# Author: Bill Scofield
# Ctime : 2022-12-14
# Description:	

python309='/usr/lib/python3.9/config-3.9-x86_64-linux-gnu'
python311='/usr/lib/python3.11/config-3.11-x86_64-linux-gnu'
#python3-config --configdir

./configure --with-features=huge \
    --with-x \
    --enable-rubyinterp=yes \
    -with-ruby-command=/usr/bin/ruby \
    --enable-python3interp \
    --with-python3-config-dir=$(python3-config --configdir) \
    --enable-perlinterp=yes \
    --enable-gui=auto \
    --enable-gtk2-check \
    --enable-gtk3-check \
    --enable-gnome-check \
    --enable-gui=gtk2 \
    --enable-cscope \
    --enable-luainterp \
    --with-luajit \
    --with-lua-prefix=/usr/include/lua5.1 \
    --enable-multibyte \
    --enable-largefile \
    --with-compiledby='billscofield' \
    --prefix=/usr/local/vim9



#使用以下命令，可以重置编译操作：
#$ sudo make distclean
#使用以下命令，可以卸载Vim：
#$ sudo make uninstall

# –-enable-fail-if-missing，用于显示错误信息
