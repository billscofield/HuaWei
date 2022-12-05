
RHCA : 红帽认证架构师

RHCE : 红帽认证工程师

RHCSA: 红帽认证系统管理员


## Alpine

Alpine Linux is a security-oriented, lightweight Linux distribution based on
musl libc and busybox.


## BusyBox

BusyBox 是一个集成了三百多个最常用Linux命令和工具的软件。BusyBox 包含了一些简单
的工具，例如ls、cat和echo等等，还包含了一些更大、更复杂的工具，例grep、find、
mount以及telnet。有些人将 BusyBox 称为 Linux 工具里的瑞士军刀。简单的说BusyBox
就好像是个大工具箱，它集成压缩了 Linux 的许多工具和命令，也包含了 Android 系统
的自带的shell。

## Libc

libc的名字来源于历史，指 C 开发包的函数库 ，包括头文件和基本C库libc.a，最初的
libc由发明C语言那些人写的，后来随着C移植到不同平台，libc也有了多个版本，可能是
为了兼容吧，很多头文件和libc.a的文件名都没有变（很好的传统）。

现在libc泛指C函数库， 而用的最广，功能最强的当然是GNU LibC，简称glibc，各发行版
Linux用的就是glibc。

libc的动态库版本叫做是libc.so，通常是/usr/lib/libc.so，glibc的libc.so其实不是
.so文件，而是一个ld Script，这没有关系，gnu ld 会正确处理的。

    ld - The GNU linker


还有其他版本的libc，比如newlibc，通常用在嵌入系统中。


### musl libc

Welcome to the home of musl, a new standard library to power a new generation
of Linux-based devices. musl is lightweight, fast, simple, free, and strives to
be correct in the sense of standards-conformance and safety.


1. Glibc = GNU C Library 是GNU项（GNU Project）目，所实现的 C语言标准库（C
   standard library）。 目前，常见的桌面和服务器中的GNU/Linux类的系统中，都是用
   的这套C语言标准库。 其实现了常见的C库的函数，支持很多种系统平台，功能很全，
   但是也相对比较臃肿和庞大。

2. uClibc 一个小型的C语言标准库，主要用于嵌入式。 其最开始设计用于uClinux（注：
   uClinux不支持MMU），因此比较适用于微处理器中。 对应的，此处的u意思是μ，Micro，
   微小的意思。 

    1. uClibc的特点： 

        1. uClibc 比 glibc 要小很多。 

        2. uClibc 是独立的，为了应用于嵌入式系统中，完全重新实现出来的。和
           glibc 在源码结构和二进制上，都不兼容。

3. EGLIBC = Embedded GLIBC EGLIBC是，（后来）glibc的原创作组织FSF所（新）推出的，
   glibc的一种变体，目的在于将glibc用于嵌入式系统。 

    EGLIBC的目标是： 

    1. 保持源码和二进制级别的兼容于Glibc 源代码架构和ABI层面兼容 如果真正实现了
       这个目标，那意味着，你之前用glibc编译的程序，可以直接用eglibc替换，而不
       需要重新编译。 这样就可以复用之前的很多的程序了。 

    1. 降低(内存)资源占用/消耗 

    1. 使更多的模块为可配置的（以实现按需裁剪不需要的模块） 

    1. 提高对于交叉编译(cross-compilation)和交叉测试(cross-testing)的支持
       Eglibc的最主要特点就是可配置，这样对于嵌入式系统中，你所不需要的模块，比
       如NIS，locale等，就可以裁剪掉，不把其编译到库中，使得降低生成的库的大小
       了。 更多特点，可以去看：Eglibc的特点 【glibc, uClibc, Elibc的渊源/历史/
       区别/联系】 

    
    1. 写程序，需要用到很多c语言的库函数。所有的库函数加起来，就是对应的C语言
       （标准）函数库。 

    2. 目前在普通GNU/Linux系统中所用的C语言标准库，叫做glibc。其功能很全，函数
       很多，但是代码太多，编译出来的函数库的大小也很大，即资源占用也很多。 

    3. 而嵌入式系统中，也需要C语言写代码实现特定功能，也需要用到C语言函数库，但
       是由于嵌入式系统中，一般资源比较有限，所以不适合直接使用（太占用资源的）
       gLibc。 

    4. 所以有人就又（没有参考glibc，而是从头开始，）重新实现了一个用于嵌入式系
       统中的，代码量不是很大的，资源占用相对较少的，C语言函数库，叫做uClibc。
       并且，uClibc不支持MMU（内存管理单元）。 

    5. 而后来，glibc的开发者，又推出个Embedded glibc，简称eglibc，其主要目的也
       是将glibc用于嵌入式领域。 相应最大的改动就在于，把更多的库函数，改为可配
       置的，这样，如果你的嵌入式系统中不需要某些函数，就可以裁剪掉，不把该函数
       编译到你的eglibc库中，使得最终生成的eglibc库的大小变小，最终符合你的嵌入
       式系统的要求（不能超过一定的大小），这样，就实现了，把glibc引用于嵌入式
       系统中的目的了。 
    
    1. 可以简单的理解为： glibc，uClibc，eglibc都是C语言函数库： 

        1. uClibc是嵌入式系统中用的，glibc是桌面系统用的 

        2. eglibc也是嵌入式系统中用的，是glibc的嵌入式版本，和glibc在源码和二进
           制上兼容。

4. Musl-libc C语言标准库Musl-libc项目发布了1.0版。Musl是一个轻量级的C标准库，设
   计作为GNU C library (glibc)、 uClibc或Android Bionic的替代用于嵌入式操作系统
   和移动设备。它遵循POSIX 2008规格和 C99 标准，采用MIT许可证授权，使用Musl的
   Linux发行版和项目包括sabotage，bootstrap-linux，LightCube OS等等。

目前openwrt LEDE默认使用Musl-libc了。。。CC分支还是uclibc



## 图形桌面

1. X Window

    Xorg

1. KDE

1. GNOMOE

1. Unity

1. 其他

    Xfce

    setterm


## /etc/issue & /etc/issue.net & /etc/motd

/etc/issue 和 /etc/issue.net ：这2个文件是你在登录之前显示的，区别一个负责本地
登录前显示，一个负责网络登录前显示。

也即 /etc/issue 是显示在TTY控制台登录前（非图形界面），而 /etc/issue.net 是显示
在 Telnet (SSH默认不开启，请看文章最后面说明)远程登录前，另外 /etc/issue.net 不
支持转义字符


/etc/motd ：这个文件是在你登录之后显示的，不管你是 TTY 还是 PTS 登录，也不管是
Telnet 或 SSH 都显示这个文件里面的信息。

在较新的Linux发行版中，这个功能被扩展了，有了动态motd和静态motd的区别，在Ubuntu
16.04.01 LTS中，仅仅启用了动态motd，而未启用静态motd


### 动态文件: /run/motd.dynamic

它是由 /etc/update-motd.d/ 下的几个脚本文件来动态生成的。所以你可以通过
/etc/update-motd.d/ 下的脚本来控制信息的生成。那么如何禁用该动态motd功能呢？方
法是将/etc/update-motd.d/ 下的脚本移除或者去掉可执行权限。

在关闭动态motd之后，发现登录之后还有会一行：Last login: Thu May 25 15:39:48 CST
2017 from 192.168.2.122 on pts/1

这是由/etc/pam.d/login配置文件中pam_lastlog.so这一行控制的，相应地注释即可。

### 静态文件

如果需要静态motd消息，那么在/etc/目录下，新建或者修改配置文件motd，在其中定制你
需要的登录后信息即可。


默认情况下/etc/issue.net 文件的内容不会在ssh登录前显示，要显示这个信息可以修改
/etc/ssh/sshd_config 文件中的 Banner /etc/issue.net ，配置更改后，需要重启SSH服
务。


/etc/issue.net 文件记录了操作系统的名称和版本号，这些登录提示很明显的泄漏了系统
信息，为了安全起见，建议将系统相关信息去除。

```
108 # no default banner path
109 #Banner none
```

https://www.cnblogs.com/pluse/p/5531523.html

---


```
/etc/issue
Debian GNU/Linux 10 \n \l


/etc/issue.net
Debian GNU/Linux 10


/etc/motd
The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
```



## bash 自动补全

/etc/bash_completion 中的内容:
    /usr/share/bash-completion/bash_completion


## history

~/.history
    Default filename for reading and writing saved history



## quiet splash , nomodeset

quiet splash rw init=/bin/bash

1. nomodeset 

    1. means do not load video drivers

    1. 内核在加载X之前不加载视频驱动程序，而改用BIOS模式。

1. quiet

    1. This option tells the kernel to NOT produce any output (a.k.a. Non
       verbose mode). 

    1. If you boot without this option, you'll see lots of kernel messages such
       as drivers/modules activations, filesystem checks and errors.

    1. quiet的意思是内核启动时候简化提示信息


1. splash 使（液体）溅起;

    1. splash 的意思是启动的时候使用图形化的进度条代替 init 的字符输出过程

debian 忘记密码

    ro single 改成 rw single init=/bin/bash




grup配置文件

    /etc/default/grup       

    /etc/grub.d/

    /boot/grub/grub.cfg

    gurb-mkconfig -o /boot/grub2/grub.cfg

        Generate a grub config file


查看grub 版本

    grub-install --version

    grub-probe --version




/boot/grub/grub.cfg

/etc/default/grub

    GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"

    属性名：内核启动参数的默认值

    值说明：quiet splash为不显示启动信息，安静的启动，如值为空则显示启动信息

    ???但是kali中的是只有quiet

        GRUB_CMDLINE_LINUX_DEFAULT="quiet"


    1. GRUB_DEFAULT=0

    属性名：默认启动项（就是我要的开机默认启动系统）

    值说明：

        数字：从0开始（按照开机选择界面的顺序对应）

        saved:默认上次的启动项

        1. 可以用 grub-editenv list  查看当前的默认

        

        1. grep ^menuentry /boot/grub/grub.cfg      查看可以设置的项目有哪些

        menuentry 'Debian GNU/Linux' --class debian --class gnu-linux --class gnu --class os $menuentry_id_option 'gnulinux-simple-3b32b225-052c-409d-8895-9c1cbc975676' {

        }

        centos 7 忘记root 密码
            
            vmlinuz 最后加入 single(centos6)   rd.break(centos7)

            重启后的目录是 在内存中虚拟的一个目录, 真实的在 /sysroot

            mount -o remount,rw /sysroot        //默认是只读挂载, option

            chroot /sysroot     //切换/sysroot为根目录

            passwd root






        1. 设置默认

        grub-set-default 1      //设置默认为第一个, 从零开始

    1. GRUB_CMDLINE_LINUX="" GRUB_CMDLINE_LINUX_DEFAULT="quiet"

        grub 引导的时候添加的选项, quiet 静默，rhgb:图形化(centos)





    GRUB_TIMEOUT=10

    #属性名：进入默认启动项的等候时间

    #值说明：单位：秒，默认10秒，-1表示一直等待


    Uncomment to disable graphical terminal (grub-pc only)

    GRUB_TERMINAL=console

    属性名：是否使用图形介面

    值说明：默认使用图像界面，去掉前面的“#”则使用控制台终端


    Uncomment to get a beep at grub start

    GRUB_INIT_TUNE="480 440 1"

    属性名：启动时发出哔哔声

    值说明：默认不发声，去掉“#”则发声


使修改生效

执行以下命令：

    > sudo update-grub

该命令作用是更新原来的/boot/grub/grub.cfg文件，但修改配置时不要修改
/boot/grub/grub.cfg文件，而是要修改/etc/default/grub文件，然后

sudo update-grub

    ``` /boot/grub/grub.cfg
    # DO NOT EDIT THIS FILE
    #
    # It is automatically generated by grub-mkconfig using templates
    # from /etc/grub.d and settings from /etc/default/grub
    ```








## md5sum && sha1sum

在网络传输、设备之间转存、复制大文件等时，可能会出现传输前后数据不一致的情况。
这种情况在网络这种相对更不稳定的环境中，容易出现。那么校验文件的完整性，也是势
在必行的

md5值是一个128位的二进制数据，转换成16进制则是32（128/4）位的进制值

SHA1 与 md5 类似，是另一种常用的校验和算法。160位二进制数据，它从给定的输入文件
中生成一个长度为40个字符的十六进制串

**md5校验，有很小的概率不同的文件生成的 md5 可能相同。比md5更安全的校验算法还有
SHA系列的**

生成md5值重定向到指定的文件，通常文件的扩展名我们会命为.md5

    md5sum data > data.md5

将多个文件的md5重定向到指定的文件(每个文件的md5生成为一行)

    md5sum * > data.md6
    
-c 选项来对文件md5进行校验。校验时，根据已生成的md5来进行校验。生成当前文件的
md5，并和之前已经生成的md5进行对比，如果一致，则返回OK，否则返回错误信息


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

1. cat /etc/issue

lsb_release

    lsb_release - print distribution-specific information

    -a, --all

        Display all of the above information.

    -i, --id

        Display the distributor's ID.

    -c, --codename

        Display the code name of the currently installed distribution.

    -s, --short

        Use  the  short  output format for any information displayed. This
        format omits the leading header(s).


    虽然执行成功，但是会返回 No LSB modules are available.

或者 

    cat /etc/os-release


### 安装操作系统时

test the media & install CentOS 7

    检查安装介质

    虚拟机中安装完成后，分辨率调整
        
        应用程序 -> 系统工具 -> 设置 ->  设备 -> Displays -> 分辨率

切换console
    
    init 1      //rescure mode
    init 2

终端

    图形终端

    命令行终端

    远程终端(SSH,VNC)

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
    --listfiles
    列出安装的所有文件清单()

dpkg -c 软件包.deb(安装前查询)
    --contents
    List contents of a deb package.
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
        lsb_release -c
        
        Codename:       kali-rolling
        如果你需要自己编辑更新列表文件， /etc/apt/sources.list ，你就会发现在 url 的后面紧跟着一个 codename 


            deb http://mirrors.tuna.tsinghua.edu.cn/kali **kali-rolling** main contrib non-free
            deb-src https://mirrors.tuna.tsinghua.edu.cn/kali **kali-rolling** main contrib non-free
            
            deb http://mirrors.aliyun.com/kali **kali-rolling** main non-free contrib
            deb-src http://mirrors.aliyun.com/kali **kali-rolling** main non-free contrib




## 关闭在线用户
1. 方法一
    who
    echo "i will close your connection">/dev/pts/2
    fuser -k /dev/pst/2
        --kill
    
    fuser:show which processes use the named files, sockets, or filesystems

1. 方法二
    who 
    pkill -KILL -t pts/0

    pgrep, pkill - look up or signal processes based on name and other attributes
        only PID

    pkill : look up or signal processes based on name and other attributes

    -t, --terminal term,...
        Only  match  processes  whose controlling terminal is listed.  The terminal name
        should be specified without the "/dev/" prefix.



1. 方法三
    登录用户的bash进程
    ps -ef | grep bash | grep pts
    kill -9  1 2 3


## pgrep 

looks through the currently running processes and lists the process IDs which match the selection criteria to stdout.  All the criteria have to match.  For example,

              $ pgrep -u root sshd
        
       will only list the processes called sshd AND owned by root.  On the other hand,
        
              $ pgrep -u root,daemon
     
       will list the processes owned by root OR daemon.
        
pkill will send the specified signal (by default SIGTERM) to each process instead of listing them on stdout.

    -l, --list-name
        List the process name as well as the process ID.  (pgrep only.)







## 查看内核

1. cat /proc/version

1. uname -r

1. 内核版本

    主版本号.次版本号.末版本号

        次版本号:(2.6版本后就不是这样了)

            偶数：稳定

            奇数：开发



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


### 可封装常用的字体颜色到类中,便于以后使用

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


printf "\033[31;42m正文\n\033[0m"

linux console 中只有printf, 没有print, echo 不支持颜色

是一个只有开始，没有结束的射线, \033[0m 改回了默认



## 创建一个名称为 '--test'的文件

touch -- --test
rm -rf -- --test



在ubuntu下，由于版权的原因，默认不支持exfat格式的u盘，不过可以很方便就能添加对exfat的支持：
    sudo apt-get install exfat-utils
    安装完之后重启生效。
    

    ```
    find ./ -inum 222 -exec rm -i {} \;  

    ```
    \; 前面必须有一个空格


## Linux终端 vi 模式 

这个叫做 editing-mode       Vi 和 Emacs

vi ~/.zshrc
G
set -o vi

---

/etc/inputrc


Because Emacs is a little easier to pick up     --《From Bash to Z shell》





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




-m      Show threads after processes.
-p      pidlist
            Select by PID.  This selects the processes whose process ID numbers appear in pidlist.  Identical to
            p and --pid.
-o      format
        %cpu
            cpu utilization of the process in "##.#" format.  Currently, it is the CPU time used
            divided by the time the process has been running (cputime/realtime ratio), expressed
            as a percentage.  It will not add up to 100% unless you are lucky.  (alias pcpu).

        %mem    ratio of the process's resident set size  to the physical memory on the machine,
                expressed as a percentage.  (alias pmem).
        THREAD
        pid
        tid
            the unique number representing a dispatchable entity (alias lwp, spid).  This value
            may also appear as: a process ID (pid); a process group ID (pgrp); a session ID for
            the session leader (sid); a thread group ID for the thread group leader (tgid); and a
            tty process group ID for the process group leader (tpgid).

        cmd
        time
            cumulative(累计) CPU time, "[DD-]HH:MM:SS" format.  (alias cputime).

        comm        COMMAND   command name (only the executable name).
        command             很多信息，不如comm精简





top -h 
procps-ng
    本质上去读 /proc/





## 监控linux

### 内存

free 

    -m

    -g  四舍五入了，不太准确

    used    

    available:看这个available

top


可以不设置 swap 分区，但是内核会随机杀掉一些进程, 不安全

vmstat 时间间隔(秒)

    Report virtual memory statistics


### 硬盘

fdisk        //查看 或 设置
    
    boot的分区 有 boot列有"*" 

parted

df 

du

    空洞大小

    dd if=/dev/zero bs=4M count=10 seek=20 of=a.txt

    count:真实要写多少个block

    seek: 开始时跳过多少个block

    开始时跳过20个block,然后写10个block

    ```
    dd if=/dev/zero bs=4M count=10 of=a.txt

    ➜  t ll dd.txt
    -rw-r--r-- 1 root root 40M Jul 13 06:46 dd.txt
    ➜  t du -h dd.txt
    40M     dd.txt

    都是40M
 

    dd if=/dev/zero bs=4M count=10 seek=20 of=a.txt

    ➜  t ll dd.txt
    -rw-r--r-- 1 root root 120M Jul 13 06:48 dd.txt
    ➜  t du -h dd.txt
    40M     dd.txt

    du显示的是真实的，ll显示的占用大小,从开始到结尾???
    ```

    默认创建文件的区块大小是4k, fdisk -l 中的 I/O size


sar -r 3    (apt install sysstat)

    systat

    -r [ALL]


ll /dev/sd?

    brw-rw---- 1 root disk 8, 16 Jul 11 07:48 /dev/sdb

    主设备号，次设备号



### 文件系统

ext4

    超级块

    超级块副本

    i节点

        记录权限

        文件名记录在父目录的i节点中

        vim 操作会默认修改i节点, echo 不会, vim可以通过硬链接 不修改i节点

            文件创建硬链接后，用vim修改 源文件和硬链接文件时，均不会修改i节点


    数据块

xfs

NTFS(需要额外的插件)
    
    ntfs-3g


facl 文件访问控制

setfacl 
    
    -m, --modify

    -x, --remove


    setfacl -m u:用户:权限  文件
    setfacl -m g:组:权限  文件

    setfacl -x u:用户:权限  文件




## /etc/shadow

1. 该列留空，即"::"，表示该用户没有密码。
???1. 该列为"!"m，":!:"，表示该用户被锁，被锁将无法登陆，但是可能其他的登录方式是不受限制的，如ssh公钥认证的方式，su的方式。
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

如果需要关闭guest用户，则再在最后一行加入 
    allow-guest=false 

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

        如果一个文件不是目录，此时这一字段表示这个文件所具有的硬链接数

        如果是一个目录，则第2字段表示该目录所含子目录的个数。

        最后一次的修改时间


    -B, --block-size=SIZE

        scale sizes by SIZE before printing them; e.g., '-BM' prints sizes in units of 1,048,576 bytes; see SIZE format below

    -A, --almost-all

        do not list implied . and ..

    -R, --recursive

        list subdirectories recursively

    -F, --classify

        append indicator (one of */=>@|) to entries

        区分目录和文件,目录加 /

    -r, --reverse

        reverse order while sorting, 默认是逆序文件名

    -s, --size

        print the allocated size of each file, in blocks

    -S     sort by file size, largest first

    --sort=WORD

        sort by WORD instead of name: none (-U), size (-S), time (-t), version (-v), extension (-X)

    -t     sort by modification time, newest first

    --time=WORD

        with -l, show time as WORD instead of default modification time: atime or access or use (-u); ctime
        or status (-c); also use specified time as sort key if --sort=time (newest first)




## cat

concatenate files and print on the standard output

    -b, --number-nonblank
        number nonempty output lines, overrides -n

    -E, --show-ends
        display $ at end of each line

    -v, --show-nonprinting
        use ^ and M- notation, except for LFD and TAB

    -n, --number
        number all output lines

    -s, --squeeze-blank
        suppress repeated empty output lines

    -T, --show-tabs
        display TAB characters as ^I



## grep 

-v, --invert-match
    Invert the sense of matching, to select non-matching lines.

-r, --recursive
    Read  all  files under each directory, recursively, following symbolic links only if they are on the
    command line.  Note that if no file operand is given, grep searches the working directory.  This  is
    equivalent to the -d recurse option.

-R, --dereference-recursive
    Read all files under each directory, recursively.  Follow all symbolic links, unlike -r.




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

使用fdisk -l
    Sector size (logical/physical): 512 bytes / 512 bytes

tune2fs -l /dev/nvme0n1p5 | less
    1. Inode blocks per group:   512
        这个属性应该是 stat 中的 Blocks 的同义词,不确定??? 


查看绝对值形式的权限

stat -c %a 文件/目录
-c  --format=FORMAT
    use the specified FORMAT instead of the default; output a newline after each use of FORMAT


## cp

-p     same as --preserve=mode,ownership,timestamps

--preserve[=ATTR_LIST]
    preserve the specified attributes (default: mode,ownership,timestamps), if possible additional attributes: context, links, xattr, all

--no-preserve=ATTR_LIST
    don't preserve the specified attributes

-L, --dereference   默认
    always follow symbolic links in SOURCE
    不复制引用，而是复制目标文件

-P, --no-dereference
    never follow symbolic links in SOURCE
    还是复制引用，即复制的文件仍为软连接文件


## touch 

touch - change file timestamps
    默认修改 access, modify, change 三个

-d, --date=STRING
    parse STRING and use it instead of current time
    默认修改 access 和 modify 时间, 但是 change 会被修改为命令执行时的时间

    touch -d '2000-1-1' a.txt       修改 atime 和 mtime
    touch -a -d '2000-1-1' a.txt    仅修改 atime
    touch -m -d '2000-1-1' a.txt    仅修改 mtime

-a     change only the access time

-m     change only the modification time

    touch -m -d '2000-1-1' a.txt


-c, --no-create
    do not create any files

-h, --no-dereference
    affect each symbolic link instead of any referenced file (useful only on systems that can change the
    timestamps of a symlink)




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
    1. b      block (buffered) special
    2. c      character (unbuffered) special
    3. d      directory
    4. p      named pipe (FIFO)
    5. f      regular file
    6. l      symbolic link; this is never true if the -L option or the -follow option is in effect, unless the symbolic link is broken.  If you want to search for symbolic links when -L is in effect, use -xtype.
    7. s      socket
    8. D      door (Solaris)
    To search for more than one type at once, you can supply the combined list of type letters separated by a comma `,' (GNU extension).


-perm -mode
    All of the permission bits mode are set for the file.  Symbolic modes are accepted in this form, and this is usually the way in which you would want to use them.  You must specify `u', `g' or `o' if you use a  symbolic
    mode.  See the EXAMPLES section for some illustrative examples.

-perm /mode
    Any  of  the permission bits mode are set for the file.  Symbolic modes are accepted in this form.  You must specify `u', `g' or `o' if you use a symbolic mode.  See the EXAMPLES section for some illustrative examples.
    If no permission bits in mode are set, this test matches any file (the idea here is to be consistent with the behaviour of -perm -000).

    find / -perm /4000



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


## 文本处理


## grep 

-i: --ignore-case
    
-v:--invert-match
    Invert the sense of matching, to select non-matching lines.

--color=auto

--exclude-dir=GLOB   不包括;
    Skip any command-line directory with a name suffix that matches the pattern GLOB.  When searching  recursively,
    skip any subdirectory whose base name matches GLOB.  Ignore any redundant trailing slashes in GLOB.

    --exclude-dir=.git                  单个文件夹
    --exclude-dir={.git,CVS,.svn}       多个文件夹


-E, --extended-regexp
    Interpret PATTERNS as extended regular expressions (EREs, see below).

-R, --dereference-recursive
    Read all files under each directory, recursively.  Follow all symbolic links, unlike -r.
    按照所有符号链接递归地读取并处理该目录中的所有文件
    解除引用的递归, 解除了引用，所以symlink文件被单独的对待

-n, --line-number
    Prefix each line of output with the 1-based line number within its input file.


-r, --recursive
    Read all files under each directory, recursively, following symbolic links only if  they  are  on  the  command
    line.   Note  that if no file operand is given, grep searches the working directory.  This is equivalent to the -d recurse option.
    symlink 仍然当做symlink, 因为和指向的文件是同一个，所以，只显示源文件，而不显示 symlink 文件

-d ACTION, --directories=ACTION
    If an input file is a directory, use ACTION to process it.  
    By default, ACTION is read, i.e., read  directories just as if they were ordinary files.  
    If ACTION is skip, silently skip directories.  
    If ACTION is recurse, read all files under each directory, recursively, following symbolic links only if they are  on  the  command  line.
    This is equivalent to the -r option.
    只有显示的指出了symlink文件，才会显示




-A NUM, --after-context=NUM
    Print NUM lines of trailing context after matching lines.  Places a  line  containing  a  group
    separator  (--)  between  contiguous groups of matches.  With the -o or --only-matching option,
    this has no effect and a warning is given.

-B NUM, --before-context=NUM
    Print NUM lines of leading context before matching lines.  Places a  line  containing  a  group
    separator  (--)  between  contiguous groups of matches.  With the -o or --only-matching option,
    this has no effect and a warning is given.

-C NUM, -NUM, --context=NUM
    Print NUM lines of output context.  Places a line containing a  group  separator  (--)  between
    contiguous  groups of matches.  With the -o or --only-matching option, this has no effect and a
    warning is given.

    == -A + -B

-w, --word-regexp
    Select  only  those  lines  containing  matches  that  form  whole words.  The test is that the
    matching substring must either be at the beginning of the  line,  or  preceded  by  a  non-word
    constituent  character.   Similarly,  it must be either at the end of the line or followed by a
    non-word constituent character.  Word-constituent  characters  are  letters,  digits,  and  the
    underscore.  This option has no effect if -x is also specified.
    匹配单词，而不是字符串


-o, --only-matching
    Print  only the matched (non-empty) parts of a matching line, with each such part on a separate output line.
    仅仅将匹配的打印出来，一个一行，可以用来进行统计多少个匹配项






例子
    grep -E 'liujiao' -R .
    grep -R 'liujiao' .
    ./passwd:liujiao:x:1001:1001::/home/liujiao:/bin/sh
    ./names:1.liujiao


    grep -i -n -A 2 'root' passwd
    grep -i -n -B 2 'root' passwd

    grep -w 'hello' password

    grep -o 'hello' password | wc -l


## wc

print newline, word, and byte counts for each file

-c, --bytes
    print the byte counts

-m, --chars
    print the character counts

-l, --lines
    print the newline counts

--files0-from=F
    read  input  from  the  files specified by NUL-terminated names in file F; If F is - then read names
    from standard input

-L, --max-line-length
    print the maximum display width

-w, --words
    print the word counts
    

## od

dump files in octal and other formats

-t, --format=TYPE
    select output format or formats


Traditional format specifications may be intermixed; they accumulate:

-a     same as -t a,  select named characters, ignoring high-order bit

-b     same as -t o1, select octal bytes

-c     same as -t c,  select printable characters or backslash escapes

-d     same as -t u2, select unsigned decimal 2-byte units

-f     same as -t fF, select floats

-i     same as -t dI, select decimal ints

-l     same as -t dL, select decimal longs

-o     same as -t o2, select octal 2-byte units

-s     same as -t d2, select decimal 2-byte units

-x     same as -t x2, select hexadecimal 2-byte units

TYPE is made up of one or more of these specifications:
a      named character, ignoring high-order bit

c      printable character or backslash escape


od -tc file == od -c file


## cut

cut - remove sections from each line of files

字段提取，提取列
与grep的区别就是 grep 取行，cut 取列

-f, --fields=LIST
    select only these fields;  
    also print any line that contains no delimiter character, unless the -s option is specified
    取第几列

-d, --delimiter=DELIM
    use DELIM instead of **TAB** for field delimiter

    **空格是分割符的话，就无力从心了, 就要用gawk了**
    
    比如df -h 
        Filesystem      Size  Used Avail Use% Mounted on
        udev            3.7G     0  3.7G   0% /dev
        tmpfs           770M   19M  751M   3% /run

        中间不是制表符，而是多个空格

        AxxxxxxxB
        YfYfYfYfY        f代表分隔符，Y表示取出的数据列, 

        

-s, --only-delimited
    do not print lines not containing delimiters

-c, --characters=LIST
    select only these characters
    第一个字符到第n个字符 []
    就不分空格和tab了, 空格和tab都是一个字符
    
    cut -c 1-5 passwd
    cut -c 1,3,5 passwd
    cut -c 5- passwd        从第5个开始到末尾




    cut -d ":" -f 1,2,3 /etc/passwd
        输出内容还是以原来的分隔符进行分割

    cat passwd| grep /bin/bash | grep -v root | cut -f 1 -d ':'

    cut -d ' ' -f1,3 student

cut适合简单的指定具体分隔符,并且分隔符个数不重复的场景，不适合单个分隔符是不确定个字符的场景

例题: 
    列出当前运行级别
        runlevel | cut -c 3
        runlevel | cut -d ' ' -f 2

        redhat 系列
        grep -v '^#' /etc/inittab | cut -d':' -f 2
        tail -1 /etc/inittab | cut -d':' -f 2
        

## sort

用于排序，从首字符开始，按照ASCII，升序

-u, --unique   去除重复行, 同 mysql 中的distinct
    with -c, check for strict ordering; without -c, output only the first of an equal run


    如果这一行和另外一行完全一样，会只output一行
-n, --numeric-sort  按照数字排序
    compare according to string numerical value

-r, --reverse
    reverse the result of comparisons


-t : 分隔符
-k : 第N列

例子:
    sort -n -t':' -k3 passwd
    sort -n -r -t':' -k3 passwd     倒序


## uniq  

report or omit repeated lines
去除连续重复的行

-i, --ignore-case
    ignore differences in case when comparing

-c, --count
    prefix lines by the number of occurrences
    在前面显示出现了几次, 1 表示没有重复
    一般要写这个

-d, --repeated
    only print duplicate lines, one for each group
    只显示重复行
    只显示有那些内容行是重复的，要自己去手工定位


## tee 

从标准输入读取并写入到标准输出**和**文件
双向重定向

echo "hello" | tee 'hello.txt'
    同时会在屏幕和**覆盖**文件, 即是 >

-a, --append
    append to the given FILEs, do not overwrite


例子
    grep -v '^#' /etc/vsftpd.conf | grep -v '^$' | tee 'vsftpd.conf_bak' 

    
## diff

GNU diff - compare files line by line

正常格式（normal diff）
上下文格式（context diff）
合并格式（unified diff）


如何改变第一个文件以变成第二个文件


< 开头的行表示来自第一个文件
> 开头的行表示来自第二个文件
三个横杠"---" 仅仅表示分隔开文件1和文件2的这些行



-b  不检查空格
-B  不检查空白行
-Z, --ignore-trailing-space
    ignore white space at line end

-b, --ignore-space-change
    ignore changes in the amount of white space

-w, --ignore-all-space
    ignore all white space

-B, --ignore-blank-lines
    ignore changes where lines are all blank

-c, -C NUM, --context[=NUM]
    output NUM (default 3) lines of copied context
    上下文格式显示

-u, -U NUM, --unified[=NUM]
    output NUM (default 3) lines of unified context
    合并格式显示

    '''aa
1   aaaa
2   111
3   hello world
4   222
5   333
6   bbb
    '''

    '''bb
1   aaa
2   hello
3   111
4   222
5   bbb
6   333
7   world
    '''

    diff aa bb
    '''
    1c1,2                       第一个文件的第1行需要改变（change)才能和第2个文件的第一二行匹配[,]
    < aaaa                      < 表示左边文件的内容
    ---                         ---表示分隔符
    > aaa                       > 表示右边文件的内容
    > hello
    3d3                         左边文件第3行删除（delete)后才能和第2个文件第三行(222) 
    < hello world
    5d4
    < 333
    6a6,7                       左边文件增加（add）内容后才能和第二个文件的第6、7行匹配
    > 333                       需要增加的内容在第二个文件里是 333 和 world
    > world
    '''
    
    先从首末行找相同的


### 目录

diff -q 

-q, --brief
    report only when files differ

    ```
    ➜  Music diff -q test test2
    Only in test: a
    Only in test2: aaa
    Files test/b and test2/b differ
    ➜  Music tree test test2
    test
    ├── a
    ├── b
    └── hello
    test2
    ├── aaa
    ├── b
    └── hello

    ```


### 生成patch

patch - apply a diff file to an original


-N:将不存在的文件当做空文件

1. 先找出文件不同，然后输出到一个文件

    diff -uN file1 file2 > file.patch

1. 将补丁文件作用于文件

    patch file1 file.patch

1. 验证测试

    diff file1 file2

    -b  or  --backup
        Make backup files.  That is, when patching a file, rename or copy the original instead of removing it.
        See the -V or --version-control option for details about how backup file names are determined.
        
    -R  or  --reverse
        Assume  that  this  patch  was created with the old and new files swapped.  (Yes, I'm afraid that does
        happen occasionally, human nature being what it is.)  patch attempts to swap each hunk  around  before
        applying  it.   Rejects  come  out  in  the  swapped format.  The -R option does not work with ed diff
        scripts because there is too little information to reconstruct the reverse operation.
        
        If the first hunk of a patch fails, patch reverses the hunk to see if it can be applied that way.   If
        it  can,  you are asked if you want to have the -R option set.  If it can't, the patch continues to be
        applied normally.  (Note: this method cannot detect a reversed patch if it is a normal diff and if the
        first  command  is  an append (i.e. it should have been a delete) since appends always succeed, due to
        the fact that a null context matches anywhere.  Luckily, most patches add or change lines rather  than
        delete  them,  so  most reversed normal diffs begin with a delete, which fails, triggering the heuris‐
        tic.)
        卸载补丁




    ## paste

    merge lines of files
    用于合并文件行
    不更改源文件，只显示到屏幕

第一个文件的第一行和第二个文件的第一行合并

-d, --delimiters=LIST
    reuse characters from LIST instead of TABs

-s, --serial
    paste one file at a time instead of in parallel
    串行处理，
    第一行都是第一个文件
    第二行都是第二个文件
    


例子
    paste -d: file1 file2







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
        
        因为 %s 是按照UTC计算的，那就是比方说我们是格林威治时区，date -d 时，也
        要加上UTC时区，而不是我们目前的CST时区

-s, --set=STRING

    set time described by STRING
    
    date -s '20200101 18:00'


-d, --date=STRING

    display time described by STRING, not 'now'

    date -d "1970-1-1 20000days UTC"



## help 

bash , zsh 没有


## /etc/passwd

1. name
2. passwd
3. uid
4. gid
5. comment
6. home
7. shell

If the password field is a lower-case “x”, then the encrypted password is
actually stored in the shadow(5) file instead; there must be a corresponding
line in the /etc/shadow file, or else the user account is invalid.

    The encrypted password field may be empty, in which case no password is
    required to authenticate as the specified login name. However, some
    applications which read the /etc/passwd file may decide not to permit any
    access at all if the password field is blank.

    A password field which starts with an exclamation(感叹号) mark means that
    the password is locked. The remaining characters on the line represent the
    password field before the password was locked.

    Refer to crypt(3) for details on how this string is interpreted.

    If the password field contains some string that is not a valid result of
    crypt(3), for instance ! or *, the user will not be able to use a unix
    password to log in (but the user may log in the system by other means).

        比如可以通过root su 过去

centos 中将uid改为零，这个用户就是管理员了

## useradd

-d, --home-dir HOME_DIR

    The new user will be created using HOME_DIR as the value for the user's
    login directory. The default is to append the LOGIN name to BASE_DIR and
    use that as the login directory name. The directory HOME_DIR does not have
    to exist but will not be created if it is missing.

-m, --create-home

    Create the user's home directory if it does not exist. The files and
    directories contained in the skeleton directory (which can be defined with
    the -k option) will be copied to the home directory.

    By default, if this option is not specified and CREATE_HOME is not enabled,
    no home directories are created.

-M, --no-create-home

    Do no create the user's home directory, even if the system wide setting
    from /etc/login.defs (CREATE_HOME) is set to yes.

-g, --gid GROUP

    The group name or number of the user's initial login group. The group name
    must exist. A group number must refer to an already existing group.

    If not specified, the behavior of useradd will depend on the
    USERGROUPS_ENAB variable in /etc/login.defs. If this variable is set to yes
    (or -U/--user-group is specified on the command line), a group will be
    created for the user, with the same name as her loginname. If the variable
    is set to no (or -N/--no-user-group is specified on the command line),
    useradd will set the primary group of the new user to the value specified
    by the GROUP variable in /etc/default/useradd, or 100 by default.



-G, --groups GROUP1[,GROUP2,...[,GROUPN]]] 附加组

    A list of supplementary groups which the user is also a member of. Each
    group is separated from the next by a comma, with no intervening
    whitespace. The groups are subject to the same restrictions as the group
    given with the -g option. The default is for the user to belong only to the
    initial group.

    useradd -G group1 


-c, --comment COMMENT

    Any text string. It is generally a short description of the login, and is
    currently used as the field for the user's full name.



-u, --uid UID

    The numerical value of the user's ID. This value must be unique, unless the
    -o option is used. The value must be non-negative. The default is to use
    the smallest ID value greater than or equal to UID_MIN and greater than
    every other user.

    See also the -r option and the UID_MAX description.
    /etc/login.defs 中记录了 UID_MIN 1000, UID_MAX 60000 (Useradd)
        SYS_UID_MIN 100
        SYS_UID_MAX 999


-r, --system

    Create a system account.

    System users will be created with no aging information in /etc/shadow, and
    their numeric identifiers are chosen in the SYS_UID_MIN-SYS_UID_MAX range,
    defined in /etc/login.defs, instead of UID_MIN-UID_MAX (and their GID
    counterparts for the creation of groups).

    Note that useradd will not create a home directory for such a user,
    regardless of the default setting in /etc/login.defs (CREATE_HOME). You
    have to specify the -m options if you want a home directory for a system
    account to be created.


-s, --shell SHELL

    The name of the user's login shell. The default is to leave this field
    blank, which causes the system to select the default login shell specified
    by the SHELL variable in /etc/default/useradd, or an empty string by
    default.




/etc/default/useradd                    vi /etc/default/grub
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



### 更改用户名和组名

usermod -l NewUser -d /home/NewUser -m OldUser
-l 修改用户名
-d 修改登录后使用的路径
-m 修改登录名称的同时将目录名称一同修改

修改组名称：
继上面操作后，继续执行下列命令
groupmod -n NewUser OldName
-n 修改组的名称



## /etc/shadow
1. 用户名

2. 密码

    This field may be empty, in which case no passwords are required to
    authenticate as the specified login name. However, some applications which
    read the /etc/shadow file may decide not to permit any access at all if the
    password field is empty.

    A password field which starts with an exclamation mark means that the
    password is locked. The remaining characters on the line represent the
    password field before the password was locked.

    Refer to crypt(3) for details on how this string is interpreted.

    If the password field contains some string that is not a valid result of
    crypt(3), for instance ! or *, the user will not be able to use a unix
    password to log in (but the user may log in the system by other means).

        系统用户都是这个*

3. date of last password change(1970.1.1)

    0:下次登录需要修改密码
    空:An empty field means that password aging features are disabled.

    如何计算呢?
        
        date -d "2020-02-25 UTC" +%s
        date -d "1970-1-1 20000days UTC" 得到2024 12:00
        

4. minimum password age

    the number of days the user will have to wait before she will be allowed to
    change her password again.  An empty field and value 0 mean that there are
    no minimum password age.

5. maximum password age

    The maximum password age is the number of days after which the user will
    have to change her password.

    After this number of days is elapsed, the password may still be valid. The
    user should be asked to change her password the next time she will log in.

    An empty field means that there are no maximum password age, no password
    warning period, and no password inactivity period (see below).

    If the maximum password age is lower than the minimum password age, the
    user cannot change her password.

6. password warning period

    The number of days before a password is going to expire (see the maximum
    password age above) during which the user should be warned.  maxmium 到期日
    向前数

    An empty field and value 0 mean that there are no password warning period.

7. password inactivity(静止，不活动) period

    The number of days after a password has expired (see the maximum password
    age above) during which the password should still be accepted (and the user
    should update her password during the next login).  maximux 到期后向后数

    **After expiration of the password and this expiration period is elapsed,
    no login is possible using the current user's password. The user should
    contact her administrator.**

    An empty field and -1(see /etc/default/useradd) means that there are no
    enforcement of an inactivity period.

8. account expiration date

    The date of expiration(期满) of the account, expressed as the number of
    days since Jan 1, 1970.

    Note that an account expiration differs from a password expiration. 

    In case of an account expiration, the user shall not be allowed to login.
    (如果超过了失效时间，就算密码没有过期，用户也就失效，无法使用了)

    In case of a password expiration, the user is not allowed to login using
    her password.

    An empty field means that the account will never expire.

    The value 0 should not be used as it is interpreted as either an account
    with no expiration, or as an expiration on Jan 1, 1970.

9. reserved field

    This field is reserved for future use.


## /etc/group

group_name

    the name of the group.

password
    
    the (encrypted) group password 都是x, 存在/etc/gshadow中.  If this field is
    empty, no password is needed.

GID
    
    the numeric group ID.

user_list
    
    a list of the usernames that are members of this group, separated by commas.


## /etc/gshadow

group name

    It must be a valid group name, which exist on the system.

encrypted password

    Refer to crypt(3) for details on how this string is interpreted.

    If the password field contains some string that is not a valid result of
    crypt(3), for instance ! or \*, users will not be able to use a unix
    password to access the group (but group members do not need the password).

    The password is used when a user who is not a member of the group wants to
    gain the permissions of this group (see newgrp(1)).

    This field may be empty, in which case only the group members can gain the
    group permissions.

    A password field which starts with an exclamation mark means that the
    password is locked. The remaining characters on the line represent the
    password field before the password was locked.

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

/home/bill    700
Kali : 755



## uptime

uptime - Tell how long the system has been running.

## w

包含了 uptime 信息

the system load averages for the past 1, 5, and 15 minutes.

The JCPU time is the time used by all processes attached to the tty.  It does
not include past background jobs, but does include currently running background
jobs.

The PCPU time is the time used by the current process, named in the "what" field.


## 打包压缩

tar 

-C, --directory=DIR


### lz4

apt install liblz4-tool


### gzip

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







## split

split a file into pieces


    -d     use numeric suffixes starting at 0, not alphabetic

    -a, --suffix-length=N
            generate suffixes of length N (default 2)

    -b, --bytes=SIZE
            put SIZE bytes per output file


tar -zcf - urls-164213-20w-9-list | split -b 100m - helloworld.tar.gz -d -a 2
    那两个"-"不要漏了，那是tar的ouput和split的input的参数
    
    helloworld.tar.gz 输出文件名base


cat file1 file2 file3 > bigfile


## write

write — send a message to another user


## wall

wall - write a message to all users



## mail 

/var/spool/mail/


## last

last, lastb - show a listing of last logged in users


lastb

    lastb is the same as last, except that by default it shows a log of the
    /var/log/btmp file, which contains all the bad login attempts.


/var/log/wtmp 文件

utmp, wtmp - login records

The utmp file allows one to discover information about who is currently using
the system.  There may be more users currently using the system, because not
all programs use utmp logging.

       Warning:  utmp  must not be writable by the user class "other", because
       many system programs (foolishly) depend on its integrity.  You risk
       faked system logfiles and modifications of system files if you leave
       utmp writable to any user other than the owner and group owner of the
       file.



last reboot

last [options] [username...] [tty...]
lastb [options] [username...] [tty...]



## lastlog

lastlog - reports the most recent login of all users or of a given user

-u, --user LOGIN|RANGE

    This RANGE of users can be specified with a min and max values
    (UID_MIN-UID_MAX), a max value (-UID_MAX), or a min value (UID_MIN-).

    lastlog -u 0-10



## netstat

-l, --listening

    Show only listening sockets.  (These are omitted by default.)

--numeric, -n

   Show numerical addresses instead of trying to determine symbolic host, port
   or user names.

-p, --program

   Show the PID and name of the program to which each socket belongs.

--route, -r

   Display the kernel routing tables. See the description in route(8) for
   details.  netstat -r and route -e produce the same output.

   就是 route
    
## mount 

mount 显示已经挂载的设备

mount -t type device dir

    fat16 识别为 fat
    fat32 识别为 vfat
    光盘    iso9660

-l, --show-labels

    Add the labels in the mount output.  mount must have permission to read the
    disk device (e.g. be set-user-ID root) for this to work.  One can set such
    a label for ext2, ext3 or ext4 using the e2label(8) utility, or for XFS
    using xfs_admin(8), or for reiserfs using reiserfstune(8).


-a, --all

    Mount all filesystems (of the given types) mentioned in fstab (except for
    those whose line contains the noauto keyword).  

    The filesystems are mounted following their order in fstab.  

    The mount command compares filesystem source, target (and fs root for bind
    mount or btrfs) to detect already mounted filesystems. 

    The kernel table with already mounted filesystems is cached during mount
    --all. It means that all duplicated fstab entries will be mounted.

    依据 /etc/fstab 自动挂在

-o, --options

    Use the specified mount options.  The opts argument is a comma-separated
    list.  For example:

        mount LABEL=mydisk -o noatime,nodev,nosuid

    rw/ro
    exec/noexec
        不能执行，如hell.sh文件, 即使有x，即使root
        **mount -o remount,noexec /home**


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

    Cancel a pending shutdown. This may be used to cancel the effect of an
    invocation of shutdown with a time argument that is not "+0" or "now".


If the time argument is used, 5 minutes before the system goes down the
/run/nologin file is created to ensure that further logins shall not be
allowed.

"+m" referring to the specified number

    of minutes m from now.  "now" is an alias for "+0", i.e. for triggering an
    immediate shutdown. If no time argument is specified, "+1" is implied.

Note that to specify a wall message you must specify a time argument, too.


who
shutdown -k now "system wll shutdown in 5 mins"
ps -aux
pgrep -u 用户 -l
sync
sync

shutdown -r +6 "system will reboot in 6 mins"



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

纯命令行界面中 <C-d>


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

A file with the 'i' attribute cannot be modified: it cannot be deleted or
renamed, no link can be created to this file, most of the file's metadata can
not be modified, and the file can not be opened in write mode.
    

    chattr +i 文件
    
    相当于锁住，任何人不能删除，修改文件名或内容

    对于目录:
        不能重命名，删除该目录
        只能修改目录下文件的数据，不能创建和删除

???The 'e' attribute indicates that the file is **using extents for mapping the
blocks on disk**.  It may not be removed using chattr(1).

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

    Multiple users and groups may be present in a Runas_Spec, in which case the
    user may select any combination of users and groups via the -u and -g
    options.  In this example:

    alan    ALL = (root, bin : operator, system) ALL
    alan    ALL = (root, bin : operator, system) PASSWD:ALL
    alan    ALL = (root, bin : operator, system) NOPASSWD:ALL

    user alan may run any command as either user root or bin, optionally
    setting the group to operator or system.



-u user, --user=user

    Run the command as a user other than the default target user (usually root)
    .

    The user may be either a user name or a numeric user-ID (UID) prefixed with
    the ‘#’ character (e.g., #0 for UID 0).

    When running com‐mands as a UID, many shells require that the ‘#’ be
    escaped with a backslash (‘\’).

    Some security policies may restrict UIDs to those listed in the password
    database.

    The sudoers policy allows UIDs that are not in the password database as
    long as the targetpw option is not set.  Other security policies may not
    support this.


-g group, --group=group

    Run the command with the primary group set to group instead of the primary
    group specified by the target user's password database entry.

    The group may be either a group name or a numeric group-ID (GID) prefixed
    with the ‘#’ character (e.g., #0 for GID 0).

    When running a command as a GID, many shells require that the ‘#’ be
    escaped with a backslash (‘\’).

    If no -u option is specified, the command will be run as the invoking user.

    In either case, the primary group will be set to group.  The sudoers policy
    permits any of the target user's groups to be specified via the -g option
    as long as the -P option is not in use.





PASSWD(默认) and NOPASSWD

    By default, sudo requires that a user authenticate him or herself before
    running a command.  This behavior can be modified via the NOPASSWD tag.
    Like a Runas_Spec, the NOPASSWD tag sets a default for the commands that
    follow it in the Cmnd_Spec_List.  Conversely, the PASSWD tag can be used to
    reverse things.  For example:

    ray     rushmore = NOPASSWD: /bin/kill, /bin/ls, /usr/bin/lprm

    would allow the user ray to run /bin/kill, /bin/ls, and /usr/bin/lprm as
    root on the machine rushmore without authenticating himself.  If we only
    want ray to be able to run /bin/kill without a password the entry would be:

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



The sudoers file is composed of two types of entries: aliases (basically
variables) and user specifications (which specify who may run what).

    When multiple entries match for a user, they are applied in order.  Where
    there are multiple matches, the last match is used (which is not
    necessarily the most specific match).



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


    n
    p/e     //primary   extended
    分区号   +size
    p       //print
    q       //不保存退出
    w       //保存退出


    /etc/fstab

        空格就可以

    ll /dev/disk/by-uuid


磁盘配额

    mount -o uquota,gquota  ... //支持用户磁盘配额和组磁盘配额的选项

    mount 查看所有的挂载信息和选项

    xfs_quota -x -c 'report -ugib' /mnt/disk1

    xfs_quota -x -c 'limit -u user1 isoft=5 ihard=10' /mnt/disk1        //限制文件个数

    xfs_quota -x -c 'limit -u bsoft= hsoft=' /mnt/disk1


#### parted

#### partprobe 

分区完成后，有时会要求重启, 可以试下这个命令

inform the OS of partition table changes


#### 格式化 mkfs

mkfs - build a Linux filesystem

mkfs -t ext4 /dev/sdb1

mkfs.ext4 /dev/sdb5     
    调用的 mke2fs


查看是否被挂载：mount 或 df -h


## 自动挂载 /etc/fstab

static information about the filesystems

1. uuid
    uuid的查看
       dumpe2fs -h /dev/sda1 

2. mount point
3. fs type
    ext4
    swap

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


free 是真正尚未被使用的物理内存数量。

available 是应用程序认为可用内存数量，available = free + buffer + cache (注：只是大概的计算方法)

share 是进程间的共享内存


增加swap

    两种方法:
        
        1. 增加交换分区的大小
            
            mkswap

            swapon

        1. 使用文件制作交换分区

            dd if=/dev/zero bs=4M count=1024 of=/swapfile

方法一

    首先要有一块 swap 分区 例如sdb

    ```
    fdisk /dev/sdb
    p
    大小
    w
    mkswap /dev/sdb1
    swapon /dev/sdb1    //这时就可以看到效果了，free -m
    swapoff /dev/sdb1   //关掉这个swap分区

    ```

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

    自动挂载 /etc/fstab
        UUID=b52ad353-391f-43b7-9319-a72ad0ec3880 none            swap    sw              0       0


方法2

    dd if=/dev/zero bs=4M count=1024 of=/swapfile

    chmod 600 /swapfile

    mkswap /swapfile

    swapon /swapfile
    swapoff /swapfile


写入 /etc/fstab

    /swapfile  swap  swap  defaults  0  0(开机自检，针对ext2,ext3)


```https://tldp.org/HOWTO/Partition/setting_up_swap.html

9. Setting Up Swap Space
9.1. Swap Files

Normally, there are only two steps to setting up swap space, creating the
partition and adding it to /etc/fstab. A typical fstab entry for a swap
partition at /dev/hda6 would look like this:

    /dev/hda6   swap    swap    defaults    0   0

The next time you reboot, the initialization scripts will activate it
automatically and there's nothing more to be done.

However, if you want to make use of it right away, you'll need to activate it
maually. As root, type:

    mkswap -f /dev/hda6
    swapon /dev/hda6
    9.2. Swap Files

There might be times when you've run out of swap space and it is not practical
to repartition a drive or add a new one. In this case, you can use a regular
file in an ordinary partition. All you have to do is create a file of the size
you want

    dd if=/dev/zero of=/var/my_swap bs=1024 count=131072

and activate it

    mkswap -f /var/my_swap
        
        swapon /var/my_swap
        
        This invocation creates a file called my_swap in /var. It is 128 Mb
        long (128 x 1024 = 131072). Initially, it is filled with zeros. However,
        mkswap marks it as swap space and swapon tells the kernel to start
        using it as swap space. When you are done with it,
        
        swapoff /var/my_swap
        rm /var/my_swap
        9.3. Multiple Swap Areas

        More than one swap partition can be used on the same system. Consider
        an example fstab where there is a single swap partition:
            
            /dev/hda5   /        ext3   defaults        1   1
            /dev/hda1   /boot    ext2   defaults        1   2
            none        /dev/pts devpts gid=5,mode=620  0   0
            none        /proc    proc   defaults        0   0
            /dev/hda7   /usr     ext3   defaults        1   2
            /dev/hda6   swap     swap   defaults        0   0
            
        Imagine replacing the entry for the swap partition with these three lines:
         
            /dev/hda6   none    swap    sw,pri=3    0   0
            /dev/hdb2   none    swap    sw,pri=2    0   0
            /dev/hdc2   none    swap    sw,pri=1    0   0
         
        This configuration would cause the kernel to use /dev/hda6 first. it
        has the highest priority assigned to it (pri=3). The maximum priority
        can be 32767 and the lowest 0. If that space were to max out, the
        kernel would start using /dev/hdb2, and on to /dev/hdc2 after that. Why
        such a configuration? Imagine that the newest (fastest) drives are
        given the highest priority. This will minimize speed loss as swap space
        usage grows.

        It is possible to write to all three simulataneously. If each has the
        same priority, the kernel will write to them much like a RAID, with
        commensurate speed increases.


        /dev/hda6   none   swap   sw,pri=3   0   0
        /dev/hdb2   none   swap   sw,pri=3   0   0
        /dev/hdc2   none   swap   sw,pri=3   0   0

        Notice that these three partitions are on separate drives, which is
        ideal in terms of speed enhancement.

```

更改分区类型后需要重启


#### raid

raid 0: striping 条带方式, 提高吞吐率

raid 1: mirroring 镜像方式, 提高可靠性

raid 5: 有奇偶校验

raid 10: raid0 + raid1      要最少4块


软件raid
    
    mdadm

    创建3个大小相同的分区

    mdadm -C /dev/md0  -a yes  -l1 -n2 /dev/sdb1 /dev/sdc1

    mdadm -C /dev/md0  -a yes  -l1 -n2 /dev/sd[b,c]1

    mdadm -D /dev/md0   //查看信息




卷
    物理卷：一个传统的物理磁盘

    逻辑卷: 物理卷上层，类似raid

    /dev/sd[b,c,d]1  大小可以不一样   

    创建物理卷

        pvcreate /dev/sd[b,c,d]1 

    pvs 查看

        VG: 卷组 

    创建卷组，一个pv 只能在一个卷组里

        vgcreate vg1 /dev/sdb1 /dev/sdc1

    创建逻辑卷    

        lvcreate -L 100M -n lv1 vg1
            -L 大小
            -n 名字
            从那个卷组
    查看 vgs


    mount



    lvs

    扩充lvm

        vgextend VG名 /dev/sdc1

        lvextend -L +50G /

        xfs_


## printf 格式化输出   

%ns     n个字符
%ni     n个整数
%m.nf   8.2f   总共8bit,小数两位，整数6位

printf FORMAT [ARGUENT]

FORMAT 中有几个，后面的argument 就几个为一组 

例:
    printf "%s %s\n" 姓名 年龄 张三 29 李四 30 王麻子 28
    姓名 年龄
    张三 29
    李四 30
    王麻子 28

    **printf 的参数不支持管道符号**

    ➜  Music cat students
    ID      NAME    GENDER  HOME    DREAM
    1       A       BOY     HanDan  Kill
    2       B       Girl    ShangHai        dress

    ➜  Music printf "%s\t%s\t%s\t%s\t%s\t%s\n"  `cat students`
    ID      NAME    GENDER  HOME    DREAM   1
    A       BOY     HanDan  Kill    2       B
    Girl    ShangHai        dress





## 关于热点连接

连接上手机热点后，huostname 变成 bogon



## tweak

扭; 拧; 扯; 稍稍调整(机器、系统等);

ubuntu-tweak

unity
    团结一致; 联合; 统一; 完整; 完美; 和谐; 协调;


桌面特效配置软件 compiz compizConfigSettingsManager


## review

命令解释器 Command-language interpreter

转义字符(metacharacters) 又特殊含义的字符
    1. 单引号忽略转义字符
    2. \ 标识忽略下一个转义字符
    3. 双引号忽略 $ ` \  以外的其他转义字符

通配符(wildcards) 是转义字符的子集


$TERM
$LANG
    en_US.UTF-8

hello="nice to meet you"
echo ${hello}
unset hello

readonly hello      // 将某个变量标记为只读
    后续执行过程中就不能对其值进行改变

    显示全部只读变量：[root@linuxcool ~]# readonly
    显示全部拥有只读属性的数组：[root@linuxcool ~]# readonly -a
    显示全部拥有只读属性的关联数组：[root@linuxcool ~]# readonly -A
    显示全部拥有只读属性的函数：[root@linuxcool ~]# readonly -f

export 给子shell




