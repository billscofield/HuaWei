
日志系统 rsyslog
    
    管理, 记录日志的程序
    经常和 logrotate 配合来使用, 用来实现滚动日志



## rsyslog

1. 定义日志级别

systemctl status rsyslog
ps -ef | grep rsyslogd
    /usr/sbin/rsyslogd -n -iNONE

    和系统相关的, 例如 sshd, su, at, cron
    其他一些软件可以有自己的日志管理


/var/log/messages                // 系统主日志文件
/var/log/secure                  // 认证，安全: ssh, su
/var/log/maillog
/var/log/cron                    // crond, at 相关
/var/log/dmesg                   // 和系统启动有关
/var/log/audit/audit.log         // 系统审计日志
/var/log/yum.log                 // 
/var/log/mysqld.log              // mysql 自己管理的
/var/log/xferlog                 // 访问 FTP 服务器相关, 
/var/log/wtmp                    // 当前登陆的用户 w, 二进制文件
/var/log/btmp                    // 最近登陆的用户 last, 二进制文件
/var/log/lastlog                 // 所有用户登陆情况 lastlog, 二进制文件


查看开机时，网卡是否被驱动
    dmesg -t | grep eth0        // 奇怪，不管何种命名，都是 eth



Values for facility(设备)


    ```
    程序，进程                                  调用 syslog 函数(send messages to the system logger 程序)           rsyslogd 定义规则，将 设备.级别 的日志发送到那里            10.0.0.1
    /usr/bin/sshd                           |                                                               |                                                           |   
    /usr/bin/login(图形界面的登陆程序)      |                                                               |                                                           |   $ModLoad imudp
    /usr/bin/su                             | LOG_AUTHPRIV               产生日志                           |       authpriv.*    /var/log/secure                       |   $UDPServerRun 514
    /usr/bin/vsftpd                         | LOG_FTP                                                       |       local5.*      @10.0.0.1             // udp          |   local5.*    /var/log/10.0.1.log
    /usr/bin/at                             | LOG_CRON                                                      |       local5.*      @@10.0.0.12           // tcp          |
    /usr/bin/crond                          | LOG_CRON                                                      |                                                           |
    /usr/bin/postfix                        | LOG_MAIL                                                      |                                                           |
    /usr/sbin/httpd     自己管理，没有交给 syslog 管理，没办法
    ```

    有些程序是可以修改设备的，其他就需要重新编译了
    /etc/ssh/sshd_config
        SyslogFacility AUTHPRIV     // 修改为其他的，如 FTP, 是启动不了的, LOCAL0-LOCAL7可以

    **程序、设备(facility)和级别的对应关系主要是开发设计人员在考虑设计的**

    logger -p authpriv.info xxxxxxxxxxxxxxxx
    tail /var/log/secure








    The facility argument is used to specify **what type of program is logging
    the message.**  This lets  the  con figuration file specify that messages
    from different facilities will be handled differently.

    LOG_AUTH                            security/authorization messages
    LOG_AUTHPRIV                        security/authorization messages (private)
    LOG_CRON                            clock daemon (cron and at)
    LOG_DAEMON                          system daemons without separate facility value
    LOG_FTP                             ftp daemon
    LOG_KERN                            kernel messages (these can't be generated from user processes)
    LOG_LOCAL0 through LOG_LOCAL7       reserved for local use
    LOG_LPR                             line printer subsystem
    LOG_MAIL                            mail subsystem
    LOG_NEWS                            USENET news subsystem
    LOG_SYSLOG                          messages generated internally by syslogd(8)
    LOG_USER (default)                  generic user-level messages
    LOG_UUCP                            UUCP subsystem



Values for level, decreasing importance:(级别)

严重| /|\ LOG_EMERG      system is unusable
    |  |  LOG_ALERT      action must be taken immediately
    |  |  LOG_CRIT       critical conditions
    |  |  LOG_ERR        error conditions
    | /|\ LOG_WARNING    warning conditions
    |  |  LOG_NOTICE     normal, but significant, condition
    |  |  LOG_INFO       informational message
    |  |  LOG_DEBUG      debug-level message  什么都记录


facility

    如何对日志进行处理, 一些日志类别、种类，对日志进行分类, 将不同类别的日志记
    录到不同的位置

    俺转相关的: /var/log/secure

/etc/rsyslog.conf
```
*.info;mail.none;authpriv.none;cron.none                /var/log/messages
*.emerg                                                 :omusrmsg:*
uucp,news.crit                                          /var/log/spooler

# Save boot messages also to boot.log
local7.*                                                /var/log/boot.log



omusrmsg stands for "User Message Output Module" and combined with '*' will
send a console alert to all logged in users. For example, when the system is
going down for reboot.



auth,authpriv.*             /var/log/auth.log
*.*;auth,authpriv.none      -/var/log/syslog
#cron.*                     /var/log/cron.log
daemon.*                    -/var/log/daemon.log
kern.*                      -/var/log/kern.log
lpr.*                       -/var/log/lpr.log
mail.*                      -/var/log/mail.log
user.*                      -/var/log/user.log
kernel
syslog                      // syslog 自己相关的


记录的位置有以下几种情况:

    1. /var/log/auth.log
    2. -/var/log/syslog                 // - : 延迟写入
    3. *
    4. @10.0.0.1
    5. @@10.0.0.1
```

自定义设施 [LOCAL0 , LOCAL7 ]

```
uucp,news.crit              /var/log/spooler.log



locla7.*                    //var/log/
```

设施.级别   保存位置

保存位置
    1. 本地
        /var/log/a

    2. 日志存储服务器
        @ip

    3. 数据库
        mysql

    4. 不保存，发送给某个用户

    通配符

    ```
    *   所有级别
    ,   多个级别 debug, info, notice
    !   某个排除在外        同.none 如 mail.none
    =   仅仅            mail.=info

    mail.info       info 和 info 以上级别
    mail.!info      除了 info 以外的全部
    mail.=info
    mainl.*
    *.info          所有设施 info 和 info 以上的
    mail,auth.info  mail 和 auth 的 info 和以上的


    :omusrmsg:*
    ```

    logger -p emerg "on all term..."

    -p, --priority priority
        
        Enter  the message into the log with the specified priority.
        
        The priority may be specified numerically or as a facility.level pair.
        
        For example, -p local3.info logs the message as informational in the
        lo‐cal3 facility.
        
        The default is user.notice.


2. 定义日志路径

```
sshd_config
SyslogFacility LOCAL4
systemctl restart sshd

/etc/rsyslog.conf
local4.*        /var/log/sshd.log
systemctl restart rsyslog
```



``` 日志接收服务器
/etc/rsyslog.conf

# Provides UDP syslog reception
$ModLoad imudp                          // UDP Syslog Input Module
$UDPServerRun 514
local4.*    /var/log/10.0.100.1.log


# Provides TCP syslog reception
#$ModLoad imtcp
#$InputTCPServerRun 514

```



tcpdump -i eth0 -nn port 514





loading external modules ($ModLoad)
    imfile : Input module for text files

$InputFilePollInterval  5           // 



## logrotate

/sbin/logrotate
/etc/logrotate.conf



/etc/cron.daily/logrotate

    /usr/sbin/logrotate -s /var/lib/logrotate/logrotate.status /etc/logrotate.conf

    -s, --state <statefile>

        Tells logrotate to use an alternate state file.
        
        This is useful if logrotate is being run as a different user for various
        sets of log files.
        
        The default state file is /var/lib/logrotate/logrotate.status.

        


logrotate [-dv] [-f|--force] [-s|--state file] config_file ..
    
    -d, --debug
        Turns on debug mode and implies -v.
        In debug mode, no changes will be made to the logs or to the logrotate
        state file.

    -f, --force
        Tells logrotate to force the rotation, even if it doesn't think this is
        necessary.  Sometimes this is useful after adding new entries to a
        logrotate config file, or if old log files  have  been  removed  by
        hand, as the new files will be created, and logging will continue
        correctly.

    -s, --state <statefile>
        Tells logrotate to use an alternate state file.  This is useful if
        logrotate is being run as a different user for various sets of log
        files.  The default state file is /var/lib/logrotate/logrotate.status.



### 配置文件

```
# rotate log files weekly
weekly

# keep 4 weeks worth of backlogs
rotate 4

# create new (empty) log files after rotating old ones
create

# use date as a suffix of the rotated file
dateext

# uncomment this if you want your log files compressed
#compress

# RPM packages drop log rotation information into this directory
include /etc/logrotate.d
```


常见参数

compress
    Old versions of log files are compressed with gzip(1) by default. See also nocompress.

compresscmd
    Specifies which command to use to compress log files.  The default is gzip(1).  See also compress.

uncompresscmd
    Specifies which command to use to uncompress log files.  The default is gunzip(1).

copytruncate

    Truncate the original log file to zero size in place after creating a copy,

    instead of moving the  old log file and optionally creating a new one.

    先复制，然后清空

    It can be used when some program cannot be told to close its logfile and
    thus might continue writing (appending) to the previous log  file  forever.
    Note that there  is a very small time slice between copying the file and
    truncating it, so some logging data might be lost.  When this option is
    used, the create option will have no effect, as the old log file stays  in
    place.


create mode owner group, create owner group

    Immediately after rotation (before the postrotate script is run) the log
    file is created (with the same name as the log file just rotated).

    mode specifies the mode for the log file in octal (the  same  as chmod(2)),
    owner specifies the user name who will own the log file, and group
    specifies the group the log file will belong to. Any of the log file
    attributes may be omitted, in which case  those  attributes for  the  new
    file  will use the same values as the original log file for the omitted
    attributes.

    This option can be disabled using the nocreate option.

nocreate

    New log files are not created (this overrides the create option).

    在滚动后不创建新日志


daily  Log files are rotated every day.

weekly [weekday]

    Log  files  are  rotated once each weekday, or if the date is advanced by
    at least 7 days since the last rotation (while ignoring the exact time).
    The weekday intepretation is following:  0  means  Sunday,  1 means  Monday,
    ..., 6 means Saturday; the special value 7 means each 7 days,
    irrespectively of weekday.  Defaults to 0 if the weekday argument is
    omitted.

rotate count

    Log  files  are  rotated  count  times before being removed or mailed to
    the address specified in a mail directive. If count is 0, old versions are
    removed rather than rotated.

    制定保存几个备份文件


nomail
    Do not mail old log files to any address.
    不发送日志

mailfirst
    When using the mail command, mail the just-rotated file, instead of the about-to-expire file.

maillast

    When using the mail command, mail the about-to-expire file, instead of the
    just-rotated  file  (this  is the default).


size size

    Log files are rotated only if they grow bigger then size bytes.

    If size is followed by k, the size is assumed to be in kilobytes.
    If the M is used, the size is in megabytes,
    if G is used, the size is in gigabytes.

    So size 100, size 100k, size 100M and size 100G are all valid.


maxsize size

    Log files are rotated when they grow bigger than size bytes even before the
    additionally specified  time interval (daily,  weekly,  monthly,  or
    yearly).

    The related size option is similar except that it is mutually exclusive
    with the time interval options, and it causes log files to be rotated
    without  regard for the last rotation time.  When maxsize is used, both the
    size and timestamp of a log file are considered.




minsize  size

    Log files are rotated when they grow bigger than size bytes, but not before
    the additionally specified time interval (daily, weekly, monthly, or yearly)
    .

    The related size option is similar except that it is mutually exclusive
    with the time interval options, and it causes log files to be rotated
    without  regard for the last rotation time.  When minsize is used, both the
    size and timestamp of a log file are considered.


missingok

    If the log file is missing, go on to the next one without issuing an error
    message. See  also  nomissingok.


ifempty

    Rotate the log file even if it is empty, overriding the notifempty option
    (ifempty is the default).


notifempty

    Do not rotate the log if it is empty (this overrides the ifempty option).


dateext

    Archive  old versions of log files adding a date extension like YYYYMMDD
    instead of simply adding a number.

    The extension may be configured using the dateformat and dateyesterday
    options.


dateformat format_string

    Specify the extension for dateext using the notation similar to strftime(3)
    function. Only %Y %m  %d  %H and  %s  specifiers  are  allowed.   The
    default value is -%Y%m%d except hourly, which uses -%Y%m%d%H as default
    value. 



### 案例

创建一个日志文件 /tmp/zx.log
    每天滚动一次
    大小上限10M
    保留5个副本
    旧日志时间命名

touch /tmp/zx.log

创建配置文件
    cd /etc/logrotate.d
    
    ```/etc/logrotate.d/zx
    /tmp/zx.log
    {
        daily
        create
        missingok
        size 10M
        rotate 5
        dateext
        compress
        inotifempty
    }
    ```
dd if=/dev/zero of=/tmp/zx.log bs=10M count=1

logrotate 配置文件




手动滚动
自动滚动
    cron
