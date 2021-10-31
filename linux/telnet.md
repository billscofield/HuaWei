## telnet

安装openbsd-inetd
sudo apt-get install openbsd-inetd

安装telnetd
sudo apt-get install telnetd

重启openbsd-inetd
sudo /etc/init.d/openbsd-inetd restart

查看telnet运行状态
sudo netstat -a | grep telnet
