## samba

### 

ftp 不能挂载到本地

    看不出真实的路径

    不能直接修改文件,需要下载修改然后上传覆盖


nfs 对windows支持不好

    可以看出真实的路径



SMB: Server Message Block 服务器消息块, IBM开发，最早是DOS网络文件共享协议

    Barry Feigenbaum originally designed SMB at IBM in early 1983 with the aim of turning DOS INT 21h local file access into a networked file system.

    是一种在局域网上共享文件和打印机的一种通用协议，它为局域网内的不同计算机之间提供文件以及打印机等资源的共享服务。

    SMB是客户机/服务器型协议

    默认局域网


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

### 登录验证模式

1. share匿名验证

1. user 本地用户

    账号:passwd文件 
    密码:passdb.tdb  而ftp用的是/etc/shadow

1. 别名用户(虚拟用户)


### samba 配置文件

apt install -y samba samba-client

samba-client(smbclient命令)

    有两个服务: 
        smb:  139 445
        nmt

    启动：

        systemctl enable smb nmt
        systemctl start smb nmt

        chkconfig smb on
        chkconfig --level 234 5smb on


    端口号：139 445

/etc/samba/smb.conf

```
分为两部分，global 和 share

[global]

   workgroup = WORKGROUP
   server string = 描述信息

    netbios name = xxx                      //通过xxx访问，需要启动nmb服务才可以生效
    interfaces = lo ens33                   //哪块网卡, 也可以写 192.168.1.0/24, 空格分隔
    hosts allow = 127. 192.168.12.          //hosts allow = 202.204.3 EXCEPT 202.204.3.30
        可以写成192.168.1.1/255.255.255.0?
    hosts deny                              //allow优先级高

---

   log file = /var/log/samba/log.%m         //%m 宏定义，客户端主机的NetBIOS名, %I: 客户端主机IP, %U:当前用户名, man 5 smb.conf | grep %
   max log size = 1000                      //KB, rotate,滚动日志
   log level = 2                            //默认没有这个，所以不会记录任何东西

---

    passdb backend = tdbsam                 //passdb backend = tdbsam:/etc/samba/private/passdb.tdb
    security = user                         //ads, domain
        share: 不需要账号密码，公开共享
        user: 需要账号和密码，私密共享
        server: 依靠其他windows来验证用户的账号和密码，是一种代理验证，
        domain: 域安全级别，使用主域控制器(PDC)来完成认证

    load printers = yes/no
---

    当windows客户端讲文件复制或移动到samba服务器共享目录时，是否保留文件在windows中的存档属性,默认no
        map archive = no

    是否保留文件在windows中的隐藏属性,默认no
        map hidden = no

    是否保留文件在windows中的只读属性,默认no
        map read only = no

    是否保留文件在windows中的系统文件属性,默认no
        map system = no

    是否保留文件在windows中的相关属性(只读、系统、隐藏),默认no
        store dos attributes = yes




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



-------------------share

[homes]                          //共享名称
    comment = 描述信息
    browseable = no             //no:隐藏共享; 需要手写目录才能访问, 同wifi ssid隐藏
    writable = yes              //所有人, 配置文件和文件系统都有权限才可以
    valid users = %S            //@组名, 宏变量 ，%S 指代用户本身, 逗号分隔
    valid users = MYDOMAIN\%S

[printers]
    comment = 
    path = /var/spool/samba
    guest ok = no               //匿名访问,public
    writable = no
    write list =                //writable为no，允许那些人可以写
    printable = yes             //是否可以打印

[share]
    path = 
    writable = yes              //
    readonly = yes|no
    read list =                 //

public 和 valid users 不能同时使用，这样public没有效果


valid users                 //逗号分隔
invalid users

# 如果希望建立一个客户帐号，去掉下面语句前面的分号"；"。同时，您必须在
# /etc/passwd中加入这个帐号的定义，否则将使用用户"nobody"作为客户帐户。
; guest account = pcguest

read list   : 指定只能读取该共享资源的用户和组
write list   : 指定能读取和写该共享资源的用户和组
admin list   : 指定能管理该共享资源(包括读写权限赋予等)的用户和组

public :指明该共享资源是否能给游客账号访问，这个开关有时也叫 "guest ok", 
    所以 guest ok 和 public 是一样的

hide dot files  : 是否像unix那样隐藏"."号开头的文件

create mode : 新建文件的属性,0755
directory mode  : 新建立的目录的属性,0755

sync always : 致命对该共享资源进行写操作后是否进行同步操作

short preserve case : 是否忽略文件名大小写
preserve case   : 保持大小写
case sensitive  : 是否大小写敏感，一般选no

mangle case: 指明混合大小写
default case: 指明缺省文件名是全部大写还是小写
force user: 强制把建立文件的属主是谁。如果我有一个目录，让来宾用户就可以删除
wide links: 是否允许共享外符号连接，比如共享资源里有个连接指向非共享资源里面的文件或目录，
    如果设置 wide links = no 将使该连接不可用

max connections :同时连接数
delete readonly :是否能删除已被定义为只读的文件

```


访问控制的方式

1. 由linux管理

    writable = yes
    setfacl 或者 chmod 777

2. 由samba管理

    chmod 777
    read only = yes
    write list = 用户,@组

    这两个配套使用

    ```
    public = yes
    browseable = yes
    writable = yes
    valid users = will      //其他人不能登录
    ```

    创建文件的默认权限
    create mask = 644

    创建目录的权限
    directory mask = 755



配置检查工具 testparm, 语法错误






#### 用户

数据库: /var/lib/samba/private/passdb.tdb

工具: smbpasswd pdbedit

必须是系统用户, /sbin/nologin


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
    -x                   delete user
    -d                   disable user
    -e                   enable user
    -n                   set no password    清除密码

    -m                   machine trust account
    -W                   use stdin ldap admin password
    -w PASSWORD          ldap admin password
    -i                   interdomain trust account


1. smbstatus - report on current Samba connections


mount -o username=abc,password=abc -t cifs //192.168.1.1/share /mnt

fstab文件永久挂载
    //192.168.1.1/share    /mnt    cifs    rw,username=abc,password=abc    0    0
    //192.168.1.1/share    /mnt    cifs    default,username=abc,password=abc    0    0


    mount -a    //挂在未挂载的


windows 登录
    \\192.168.1.1\share

windows 清空登录缓存
    net use * /del


apt install -y samba-client

    smbclient - ftp-like client to access SMB/CIFS resources on servers

smbclient -L 192.168.1.1 -U administrator           //默认用户是root, 列出有哪些共享的资源
    
    -U 用户名%密码


smbclient //192.168.1.1/share -U administrator

    -N 省略口令提示，当访问无需密码时使用




**如果没有设置上传文件的默认权限，指定用户上传的文件只有自己能修改和覆盖**


#### 别名用户

1. 添加别名(/etc/samba/smbusers)

    添加

        zhangsan = 别名
        
        (linux系统用户 = 别名)

1. 启用别名(/etc/samba/smb.conf)

    username map = /etc/samba/smbusers

1. 测试
    
    smbclient //192.168.1.1/share -U 别名





#### web管理工具

samba-swat

/etc/xinetd.d/swat

    port = 901
    only from = 
    disable = no       //yes:是关闭, no:是开启

enable xinted


http://ip:901

使用系统用户登录


