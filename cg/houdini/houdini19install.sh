#!/usr/bin/env bash
# Author: Bill Scofield
# Ctime : 2022-04-06
# Description:	

/mnt/public/software/houdini/19/linux/houdini-19.0.531-linux_x86_64_gcc9.3/houdini.install --auto-install --accept-EULA 2021-10-13

systemctl stop avahi-daemon.socket avahi-daemon.service
systemctl disable avahi-daemon.socket avahi-daemon.service

# /root/.sesi_licenses.pref
chattr -i /root/.sesi_licenses.pref
echo serverhost=10.0.6.218 > /root/.sesi_licenses.pref
chattr +i /root/.sesi_licenses.pref
