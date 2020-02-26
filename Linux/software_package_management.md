## dpkg

deb软件包
将应用程序的二进制文件、配置文档、man/info帮助页面等文件合并打包在一个文件中，用户使用软件包管理器直接操作软件包，完成获取、安装、卸载、查询等操作

dpkg绕过apt包管理数据库对软件包进行操作，所以你用dpkg安装过的软件包用apt可以再安装一遍，系统不知道之前安装过了，将会覆盖之前dpkg的安装。

dpkg软件包相关文件介绍
/etc/dpkg/dpkg.cfg dpkg包管理软件的配置文件
/var/log/dpkg.log dpkg包管理软件的日志文件
/var/lib/dpkg/available 存放系统所有安装过的软件包信息
/var/lib/dpkg/status 存放系统现在所有安装软件的状态信息
/var/lib/dpkg/info 记安装软件包控制目录的控制信息文件

dpkg --unpack package-name 解开软件包到系统目录，但不进行配置

下面几个命令用于对软件包进行查询
    dpkg -I filename 查看软件说明(直接使用dpkg -l 查询所有安装的软件包，filename可以使用正则，我通常用```dpkg -l | grep "filename"因为会存在软件名记不住的情况)
    dpkg -L filename 查看package-name对应的软件包安装的文件及目录
    dpkg -s filename 查看package-name对应的软件包信息
    dpkg -S filename-pattern 从已经安装的软件包中查找包含filename的软件包名称


    -C|--audit [<package>...]        Check for broken package(s).
        audit 审计，查账

    -L|--listfiles <package>...      List files 'owned' by package(s).
        List files installed to your system from package-name.


    -l|--list [<pattern>...]         List packages concisely.
        dpkg -l     简洁的列出所有的软件包 concise
            Name
            Version
            Architecture
            Description



    -S|--search <pattern>...         Find package(s) owning file(s).
        dpkg -S "ssh"
        包含"*ssh*"的文件

    -s|--status [<package>...]       Display package status details.
        dpkg -s net-tools 

    
    --configure        <package>... | -a|--pending

        --configure package...|-a|--pending
              Configure a package which has been unpacked but not yet configured.  If -a or --pending is given instead of package, all unpacked but unconfigured packages are configured.

              To reconfigure a package which has already been configured, try the dpkg-reconfigure(8) command instead.

              Configuring consists of the following steps:

              1. Unpack the conffiles, and at the same time back up the old conffiles, so that they can be restored if something goes wrong.

              2. Run postinst script, if provided by the package.




    --triggers-only    <package>... | -a|--pending


    -r|--remove        <package>... | -a|--pending

        Remove  an  installed  package.   This  removes  everything  except  conffiles and other data cleaned up by the postrm script, which may avoid having to reconfigure the package if it is reinstalled later (conffiles are
              configuration files that are listed in the DEBIAN/conffiles control file).  If there is no DEBIAN/conffiles control file nor DEBIAN/postrm script, this command is equivalent to calling --purge.  If -a or  --pending  is
              given instead of a package name, then all packages unpacked, but marked to be removed in file /var/lib/dpkg/status, are removed.

              Removing of a package consists of the following steps:

              1. Run prerm script

              2. Remove the installed files

              3. Run postrm script




    -P|--purge         <package>... | -a|--pending

        Purge  an installed or already removed package. This removes everything, including conffiles, and anything else cleaned up from postrm.  If -a or --pending is given instead of a package name, then all packages unpacked
            or removed, but marked to be purged in file /var/lib/dpkg/status, are purged.

            Note: some configuration files might be unknown to dpkg because they are created and handled separately through the configuration scripts. In that case, dpkg won't remove them by itself, but the package's postrm script
            (which is called by dpkg), has to take care of their removal during purge. Of course, this only applies to files in system directories, not configuration files written to individual users' home directories.

            Purging of a package consists of the following steps:

            1. Remove the package, if not already removed. See --remove for detailed information about how this is done.

            2. Run postrm script.

    /var/lib/dpkg/status 中应该是所有的软件


    -R, --recursive
        Recursively handle all regular files matching pattern *.deb found at specified directories and all of its subdirectories. This can be used with -i, -A, --install, --unpack and --record-avail actions.

    -G     Don't install a package if a newer version of the same package is already installed. This is an alias of --refuse-downgrade.

    --admindir=dir
        Set the administrative directory to directory.  This directory contains many files that give information about status of installed or uninstalled packages, etc.  Defaults to «/var/lib/dpkg».

## apt-cache

apt-cache queries and displays available information about installed
and installable packages. It works exclusively on the data acquired
into the local cache via the 'update' command of e.g. apt-get. The
displayed information may therefore be outdated if the last update was
too long ago, 

Most used commands:
    showsrc - Show source records
    search - Search the package list for a regex pattern
    depends - Show raw dependency information for a package
    rdepends - Shows a listing of each reverse dependency a package has.
        哪些软件依赖你所写的软件
        apt-cache rdepends libc6
    show - Show a readable record for the package
    pkgnames - List the names of all packages in the system
    policy - Show policy settings
        软件来源 应该是 /etc/apt/sources.list 以及 PPA

    policy <pkg>
    madison <pkg>
        It displays available versions of a package in a tabular format.




## apt

简单来说就是：apt = apt-get、apt-cache 和 apt-config 中最常用命令选项的集合。

apt install         apt-get install         安装软件包
apt remove          apt-get remove          移除软件包
apt purge           apt-get purge           移除软件包及配置文件
apt update          apt-get update          刷新存储库索引
apt upgrade         apt-get upgrade         升级所有可升级的软件包
apt autoremove      apt-get autoremove      自动删除不需要的包
apt full-upgrade    apt-get dist-upgrade    在升级软件包时自动处理依赖关系
apt search          apt-cache search(这个好)        搜索应用程序从repository
apt show            apt-cache show(这个好)          显示安装细节(用来看已安装的软件),依赖关系
apt list                                    列出包含条件的包（已安装，可升级等）
        --upgradable
        --installed | wc -l
apt-cache depends [package]     了解使用依赖
apt edit-sources    编辑源列表 
apt-get check        检查是否有损坏的依赖
apt-cache pkgnames | grep xxx           repository 中有多少
    这个和apt list 差不太多

apt-cache policy [包]
    policy is meant to help debug issues relating to the preferences file. 
    With no arguments it will print out the priorities of each source. Otherwise it prints out detailed information about the priority selection of the named package.

apt-cache rdepends package_name
    显示软件包的反向依赖关系，即有什么软件包需依赖你所指定的软件包。

apt-get download icinga
    在当前的目录中下载包
apt-get source [包]
    causes apt-get to fetch source packages to current directory 


重新安装
　　$ sudo apt-get --reinstall install package_name

???
sudo apt-get clean && sudo apt-get autoclean # ——–清理下载文件的存档 && 只清理过时的包



显示包的更新日志
    sudo apt-get changelog apache2

虽然 apt 与 apt-get 有一些类似的命令选项，但它并不能完全向下兼容 apt-get 命令。也就是说，可以用 apt 替换部分 apt-get 系列命令，但不是全部。

apt 可以看作 apt-get 和 apt-cache 命令的子集, 可以为包管理提供必要的命令选项。


apt软件包相关文件介绍：
/etc/apt/sources.list 记录软件源的地址
/var/cache/apt/archives 已经下载到的软件包都放在这里


Super Cow Powers
apt-get moo
just joke,
https://unix.stackexchange.com/questions/92185/whats-the-story-behind-super-cow-powers

https://askubuntu.com/questions/309113/what-is-the-difference-between-dpkg-and-aptitude-apt-get

https://www.tecmint.com/difference-between-apt-and-aptitude/





## 源码

成功生成 Makefile后 我们只需要使用sudo make命令进行编译

编译成功后，使用sudo make install进行安装软件

不过源码安装的话，尽量将源码文件放在一个能找到的特定位置，一般的话Makefile也会提供uninstall，这样的话，当我们需要卸载软件时，可以到软件包中输入sudo make uninstall卸载软件。
也可以使用 ./configure --prefix='File Path'命令，将软件安装在File Path位置，这样可以方便删除。关于configure的更多参数可以查看软件包中列如ReadMe文件或INSTALL文件，一般有参数设置说明。








## apt-file

apt-file 是一个命令行界面的 APT 包搜索工具。当我们在编译源代码时，时有缺少文件的情况发生。
此时，通过 apt-file 就可以找出该缺失文件所在的包，然后将缺失的包安装后即可让编译顺利进行了。

安装apt-file
    apt install apt-file

更新apt-file的缓存
    **apt-file update**

搜索文件依赖(在安装WPS时，提示缺少libgthread-2.0.so.0)
    **apt-file search|find** libgthread-2.0.so.0
    apt-file search /bin/ls 只要包含 '/bin/ls' 即可
        /usr/bin/lsw
        /usr/bin/lss16toppm
        coreutils: /bin/ls
        ...

然后使用apt-get install可安装缺失的软件包


列出包中的文件
    **apt-file list|show** [包名]




Alien工具可以将RPM软件包转换成DEB软件包，或把DEB软件包转换成RPM软件包，以此适应兼容性的需要。注意首先请在系统中安装alien。



## apt-get 

-d, --download-only
    Download only; package files are only retrieved, not unpacked or installed.

apt-get -d install openssh
cd /var/cache/apt/archives
dpkg -i ./*
