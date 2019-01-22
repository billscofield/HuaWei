# Linux和Windows间的远程桌面访问

远程桌面连接主要使用两种协议
    1. 微软在Windows上的RDP（Remote Desktop Protocol）协议
    1. VNC（Virtual Network Console）协议。

从使用效果上来说，VNC协议更加优秀，所以如果有条件的话我还是推荐大家使用使用VNC协议的工具。

## RDP协议
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

### windows 上的vnc软件
1. UltraVNC（免费）
1. TightVNC（免费）
