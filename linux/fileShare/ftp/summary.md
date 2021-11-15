DAS(Direct-Attached Storage)
    直连存储

NAS(Network-Attached storage): 共享的是文件夹
    ftp
    samba 不同系统间的文件夹或**设备共享**
    nfs 网络文件系统

SAN(Storage area Network)
    

MySQL
    主从
NAS
    rsync

tpc/21
tpc/20

## 服务状态码

1xx: 信息
2xx: 成功类状态
3xx: 补充类
4xx: 客户端错误
5xx: 服务器错误





vsftp 软件使用的是 ftp 协议


listen 
    If enabled, vsftpd will run in standalone mode.

    This means that vsftpd must not be run from an inetd of some kind.
    Instead, the vsftpd executable is run once directly.

    vsftpd itself will then take care of listening for and handling incoming
    connections.

    efault: NO



listen_ipv6
    Like the listen parameter, except vsftpd will listen on an IPv6 socket instead of an
    IPv4 one. 

    Note that a socket listening on the IPv6 "any" address (::) will  accept
    **both IPv6 and IPv4 connections by default.**

    This parameter and the listen parameter are mutually(互相地) exclusive.

    Default: NO

    NO的话没有端口监听，客户端报积极拒绝错误




ftpuser
user_list   userlist_enable     userlist_deny  

userlist_enable和userlist_deny两个选项联合起来针对的是：本地全体用户（除去ftpusers中的用户）和出现在user_list文件中的用户以及不在在user_list文件中的用户这三类用户集合进行的设置。
当且仅当userlist_enable=YES时：userlist_deny项的配置才有效，user_list文件才会被使用；
    当其为NO时，无论userlist_deny项为何值都是无效的，本地全体用户（除去ftpusers中的用户）都可以登入FTP

当userlist_enable=YES时，userlist_deny=YES时：user_list是一个黑名单，即：所有出现在名单中的用户都会被拒绝登入；
当userlist_enable=YES时，userlist_deny=NO时：user_list是一个白名单，即：只有出现在名单中的用户才会被准许登入(user_list之外的用户都被拒绝登入)；另外需要特别提醒的是：使用白名单后，匿名用户将无法登入！除非显式在user_list中加入一行：anonymous

[link](https://blog.csdn.net/bluishglc/article/details/42273197?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522163663141016780265422861%2522%252C%2522scm%2522%253A%252220140713.130102334.pc%255Fblog.%2522%257D&request_id=163663141016780265422861&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~blog~first_rank_v2~rank_v29-3-42273197.pc_v2_rank_blog_default&utm_term=ftp&spm=1018.2226.3001.4450)






### /etc/ftpusers: list of users disallowed FTP access. See ftpusers(5).(debian)

/etc/vsftpd/ftpusers(centos)

黑名单


    ```
    root daemon bin sys sync games man lp mail news uucp nobody
    ```

## userlist_file

    /etc/vsftpd/user_list(centos)
    /etc/vsftpd.user_list(debian 默认没有该文件)

    ```
    # vsftpd userlist
    # If userlist_deny=NO, only allow users in this file
    # If userlist_deny=YES (default), never allow users in this file, and
    # do not even prompt for a password.
    # Note that the default vsftpd pam config also checks /etc/vsftpd/ftpusers
    # for users that are denied.

    root bin daemon adm lp sync shutdown halt mail news uucp operator games nobody
    ```


1. userlist_deny   (Default:YES)
    This  option is examined if userlist_enable is activated.
    yes:黑名单
    no:白名单

    2. userlist_enable (Default:NO)
        function on userlist_file
        If a user tries to log in using a name in this file, they will be denied before they are asked for a password.
        
    3. userlist_file
        This option is the name of the file loaded when the userlist_enable option is active.
        Default: /etc/vsftpd.user_list(debian)
        Default: /etc/vsftpd/user_list(centos)




## 默认共享文件夹

其实就是 ftp 用户的家目录

/srv/ftp(Debian)   postinst
/var/ftp/pub


## 用户登录

local_enable
    This must be enable for any non-anonymous login to work, including virtual
    users.

    Default: NO(Debian/centos)





anonymous_enable
    Controls  whether  anonymous logins are permitted or not. If enabled, both
    the user‐names ftp and anonymous are recognised as anonymous logins.

    Default: NO(Debian)
    Default: YES(centos)

    密码好像是说要有个" @"

secure_email_list_enable
    Set to YES if you want only a specified list of e-mail passwords for **anonymous** logins to be accepted.

    When enabled, anonymous logins are prevented unless the password provided
    is listed in the file specified  by  the  **email_password_file** setting.  

    The  file  format  is  one password per line, no extra whitespace. The default
    filename is /etc/vsftpd.email_passwords.

    Default: NO


deny_email_enable
    If  activated, you may provide a list of **anonymous** password e-mail responses which cause
    login  to  be  denied.

    By  default,  the  file  containing  this   list   is
    /etc/vsftpd.banned_emails, but you may override this with the
    banned_email_file setting.

    Default: NO




no_anon_password
    When enabled, this prevents vsftpd from asking for an anonymous password - the anonymous
    user will log straight in.

    Default: NO










write_enable
    This controls whether any FTP commands which change the filesystem are
    allowed or not. 

    These commands are: STOR, DELE, RNFR, RNTO, MKD, RMD, APPE and SITE.

    localuser 创建文件和文件夹
    localuser 上传文件和文件夹
    Default: NO(debian/centos)

    应该是 anonymous 的先决条件

download_enable
    If set to NO, all download requests will give permission denied.
    Default: YES





local_umask

    The value that the umask for file creation is set to for local users. NOTE!
    If you  want to  specify octal values, remember the "0" prefix otherwise
    the value will be treated as a base 10 integer!

    Default: 077(debian/centos)
    一般是 022






anon_upload_enable

    If set to YES, anonymous users will be permitted to upload files  under
    certain  condi‐tions.  For  this  to work, 
        1. the option write_enable must be activated, 
        2. the anonymous ftp user must have write permission on desired upload locations. 

    This  setting  is  also required  for virtual users to upload; 

    by default, virtual users are treated with anonymous (i.e. maximally restricted) privilege.

    Default: NO(debian/centos)


anon_mkdir_write_enable

    If set to YES, anonymous users will be permitted to create new
    directories under certain conditions. For this to work, 
        1. the option write_enable must be activated, 
        2. the anonymous ftp user must have write permission on the parent directory.


    Default: NO(debian/centos)



    anonymous_enable=YES
    anon_upload_enable=YES
    如果此时给 /srv/ftp 给了 ftp 用户或ftp 用户组w的权限，,然后用匿名用户登录会报错
    但是如果是匿名用户已经连接了，再修改文件系统的权限添加w, 此时是可以上传文件的，并且不会报错


anon_world_readable_only
    When enabled, anonymous users will only be allowed to download  files
    which  are  world readable.  

    This  is recognising that the ftp user may own files, especially in the
    presence of uploads.

    只能下载全部读的文件

    Default: YES


anon_umask
    The  value  that the umask for file creation is set to for anonymous users. 

    NOTE! If you want to specify octal values, remember the  "0"  prefix
    otherwise  the  value  will  be treated as a base 10 integer!

    Default: 077


anon_other_write_enable
    If set to YES, anonymous users will be permitted to perform write operations other  than
    upload and create directory, 

    such as deletion and renaming. 

    This is generally not recom‐mended but included for completeness.

    Default: NO

    可删除和修改上传的文件









chown_uploads

    If enabled, all **anonymously uploaded files** will have the ownership  changed  to  the
    user  specified  in  the setting chown_username.  This is useful from an administra‐
    tive, and perhaps security, standpoint.

    Default: NO

chown_username
    This is the name of the user who is given ownership of anonymously  uploaded  files.
    This option is only relevant if another option, chown_uploads, is set.

    Default: root






chroot_local_user
chroot_list_enable
chroot_list_file
allow_writeable_chroot




chroot_local_user

    If set to YES, local users will be (by default) placed in a chroot() jail in their home directory after login.

    Warning: This option has security implications, especially if the users
    have upload permission, or shell access. 

    Only enable if you know what you are doing.

    Note that these security implications are not vsftpd  specific.
    They apply to all FTP daemons which offer to put local users in chroot() jails.

    Default: NO

    锁定用户登录ftp后，只能到自己的家目录下，不能随便切换到其它目录。

    vsftp出于安全性要求，如果锁定了用户的ftp登录目录，则所在目录不能有写权限。
    但是local user 却可以，为什么???


chroot_list_enable
    指定禁锢谁

    If activated, you may provide a list of local users who are placed in a chroot() jail in their home directory upon login. 

    The meaning is slightly different if chroot_local_user is set to YES. 

    **In this case, the list becomes a list of users which are NOT to be placed in a chroot() jail.**

    By default, the file containing this list is /etc/vsftpd/chroot_list, but you may override this with the chroot_list_file setting.

    Default: NO

    chroot_local_user=YES, 则chroot_list_file 是白名单
    chroot_local_user=NO,  则chroot_list_file 是黑名单


chroot_list_file
    The option is the name of a file containing a list of local users which will be placed
    in a chroot() jail in their home directory. 

    **This option is only relevant(相关的,有价值的) if the option chroot_list_enable is enabled.**

    If the option chroot_local_user is enabled, then the list file becomes a list of users to NOT place in a chroot() jail.

    Default: /etc/vsftpd/chroot_list(centos)
    Default: /etc/vsftpd.chroot_list(debian)



是否限制在主目录下的用户名单，至于是限制名单还是排除名单，这取决于chroot_local_user的值，我们可以这样记忆： 

    chroot_local_user总是一个全局性的设定，其为YES时，全部用户被锁定于主目录，其为NO时，全部用户不被锁定于主目录。

    那么我们势必需要在全局设定下能做出一些“微调”，即，我们总是需要一种“例外机制"，所以当chroot_list_enable=YES时，表示我们“需要例外”。
    而”例外“的含义总是有一个上下文的，即，当”全部用户被锁定于主目录“时（即chroot_local_user=YES），"例外"就是：不被锁定的用户是哪些；
    当"全部用户不被锁定于主目录"时（即chroot_local_user=NO），"例外"“就是：要被锁定的用户是哪些。这样解释和记忆两者之间的关系就很清晰了！



+------------------------+------------------------------------------------------------------------+-------------------------------------------------------------------------+
|                        |  chroot_local_user=YES                                                 |    chroot_local_user=NO                                                 |
+------------------------+------------------------------------------------------------------------+-------------------------------------------------------------------------+
|chroot_list_enable=YES  |  1.所有用户都被限制在其主目录下                                        |    1.所有用户都不被限制其主目录下                                       |
|                        |  2.使用chroot_list_file指定的用户列表，这些用户作为“例外”，不受限制    |    2.使用chroot_list_file指定的用户列表，这些用户作为“例外”，受到限制   |
+------------------------+------------------------------------------------------------------------+-------------------------------------------------------------------------+
|chroot_list_enable=NO   |  1.所有用户都被限制在其主目录下                                        |    1.所有用户都不被限制其主目录下                                       |
|                        |  2.不使用chroot_list_file指定的用户列表，没有任何“例外”用户            |    2.不使用chroot_list_file指定的用户列表，没有任何“例外”用户           |
+------------------------+------------------------------------------------------------------------+-------------------------------------------------------------------------+

https://blog.csdn.net/bluishglc/article/details/42398811














local_root
    This option represents a directory which vsftpd will try  to  change  into
    after  a local (i.e. non-anonymous) login. Failure is silently ignored.
    仅仅是 local user

    Default: (none)
    local_root=/data


    local_root 优先级比 chroot_local_user 高，即使设置了 chroot_local_user 也是local_root 生效 
    文件夹设置了777权限貌似也没有问题








500 OOPS: vsftpd: refusing to run with writable root inside chroot ()
正确的做法应该是去掉w 权限，而不是 allow_writeable_chroot

allow_writeable_chroot
    Allow  chroot()'ing  a  user to a directory writable by that user.

    Note that setting this to YES is potentially dangerous.

    For example, if the user creates an 'etc' directory in the new root
    directory, they could potentially trick the C library into loading a
    user-created configuration file from the /etc/ directory.

    Default: NO



pasv_enable
    Set to NO if you want to disallow the PASV method of obtaining a data connection.
    Default: YES

    自己连自己的时候，"ftp" 这个软件是不会显示 227 Entering Passive Mode (10,0,5,18,246,143). 的，或者是debian 的软件不显示? 在centos7  上是显示的



pasv_min_port
pasv_max_port
    Default: 0 (use any port)





use_localtime
    If enabled, vsftpd will display directory listings with the  time  in  your
    local  time zone. The default is to display GMT. The times returned by the
    MDTM FTP command are also affected by this option.

    Default: NO

    和客户端有关，如浏览器，文件资源管理器等都会不一样

    返回给客户端的应该只有时间，没有时区信息，所以客户端有可能再次进行操作，故不要改这个







chown_upload=YES
chown_username=wang
chown_upload_mode=



chown_uploads
    If enabled, all anonymously uploaded files will have the ownership changed to  the  user
    specified  in  the  setting  chown_username.  This is useful from an administrative, and
    perhaps security, standpoint.
    Default: NO

chown_username
    This  is the name of the user who is given ownership of anonymously uploaded files. This
    option is only relevant if another option, chown_uploads, is set.
    Default: root

chown_upload_mode
    The file mode to force for chown()ed anonymous uploads. (Added in v2.0.6).
    Default: 0600





user_config_dir
    This  powerful  option  allows the override of any config option specified in the manual
    page, on a per-user basis. Usage is simple, and is best illustrated with an example.  

    If you set user_config_dir to be /etc/vsftpd_user_conf and then log on as
    the user "chris", then vsftpd will apply the settings in the file
    /etc/vsftpd_user_conf/chris for the  duration  of  the  session.  

    The format  of this file is as detailed in this manual page!

    PLEASE NOTE that not all settings are effective on a per-user basis. 
    For  example,  many settings only prior to the user's session being started. Examples of
    settings which will not affect any  behviour  on  a  per-user  basis
    include  listen_address,  banner_file, max_per_ip, max_clients, xferlog_file, etc.

    Default: (none)








guest_enable
guest_username
local_root

guest_enable
    If enabled, all non-anonymous logins are classed as "guest" logins.
    A guest login is remapped to the user specified in the guest_username setting.
    Default: NO

guest_username
    See the boolean setting guest_enable for a description of what constitutes a  guest  login. 
    This setting is the real username which guest users are mapped to.
    Default: ftp

1. 创建虚拟用户映射的本地帐号
    useradd -s /sbin/nologin -d /var/tmp/vusers uservirtual
    chmod 500 /var/tmp/vusers
    mkdir /var/tmp/vusers/shichang
    mkdir /var/tmp/vusers/caiwu
    mkdir /var/tmp/vusers/xingzheng
    chmod 700 /var/tmp/vusers/*
    
    chown uservirtual:uservirtual /var/tmp/vusers/ -R

1. 配置文件开启虚拟用户验证
    guest_enable=YES
    guest_username=uservirtual
    **virtual_use_local_privs=NO**
    **user_config_dir=/etc/vsftpd/vconf.d/**                    !!!!!!!!!!

1. 建立虚拟用户验证数据库
    /etc/vsftpd/vuser
    ```
    sc_01       奇数行：帐号
    pass1       偶数行：密码
    sc_02
    pass2
    cw_01
    pass1
    cw_02
    pass2
    xz_01
    pass01
    xz_02
    pass02

    [将上面的用户放入 /etc/vsftpd/chroot_list, 不允许切出家目录]
    ```

    生成帐号密码数据库文件
        db_load -T -t hash -f /etc/vsftpd/vuser /etc/vsftpd/vuser.db
        chmod 600 /etc/vsftpd/vuser.db

1. 开启 pam 认证
    将下列内容添加到开头/etc/pam.d/vsftpd.db
    auth sufficient /lib64/pam_userdb.so db=/etc/vsftpd/vuser
    account sufficent /lib64/security/pam_userdb.so db=/etc/vsftpd/vuser

    apt install db5.3-util

    pam_service_name
        This string is the name of the PAM service vsftpd will use.
        Default: vsftpd

    修改 pam_service_name=/etc/pam.d/vsftpd.db


1. 设置不同用户的权限

    每个用户的配置文件需要和自己的名字一样                      !!!!!!!!!!

    财务主管为例:
        cat /etc/vsftpd/vconf.d/cw_01                           !!!!!!!!!!
        ```
        local_root=/var/tmp/vusers/caiwu                        这个和全局的 local_root , chroot_user
        anon_umask=077
        anon_wrold_readable_only=NO
        anon_upload_enable=YES
        anon_mkdir_write_enable=YES
        anon_other_write_enable=YES
        ```
1. 测试








## 日志

dual_log_enable
    If  enabled, two log files are generated in parallel, going by default to 
        /var/log/xferlog and 
        /var/log/vsftpd.log.  
    The former is a wu-ftpd style transfer log, parseable by standard tools. 
    The latter is vsftpd's own style log.

    Default: NO

xferlog_enable
    If enabled, a log file will be maintained detailling uploads and downloads.
    By default, this file will be placed at **/var/log/vsftpd.log**, but this location 
    may be overridden using the configuration setting vsftpd_log_file.

    Default: NO (but the sample config file enables it)



xferlog_std_format
    If enabled, the transfer log file will be written in standard xferlog format, as used by wu-ftpd.
    This is useful because you can reuse existing transfer statistics generators.

    The default format is more readable, however.
    The default location for this style of log file is /var/log/xferlog, but you may change it with the setting xferlog_file.

    Default: NO


如果同时设置了 xferlog_enable 和 xferlog_std_format 呢?


xferlog_file
    This option is the name of the file to which we write the wu-ftpd style transfer log.
    The transfer log is only written if the option **xferlog_enable** is set, along with **xferlog_std_format**.

    Alternatively, it is written if you have set the option dual_log_enable.

    Default: /var/log/xferlog



vsftpd_log_file
    This option is the name of the file to which we write the vsftpd style  log  file.
    This log is only written if the option 
        xferlog_enable is set
        and xferlog_std_format is NOT set. 

    Alternatively, it is written if you have set the option dual_log_enable.

    One further complication  -  if  you have set syslog_enable, then this file is not written and
    output is sent to the system log instead.

    Default: /var/log/vsftpd.log






nopriv_user=ftpsecure       对子进程的管理者


async_abor_enable
tcp_wrappers
    /etc/hosts.deny
        vsftpd: ALL
    /etc/hosts.allow
        vsftpd: 192.168.1.1/24



ascii_upload_enable
ascii_download_enable
使用"ftp"客户端软件可以设置是用 binary 还是 ascii







ftp

    open host [port]
        Establish a connection to the specified host FTP server.

    close
        Terminate the FTP session with the remote server, and return to the
        command interpreter.  Any defined macros are erased.

    bye
        Terminate the FTP session with the remote server and exit ftp.  An end
        of file will also terminate the session and exit.

    quit
        A synonym for bye.


    ! [command [args]]
        Invoke an interactive shell on the local machine. 

    lcd [directory]
        Change the working directory on the local machine.  If no directory
        is specified, the user's home directory is used.

    get
    mget
    put
    mput

    mkdir
    rename
    delete remote-file
        Delete the file remote-file on the remote machine.
    rmdir directory-name
        Delete a directory on the remote machine.









## mysql 

[pam-mysql](http://pam-mysql.sourceforge.net/)

wget http://prdownloads.sourceforge.net/pam-mysql/pam_mysql-0.7RC1.tar.gz

apt-cache search pam-mysql
    libpam-mysql - PAM module interfacing with MySQL databases

This is different lib, centos does not have this lib, we should complise it ourself,
    yum search pam-mysql
        dspam-mysql.x86_64 : MySQL storage driver for libdspam

    ```
    wget http://prdownloads.sourceforge.net/pam-mysql/pam_mysql-0.7RC1.tar.gz

    cat INSTALL

    1. ./configure --with-pam-mods-dir=/lib64/security
    2. make install

    ls /lib64/security | grep mysql
    ```

调用 pam-mysql 模块

    vim /etc/pam.d/vsftpd.mysql
    ```可以查看 README
    auth required pam_mysql.so user=vsftpd passwd=xxx host=[mysqlserver] db=[vsftpd-db] table=[table] usercolmn=name passwordcolumn=password crypt=2
    account required pam_mysql.so user=vsftpd passwd=xxx host=[mysqlserver] db=[vsftpd-db] table=[table] usercolmn=name passwordcolumn=password crypt=2
    ```

    /etc/vsftpd/vsftpd.conf
        pam_service_name=vsftpd.mysql



yum install mariadb-server
systemctl start mariadb

```

create database vsftpd;
use vsftpd;

create table users(id int not null primary key auto_increment, name char(50) binary not null, password char(50) binary not null);

insert users values(null,'vuser1',password('vuser1'))

grant select on vsftpd.* to vsftpd@'10.0.0.%' identified by 'password';
flush privileges;
```


