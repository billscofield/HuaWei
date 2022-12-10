#!/usr/bin/env bash
# Author: Bill Scofield
# Ctime : 2022-12-07
# Description:	

localip=$(ip a | grep inet | grep brd | grep 10.0 | awk '{print $2}' | awk -F/ '{print $1}')
serverip=10.0.28.20

cat >/etc/zabbix/zabbix_agent2.conf <<EOF
PidFile=/run/zabbix/zabbix_agent2.pid
LogFile=/var/log/zabbix/zabbix_agent2.log
LogFileSize=0
Server=${serverip}
ServerActive=${serverip}
Hostname=${localip}
Include=/etc/zabbix/zabbix_agent2.d/*.conf
ControlSocket=/tmp/agent.sock
Include=./zabbix_agent2.d/plugins.d/*.conf
EOF

systemctl restart zabbix-agent2
systemctl enable zabbix-agent2
