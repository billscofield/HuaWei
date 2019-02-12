
Get-AppxPackage -AllUsers| Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}

Get-AppXPackage *WindowsStore* -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}

# Windows Subsystem for Linux (WSL) 

## win10 应用商店里的应用的管理
设置 -> 应用

## 卸载应用商店
1. PowerShell 管理员方式运行
1. Get-AppxPackage *WindowsStore* | Remove-AppxPackage

https://zhidao.baidu.com/question/922288224924826299.html



## Win10应用商店被卸载后如何重新安装
https://blog.csdn.net/qq459080123/article/details/76715007

1.  power shell **以管理员身份运行**
1. add-appxpackage -register "C:\Program Files\WindowsApps\Microsoft.WindowsStore_11606.1001.39.0_x64__8wekyb3d8bbwe\appxmanifest.xml" -disabledevelopmentmode 


## win10无法使用内置管理员账户打开应用怎么办
https://jingyan.baidu.com/article/d621e8da4289512865913f2b.html

本地策略 -> 安全选项 -> 用户账户控制 -> 以管理员批准模式运行所有管理员 -> 已启动 
			         -> 用于内置管理员账户的管理员批准模式 -> 已启用
最后重启就可以了


## 更新window
http://www.xitongtiandi.net/wenzhang/win10/19588.html

查看window的版本号的方法
1. winver
1. dxdiag
1. cmd命令提示符
1. 设置 -> 系统 -> 左下角的关于

请转到 microsoft.com/software-download/windows10 并单击蓝色的“立即更新”按钮，如上图所示。这将下载Windows 10更新助手。


## 第一次启动 Ubuntu 18.04 会提示 WSL 组件未启用
https://www.sunzhongwei.com/mip/windows-subsystem-for-linux-wsl-early-experience-windows-10-install-ubuntu-1804

1. 点击系统左下角菜单 - 设置 - 更新和安全 - 针对开发人员
1. 然后，win + R 键打开运行命令，搜索 optionalfeatures.exe
 	1. 适用于 Linux 的 Windows 子系统
	1. 再次，打开 Ubuntu 18.04 就可以使用了，设置好用户名，密码，登录进去，就是一套完整的 Ubuntu 18.04 Server 系统




## 修改 WSL Ubuntu 18.04 默认源为阿里云镜像

	```
	:%s/security.ubuntu/mirrors.aliyun/g
	:%s/archive.ubuntu/mirrors.aliyun/g
	```
https://www.sunzhongwei.com/mip/modify-the-wsl-ubuntu-1804-default-source-for-ali-cloud-images

上面这个只是修改了部分，建议还是直接百度一个，覆盖之


## 1809 上的 WSL 增加了复制黏贴快捷键
https://www.sunzhongwei.com/mip/upgrade-windows-version-10-1803-to-1809-and-the-only-bright-spot-is-to-increase-the-wsl-copy-paste-shortcut

ctrl + shift + c/v

## vim 字体problem
安装好WSL版本的Ubuntu之后，由于嫌弃默认的新宋体不好看，于是从属性窗格设置了新字体，但是发现在启动vim的时候会出现字体变回原来的新宋体的情况。随后在注册表项目： 

    ```
    HKEY_CURRENT_USER\Console\C:_Program Files_WindowsApps_CanonicalGroupLimited.Ubuntu18.04onWindows_1804.2018.817.0_x64__79rhkp1fndgsc_ubuntu1804.exe 
    中添加：CodePage（DWORD32、值0x01b5）
    重新登陆Ubuntu,问题解决
    ```

原文:https://blog.csdn.net/mobiux/article/details/82194028 


## 关闭 Windows 10 WSL 下按 TAB 或者 ESC 键时的哔哔声
https://www.sunzhongwei.com/mip/close-windows-10-wsl-tab-or-esc-key-beep

1. 关闭 Bash 里的哔哔声
	sudo 打开 /etc/inputrc，查找
	# set bell-style none
	去掉注释符号
	set bell-style none
1. 关闭 VIM 里的哔哔声
	编辑 ~/.vimrc，添加
	set visualbell
	set t_vb=

以上两个需要重新登陆才会生效

原文:https://blog.csdn.net/rhel_admin/article/details/34115459


## 一些优化配置
https://www.cnblogs.com/javanoob/p/wsl.html
https://www.wengbi.com/thread_96891_1.html



