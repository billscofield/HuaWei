# centos iptables

systemctl status firewalld
systemctl disable firewalld

1. 安装iptables

    yum install -y iptables-services

2. 启动iptables

    systemctl start iptables
    systemctl enable iptables.service

/etc/sysconfig/iptables
