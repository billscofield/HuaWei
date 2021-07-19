Kodi（以前称为XBMC）是一个免费的开放源代码媒体播放器软件应用程序，由XBMC基金会
（一家非营利技术联盟）开发。 Kodi可用于多种操作系统和硬件平台，配有软件10英尺用
户界面，可用于电视机和遥控器。它允许用户播放和查看大多数流媒体，如来自Internet
的视频，音乐，播客和视频，以及来自本地和网络存储媒体的所有常见数字媒体文件。

该软件是作为独立开发的自制媒体播放器应用程序创建的，名为Xbox Media Center（缩写
为XBMC），用于第一代Xbox游戏机，后来以XBMC的名义作为适用于Android，Linux，BSD，
Raspbian，macOS，iOS / tvOS和Microsoft Windows操作系统的本地应用程序。


HTPC, short for home theater PC, is a personal computer that is used to store
and play music and movies as well as display photos. Also called Mini PC, media
center PC and living room PC, HTPC is usually installed in the A/V cabinet and
connected to a stereo or home theater system, building PC cinemas for you.



## 一体机

NAS + KODI + 下载机 + 软路由

##  win10 安装

### 开机启动

1. 桌面快捷方式 右键 打开文件位置 复制

1. 命令行: shell:startup

1. 粘贴

### 关闭自动更新

1. services.msc

    windows update  禁用

2. compmgmt.msc

    系统工具

    任务计划程序库

    Microsoft

    WindowsUpdate 右边的 Scheduled 右键禁止

## raspberry

LibreELEC

### 改为中文

setting / Interface / Skin / Fonts / Arial based    没有这一步，只有下边的步骤，会全部方块字
                    / Regional / language / Chinese(Simple)


### Upnp

setting / 服务 / UPnP/DLNA / 启用UPnP支持
                           / 允许通过UPnP远程控制


## IPTV

### 安装IPTV插件

setting / plugin / 从库安装  / PVR IPTV Simple Client

PVR Simple Client is a Kodi addon that lets you stream Live TV channels.

personal video recoder

### IPTV 设置

我的插件 / PVR客户端 / PVR IPTV Simple Client / 局域网 / M3U播放列表路径 / 选择直播源文件

退出KODI， 重新进入即可

确定键切换频道

    setting / PVR和直播电视 / 播放  / 按“确定”确认频道切换

### 检测直播可用性

Potplayer:可以播放直播源列表

IPTV Checker:可以检测直播源的可用性，生成新的直播源

更换直播源需要重启KODI


## 影视库

将下载在这个位置的视频、电影从网络上下载图片，背景墙等，添加一个好看的索引

视频 / 文件 / 添加视频 / 浏览目录 / 确定 / 该目录包含  电影 / 设置 / 首选语言 zh

添加电影文件夹   编辑源 / 添加  添加网络位置(建议说不要用SMB,会出现卡死的情况)

## 剧集库

选择剧集

zh-cn

## 中文字幕

OpenSubtitles插件

https://www.opensubtitles.org/zh/login

需要在这个网站注册账号，并在我的插件中进行登录，播放影片的时候选择下方字幕，下载

设置 / 播放器 / 语言 / 字幕 / 首选字幕语言
                     / 下载服务 / 下载字幕语言

## 输入

设置 / 服务 / 常规 / 向其他系统声明服务 (windows 需要安装 iTunes)
            / 控制 / 允许通过 HTTP 远程控制
                   / 允许通过异地程序远程控制


### 中文输入

setting / interface / 键盘布局 、 Chinese BaiduPY 这样就可以键盘输入中文

### 语音输入


## YouTuBe插件





## Problems

视频缓存
    advancedsettings.xml
        buffermode
            0:仅缓存使用互联网文件路径/源的视频
            1
            2
            3
        memorysize
            Byte
        readfactor
            
    AppData/Roaming/Kodi/userdata/

字幕编码


## 直播源

IPTV Checker 打开多个直播源，可以去重, show only onlines

### 删除不稳定的直播源

m3u 和 m3u8 是一样的

编码为 ANSI 或者 UTF8

用 Potplayer 打开，同时用记事本打开 m3u8文件，将不好的删除

频道名称信息

频道地址


### 抓取网站直播源

icantv.cn

打开potplayer

开发者工具

刷新 、 Network 、搜索m3u8, 复制Headers 中的 Request URL 网址

