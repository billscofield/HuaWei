## Links

https://blog.csdn.net/baiyibin0530/article/details/78841653


batch file programming, 是微软自带原生的开发语言

batch file 使用 cmd.exe 执行


@echo off表示执行了这条命令后关闭所有命令(包括本身这条命令)的回显。

echo off命令则表示关闭其他所有命令(不包括本身这条命令)的回显，@的作用就是关闭紧跟其后的一条命令的回显，

pause也是一条命令，作用就是使程序暂停，也就是输出“请按任意键继续…”的原因。
::是批处理文件中一种注释语句的方式，其与rem命令的区别我们后续再说。
@echo off执行以后，后面所有的命令均不显示，包括本条命令。
echo off执行以后，后面所有的命令均不显示，但本条命令是显示的。


/help       详细的帮助信息





## 设置环境变量

1. SET命令

    这种语法只能在Cmd Shell环境中有效，关闭运行环境环境变量将不保存。

    ```例子：
    @echo off  
    set PATH=C:\Java\jdk1.8.0_31\bin  
    set /p cmd="环境变量设置完成，输入javac回车测试："  
    %path%  
    @pause  
    ```


1. SETX命令
    Window XP 以上的系统都自带了该命令（如果没有，下载一个Setx.exe)，这种方式为永久设定环境变量。

设置用户环境变量 

    setx path "C:\Java\jdk1.8.0_31\bin"

设置系统环境变量

    setx path "C:\Java\jdk1.8.0_31\bin" /m

    指定应该在系统 (HKEY_LOCAL_MACHINE) 环境中设置此变量。在 HKEY_CURRENT_USER 环境下，默认将设置此变量。

注意1. 
    在某些情况下会出现“setx 无效语法 默认选项不能超过’2’次”的错误，据信是因为原先的环境变量中存在空格导致的，可使用双引号进行避免。

注意2.
    setx设置环境变量后，将在新打开的终端中生效，当前终端不会立即生效。

注意3.
    setx在设置变量的长度超过1024，会截取多出的字符。

注意4.
    setx还可以操作远程计算机，具体参数设置百度一下setx用法。

注意5.
    setx在设置某一变量的值，如果已经存在该变量会覆盖之前的值。所以正确方式是：要保存值=获取当前该变量的值+新值。

例如：set oldValue=获取当前变量值
    setx path %oldValue%;%newValue%


以下为获取用户环境变量path的值，该例子读取注册表内的值。

```
@echo off  
set regPath= HKEY_CURRENT_USER\Environment  
set key=path  

::判断是否存在该路径  
reg query %regPath% /v  %key% 1>nul 2>nul  
if %ERRORLEVEL%==0 (  

::取值  
For /f "tokens=3,4 delims= " %%v in ('Reg Query %regPath% /v %key% ') do Set oldValue=%%v   

) else Set oldValue=""  
echo %key%的原值为：%oldValue%  
pause  
```


## 算数运算


```
命令行
set /a 1+3
set /a 2*3

@echo off
set /a var = 2 * 7
set /a var = var * 7
echo %var%                      // 变量取值要用 %var%

pause
```


## 重定向

同 linux

type 查看文件内容， 同 cat


## 逻辑运算

&&
||

```
aaa || ipconfig
```

net user



## 管道

```
dir | find "*.txt"  // 必须要有引号, 引号中的内容区分大小写

netstat -an | find "ESTABLISHED"
```

net uer 用户名 密码 /add
net uer 用户名 /add
net uer 用户名 /delete
net uer 用户名 /active:yes


net user /help


## 参数传递

a.bat
    net uer %1 %2 /add

a.bat admin password


## 注释

```
@echo off

rem this is a comment remember
echo "hello"
net user %1 %2 /add

pause

```

## 提示符

color /?

color 背景色 前景色

color 0a

## 标题

title /?

title "hello world"


## 时间

date
    date /t     仅仅查看，不设置

time
    time /t


## 启动命令

start /?

    启动一个单独的窗口以运行指定的程序或命令

    /B 不创建新的窗口

    start ["title"] [path]

    start "user add" 1.bat admin password

## 调用其他 bat

call

call 2.bat


## tasklist 

显示本地或远程机器上的进程列表

tasklist /S 192.168.1.1 /U domain\admin /P pass

/fi filter
    /fi "STATUS eq UNKOWN"
    "pid eq 123"
    username
    services

## 任务关闭

taskkill

taskkill /pid 123


## tree

tree


## 重启

shutdown /?

shutdown /i         显示图形化界面, 必须第一个

    /l              注销
    /s              关闭
    /r              重启
    /a              中止
    /m              远程计算机   /m \\10.0.0.1
    /p              立即关闭本地计算机

## 计划任务

at /?

    at                          // 查看

    at 22:00 "notepad.exe"      // 后台方式的

    at 2 /delete

    at 22:00 /every:M,T,W,Th,F,S,Su c:\users\payload.exe

    已经废弃，使用 schtasks

schtasks


## 环境变量

set                             // 查看所有变量


echo %OS%


## dir

/a                              // 所有 ls -a
/dir /ah


## mkdir

默认 mkdir -p

rmdir/rd
    rmdir /s                    // 递归删除
    /q                          // 安静模式


## cd

cd /d                           // 可以改变驱动器

    cd /d d:\a


## 重命名

ren 旧 新


## 目录复制

copy

## 目录文件剪切

move

移动并重命名

## 网络相关

1. net user
    
    查看详情  net user admin

    /domain         // 在域上进行操作


2. net localgroup

    用户组

    net localgroup administrators 用户 /add         // 将用户添加到组中
    net localgroup administrators 用户 /delete      // 从组中删除用户

3. ping

    -l          // 缓冲区

4. telnet

    telnet host port

5. tracert

6. ipconfig

    ipconfig /release           // 释放ip
    ipconfig /renew             // 重新获得ip
    ipconfig /flushdns          // 清除 dns 缓存

7. arp

    -a                          // 所有

    -s                          // 本季 arp 绑定

    arp -s ip mac

## 条件判断

```
@echo off

set v=hello

if %v% == hello (echo ok) else (echo "not ok")


pause > nul
```


1. 文件是否存在

    exists

    ```
    @echo off

    rem 用来判断 1.bat 是否存在

    if exists c:\users\1.bat (echo ok) else (echo no)       // 必须写在一行???

    pause>nul
    ```

2. 文件删除

    ```
    @echo off

    rem 用来判断 1.bat 是否存在 并删除

    if exist c:\users\1.bat(
        echo file is found
        del c:\users\1.bat
    )else(
        echo file is not found
    )

    pause>nul
    ```

3. 遍历目录

` for /d in (路径/*) 具体操作
    /d 表示目录

```
@echo off
rem for test

for /d %%a in (*) do echo %%a

for /d %%a in (*) do if %%a == test rmdir %%a

pause>nul
```

4. 遍历文件

    for /r 目录 %%v in (匹配规则, 例如*.py) do

    ```
    @echo off

    for /r "c:\dira" %%file in (*.py) do echo %%file

    for /r "c:\dira" %%file in (*.py) do del %%file

    pause>nul
    ```

5. 遍历数字

    for /L %%v in (start,step,end) do

    [start,end]

    ```a.bat
    for /L %%v in (start,step,end) do ping %1.%%v

    a.bat 192.168.1
    ```

6. 文件内容

    对每一行进行操作

    ```
    for /F %%v in (3.bat) do echo %%v
    ```


    ```
    @echo off
    rem cd c:\Documents and Settings\%username%\Desktop

    :loop
    md virus
    cd virus
    goto loop

    pause>nul
    exit
    ```

## 实例

信息展示


```
@echo off

echo 1.a
echo 2.b
echo 3.c
echo 4.d

:first
echo Enter you option:
set /p opt=                 set /p    标准输入
if %opt% == 1 goto one
if %opt% == 2 goto two
if %opt% == 3 goto three
if %opt% == 4 goto four
echo Invalid option
goto first


:one
echo your choice one
pause>nul
exit

...
```

