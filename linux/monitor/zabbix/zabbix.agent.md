
## agent2

降低了 tcp 连接的数量

go 语言, 继承了 zabbix-agent 原有的所有功能，并且易于通过插件扩展第三方功能

rpm -ql zabbix-agent2

/etc/zabbix/zabbix_agent2.conf

    PidFile=/var/run/zabbix/zabbix_agent2.pid
    LogFile=/var/log/zabbix/zabbix_agent2.log
    LogFileSize=0   // =0: 不切割, 而是滚动
    Server=
    ServerActive=
    Hostname=           // 主动注册的一定要一致
    Include=/etc/zabbix/zabbix_agent2.d/*.conf
    ControlSocket=

    AllowRoot
        默认以 zabbix 身份运行
    LoadModule


systemctl restart zabbix-agent2
