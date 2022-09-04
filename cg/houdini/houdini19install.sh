#!/usr/bin/env bash
# Author: Bill Scofield
# Ctime : 2022-04-06
# Description:	

# 客户端
./houdini.install --no-install-avahi --no-install-license --auto-install --accept-EULA 2021-10-13


# license
##./houdini.install --no-install-avahi --install-license --no-install-houdini --auto-install --accept-EULA 2021-10-13

默认安装路径:HFS_LOCATION

systemctl stop avahi-daemon.socket avahi-daemon.service
systemctl disable avahi-daemon.socket avahi-daemon.service

# /root/.sesi_licenses.pref
chattr -i /root/.sesi_licenses.pref
echo serverhost=10.0.101.2:1715 > /root/.sesi_licenses.pref
chattr +i /root/.sesi_licenses.pref
