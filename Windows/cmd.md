## Links

https://blog.csdn.net/baiyibin0530/article/details/78841653




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


## 
