
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





curl
    -I, --head
        (HTTP FTP FILE) Fetch the headers only!

        ```
        ➜  lca curl -I https://taobao.com
        HTTP/1.1 302 Found
        Server: Tengine
        Date: Wed, 17 Aug 2022 22:06:33 GMT
        Content-Type: text/html
        Content-Length: 258
        Connection: keep-alive
        Location: https://www.taobao.com/
        
        ```

        Tengine:
            是由淘宝网发起的Web服务器项目。它在Nginx的基础上，针对大访问量网站
            的需求，添加了很多高级功能和特性。```


rpm -ql nginx | grep index
    /usr/share/nginx/html/index.html



LAMP
    setenforce 0
    systemctl stop firewalld
    iptables -F

    1. apache
        yum install -y httpd
        systemctl restart httpd

    2. mysql

        yum install -y mariadb-server mariadb
        systemctl restart mariadb
        netstat -tanpu | grep 3306
        mysql -uroot -p
            默认没有密码
            
            use mysql;
            select host,user,password,authentication_string from user

    3. php

        yum install -y zlib-devel libxml2-devel libjpeg-devel libjpeg-turbo-devel libiconv-devel freetype-devel libpng-devel gd-devel libcurl-devel libxslt-devel libtool-ltdl-devel pcre pcre-devel apr apr-devel gcc make


    4. php 以及 php 连接 mysql 的驱动

        yum install -y php php-fpm php-mysql -y

    5. php 结合 apache
        
        php 不需要修改，只需要修改 apache 配置文件，支持 php 脚本的读取
        
        vim /etc/httpd/conf/httpd.conf
        
        DocumentRoot "/var/www/html" 下边添加如下内容
            TypesConfig /etc/mime.types
            AddType application/x-httpd-php .php
            AddType application/x-httpd-php-source .phps
            DirectoryIndex index.php index.xml
        systemctl restart httpd
    
        cd /var/www/html
            vim index.html
            ```
            <?php
                phpinfo();
            ```

    5. disuz
        
        1. 下载源码
            wget https://www.discuz.net/down/Discuz_X3.4_SC_UTF8_20220518.zip
            yum install unzip
            unzip Discuz_X3.4_SC_UTF8_20220518.zip -d 待解压到的目录
            
            把解压出来的 upload 中的文件拷贝到 /var/www/html/
            rsync -av upload/* /var/www/html/
            chmod 777 /var/www/html/*

        http://ip
            
            有些目录权限有问题
            chmod 777 -R /var/www/html/data
            chmod 777 -R /var/www/html/uc_server
            chmod 777 -R /var/www/html/uc_client
            


nginx

    yum install openssl openssl-devel
    ./configure --prefix=/opt/nginx1.16.0 --with-http_sub_module --with-http_ssl_module
    make && make install

    ```
    location / {
       root   html;                         // nginx 安装目录下的 html 文件夹, 这里是相对路径
       index  index.html index.htm;         // 首页文件名
    }
    ```

    nginx -t                                // 检查配置文件正确否

    nginx -s reload
        

    启动
        nginx


    基于端口的多虚拟主机

        10.0.0.1:80/index.html
            +                                   +
            +------------------->Server---------+
            +                                   +
        www.a.com(81)


        conf 中一个 server 就是一个网站

        ```
        http{
            server {
                listen  80;
                server_name  localhost;   网站域名
                access_log   logs/host.access.log  main;
                location / {
                   root   /var/www/html1;
                   index  index.html index.htm;
                }
            }
                
            server {
                listen  81;
                server_name  localhost;   网站域名
                access_log   logs/host.access.log  main;        // 也可以写在外边，作为全局设置
                location / {
                   root   /var/www/html2;
                   index  index.html index.htm;
                }
        }
        ```


nginx 代理服务
    
    nginx 只是代理静态资源，动态资源会发送给后端的程序

    ```
    server {

        location / {
            proxy_pass https://www.baidu.com;
        }
    }
    ```


## Ansible

DEV     开发环境
QA      测试环境
UAT     预生产环境
Prod    生产环境


1. control machine
    inventory file      // 主机列表文件
    playbook            // 脚本
    ssh 协议

2. managed node


ansible 的编排引擎

不需要安装客户端软件(no agent), 使用 yaml 配置文件语法
不用root
主要由 python 的 paramiko, PyYAML 模块

Ansible 实践

    安装软件
        1. client
            ansible 所需的系统模块
            yum install -y libselinux-python    很多使用 SELinux API 的程序都需要这个库
        
        2. Server
            yum install -y epel-release
            yum install -y ansible
            yum install -y libselinux-python    很多使用 SELinux API 的程序都需要这个库
            rpm -ql ansible | grep -E '^/etc|^/usr/bin'

            ansible --version

            /etc/ansible/ansible.cfg
            /etc/ansible/hosts              // 被管理主机信息
                1. 纯IP
                2. 主机名
                3. group
                    [cfx]
            /etc/ansible/

    ansible 管理方式
        1. 密码认证
            ansible 主机列表 -m 模块 -a 命令 -k -u root
                -m MODULE_NAME, --module-name MODULE_NAME module name to execute (default=command)
                -a MODULE_ARGS, --args MODULE_ARGS module arguments
                -k, --ask-pass        ask for connection password
                -u REMOTE_USER, --user REMOTE_USER connect as this user (default=None)

        2. 免密登录
            1. ansible 自带的密码
                ansible_host
                ansible_port
                ansible_user
                ansible_ssh_pass
                
                ``` /etc/ansible/hosts
                [cfx]
                1.0.0.1  ansible_user=root  ansible_ssh_pass=123 
                ```
                ansible 主机列表 -m 模块 -a 命令

            2. ssh 密钥方式
                
                ssh-keygen -f ~/.ssh/id_rsa -P "" >/dev/null 2>&1

                编写公钥分发脚本

                ```ssh_distribute.sh
                #rm -rf ~/.ssh/id_rsa*
                #ssh-keygen -f ~/.ssh/id_rsa -P "" >/dev/null 2>&1
                SSH_PASS=111
                Key_Path=~/.ssh/id_rsa.pub
                for ip in 110 111;do
                    sshpass -p$SSH_PASS ssh-copy-id -i $Key_Path "-o StrictHostKeyChecking=no" 1.0.0.$ip
                done
                ```
                sshpass - Non-interactive ssh password authentication
                
                ansible 主机列表 -m 模块 -a 命令

    ansible 模式与名令
        1. ansible 纯命令行实现的批量管理，即 ad-hoc 模式
            列出所有模块
                ansible-doc -l
            
            某个模块的用法
                ansible-doc -s
                    -s, --snippet         Show playbook snippet for specified plugin(s)
                    ansible-doc -s command

            

        2. 利用 ansible playbook 实现批量管理



    ansible 模块
        1. command

        chdir:                 Change into this directory before running the command.
        creates:               A filename or (since 2.0) glob pattern. If it already exists, this step *won't* be run.
        removes:               A filename or (since 2.0) glob pattern. If it already exists, this step *will* be run.
        free_form:             The command module takes a free form command to run. There is no actual parameter named 'free form'.
        warn:                  Enable or disable task warnings.

        使用 command 模块，不能使用 shell 变量，不能出现特殊符号 > < | ; & ..., 可以使用 shell 模块

            1. 获取负载情况
                ansible cfx -m command -a 'uptime'

            2. 打印当前工作目录
                ansible cfx -m command -a 'pwd chdir=/tmp'

            3. creates
                ansible cfx -m command -a 'pwd  create=/root/hello'
                ???ansible cfx -m command -a '"echo hello ansible>hello" create=/root/hello'
                shell 模块可以
            
            4. remove
                ansible cfx -m command -a 'rm /root/hello removes=/root/hello'

            5. warn
                ansible cfx -m command -a 'chmod 000 /etc/hosts warn=false'

    2. shell 模块
        
        chdir:                 Change into this directory before running the command.
        creates:               A filename, when it already exists, this step will *not* be run.
        removes:               A filename, when it does not exist, this step will *not* be run.
        warn:                  Whether to enable task warnings.


        1. 查询进程信息
            ansible cfx -m shell -a 'ps -ef | grep vim | grep -v grep'

        2. 批量执行脚本
            该脚本必须在**客户端**机器上存在

            ansible cfx -m shell -a "mkdir -p /server/myscripts/; echo 'hostname'>/server/myscripts/hostname.sh;chmod +x /server/myscripts/hostname.sh; bash /server/myscripts/hostname.sh"

    3. script 模块
        把管理机器上的脚本传输到被管理机器上执行
        Runs a local script on a remote node after transferring it

        chdir:                 Change into this directory on the remote node before running the script.
        cmd:                   Path to the local script to run followed by optional arguments.
        creates:               A filename on the remote node, when it already exists, this step will *not* be run.
        decrypt:               This option controls the autodecryption of source files using vault.
        executable:            Name or path of a executable to invoke the script with.
        free_form:             Path to the local script file followed by optional arguments.
        removes:               A filename on the remote node, when it does not exist, this step will *not* be run.

        echo -e "pwd\nhostname">/root/my.sh
        ansible cfx -m script -a '/root/my.sh'


## jumpserver

github.com/jumpserver
jumpserver.org

跳板机 堡垒机

堡垒机:跳板机的升级

堡垒机4A能力
    1. 身份鉴别
    2. 帐号管理
    3. 权限控制
    4. 安全审计

MFA
    全局开启
    部分开启



跳板机的缺点：仅仅实现了服务器的安全登录，但是没有实现行为操控和审计
优点: 集中式对服务器基尼向那个管理

审计也只是事后行为
只有实现了事先控制，才能减少事故的发生


新的版本是 python3 开发的

4核 16G 50G硬盘

    python3     >= 3.6.x
    mysql       >= 5.6
    marial      >= 5.6
    redis

### 组件构成

1. core

    现指 Jumpserver 管理后台,是核心组件,使用 Django Class Based View 风格开发,
    支持 Restful API

2. LINA

    前段模块，负责页面的展示

3. Luna

    现在是 Web terminal 前端, 后期该组件可能会被 LINA 合并

4. Coco/Koko

    实现了 SSH Server 和 Wweb Terminal Server 的组件, 提供 SSH 和 WebSocket 接
    口，使用 Paramiko 和 Flask 开发

5. Guacamole(瓜)
    
    Apache 跳板机项目，Jumpserver 使用其组件实现 RDP 功能


### 部署 jumpserver

安装环境

    1. 物理机
    2. 虚拟机
    3. 公有云

安装环境评估
    
    1. 主机容量评估
        CPU/RAM
        4核16G 200G硬盘
        >centos7

    2. 存储空间评估
        100台Linux虚拟机资产,200G可以存储5个月的录像
        每小时产生录像大小(linux和windows平均值): 10MB
        
        2222 Jumpserver 终端接口

    3. 复杂性评估
        高可用


#### 步骤


1. 关闭防火墙
    iptables -F
    systemctl stop firewalld
    setenforce 0
    sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

2. 更改主机名
    hostnamectl set-hostname server_jumpserver01

3. 换源

4. 依赖
    yum install -y unzip vim wget expect net-tools nc nmap tree dos2unix iftop iotop telnet sl psmisc nethogs glances bc ntpdate openldap-devel bash-completion

    yum install -y git python-pip gcc automake autoconf python-devel sshpass readline-devel

5. 系统字符集
    localdef -c -f UTF-8 -i zh_CN zh_CN.UTF-8
    export LC_ALL=zh_CN.UTF-8
    echo  LC_ALL=zh_CN.UTF-8>>/etc/locale.conf
    locale

6. 数据库
    官网查询下载安装包
    wget https://downloads.mysql.com/archives/get/p/23/file/MySQL-5.6.51-1.el7.x86_64.rpm-bundle.tar        // rpm 套件报
    tar xf x.tar -C ./mysql5.6.51_rpm
    yum localinstall ./*

    /etc/my.cnf
    ```
    [mysqld]
    datadir=/var/lib/mysql

    [mysqld_safe]
    log-error=/var/log/mariadb/mariadb.log          // 为啥是 mariadb??? 需要将 mariadb 改成 mysql ， 否则报错...
    pid-file=/var/run/mariadb/mariadb.pid
    ```

    The server quit without updating PID file (/var/lib/mysql/server_jumpserver01.pid).

    初始root密码是随机的， ~/.mysql_secret, 这个密码是不能用的，必须要使用下面的命令进行修改

    mysqladmin -uroot -p上边的密码 password  newpassword

    ```
    create database jumpserver default charset 'utf8' collate 'utf8_bin'
    create user 'jumpserver‘@’%' identifiedy by '111'
    grant all privileges on jumpserver.* to 'jumpserver'@'%'
    flush privileges
    ```

7. python

    yum install -y zlib zlib-devel
    yum install -y openssl openssl-devel
    wget https://mirrors.huaweicloud.com/python/3.6.9/Python-3.6.9.tar.xz
    ./configure --prefix=/opt/python3.6.9
    make && make install

    虚拟环境

        虚拟环境工具 virtualenv

        pip3 install virtualenv

        WARNING: pip is configured with locations that require TLS/SSL, however the ssl module in Python is not available.

        第一种解决方案:(不推荐，下边使用 virtualenv 还会有问题)
            
            mkdir -p ~/.pip
            vim ~/.pip/pip.conf
            ```
            [global]
            index-url = https://mirrors.aliyun.com/pypi/simple/
            
            [install]
            trusted-host = mirrors.aliyun.com
            ```

        第二种解决方案
            **首先安装 openssl openssl-devel 重新编译安装**

        使用 virtualenv 创建 python3 解释环境
            virtualenv --python=python3 /opt/python_env/jumpserver_env_py3

        激活虚拟环境
            source /opt/python_env/jumpserver_env_py3/bin/active
            实际是添加了环境变量
        退出虚拟环境
            deactivate

8. redis 内存型数据库
    yum install redis
        redis.x86_64 0:3.2.12-2.el7
        jemalloc.x86_64 0:3.6.0-1.el7

    systemctl restart redis
    netstat -talnpu | grep 6379

    redis-cli
    ping

9. jumpserver

    github 也是到官网下载
    wget https://cdn0-download-offline-installer.fit2cloud.com/jumpserver/jumpserver-offline-installer-v2.25.1-amd64-65.tar.gz?Expires=1663502665&OSSAccessKeyId=LTAI5tLEMt8jTT4RDrZ9mXns&Signature=WT0n52p%2FIf1s3JIZP2AzlvHtgj8%3D


    wget https://github.com/jumpserver/jumpserver/releases/download/v2.1.0/jumpserver-v2.1.0.tar.gz

    tar xf x.tar.gz -C /opt/
    ln -s /opt/jumpserver-v2.1.0 /opt/jumpserver
    
    安装运行 jumpserver 所需要的模块(因为是python)

    python-ldap 依赖 lber.h
    yum install -y openldap-devel

    1. /opt/jumpserver/requirements/requirements.txt
        激活虚拟环境
        pip3 install -r requirements.txt
        国内的源有些包是没有的，还是得用官方源


    2. cp /opt/jumpserver/config_example.yml /opt/jumpserver/config.yml
    ```
    SECRET_KEY:
    BOOTSTRAP_TOKEN:

    DB_ENGINE: mysql
    DB_HOST: 127.0.0.1
    DB_PORT: 3306
    DB_USER: jumpserver
    DB_PASSWORD:                // 要修改这个
    DB_NAME: jumpserver

    HTTP_BIND_HOST: 0.0.0.0
    HTTP_LISTEN_PORT: 8080
    WS_LISTEN_PORT: 8070

    REDIS_HOST: 127.0.0.1
    REDIS_PORT: 6379
    ```

    生成 SECRET_KEY
        SECRET_KEY=$(cat /dev/urandom | tr -dc A-Za-z0-9 | head -c 50)
        echo "SECRET_KEY=$SECRET_KEY" >> ~/.bashrc

    生成 TOKEN
        BOOTSTRAP_TOKEN=$(cat /dev/urandom | tr -dc A-Za-z0-9 | head -c 50)
        echo "BOOTSTRAP_TOKEN=$BOOTSTRAP_TOKEN" >> ~/.bashrc

10. 生成库表信息
    
    python3 /opt/jumpserver/apps/manager.py makemigrations
    (注意:把config.yml中纯数字参数加引号   比如我的mysql密码就是纯数字  所以报错了)
    python3 /opt/jumpserver/apps/manager.py migrate

11. 启动 jumpserver 服务
    /opt/jumpserver/jms start -d

    1.1.1.1:8080

    此时还需要部署 CoCo/KoKo

12. KoKo

    KoKo 是 go 开发的，效率更高

    web terminal

    wget https://github.com/jumpserver/koko/releases/download/v2.1.0/koko-v2.1.0-linux-amd64.tar.gz

    tar xf x.tar.gz -C /opt/
    ln -s /opt/kokoxxx /opt/koko

    cp config_example.yml config.yml
    vim config.yml
    ```
    CORE_HOST: http://127.0.0.1:8080            // Jumpserver项目的url, api请求注册会使用. jumpserver 的config HTTP_LISTEN_PORT
    BOOTSTRAP_TOKEN:
    LOG_LEVEL: INFO
    REDIS_HOST: 127.0.0.1
    REDIS_PORT: 6379
    REDIS_PASSWORD:         // 没有设置，为空
    REDIS_CLUSTERS:
    REDIS_DB_ROOM:
    ```

    启动 koko
        ./koko -d
    日志信息
        tail -f /opt/koko/data/logs/koko.log
        ssh 2222端口
        http 5000端口








13. Guacamole

    vnc rdp 工具
    java 开发

    wget https://github.com/jumpserver/docker-guacamole-v1/archive/refs/tags/v2.1.0.tar.gz

    tar xf xxx
    cd xxx

    tar xf guacamole-server-1.2.0.tar.gz

    cd guacamole-server-1.2.0
        1. 查看官网，安装依赖
            yum install -y cairo-devel libjpeg-turbo-devel libjpeg-devel libpng-devel libtool uuid-devel

        2. 安装 ffmpeg(nux 源)
            yum install -y ffmpeg ffmpeg-devel
            ffmpeg -version

        3. 安装 guacamole
            ./configure --with-init-dir=/etc/init.d
            make && make install

        4. java 环境
            yum install -y java-1.8.0-openjdk

        5. tomcat
            wget https://mirror.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-9/v9.0.65/bin/apache-tomcat-9.0.65.tar.gz --no-check-certificate
            tar apache-tomcat-9.0.65.tar.gz -C /opt/
            ln -s /opt/apache-tomcat-9.0.65 /opt/tomcat9

        6. 创建运行 guacamole 所需的文件夹
            mkdir -p /config/guacamole/extensions /config/guacamole/record /config/guacamole/drive
            chown daemon:daemon /config/guacamole/*

        7. 部署 guacamole 和 tomcat 工具的结合
            rm -rf /opt/tomcat9/webapps/*
            sed -i 's/Connector port="8080"/Connector port="8081"/g' /opt/tomcat9/conf/server.xml
            echo "java.util.logging.ConsoleHandler.encoding = UTF-8" >> /opt/tomcat9/conf/logging.properties
            ln -s /root/docker-guacamole-v1-2.1.0/guacamole-1.0.0.war /opt/tomcat9/webapps/ROOT.war
            ln -s /root/docker-guacamole-v1-2.1.0/guacamole-auth-jumpserver-1.0.0.jar /config/guacamole/extensions/guacamole-auth-jumpserver-1.0.0.jar
            ln -s /root/docker-guacamole-v1-2.1.0/root/app/guacamole/guacamole.properties /config/guacamole/guacamole.properties

        8. 设置 guacamole 的运行环境变量
        ```
        export JUMPSERVER_SERVER=http://127.0.0.1:8080
        echo "export JUMPSERVER_SERVER=http://127.0.0.1:8080" >> ~/.bashrc
        export BOOTSTRAP_TOKEN=bKrMbBOvk3ijop0OtiMiNtGpivtIH1NeZxvql5mWmyiMAL5aEN
        echo "export BOOTSTRAP_TOKEN=bKrMbBOvk3ijop0OtiMiNtGpivtIH1NeZxvql5mWmyiMAL5aEN" >> ~/.bashrc
        export JUMPSERVER_KEY_DIR=/config/guacamole/keys
        echo "export JUMPSERVER_KEY_DIR=/config/guacamole/keys" >> ~/.bashrc
        export GUACAMOLE_HOME=/config/guacamole
        echo "export GUACAMOLE_HOME=/config/guacamole" >> ~/.bashrc
        export GUACAMOLE_LOG_LEVEL=ERROR
        echo "export GUACAMOLE_LOG_LEVEL=ERROR" >> ~/.bashrc
        export JUMPSERVER_ENABLE_DRIVE=true
        echo "export JUMPSERVER_ENABLE_DRIVE=true" >> ~/.bashrc
        ```

        启动 guacamole
        /etc/init.d/guacd start

        启动 tomcat
            /opt/tomcat9/bin/startup.sh


    tar xf ssh-forward.tar.gz

14. Lina 
    负责页面的展示

    yum install -y nginx

    wget https://github.com/jumpserver/lina/releases/download/v2.1.0/lina-v2.1.0.tar.gz

    tar xf lina-v2.1.0.tar.gz
    chown nginx:nginx lina-v2.1.0

15. luna

    wget https://github.com/jumpserver/luna/releases/download/v2.1.1/luna-v2.1.1.tar.gz
    tar xf luna-v2.1.1.tar.gz

16. nginx
    处理静态文件
    对jumpserver 后台程序的反向代理

    ```
vim /usr/local/nginx/conf.d/jump.conf
 
 
server {
    listen 80;
 
    client_max_body_size 100m;  # 录像及文件上传大小限制
 
    location /ui/ {
        try_files $uri / /index.html;
        alias /usr/local/jump/lina/;            // 需要该路径
    }
 
    location /luna/ {
        try_files $uri / /index.html;
        alias /usr/local/jump/luna/;  # luna 路径           // 需要该路径
    }
 
    location /media/ {
        add_header Content-Encoding gzip;
        root /usr/local/jump/jumpserver/data/;  # 录像位置          // 需要该路径
    }
 
    location /static/ {
        root /usr/local/jump/jumpserver/data/;  # 静态资源          // 需要该路径
    }
 
    location /koko/ {
        proxy_pass       http://localhost:5000;
        proxy_buffering off;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        access_log off;
    }
 
    location /guacamole/ {
        proxy_pass       http://localhost:8081/;
        proxy_buffering off;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection $http_connection;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        access_log off;
    }
 
    location /ws/ {
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_pass http://localhost:8070;
        proxy_http_version 1.1;
        proxy_buffering off;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
    }
 
    location /api/ {
        proxy_pass http://localhost:8080;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
 
    location /core/ {
        proxy_pass http://localhost:8080;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
 
    location / {
        rewrite ^/(.*)$ /ui/$1 last;
    }
}
    ```

浏览器打开
    默认用户名密码: admin/admin


koko 无法启动问题


systemctl restart mysql
systemctl restart redis
source /opt/python_env/jumpserver_env_py3/bin/activate
/opt/jumpserver/jms start -d
/opt/koko/koko -d
/etc/init.d/guacd start
/opt/tomcat9/bin/startup.sh
nginx


防火墙规则，只允许 jumpserver 登录
    iptables -A INPUT -s [jumpserver-ip] -p tcp --dport 22 -j ACCEPT
    iptables -A INPUT -p tcp --dport 22 -j REJECT






系统设置
    Email 主题前缀


管理用户:
    被管理机器上的root帐号，或者有 sudo 权限的用户

    管理用户是资产（被控服务器）上的 root，或拥有 NOPASSWD: ALL sudo 权限的用户，
    JumpServer 使用该用户来 `推送系统用户`、`获取资产硬件信息` 等。

    linux 上的 root 用户

    通过 ansible 推送系统用户, windows 需要添加 ssh 组件

纳管公有云 XPACK
    企业授权

密码管理
    系统用户登录模式
        自动: jumpserver 托管
            生成密钥: 只有 jumpserver 知道密码
                XPACK 可以查看
            不生成密钥
        手动: 手动创建,输入密码


系统用户
    登录资产的用户, 会在被管理机器上创建这个帐号

    linux 上的普通用户

    手动登录：
        要提前在系统上创建好帐号

可以根据资产树进行授权

资产和系统用户绑定



命令行跳板机
    koko


资产
    基本资产
        服务器
        网络设备
        虚拟机

    应用
        远程应用: 需要企业 license
        数据库




### 用户

管理员
普通用户
审计员


### 安全升级

操作系统
Jumpserver
依赖软件


### 强化密码

推荐开启 MFA
密码强度


## 同步 pypi 源

bandersnatch
用最新的 python3 环境，
pip3 install bandersnatch

[官方文档](https://readthedocs.org/projects/bandersnatch/downloads/pdf/latest/)

http://t.zoukankan.com/lovesKey-p-14160177.html


配置文件
    /etc/bandersnatch.conf

    proxy=1.1.1.1:1
    download-mirror=https://pypi.tuna.tsinghua.edu.cn/simple

 It will populate your mirror with the current status of all PyPI packages.
 Current mirror package size can be seen here: https://pypi.org/stats/
    All of PyPI 13.0 TB

https://morioh.com/p/8b06c19fc4dc
https://opendev.org/opendev/system-config/commit/85297878f56783e24ade39771ce1b6df4d18da08
