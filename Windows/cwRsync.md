

## 


## 软件下载地址

https://linux.linuxidc.com/index.php?folder=MjAxNMTq18rBzy8x1MIvMjTI1S9jd1JzeW5jIDQuMC41LVJzeW5jIGZvciBXaW5kb3dzIM/C1Ng=
包含一份 客户端 软件
包含一份 服务端 软件
包含一份 说明文件


说明
https://www.itefix.net/cwrsync


## csRsync 客户端

解压后直接管理员方式安装


## cwRsync 服务端

安装过程中提示输入服务运行时的用户名，密码, 也可以自定义
默认的用户名是: SvCCWRSYNC
默认的密码是：  2p1X0ZGV4kuzq6


端口号:873/tcp   //防火墙放过这个端口

net start rsyncserver
net stop rsyncserver

### 配置文件

C:\Program Files (x86)\ICW\rsyncd.conf

```
uid = 0
gid = 0
use chroot = false
strict modes = false    //不验证用户密码
hosts allow = *
log file = rsyncd.log

# Module definitions
# Remember cygwin naming conventions : c:\work becomes /cygwin/c/work (经过试验，应该是 /cygdrive/c/work)
#
[DB]
path = /cygdrive/c/work
read only = false
transfer logging = yes

[DB2]
path = /cygdrive/e/Bill
read only = false
transfer logging = yes

# 如果不需要密码认证，把下边两行注释掉
auth users = dbbackuper
secrets file = /cygdrive/e/Setting/Rsync/rsync_db.ps
```


```
@echo off
echo.
echo start...
echo.

rsync -av /cygdrive/e/Bill /cygdrive/h/

echo.
echo finish!
echo.
exit
```

任务计划程序
    控制面板/管理工具/任务计划程序/创建任务


## 参考过的网址

https://www.cnblogs.com/hanxiaohui/p/9481640.html
https://blog.csdn.net/ujm097/article/details/81475649
https://www.cnblogs.com/hllnj2008/p/4103761.html
http://www.daliycode.com/info-3-202.html
https://www.cnblogs.com/xwdreamer/p/3361647.html
https://blog.csdn.net/ujm097/article/details/81475649


