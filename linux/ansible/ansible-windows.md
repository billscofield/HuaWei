

1. 管理机必须为 Linux 系统且需预安装 Python Winrm 模块(python2.6 都可以)

    pip install pywinrm

2.  底层通信基于PowerShell，版本为3.0+，Management Framework版本为3.0+

3.  远程主机开启Winrm服务



## windows

1. 安装Framework 3.0+

    http://download.microsoft.com/download/B/A/4/BA4A7E71-2906-4B2D-A0E1-80CF16844F5F/dotNetFx45_Full_x86_x64.exe

2. 升级PowerShell至3.0+ 

    下脚本保存至本地后，右键选择“使用PowerShell运行”，执行完毕重启系统后，在PowerShell执行 Get-Host , PowerShell版本为3.0为正常。



3. [更改powershell策略为remotesigned](https://docs.microsoft.com/zh-cn/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.1)

    以管理员方式运行 powershell

    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned


4. 设置Windows远端管理（WS-Management，WinRM），在windows 的命令行模式下运行（用管理员）

    winrm enumerate winrm/config/listener   #winrm service 默认都是未启用的状态，先查看状态；如无返回信息，则是没有启动；
    winrm quickconfig                       #针对winrm service 进行基础配置：
    winrm e winrm/config/listener           #查看winrm service listener:
    winrm set winrm/config/service/auth @{Basic="true"}         #为winrm service 配置auth:
    winrm set winrm/config/service @{AllowUnencrypted="true"}   #为winrm service 配置加密方式为允许非加密：

