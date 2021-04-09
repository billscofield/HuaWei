System call: 系统调用 通过系统调用可以来使用底层的硬件 Library call: 库调用
    这里就是将底层硬件的功能抽象成个一个一个的库文件
    这样，程序员开发程序的时候，只需要考虑库文件如何使用，不需要考虑底层硬件的具体信息
    C语言

C语言库
    规范: POSIX(Portable Operating System Interface of Unix)
    只有开发程序所使用的C库遵循POSIX规范，那么就可以跨平台


API: Application Programing Interface 应用程序接口
    是程序开发的时候需要调用的接口
    其实就是一些独立的库文件

ABI: Application Binary Interface, 应用程序二进制接口
    这是应用程序运行时


API & ABI
    https://www.jianshu.com/p/895451c7b678




|    通用接口
|       /|\                    System call
|        |                         |
|        |                         |
|        |                         |
|    +----------------------+      |
|    |   Library Call       |     \|/
|    +----------------------+------------+
|    |   OS                              |
|    +-----------------------------------+
|    |   网卡 声卡   等硬件              |
|    +-----------------------------------+



独立的库文件(共享库文件)
    /lib, /lib64
    /usr/lib, /usr/lib64
    /usr/local/lib, /usr/local/lib64

    so(shared object)

集成在程序内部
    
    

链接库文件
    编译之后，会生成一张表，记录了程序运行所需要的共享库的文件名以及所在位置



## 一个程序包含的基结构

1. 二进制程序
    /bin, /sbin
    /usr/local/bin,/usr/local/sbin
    /usr/bin,/usr/sbin

2. 头文件
    /usr/include
    /include

3. 依赖的库
    /lib, /lib64
    /usr/lib, /usr/lib64
    /usr/local/lib, /usr/local/lib64

    非标准位置
        /etc/ld.so.conf
        ```
        include /etc/ld.so.conf.d/*.conf    
        将自己的目录添加到这里, 或者放到上边的那个目录下
        ```

    ldd - print shared object dependencies
    ldd   prints the shared objects (shared libraries) required by each program
        or shared object specified on the command line.  An example of its use and
        output is the following:
        
        显示某个程序所依赖的库, 要使用命令的绝对路径
            ldd /bin/cat



4. 配置文件

5. 帮助文件
    /etc/manpath.config(Debian buster)
    /etc/man_db.conf(centos7)

    帮助手册的位置: /usr/local/share/man

    方法一:
        修改 /etc/manpath.conf

    方法二:
        将man文件放到 系统定义的man路径


windows安装软件
    注册表
        记录了每个软件生成的文件的所在位置
        卸载软件: 扫描注册表, 将软件的文件全部找出来，并删除



卸载linux软件时，我们可以一个一个的将软件创建的文件进行删除，但是太不智能了

## Linu 软件管理工具

rpm (redhat package manager)
    1. 类似于windows的注册表, 记录了系统中的全部已经安装的软件信息
    1. 可以将源代码程序制作成二进制格式的安装包
    1. 安装卸载软件


软件的依赖关系
    
软件类别
    源代码软件包
        需要先编译

    二进制软件包
        被编译好的软件，可以直接安装


源代码软件命名格式
    name-major-minor.release.arch.tar.gz


二进制软件包命名格式
    软件名-主版本好-次版本号.发行版本.rpm
        E nterprise L inux（EL）的缩写

    rpm -ivh 软件包
    rpm -e   软件

    开发者仅仅开发的程序的源码，二进制格式是由开源社区制作来的


## 软件安装方式

1. 使用包管理器 rpm
    缺点
        软件更新不及时
        不是所有的软件都有二进制格式
        可定制化较差，例如目录
        软件来源不一定安全
        **存在依赖关系问题**
    

1. 使用源码方式安装
    优点
        安装过程完全可控
        编译过程较慢
        容易出错
        存在依赖关系问题

1. 使用yum方式
    其实也是调用 rpm 进行安装，会自动解决软件的依赖问题

1. 使用简单二进制格式(类似于绿色安装)



rpm 组成
    主包
        软件名-version.rpm
    支包
        软件包-扩展名-version.rpm


    一个程序依赖另一个程序，其实就是依赖那个程序的头、库文件
    通常程序的头文件和库文件位于程序的一个支包，通常是  软件名-devel-version.rpm


获取rpm包方式
    1. 光盘  /dev/sr0   package目录
    1. 官网、镜像站点   (基本包)
    1. http://rpmfind.net   
    1. epel源(扩展或相对较新的)



## RPM

-i              --install
-v              显示安装过程
-h              用hash表示进度
--test          仅仅测试, 不进行真正安装
    rpm -ivh --test
    只有 preparing...阶段，没有安装阶段
--nodeps        忽略依赖关系强制安装, 大部分情况不能使用
--replacepkgs   覆盖安装
    rpm -ivh --replacepkgs ...
    因为直接安装会提示已安装
    如果程序的某个文件进行过修改，覆盖安装的时候，不会覆盖被修改过的文件(centos6)
    如果文件发生过修改，重新生成的文件会被重新命名，格式 name.rpmnew

--ignoreos      忽略系统的版本号, 默认 el6 只能安装在 el6 上

--nosignature   不检查软件包来源的可靠性
--nodigest      不检查软件包的完整性, 内容是否被修改过
--noscripts     安装软件的时候，不执行脚本
    安装卸载软件前后的步骤
        安装前脚本
        安装后脚本
        卸载前脚本: 关闭服务
        卸载后脚本: 删除



安装过程
    preparing...阶段
    安装阶段






### 升级

-U --upgrade
    软件已经存在，则升级
    软件不存在，则安装

    -Uvh

-F --freshen
    软件已经存在，则升级
    软件不存在，不会安装

    -Fvh

--oldpackage    将软件降低到指定的版本

--force         强制升级



不要对内核进行升级(以免系统无法启动), 而是安装一个新的内核
在升级软件的时候，旧软件的配置文件修改过，不会直接覆盖，而是创建重命名的配置文件 name.rpmnew


### 查询

rpm -q 软件名

    ---

    对已经安装的软进行查询 

    使用软件名

    -a, -all 所有已安装的
        rpm -qa | grep "openssh"
    -f 显示一个文件是由那个软件生成的
        rpm -qf /etc/ssh/sshd_config
            
    --whatprovides  查看指定的能力是由哪个软件生成的，库文件，头文件，配置文件   
        rpm -qf /bin/cat
        rpm -q --whatprovides /bin/cat
            
        在大多数情况下 --whatpprovides 和 -f 一样
     
    --whatrequires  查看指定的能力是被谁需要的
        rpm -q --whatrequires /bin/ls
        rpm -q --whatrequires /etc/ssh/sshd_config
        
    --changelog 软件名
        rpm包的更新日志，而不是源码的更新日志
        
        rpm -q --changelog xinetd



    -c 显示软件安装后的配置文件位置
        rpm -qc xinetd

    -d 显示帮助手册的位置
        rpm -qd xinetd

    -l 显示软件的全部文件列表
        目录和文件
        rpm -ql xinetd

    -i, --info 显示软件包的描述信息
        rpm -qi xinetd
        
        Version:
        Release:
        Group： 软件包组
        Signature:
        Packager: 制作者

    -L 仅仅显示 license 信息

    --scripts
        rpm -q --scripts xinted


    ---

    对未安装的软件进行查询

    使用软件包名

    -p， --packagea

        rpm -qpi /mnt/Packages/xinted-2.3...


### 卸载

    -e, --erase [--test] [--noscripts] [--nodeps] 软件名

    

    


QUERYING AND VERIFYING PACKAGES:
    rpm {-q|--query} [select-options] [query-options]

    rpm {-V|--verify} [select-options] [verify-options]

INSTALLING, UPGRADING, AND REMOVING PACKAGES:
    rpm {-i|--install} [install-options] PACKAGE_FILE ...

    rpm {-U|--upgrade} [install-options] PACKAGE_FILE ...

    rpm {-F|--freshen} [install-options] PACKAGE_FILE ...

    rpm {-e|--erase} [--allmatches] [--justdb] [--nodeps] [--noscripts]
    [--notriggers] [--test] PACKAGE_NAME ...

MISCELLANEOUS:
    rpm {--querytags|--showrc}

    rpm {--setperms|--setugids} PACKAGE_NAME ...

select-options
    [PACKAGE_NAME] [-a,--all] [-f,--file FILE]

    [-g,--group GROUP] {-p,--package PACKAGE_FILE]
    [--hdrid SHA1] [--pkgid MD5] [--tid TID]
    [--querybynumber HDRNUM] [--triggeredby PACKAGE_NAME]
    [--whatprovides CAPABILITY] [--whatrequires CAPABILITY]

query-options
    [--changelog] [-c,--configfiles] [--conflicts]
    [-d,--docfiles] [--dump] [--filesbypkg] [-i,--info]
    [--last] [-l,--list] [--obsoletes] [--provides]
    [--qf,--queryformat QUERYFMT] [-R,--requires]
    [--scripts] [-s,--state] [--triggers,--triggerscripts]

verify-options
    [--nodeps] [--nofiles] [--noscripts]
    [--nodigest] [--nosignature]
    [--nolinkto] [--nofiledigest] [--nosize] [--nouser]
    [--nogroup] [--nomtime] [--nomode] [--nordev]
    [--nocaps] [--noconfig] [--noghost]

install-options
    [--allfiles] [--badreloc] [--excludepath OLDPATH]
    [--excludedocs] [--force] [-h,--hash]
    [--ignoresize] [--ignorearch] [--ignoreos]
    [--includedocs] [--justdb] [--nocollections]
    [--nodeps] [--nodigest] [--nosignature] [--noplugins]
    [--noorder] [--noscripts] [--notriggers]
    [--oldpackage] [--percent] [--prefix NEWPATH]
    [--relocate OLDPATH=NEWPATH]
    [--replacefiles] [--replacepkgs]
    [--test]
