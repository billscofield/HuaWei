
https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-vnc-on-ubuntu-18-04

https://www.fosslinux.com/17674/how-to-install-vnc-server-on-ubuntu.htm#:~:text=Configure%20VNC%20Server%20On%20Ubuntu%201%20Before%20starting,VNC%20server%20configuration%20file.%20...%20More%20items...%20

## Virtual Network Computing (VNC)

VNC is extended from the RFB protocol

TightVNC is a cross-platform free and open-source remote desktop software application.

TightVNC uses so-called "tight encoding" of areas, which improves performance over low bandwidth connection. 紧凑型编码

It is effectively a combination of the JPEG and zlib compression mechanisms.

TightVNC is cross-compatible with other client and server implementations of VNC; however, tight encoding 
is not supported by most other implementations, so it is necessary to use TightVNC at both ends to gain the 
full advantage of its enhancements.


## Derived software 派生的软件

1. RemoteVNC
    RemoteVNC is a fork of the TightVNC project and adds automatic traversal of NAT and firewalls using Jingle.

1. TightVNC Portable Edition
    The developers have also produced a portable version of the software, available as both U3 and standalone downloads.

1. TurboVNC
    TurboVNC is based on the TightVNC 1.3.x, xf4vnc, X.org, and TigerVNC code bases and includes numerous performance 
    enhancements and features targeted at 3D and video workloads.

1. TigerVNC
    TigerVNC is VNC server and client software, started as a fork of TightVNC in 2009, after three years of inactivity 
    in TightVNC trunk. It also takes some code from TurboVNC.

## tightvnc server

Step 1 — Installing the Desktop Environment and VNC Server
    apt install xfce4 xfce4-goodies
    apt install tightvncserver

    vncserver                                       // use the vncserver command to set up a secure password and create the initial configuration files
    

Step 2 — Configuring the VNC Server

    When VNC is first set up, it launches a default server instance on port 5901. This port is called a display port, and is referred to by VNC as :1. VNC can launch
    multiple instances on other display ports, like :2, :3, and so on.

    Because we are going to be changing how the VNC server is configured, first stop the VNC server instance that is running on port 5901 with the following command:

    vncserver -kill :1

    Before you modify the xstartup file, back up the original:

    Modify ~/.vnc/xstartup
    ```
    #!/bin/bash 
    xrdb $HOME/.Xresources 
    startxfce4 & 
    ```

Step 3 — Connecting the VNC Desktop Securely 

     ssh -L 5901:127.0.0.1:5901 -C -N -l sammy your_server_ip


注意:

1. The password must be between six and eight characters long. Passwords more than 8 characters will be truncated automatically.



```
root@hjimi-System-Product-Name:~# vncserver

You will require a password to access your desktops.

Password:
Warning: password truncated to the length of 8.                 
Verify:
Would you like to enter a view-only password (y/n)? n
xauth:  file /root/.Xauthority does not exist

New 'X' desktop is hjimi-System-Product-Name:1

Creating default startup script /root/.vnc/xstartup
Starting applications specified in /root/.vnc/xstartup
Log file is /root/.vnc/hjimi-System-Product-Name:1.log

```




## 修改分辨率

vi /usr/bin/vncserver


## 使用

用户ssh登录后, vncserver 查看是多少, 然后执行vnc远程登录


## tab补全

xfwm4-settings





## xstartup 文件

startkde表示启动kde图形界面；twm表示启动文本界面
