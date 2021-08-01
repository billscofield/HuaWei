systemctl status firewalld

firewall-cmd --get-zones

firewall-cmd --get-default-zone

firewall-cmd --zone=public --list-all

firewall-cmd --get-services

firewall-cmd --zone=public --add-service=telnet

firewall-cmd --zone=public --list-all

还有图形化软件, firewall
