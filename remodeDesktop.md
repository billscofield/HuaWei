# Linux 和 Windows 间的远程桌面访问

远程桌面连接主要使用两种协议

    1. 微软在Windows上的RDP（Remote Desktop Protocol）协议

    1. VNC（Virtual Network Console）协议。

从使用效果上来说，VNC协议更加优秀，所以如果有条件的话我还是推荐大家使用使用VNC协议的工具。


## RDP 协议

1. rdesktop(client)

    1. 它实现了RDP协议，允许我们在Linux系统上远程登录Windows系统。

1. grdesktop(client)

    1. Rdesktop对应的图形化前端工具

1. krdc(client)

    1. krdc是KDE桌面的rdp和vnc连接工具。

    1. 同时支持RDP和VNC协议

1. xrdp(server)

    1. 是一个RDP服务端，可以让我们用远程桌面方式登录到Linux系统


## VNC

1. tigervnc

    1. tigervnc既可以远程控制实际显示器，还可以控制平行独立于当前物理显示器的虚拟显示器。

1. x11vnc(linux server)
    
1. Vinagre

    1. 这是Gnome桌面环境的远程桌面客户端，同时支持SSH、RDP和VNC协议

1. Remmina

    1. 同时支持RDP和VNC协议

    1. sudo apt install remmina


### windows 上的vnc软件

1. UltraVNC（免费）

1. TightVNC（免费）


## linux 上最好用的远程软件

remmina

https://remmina.org/how-to-install-remmina/#for-users-with-a-distro-that-supports-snap-packages-including-ubuntu

---

## 关于写一个远程桌面程序的资料收集

志豪的远程桌面逻辑

    客户端  数据库（密码转换对照表）    远程桌面

        远程桌面有两个系统
        
            windows 上网查资料用
        
            linux 在服务器上开发用

## nomachine

仅仅用于局域网使用
    
## 链接

https://blog.csdn.net/LxDamon/article/details/78758111

https://www.cnblogs.com/xuliangxing/p/7560723.html

https://blog.csdn.net/kevin3101/article/details/52275732

https://blog.csdn.net/qq_33530388/article/details/64502902

https://blog.csdn.net/lushuaiyin/article/details/45391139
