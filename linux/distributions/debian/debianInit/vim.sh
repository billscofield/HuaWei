#!/usr/bin/env bash
# Author: Bill Scofield
# Ctime : 2022-12-14
# Description:	

./configure --with-features=huge \
    --with-x \
    --enable-rubyinterp \
    --enable-python3interp \
    --with-python3-config-dir=/usr/lib/python3.9/config-3.9-x86_64-linux-gnu \
    --enable-perlinterp \
    --enable-gui=auto \
    --enable-gtk2-check \
    --enable-gtk3-check \
    --enable-gnome-check \
    --enable-gui=gtk2 \
    --enable-cscope \
    --enable-luainterp \
    --enable-perlinterp \
    --enable-multibyte \
    --prefix=/usr/local/vim9
