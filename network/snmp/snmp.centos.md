
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
By default, the applications look for configuration files in the following 4
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
    7. \*.local.conf

are always read last. In this manner, there are 8 default places a
configuration file can exist for any given configuration file type.




## 使用

snmpd 
    -v      查看 SNMP 版本号
    -H      display configuration file directives understood

更改团体名
    vi /etc/snmp/snmpd.conf
    com2sec notConfigUser  default  public



sec.name is an arbitrary word that is used by the group label. source describes
a host or network. And community is the community name that is used.

Examples

    com2sec localhost 127.0.0.1       public
    com2sec local     192.168.0.0/24  netsnmp
    com2sec trusted   192.168.1.1     secretWord

source can be the word **default, but it is not clear what this means.**


snmpwalk 
    -v  snmp version     must
    -c  community name   must
    IP  must
    oid not must
