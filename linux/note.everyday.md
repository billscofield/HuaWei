
shell 脚本如何显示**当前行号**

    用 $LINENO

---

sorround.vim

1. a"---ds"---aaa
2. cs-替换字串的包裹符号"aaa"---cs"]---[aaa]
3. ys-添加字串的包裹符号aaa---ysw]---[aaa]
4. 我们可以选中一个字串，然后使用Ｓ＋符号的方法来添加包裹符号"

---

查看系统可用的yum源和所有的yum源
    yum repolist enabled
    yum repolist all

createrepo 命令用于创建yum源（软件仓库），即为存放于本地特定位置的众多rpm包建立索引，描述各包所需依赖信息，并形成元数据。


baseurl=http://10.0.0.55/centos/$releasever/os/$basearch/
.
└── x86_64
    ├── Packages
    ├── repodata


-o --outputdir <url>
    指定元数据的输出位置

-c --cachedir <path>
    指定一个目录，用作存放软件仓库中软件包的校验和信息。
    当createrepo在未发生明显改变的相同仓库文件上持续多次运行时，指定cachedir会明显提高其性能。

--update
    如果元数据已经存在，且软件仓库中只有部分软件发生了改变或增减，
    则可用update参数直接对原有元数据进行升级，效率比重新分析rpm包依赖并生成新的元数据要高很多。

-p --pretty
    以整洁的格式输出xml文件。

-d --database
    该选项指定使用SQLite来存储生成的元数据，默认项。

---

lspci

    -n     Show PCI vendor and device codes as numbers instead of looking them up in the PCI ID list.
    -nn    Show PCI vendor and device codes as both numbers and names.


lshw -c display

    这个更加清晰些
    dmidecode -t

    -class class
        Only show the given class of hardware. 
        class can be found using lshw -short or lshw -businfo.

    -C class
        Alias for -class class.

    -short 
        Outputs the device tree showing hardware paths, very much like the output of HP-UX's ioscan.

    -businfo
        Outputs the device list showing bus information, detailing SCSI, USB, IDE and PCI addresses.


    查看当前 Linux 系统上所使用的显卡驱动名称

        lshw -c video | grep configuration
            configuration: driver=nvidia latency=0

    上面可以看到输出的显卡驱动名称有两条，其中一条为 driver=nvidia，我们则可以使用如下命令来检查显卡驱动的详情
        modinfo - Show information about a Linux Kernel module

        modinfo nvidia

检查硬件加速

    启用基于硬件的 3D 加速可以在绘制 3D 图形时直接使用硬件进行处理，这大大加快了 3D 渲染的速度。要使用该功能，必需显卡支持硬件加速并安装了正确的驱动。

    我们可以使用 glxinfo 命令来获查看得 OpenGL 的详细信息：

    glxinfo | grep OpenGL


---


2022-02-11 10:39:38

ulimit -c unlimited

[link](https://www.cnblogs.com/dongzhiquan/archive/2012/01/20/2328355.html#:~:text=1.%20core%E6%96%87%E4%BB%B6%E7%9A%84%E7%AE%80%E5%8D%95,%E6%98%AF%E7%94%A8%E6%9D%A5%E8%B0%83%E8%AF%95%E7%9A%84%E3%80%82&text=%E8%AF%A5%E5%91%BD%E4%BB%A4%E5%B0%86%E6%98%BE%E7%A4%BA%E6%89%80%E6%9C%89,%2Da%E4%BB%A3%E8%A1%A8%E2%80%9Call%E2%80%9D%E3%80%82)
1. core文件的简单介绍

    在一个程序崩溃时，它一般会在指定目录下生成一个core文件。core文件仅仅是一个内存映象(同时加上调试信息)，主要是用来调试的。

    1. 确认core文件的归属

        file core可以输出是由哪个程序生成的core

2. 开启或关闭core文件的生成

    用以下命令来阻止系统生成core文件:

        > ulimit -c 0

    下面的命令可以检查生成core文件的选项是否打开:

        > ulimit -a

    该命令将显示所有的用户定制，其中选项-a代表“all”。

    也可以修改系统文件来调整core选项
    在/etc/profile通常会有这样一句话来禁止产生core文件，通常这种设置是合理的:

        > # No core files by default
        
        > ulimit -S -c 0 > /dev/null 2>&1

    但是在开发过程中有时为了调试问题，还是需要在特定的用户环境下打开core文件产生的设置
    在用户的~/.bash_profile里加上ulimit -c unlimited来让特定的用户可以产生core文件
    如果ulimit -c 0 则也是禁止产生core文件，而ulimit -c 1024则限制产生的core文件的大小不能超过1024kb






查找文件句柄问题的时候，还有一个很实用的程序lsof.可以很方便看到某个进程开了那些句柄.也可以看到某个文件/目录被什么进程占用了.


    lsof -n

    COMMAND     PID   TID           USER   FD      TYPE             DEVICE    SIZE/OFF                 NODE NAME
    systemd       1                 root  cwd       DIR              253,1        4096                    2 /
    systemd       1                 root  rtd       DIR              253,1        4096                    2 /
    systemd       1                 root  txt       REG              253,1     1632744                12008 /usr/lib/systemd/systemd
    systemd       1                 root  mem       REG              253,1       20064                17326 /usr/lib64/libuuid.so.1.3.0


    lsof -n |awk '{print $2}'|sort|uniq -c |sort -nr


man sysctl.conf
    /etc/sysctl.conf
    sysctl.conf - sysctl preload/configuration file

    proc目录中的值可以进行动态的设置，若希望永久生效，可以修改/etc/sysctl.conf文件，并使用下面的命令确认： #sysctl -p

man 5 limits.conf
    /etc/security/limits.conf
    limits.conf - configuration file for the pam_limits module


[sysctl 和 limits.conf 的异同](https://zhuanlan.zhihu.com/p/50595210)

    limits.conf文件实际是Linux PAM（插入式认证模块，Pluggable Authentication 
    Modules中pam_limits.so的配置文件），突破系统的默认限制，对系统访问资源有一
    定保护作用，当用户访问服务器时，服务程序将请求发送到PAM模块，PAM模块根据服
    务名称在/etc/pam.d目录下选择一个对应的服务文件，然后根据服务文件的内容选择
    具体的PAM模块进行处理。 

    limits.conf 和sysctl.conf区别在于limits.conf是针对用户，而sysctl.conf是针对
    整个系统参数配置。




/etc/bashrc     /etc/profile       ... 精确区别    /etc/rc.local    的执行顺序





## shell 加密

1. gzexe

    gzexe - compress executable files in place

    centos 自带

    解密: gzexe -d 加密的文件

1. shc

    yum install shc

    -f script　　　　　　　　　 #指定要编译的shell的路径及文件名(必须选参数) 
    -v Verbose compilation 　　 #打印编译的详细信息
    -e date     　　　　 　　　 #指定执行文件过期日期
        man shc 得知日期格式为  dd/mm/yyyy
    -m message  　　　　 　　　 #指定过期时的提示的信息 
        如果不写,默认为: Please contact your provider jahidulhamid@yahoo.com
    -r Relax security. 　　　　 #允许相同操作系统的下执行 


    shc -v -e 11/2/2022 -m "contact me:xxx" -f a.sh

    a.sh.x是加密后的可执行的二进制文件，用./a.sh.x即可运行
    a.sh.x.c是生成 a.sh.x 的 C语言版本的原文件

3. upx.x86_64 : Ultimate Packer for eXecutables

    executable packer for several executable formats.

    UPX 是一款先进的可执行程序文件压缩器



---


2022-02-12

shell 中的 action 命令是什么??

https://m.zhipin.com/mpa/html/get/column?contentId=8dea87f091936383qxB43Ni1&identity=0&userId=11499836

    ```
    #!/bin/bash
    . /etc/init.d/functions
    for var in {10..25};
    do
        ip=192.168.75.${var}
        ping -c2 ${ip} >/dev/null 2>&1
        if [ $? = 0 ];then
            action "${ip}" /bin/true
        else
            action "${ip}" /bin/false
        fi
    done
    ```




---


2022-02-14


1. How do I change the color of text in the Lua terminal

    https://www.reddit.com/r/lua/comments/jrz7ki/how_do_i_change_the_color_of_text_in_the_lua/


    answers:

    This is more terminal-specific than Lua-specific. E.g. most terminals on
    Linux use VT100-style commands. For a start, have a look at ANSI escape
    codes: https://en.wikipedia.org/wiki/ANSI_escape_code

    是的, windows 的是这样的:
        color 0a    绿色字体
        color 0c    红色字体

    ANSI escape code

    ANSI escape sequences are a standard for in-band signaling to control
    cursor location, color, font styling, and other options on video text
    terminals and terminal emulators. Certain sequences of bytes, most starting
    with an ASCII Escape and bracket character followed by parameters, are
    embedded into text. The terminal interprets these sequences as commands,
    rather than text to display verbatim. ANSI sequences were introduced in the
    1970s to replace vendor-specific sequences and became widespread in the
    computer equipment market by the early 1980s.



---
2022-02-20


Pandoc 是一个免费开源的格式转换工具，可以用于各种标记格式文档之间的转换。Pandoc 被广泛用于书写工作和电子书籍出版流程。

apt install pandoc

pandoc 
    -f source-file format

    -t target-file format
    
    -s, --standalone
        Produce output with an appropriate header and footer (e.g.  a
        standalone HTML, LaTeX, TEI, or RTF file, not a fragment).
        
        This option is  set automatically  for  pdf,  epub,  epub3,  fb2, docx,
        and odt output.  For native output, this option causes metadata to be
        included; otherwise, metadata is suppressed.

    -o FILE, --output=FILE
        Write  output  to  FILE  instead of stdout.  If FILE is -, output will
        go to stdout, even if a non-textual format (docx, odt, epub2, epub3) is
        specified.


pandoc -f markdown -t html -s -o test.html



---

centos 网卡重新命名

1. 规则文件模板
    cp /usr/lib/udev/rules.d/60-net.rules /etc/udev/rules.d/
    修改此文件内容为:
        > ACTION=="add", SUBSYSTEM=="net", DRIVERS=="?*", ATTR{address}=="mac address", NAME="eth0"

2. 修改配置文件
    
    mv ifcfg-enp0s3  ifcfg-eth0     可以不用改，但是容易混淆
    NAME=eth0       // ifup ifdown
    DEVICE=eth0     // 系统启动时的名字

3. reboot

---

2022-02-22

ImageMagick

    debian repo里没有,需要手动安装

    wget https://www.imagemagick.org/download/ImageMagick.tar.gz

    centos repos 有


统一集中管理系统cronsun, 代替 crontab



---

2022-02-24

15 Free Windows 7 Tweaking(扭,拧,微调) Tools




---

2022-03-05

nslookup 在 bind-utils 包中



---

linux 回收站  ~/.locl/share/Trash/files/
              ~/.locl/share/Trash/info/
                每个被删除的文件的信息
                
                [Trash Info]
                Path=/home/liujiao/Desktop/jiachang.sh
                DeletionDate=2022-03-10T18:54:58

dcvviewer 的日志也在这个目录
    ~/.local/share/NICE/dcvviewer/

sidefx
    [19:10:35]liujiao@newcomer: ~/.local/share/sidefx$ tree
    .
    └── QtWebEngine
        └── Hserver
                └── Cookies

    Cookies: SQLite 3.x database







---


2022-03-19


pkg-config


apt install sshfs
sshfs user@ip:/path1 localpath

umount:
    fusermount -u /path/to/mount/point

---


2022-03-24

authconfig-tui



--- 


2022-03-31

gsettings 命令


houdinifx
    user        polkitd
    command     sesinetd




## avahi-daemon.service avahi-daemon.socket

systemctl stop avahi-daemon.service avahi-daemon.socket
systemctl disable avahi-daemon.service avahi-daemon.socket

/etc/avahi/

Zeroconf
Zero configuration networking(zeroconf)零配置网络服务规范，是一种用于自动生成可用IP地址的网络技术，不需要额外的手动配置和专属的配置服务器。

“零 配置网络服务”的目标，是让非专业用户也能便捷的连接各种网络设备，例如计算机，打印机等。整个搭建网络的过程都是通过程式自动化实现。如果没有 zeroconf，用户必须手动配置一些服务，例如DHCP、DNS，计算机网络的其他设置等。这些对非技术用户和新用户们来说是很难的事情。

Zeroconf规范的提出者是Apple公司.

Avahi
Avahi 是Zeroconf规范的开源实现，常见使用在Linux上。包含了一整套多播DNS(multicastDNS)/DNS-SD网络服务的实现。它使用 的发布授权是LGPL。Zeroconf规范的另一个实现是Apple公司的Bonjour程式。Avahi和Bonjour相互兼容。

Avahi允许程序在不需要进行手动网络配置的情况 下，在一个本地网络中发布和获知各种服务和主机。例如，当某用户把他的计算机接入到某个局域网时，如果他的机器运行有Avahi服务，则Avahi程式自 动广播，从而发现网络中可用的打印机、共享文件和可相互聊天的其他用户。这有点象他正在接收局域网中的各种网络广告一样。

Linux下系统实际启动的进程名，是avahi-daemon

除非你有兼容的设备或使用 zeroconf 协议的服务，否则应该关闭它。





内省(IntroSpector)是Java 语言针对 Bean 类属性、事件的一种缺省处理方法。　




---

2022-04-08

https://blog.csdn.net/weixin_33367083/article/details/114323657
mac 挂载 nfs 需要服务器开启 insecure 选项
    (/etc/exports) 这里的配置文件必须要加入 insecure 参数,否则Mac OS 一直报找不到服务器的错误。
    /nfsdata 192.168.22.1/26(rw,sync,insecure,no_root_squash)

    apt install nfs-kernel-server


windows 挂载 linux 系统

    [DiskInternals Linux Reader](https://www.diskinternals.com/linux-reader/)

    Data Recovery Software


mac 安装字体

    前往 / 应用程序 / 字体册 /
        菜单栏的文件 / 添加字体 / 打开(选择字体)


ps打开老是未响应 等待时间长

    进入ps cc 的安装文件夹，找到CRWindowsClientService.exe 删除掉试

    这个问题由 AdobeCreative Cloud辅助程序引起！
    Adobe Creative Cloud用于支持软件运行的相关功能，这个出现异常，可能是禁止网络或者延迟运行引起的，一般选择重新安装Adobe Creative Cloud即可解决！Adobe Creative Cloud同时检测软件的正版授权问题！
    简单处理方法：
    一、采用【Process 程序进程管理大师】把其拉入黑名单，彻底禁止运行！
    二、进入AdobePhotoshop CC 2019的安装文件夹，找到CRWindowsClientService.exe文件，右键【压缩并删除它】！


centos7挂载samba
    yum install cifs-utils
    mount -t cifs -o username=“root”,password=“” //ip/共享文件夹名字 /挂载点

    https://blog.csdn.net/ly2020_/article/details/90647086

    SMB（Server Message Block）又称CIFS(Common Internet File System),一种应用层
    网络传输协议（微软（Microsoft）和英特尔(Intel)在1987年制定的协议），由微软
    开发，主要功能是使网络上的机器能够共享计算机文件、打印机、串行端口和通讯等
    资源。






## 2022-08-12


shellcheck

mktemp
