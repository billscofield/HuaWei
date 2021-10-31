
https://www.bilibili.com/video/BV1bZ4y1p7pk?from=search&seid=5821011970290579699

## 网络文件服务器

NAS(Network append storage): 

    共享的是文件夹

    1. FTP: 文件服务器
        
        单纯上传下载

    2. samba: 不同系统间的文件夹或设备共享
        
        系统集成间的共享

    3. NFS： 网络文件系统
        
        网络存储服务器

SAN: 共享的是存储设备


## FTP

是一个古老的协议, 使用明码的传输方式

现在主要使用 vsftp (very secure File transfer protocol) 这个软件

C/S类型的软件

FTP监听TCP端口号为21, 数据端口为20


## 常见 FTP 软件

1. 服务器端

    Wu-ftp, vsftpd, Pureftpd, Filezilla, Server-U, IIS

2. 客户端

    命令行
        ftp, lftp, wget, curl
    
    图形化
        gftp, FileZilla

        ftp://username:pass@IP

## 应用场景

文件服务器

下载服务器

上传服务器


## 数据传输格式

1. 二进制(默认)

2. 文本


## 工作模式

主被动是站在服务器的角度来看的

1. 主动模式(默认) PORT Style

    会话1: 客户机连接FTP服务器的 TCP 21端口, 发送 port 指令, 告诉服务器你来连接
    我的XX端口进行数据传输

    会话2: 服务器使用20号端口主动连接客户机传送数据

    由服务器端创建数据连接

    命令(控制): 客户端:随机port   --->   服务器:21/tcp
    数据:       客户端:随机port   <---   服务器:20/tcp

2. 被动模式 PASV Style

    客户机连接FTP 服务器的 TCP 21端口, 发送 pasv 指令, server 打开一个随机端口
    (1024-65535), 并通知客户端, 明确用此端口传输数据

    由客户端创建数据连接

    命令(控制): 客户端:随机port   --->   服务器:21/tcp
    数据:       客户端:随机port   --->   服务器:随机/tcp

    防火墙上开启连接追踪功能，分析21号端口的数据端口信息

## FTP服务状态码

1XX: 信息           125: 数据连接打开
2XX: 成功类状态     200: 命令OK     230: 登录成功
3XX: 补充类         331: 用户名OK
4XX: 客户端错误     425: 不能打开数据连接
5XX: 服务器错误     530: 不能登录


## 访问方式

1. 实体帐号(系统用户): 本地帐号

2. 来宾帐号(虚拟用户): guest

3. 匿名帐号: anonymous  ftp


## 安装部署

yum install -y vsftpd

systemctl enable vsftpd

systemctl is-enabled vsftpd

lsof -i :21

    20端口有数据传输的时候才有



## 相关配置文件

    centos7                                             debian10

主配置文件 /etc/vsftpd/vsftpd.conf                      /etc/vsftpd.conf

共享目录   /var/ftp/                                    /

ftp日志    /var/log/xferlog                             /var/log/vsftpd.log     (/etc/vsftpd.conf配置, 应该是只是用了vsftpd格式的日志)

    1. 下载记录, 没有登录日志, 这个是 transfer 日志


centos 注意关闭 selinux, iptables -F

### /etc/vsftpd/vsftpd.conf

anonymous_enable=YES

local_umask=022




nopriv_user=nobody          // vsftpd 服务指定用户运行

### 日志

格式基于 wu-ftp 日志

dual_log_enable=YES         // vsftpd 格式的日志

    If  enabled,  two  log  files  are generated in parallel, going by default
    to /var/log/xferlog and /var/log/vsftpd.log.  The former is a wu-ftpd style
    transfer log, parseable by standard tools. The latter is vsftpd's own style
    log.



##

ls
200 PORT command successful. Consider using PASV.       // 请考虑使用被动模式

主被动是协商的结果

ftp 10.0.5.213

passive     模式切换，轮转

当是passive off 时，ls 会提示 200 PORT command successful. Consider using PASV., 

当是passive on 时，ls 会提示 227 Entering Passive Mode (10,0,5,213,180,177).
    180x255+177 就是服务器端的数据端口号


windows 资源管理器是被动模式，而命令行是被主动模式

ss -nt 或 netstat -tn, 不要加l , 否则看不到 20 和随机端口号, 奇怪啊


### ftp 客户端软件

1. ftp

    ftp IP  端口号

    ftp -A enable active mode
        -p enable passive mode
        -

    不支持命令补全, 不区分文件文件夹颜色

2. lftp

    支持命令补全, 区分文件文件夹颜色

    -p port
    -u user
