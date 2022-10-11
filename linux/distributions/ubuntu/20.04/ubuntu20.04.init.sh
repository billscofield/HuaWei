#!/usr/bin/env bash
# Author: Bill Scofield
# Ctime : 2022-10-11
# Description:	


mv /etc/apt/sources.list{,.ori}
cp sources.list /etc/apt/
apt update

apt install -y rsync
apt install -y vim
apt install -y openssh-server
apt install -y build-essential

apt install -y autofs
    echo '/mnt /etc/auto.master'
    cp auto.nfs /etc/


# ---

echo 'blacklist nouveau' >> /etc/modprobe.d/blacklist.conf
echo 'blacklist lbm-nouveau' >> /etc/modprobe.d/blacklist.conf
echo 'options nouveau modeset=0' >> /etc/modprobe.d/blacklist.conf

禁止内核中nouveau
echo options nouveau modeset=0 | sudo tee -a /etc/modprobe.d/nouveau-kms.conf

update-initramfs -u
reboot


-no-opengl-files
-no-nouveau-check
-no-x-check

# https://www.freesion.com/article/92631157038/
# ---
