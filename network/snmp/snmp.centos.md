
##  安装

yum install net-snmp net-snmp-utils

## 配置

/etc/snmp/snmpd.conf

sed -i.org '52a view    systemview    included   .1'



snmp 开启和默认开启

/etc/init.d/snmpd restart
chkconfig snmpd on
chkconfig --list | grep snmp



snmpwalk -v 2c -c public localhost sysname



## 详细讲解

man 5 snmp_config

there are numerous places that configuration files can be found and read from.
By default, the applications look for  con‐figuration files in the following 4
directories, in order: 

    1. /etc/snmp
    2. /usr/share/snmp
    3. /usr/lib(64)/snmp
    4. $HOME/.snmp

In each of these directories, it looks for files 
    1. snmp.conf,
    2. snmpd.conf 
    3. snmptrapd.conf
    4. snmp.local.conf
    5. snmpd.local.conf
    6. snmptrapd.local.conf
    7. *.local.conf

are always read last. In this manner, there are 8 default places a
configuration file can exist for any given configuration file type.

