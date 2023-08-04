## 工作组

无法统一管理
无法集中身份验证

whoami /all 查看SID administrator的最后那个都是500

cmd 更改密码
    net user administrator 密码

## Domain 领域

"域" 的真正含义是指：服务器控制网络上的计算机能否加入的计算机组合

至少一台服务器负责每一台连入网络的电脑和用户的验证工作，相当于门卫一样，称为"域控制器" (Domain Controller,DC)

由 这个域的账户、密码、属于这个域的计算机等信息 构成的数据库

当电脑连入网络时，域控制器首先要鉴别这台电脑是否是属于这个域的




## 域 活动目录 域控制器

1. 域

1. 活动目录
    数据库，用户，密码等相关信息

1. 域控制器


https://edu.51cto.com//center/course/lesson/index?id=309504

https://edu.51cto.com//center/course/lesson/index?id=46988

DC 服务器上 通过 AD数据库 进行用户身份验证,


Active Directory Domain Services
    会默认安装DNS服务

promote this server to a domain controller

add a new forest
    root domain name:  xxx.com


cmd
    netdom query fsmo   五种
    dcdiag /a       



DHCP



OU(Organization Unit)


Netbios


sysvol文件夹


强制域控制器向 DNS 注册 SRV 记录
    net stop netlogon
    net start netlogon

    _msdsc.
    4
    6

在域成员身份变更时，


gpupdate /force
