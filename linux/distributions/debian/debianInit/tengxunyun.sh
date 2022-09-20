#!/usr/bin/env bash
# Author: Bill Scofield
# Ctime : 2022-09-20
# Description:	



wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> etc/apt/sources.list.d/google.list'
yum update
apt install -y google-chrome-stable


apt install -y task-gnome-desktop
systemctl set-default graphical.target


sed -i '/[security]/aAllowRoot = true/' /etc/gdm3/daemon.conf
#sed -i 's/^auth required pam_succeed_if.so user != root quiet_success/^&' /etc/pam.d/gdm-password
sed -i '/root quiet_success/d' /etc/pam.d/gdm-password

reboot

