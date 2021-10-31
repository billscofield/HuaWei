# Samba

## 主要功能
1. 文件和打印机共享
1. 身份验证和权限设置
    smbd 支持 user mode 和 domain mode
1. 名称解析
    samba 通过nmbd服务可以搭建NBNS(NetBIOS Name Service)服务器，提供名称解析，将计算机的NetBIOS名称解析为IP地址
1. 浏览服务
    

samba 和 NetBIOS
    最初samba运行在NetBIOS之上，运行在137,138 端口，现在运行在139,445
        netstat -anlp | grep smbd

    NetBIOS (Network Basic Input/Output System),一般用于局域网通信的一套API,由IBM公司开发，主要作用：通过NetBIOS协议获得计算机名称，然后将计算机名称解析为对应的IP地址
        可以把NetBIOS当做Samba的前身

C/S模式

vi /etc/services

## 搭建

apt install samba samba-client
vi /etc/samba/smb.conf

service smbd start

开机自动启动


linux 命令行访问
    smbclient -L IP地址
win 访问
    \\IP地址


## 配置
/etc/samba/smb.conf

关于注释
    "#" 是语句性注释
    ";" 是配置注释

[global]    全局配置
    workgroup = WORKGROUP  //组名或域名
    server string = %h server (Samba, Ubuntu)
    security =  user        //用户名+密码
                share       //支持匿名
                server      //用户名，密码提交到指定服务器进行验证
        新版本的是 
            usershare allow guests = yes

日志文件
    log file = /var/log/samba/
    max lig size = 1000     // KB

---

share definitions

默认共享了打印机
有的版本还默认共享了home目录(用户主目录)
[homes]
    
[printers]
    comment = 

[自定义共享名]
    1. comment = 共享描述信息
    1. browseable = yes   //是否允许查看此共享内容。隐藏共享目录
        yes:默认可以看到共享路径
        no: 需要指定共享目录才可以看到
    1. path = 绝对共享路径
    1. public = yes  或者 guest ok = yes   //允许匿名查看
    
    可访问用户
        valid users = a,b,c,d
        valid users = @group1

    目录权限
        readonly = yes
        readonly = no 

        writable = yes  //并不是针对所有人的，需要write list 指定
        writable = no
        write list = a,b,c
        write list = @gropu1

        create mask = 0700  //用户新建的文件的权限是0700


service smbd restart

---

security = user
指定用户和密码的文件位置
    passdb backend = smbpasswd
    smb passwd file = /etc/samba/smbpasswd
        不用手动创建，重启服务就有了这个文件
        
添加组和用户
    groupadd xiaoshoubu
    useradd -g xiaoshoubu -M -s /sbin/nologin xsb01
    useradd -g xiaoshoubu -M -s /sbin/nologin xsb02

为销售部成员添加samba用户
    smbpasswd -a xsb01  //add user
    smbpasswd -a xsb02

    此时查看smbpasswd文件，发现已经有密码了

[share]
    comment = xiaosoubu data
    path = /data
    valid users = xsb01,xsb02 或者 valid users = @xiaoshoubu
    chmod 777 /data
    


登录后会存在此用户的缓存
    cmd / net use  进行查看
    net use * /delete  取消连接



1. 指定需要共享的目录，并为共享目录设置共享权限
1. 在smb.conf文件中指定日志文件名称和存放路径
1. 设置共享目录的本地系统权限和samba共享权限
1. 重新加载配置文件或重新启动smbd服务，使配置生效



扩展
    访问源
        hosts allow = 1.1.1.1 2.2.2.2 
            还可以是网段  1.1.1.  192.168.1.
        hosts deny      //用户可以输入用户名密码，但是拒绝访问

        hosts allow 1.1.1.  EXCEPT 1.1.1.2
        第一次匹配生效


## 用户账号映射

vi /etc/samba/smb.conf

username map = /etc/samba/smbusers  //这个文件默认是有的
useradd xyz
smbpasswd -a xyz

vi /etc/samba/smbusers
    xyz = virtualName virtualName2

service smbd restart

现在就可以用 virtualName 和 virtualName2 进行登录了
