## 卡在logo界面

用户开机提示 fsck /dev/sda4 ,然后重启卡在logo界面

```
ubuntu e 去掉 quiet splash

发现

failed to start lsb service
failed to start Login Service
failed to start NVIDIA Persistence Daemon
failed to start Raise network interfaces
failed to start Account Service
failed to start Modem Manager
failed to start Thermal Daemon
failed to start Avahi mDNS/DNS-SD Stack
failed to start Bluetooth service
failed to start Network Manager
```



### file:///

为了迎合网络化的趋势，Windows的地址风格（C:\ABC\def\ghi及\\计算机名\文件夹\文件）向网络地址风格作了一次兼容变换：

file表示协议类型

://后面是机器的网络地址（IP地址）

/后面是文件夹（目录）和文件名

整体形如：

file://机器的IP地址/目录/文件

对于本地机器，机器的IP地址变成127.0.0.1或LocalHost或干脆什么也不写。

对于本地机器，根目录下的目录是Windows下的盘符，如“C:”、“D:”等。

file://127.0.0.1/C:/     本地C盘

file://localhost/D:/     本地D盘

file:///E:/              本地E盘

需要注意的是，最后面的/是必不可少的
