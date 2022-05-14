
## 


CMIIT ID：2013AJ7630，其中bai cmiit id是无线电du发射设备型号核准代码，有这个核准代码才能可以在我zhuan国国内销售和使用，这个代码由相关部门颁发。其中2013是年份。
型号 比如是md760ch/b 
12位的序列号（SN ID）
模型号 比如A1278，模型号对顾客来说没什么作用，可以忽视。
    A1370指的是这款苹果笔记本的外**观模型型号**。并不是机器的型号。



## 系统

dmg是MAC苹果机上的压缩镜像文件，相当于在Windows上常见的iso文件，DMG在苹果机上可以直接运行加载。
dmg，全称为disk image，即磁盘影像，是Mac osx中的du一种文件格式。使用 ultraiso
    “工具”/“格式转换...”



镜像方面有2种：

    一种是带引导的原版镜像（本站镜像），支持工具一键写入U盘(https://xitongtiankong.com/archives/61536)

    一种是不带引导的原版镜像（官方商店下载），需要在macOS系统下使用终端写入U盘




升级包: https://support.apple.com/downloads/macos


### 10

从2001年的 Mac OS X Cheetah 开始，每个Mac操作系统的版本分别为 10.1、10.2 等。例如，macOS Mojave 为 10.14

macOS Catalina          10.15
macOS Mojave            10.14
macOS High Sierra       10.13
macOS Sierra            10.12
OS X El Capitan         10.11
OS X Yosemite           10.10
Mavericks               10.9
Mountain Lion           10.8
Lion                    10.7
Snow Leopard            10.6


### 11 

Big Sur



windows 下应该是只能使用 带引导的镜像来制作启动盘

mac 下可以直接下载原版镜像，用命令行加参数制作启动盘


### windows 下 U盘安装盘制作

使用软件 TransMac

16G 以上U盘

TransMac是能够在Windows环境下制作macOS U盘启动安装盘的工具，只能把带引导的mac镜像与黑苹果写入，app story 下载的与其他地方下载的原版不带引导的镜像写入是无法启动

TransMac还拥有写入十分稳定的特点，不容易出错，balenaEtcher则经常报错，需要反复写入直至成功，推荐有Windows环境的优先使用TransMac

选中U盘，右键 -> Restore with Disk Image -> 选择下载的macOS DMG镜像文件，点击OK，等待进度条走完，出现 Restore Complete



镜像方面有2种：

    一种是带引导的原版镜像（本站镜像），支持工具一键写入U盘

    一种是不带引导的原版镜像（官方商店下载），需要在macOS系统下使用终端写入U盘




### Mac 环境下

balenaEtcher，这个有Win版本也有Mac版本，所以如果在Mac系统下制作，只能使用该工具

---

1. 先从 App Store 下载 10.15 Catalina
1. 准备一个 8G 的空U盘
1. 打开自带的应用“终端”

    ```
    在终端里输入：
    sudo /Applications/Install\ macOS\ Catalina.app/Contents/Resources/createinstallmedia --volume /Volumes/MyVolume /Applications/Install\ macOS\ Mojave.app --nointeraction

    其中 MyVolume 为你的 U 盘名字。

然后输入管理员账号的密码根据提示完成操作即可。
```







--nointeraction, Erase the disk pointed to by volume without prompting for confirmation

---

降级到10.14的

1. App Stoty 下载
1. 请准备好一个 10.14的U盘。
1. 备份你的重要数据和项目文件，降级需要格式化硬盘。
1. 制作 U 盘操作方式和10.15的一样，命令行如下：
    ```
    sudo /Applications/Install\ macOS\ Mojave.app/Contents/Resources/createinstallmedia --volume /Volumes/MyVolume
    ```
同时 App Store 已无法找到 10.14.6 Mojave，建议各位自行搜索下载地址。

下载好把文件放到“应用程序”里即可。

---


https://support.apple.com/zh-cn/HT211683


### 方法2 制作U盘启动盘


制作Mac os Catalina u盘启动报错： createinstallmedia: command not found

这是因为没有权限打开createinstallmedia，修改权限即可:

    ` swaedeMacBook-Pro:~ swae$ chmod +x /Applications/Install\ macOS\ Catalina.app/Contents/Resources/createinstallmedia

修改完成权限后，重置制作u盘启动即可：

    ` swaedeMacBook-Pro:~ swae$ sudo /Applications/Install\ macOS\ Catalina.app/Contents/Resources/createinstallmedia --volume /Volumes/Catalina/




### 安装系统

制作好的U盘系统插入电脑，在关机状态下，开机按住【option】键不放，直到出现安装图标








### 关于2018后新款 Mac 增加T2安全芯片造成无法U盘启动解决办法


2018后机型苹果加入了一个T2安全芯片，设定了权限，禁止其他U盘或外置硬盘来启动，更加隐私，这时候要想安装系统，除了网络恢复外，只有打开权限来操作，需要用到苹果用户密码

打开权限具体操作：

开机时候按住 Command+R，选择中文

实用工具 -> 启动安全性实用工具 -> 无安全性 & 允许从外部介质启动










## 使用

### 触控板

系统偏好设置/触控板 

#### 光标与点按

轻点
点按
用力点按


查询与数据检测器:
辅助点按: 鼠标右键，默认的双指点按，可以选择 "点按左下角" 或 "点按右下角"
轻点来代替点按: 上方两个默认是点按，选中本选项使用轻点

静默点按: 无声
用力点按和触感反馈:

#### 滚动缩放

滚动方向：自然。
    页面上下滑动与鼠标

放大或缩小

智能缩放：双指轻点两下，放大与缩小


#### 更多手势


调度中心: 三指向上清扫

显示桌面：张开拇指和其他三指


### 键盘

control

option

command
    command c
    command v



#### 快捷键

打开关闭扩展坞:  control + option + command




### 安全与隐私

开启任何来源

    sudo spctl --master-disable



## 序列号显示不可用

重置 Mac 上的系统管理控制器 (SMC)

关于 SMC
系统管理控制器 (SMC) 负责管理与以下功能相关的行为：

电源，包括电源按钮和 USB 端口的电源
电池和充电
风扇和其他热能管理功能
指示灯或感应器，例如状态指示灯（睡眠状态、电池充电状态等）、突发移动感应器、环境光传感器和键盘背光
打开和合上笔记本电脑盖时的行为
重置 SMC 不会影响 NVRAM 或 PRAM 的内容。

https://support.apple.com/zh-cn/HT201295

1. 装有不可拆卸电池的笔记本电脑
    这类电脑包括 2009 年中至 2017 年推出的 MacBook Pro 机型、2017 年或之前推出的 MacBook Air 机型，以及所有 MacBook 机型，但 MacBook（13 英寸，2009 年中）除外。

    将 Mac 关机。
    在内建键盘上，按住以下所有按键：
    键盘左侧的 Shift 
    键盘左侧的 Control 
    键盘左侧的 Option (Alt) 
    在按住全部三个按键的情况下，按住电源按钮
    按住全部四个按键 10 秒钟。
    松开所有按键，然后按下电源按钮以将 Mac 开机。

1. 装有可拆卸电池的笔记本电脑
    这类电脑包括 2009 年初或之前推出的所有 MacBook Pro 和 MacBook 机型，以及 MacBook（13 英寸，2009 年中）。 

    将 Mac 关机。
    拆下电池。（如果您需要拆卸电池方面的协助，请联系 Apple Store 商店或 Apple 授权服务提供商。）
    按住电源按钮 5 秒钟。
    重新安装电池。
    按下电源按钮以将 Mac 开机。
    台式电脑
    将 Mac 关机，然后拔下电源线。
    等待 15 秒钟，然后重新接回电源线。
    等待 5 秒钟，然后按下电源按钮以将 Mac 开机。


1. 配备 T2 芯片的笔记本电脑
    重置 SMC 之前，请尝试以下步骤：

    将 Mac 关机。
    按住电源按钮 10 秒钟，然后松开这个按钮。
    等待几秒钟，然后按下电源按钮以将 Mac 开机。
    如果问题仍然存在，请按照以下步骤重置 SMC：

    将 Mac 关机。
    在内建键盘上，按住以下所有按键。Mac 可能会开机。
    键盘左侧的 Control 
    键盘左侧的 Option (Alt) 
    键盘右侧的 Shift 
    按住全部三个按键 7 秒钟，然后在不松开按键的情况下按住电源按钮。如果 Mac 处于开机状态，它将在您按住这些按键时关机。
    继续按住全部四个按键 7 秒钟，然后松开这些按键。
    等待几秒钟，然后按下电源按钮以将 Mac 开机。


1. 配备 T2 芯片的台式电脑
    将 Mac 关机，然后拔下电源线。
    等待 15 秒钟，然后重新接回电源线。
    等待 5 秒钟，然后按下电源按钮以将 Mac 开机。




## 重置 Mac 上的 NVRAM 或 PRAM

https://support.apple.com/zh-cn/HT204063

如果 Mac 出现了与 NVRAM 或 PRAM 中储存的设置有关的问题，那么进行重置可能会有帮助。

NVRAM（非易失性随机访问存储器）是一小部分内存，Mac 使用这些内存来储存某些设置并对其进行快速访问。PRAM（参数 RAM）储存着类似的信息，且 NVRAM 和 PRAM 的重置步骤相同。

可储存在 NVRAM 中的设置包括音量、显示屏分辨率、启动磁盘选择、时区，以及最近的内核崩溃信息。储存在 NVRAM 中的设置取决于您的 Mac 以及与这台 Mac 搭配使用的设备。

如果您遇到与这些设置或其他设置有关的问题，那么重置 NVRAM 可能会有帮助。例如，如果 Mac 并非从“启动磁盘”偏好设置中选定的磁盘启动，或者在 Mac 启动前短暂地显示了一个问号图标，则可能需要重置 NVRAM。



### 如何重置 NVRAM

Option键加 Command键加P键加R键

将 Mac 关机，然后开机并立即同时按住以下四个按键：Option、Command、P 和 R。您可以在大约 20 秒后松开这些按键，在此期间您的 Mac 可能看似在重新启动。

    如果 Mac 电脑发出启动声，您可以在第二次启动声过后松开这些按键。
    在搭载 Apple T2 安全芯片的 Mac 电脑上，您可以在 Apple 标志第二次出现并消失后松开这些按键。 

    如果您的 Mac 使用了固件密码，这个组合键将不起任何作用或导致您的 Mac 从 macOS 恢复功能启动。要重置 NVRAM，请先关闭固件密码。

在您的 Mac 完成启动后，您可能需要打开“系统偏好设置”并调整已重置的任何设置，例如音量、显示屏分辨率、启动磁盘选择或时区。


### 进一步了解

如果您使用的是 Mac 台式电脑而非笔记本电脑，并且每次关闭 Mac 并断开 Mac 电源时，音量或时区等设置均会重置，则您可能需要更换 Mac 中的电池。这个小电池位于电脑的主板上，用于在断开 Mac 电源连接时帮助 NVRAM 保存设置。您可以携 Mac 前往 Apple 服务提供商处来更换该电池。

如果遇到了与睡眠、唤醒、电源、为 Mac 笔记本电脑电池充电有关的问题或其他与电源相关的症状，您可能需要重置 SMC（系统管理控制器）。



### 命令查看系统版本信息

sw_vers




### mac ssh Linux 乱码问题

mac 的 locale 设置
```
➜  ~ locale
LANG=""
LC_COLLATE="C"
LC_CTYPE="UTF-8"
LC_MESSAGES="C"
LC_MONETARY="C"
LC_NUMERIC="C"
LC_TIME="C"
LC_ALL=
```

发现是 C, 更改为和 Linux 一样的
    
    ` export LCA_ALL=en_US.UTF-8

##  autojump

1. 安装zsh：sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
2. 将zsh设置成默认的shell：chsh -s /bin/zsh (重启shell)
3. echo $SHELL可以查看用的哪个shell（bash or zsh）
4. 安装autojump：brew install autojump（确保有brew）
5. 使用vim .zshrc打开.zshrc（有些人会找不到.zshrc这个文件，其实安装了zsh才会有.zshrc ，在默认打开的终端目录下。可以打开终端并且ls -a查看）。

    a. 找到 plugins=，在后面添加autojump：plugins=(git autojump)
    b. 新开一行，添加：[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] &amp;&amp; . $(brew --prefix)/etc/profile.d/autojump.sh
    c. :wq保存退出，重启终端。
