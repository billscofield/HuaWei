## centos 历史版本下载

http://vault.centos.org

isos目录


### 关于CENTOS 停止服务的通知 

2020年12月08日，CentOS 官方宣布CentOS Linux项目停止，并推出CentOS Stream项目。

1、CentOS Linux 7于2020年第四季度停止更新，并于2024年6月30日停止维护；

2、CentOS Linux 8在2021年12月31日停止维护。

3、不会再提供CentOS Linux 9及后续版本，将会提供CentOS Stream版本。

CentOS Stream 是一个滚动升级版本，不再是Red Hat Enterprise Linux的复刻版本，对于系统的稳定性和兼容性可能无法得到保障，其在生产环境上的使用存在的风险未知；


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




