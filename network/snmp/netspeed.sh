#!/usr/bin/env bash
# Author: Bill Scofield
# Ctime : 2022-12-17
# Description:	

echo -n 'snmpwalk -v2c -c password 192.168.1.1 .1.3.6.1.2.1.2.2.1.10.16777216 | cut -d " " -f4' > /tmp/snmpspeed.tmp
sleep 60
echo -n 'snmpwalk -v2c -c password 192.168.1.1 .1.3.6.1.2.1.2.2.1.10.16777216 | cut -d " " -f4' >> /tmp/snmpspeed.tmp

awk '{printf "Cernet egress rate: %d mbps\n",($2-$1)*8/10240000/60}' /tmp/snmpspeed.tmp >> /tmp/snmpspeed.res
