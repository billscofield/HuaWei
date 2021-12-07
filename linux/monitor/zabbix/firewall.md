firewall-cmd  --permanent  --add-port=10050/tcp
firewall-cmd  --permanent  --add-port=10051/tcp
firewall-cmd  --reload

查看开启的端口
firewall-cmd  --list-port
