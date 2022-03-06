## 简介

主域控制器服务器 (Windows server 2008 R2 + AD域 + DNS服务器)

主域控制器服务器计算机名称：pdc
主域控制器服务器FQCN(完全限定的域名)：super.com
IP：192.168.10.30

辅域控制服务器 (Windows server 2008 R2 + AD域 + 备用DNS服务器)
辅域控制服务器计算机名称：bdc1
IP：192.168.10.31



辅域控制器注意事项

1. 安装前，辅域控制器的DNS指向主域控制器，设置如下：
    DNS1：192.168.10.30
    DNS2：192.168.10.31

2. 辅域控制器安装DNS服务不用设置；

3. 安装辅域控制器,如果主域控制器DNS和AD集成，辅域控制器会在安装AD后自动同步DNS记录；

4. 安装后修改辅域控制器的DNS指向本机，设置如下：
    DNS1：192.168.10.31
    DNS2：192.168.10.30

5. 如果确定域环境不使用IPv6地址，主域控和辅域控安装前可以先把IPv6的地址关掉，域控的DNS服务器会优先获取IPv6的DNS


## 域控

手动设置固定IP，DNS服务器指向自己

1. 安装 DNS 角色

    安装主域控制器需要先安装DNS服务器，但不需要配置DNS服务器

    也可以不安装，会在步骤二中的某个阶段提示，但要注意勾选DNS服务器

2. 安装主域控制器

    dcpromo(domain controller promote, 域控制器提升)


    dcpromo命令是一个“开关”命令。如果Windows 2000 Server计算机是成员服务器，则
    运行dcpromo命令会安装活动目录，将其升级为域控制器；如果Windows 2000 Server
    计算机 已经是域控制器，则运行dcpromo命令会卸载活动目录，将其降级为成员服务
    器。

3. DNS 设置

    为了让辅域控制器的DNS同步主域控制器DNS，需要把主域控制器的DNS服务器
    msdcs.super.com和 super.com 的起始授权机构(SOA)区域传送设置成允许。


## 辅助域控

安装辅域控制器之前先把辅控制器加入主域控 super.com，为了测试主域控制器是否正常，
同时也为了方便安装辅域控制器

1. 安装 DNS 角色

    同样不需要配置,此时也可以不安装, 待步骤二时安装

2. 安装域控
    
    dcpromo

    向现有域添加域控制器

3. dns 设置

    辅域控服务器重启后检查DNS服务器是否已获取到主域控制器传输过来的DNS服务器配置，检查正常后需要把

    辅域控制器的DNS服务器 msdcs.super.com和 super.com 的起始授权机构(SOA)区域传送设置成允许。

最后需要把辅域控制器的DNS指向本机IP地址


### 全局编录解析：

这里对全局编录做个解释。全局编录（global Catalog，GC)全局编录包含了各个活动目录
中每一个对象的最重要的属性，是域林中所有对象的集合。在域林中，同一域林中的域控
制器共享同一个活动目录，这个活动目录是分散存放在各个域的域控制器中的，每个域中
的域控制器保存着该域的对象的信息（用户账号及目录数据库等）。如果一个域中的用户
要访问另一个域中的资源，则要先找到另一个域中的资源。为了让用户快速的查找到另一
个域内的对象，微软设计了全局编录（global Catalog，GC)。全局编录包含了各个活动目
录中每一个对象的最重要的属性（即部分属性），这样，即使用户或应用程序不知道对象
位于哪个域，也可以迅速找到被访问的对象。


## unix

[link](http://soft.zhiding.cn/software_zone/2010/0603/1764905.shtml)

Windows Server 2008 R2中，已经内置了一个与POSIX标准兼容的子系统，您可以直接在这
个系统上编译和运行UNIX应用程序。

基于UNIX应用程序的子系统(Subsystem for UNIX-based Applications，SUA)是以前随
Windows Services for UNIX 3.5一起提供的Interix 子系统演变而来的，它是一种可在运
行Windows服务器类操作系统的计算机上进行操作的多用户UNIX环境。SUA及其随附实用程
序可为您提供类似于基于UNIX的操作系统的环境。它还包括区分大小写的文件名、作业控
制和编译工具，并支持使用300余个UNIX命令、实用程序和Shell脚本。因为SUA设计用来在
Windows内核基础上运行，所以能提供真正的基于UNIX的功能而不用任何仿真。


搜索 Utilities and SDK for Subsystem for UNIX-based Applications in Windows 2008

已经非常不容易找到了

wget https://softpedia-secure-download.com/dl/fd85a72ebe900cbf1096f7e46fca2f8a/6222b267/100154308/software/programming/Utilities%20and%20SDK%20for%20Subsystem%20for%20UNIX-based%20Applications_AMD64.exe



[link](https://wiki.samba.org/index.php/Installing_RSAT#Installation)






## 加域时遇到的问题

1. Changing the Primary Domain DNS name of this computer to "" failed.

    **This is a bogus error message that can be safely ignored** - it's caused
    by the domain join code ending up in a function which it doesn't need to
    run anyway during a domain join operation using the GUI. For more detail
    information, please refer to:

    Changing the Primary Domain DNS name of this computer to "" failed.

    http: //blogs.technet.com/b/instan/archive/2012/01/14/changing-the-primary-domain-dns-name-of-this-computer-to-quot-quot-failed.aspx

    Windows 7 or Windows Server 2008 R2 domain join displays error "Changing
    the Primary Domain DNS name of this computer to "" failed...."

    http://support.microsoft.com/kb/2018583






## 域控服务器更名

需要使用 netdom 工具

1. 查看域控制器当前配置的计算机名:

    netdom computer COMPUTERNAME /enumerate:{AlternateNames | PrimaryName | AllNames}

    COMPUTERNAME 是当前域控制器的 FQDN 名
    enumerate 是一个过滤项, AlternameNames(仅显示别名) 默认是全部显示

    netdom computer BDC1.super.com /enumerate

2. 为当前计算机添加新的域计算机名

    netdom computer COMPUTERNAME /add:NEW_FQDN_NAME

    netdom computer BDC1.super.com /add:bdc1.super.name

3. 提升替换的计算机名为主要计算机名

    netdom computer COMPUTERNAME /makeprimary:FQDN_NAME

    netdom computer BDC1.super.com /makeprimary:bdc1.super.name

4. reboot computer

5. 再次查看

    netdom computer BDC1.super.com /enumerate


## 管理工具位置

控制面板 / 系统和安全 / 管理工具
