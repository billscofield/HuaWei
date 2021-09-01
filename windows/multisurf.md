
## 多用户上网系统

win7 win8 win10 均是不支持多账户同时远程登录的, Server 可以，但是比较重

解决方案是 RDP Wrap, 但是不支持 win 10 >=1803 的版本

所以选用了 win7 来搭建多用户上网机

所需软件:
    win7 64位
    universal termsrv.dll patch
    ServerU


## 安装步骤

因为 win7 系统没有自带 usb 和网卡驱动, 所以要在 PE 中进行驱动注入，需要前往主板官网下载解压，然后注入

安装驱动精灵打全驱动

### 远程设置

1. gpedit.msc

1. 计算机配置/管理模板/Windows组件/远程桌面服务/远程桌面会话主机/连接，

    限制连接的数量

    将远程桌面服务用户限制到单独的远程桌面服务会话

1. 安装 universal termsrv.dll patch

1. github 下载 RDP Wrap, 解压到 C:\program files\RDPWrap, install.bat 进行安装，然后 config ，显示全部 support

    创建几个系统账号测试

    universal termsrv.dll patch 和 RDPWrap 使用一个即可，我发现在安装完补丁后 RDPWrap 好像不能用了，所以推荐使用 universal termsrv.dll patch

1. 安装360安全卫士，更新所有补丁


### 批量创建 windows 用户

net user 用户名 密码 /add

可以使用 Excel 批量创建后复制到 bat 文件执行
    如果你设置的密码包含特殊字符的话需要用单引号（英文的单引号）将其括起来

建立用户：net  user  用户名  密码  /add                         (如：net user test 123 /add)
提升权限：net  localgroup 用户权限组 用户名 /add                (如：net localgroup administrator test /add)    
删除用户：net  user  用户名 /del                                (如：net user test /del)

### 禁止远程桌面到服务器复制粘贴

gpedit.msc，进入“算机配置”项，按顺序进入“管理模板”、“windows组件”、“终端服务”、“客户端/服务器数据重定向”

在详细描述栏中启用“不允许剪切板重定向”、“不允许COM端口重定向”、“不允许客户端打印机重定向”、“不允许LPT端口重定向”、“不允许驱动器重定向”。


### 为 C 盘创建磁盘配额

右键 C盘，属性/配额

勾选 启用配额管理

勾选 拒绝将磁盘空间给超过配额限制的用户

将磁盘空间限制为: 具体数值  (对所有用户统一设置值，可以在下边的配额项中 custom)

点击右下角 "配额项", 可以查看具体值，好像是用户登录才会进行添加，用户不登录的话是不会添加到这里的, 可以在这里对某个用户进行个性化定制

### 输入法问题
    
administrator 安装了搜狗输入法后，普通用户却没有显示搜狗输入法

普通用户：右下角输入法右键，设置/添加/中文/搜狗输入法

## ServerU

Win7 系统自带的 iis 里的 ftp，不支持不同用户登录到不同文件夹，你必须去下载 FileZilla Server 或 Serv-U 之类的 FTP 服务器软件才行

设置一个域，域名字随便，监听所有地址

批量创建用户和 FTP 目录

在 Serveru 的用户创建界面，我们点击导出(先将用户test1 和 test1 导出)

打开这个文件，最后面两行是这两个用户相关的信息，复制修改粘贴即可, 然后保存，导入


blog.51cto.com/sandy53/782152




https://blog.csdn.net/u010804317/article/details/100055558
