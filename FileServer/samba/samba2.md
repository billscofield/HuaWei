samba是一套程序，其中最重要的两个是：

    smbd：提供SMB / CIFS服务（文件共享和打印），也可以作为Windows域控制器。

    nmbd：提供NetBIOS名称服务

早期，不同主机之间传输数据大多通过FTP，但是不能直接修改


直接修改的系统

    NFS(linux),仅能让Linux机器沟通

    CIFS(windows,Common Internet File System) 只能让windows机器沟通

        网上老邻居


1991年 Andrew Tridgell 手头上有3种电脑，DEC,Sun, DOS

DEC 公司的Digital Unix系统和Sun的Unix系统，DEC开发了 PATHWORKS 软件，实现共享，但是不能和DOS共享。

NetBIOS实在是太好用了，所以Windows采用NetBIOS作为局域网沟通的协议

Andrew Tridgell 利用数据包检测逆向工程 开发出了 Server Message Block(SMB) 这个文件系统

Andrew Tridgell 注册SMB商标的时候，因为SMB没有意义的文字，采用了同音的 samba(桑巴舞)


SAMBA是架构在 NetBIOS(Network Basic Input/Output System) 这个通信协议上面开发出来的。

IBM发展出 NetBIOS 的目的仅仅是要让局域网络内少数计算机进行网络连接的一个通信协议而已，这个BetBIOS是无法跨路由的(但是现在有了 BetBIOS over TCP/IP技术)

windows里还有 NetBEUI(NetBIOS Extended User Interface)


主机在 NetBIOS 中使用的定义为 "NetBIOS Name",每一台主机都必须有不同的 "NetBIOS Name"(相当于IP)


samba

samba-client

    挂载samba文件格式的mount.cifs, 取得类似网上邻居相关树形图的 smbtree

samba-common

    server 和 client都会用到的数据，包括 samba的主要配置文件 smb.conf, 语法检验命令 testparm


## 安装

apt install samba

smbstatus

samba --version

systemctl status smbd
    管理SAMBA主机共享的目录、文件、打印机等
    TCP 139端口445端口(445不一定存在)
systemctl status nmbd
    管理工作组、NetBISO 等的解析
    UDP 137,138端口
    

开始运行后，smbd将在139和445端口上侦听


## 配置

/etc/samba/smb.conf

在[全局] [global]部分，确保工作组的值与Windows计算机的工作组设置相同。

    主机的信息配置

workgroup = WORKGROUP

向下滚动到文件的底部。 （在nano文本编辑器中，按CTRL + W然后按CTRL + V。）添加新的部分，如下所示。 用您所需的用户名替换红色用户名。

[Home Share]

comment = Home Public Folder
path = /home/linuxidc/
writable = yes
valid users = linuxidc
home共享是将在Windows网络上显示的文件夹名称。 该注释是共享文件夹的描述。 接下来的3行表示只有有效用户指定的用户可以访问/ home/linuxidc/目录，这也是可写的。 上述配置将禁用匿名访问。

保存并关闭该文件，然后运行以下命令检查是否存在语法错误。

testparm


useradd -s /sbin/nologin hr

smbpasswd -a hr     //如何修改?  说也是这一个命令


    ```
    smbpasswd -x [用户] //删除用户
    smbpasswd -d    disable user
    smbpasswd -e    enable user
    `````

不允许一个用户使用一个以上用户名与一个服务器或共享资源的多重连接。中断与此服务器或共享资源的所有连接，然后再试一次

    方法一

        在cmd下运行 net use * /del /y 来清除系统记录列表

    方法二

        services.msc > workstation重启


示例:
[home share]
comment = what you want to say
path = /data/share
public = no
valid users = a, b, c, @A
write list = @admin
read list = @read
printable = no


setfacl -R -m u:USER1:r-x /data/share
setfacl -R -m g:admin:rwx /data/share
setfacl -R -m g:read:r-x /data/share
??奇怪的是 000258 这样的用户 setfacl 后，用getfacl查看 用户名却变了

chown + setfacl + samba 共同维护权限,samba中的用户输入其他人


A创建的文件，B是否可以删除 权限
如何不使用系统用户名?

## log


http://blog.chinaunix.net/uid-20537084-id-2977850.html
https://blog.51cto.com/simpledevops/943407
https://blog.whsir.com/post-128.html  !!


linux 使用samba服务
    https://blog.csdn.net/weixin_42005898/article/details/85256790


## pass

passdb backend = tdbsam passdb backend即用户后台。有三种后台：smbpasswd、tdbsam和ldapsam。

Sam即security account manager。

1. smbpasswd：该方式是使用smb工具smbpasswd给系统用户（真实用户或者虚拟用户）设置一个Samba 密码，客户端就用此密码访问Samba资源。smbpasswd在/etc/samba中，有时需要手工创建该文件。

2. tdbsam：使用数据库文件创建用户数据库。数据库文件叫/var/lib/samba/private/passdb.tdb，在/etc/samba中。
    passdb.tdb用户数据库可使用smbpasswd –a创建Samba用户，要创建的Samba用户必须先是系统用户。
    也可使用pdbedit创建Samba账户。pdbedit参数很多，列出几个主要的：

        pdbedit –a username：新建Samba账户。
        pdbedit –x username：删除Samba账户。
        pdbedit –L：列出Samba用户列表，读取passdb.tdb数据库文件。
        pdbedit –Lv：列出Samba用户列表详细信息。
        pdbedit –c “[D]” –u username：暂停该Samba用户账号。
        pdbedit –c “[]” –u username：恢复该Samba用户账号。


        pdbedit — manage the SAM database (Database of Samba Users)



3. ldapsam：基于LDAP账户管理方式验证用户。首先要建立LDAP服务，设置“passdb backend = ldapsam:ldap://LDAP Server”


### tdb
samba在运行时，Samba 存储许多信息，从本地密码到希望从中收到信息的一系列客户端。

这类数据其中一些是暂时的，在 Samba 重启时可能会被丢弃，但是另一些却是永久的，不会被丢弃。这类数据可能是很大的，也可能是不经常访问只是在内存中保留，或者在重启时保持存在。

要满足这些要求，Samba 团队创建了 Trivial Database。它实际上是一个键值存储，这意味着数据通过惟一键的方式存储和检索，且没有像在关系数据库中那样的表联接。

键值存储 — 尤其是 TDB — 被设计成将数据存储到磁盘并将其取回的一种快速方式。

至于这些tdb文件如何查看数据，以及修改备份，下面介绍samba自带的几个tdb工具。
    tdbtool
    tdbdump



http://www.178pt.com/257.html


## 可能出现的问题
有可能出现的问题

Samba只支持NTLM认证，而WIN7或VISTA则采用NTLMv2认证，因此必须经过一些设置才行，具体设置如下：

开始 -> 
运行 -> 
secpol.msc->
本地策略->
安全选项->
网络安全：LAN管理器身份验证级别->
发送 LM 和 NTLMv2 ,如果已协商，则使用NTLMv2 (会话安全 &)->
完成设置

## 共享参数

comment---------注释说明
path------------分享资源的完整路径名称，除了路径要正确外，目录的权限也要设对
browseable------是yes/否no在浏览资源中显示共享目录，若为否则必须指定共享路径才能存取
printable-------是yes/否no允许打印
hide dot ftles--是yes/否no隐藏隐藏文件
public----------是yes/否no公开共享，若为否则进行身份验证(只有当security = share 时此项才起作用)
guest ok--------是yes/否no公开共享，若为否则进行身份验证(只有当security = share 时此项才起作用)
read only-------是yes/否no以只读方式共享当与writable发生冲突时也writable为准
writable--------是yes/否no不以只读方式共享当与read only发生冲突时，无视read only
vaild users-----设定只有此名单内的用户才能访问共享资源(拒绝优先)(用户名/@组名)
invalid users---设定只有此名单内的用户不能访问共享资源(拒绝优先)(用户名/@组名)
read list-------设定此名单内的成员为只读(用户名/@组名)
write list------若设定为只读时，则只有此设定的名单内的成员才可作写入动作(用户名/@组名)
create mask-----建立文件时所给的权限
directory mask--建立目录时所给的权限
force group-----指定存取资源时须以此设定的群组使用者进入才能存取(用户名/@组名)
force user------指定存取资源时须以此设定的使用者进入才能存取(用户名/@组名)
allow hosts-----设定只有此网段/IP的用户才能访问共享资源
allwo hosts = 网段 except IP
deny hosts------设定只有此网段/IP的用户不能访问共享资源
allow hosts=本网段指定IP指定IP
deny hosts=指定IP本网段指定IP



## 练习题

https://blog.csdn.net/weixin_34219944/article/details/86222281

https://blog.csdn.net/weixin_43006072/article/details/82465709




````
