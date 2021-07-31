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

### 应用场景

文件服务器

下载服务器

上传服务器


### 工作模式

1. 主动模式(默认)

    会话1: 客户机连接FTP服务器的 TCP 21端口, 发送 port 指令, 告诉服务器你来连接
    我的XX端口进行数据传输

    会话2: 服务器使用20号端口主动连接客户机传送数据

    由服务器端创建数据连接

2. 被动模式

    客户机连接FTP 服务器的 TCP 21端口, 发送 pasv 指令, server 打开一个随机端口
    (1024-65535), 并通知客户端, 明确用此端口传输数据

    由客户端创建数据连接


### 访问方式

1. 实体帐号: 本地帐号

2. 来宾帐号: guest

3. 匿名帐号: anonymous  ftp


### 安装部署

yum install -y vsftpd

systemctl enable vsftpd

systemctl is-enabled vsftpd

lsof -i :



### 相关配置文件

    centos7                                             debian10

主配置文件 /etc/vsftpd/vsftpd.conf                      /etc/vsftpd.conf

下载目录   /var/ftp/                                    /

ftp日志    /var/log/xferlog                             /var/log/vsftpd.log     (/etc/vsftpd.conf配置)

    1. 下载记录, 没有登录日志



#### /etc/vsftpd/vsftpd.conf

anonymous_enable=YES

local_umask=022

