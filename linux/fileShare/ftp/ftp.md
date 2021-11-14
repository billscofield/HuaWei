### ftp、sftp、vsftp、vsftpd的区别

1. ftp 是File Transfer

   Protocol的缩写，文件传输协议，用于在网络上进行文件传输的一套标准协议，使用客
   户/服务器模式。它属于网络传输协议的应用层。

   只是文件传输协议的意思，而实现文件传输协议的服务器和客户端软件非常多，vsftp
   就是服务器端的一个软件名称，服务器端软件当然需要一个进程来运行了，对于vsftp
   后台进程就是vsftpd。当然FTP有客户端软件，cuteftp，ws-ftp太多了。
    
    ftp     
        - classical file transfer client tftp    
        - Trivial(简单的) file transfer protocol client tftpd   
        - Trivial file transfer protocol server

1. tftp Trivial ftp very simple transfer protocol

   主要用于局域网，配置网络设备，如防火墙、路由器 传输配置文件和固件文件

   使用UDP 没有任何安全性

1. sftp 是SSH File Transfer Protocol的缩写，安全文件传输协议； Secure File

   Transfer Protocol 使用22端口 SFTP为SSH的一部分,

   SFTP本身没有单独的守护进程，它必须使用SSHD守护进程（端口号默认是22）来完成相
   应的连接操作

   sftp是基于ssh协议的加密ftp传输协议。

   sftp是不需要另外安装的，因为是SSH自带的，所以用ROOT用SFTP（不是FTP）直接可以
   登陆主目录。注意是sftp协议.

   sftp 走的是ssh 协议 开启了sshd 就相当于开启了sftp.

   SFTP与FTP有着几乎一样的语法和功能 root可以登陆
 

1. vsftp 是一个基于GPL发布的类Unix系统上使用的ftp服务器软件，它的全称是Very

   Secure FTP从此名称可以看出来，编制者的初衷是代码的安全；

   vsftpd是一款ftp服务器，支持ftp协议，不支持sftp协议 vsftpd - lightweight,

   efficient FTP server written for security vsftpd — Very Secure FTP Daemon
    
1. Ftps

    一种多传输协议，相当于加密版的FTP。当你在FTP服务器上收发文件的时候，你面临
    两个风险。第一个风险是在上载文件的时候为文件加密。第二个风险是，这些文件在
    你等待接收方下载的时候将停留在FTP服务器上，这时你如何保证这些文件的安全。你
    的第二个选择（创建一个支持SSL的FTP服务器）能够让你的主机使用一个FTPS连接上
    载这些文件。这包括使用一个在FTP协议下面的SSL层加密控制和数据通道。一种替代
    FTPS的协议是安全文件传输协议(SFTP)。这个协议使用SSH文件传输协议加密从客户机
    到服务器的FTP连接。

    FTPS是在安全套接层使用标准的FTP协议和指令的一种增强型FTP协议，为FTP协议和数
    据通道增加了SSL安全功能。FTPS也称作“FTP-SSL”和“FTP-over-SSL”。SSL是一个在客
    户机和具有SSL功能的服务器之间的安全连接中对数据进行加密和解密的协议。

    和sftp连接方法类似，在windows中可以使用FileZilla等传输软件来连接FTPS进行上
    传，下载文件，建立，删除目录等操作,在FileZilla连接时，有显式和隐式TLS/SSL连
    接之分，连接时也有指纹提示。


1. vsftpd 是very secure FTP daemon的缩写，安全性是它的一个最大的特点。vsftpd

   是一个 UNIX 类操作系统上运行的服务器的名字，它可以运行在诸如

   Linux、BSD、Solaris、

   HP-UNIX等系统上面，是一个完全免费的、开放源代码的ftp服务器软件；


    sftp emulates the ftp synatx, but it's not actually ftp at all, just
    running through ssh instead. you can ftp (with or without ssl) to a vsftpd
    server, but you can't ftp to an sftp server, you only sftp / scp to it


#### SFTP 和FTPS的区别

简单的讲：sftp协议是ssh中的一条独立的协议，利用sftp服务器就可以传输数据。而ftps
是ftp-over-ssl的意思，即ftp借助ssl协议加密传输，不但要用ftp服务器还要用ssl协议
加密。（如果是ftp-over-ssh，就是完全不同于sftp的传输方式了，就是利用ftp服务器和
ssh协议加密传输数据。）



客户端工具

linux ftp apt install ftp

        ftp 192.168.3.107 用户名 密码


        ftp open 192.168.3.107 用户名 密码


        ftp://user:pass@192.168.3.107 浏览器
    

        匿名用户的用户名是: ftp , 密码无需输入

    lftp apt install lftp

        lftp 192.168.3.107  默认使用匿名账号登陆 lftp 192.168.3.107:

        匿名账号提示符 lftp bill@192.168.3.107: local user 账号提示符

                1. 使用匿名账号登陆后，user 进行登陆

                1. lftp 192.168.3.107 -ubill,bill密码

                1. lftp bill@192.168.3.107


        lcd 

        get：下载指定文件get filename

        [newname](filename为下载的FTP服务器上的文件名，newname为保存在本都计算
        机上时使用的名字，如果不指定newname，文件将以原名保存

        mget：下载多个文件mget filename [filename

        ....]（mget命令支持通配符“”和“?”，比如：mget .mp3

        表示下载FTP服务器当前目录下的所有扩展名为mp3的文件。）

        put：上传指定文件put filename [newname] send：上传指定文件send filename

        [newname]  上传速度send却要比put快很多

        rename filename newfilename：重命名FTP服务器上的文件

        deletefilename：删除FTP服务器上的文件



    sftp lcd path                           Change local directory to 'path'

    lls [ls-options [path]]            Display local directory listing lmkdir

    path                        Create local directory lpwd Print local working

    directory rename oldpath newpath             Rename remote file rm path

    Delete remote file

type：查看当前的传输方式 ascii：设定传输方式为ASCII码方式

binary：设定传输方式为二进制方式




### 访问方式

浏览器方式 ftp://192.168.1.1

命令行 ftp 192.168.1.1



FTP的控制连接总是由客户端首先发起的，

主动数据连接是由服务器端发起的，

被动数据连接是由客户端发起的。



### 控制连接

**默认主动模式**

服务器端21端口进行监听，客户端进行登录，21号端口进行验证，验证成功，服务器20端口主动连接客户端的端口

    服务端端口 21 TCP 用于传输命令

在整个会话期间保持打开状态

服务端和客户端的数据传输，由服务器主动发起连接(主动模式)


被动模式的目的 为了避免本地防火墙的阻拦,

数据传输的请求由客户端发起，服务端的端口就不是20了，这个端口由21端口设定

    我们只能控制自己的,

    防火墙也是，当服务器主动时，客户端的防火墙我们控制不了，很有可能就被墙了，而被动模式就好了

### 数据连接

文件传输时才建立，传输完毕就关闭

主动模式 服务器端口 20 TCP 用于传输文件

建立数据通道时，是服务器主动连接客户端，称为主动模式

被动模式 客户端主动发送数据,

随机选择端口，服务器被动接受数据时，服务器随机选择端口，这称为被动模式

主动（FTP Port）模式和被动（FTP Passive）模式


## 安装

apt install vsftpd

vi /etc/vsftpd.conf

    ``` 
    anonymous_enable=NO 

    ```

会创建ftp用户，anonymous 就是这个用户


### 相关配置文件(vsftpd, very secure FTP Daemon)

主配置文件 /etc/vsftpd/vsftpd.conf

用户控制列表文件(FTP 明文的密码) /etc/ftpusers    (黑名单)

/etc/vsftpd/user_list   (可以通过配置文件变成白名单)


### 相关用户

1. 匿名用户 anonymous 或 ftp

1. 本地用户 linux系统用户,linux用户密码 有安全隐患 但是 最简单,
   不用配置，系统用户直接登录 登录也是/home/aaa 目录
   如果不加配置，用户能浏览所有根目录, 极不安全, 没有限制在家目录下

1. 虚拟用户
    


### 配置

listen=NO listen_port If vsftpd is in standalone mode, this is the port it will

listen on for incoming FTP connections.

    Default: 21

listen=YES

绑定到listen_port指定的端口,既然都绑定了也就是每时都开着的,就是那个什么standalone模式

listen      If enabled, vsftpd will run in standalone mode.  This means that
vsftpd must not be run from an inetd of some kind. Instead, the vsftpd
executable is run once directly.  vsftpd itself will then take care of
listening for and handling incoming connections.

            Default: NO

---

local_umask The value that the umask for file creation is set to for local
users. (文件的权限) NOTE! If you want to specify octal values, remember the "0"
prefix otherwise the value will be treated as a base 10 integer!

    Default: 077

---

dirmessage_enable If enabled, users of the FTP server can be shown messages
when they first enter a new directory.  By default, a directory is scanned for
the file .message, but that may be overridden with the  configuration  setting
message_file.

    Default: NO (but the sample config file enables it)

ftpd_banner This string option allows you to override the greeting banner
displayed by vsftpd when a connection first comes in.

    Default: (none - default vsftpd banner is displayed)

---

connect_from_port_20=YES　　 使用标准的20端口来连接ftp


listen_port = 21

download_enable = yes

max_clients = 0

max_per_ip = 0      限制同一IP地址的并发连接数


--- 被动模式 pasv_enable = yes pasv_min_port = 24500 pasv_max_port = 24600

accept_timeout = 60     被动模式的 The timeout, in seconds, for a remote client
to establish connection with a PASV style data connection.

    Default: 60 ---




--- userlist_file This option is the name of the file loaded when the
userlist_enable option is active.

    Default: /etc/vsftpd.user_list

userlist_enable If  enabled,  vsftpd will load a list of usernames, from the
filename given by userlist_file.  If a user tries to log in using a name in
this file, they will be denied before they are asked for a password.  This may
be useful in preventing cleartext passwords being transmitted. See also
userlist_deny.





/etc/ftpusers       黑名单

man 5 vsftpd.conf

``` #
如果启用，vsftpd以独立进程模式运行。此时，vsftpd不能由inetd启动。vsftpd自己监听所有进来的连接。
# If enabled, vsftpd will run in standalone mode. This means that vsftpd must
not be run from an inetd of some kind. Instead, the vsftpd executable is run
once directly. vsftpd itself will then take care of listening for and handling
incoming connections.

listen=NO


listen_ipv6=YES listen_ipv6=NO


# 允许匿名用户 ftp 和 anonymous anonymous_enable=YES


# uncomment this to allow local users to log in local_enable=YES local users

登陆后的默认目录是 家目录

root 不能登陆


# uncomment this to enable any from of FTP write command.

#不开启这个选项的话，没有写入权限，即使local users write_enable=YES


# This option represents a directory which vsftpd will try to change into after

a local (i.e. non-anonymous) login. Failure is silently  ignored.

local_root=/data/ftp


#如果启动这个选项，那么使用者第一次进入一个目录时，会检查该目录下是否有.message
这个档案，如果有，则会出现此档案的内容，通常这个档案会放置欢迎话语，或是对该目
录的说明。默认值为开启。

ftp 会显示，但是lftp不显示 # 搭配 message_file=.message dirmessage_enable=YES


# If  set  to YES, local users will be (by default) placed in a chroot() jail
in their home directory after login.  Warning: This option has security
implications, especially if the users have upload permission, or shell access.
Only enable if you know what you are doing.   Note that these security
implications are not vsftpd specific. They apply to all FTP daemons which offer
to put local users in chroot() jails.

可以配合local_root进行限制

chroot_local_user=YES


# If activated, you may provide a list of local users who are placed in a
chroot() jail in their home directory upon login. The  meaning  is # slightly
different if chroot_local_user is set to YES. In this case, the list becomes a
list of users which are NOT to be placed in a ch‐ # root() jail.  By default,
the file containing this list is /etc/vsftpd.chroot_list, but you may override
this  with  the  chroot_list_file # setting.

chroot_list_enable

Default: NO

chroot_local_user chroot_list_enable chroot_list_file



use_localtime=YES xferlog_enable=YES      启用上传/下载日志记录
connect_from_port_20=YES secure_chroot_dir=/var/run/vsftpd/empty
pam_service_name=vsftpd rsa_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem
rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key ssl_enable=NO

ftpd_banner=Welcome to FTP service. 欢迎语句，在使用shell时可以看到

pasv_enable         默认???


虚拟用户的设置 pam_service_name=vsftpdbill guest_enable=YES iguest_username=ftp

user_config_dir=/etc/vsftpd/vsftpd_user_conf virtual_use_local_privs=YES     #

虚拟用户拥有系统用户的权限
    
    vim /etc/vsftpd/vsftpd_user_config/user1.conf local_root=/data/ftp/user1
    write_enable=YES anon_world_readable_only=NO anon_upload_enable=YES
    anon_mkdir_write_enable=YES anon_other_write_enable=YES


#日志

xferlog_enable If  enabled, a log file will be maintained detailling uploads
and downloads.  By default, this file will be placed at /var/log/vsftpd.log,
but this location may be overridden using the configuration setting
vsftpd_log_file.


---------- chroot_local_user #是否将所有用户限制在主目录,YES为启用

NO禁用.(该项默认值是NO,即在安装vsftpd后不做配置的话，ftp用户是可以向上切换到要目录之外的)

chroot_list_enable #是否启动限制用户的名单 YES为启用 

NO禁用(包括注释掉也为禁用)

chroot_list_file=/etc/vsftpd/chroot_list #是否限制在主目录下的用户名单，至于是限制名单还是排除名单，这取决于chroot_local_user的值，我们可以这样记忆：

chroot_local_user总是一个全局性的设定，其为YES时，全部用户被锁定于主目录，其为NO时，全部用户不被锁定于主目录。那么我们势必需要在全局设定下能做出一些“微调”，即，我们总是需要一种“例外机制"，所以当chroot_list_enable=YES时，表示我们“需要例外”。而”例外“的含义总是有一个上下文的，即，当”全部用户被锁定于主目录“时（即chroot_local_user=YES），"例外"就是：不被锁定的用户是哪些；当"全部用户不被锁定于主目录"时（即chroot_local_user=NO），"例外"“就是：要被锁定的用户是哪些。这样解释和记忆两者之间的关系就很清晰了！


```


### 命令 useradd kefu echo kefu | passwd --stdin kefu


### 匿名用户

anon-upload_enable = yes anon_mkdir_write_enable = yes anon_umask = 600
anon_root This option represents a directory which vsftpd will try to change
into after an anonymous login. Failure is silently ignored.  Default: (none)

    匿名用户是被现在在了一个目录中，被当做根目录 , **/var/ftp/**
    ,映射的不能登录的那个系统用户的家目录 (/srv/ftp    root:ftp)



### 本地用户

local_root   **所有**登录的用户的根目录

local__max_rage=0

local_mask





chroot_local_user = yes

### FTP 虚拟用户

创建虚拟账号身份的文件(不要出现空行或者多余的空格) vim /etc/vsftpd/loginusers

fptuser1 password1 fptuser2 password2

将刚添加的vftpuser.txt虚拟用户口令文件转换成系统识别的口令认证文件。

一 虚拟用户口令文件 vi /etc/vsftpd/vsftpduser.txt

二 虚拟用户口令认证文件 apt install db-util db_load  -T -t hash -f

/etc/vsftpd/vsftpduser.txt /etc/vsftpd/vsftpduser.db

    -T     The -T option allows non-Berkeley DB applications to easily load
    text files into databases.  -t     Specify  the  underlying access method.
    If no -t option is specified, the database will be loaded into a database
    of the same type as was dumped; for example, a Hash database will be
    created if a Hash database was dumped.  -f     Read from the specified
    input file instead of from the standard input.

三 

``chmod 600 /etc/vsftpd/vsftpduser*


四 vi /etc/pam.d/vsftpdbill account required        pam_userdb.so

db=/etc/vsftpd/loginuser.db auth    required        pam_userdb.so

db=/etc/vsftpd/loginuser.db


/usr/share/doc/vsftpd/example/virtual_users/

五 vi /etc/vsftpd.conf


guest_enable=YES    //允许虚拟用户访问 If enabled, all non-anonymous logins are
classed as "guest" logins. A guest login is remapped to the user specified in
the  guest_username setting.

guest_username=ftp  //虚拟用户映射为本地的用户名

pam_service_name=vsftpd   //pam文件的名称


六 建立各个虚拟用户自身的配置文件

mkdir /etc/vsftpd/vsftpd_user_conf

vi /etc/vsftpd.conf user_config_dir=/etc/vsftpd/vsftpd_user_conf

vi /etc/vsftpd/vsftpd_user_conf/user1 local_root= #ftp目录下变的一个目录???

write_enable=YES                #开放匿名用户写权限 anon_world_readable_only=NO


#开放匿名用户下载权限 anon_upload_enable=YES #开放匿名用户上传权限

anon_mkdir_write_enable=YES #开放匿名用户创建目录的权限

anon_other_write_enable=YES #开放匿名用户删除和重命名的权限

## 配置虚拟用户登录的步骤

1. 添加虚拟用户口令文件 vi /etc/vsftpd/vusers.txt 奇数行：用户名；偶数行：密码
   用户名a a密码 用户名b b密码

1. 生成虚拟用户口令认证文件 cd /etc/vsftpd/ apt install db5.3-util db5.3_load
   -T -t hash -f /etc/vsftpd/vusers.txt /etc/vsftpd/vusers.db -T     The -T
   option allows non-Berkeley DB applications to easily load text files into
   databases.  -t     Specify the underlying access method.  If no -t option is
   specified,  the  database  will  be loaded  into  a database of the same
   type as was dumped; for example, a Hash database will be created if a Hash
   database was dumped.  -f     Read from the specified input file instead of
   from the standard input.




1. 编辑vsftpd的PAM认证文件 /etc/vsftpd.conf 配置文件中的
   pam_service_name=vsftpd

    vi /etc/pad.m/vsftpd 默认的配置文件是本地用户的,

    可以注释掉，这样本地用户就不能登录了，因为本地用户登录时的验证依然依赖这个文件

    ???虚拟用户不是也依赖一个系统用户吗?

    ``` /etc/vsftpd.conf local_enable Controls  whether  local  logins  are
    permitted  or not. If enabled, normal user accounts in /etc/passwd (or
    wherever your PAM config references) may be used to log in. This must be
    en‐ able for any non-anonymous login to work, including virtual users.


    pam_service_name=vsftpd ```



    ```/etc/pam.d/vsftpd 加入这两行 找到你的环境pam_userdb.so所在位置。find /
    -name security -type d 查找下

    auth required /lib/security/pam_userdb.so db=/etc/vsftpd/vusers account
    required /lib/security/pam_userdb.so db=/etc/vsftpd/vusers


    下面这两行是Debian的, 上边的应该是centos的 auth
    /lib/x86_64-linux-gnu/security/pam_userdb.so db=/etc/vsftpd/vusers account
    /lib/x86_64-linux-gnu/security/pam_userdb.so db=/etc/vsftpd/vusers
    ???然后本地用户也不能登录了,不注释其他行，系统用户也不能登录，组织到是什么原因

    其他行必须注释掉以禁用本地用户登录, 但是不能在配置文件中 设置
    local_enable=NO ```

1. 建立本地映射用户，并设置宿主目录权限 useradd -d /ftphome -s /sbin/nologin
   vuser chmod 755 /ftphome  家目录都是这样的权限

1. 修改配置文件 guest_enable  虚拟用户开关 If enabled, all non-anonymous logins
   are classed as "guest" logins. A guest login is remapped to the user
   specified in the guest_username setting.  Default: NO

    guest_username See the boolean setting guest_enable for a description of
    what  constitutes  a  guest  login.  This setting is the real username
    which guest users are mapped to.  Default: ftp

        ftp:x:114:123:ftp daemon,,,:/srv/ftp:/usr/sbin/nologin

        ```/etc/vsftpd.conf guest_enable=YES guest_username=vuser



        userlist_enable=YES userlist_deny=NO        //userlist_file 不 deny ```



1. 重启vsftpd服务

1. 调整虚拟用户权限 现在没有上传权限

    
    虚拟用户的权限用的是匿名用户的权限 anon_upload_enable=YES
    anon_mkdir_write_enable=YES anon_other_write_enable=YES



注意1:

从2.3.5之后，vsftpd增强了安全检查，如果用户被限定在了其主目录下，则该用户的主目录不能再具有写权限了！如果检查发现还有写权限，就会报该错误。

 要修复这个错误，可以用命令chmod a-w
/home/user去除用户主目录的写权限，注意把目录替换成你自己的。或者你可以在vsftpd的配置文件中增加下列两项中的一项：

allow_writeable_chroot=YES

---

local_root This option represents a directory which vsftpd will try to change
into after a  local  (i.e.  non-anonymous) login. Failure is silently ignored.
如果不设置的话，虚拟用户进入到映射用户的家目录



### 为每个虚拟用户配置独立的配置文件

user_config_dir This  powerful  option allows the override of any config option
specified in the manual page, on a per-user basis. Usage is simple, and is best
illustrated with an  example.  If  you  set user_config_dir  to be
/etc/vsftpd_user_conf and then log on as the user "chris", then vsftpd will
apply the settings in the file /etc/vsftpd_user_conf/chris for the duration of
the  ses‐ sion.  The  format  of this file is as detailed in this manual page!
PLEASE NOTE that not all settings are effective on a per-user basis. For
example, many  settings  only  prior  to  the user's  session  being  started.
Examples of settings which will not affect any behviour on a per-user basis
include listen_address, banner_file,  max_per_ip,  max_clients,  xferlog_file,
etc.

    Default: (none)

主配置文件去掉 anon 权限

    ```vi /etc/vsftpd.conf user_config_dir=/etc/vsftpd/vusers_dir

        mkdir vusers_dir

        vi 虚拟用户名

        anon_upload_enable=YES anon_mkdir_write_enable=YES
        anon_other_write_enable=YES local_root=/路径
        可是任何路径，不过还是在映射的linux用户目录下的目录吧

    ```


## client

help    列出所有命令

pwd

get     下载, 不支持目录的下载 get a.txt


put     上传 put a.txt


mget 下载，也不是目录的下载，而是目录下所有文件下载，所有文件到客户端当前目录,
没有原来的层次结构了 mput    上传



不支持断点 不支持目录的下载(命令行)





## 亲自实践

要开启被动模式 pasv_enable=YES pasv_min_port= pasv_max_port=


    >ls
    200 PORT command successful. Consider using PASV.

    >quote PASV
        227 Entering Passive Mode (192,168,200,1,156,65).

    当 pasv_enable=NO时
        >ls
        200 PORT command successful. Consider using PASV.

        >quote PASV
        550 Permission denied.


    quote PASV 查看是否是被动模式




