
# POWERSHELL 基本入门

linux 中的启动命令是 pwsh

powershell 是 cmd 的扩展

PS: Power Shell


CMD中输入 powershell


$psveriontable   // 版本


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
