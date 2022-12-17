# windows


## shutdown 

-s 正常关机
-f 强制关机
-r 重启
-t 定时关机
-c 设置信息
-a 取消关机

shutdown /s         默认等待一分钟
shutdown /s /t 100  在100秒之后关机



## win10 版本

1. win10的版本
    1. 家庭版（Home）
    1. 专业版（Pro）
    1. 教育版（Education）
        1. 和企业版区别不大
    1. 企业版（Enterprise）
        LTSB  = Long Term Support Branch
        LTSC =  Long Term Support Channel

        这两个是win10 Enterprise 特有的功能(其实一样，应该是更名了), 允许系统只更新安全补丁而不更新功能补。其他的版本则只能照单全收

        1. 这两个版本的特点
            1. 没有小娜 
            1. 没有应用商店及众多自带应用
            1. 没有One drive
            1. 无Edge浏览器
            1. 只推送安全性更新 摆脱自动更新的烦恼
            1. 精简部分后台服务 内存占用更低
    1. win10 移动版
    1. win10 企业移动版
    1. win10 物联网核心版lot




以前是两位数年份+两位数月份。现在后两位改为H1（上半年）或H2（下半年）

微软每年都会给win10两次大更新，而2004是20h1，所以20h2就2004下一个版本




## win10商店版本Ubuntu访问window资源

cd /mnt/

## win10访问 商店版本Ubuntu资源

C:\Users\Administrator\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu16.04onWindows_79rhkp1fndgsc\LocalState\rootfs



## 链接

1. https://msdn.itellyou.cn



## 更新

累积更新包含自上次更新以来的全部内容，以及本次更新添加的内容。

Delta 更新，即 Δ 更新＝增量更新，从名字来看应该不包括以前的更新内容，仅包含本次更新添加的内容



### 1. samba


#### 清除 samba 登录缓存

1. 建立磁盘映射：

    net use Z: \\192.168.1.7\ubuntu  smbpassword /user:smbuser

    Z: 你要映射到windows的哪个磁盘

    \\192.168.1.7\ubuntu：你的samba路径

    smbpassword：samba密码

    smbuser：samba用户名


1. 删除磁盘映射：

    net use * /del  /y

    * ：所有映射到windows的磁盘盘符，也可以指定具体的如Z: 、Y:

    /y：如果不加这个，每次都会提示你是否删除磁盘映射


将两个命令分别保存到两个批处理文件里面，需要哪个时就点击哪个，十分方便快捷。


#### windows10 samba 安全策略无法访问

1. window10    win+R   加入

2. gpedit.msc

3. 计算机配置

4. 管理模板

5. 网络 -> lanman工作站

6. lanman工作站  本地策略编辑器双击启动不安全来宾登录

7. 点击启用 就不会出现  报错连不上了


### 2. 远程登录 mstsc

远程桌面连接账户限制无法登陆解决方案

gpedit.msc

Windows设置-安全设置

本地策略-安全选项

帐户：使用空密码的本地账只允许进行控制台登陆 -> 已启用



### wuauserv

links:

    https://www.thewindowsclub.com/wuauserv-high-cpu-usage-windows

Windows Update服务，它是Windows系统自动更新服务，当自动更新运行时，那么会从远程
计算机下载更新并进行安装，这时系统可能会变的很卡，但是更新是必须的。

如果你想禁止wuauserv服务禁用自动更新

我们可以停止 Windows update 服务，方法如下
    
    1. WIN+R >> services.msc

    1. 找到Windows update服务

    1. 双击打开该服务把启动类型设置为禁用，点击应用。(net stop wuauserv)

    1. 然后再点击上方的恢复选项卡，把第一次失败设置为“无操作”；


### GUID

Globally Unique Identifier的简称，中文翻译为“全局唯一标示符”,在Windows系统中也
称之为Class ID，缩写为CLSID。电脑中的GUID可以在注册表中找到，具体方法如下:

在注册表中展开HKEY_CLASSES_ROOT\CLSID\，在CLSID分支下面就可以看到很多的GUID，这
些ID对应的都是系统里面不同的程序，文件，系统组件等


### UUID

如何查看windows系统UUID

在命令提示符下输入 wmic 再输入csproduct 或 csproduct list full


### sysprep.exe修改SID

1. 查询当前机器的SID

    单击“开始”--》“运行”,执行cmd--》输入whoami /user,然后回车

2. 执行修改SID的命令，完整过程如下，最后电脑自动重启，开始初始化一个新的SID。

    ` cd c:\windows\system32\sysprep
     
    ` sysprep.exe /generalize /oobe /reboot

    Problems 1:尝试使用sysprep处理计算机时出现错误
    
        把 WMPNetworkSvc   (Windows Media Player Netwroking SharingService)服务停用

Sysprep 命令行选项

    下列命令行选项可用于 Sysprep：

    sysprep.exe [/oobe | /audit] [/generalize] [/reboot | /shutdown | /quit] [/quiet] [/unattend:answerfile]
 

 1. /audit

    重新启动计算机进入审核模式。审核模式使您可以将其他驱动程序或应用程序添加到
    Windows。您还可以在将 Windows 安装发送给最终用户前对其进行测试。如果指定了
    无人参与 Windows 安装程序文件，Windows 安装程序的审核模式将运行 auditSystem
    和 auditUser 配置阶段。

2. /generalize

    准备要作为映像的 Windows 安装。如果指定此选项，所有唯一的系统信息将从
    Windows安装中删除。安全 ID (SID) 重置，所有系统还原点将被清除，事件日志也将
    被删除。下一次计算机启动时，将运行 specialize 配置阶段。将创建新的安全 ID
    (SID)，如果用于 Windows 激活的时钟三次没有被重置，将其重置。

3. /oobe

    重新启动计算机进入“欢迎使用 Windows”模式。“欢迎使用 Windows”允许最终用户自
    定义其 Windows 操作系统、创建用户帐户、命名计算机和其他任务。在“欢迎使用
    Windows”启动前，将立即处理答案文件中 oobeSystem 配置阶段中的所有设置。

4. /reboot

    重新启动计算机。使用该选项审核计算机并确保首次运行体验正确工作。

5. /shutdown

    在 Sysprep 完成后关闭计算机。

6. /quiet

    运行 Sysprep 而不显示屏幕确认消息。如果自动运行 Sysprep，使用该选项。

7. /quit

    运行指定命令后，关闭 Sysprep。

9. /unattend: answerfile

    在无人参与安装期间，将答案文件中的设置应用到 Windows。

10. answerfile

    指定要使用的答案文件的路径和文件名。



## 备份系统

dism (Deployment Image Servicing and Management)

dism /capture-image 
     /imagefile:c:\win10refimg.wim
     /capturedir:c:\
     /name:"win10 reference image"

/imagefile command determine that path which the image will save it.

/Capturedir specify the directory which the image was applied.





## 审核模式

进入审核模式方法：

    1. 在 OOBE 屏幕上，按“ CTRL+SHIFT+F3”；

    2. Windows 会将计算机重新启动到审核模式，系统准备 (Sysprep) 工具将会出现。

退出审核模式方法：

    1. 在系统下，请在运行（Windows按键+R）里输入sysprep，点确定；

    2. 在打开的文件夹下双击sysperp.exe

    3. 在弹出的界面，选择进入系统全新体验，点确定，系统自动重启进入OOBE模式。



启动至审核模式会在内置管理员帐户中启动计算机，该帐户随后在 generalize 配置阶段
会自动删除。将计算机配置为启动至审核模式后，在将计算机配置为启动至开箱即用体验
(OOBE) 之前，该计算机默认会继续启动至审核模式。


启动受密码保护的屏幕保护程序，将无法重新登录到系统。


    进入系统全新体验(OOBE)：准备服务器，就像初次开机一样。
    通用：从镜像中删除SID信息
    关机：Sysprep任务执行完毕之后会立刻关机。


Sysprep存在的一些限制

    1. 在单个系统镜像上，您可以运行8次Sysprep。在运行这个工具8次之后，您需要重
       新创建您的系统镜像。

    2. 如果在生成系统镜像之前安装或更新Microsoft Store应用程序，Sysprep可能会失败。


https://learn.microsoft.com/zh-CN/windows-hardware/manufacture/desktop/sysprep--system-preparation--overview?view=windows-11#unsupported-scenarios
