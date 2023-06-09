#! /usr/bin/env bash
# Script: init.sh
# Author: Bill Scofield
# Email: billscofield@hotmail.com
# Date: 2023-06-08

SCRIPT_FILE=$(readlink -f $0)
ABS_PATH=$(dirname $SCRIPT_FILE)

apt update
apt upgrade
apt install -y vim
apt install -y rsync
apt install -y openssh-server
apt install -y build-essential
apt install -y autofs

echo "/mnt/ /etc/auto.nfs" >> /etc/auto.master
rsync -av ${ABS_PATH}/autofs/auto.nfs /etc/
systemctl restart autofs

# Nvidia driver
