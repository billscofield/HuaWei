## centos 历史版本下载

http://vault.centos.org

isos目录



## 网卡自动启动

vim /etc/sysconfig/network-scripts/ifcfg-eth0

ONBOOT=yes



## selinux

强制模式SELINUX=enforcing：表示所有违反安全策略的行为都将被禁止。

宽容模式SELINUX=permissive：表示所有违反安全策略的行为不被禁止，但是会在日志中
作记录

getenforce，验证SELinux状态

sestatus，获取更多SELinux信息

setenforce 0临时关闭SELinux。
