

## 4 个部分

1. 命令段
    用于对系统进行基本设置
    install
    url
    lang
    network
    rootpw
    firewall
    authconfig
    selinux
    timezone
    bootloader
    part
    logvol: 逻辑卷
    volgroup
    repo

2. 软件包段
```
%packages
@core           // 包组名
vim             // 包名
%end
```

3. 脚本段
    安装前 %pre
    安装后 %post


isolinux.cfg
    系统安装界面

    boot.msg    



启动字符安装界面
    在安装界面按 esc, 然后输入 linux(label) text(选项)
        text        基于字符方式进行安装
        graphical   基于图形方式安装
        asknetword  安装过程中，提示用户设置网络
        dd          驱动程序所在的设备文件
        ks          指定 ks 文件所在的设备文件
            ks={ftp|http}://ip/path/ks.cfg
            ks=nfs:server:/path/to/ks.cfg
            ks=cdrom:/path/to/ks.cfg
        repo        软件包的位置
            repo=ftp://path/to/
            repo=nfs:server:/path/to/
        ip:         
        netmask
        gateway
        dns:
        ksdevice    将这个IP配置在哪个网卡上


自动安装系统
    方法一:
        光盘中集成 ks 文件
    方法二:
                                                                                                                                                                                                                                                                                                                     
