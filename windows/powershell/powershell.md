
# POWERSHELL 基本入门

linux 中的启动命令是 pwsh

powershell 是 cmd 的扩展

PS: Power Shell

Windows Management Framework(windows 管理框架, WMF)

    跨平台


dotnet framework

    

CMD中输入 powershell


$psveriontable   // 版本
    echo $psveriontable

    win7 是 2.0 本本

    win8, 2012 是 3.0 版本

    win10 是 4.0 版本

远程管理

    是通过 http/https 协议

    WinRM 协议

## 开发工具

1. visual studio

2. Powershell ise




## 

get-service     动词-名词
    -name alg


get-help
    get-help get-service

    update-help
        -UICulture zh-cn


[-name] <string>        必须的

[-name <string>]        非必须的

[-name <string>[]]      非必须的, 接受多个 string 类型的参数


get-verb        获取动词的列表



## 数学运算

常用的数学运算

计算机运算
    1gb                 //1 GB 大小
    1gb/1mb

    1gb -gt 1mb         // True

八进制
    
十六进制


## 

get-service

面向对象的

.net

和 cmd, vbs 兼容性好

管理活动目录, office365 等


## 自定义个性化选项

快速编辑模式 默认勾选
    选中,enter 即复制
    右键即粘贴


## 快捷键

ESC             删除
HOME            行首
END             行尾
<C-c>           同Linux
alt+F7          清空历史命令
F2              补齐历史命令至
Tab             自动补全

## 管道和重定向

ls | findstr

ls | format-table name,mode     // 只输出name 和 mode 列


1. >
    ls | format-table name,mode > a.txt

    type a.txt                      // 打印 a.txt ， 同 cat

2. >>


## 执行外部命令

&"notepad"

$env:path           // 环境变量

#env:path=$env:path+"d:/program"


get-command         // 获取所有命令 gcm
get-command | less


    CommandType:    
        Alias
        Function
        Cmdlet

    Nmae
        一般是动词+名词

    Version

    Source


## 帮助

get-help xxx
    会显示别名信息

get-history

get-date

get-childitem       ls

get-alias -name ls  //获取别名的真名

```
geta-alias | where {$_.definition.startswith("Remove")}
    $_.   当前元素

get-alias | group-object definition S| sort -descending Count

```

自定义别名
    set-alias -name pad -value notepad
    del alias:pad

    export-alias demo.psl
    import-alias -force demo.psl


## 变量

$name = "xiaoming"
$name                   // 输出

${"I am a " var ()} = 'hello world'     // OK

$num1=$num2=2

交换值
    $num1, $num2 = $num2, $num1


ls variable???

test-path





## 

为防止恶意脚本的执行，PowerShell 中设计了一个叫做执行策略(Execution Policy)的东西(我更倾向于把它叫做脚本执行策略)。我们可以在不同的应用场景中设置不同的策略来防止恶意脚本的执行。本文主要是解释这些执行策略，因为笔者在学习的时候发现它们并不是那么清晰易懂。

PowerShell 提供了
    Restricted
    AllSigned
    RemoteSigned
    Unrestricted
    Bypass
    Undefined
六种类型的执行策略，接下来我们一一介绍。

restricted
    主要是限制脚本的执行。说简单点就是：可以执行单个的命令，但是不能执行脚本。

AllSigned

    Signed 在这里指有数字签名的脚本，也就是说 AllSigned 执行策略允许执行所有具
    有数字签名的脚本。当然我们也可以换个角度说：只能运行具有数字签名的脚本。据
    我所知我们能见到的绝大多数的 PowerShell 脚本是没有数字签名的。

RemoteSigned

    从 Windows Server 2012 R2 开始，PowerShell 中默认的执行策略改成了
    RemoteSigned。这个执行策略的意思是：当执行从网络上下载的脚本时，需要脚本具
    有数字签名，否则不会运行这个脚本

Unrestricted

    这是一种比较宽容的策略，允许运行未签名的脚本。对于从网络上下载的脚本，在运
    行前会进行安全性提示, 仅仅是个提示，还是允许脚本执行的。


Bypass

    Bypass 执行策略对脚本的执行不设任何的限制，任何脚本都可以执行，并且不会有安
    全性提示。

Undefined

    Undefined 表示没有设置脚本策略。当然此时会发生继承或应用默认的脚本策略。


### Execution Policy Scope

Sycope  指执行策略的应用范围。原来我们可以给不同的应用范围设置执行策略。比如进
程、当前用户和本机。

Get-ExecutionPolicy 和 Set-ExecutionPolicy 命令默认操作的都是本机的脚本执行策略。
如果要获得当前用户的执行策略可以使用 -Scope 选项：

    Get-ExecutionPolicy -Scope CurrentUser

同样如果仅修改当前用户的执行策略可以在 Set-ExecutionPolicy 命令中使用 scope 参
数。

    Set-ExecutionPolicy -ExecutionPolicy <PolicyName> -Scope CurrentUser




## 

set-executionpolic unrestricted

Get-PackageProvider Chocolatey

Install-Package paint.net, GoogleChrome, vlc, 7zip, Notepadplusplus, Mallwarebytes -Force
    Malwarebytes 反恶意反间谍软件


Get-AppXProvisionedPackage -online | Remove-AppxProvisionedPackage –online

    在创建账户之前，我们可以从系统账户中删除这些应用，这样新创建的账户中就不会
    包含全套应用了。从系统账户中卸载应用

    执行以后上操作后会将应用商店也一并删除，目前也没有找回的方法，系统推送的某
    些更新会重新在系统中安装应用商店。另外，部分内置应用，比如Cortana、联系支持
    人员、Edge浏览器、Windows反馈，设置和搜索无法从系统中删除

