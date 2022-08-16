# 《Linux命令行与shell脚本编程大全.第3版》

Linux可划分为以下四部分：

1. Linux内核

1. GNU工具

1. 图形桌面环境

1. 应用软件


## 内核主要负责以下四种功能：

1. **硬件**设备
2. **文件系统**
3. 系统**内存**
4. **软件**程序


### 系统内存管理

内存存储单元按组划分成很多块，这些块称作页面（page）。内核将每个内存页面放在物理
内存或交换空间。然后，内核会维护一个内存页面表，指明哪些页面位于物理内存内，哪些页面
被换到了磁盘上。

内核会记录哪些内存页面正在使用中，并自动把一段时间未访问的内存页面复制到交换空间
区域（称为换出，swapping out）——即使还有可用内存。当程序要访问一个已被换出的内存页
面时，内核必须从物理内存换出另外一个内存页面给它让出空间，然后从交换空间换入请求的内
存页面。显然，这个过程要花费时间，拖慢运行中的进程。只要Linux系统在运行，为运行中的
程序换出内存页面的过程就不会停歇。

### 软件程序管理

内核创建了第一个进程（称为init进程）来启动系统上所有其他进程。当内核启动时，它会
将init进程加载到虚拟内存中。内核在启动任何其他进程时，都会在虚拟内存中给新进程分配一
块专有区域来存储该进程用到的数据和代码。
一些Linux发行版使用一个表来管理在系统开机时要自动启动的进程。在Linux系统上，这个
表通常位于专门文件/etc/inittab中。
另外一些系统（比如现在流行的Ubuntu Linux发行版）则采用/etc/init.d目录，将开机时启动
或停止某个应用的脚本放在这个目录下。这些脚本通过/etc/rcX.d目录下的入口（entry）①启动，
这里的X代表运行级（run level）。

### 硬件设备管理

Linux系统将硬件设备当成特殊的文件，称为设备文件。设备文件有3种分类：

1. 字符型设备文件

1. 块设备文件

1. 网络设备文件


字符型设备文件是指处理数据时每次只能处理一个字符的设备。大多数类型的调制解调器和
终端都是作为字符型设备文件创建的。块设备文件是指处理数据时每次能处理大块数据的设备，
比如硬盘。
网络设备文件是指采用数据包发送和接收数据的设备，包括各种网卡和一个特殊的回环设
备。这个回环设备允许Linux系统使用常见的网络编程协议同自身通信。

## GUN 工具

除了由内核控制硬件设备外，操作系统还需要工具来执行一些标准功能，比如控制文件和
程序。


Bash shell由GNU项目开发，被当作标准Unix shell——Bourne shell（以创建者的名字命名）的替代品。
bash shell的名称就是针对 Bourne shell 的拼写所玩的一个文字游戏，称为Bourne again shell

可在配置较低的PC和笔记本电脑上运行的轻量级Linux图形化桌面环境

1. Fluxbox

1. Xfce

1. JWM

1. Fvwm

1. fvwm95

ubuntu 确实是 unity
Unity桌面得名于该项目的目标——为工作站、平板电脑以及移动设备提供一致的桌面体验。
不管你是在工作站还是在手机上使用 Ubuntu，Unity 桌面的使用方式都是一样的。


有Linux样本系统（称为Linux LiveCD）,由于单张CD容量的限制，这个样本并非完整的Linux系统，


tty代表电传打字机（teletypewriter  [telɪ'taɪpraɪtə]']）。这是一个古老的名词，指
的是一台用于发送消息的机器。

setterm
    -background
        black
        red
        green
        yellow
        blue、
        magenta
        cyan
        white
    将终端的背景色改为指定颜色

    -foreground
        black
        red
        green
        yellow
        blue、
        magenta
        cyan
        white
    将终端的前景色改为指定颜色

    -inversescreen on或off
        交换背景色和前景色
    -reset 无
        将终端外观恢复成默认设置并清屏


bash手册并不是按部就班的学习指南，而是作为快速参考来使用的。

Linux手册页惯用的节名
    Name            显示命令名和一段简短的描述
    Synopsis        命令的语法
    Configuration   命令配置信息
    Description     命令的一般性描述
    Options         命令选项描述
    Exit Status     命令的退出状态指示
    Return Value    命令的返回值
    Errors          命令的错误消息
    Environment     描述所使用的环境变量
    Files           命令用到的文件
    Versions        命令的版本信息
    Conforming To   命名所遵从的标准
    Notes           其他有帮助的资料
    Bugs            提供提交bug的途径
    Example         展示命令的用法
    Authors         命令开发人员的信息
    Copyright       命令源代码的版权状况
    See Also        与该命令类型的其他命令

如果不记得命令名怎么办？可以使用关键字搜索手册页。语法是：man -k 关键字。例
如，要查找与终端相关的命令，可以输入man -k terminal
    apropos : search the manual page names and descriptions


Linux手册页的内容区域
    1 可执行程序或shell命令
    2 系统调用  System calls (functions provided by the kernel)
    3 库调用    Library calls (functions within program libraries)
    4 特殊文件  Special files (usually found in /dev)
    5 文件格式与约定    File formats and conventions, e.g. /etc/passwd
    6 游戏
    ??? 7 概览、约定及杂项  Miscellaneous (including macro packages and conventions), e.g. man(7), groff(7)
    8 超级用户和系统管理员命令
    9 内核例程  Kernel routines [Non standard]


在现实内容的左上角和右上角，单词后的括号中有一个数字, 这表示所显示的手册页来自
内容区域几

一个命令偶尔会在多个内容区域都有对应的手册页。

你将会发现Linux使用正斜线（/）而不是反斜线（\）在文件路径中划分目录。在Linux中，
反斜线用来标识转义字符，

Linux将文件存储在单个目录结构中，这个目录被称为虚拟目录（virtual directory）。
虚拟目录将安装在PC上的所有存储设备的文件路径纳入单个目录结构中，路径本身并没有
提供任何有关文件究竟存放在哪个物理磁盘上的信息


在Linux PC上安装的第一块硬盘称为**根驱动器**。根驱动器包含了虚拟目录的核心，其
他目录都是从那里开始构建的。


/run 运行目录，存放系统运作时的运行时数据
/srv 服务目录，存放本地服务的相关文件
/sys 系统目录，存放系统硬件信息的相关文件

常见的目录名均基于**文件系统层级标准（filesystem hierarchy standard，FHS）**。
FHS偶尔会进行更新。你可能会发现有些Linux发行版仍在使用旧的FHS标准，而另外一些则
只实现了部分当前标准。要想保持与FHS标准同步，请访问其官方主页：
    http://www.pathname.com/fhso

ls -F 轻松区分文件和目录

从名字上看，它并不像more命令那样高级。但是，less命令的命名实际上是个文字游戏（从
俗语“less is more”得来），它实为more命令的升级版。


x或BSD风格的参数混用来定制输出。GNU长参数中一个着实让人喜爱的功能就是--forest参
数。它会显示进程的层级信息，并用ASCII字符绘出可爱的图表。

du 会以磁盘块为单位来表明每个文件或目录占用了多大存储空间。


dd = Disk Dump 
    convert and copy a file

    there is a command called dumy, which is used to backup a total disk


df = Disk Free
