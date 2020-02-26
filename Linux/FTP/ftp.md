### ftp、sftp、vsftp、vsftpd的区别

1. ftp 是File Transfer Protocol的缩写，文件传输协议，用于在网络上进行文件传输的一套标准协议，使用客户/服务器模式。它属于网络传输协议的应用层。
    只是文件传输协议的意思，而实现文件传输协议的服务器和客户端软件非常多，vsftp就是服务器端的一个软件名称，服务器端软件当然需要一个进程来运行了，对于vsftp后台进程就是vsftpd。当然FTP有客户端软件，cuteftp，ws-ftp太多了。
    
    ftp - classical file transfer client
    tftp - Trivial file transfer protocol client
    tftpd - Trivial file transfer protocol server

1. tftp 
    Trivial ftp 
    very simple transfer protocol
    主要用于局域网，配置网络设备，如防火墙、路由器 传输配置文件和固件文件
    使用UDP
    没有任何安全性

1. sftp 是SSH File Transfer Protocol的缩写，安全文件传输协议；
    Secure File Transfer Protocol
    使用22端口
    SFTP为SSH的一部分, SFTP本身没有单独的守护进程，它必须使用SSHD守护进程（端口号默认是22）来完成相应的连接操作
    sftp是基于ssh协议的加密ftp传输协议。
    sftp是不需要另外安装的，因为是SSH自带的，所以用ROOT用SFTP（不是FTP）直接可以登陆主目录。注意是sftp协议.
    sftp 走的是ssh 协议 开启了sshd 就相当于开启了sftp.
    SFTP与FTP有着几乎一样的语法和功能
    root可以登陆
 

1. vsftp 是一个基于GPL发布的类Unix系统上使用的ftp服务器软件，它的全称是Very Secure FTP从此名称可以看出来，编制者的初衷是代码的安全；
    vsftpd是一款ftp服务器，支持ftp协议，不支持sftp协议
    vsftpd - lightweight, efficient FTP server written for security
    vsftpd — Very Secure FTP Daemon
    
1. Ftps

    一种多传输协议，相当于加密版的FTP。当你在FTP服务器上收发文件的时候，你面临两个风险。第一个风险是在上载文件的时候为文件加密。第二个风险是，这些文件在你等待接收方下载的时候将停留在FTP服务器上，这时你如何保证这些文件的安全。你的第二个选择（创建一个支持SSL的FTP服务器）能够让你的主机使用一个FTPS连接上载这些文件。这包括使用一个在FTP协议下面的SSL层加密控制和数据通道。一种替代FTPS的协议是安全文件传输协议(SFTP)。这个协议使用SSH文件传输协议加密从客户机到服务器的FTP连接。

    FTPS是在安全套接层使用标准的FTP协议和指令的一种增强型FTP协议，为FTP协议和数据通道增加了SSL安全功能。FTPS也称作“FTP-SSL”和“FTP-over-SSL”。SSL是一个在客户机和具有SSL功能的服务器之间的安全连接中对数据进行加密和解密的协议。

    和sftp连接方法类似，在windows中可以使用FileZilla等传输软件来连接FTPS进行上传，下载文件，建立，删除目录等操作,在FileZilla连接时，有显式和隐式TLS/SSL连接之分，连接时也有指纹提示。


1. vsftpd 是very secure FTP daemon的缩写，安全性是它的一个最大的特点。vsftpd 是一个 UNIX 类操作系统上运行的服务器的名字，它可以运行在诸如 Linux、BSD、Solaris、 HP-UNIX等系统上面，是一个完全免费的、开放源代码的ftp服务器软件；


    sftp emulates the ftp synatx, but it's not actually ftp at all, just running through ssh instead. you can ftp (with or without ssl) to a vsftpd server, but you can't ftp to an sftp server, you only sftp / scp to it


#### SFTP 和FTPS的区别

简单的讲：sftp协议是ssh中的一条独立的协议，利用sftp服务器就可以传输数据。而ftps是ftp-over-ssl的意思，即ftp借助ssl协议加密传输，不但要用ftp服务器还要用ssl协议加密。（如果是ftp-over-ssh，就是完全不同于sftp的传输方式了，就是利用ftp服务器和ssh协议加密传输数据。 ）



客户端工具

linux
    ftp
        apt install ftp

        ftp 192.168.3.107
        用户名
        密码


        ftp
        open 192.168.3.107
        用户名
        密码


        ftp://user:pass@192.168.3.107 浏览器
    

        匿名用户的用户名是: ftp , 密码无需输入

    lftp
        apt install lftp

        lftp 192.168.3.107  默认使用匿名账号登陆
            lftp 192.168.3.107: 匿名账号提示符
            lftp bill@192.168.3.107: local user 账号提示符

                1. 使用匿名账号登陆后，user 进行登陆
                1. lftp 192.168.3.107 -ubill,bill密码
                1. lftp bill@192.168.3.107


        lcd 

        get：下载指定文件get filename [newname](filename为下载的FTP服务器上的文件名，newname为保存在本都计算机上时使用的名字，如果不指定newname，文件将以原名保存
        mget：下载多个文件mget filename [filename ....]（mget命令支持通配符“”和“?”，比如：mget .mp3 表示下载FTP服务器当前目录下的所有扩展名为mp3的文件。）
        put：上传指定文件put filename [newname]
        send：上传指定文件send filename [newname]  上传速度send却要比put快很多

        rename filename newfilename：重命名FTP服务器上的文件

        deletefilename：删除FTP服务器上的文件



    sftp
        lcd path                           Change local directory to 'path'
        lls [ls-options [path]]            Display local directory listing
        lmkdir path                        Create local directory
        lpwd                               Print local working directory
        rename oldpath newpath             Rename remote file
        rm path                            Delete remote file

type：查看当前的传输方式
ascii：设定传输方式为ASCII码方式
binary：设定传输方式为二进制方式




### 访问方式

浏览器方式
    ftp://192.168.1.1

命令行
    ftp 192.168.1.1


### 控制连接

默认主动模式

服务端端口 21 TCP 用于传输命令

在整个会话期间保持打开状态

服务端和客户端的数据传输，由服务器主动发起连接(主动模式)

被动模式的目的
    为了避免本地防火墙的阻拦, 数据传输的请求由客户端发起，服务端的端口就不是20了，这个端口由21端口设定

### 数据连接

文件传输时才建立，传输完毕就关闭

主动模式
    服务器端口 20 TCP 用于传输文件
    建立数据通道时，是服务器主动连接客户端，称为主动模式

被动模式
    客户端主动发送数据, 随机选择端口，服务器被动接受数据时，服务器随机选择端口，这称为被动模式




## 安装

apt install vsftpd

vi /etc/vsftpd.conf

    
    ```
    anonymous_enable=NO
    ```

会创建ftp用户，anonymous 就是这个用户

### 配置

/etc/ftpusers       黑名单

man 5 vsftpd.conf

```
# 如果启用，vsftpd以独立进程模式运行。此时，vsftpd不能由inetd启动。vsftpd自己监听所有进来的连接。
# If enabled, vsftpd will run in standalone mode. This means that vsftpd must not be run from an inetd of some kind. Instead, the vsftpd executable is run once directly. vsftpd itself will then take care of listening for and handling incoming connections.

listen=NO


listen_ipv6=YES
listen_ipv6=NO


# 允许匿名用户 ftp 和 anonymous
anonymous_enable=YES


# uncomment this to allow local users to log in
local_enable=YES
local users 登陆后的默认目录是 家目录

root 不能登陆


# uncomment this to enable any from of FTP write command.
#不开启这个选项的话，没有写入权限，即使local users
write_enable=YES


# This option represents a directory which vsftpd will try to change into after a local (i.e. non-anonymous) login. Failure is silently  ignored.

local_root=/data/ftp


# 如果启动这个选项，那么使用者第一次进入一个目录时，会检查该目录下是否有.message这个档案，如果有，则会出现此档案的内容，通常这个档案会放置欢迎话语，或是对该目录的说明。默认值为开启。
ftp 会显示，但是lftp不显示
# 搭配 message_file=.message
dirmessage_enable=YES


# If  set  to YES, local users will be (by default) placed in a chroot() jail in their home directory after login.  Warning: This option has
security implications, especially if the users have upload permission, or shell access. Only enable if you know what you are doing.   Note
that these security implications are not vsftpd specific. They apply to all FTP daemons which offer to put local users in chroot() jails.

可以配合local_root进行限制

chroot_local_user=YES


# If activated, you may provide a list of local users who are placed in a chroot() jail in their home directory upon login. The  meaning  is
# slightly  different if chroot_local_user is set to YES. In this case, the list becomes a list of users which are NOT to be placed in a ch‐
# root() jail.  By default, the file containing this list is /etc/vsftpd.chroot_list, but you may override this  with  the  chroot_list_file
# setting.

chroot_list_enable

Default: NO

chroot_local_user
chroot_list_enable
chroot_list_file



use_localtime=YES
xferlog_enable=YES      启用上传/下载日志记录
connect_from_port_20=YES
secure_chroot_dir=/var/run/vsftpd/empty
pam_service_name=vsftpd
rsa_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem
rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
ssl_enable=NO

ftpd_banner=Welcome to FTP service. 欢迎语句，在使用shell时可以看到

pasv_enable         默认???


虚拟用户的设置
pam_service_name=vsftpdbill
guest_enable=YES
iguest_username=ftp
user_config_dir=/etc/vsftpd/vsftpd_user_conf
virtual_use_local_privs=YES     # 虚拟用户拥有系统用户的权限
    
    vim /etc/vsftpd/vsftpd_user_config/user1.conf
        local_root=/data/ftp/user1
        write_enable=YES
        anon_world_readable_only=NO
        anon_upload_enable=YES
        anon_mkdir_write_enable=YES
        anon_other_write_enable=YES

        

#日志

xferlog_enable
              If  enabled, a log file will be maintained detailling uploads and downloads.  By default, this file will be placed at /var/log/vsftpd.log,
              but this location may be overridden using the configuration setting vsftpd_log_file.


----------
chroot_local_user #是否将所有用户限制在主目录,YES为启用 NO禁用.(该项默认值是NO,即在安装vsftpd后不做配置的话，ftp用户是可以向上切换到要目录之外的)

chroot_list_enable #是否启动限制用户的名单 YES为启用  NO禁用(包括注释掉也为禁用)

chroot_list_file=/etc/vsftpd/chroot_list #是否限制在主目录下的用户名单，至于是限制名单还是排除名单，这取决于chroot_local_user的值，我们可以这样记忆： chroot_local_user总是一个全局性的设定，其为YES时，全部用户被锁定于主目录，其为NO时，全部用户不被锁定于主目录。那么我们势必需要在全局设定下能做出一些“微调”，即，我们总是需要一种“例外机制"，所以当chroot_list_enable=YES时，表示我们“需要例外”。而”例外“的含义总是有一个上下文的，即，当”全部用户被锁定于主目录“时（即chroot_local_user=YES），"例外"就是：不被锁定的用户是哪些；当"全部用户不被锁定于主目录"时（即chroot_local_user=NO），"例外"“就是：要被锁定的用户是哪些。这样解释和记忆两者之间的关系就很清晰了！

```


### 命令
useradd kefu
echo kefu | passwd --stdin kefu



### FTP 虚拟用户

创建虚拟账号身份的文件(不要出现空行或者多余的空格)
vim /etc/vsftpd/loginusers

fptuser1
password1
fptuser2
password2

将刚添加的vftpuser.txt虚拟用户口令文件转换成系统识别的口令认证文件。

一
apt install db-util

二
db_load  -T -t hash -f /etc/vsftpd/vsftpduser.txt /etc/vsftpd/vsftpduser.db

    -T     The -T option allows non-Berkeley DB applications to easily load text files into databases.
    -t     Specify  the  underlying access method.  If no -t option is specified, the database will be loaded into a database of the same type as was
                  dumped; for example, a Hash database will be created if a Hash database was dumped.
    -f     Read from the specified input file instead of from the standard input.

三
chmod 600 /etc/vsftpd/vsftpduser*

四
vi /etc/pam.d/vsftpdbill
account required        pam_userdb.so   db=/etc/vsftpd/loginuser.db
auth    required        pam_userdb.so   db=/etc/vsftpd/loginuser.db


/usr/share/doc/vsftpd/example/virtual_users/

五
vi /etc/vsftpd.conf


guest_enable=YES    //允许虚拟用户访问
      If enabled, all non-anonymous logins are classed as "guest" logins. A guest login is remapped to the user specified in the  guest_username
      setting.

guest_username=ftp  //虚拟用户映射为本地的用户名

pam_service_name=   //pam文件的名称


六 建立各个虚拟用户自身的配置文件

mkdir /etc/vsftpd/vsftpd_user_conf

vi /etc/vsftpd.conf
    user_config_dir=/etc/vsftpd/vsftpd_user_conf

vi /etc/vsftpd/vsftpd_user_conf/user1
    local_root=                     #ftp目录下变的一个目录???
    write_enable=YES                #开放匿名用户写权限
    anon_world_readable_only=NO     #开放匿名用户下载权限
    anon_upload_enable=YES          #开放匿名用户上传权限
    anon_mkdir_write_enable=YES     #开放匿名用户创建目录的权限
    anon_other_write_enable=YES     #开放匿名用户删除和重命名的权限
