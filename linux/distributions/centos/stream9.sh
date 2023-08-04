#! /usr/bin/env bash
# Script: ctream9.sh
# Author: Bill Scofield
# Email: billscofield@hotmail.com
# Date: 2023-08-02

yum install -y epel-release

dfn install -y kernel-devel
yum install "kernel-devel-uname-r == $(uname -r)"


yum install -y autofs
yum install -y nfs-utils

dnf group install -y 'Development Tools'
dnf install -y gcc
dnf install -y cmake



dnf install -y tree
wget
iftop


# katana7
dnf install xcb-util-wm¬
dnf install xcb-util-image¬
dnf install xcb-util-keysyms¬
dnf install xcb-util-renderutil

#xcb  见 system libraries
