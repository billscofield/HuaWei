## 配置文件位置

/usr/local/etc/zabbix/zabbix_agentd.conf

## 服务启/停管理

launchctl start com.zabbix.zabbix_agentd
launchctl stop com.zabbix.zabbix_agentd

ps aux | grep zabbix_agentd

zabbix agent 安装完后会直接启动，修改了配置文件，要先停止再启动
