# Zabbix

/lib/systemd/system

报警使用的脚本
    /usr/lib/zabbix/alertscripts

额外脚本
    /usr/lib/zabbix/externalscripts

命令
    /usr/sbin/zabbix_server
    /usr/sbin/zabbix_agentd
    /usr/bin/zabbix_sender
        apt install zabbix-sender
    /usr/bin/zabbix_get
        apt install zabbix-get

/etc/apt/sources.list.d/sources.list.d/zabbix.list



确认: 我正在处理，不要再报警了


主动
被动
简单检查(simple check)
snmp
内部检查(zabbix internal): zabbix 的
http代理(http agent):zabbix server 发送 http 请求给客户端，
可计算的(calculated): 一般不用，而是放到客户端去做
JMX: 监控java
IPMI:硬件

