
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


apt install tightvncserver


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
