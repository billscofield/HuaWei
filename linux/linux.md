
## Alpine
Alpine Linux is a security-oriented, lightweight Linux distribution based on **musl libc** and **busybox**.


## BusyBox
BusyBox 是一个集成了三百多个最常用Linux命令和工具的软件。BusyBox 包含了一些简单的工具，例如ls、cat和echo等等，还包含了一些更大、更复杂的工具，例grep、find、mount以及telnet。有些人将 BusyBox 称为 Linux 工具里的瑞士军刀。简单的说BusyBox就好像是个大工具箱，它集成压缩了 Linux 的许多工具和命令，也包含了 Android 系统的自带的shell。

## Libc
libc的名字来源于历史，指**C开发包的函数库**，包括头文件和基本C库libc.a，最初的libc由发明C语言那些人写的，后来随着C移植到不同平台，libc也有了多个版本，可能是为了兼容吧，很多头文件和libc.a的文件名都没有变（很好的传统）。

现在libc泛指C函数库，**而用的最广，功能最强的当然是GNU LibC，简称glibc，各发行版Linux用的就是glibc。**

libc的动态库版本叫做是libc.so，通常是/usr/lib/libc.so，glibc的libc.so其实不是.so文件，而是一个ld Script，这没有关系，gnu ld 会正确处理的。

还有其他版本的libc，比如newlibc，通常用在嵌入系统中。

### musl libc
Welcome to the home of musl, a new standard library to power a new generation of Linux-based devices. musl is lightweight, fast, simple, free, and strives to be correct in the sense of standards-conformance and safety.


1. Glibc = GNU C Library 是GNU项（GNU Project）目，所实现的 C语言标准库（C standard library）。 目前，常见的桌面和服务器中的GNU/Linux类的系统中，都是用的这套C语言标准库。 其实现了常见的C库的函数，支持很多种系统平台，功能很全，但是也相对比较臃肿和庞大。

2. uClibc 一个小型的C语言标准库，主要用于嵌入式。 其最开始设计用于uClinux（注：uClinux不支持MMU），因此比较适用于微处理器中。 对应的，此处的u意思是μ，Micro，微小的意思。 
    1. uClibc的特点： 
        1. uClibc比glibc要小很多。 (2)uClibc是独立的，为了应用于嵌入式系统中，完全重新实现出来的。和glibc在源码结构和二进制上，都不兼容。

3. EGLIBC = Embedded GLIBC EGLIBC是，（后来）glibc的原创作组织FSF所（新）推出的，glibc的一种变体，目的在于将glibc用于嵌入式系统。 
    EGLIBC的目标是： 
    1. 保持源码和二进制级别的兼容于Glibc 源代码架构和ABI层面兼容 如果真正实现了这个目标，那意味着，你之前用glibc编译的程序，可以直接用eglibc替换，而不需要重新编译。 这样就可以复用之前的很多的程序了。 
    1. 降低(内存)资源占用/消耗 
    1. 使更多的模块为可配置的（以实现按需裁剪不需要的模块） 
    1. 提高对于交叉编译(cross-compilation)和交叉测试(cross-testing)的支持 Eglibc的最主要特点就是可配置，这样对于嵌入式系统中，你所不需要的模块，比如NIS，locale等，就可以裁剪掉，不把其编译到库中，使得降低生成的库的大小了。 更多特点，可以去看：Eglibc的特点 【glibc, uClibc, Elibc的渊源/历史/区别/联系】 
    
    1. 写程序，需要用到很多c语言的库函数。所有的库函数加起来，就是对应的C语言（标准）函数库。 
    2. 目前在普通GNU/Linux系统中所用的C语言标准库，叫做glibc。其功能很全，函数很多，但是代码太多，编译出来的函数库的大小也很大，即资源占用也很多。 
    3. 而嵌入式系统中，也需要C语言写代码实现特定功能，也需要用到C语言函数库，但是由于嵌入式系统中，一般资源比较有限，所以不适合直接使用（太占用资源的）gLibc。 
    4. 所以有人就又（没有参考glibc，而是从头开始，）重新实现了一个用于嵌入式系统中的，代码量不是很大的，资源占用相对较少的，C语言函数库，叫做uClibc。并且，uClibc不支持MMU（内存管理单元）。 
    5. 而后来，glibc的开发者，又推出个Embedded glibc，简称eglibc，其主要目的也是将glibc用于嵌入式领域。 相应最大的改动就在于，把更多的库函数，改为可配置的，这样，如果你的嵌入式系统中不需要某些函数，就可以裁剪掉，不把该函数编译到你的eglibc库中，使得最终生成的eglibc库的大小变小，最终符合你的嵌入式系统的要求（不能超过一定的大小），这样，就实现了，把glibc引用于嵌入式系统中的目的了。 
    
    1. 可以简单的理解为： glibc，uClibc，eglibc都是C语言函数库： 
        1. uClibc是嵌入式系统中用的，glibc是桌面系统用的 
        2. eglibc也是嵌入式系统中用的，是glibc的嵌入式版本，和glibc在源码和二进制上兼容。

4. Musl-libc C语言标准库Musl-libc项目发布了1.0版。Musl是一个轻量级的C标准库，设计作为GNU C library (glibc)、 uClibc或Android Bionic的替代用于嵌入式操作系统和移动设备。它遵循POSIX 2008规格和 C99 标准，采用MIT许可证授权，使用Musl的Linux发行版和项目包括sabotage，bootstrap-linux，LightCube OS等等。

目前openwrt LEDE默认使用Musl-libc了。。。CC分支还是uclibc




## quiet splash , nomodeset
quiet splash rw init=/bin/bash

1. nomodeset 
    1. means do not load video drivers

1. quiet
    1. This option tells the kernel to NOT produce any output (a.k.a. Non verbose mode). 
    1. If you boot without this option, you'll see lots of kernel messages such as drivers/modules activations, filesystem checks and errors.
    1. quiet的意思是内核启动时候简化提示信息


1. splash 使（液体）溅起;
    1. splash的意思是启动的时候使用图形化的进度条代替init的字符输出过程


/boot/grub/grub.cfg







## md5sum && sha1sum

在网络传输、设备之间转存、复制大文件等时，可能会出现传输前后数据不一致的情况。这种情况在网络这种相对更不稳定的环境中，容易出现。那么校验文件的完整性，也是势在必行的

md5值是一个128位的二进制数据，转换成16进制则是32（128/4）位的进制值

SHA1与md5类似，是另一种常用的校验和算法。160位二进制数据，它从给定的输入文件中生成一个长度为40个字符的十六进制串

md5校验，有很小的概率不同的文件生成的md5可能相同。比md5更安全的校验算法还有SHA系列的

生成md5值重定向到指定的文件，通常文件的扩展名我们会命为.md5
    md5sum data > data.md5

将多个文件的md5重定向到指定的文件(每个文件的md5生成为一行)
    md5sum * > data.md5
    
-c选项来对文件md5进行校验。校验时，根据已生成的md5来进行校验。生成当前文件的md5，并和之前已经生成的md5进行对比，如果一致，则返回OK，否则返回错误信息


    ```
    bf7e63bb97c951df00046d6677e4d2ff  linux.md  //这个是test.md5文件中的内容，md5是和文件名对应的    
    md5sum -c test.md5
        --check


    linux.md: OK

    linux.md: FAILED
    ```


1. md5sum 是校验文件内容，与文件名是否相同无关
1. md5sum 值逐位校验，所以文件越大，校验时间越长。

sha1sum 用法同 md5sum 完全一致


    一致返回0，不一致返回1

--quiet
    成功不输出，失败则输出

    md5sum -c test.md5
    echo $?


使用grep过滤

md5sum -c test.md5 | grep -v OK



## 查看发行版本

1.  lsb_release
    lsb_release只是一个小程序
    lsb_release其实是红帽的一个项目，其名为redhat-lsb
    更准确的说是redhat-lsb-core


    yum install redhat-lsb
    或者
    yum install redhat-lsb-core

    两者的区别，只是redhat-lsb-core只安装core核心部分，而redhat-lsb则是多安装以下几个包：分别是compat、graphics、printing

    为什么小编知道lsb_release是属于哪个包的呢？
    rpm -qf $(which lsb_release)

1. cat /etc/os-release
1. cat /etc/issue



## apt

1. install
1. remove
1. purge  净化
1. update
1. upgrade
1. dist-upgrade
1. clean    //清除缓存信息
    apt-cache 就是先看缓存的


apt-cache pkgnames 
    列出了源包含有哪些包

### check package information
apt-cache show 包名字


before installing get info of this package from sources.list
需要哪些dependences ，大小等等


## apt-file
sudo apt install apt-file
apt-file update     //从服务器获取元数据
apt-file search 文件名 比如/bin/ls  //查询包含了/bin/ls 这个关键字的包有哪些

dpkg -l 
    列出了本机安装了哪些包


apt list --upgradable


## 关闭在线用户
1. 方法一
    who
    echo "i will close your connection">/dev/pts/2
    fuser -k /dev/pst/2
    
    fuser:show which processes use the named files, sockets, or filesystems
1. 方法二
    who 
    pkill -kill -t pts/0

    pgrep, pkill - look up or signal processes based on name and other attributes

    
    pkill : look up or signal processes based on name and other attributes
1. 方法三
    登录用户的bash进程
    ps -ef | grep bash | grep pts
    kill -9  1 2 3


## 查看
1. 查看内核 cat /proc/version

1. 查看发行版本 cat /etc/os-release




## 彩色字体
终端的字符颜色是用转义序列控制的，是文本模式下的系统显示功能，和具体的语言无关。 
转义序列是以ESC开头,即用\033来完成（ESC的ASCII码用十进制表示是27，用八进制表示就是033）

书写格式： 
开头部分：\033[显示方式;前景色;背景色m + 结尾部分：\033[0m

数值表示的参数含义：
    显示方式
        0(默认值)、1(高亮)、4(下划线)、5(闪烁)、7(反显)、
    前景色
        30(黑色)、31(红色)、32(绿色)、33(黄色)、34(蓝色)、35(洋红)、36(青色)、37(白色)
    背景色
        40(黑色)、41(红色)、42(绿色)、43(黄色)、44(蓝色)、45(洋红)、46(青色)、47(白色)


## 可封装常用的字体颜色到类中,便于以后使用
class bcolor(object):
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'

print(bcolor.WARNING + 'WARNING: start httpd failed' + bcolor.ENDC)
print(bcolor.OKGREEN + 'starting......' + bcolor.ENDC)
print(bcolor.OKBLUE + 'starting......' + bcolor.ENDC)
print(bcolor.FAIL + 'starting......' + bcolor.ENDC)
print(bcolor.HEADER + 'starting......' + bcolor.ENDC)



## 创建一个名称为 '--test'的文件
touch -- --test
rm -rf -- --test



在ubuntu下，由于版权的原因，默认不支持exfat格式的u盘，不过可以很方便就能添加对exfat的支持：
    sudo apt-get install exfat-utils
    安装完之后重启生效。
    


find ./ -inum 222 -exec rm -i {} \; // \; 前面必须有一个空格


vi 模式 
    vi ~/.zshrc
    G
    set -o vi


## 进程

### ps
???docker 中没有 ps

ps --help
    Try 'ps --help <simple|list|output|threads|misc|all>'
    or 'ps --help <s|l|o|t|m|a>'

    ps --help s

三种风格 
    unix95      -a
    BSD         a
    GNU长选项   --a

ps --help s
Basic options:
 -A, -e               all processes
 -a                   all with tty, except session leaders
  a                   all with tty, including other users
 -d                   all except session leaders
 -N, --deselect       negate selection 反选
  r                   only running processes
  T                   all processes on this terminal
  x                   processes without controlling ttys 没有控制终端的进程






top -h 
procps-ng
    本质上去读 /proc/





## 监控linux
### 内存
### free

vmstat 时间间隔(秒)

sar -r 3
    systat
    -r [ALL]




## /etc/shadow

1. 该列留空，即"::"，表示该用户没有密码。
1. 该列为"!"，即":!:"，表示该用户被锁，被锁将无法登陆，但是可能其他的登录方式是不受限制的，如ssh公钥认证的方式，su的方式。
1. 该列为"*"，即":*:"，也表示该用户被锁，和"!"效果是一样的。
1. 该列以"!"或"!!"开头，则也表示该用户被锁。
1. 该列为"!!"，即":!!:"，表示该用户从来没设置过密码。

1. 如果格式为"$id$salt$hashed"，则表示该用户密码正常。其中$id$的id表示密码的加密算法，
    $1$表示使用MD5算法，
    $2a$表示使用Blowfish算法，
    "$2y$"是另一算法长度的Blowfish,
    "$5$"表示SHA-256算法，
    "$6$"表示SHA-512算法，目前基本上都使用sha-512算法的，但无论是md5还是sha-256都仍然支持。
    $salt$是加密时使用的salt，hashed才是真正的密码部分。


以用户letuknowit为例（15400对应的日期为2012年3月1日），其保护如下信息：
    1. letuknowit:$1$cPf/cIvr$sCws95uSip2ljTK052DDB.:15400:5:60:7:2:15490:
　　1. 用户letuknowit最近一次修改密码的日期是2012年3月1日， 
　　1. 在2012年3月6日之前不能再改动密码了， 
　　1. 在2012-3-1到2012-4-29期间letuknowit需要更改密码， 
　　1. 在2012-4-29之前的7天，letuknowit登陆系统的时候，系统会提示letuknowit其密码即将过期， 
　　1. 如果letuknowit一直到2012-4-29都没有修改密码，则其仍然可以继续使用该账户2天，2天后该账户将不可用 
　　1. 无论如何，到了2012年5月29日，该账号都将失效
    https://blog.csdn.net/qq_36747237/article/details/80447526

who am i

POSIX表示可移植操作系统接口（Portable Operating System Interface of UNIX，缩写为 POSIX ）



bash 是GNU计划的一部分，用来替代 B shell


## X window

斯坦福大学的 Athena 计划
    W Window

1984 麻省理工和 DEC 公司基于 W Window 开发了 X Window
    1987 年发布的 X11
    1994 年发布的 X11 R6(X Protocol version 11 Release 6)
    2005 年发布的 X11 R7

只不过在LINUX上最常用的是XFree86.(现在的linux发行版都用Xorg了)

顺便说一句，苹果电脑的图形界面用的也是X协议，而且被认为是做的最好的X协议图形界面，并且他对X协议的实施是做在系统内核里的，所以性能明显好很多，这就是为什么很多大型三维图形设计软件都是在苹果平台上的原因


gnome 
    gdm(Gnome Display manager)
    lightDM(light display manager)



