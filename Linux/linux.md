
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


1. Glibc = GNU C Library 是GNU项（GNU Project）目，所实现的 C语言标准库（C standard library）。 目前，常见的桌面和服务器中的GNU/Linux类的系统中，都是用的这套C语言标准库。 其实现了常见的C库的函数，支持很多种系统平台，**功能很全，但是也相对比较臃肿和庞大。**

2. uClibc 一个小型的C语言标准库，主要用于嵌入式。 其最开始设计用于uClinux（注：uClinux不支持MMU），因此比较适用于微处理器中。 对应的，此处的u意思是μ，Micro，微小的意思。 
    1. uClibc的特点： 
        1. uClibc 比 glibc 要小很多。 
        2. uClibc 是独立的，为了应用于嵌入式系统中，完全重新实现出来的。和 glibc 在源码结构和二进制上，都不兼容。

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
    1. splash 的意思是启动的时候使用图形化的进度条代替 init 的字符输出过程


/boot/grub/grub.cfg






## md5sum && sha1sum

在网络传输、设备之间转存、复制大文件等时，可能会出现传输前后数据不一致的情况。这种情况在网络这种相对更不稳定的环境中，容易出现。那么校验文件的完整性，也是势在必行的

md5值是一个128位的二进制数据，转换成16进制则是32（128/4）位的进制值

SHA1 与 md5 类似，是另一种常用的校验和算法。160位二进制数据，它从给定的输入文件中生成一个长度为40个字符的十六进制串

**md5校验，有很小的概率不同的文件生成的 md5 可能相同。比md5更安全的校验算法还有SHA系列的**

生成md5值重定向到指定的文件，通常文件的扩展名我们会命为.md5
    md5sum data > data.md5

将多个文件的md5重定向到指定的文件(每个文件的md5生成为一行)
    md5sum * > data.md6
    
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

    md5sum -c test.md5  //输入的是.md5文件
    echo $?
    
    **.md5中 后面的文件名 要和 待检测的文件的文件名一致**


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


## nautilus

nautilus - a file manager for GNOME



## apt

1. purge  净化
1. clean    //清除缓存信息
    apt-cache 就是看缓存下来的

1. update - Retrieve new lists of packages
1. upgrade - Perform an upgrade
1. dist-upgrade - Distribution upgrade, see apt-get(8)
1. dselect-upgrade - Follow dselect selections

1. install - Install new packages (pkg is libc6 not libc6.deb)
1. reinstall - Reinstall packages (pkg is libc6 not libc6.deb)

1. remove - Remove packages
1. purge - Remove packages and config files
1. autoremove - Remove automatically all unused packages

1. build-dep - Configure build-dependencies for source packages

1. clean - Erase downloaded archive files
1. autoclean - Erase old downloaded archive files
1. check - Verify that there are no broken dependencies

1. source - Download source archives
1. download - Download the binary package into the current directory
1. changelog - Download and display the changelog for the given package


apt-get install packagename --reinstall 重新安装包
apt-get -f install 修复安装”-f = –fix-missing”

apt-cache depends packagename 了解使用依赖
apt-cache rdepends packagename 是查看该包被哪些包依赖

apt-cache pkgnames 
    列出了源包含有哪些包(以最后一次 apt update 为准)

### check package information
apt-cache show 包名字


before installing get info of this package from sources.list
需要哪些dependences ，大小等等


## apt-file
1. sudo apt install apt-file

1. apt-file update     //从服务器获取元数据,更新数据库

1. apt-file search 文件名 比如/bin/ls  //查询包含了/bin/ls 这个关键字的包有哪些
1. **apt-file list 包名称**
    列出包中的文件



dpkg -l 
    列出了本机安装了哪些包
dpkg -L 软件包(安装后查询)
    列出安装的所有文件清单()
dpkg -c 软件包.deb(安装前查询)
    --contents
    列出deb安装包中的所有文件
dpkg -l 软件包(已安装)
    查看软件包的状态标识,是否正常

    第一个字符为，期望值；包括如下状态：
    u 状态未知；意味软件包未安装，并且用户也未发出安装请求；
    i 用户请求安装软件包；
    r 用户请求卸载软件包；
    p 用户请求清楚软件包；
    h 用户请求保持软件包版本锁定；
     
    第二个字符，当前状态；包括：
    n 软件包未安装；
    i 软件包安装并完成配置；
    c 软件包以前安装过，现在删除了，但是配置文件再留在系统中；
    u 软件包被解包，但未配置；
    f 试图配置软件包，单失败；
    h 软件包安装，单没有成功；
     
    第三个字符，错误状态；包括：
    h 软件包被强制保持，因为有其他软件包依赖需求，无法升级；
    r 软件包被破坏，可以需要重新安装才能正常使用（包括删除）；
    x 软件包被破坏，并且被强制保持；
dpkg -s 软件
    显示软件的详细信息
    未安装的话提示没有安装
dpkg -r 软件
    删除软件，保留配置文件
dpkg -P --purge package
    Purge  an  installed  or  already  removed  package.  This removes everything, including conffiles, and anything else cleaned up from  postrm. 






apt list --upgradable

/etc/apt/source.list
    1. 第一字段，是deb或deb-src，表示直接通过.deb文件或者源文件的方式来进行安装; 
    1. 第二字段，即deb和deb-src字段后是一段URL，这是软件源的地址； 
    1. 第三字段，即URL后的字段，是在URL路径中dists目录下对应的发行版文件夹下的文件夹

    main / universe / restricted / multiverse

ubuntu 版本号命名规则
    Canonical 用动物命名的惯例，即使用首字母相同的两个单词，第一个单词往往是形容词或其他描述性单词，第二个单词则是动物
    从D版本开始又增加了一个规则，首字母要顺延上个版本，如果当前版本是 D ，下个版本就要以 E 来起头

    版本;别名（codename）;发布日期
    4.10;Warty Warthog(长疣的疣猪);2004年10月20日
    5.04;Hoary Hedgehog(灰白的刺猬);2005年4月8日
    5.10;Breezy Badger(活泼的獾);2005年10月13日
    6.06;Dapper Drake(整洁的公鸭);2006年6月1日(LTS)
    6.10;Edgy Eft(急躁的水蜥);2006年10月6日
    7.04;Feisty Fawn(坏脾气的小鹿);2007年4月19日
    7.10;Gutsy Gibbon(勇敢的长臂猿);2007年10月18日
    8.04;Hardy Heron(耐寒的苍鹭);2008年4月24日(LTS)
    8.10;Intrepid Ibex (勇敢的野山羊);2008年10月30日
    9.04;Jaunty Jackalope(得意洋洋的怀俄明野兔);2009年4月23日
    9.10;Karmic Koala(幸运的考拉);2009年10月29日
    10.04;Lucid Lynx(清醒的猞猁);2010年4月29日
    11.10;Oneiric Ocelot(梦幻的豹猫);2010年10月13日
    11.04;Natty Narwhal(敏捷的独角鲸);2011年4月28日
    12.04;Precise Pangolin(精准的穿山甲);2012年的4月26日(LTS)
    12.10;Quantal Quetzal(量子的绿咬鹃);2012年的10月20日
    13.04;Raring Ringtail(铆足了劲的猫熊);2013年4月25日
    13.10;Saucy Salamander(活泼的蝾螈);2013年10月17日
    14.04;Trusty Tahr (可靠的塔尔羊);2014年4月18日 (LTS)
    14.10;Utopic Unicorn(乌托邦独角兽);2014年10月23日
    15.04;Vivid Vervet (活泼的小猴);2015年4月
    15.10;Wily Werewolf (狡猾的狼人);2015年10月
    16.04;Xenial Xerus (好客的非洲地松鼠);2016年4月 （LTS）
    16.10;Yakkety Yak（牦牛）;2016年10月
    17.04;Zesty Zapus(开心的跳鼠);2017年4月
    17.10;Artful Aardvark(机灵的土豚);2017年10月
    18.04;Bionic Beaver（仿生海狸）;2018年4月(LTS)

    每两年的 4 月份，都会推出一个长期支持版本（LTS），其支持期长达五年，而非 LTS 版本的支持期通常只有半年。

    检查当前版本codename
        lsb_release -a
        如果你需要自己编辑更新列表文件， /etc/apt/sources.list ，你就会发现在 url 的后面紧跟着一个 codename 


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
1. 该列为"!"m，":!:"，表示该用户被锁，被锁将无法登陆，但是可能其他的登录方式是不受限制的，如ssh公钥认证的方式，su的方式。
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


## root 直接登录
vi /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf

greeter-show-manual-login=true 

如果需要关闭guest用户，则再在最后一行加入 allow-guest=false 

重启

这个看看 lightdm

### Ubuntu启用root账户后，登录root账户时报错：读取/root/.profile时发现错误：mesg:ttyname failed:对设备不适当的ioctl操作 作为结果，会话不会被正确配置


方法一：
将/root/.profile文件中的mesg n

替换成tty -s && mesg n

重启

方法二：

将非root账户目录中的.profile复制到/root/：

例如：cp /home/username/.profile /root/

重启




## 注意点

正常关机
    服务器数据量巨大，非正常关机会导致数据丢失

合理分配权限

定期备份重要数据和日志





## ls 

    The SIZE argument is an integer and optional unit (example: 10K is 10x1024).  Units are K,M,G,T,P,E,Z,Y (powers of 1024) or KB,MB,... (powers of 1000).

    ll --block-size=1 a.txt
        --block-size=1 应该是设置显示的时候 一个block为1字节大小

    -B, --block-size=SIZE
        scale sizes by SIZE before printing them; e.g., '-BM' prints sizes in units of 1,048,576 bytes; see SIZE format below

    -A, --almost-all
        do not list implied . and ..



## du
-b, --bytes
    equivalent to '--apparent-size --block-size=1'

所以 --block-size=1 就是一个block就是 1 byte, 1024 进制


## stat

➜  Music ll
total 16K
-rw-r--r-- 1 root root 15K Feb 24 17:09 services

➜  Music ll --block-size=1
total 16384
-rw-r--r-- 1 root root 14983 Feb 24 17:09 services

➜  Music du -b services
14983   services

➜  Music stat services
  File: services
  Size: 14983           Blocks: 32         IO Block: 4096   regular file

    Blocks 是32，一个block是512byte的话正好就是16K, 所以 block-size 应该是512
    是硬件的一个block的大小为512bytes? 
    IO Block 是系统的4k? 那为什么不是以系统的4k为标准???

tune2fs -l /dev/nvme0n1p5 | less
    1. Inode blocks per group:   512
        这个属性应该是 stat 中的 Blocks 的同义词,不确定??? 


## cp

-p     same as --preserve=mode,ownership,timestamps

--preserve[=ATTR_LIST]
    preserve the specified attributes (default: mode,ownership,timestamps), if possible additional attributes: context, links, xattr, all

--no-preserve=ATTR_LIST
    don't preserve the specified attributes


## touch 

touch - change file timestamps
    默认修改 access, modify, change 三个

-d, --date=STRING
    parse STRING and use it instead of current time
    默认修改 access 和 modify 时间, 但是 change 会被修改为命令执行时的时间

    touch -d '2000-1-1' a.txt

-m     change only the modification time

    touch -m -d '2000-1-1' a.txt


-c, --no-create
    do not create any files



## ln 
ln -s 真 假

硬链接不能用于目录


## chmod 

chmod -R

chmod u+x,g+w <dir or file>


## chown
root 可以用

-R --recursive

chown user:group <file or dir>


一个用户只有一个缺省组


## find

-atime n
    File  was  last  accessed n*24 hours ago.  When find figures out how many 24-hour periods ago the file was last accessed, 
    any fractional part is ignored, so to match -atime +1, a file has to have been accessed at least two days ago.

-amin n
    File was last accessed n minutes ago.

-iname pattern
    Like -name, but the match is case insensitive. 

-user uname
    File is owned by user uname (numeric user ID allowed).

-size


-size n[cwbkMG]
    File uses n units of space, rounding up.  The following suffixes can be used:

    `b'    for 512-byte blocks (this is the default if no suffix is used)

    `c'    for bytes

    `w'    for two-byte words

    `k'    for kibibytes (KiB, units of 1024 bytes)

    `M'    for mebibytes (MiB, units of 1024 * 1024 = 1048576 bytes)

    `G'    for gibibytes (GiB, units of 1024 * 1024 * 1024 = 1073741824 bytes)

    The size is simply the st_size member of the struct stat populated by the lstat (or stat) system call, rounded up as shown above.  In other words, it's consistent with the result you get for ls -l.  Bear in  mind  that
    the `%k' and `%b' format specifiers of -printf handle sparse files differently.  The `b' suffix always denotes 512-byte blocks and never 1024-byte blocks, which is different to the behaviour of -ls.

    The  +  and  - prefixes signify greater than and less than, as usual; i.e., an exact size of n units does not match.  Bear in mind that the size is rounded up to the next unit.  Therefore -size -1M is not equivalent to
    -size -1048576c.  The former only matches empty files, the latter matches files from 0 to 1,048,575 bytes.



-maxdepth 

-mindepth


-a : and
-o : or
negation `!`


-exec 命令 {} \;
-ok 命令 {} \;

-type c
    File is of type c:
    b      block (buffered) special
    c      character (unbuffered) special
    d      directory
    p      named pipe (FIFO)
    f      regular file
    l      symbolic link; this is never true if the -L option or the -follow option is in effect, unless the symbolic link is broken.  If you want to search for symbolic links when -L is in effect, use -xtype.
    s      socket
    D      door (Solaris)
    To search for more than one type at once, you can supply the combined list of type letters separated by a comma `,' (GNU extension).


-perm -mode
    All of the permission bits mode are set for the file.  Symbolic modes are accepted in this form, and this is usually the way in which you would want to use them.  You must specify `u', `g' or `o' if you use a  symbolic
    mode.  See the EXAMPLES section for some illustrative examples.

-perm /mode
    Any  of  the permission bits mode are set for the file.  Symbolic modes are accepted in this form.  You must specify `u', `g' or `o' if you use a symbolic mode.  See the EXAMPLES section for some illustrative examples.
    If no permission bits in mode are set, this test matches any file (the idea here is to be consistent with the behaviour of -perm -000).



## locate

类似 windows 下的软件 everything

-i : case insensitive

/var/lib/mlocate/mlocate.db

更新数据库
    updatedb


## which 

locate a command

显示 alias


## whereis

locate the binary, source, and manual page files for a command


## grep 

-i: --ignore-case
    
-v:--invert-match
    Invert the sense of matching, to select non-matching lines.




## man 
1   Executable programs or shell commands
2   System calls (functions provided by the kernel)
3   Library calls (functions within program libraries)
4   Special files (usually found in /dev)
5   File formats and conventions, e.g. /etc/passwd
    man 5 services(不需要写路径)
    配置文件
6   Games
7   Miscellaneous (including macro packages and conventions), e.g. man(7), groff(7)
8   System administration commands (usually only for root)
9   Kernel routines [Non standard]


### man 5 services

``` /etc/services
tcpmux      1/tcp               # TCP port service multiplexer
echo        7/tcp
echo        7/udp
discard     9/tcp       sink null
discard     9/udp       sink null
systat      11/tcp      users
daytime     13/tcp
daytime     13/udp
netstat     15/tcp
qotd        17/tcp      quote
chargen     19/tcp      ttytst source
chargen     19/udp      ttytst source

```

man 5 services

    Each line describes one service, and is of the form:

        service-name   port/protocol   [aliases ...]

    where:

    service-name
        is the friendly name the service is known by and looked up under.  It is case sensitive.  Often, the
        client program is named after the service-name.

    port      is the port number (in decimal) to use for this service.

    protocol  is the type of protocol to be used.  This field should match an  entry  in  the  protocols(5)  file.
        Typical values include tcp and udp.

    aliases   is  an  optional  space or tab separated list of other names for this service.  Again, the names are
        case sensitive.

    Either spaces or tabs may be used to separate the fields.

    Comments are started by the hash sign (#) and continue until the end of the line.  Blank lines are skipped.


whatis

apropos

### date

date [OPTION]... [+FORMAT]
date [-u|--utc|--universal] [MMDDhhmm[[CC]YY][.ss]]

MM 月份
DD 日期
hh 小时
mm 分钟
YY 年

%z     时区
    +0800
%:z     时区
    +08:00

date +%F
    2020-02-25  (%Y-%m-%d)
%T     time; same as %H:%M:%S


date +"%z %F %T"


%s  seconds since 1970-01-01 00:00:00 UTC
        date -d "2020-2-25 19:06" +%s
        还原
            date -d "1970-1-1 1582628760seconds UTC"
        因为 %s 是按照UTC计算的，那就是比方说我们是格林威治时区，date -d 时，也要加上UTC时区，而不是我们目前的CST时区

-s, --set=STRING
    set time described by STRING
    
    date -s '20200101 18:00'


-d, --date=STRING
    display time described by STRING, not 'now'

    date -d "1970-1-1 20000days UTC"



## help 

bash , zsh 没有


## /etc/passwd
name
passwd
uid
gid
comment
home
shell

If the password field is a lower-case “x”, then the encrypted password is actually stored in the shadow(5) file instead; there must be a corresponding line in the /etc/shadow file, or else the user account is invalid.

    The encrypted password field may be empty, in which case no password is required to authenticate as the specified login name. However, some applications which read the /etc/passwd file may decide not to permit any access at
    all if the password field is blank.

    A password field which starts with an exclamation(感叹号) mark means that the password is locked. The remaining characters on the line represent the password field before the password was locked.

    Refer to crypt(3) for details on how this string is interpreted.

    If the password field contains some string that is not a valid result of crypt(3), for instance ! or *, the user will not be able to use a unix password to log in (but the user may log in the system by other means).

centos 中将uid改为零，这个用户就是管理员了

## useradd

-d, --home-dir HOME_DIR
    The new user will be created using HOME_DIR as the value for the user's login directory. The default is to
    append the LOGIN name to BASE_DIR and use that as the login directory name. The directory HOME_DIR does
    not have to exist but will not be created if it is missing.

-m, --create-home
    Create the user's home directory if it does not exist. The files and directories contained in the skeleton
    directory (which can be defined with the -k option) will be copied to the home directory.

    By default, if this option is not specified and CREATE_HOME is not enabled, no home directories are
    created.

    -M, --no-create-home
    Do no create the user's home directory, even if the system wide setting from /etc/login.defs (CREATE_HOME)
    is set to yes.

-g, --gid GROUP
    The group name or number of the user's initial login group. The group name must exist. A group number must refer to an already existing group.

    If not specified, the behavior of useradd will depend on the USERGROUPS_ENAB variable in /etc/login.defs. If this variable is set to yes (or -U/--user-group is specified on the command line), a group will be created for
    the user, with the same name as her loginname. If the variable is set to no (or -N/--no-user-group is specified on the command line), useradd will set the primary group of the new user to the value specified by the GROUP
    variable in /etc/default/useradd, or 100 by default.



-G, --groups GROUP1[,GROUP2,...[,GROUPN]]] 附加组
    A list of supplementary groups which the user is also a member of. Each group is separated from the next by a comma, with no intervening whitespace. The groups are subject to the same restrictions as the group given with
    the -g option. The default is for the user to belong only to the initial group.

    useradd -G group1 


-c, --comment COMMENT
    Any text string. It is generally a short description of the login, and is currently used as the field for the user's full name.



-u, --uid UID
    The numerical value of the user's ID. This value must be unique, unless the -o option is used. The value must be non-negative. The default is to use the smallest ID value greater than or equal to UID_MIN and greater than
    every other user.

    See also the -r option and the UID_MAX description.
    /etc/login.defs 中记录了 UID_MIN 1000, UID_MAX 60000 (Useradd)
        SYS_UID_MIN 100
        SYS_UID_MAX 999


-r, --system
    Create a system account.

    System users will be created with no aging information in /etc/shadow, and their numeric identifiers are chosen in the SYS_UID_MIN-SYS_UID_MAX range, defined in /etc/login.defs, instead of UID_MIN-UID_MAX (and their GID
    counterparts for the creation of groups).

    Note that useradd will not create a home directory for such a user, regardless of the default setting in /etc/login.defs (CREATE_HOME). You have to specify the -m options if you want a home directory for a system account
    to be created.


-s, --shell SHELL
    The name of the user's login shell. The default is to leave this field blank, which causes the system to select the default login shell specified by the SHELL variable in /etc/default/useradd, or an empty string by
    default.




/etc/default/useradd
/etc/login.defs
/etc/skel/Templates     模板，默认要在家目录中添加的文件
    skel 应该是 skeleton 骨骼，纲要的缩写

/etc/pam.d/

## usermod

将一个用户添加到用户组中，千万不能直接用：

usermod -G groupA

这样做会使你离开其他用户组，仅仅做为 这个用户组 groupA 的成员。
应该用 加上 -a 选项：

usermod -a -G groupA user




## /etc/shadow
1. 用户名
2. 密码
    This field may be empty, in which case no passwords are required to authenticate as the specified login name. However, some applications which read the /etc/shadow file may decide not to permit any access at all if the
    password field is empty.

    A password field which starts with an exclamation mark means that the password is locked. The remaining characters on the line represent the password field before the password was locked.

    Refer to crypt(3) for details on how this string is interpreted.

    If the password field contains some string that is not a valid result of crypt(3), for instance ! or *, the user will not be able to use a unix password to log in (but the user may log in the system by other means).
        系统用户都是这个*


3. date of last password change(1970.1.1)
    0:下次登录需要修改密码
    空:An empty field means that password aging features are disabled.

    如何计算呢?
        date -d "2020-02-25 UTC" +%s
        date -d "1970-1-1 20000days UTC" 得到2024 12:00
        

4. minimum password age
    the number of days the user will have to wait before she will be allowed to change her password again.
    An empty field and value 0 mean that there are no minimum password age.


5. maximum password age
    The maximum password age is the number of days after which the user will have to change her password.

    After this number of days is elapsed, the password may still be valid. The user should be asked to change her password the next time she will log in.

    An empty field means that there are no maximum password age, no password warning period, and no password inactivity period (see below).

    If the maximum password age is lower than the minimum password age, the user cannot change her password.

6. password warning period
    The number of days before a password is going to expire (see the maximum password age above) during which the user should be warned.
    maxmium 到期日向前数

    An empty field and value 0 mean that there are no password warning period.

7. password inactivity(静止，不活动) period
    The number of days after a password has expired (see the maximum password age above) during which the password should still be accepted (and the user should update her password during the next login).
    maximux 到期后向后数

    **After expiration of the password and this expiration period is elapsed, no login is possible using the current user's password. The user should contact her administrator.**

    An empty field and -1(see /etc/default/useradd) means that there are no enforcement of an inactivity period.

8. account expiration date
    The date of expiration(期满) of the account, expressed as the number of days since Jan 1, 1970.

    Note that an account expiration differs from a password expiration. 
    In case of an account expiration, the user shall not be allowed to login. (如果超过了失效时间，就算密码没有过期，用户也就失效，无法使用了)
    In case of a password expiration, the user is not allowed to login using her password.
    An empty field means that the account will never expire.

    The value 0 should not be used as it is interpreted as either an account with no expiration, or as an expiration on Jan 1, 1970.

9. reserved field
    This field is reserved for future use.


## /etc/group

group_name  the name of the group.

password    the (encrypted) group password 都是x, 存在/etc/gshadow中.  If this field is empty, no password is needed.

GID         the numeric group ID.

user_list   a list of the usernames that are members of this group, separated by commas.



## /etc/gshadow

group name
           It must be a valid group name, which exist on the system.

encrypted password
    Refer to crypt(3) for details on how this string is interpreted.

    If the password field contains some string that is not a valid result of crypt(3), for instance ! or \*, users will not be able to use a unix password to access the group (but group members do not need the password).

    The password is used when a user who is not a member of the group wants to gain the permissions of this group (see newgrp(1)).

    This field may be empty, in which case only the group members can gain the group permissions.

    A password field which starts with an exclamation mark means that the password is locked. The remaining characters on the line represent the password field before the password was locked.

    This password supersedes any password specified in /etc/group.

administrators
    It must be a comma-separated list of user names.

    Administrators can change the password or the members of the group.

    Administrators also have the same permissions as the members (see below).

members
    It must be a comma-separated list of user names.

    Members can access the group without being prompted for a password.

    You should use the same list of users as in /etc/group.


## 家目录
/home/家    700



## uptime

uptime - Tell how long the system has been running.

## w

包含了 uptime 信息

the system load averages for the past 1, 5, and 15 minutes.

The JCPU time is the time used by all processes attached to the tty.  It does not include past background jobs, but does include currently running background jobs.

The PCPU time is the time used by the current process, named in the "what" field.




## gzip
只能压缩文件

gzip [ -acdfhklLnNrtvV19  ] [-S suffix] [ name ...   ]
gunzip [ -acfhklLnNrtvV  ] [-S suffix] [ name ...   ]
zcat [ -fhLV  ] [ name ...   ]
    -l : 列出压缩比等信息


## zip

zip archive.zip inpath inpath ...

-r 
    --recurse-paths
        Travel the directory structure recursively;


-i files
   --include files
        Include only the specified files, as in:

               zip -r foo . -i \*.c

        which will include only the files that end in .c in the current directory and its subdirectories.




## bzip2

-k --keep
    Keep (don't delete) input files during compression or decompression.

tar -jcf a.tar.bz2 inpath




## write

write — send a message to another user


## wall

wall - write a message to all users



## mail 

/var/spool/mail/mail


## last

last, lastb - show a listing of last logged in users


lastb
    lastb is the same as last, except that by default it shows a log of the /var/log/btmp file, which contains all the bad login attempts.


/var/log/wtmp 文件

utmp, wtmp - login records

The utmp file allows one to discover information about who is currently using the system.  There may be more users currently using the system, because not all programs use utmp logging.

       Warning:  utmp  must not be writable by the user class "other", because many system programs (foolishly) depend on its integrity.  You risk faked system logfiles and modifications of system files if you leave utmp writable to
       any user other than the owner and group owner of the file.



last reboot

## lastlog

lastlog - reports the most recent login of all users or of a given user

-u, --user LOGIN|RANGE
    This RANGE of users can be specified with a min and max values (UID_MIN-UID_MAX), a max value (-UID_MAX), or a min value (UID_MIN-).

    lastlog -u 0-10



## netstat

-l, --listening
    Show only listening sockets.  (These are omitted by default.)

--numeric, -n
   Show numerical addresses instead of trying to determine symbolic host, port or user names.

-p, --program
   Show the PID and name of the program to which each socket belongs.

--route, -r
   Display the kernel routing tables. See the description in route(8) for details.  netstat -r and route -e produce the same output.
    就是 route
    
## mount 

mount 显示已经挂载的设备

mount -t type device dir
    fat16 识别为 fat
    fat32 识别为 vfat
    光盘    iso9660

-l, --show-labels
    Add the labels in the mount output.  mount must have permission to read the disk device (e.g. be set-user-ID root) for this to work.  One can set such a label for ext2, ext3 or ext4 using the e2label(8) utility, or for
    XFS using xfs_admin(8), or for reiserfs using reiserfstune(8).


-a, --all
    Mount all filesystems (of the given types) mentioned in fstab (except for those whose line contains the noauto keyword).  
    The filesystems are mounted following their order in fstab.  
    The mount command compares filesystem source, target (and fs root for bind mount or btrfs) to detect already mounted filesystems. 
    The kernel table with already mounted filesystems is cached during mount --all. It means that all duplicated fstab entries will be mounted.

    依据 /etc/fstab 自动挂在


-o, --options
    Use the specified mount options.  The opts argument is a comma-separated list.  For example:

        mount LABEL=mydisk -o noatime,nodev,nosuid

    rw/ro
    exec/noexec
        不能执行，如hell.sh文件, 即使有x，即使root
        mount -o remount,noexec /home


支持ntfs
    安装ntfs-3g 或者重新编译内核
    ntfs-3g - Third Generation Read/Write NTFS Driver


ntfsfix
    fix common errors and force Windows to check NTFS



## shutdown 

shutdown [OPTIONS...] [TIME] [WALL...]

-H, --halt
    Halt the machine.
    什么意思???

-P, --poweroff
   Power-off the machine (the default).

-r, --reboot
    Reboot the machine.

-h
    Equivalent to --poweroff, unless --halt is specified.
    有人说  halt 命令 == shutdown -h
    那 shutdown -h == --poweroff

-k
    Do not halt, power-off, reboot, just write wall message.

--no-wall
   Do not send wall message before halt, power-off, reboot.

-c
    Cancel a pending shutdown. This may be used to cancel the effect of an invocation of shutdown with a time argument that is not "+0" or "now".



who
shutdown -k now "system wll shutdown in 5 mins"
ps -aux
sync
sync



## runlevel

┌─────────┬───────────────────┐
│Runlevel │ Target            │
├─────────┼───────────────────┤
│0        │ poweroff.target   │
├─────────┼───────────────────┤
│1        │ rescue.target     │
├─────────┼───────────────────┤
│2, 3, 4  │ multi-user.target │
├─────────┼───────────────────┤
│5        │ graphical.target  │
├─────────┼───────────────────┤
│6        │ reboot.target     │
└─────────┴───────────────────┘

centos 中是 /etc/inittab 
debian 中是什么?


runlevel 
上一次的运行级别 本次的运行级别


## logout

login, logout - write utmp and wtmp entries


## getfacl

get file access control lists

-R, --recursive
    List the ACLs of all files and directories recursively.

-L, --logical
    Logical walk, follow symbolic links to directories. The default behavior is to follow symbolic link arguments, and skip symbolic links encountered in subdirectories.  Only effective in combination with -R.

-P, --physical
    Physical walk, do not follow symbolic links to directories. This also skips symbolic link arguments.  Only effective in combination with -R.

-n, --numeric
    List numeric user and group IDs

--  End of command line options. All remaining parameters are interpreted as file names, even if they start with a dash character.

-   If the file name parameter is a single dash character, getfacl reads a list of files from standard input.

-c, --omit-header
    Do not display the comment header (the first three lines of each file's output).

    getfacl -n services
    ```
    # file: services
    # owner: 0  (用了-n的原因)
    # group: 0

    ```



## setfacl

-b, --remove-all
    Remove all extended ACL entries. The base ACL entries of the owner, group and others are retained.
    
    setfacl -b file

-L, --logical
    Logical  walk,  follow  symbolic links to directories. The default behavior is to follow symbolic link arguments, and skip symbolic links encountered in subdirectories.  Only effective in combination with -R.  This option
   cannot be mixed with `--restore'.

-P, --physical
    Physical walk, do not follow symbolic links to directories.  This also skips symbolic link arguments.  Only effective in combination with -R.  This option cannot be mixed with `--restore'.

--  End of command line options. All remaining parameters are interpreted as file names, even if they start with a dash.

-   If the file name parameter is a single dash, setfacl reads a list of files from standard input.

The --set and --set-file options set the ACL of a file or a directory. The previous ACL is replaced.  ACL entries for this operation must include permissions.
    会进行覆盖

The -m and -x options expect an ACL on the command line. Multiple ACL entries are separated by comma characters (`,'). 

The -M and -X options read an ACL from a file or from standard input. The ACL entry format is described in Section ACL ENTRIES.

The --set and --set-file options set the ACL of a file or a directory. The previous ACL is replaced.  ACL entries for this operation must include permissions.


The -m (--modify) and -M (--modify-file) options modify the ACL of a file or directory.  ACL entries for this operation must include permissions.
    -M : 从一个文件读入ACL设置信息并以此为模版修改当前文件或目录的ACL规则


The -x (--remove) and -X (--remove-file) options remove ACL entries. It is not an error to remove an entry which does not exist.  Only ACL entries without the perms field are accepted as parameters, unless POSIXLY_CORRECT  is
defined.
    -X : 从一个文件读入ACL设置信息并以此为模版删除当前文件或目录的ACL规则
    

When  reading  from files using the -M and -X options, setfacl accepts the output getfacl produces.  There is at most one ACL entry per line. After a Pound sign (`#'), everything up to the end of the line is treated as a com‐
ment.

If setfacl is used on a file system which does not support ACLs, setfacl operates on the file mode permission bits. If the ACL does not fit completely in the permission bits, setfacl modifies the file mode permission bits  to
reflect the ACL as closely as possible, writes an error message to standard error, and returns with an exit status greater than 0.


-R, --recursive
    Apply operations to all files and directories recursively. This option cannot be mixed with `--restore'.

    setfacl -m u:bill:rwx -R dir

-d, **--default**
    All operations apply to the Default ACL. Regular ACL entries in the input set are promoted to Default ACL entries. Default ACL entries in the input set are discarded. (A warning is issued if that happens).

    setfacl -d -m u:用户:rwx dir

    设置了某个用户对目录的默认权限后的删除:
        setfacl -d -x u:用户 dir


PERMISSIONS
    The  file  owner  and processes capable of **CAP_FOWNER** are granted the right to modify ACLs of a file. This is analogous to the permissions required for accessing the file mode. (On current Linux systems, root is the only user
    with the CAP_FOWNER capability.)



ACL是由一系列的Access Entry所组成的，每一条Access Entry定义了特定的类别可以对文件拥有的操作权限。
Access Entry有三个组成部分：
- Entry tag type
- qualifier (optional)
- permission。

Entry tag type它有以下几个类型：
类型    说明
ACL_USER_OBJ：      相当于Linux里file_owner的permission
ACL_USER：          定义了额外的用户可以对此文件拥有的permission
ACL_GROUP_OBJ：     相当于Linux里group的permission
ACL_GROUP：         定义了额外的组可以对此文件拥有的permission
ACL_MASK：          定义了ACL_USER,ACL_GROUP_OBJ和ACL_GROUP的最大权限
ACL_OTHER：         相当于Linux里other的permission





EXAMPLES
    Granting an additional user read access
        setfacl -m u:lisa:r file

    Revoking write access from all groups and all named users (using the effective rights mask)
        设置mask权限
        setfacl -m m::rx file

    删除所有用户默认权限
        setfacl -d -x m:: dir

    Removing a named group entry from a file's ACL
        setfacl -x g:staff file

    Copying the ACL of one file to another
        getfacl file1 | setfacl --set-file=- file2

    Copying the access ACL into the Default ACL
        getfacl --access dir | setfacl -d -M- dir

        ```
        [root@localhost ~]# getfacl ./test.txt
        #file: test.txt
        #owner: root
        #group: admin
        user::rw-
        user:john:rw-
        group::rw-
        group:dev:r--
        mask::rw-
        other::r--

        user::rw-       定义了ACL_USER_OBJ, 说明file owner拥有read and write permission
        user:john:rw-   定义了ACL_USER,这样用户john就拥有了对文件的读写权限,实现了我们一开始要达到的目的
        group::rw-      定义了ACL_GROUP_OBJ,说明文件的group拥有read and write permission 
        group:dev:r--   定义了ACL_GROUP,使得dev组拥有了对文件的read permission
        mask::rw-       定义了ACL_MASK的权限为read and write
        other::r--      定义了ACL_OTHER的权限为read 

        ```


ACL_MASK的定义。它规定了ACL_USER，**ACL_GROUP_OBJ** 和ACL_GROUP的最大权限。
    除了所有者不受影响

其他的用户要与之**相与**才能得到真正的权限值
    会在相应的条目后边注释 effective:有效的权限




## chpasswd

chpasswd - update passwords in batch mode

debian 系列没有 passwd --stdin [username]  的 --stdin 的用法

echo 用户名:密码 | chpasswd


## SetUID
只对二进制程序设置
用户应该对该程序有x权限
执行时，用户灵魂附体, 获得拥有者的身份, 直到执行结束

ll /usr/bin/passwd
    -rwsr-xr-x 1 root root 63K Feb  7 22:54 /usr/bin/passwd

    /etc/shadow 权限000, 灵魂附体才有可能写该文件


chmod u+s file
chmod u-s file
chmod 4755 file

当 u 没有 x 权限时，会显示 大写的S

suid 文件的查找
   find / -perm /4000 
   find / -perm -4000 

    不论是s 还是S 符合


## SetGID

二进制文件 和 目录

chmod g+s fileOrDir
chmod g-s fileOrDir
chmod 2755 fileOrDir

对文件的解释
    二进制文件
    执行者要有x权限
    执行的时候，用户的组身份升级为该文件或组的组身份


    -rwxr-sr-x 1 root mlocate 39K Aug  7  2019 /usr/bin/mlocate
    -rw-r----- 1 root mlocate 19M Feb 25 15:53 /var/lib/mlocate/mlocate.db


对目录的解释

    o 用户对目录有r 和 x 权限才能进入

    o 用户如果有w权限，进入目录后创建的文件或目录的所属组 就会变成这个设定了SetGID目录的所属组


    ➜  /test ll -d liu
    drwxrwsrwx 4 root root 4.0K Feb 26 06:52 liu

    ➜  /test ll liu
    total 8.0K
    -rw-r--r-- 1 bill root    0 Feb 26 06:47 bill       文件的所属组变成root
    drwxr-sr-x 2 bill root 4.0K Feb 26 06:52 billdir    目录的所属组变成root, 并且继承了SetGID
    -rw-r--r-- 1 root root    0 Feb 26 06:47 root
    drwxr-sr-x 2 root root 4.0K Feb 26 06:47 rootdir    目录继承了SetGID

find / -perm /4000


## Sticky Bit

仅对目录有效

普通用户要有w权限

目的: 普通用户只能删除自己的文件

标志：t

    drwxrwxrwt 18 root root 12K Feb 26 06:41 /tmp

find / -perm /1000

chmod o+t dir
chmod 1777 dir


## chattr

change file attributes on a Linux file system

chattr +/-/= 选项 文件
    +: 增加权限
    -: 删除权限
    =: 赋值权限

对root同样生效

A file with the 'i' attribute cannot be modified: it cannot be deleted or renamed, no link can be created to this file, most of the file's metadata can not be modified, and the file can not be opened in write mode.
    

    chattr +i 文件
    
    相当于锁住，任何人不能删除，修改文件名或内容

    对于目录:
        不能重命名，删除该目录
        只能修改目录下文件的数据，不能创建和删除

???The 'e' attribute indicates that the file is **using extents for mapping the blocks on disk**.  It may not be removed using chattr(1).

A file with the 'a' attribute set can only be opened in append mode for writing.
    对于文件
        已经存在的文件，只能用 >> 这种
            不能使用vim等编辑工具
    对于目录
        这个目录不能重命名
        只允许在目录中建立和修改文件，但是不允许删除
        不能对文件重命名
        比 i 多了一个创建的权限，但是 vim 生成的临时文件和备份文件 ~ 也不能删除
        可以使用vim


## lsattr
-a:

-d:仅仅对目录



## sudo

灵魂附体, 同SetUID

编辑配置文件的命令: visudo
    -r--r----- 1 root root 669 Jan 13  2019 /etc/sudoers
    /usr/sbin/visudo

    

sudo, sudoedit — execute a command as another user


who where=(pseudo) what
    **这里的where是需要被管理的主机, 不是从哪个主机或ip登录的意思**
    可以将where写一个非本机IP, 然后切换用户执行一个sudo -l, 这时会发现没有sudo 命令可以执行
    **用于LDAP等集中管理用户的服务**
    
    pseudo 不写默认root

    PASSWD 是默认项

ALL ALL=(ALL) ALL

组
    %who where=(pseudo) what



案例1

    dgb     boulder = (operator) /bin/ls, (root) /bin/kill, /usr/bin/lprm

    Then user dgb is now allowed to run /bin/ls as operator, but /bin/kill and /usr/bin/lprm as root.

    We can extend this to allow dgb to run /bin/ls with either the user or group set to operator:

    dgb     boulder = (operator : operator) /bin/ls, (root) /bin/kill,\
        /usr/bin/lprm

    bill    ALL= /usr/sbin/shutdown -r now


案例2
    tcm     boulder = (:dialer) /usr/bin/tip, /usr/bin/cu,\
            /usr/local/bin/minicom

    Note that in this example only the group will be set, the command still runs as user tcm.  E.g.

    $ sudo -g dialer /usr/bin/cu

    Multiple users and groups may be present in a Runas_Spec, in which case the user may select any combination of users and groups via the -u and -g options.  In this example:

    alan    ALL = (root, bin : operator, system) ALL
    alan    ALL = (root, bin : operator, system) PASSWD:ALL
    alan    ALL = (root, bin : operator, system) NOPASSWD:ALL

    user alan may run any command as either user root or bin, optionally setting the group to operator or system.



-u user, --user=user
    Run the command as a user other than the default target user (usually root).  The user may be either a user name or a numeric user-ID (UID) prefixed with the ‘#’ character (e.g., #0 for UID 0).  When running com‐
    mands as a UID, many shells require that the ‘#’ be escaped with a backslash (‘\’).  Some security policies may restrict UIDs to those listed in the password database.  The sudoers policy allows UIDs that are not in
    the password database as long as the targetpw option is not set.  Other security policies may not support this.


-g group, --group=group
    Run the command with the primary group set to group instead of the primary group specified by the target user's password database entry.  The group may be either a group name or a numeric group-ID (GID) prefixed
    with the ‘#’ character (e.g., #0 for GID 0).  When running a command as a GID, many shells require that the ‘#’ be escaped with a backslash (‘\’).  If no -u option is specified, the command will be run as the invok‐
    ing user.  In either case, the primary group will be set to group.  The sudoers policy permits any of the target user's groups to be specified via the -g option as long as the -P option is not in use.





PASSWD(默认) and NOPASSWD

    By default, sudo requires that a user authenticate him or herself before running a command.  This behavior can be modified via the NOPASSWD tag.  Like a Runas_Spec, the NOPASSWD tag sets a default for the commands that follow
    it in the Cmnd_Spec_List.  Conversely, the PASSWD tag can be used to reverse things.  For example:

    ray     rushmore = NOPASSWD: /bin/kill, /bin/ls, /usr/bin/lprm

    would allow the user ray to run /bin/kill, /bin/ls, and /usr/bin/lprm as root on the machine rushmore without authenticating himself.  If we only want ray to be able to run /bin/kill without a password the entry would be:

    ray     rushmore = NOPASSWD: /bin/kill, PASSWD: /bin/ls, /usr/bin/lprm


案例
    bill ALL=(root) PASSWD:/usr/sbin/visudo, (root) NOPASSWD:/usr/sbin/useradd




Runas alias specification
    Runas_Alias     OP = root, operator
    Runas_Alias     DB = oracle, sybase
    Runas_Alias     ADMINGRP = adm, oper

Host alias specification
    Host_Alias      SPARC = bigtime, eclipse, moet, anchor :\
                    SGI = grolsch, dandelion, black :\
                    ALPHA = widget, thalamus, foobar :\
                    HPPA = boa, nag, python
    Host_Alias      CUNETS = 128.138.0.0/255.255.0.0
    Host_Alias      CSNETS = 128.138.243.0, 128.138.204.0/24, 128.138.242.0
    Host_Alias      SERVERS = master, mail, www, ns
    Host_Alias      CDROM = orion, perseus, hercules

Cmnd alias specification
    Cmnd_Alias      DUMPS = /usr/bin/mt, /usr/sbin/dump, /usr/sbin/rdump,\
                            /usr/sbin/restore, /usr/sbin/rrestore,\
                            sha224:0GomF8mNN3wlDt1HD9XldjJ3SNgpFdbjO1+NsQ== \
                            /home/operator/bin/start_backups
    Cmnd_Alias      KILL = /usr/bin/kill
    Cmnd_Alias      PRINTING = /usr/sbin/lpc, /usr/bin/lprm
    Cmnd_Alias      SHUTDOWN = /usr/sbin/shutdown
    Cmnd_Alias      HALT = /usr/sbin/halt
    Cmnd_Alias      REBOOT = /usr/sbin/reboot



The sudoers file is composed of two types of entries: aliases (basically variables) and user specifications (which specify who may run what).

     When multiple entries match for a user, they are applied in order.  Where there are multiple matches, the last match is used (which is not necessarily the most specific match).



### 查看可用的 sudo 命令

sudo -l


----------------------------------------------------


## 分区

IDE 最多59个逻辑分区

类型    单分区最大  单文件最大
ext2        16TB         2TB
ext3        16TB         2TB        有日志功能
ext4        1EB          16TB        有日志功能


### df

report file system disk space usage

-a, --all
    include pseudo, duplicate, inaccessible file systems

-T, --print-type
    print file system type

-k  like --block-size=1k


### du 

du - estimate file space usage


du -hs /    和 df -h 进行比较，发现 du的比df的小,因为 
    du 只统计文件
    df 还要统计command，系统占用等

### fsck

fsck - check and repair a Linux filesystem


### dumpe2fs

dumpe2fs - dump ext2/ext3/ext4 filesystem information

-h      only display the superblock information and not any of the block group descriptor detail information.
        查看uuid



### fdisk

fdisk - manipulate(操纵) disk partition table

    fdisk -l 
        Sector size (logical/physical): 512 bytes / 512 bytes
        I/O size (minimum/optimal): 512 bytes / 512 bytes
        可以看到硬盘的 sector 和 IO size, 同 stat


fdisk /dev/sdb

    d:  删除一个分区
    n:  新建一个分区
    l:  显示文件系统类型
        82: swap
        83: linux
        5:  Extended
    w:  保存退出
    q:  不保存退出
    p:  显示分区表

    ctrl + backspace 将错误的输入进行删除

    last cylinder, +cylinders or +size{K,M,G}:  可以用字节做单位: +2G


## partprobe 

分区完成后，有时会提示重启

inform the OS of partition table changes


## 格式化 mkfs

mkfs - build a Linux filesystem

mkfs -t ext4 /dev/sdb1


查看是否被挂载：mount 或 df 


## 自动挂载 /etc/fstab

static information about the filesystems

1. uuid
    uuid的查看
       dumpe2fs -h /dev/sda1 

2. mount point
3. fs type
4. mount options associated with the filesystem
    defaults
         use default options: rw, suid, dev, exec, auto, nouser, and async.

5. used by dump, default 0(don't dump)
6. used by fsck, default 0(don't fsck)

配置完成后，执行 mount -a 看看是否会报错, 好像如果有错误重启的话，启动不起来???

万一错误了，重启，提示输入root密码
    会发现 /etc/fstab 无法写入
    mount -o remount,rw /


## free

cache 缓存
    把读出来的数据保存在内存当中，当再次读取时，不去读硬盘，加速了数据的读取过程

buffer 缓冲
    在写入数据时，先把分散的写入操作保存到内存中，当到达一定程度时再集中写入硬盘，加速了数据的写入过程


增加swap
    首先要有一块 swap 分区
    swap 可以是逻辑分区
    
    正常完成后，ID 是83 Linux 分区，要改成82 Swap
        t : change a partition's system id


    格式化
        mkswap /dev/sdb6
            mkswap - set up a Linux swap area

    加入swap分区
        swapon
            swapon, swapoff - enable/disable devices and files for paging and swapping
        swapon /dev/sdb6    将 /dev/sdb6 使能为swap

    查看 free

    自动挂在
        UUID=b52ad353-391f-43b7-9319-a72ad0ec3880 none            swap    sw              0       0



## 关于热点连接

连接上手机热点后，huostname 变成 bogon