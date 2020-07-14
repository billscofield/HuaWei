## samba

### 

ftp 不能挂载到本地

    看不出真实的路径


nfs 对windows支持不好

    可以看出真实的路径



SMB: Server Message Block 服务器消息块, IBM开发，最早是DOS网络文件共享协议

    Barry Feigenbaum originally designed SMB at IBM in early 1983 with the aim of turning DOS INT 21h local file access into a networked file system.


CIFS: common internet file system, 微软基于SMB发布

    是文件系统，linux是支持的，modinfo cifs




SMB（Server Message Block，又称Common Internet File System（CIFS））是由微软开发的一种软件程序级的网络传输协议，

主要用来使得一个网络上的机器共享计算机文件、打印机、串行端口和通讯等资源。它也提供认证的行程间通讯机能。它主要用在装有Microsoft Windows的机器上，

在这样的机器上被称为Microsoft Windows Network。


---

SAMBA: 1991 年 Andrew Tridgell 实现 windows 和 linux 互通, 模拟的 smb
    
    桑巴舞

    


Samba是许多服务以及协议的实现，其包括TCP/IP上的NetBIOS（NBT）、SMB、CIFS（SMB的增强版本）、 DCE/RPC或者更具体来说MSRPC（网络邻居协议套件）、

一种 WINS服务器（也被称作NetBIOS Name Server（NBNS））、NT 域协议套件（包括NT Domain Logons、Secure Accounts Manager（SAM）数据库、

Local Security Authority（LSA）服务、NT-style打印服务（SPOOLSS）、NTLM以及近来出现的包括一种改进的Kerberos协议与改进的轻型目录访问协议（LDAP）在内的Active Directory Logon服务）。



### samba

apt install -y samba

/etc/samba/smb.conf

```
[global]

   workgroup = WORKGROUP
   log file = /var/log/samba/log.%m         //%m 宏定义，客户端主机的NetBIOS名, %I: 客户端主机IP, %U:当前用户名, man 5 smb.conf | grep %
   log level = 2                            //默认没有这个，所以不会记录任何东西
   max log size = 1000

    netbios name = xxx      //通过xxx访问，需要启动nmb服务才可以生效
    hosts allow = 127. 192.168.12.
    passdb backend = tdbsam
    security = user         //ads, domain



Log levels for auth_audit and auth_audit_json are:

    2: Authentication Failure

    3: Authentication Success

    4: Authorization Success

    5: Anonymous Authentication and Authorization Success


passdb backend (G)

    This option allows the administrator to chose which backend will be used for storing user and possibly group information. This allows you to swap between different storage mechanisms without recompile.

    The parameter value is divided into two parts, the backend's name, and a 'location' string that has meaning only to that particular backed. These are separated by a : character.

    Available backends can include:

    •   smbpasswd - The old plaintext passdb backend. Some Samba features will not work if this passdb backend is used. Takes a path to the smbpasswd file as an optional argument.

    •   tdbsam - The TDB based password storage backend. Takes a path to the TDB as an optional argument (defaults to passdb.tdb in the private dir directory.

            •   ldapsam - The LDAP based passdb backend. Takes an LDAP URL as an optional argument (defaults to ldap://localhost)

            LDAP connections should be secured where possible. This may be done using either Start-TLS (see ldap ssl) or by specifying ldaps:// in the URL argument.

            Multiple servers may also be specified in double-quotes. Whether multiple servers are supported or not and the exact syntax depends on the LDAP library you use.

            Examples of use are:

            passdb backend = tdbsam:/etc/samba/private/passdb.tdb

            or multi server LDAP URL with OpenLDAP library:

            passdb backend = ldapsam:"ldap://ldap-1.example.com ldap://ldap-2.example.com"

            or multi server LDAP URL with Netscape based LDAP library:

            passdb backend = ldapsam:"ldap://ldap-1.example.com ldap-2.example.com"

            Default: passdb backend = tdbsam


```



#### 用户

数据库: /var/lib/samba/private/passdb.tdb

工具: smbpasswd pdbedit

必须使系统用户, /sbin/nologin


1. 列出现有samba 用户
    
    smbpasswd -L

    或

    pdbedit -L -v

1. 添加samba用户

    smbpasswd -a <user>

    或者 

    pdbedit -a -u <user>


1. 修改用户密码

    smbpasswd <user>



    -a                   add user
    -d                   disable user
    -e                   enable user
    -x                   delete user

    -m                   machine trust account
    -n                   set no password
    -W                   use stdin ldap admin password
    -w PASSWORD          ldap admin password
    -i                   interdomain trust account


1. smbstatus - report on current Samba connections




apt install -y samba-client

    smbclient - ftp-like client to access SMB/CIFS resources on servers

smbclient -L 192.168.1.1 -U administrator           //默认用户是root, 列出有哪些共享的资源


smbclient //192.168.1.1/share -U administrator           //默认用户是root, 列出有哪些共享的资源


