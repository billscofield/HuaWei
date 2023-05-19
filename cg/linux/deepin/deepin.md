## 有问题的

19
38

播放到
59

## 安装系统

safe graphics 不带桌面的，我记得有啊
没有 safe graphics 的是有驱动的

### 操作系统选择界面 timeout

/boot/grub/grub.cfg
    set timeout=xxx

## nvidia

ERROR: The installation was canceled due to the availability or presence of an
alternate driver installation. Please see /var/log/nvidia-installer.log for
more details.

apt autoremove nvidia-*

lshw -numeric -C display

/etc/modprobe.d/blacklist.conf
```
blacklist nouveau
blacklist lbm-nouveau
options nouveau modeset=0
alias nouveau off
alias lbm-nouveau off
```

update-initramfs -u

reboot

lsmod | grep -i nouveau

systemctl stop lightdm

sh ./nvidia.run
    1. Would you like to register the kernel module sources with DKMS? This will allow DKMS to automatically build a new module, if you install a different kernel later. [Yes]
    2. Install Nvidia's 32-bit compatibility libraries? [Yes]
    3. Warngng: Unable to determin the path to install the libglvnd EGL vendor library config files. Check that you have pkg-config and the libglvnd development libraries installed, or specify a path with --glvnd-egl-config-path [OK]
    4. Would you like to run the nvidia-xconfig utility to automatically update your X configuration file so that the NVIDIA X driver will be used when you restart X? Any pre-existing X configuration file will be backed up [Yes]

systemctl restart lightdm

vim /etc/lightdm/display_setup.sh
```
#!/bin/sh
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrandr --dip96
```

vim /etc/lightdm/lightdm.conf
    78行改为 display-setup-script=/etc/lightdm/display_setup.sh

## 常见工具

dedit  文本txt编辑器
    /bin/deepin-editor

## 设置

自动登录: 是登录页面自动选择的那哪个用户

默认程序

个性化
    通用
        活动用色: 激活的item的颜色
        窗口特效
        透明度
        窗口圆角
    字体
    任务栏
        模式: 高效模式/
        显示图标

电源管理

输入法

更新
    自动下载
    自动安装
    智能镜像源


右键/卸载

~/Videos
    /usr/share/dde-introduction 宣传视频

~/Pictures
    /usr/share/wallpapers/

Portal  定位位置的
    rm /usr/libexec/xde-desktop-portal-gtk
    rm /usr/share/applications/Portal

    rm /usr/share/applications/Geoclude Demo agent
    rm /usr/lib/geoclue-2.0/demos/agent


## 文件管理器

文件和文件夹混合排列

文件预览
    文本预览
    图片预览
    标签页打开

系统监视器

设备管理器
    start里边

磁盘管理器
    start里边

安装字体
    方法1：双击
    方法2：start/字体管理器

常用软件安装
    start/商店
        腾讯会议
        爱思助手
        搜狗输入法
        百度网盘
        迅雷
        sublime text
        微信
        wps
        qq
        chrome
        录屏
        阿里云盘
        千牛
        华宇拼音输入法 ctrl shift
        Psensor(温度监控)

todesk
    统信

    如果不能正常使用
    systemctl stop todeskd
    rm /opt/todesk/config/todeskd.conf.bak
    systemctl restart todeskd

    /var/log/todesk/todeskd.log(server)
    /opt/todesk/config/todeskd.conf(服务端配置文件)

    ~/.local/share/todesk/log/todesk.log(client)
    ~/.local/todesk/todesk.cfg(客户端配置文件)
    

    sublime 中文化
    ctrl shit p / install package / chineselocation
    恢复出厂设置:首选项/浏览插件目录, 删除


## Kshutdown

软件完成某个任务后做什么，有windows版本

## 视频播放器

默认的是 "影院"
    原始尺寸: 不太好操作

Celluloid
    视频覆盖(每个视频一个实例)

mpv播放器
    apt install mpv

    mpv.io/installation

## 重点看下
### wine

/opt/deepin-win6-stable

默认商店的软件是安装在 下载目录

安装 wine
    wine --version
    winhq-stable

字体
    拷贝字体simsun.ttc和zh.reg到
    ~/.wine/drive_c/windows/Fonts
    在终端中regedit zh.reg文件，如果没有提示就说明注册成功了


## hdr,exr 看图序列

Chaos Player(windows 版本)

~/.wine/drive_c/Program Files/Chaos Group/替换

/usr/share/application/chaosplayer.desktop

这样启动器里就有了

卸载，windows 卸载方式

## quicktime player

36 

## PFTrack

三维跟踪

windows版本

## RizomUV

linux版本
    没有和谐版本, 试用

windows 版本

## mocha

windows 版本

borisfx.com

平面跟踪软件

## speedtree

linux版本，在这个目录执行sh文件即可，全部安装到本文件夹
    启动: ./linux/xxx

版本
    (cinema/game)专业/独立/学习
    独立版本必须联网使用

windows 版本

## clarisse

isotropix.com

linux 和谐版本最高是 clarisse 5.0 sp7

直接解压就可以运行

启动脚本
    clarisse
    clarisse-py2
    clarisse-py3

    clarisse.bin

    需要添加环境变量，PYTHONPATH, 把系统的那些文件拷贝到指定的路径

## python

/usr/lib/python3
/usr/lib/python2.7


## cpu-x

应用商店/cpu-x


## cpu-t

高性能模式?


## QWinFF

ffmpeg UI版本

商店里有

如果没有，需要添加第三方源


## Photoshop 2017 wine 版本

./setup.sh

## substance 3d painter/ designer/sampler

substance3d.com

画贴图


1. Painter

    7.4.1
    Linux 版本，deb 和 rpm

2. Designer

    11.3.1
    Linux 版本, deb 和 rpm

3. sampler

    3.1.2
    Linux 版本, deb 和 rpm

卸载:
    还是 deb 包, deepin 里是双击，卸载

## Aces 颜色空间转换器

wine 模拟

收费，2欧元, 和谐

免安装

## fspy

单张图片透视相机

github 开源

linux 版本, Appimage

可以导入到 blender

## maya

安装maya, 提示缺什么再安装什么

主要文件都在 Packages/ 里边

无法使用 官方给的 Setup 安装文件安装

    alien -cv ./*.rpm

        adlmapps23-23.0.21-0.x86_64.rpm
        adlmflexnetclient...
        adlmflexnetserve...
        adsklicensing...

