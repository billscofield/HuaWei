## dpkg

deb软件包
将应用程序的二进制文件、配置文档、man/info帮助页面等文件合并打包在一个文件中，用户使用软件包管理器直接操作软件包，完成获取、安装、卸载、查询等操作

dpkg绕过apt包管理数据库对软件包进行操作，所以你用dpkg安装过的软件包用apt可以再安装一遍，系统不知道之前安装过了，将会覆盖之前dpkg的安装。

dpkg软件包相关文件介绍
    /etc/dpkg/dpkg.cfg          dpkg包管理软件的配置文件
    /var/log/dpkg.log           dpkg包管理软件的日志文件

    /var/lib/dpkg/available     存放系统所有安装过的软件包信息文件
    /var/lib/dpkg/status        存放系统现在所有安装软件的状态信息文件
        dpkg -s 软件包
    /var/lib/dpkg/info          记安装软件包控制目录的控制信息文件

下面几个命令用于对软件包进行查询

    dpkg -I filename 查看软件说明(直接使用dpkg -l 查询所有安装的软件包，filename可以使用正则，我通常用```dpkg -l | grep "filename"因为会存在软件名记不住的情况)

    dpkg -L filename 查看package-name对应的软件包安装的文件及目录
    dpkg -s filename 查看package-name对应的软件包信息
    dpkg -S filename-pattern 从**已经安装的软件包中**查找包含filename的软件包名称


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
        直接写文件名，不要包含路径

    -s|--status [<package>...]       Display package status details.
        dpkg -s net-tools 


    dpkg --unpack package-name 
        解开软件包到系统目录，但不进行配置

    
    --configure        <package>... | -a|--pending

        --configure package...|-a|--pending
            Configure a package which has been unpacked but not yet configured.  
            If -a or --pending is given instead of package, all unpacked but unconfigured packages are configured.

            To reconfigure a package which has already been configured, try the **dpkg-reconfigure**(8) command instead.

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



    -p, --print-avail package-name...
        Display details about package-name, as found in
        /var/lib/dpkg/available. 
        Users of APT-based frontends should use apt-cache show package-name instead.


    -P|--purge         <package>... | -a|--pending

        Purge  an installed or already removed package. This removes everything, including conffiles, and anything else cleaned up from postrm.  

            **If -a or --pending is given instead of a package name, then all packages unpacked or removed, but marked to be purged in file /var/lib/dpkg/status, are purged.**

            Note: some configuration files might be unknown to dpkg because they are created and handled separately through the configuration scripts. In that case, dpkg won't remove them by itself, but the package's postrm script
            (which is called by dpkg), has to take care of their removal during purge. Of course, this only applies to files in system directories, not configuration files written to individual users' home directories.

            Purging of a package consists of the following steps:

            1. Remove the package, if not already removed. See --remove for detailed information about how this is done.

            2. Run postrm script.

    /var/lib/dpkg/status 中应该是所有的软件


    -R, --recursive
        Recursively handle all regular files matching pattern *.deb found at specified directories and all of its subdirectories. This can be used with -i, -A, --install, --unpack and --record-avail actions.

    -G  Don't install a package if a newer version of the same package is already installed. 
        This is an alias of **--refuse-downgrade**

    --admindir=dir
        Set the administrative directory to directory.  This directory contains many files that give information about status of installed or uninstalled packages, etc.  
        Defaults to «/var/lib/dpkg».


    --set-selections
        Set package selections using file read from stdin. This file should be in the format “package state”, where state is one of 

            install
            hold
            deinstall 
            purge.

        Blank lines and comment lines beginning with ‘#’  are  also permitted.

        The available file needs to be up-to-date for this command to be useful, otherwise unknown packages will be ignored with a warning. See the --update-avail and --merge-avail commands for more information.
    
        可以锁定这个软件包的状态，可以不再升级某个软件

        echo "openssh-server hold" | dpkg --set -selections




## priority number
When multiple Apt repositories are enabled, a package can exist in several of them. To know which one should be installed, Apt assigns priorities to packages. The default is 500.

If the packages have the same priority, the package with a higher version number (most recent) wins.
If packages have different priorities, the one with the higher priority wins.

To view the priority of a specific package, use apt-cache policy MYPACKAGE
    https://wiki.debian.org/AptConfiguration

by default Debian backports repositories have a lower priority than stable (100). They won't be installed or upgraded unless explicitly configured to (or the package only exists in backports).


Backport的含义是”向后移植”，就是将软件新版本的某些功能移植到旧版本上来,这就称为backport。

Debian向来以稳定性著称，所以就存在一个问题，官方源分发的软件版本比软件本身的版本总是要慢不少，所以就有了 backports 源。 backports 主要从 testing 源，部分安全更新从unstable源重新编译包，使这些包不依赖于新版本的库就可以在 debian 的 stable 发行版上面运行。所以 backports 是 stable 和 testing 的一个折衷。
    https://cloud.tencent.com/developer/article/1374722
    
    



priority 1
        to the versions coming from archives which in their Release files are marked as
        "NotAutomatic: yes" but not as "ButAutomaticUpgrades: yes" like the Debian
        experimental archive.

    priority 100
        to the version that is already installed (if any) and to the versions coming from
        archives which in their Release files are marked as "NotAutomatic: yes" and
        "ButAutomaticUpgrades: yes" like the Debian backports archive since squeeze-backports.

    priority 500
        to the versions that do not belong to the target release.

    priority 990
        to the versions that belong to the target release.
    The highest of those priorities whose description matches the version is assigned to the
    version.

    http://manpages.ubuntu.com/manpages/cosmic/man5/apt_preferences.5.html
    man apt_preferences




## apt-cache

apt-cache queries and displays available information about installed
and installable packages. It works exclusively on the data acquired
into the local cache via the 'update' command of e.g. apt-get. The
displayed information may therefore be outdated if the last update was
too long ago, 

Most used commands:
    1. show - Show a readable record for the package
        performs a function similar to dpkg --print-avail; 
        it displays the package records for the named packages.

        dpkg -p  是这个命令的全集, 它列出所有的

    1. showsrc - Show source records记录
        showsrc pkg...
            displays all the source package records that match the given package names. 
            All versions are shown, as well as all records that declare the name to be a binary package. Use --only-source to display only source package names.

        其中有一项叫做：Build-Depends, 依赖的各种东西? 和 apt-cache depends wget 中的还不是特别一样

    1. showpkg [pkg]
        showpkg pkg...
            showpkg displays information about the packages listed on the command line. Remaining arguments are package names. The available versions and reverse dependencies of each package listed are listed, as well as forward
            dependencies for each version. Forward (normal) dependencies are those packages upon which the package in question depends; reverse dependencies are those packages that depend upon the package in question. Thus, forward
            dependencies must be satisfied for a package, but reverse dependencies need not be. For instance, apt-cache showpkg libreadline2 would produce output similar to the following:

            **主要用来查看依赖和反依赖**
            依赖项目 和 apt-cache depends 一样
            反依赖项目 和 apt-cache rdepends 一样
            等于 apt-cache depends + apt-cache rdepends

               Package: libreadline2
               Versions: 2.1-12(/var/state/apt/lists/foo_Packages),
               Reverse Depends:
                 libreadlineg2,libreadline2
                 libreadline2-altdev,libreadline2
               Dependencies:
               2.1-12 - libc5 (2 5.4.0-0) ncurses3.0 (0 (null))
               Provides:
               2.1-12 -
               Reverse Provides:
           Thus it may be seen that libreadline2, version 2.1-12, depends on libc5 and ncurses3.0 which must be installed for libreadline2 to work. In turn, libreadlineg2 and libreadline2-altdev depend on libreadline2. If
           libreadline2 is installed, libc5 and ncurses3.0 (and ldso) must also be installed; libreadlineg2 and libreadline2-altdev do not have to be installed. For the specific meaning of the remainder of the output it is best to
           consult the apt source code.

    1. depends - Show raw dependency information for a package
    

    1. rdepends - Shows a listing of each reverse dependency a package has.
        哪些软件依赖你所写的软件
        apt-cache rdepends libc6


    1. search - Search the package list for a regex pattern
        performs a full text search on all **available package lists** for the POSIX regex pattern given, see regex(7). It searches the package names and the descriptions for an occurrence of the regular expression and prints
           out the package name and the short description, including **virtual package names**???. 

    1. pkgnames - List the names of all packages in the system
        pkgnames [prefix]
            This command prints the name of each package APT knows. The optional argument is a prefix match to filter the name list. The output is suitable for use in a shell tab complete function and the output is generated
            extremely quickly. This command is best used with the --generate option.

            Note that a package which APT knows of is not necessarily available to download, installable or installed, e.g. virtual packages are also listed in the generated list.

            同 apt list ， 列出repository中的

    1. policy  pkg - Show policy settings
        软件来源 应该是 /etc/apt/sources.list 以及 PPA

        500 and 100 are the priority numbers. 
        To learn more about them, I recommend man apt_preferences. 
        500 corresponds to installable, 还有安装地址，即apt源
        100 means installed.


    1. madison <pkg>
        It displays available versions of a package in a tabular format.
        查询可用的软件包的版本

    1. dumpavail???
        dumpavail prints out an available list to stdout. This is suitable for use with dpkg(1) and is used by the dselect(1) method.
        应该是 软件源中一共可用的软件有多少

        有很多，56967个 apt-cache dumpavail | grep "^Package" | wc -l
        dpkg -l | wc -l 只有4021个
        dpkg --print-avail | grep "^Package" | wc -l 只有156个


    1. stats
        stats displays some statistics about the cache. 
        No further arguments are expected. 
        Statistics reported are:

        •   Total package names is the number of package names found in the cache.

        •   Normal packages is the number of regular, ordinary package names; these are packages that bear a one-to-one correspondence between their names and the names used by other packages for them in dependencies. The
            majority of packages fall into this category.

        •   Pure virtual packages is the number of packages that exist only as a virtual package name; that is, packages only "provide" the virtual package name, and no package actually uses the name. For instance,
            "mail-transport-agent" in the Debian system is a pure virtual package; several packages provide "mail-transport-agent", but there is no package named "mail-transport-agent".

        •   Single virtual packages is the number of packages with only one package providing a particular virtual package. For example, in the Debian system, "X11-text-viewer" is a virtual package, but only one package, xless,
            provides "X11-text-viewer".

        •   Mixed virtual packages is the number of packages that either provide a particular virtual package or have the virtual package name as the package name. For instance, in the Debian system, "debconf" is both an actual
            package, and provided by the debconf-tiny package.

        •   Missing is the number of package names that were referenced in a dependency but were not provided by any package. Missing packages may be an evidence if a full distribution is not accessed, or if a package (real or
            virtual) has been dropped from the distribution. Usually they are referenced from Conflicts or Breaks statements.

        •   Total distinct versions is the number of package versions found in the cache. If more than one distribution is being accessed (for instance, "stable" and "unstable"), this value can be considerably larger than the
            number of total package names.

        •   Total dependencies is the number of dependency relationships claimed by all of the packages in the cache.






## apt

简单来说就是：apt = apt-get、apt-cache 和 apt-config 中最常用命令选项的集合。

apt install         apt-get install         安装软件包
apt remove          apt-get remove          移除软件包
apt purge           apt-get purge           移除软件包及配置文件
    purge is identical to remove except that packages are removed and purged (any configuration files are
    deleted too).
apt update          apt-get update          刷新存储库索引
    -q, --quiet
        Quiet; produces output suitable for logging, omitting progress indicators. More q's will produce more
        quiet up to a maximum of 2. You can also use -q=# to set the quiet level, overriding the configuration
        file. Note that quiet level 2 implies -y; you should never use -qq without a no-action modifier such as
        -d, --print-uris or -s as APT may decide to do something you did not expect. Configuration Item: quiet.


apt upgrade         apt-get upgrade         升级所有可升级的软件包
apt autoremove      apt-get autoremove      自动删除不需要的包
apt full-upgrade    apt-get dist-upgrade    在升级软件包时自动处理依赖关系

apt search          apt-cache search(这个好)        搜索应用程序从repository
apt show            apt-cache show(这个好)          显示安装细节(用来看已安装的软件),依赖关系

apt list                                    列出包含条件的包（已安装，可升级等）
        --upgradable
        --installed | wc -l     4000个

apt edit-sources    编辑源列表, 很难用的编辑器打开

apt-get check        检查是否有损坏的依赖
    check is a diagnostic tool; it updates the package cache and checks for broken dependencies.


apt-cache pkgnames | grep xxx           repository 中有多少
    5700个
    这个和apt list 差不太多


apt-get download icinga
    download will download the given binary package into the current directory.
    在当前的目录中下载包



apt-get source [包]
    causes apt-get to fetch source packages to current directory 
    It will then find and download into the current directory the newest available version of that source package 


重新安装
    --reinstall
        Re-install packages that are already installed and at the newest version. Configuration Item: APT::Get::ReInstall.

　　$ sudo apt-get --reinstall install package_name


???
sudo apt-get clean && sudo apt-get autoclean # ——–清理下载文件的存档 && 只清理过时的包


clean
    clean clears out the local repository of retrieved package files. It removes everything but the lock file from /var/cache/apt/archives/ and /var/cache/apt/archives/partial/.

autoclean (and the auto-clean alias since 1.1)
    Like clean, autoclean clears out the local repository of retrieved package files. The difference is that it only removes package files that can no longer be downloaded, and are largely useless. This allows a cache to be
    maintained over a long period without it growing out of control. The configuration option APT::Clean-Installed will prevent installed packages from being erased if it is set to off.

autoremove (and the auto-remove alias since 1.1)
    autoremove is used to remove packages that were automatically installed to satisfy dependencies for other packages and are now no longer needed.



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


apt-file [options] action [pattern]
apt-file [options] -f action <file>
apt-file [options] -D action <debfile>



Action
    list|show          <pattern>        List files in packages
    list-indices???                     List indices configured in APT. 索引，目录
    search|find        <pattern>        Search files in packages    这个文件在那个包里,用于查找依赖
    update                              Fetch Contents files from apt-sources.


--fixed-string     -F               Do not expand pattern
    --from-deb         -D               Use file list of .deb package(s) as
                                        patterns; implies -F
    --from-file        -f               Read patterns from file(s), one per line
                                        (use '-' for stdin)
    --ignore-case      -i               Ignore case distinctions
    --regexp           -x               pattern is a regular expression
    --substring-match                   pattern is a substring (no glob/regex)




搜索文件依赖(在安装WPS时，提示缺少libgthread-2.0.so.0)
    **apt-file search|find** libgthread-2.0.so.0
    apt-file search /bin/ls 只要包含 '/bin/ls' 即可
        /usr/bin/lsw
        /usr/bin/lss16toppm
        coreutils: /bin/ls
        ...

然后使用apt-get install可安装缺失的软件包



Alien工具可以将RPM软件包转换成DEB软件包，或把DEB软件包转换成RPM软件包，以此适应兼容性的需要。注意首先请在系统中安装alien。



## apt-get 

-f, --fix-broken
           Fix; attempt to correct a system with broken dependencies in place. This option, when used with install/remove, can omit any packages to permit APT to deduce a likely solution. If packages are specified, these have to
           completely correct the problem. The option is sometimes necessary when running APT for the first time; APT itself does not allow broken package dependencies to exist on a system. It is possible that a system's dependency
           structure can be so corrupt as to require manual intervention (which usually means using dpkg --remove to eliminate some of the offending packages). Use of this option together with -m may produce an error in some
           situations. Configuration Item: APT::Get::Fix-Broken.



-d, --download-only
    Download only; package files are only retrieved, not unpacked or installed.
    会下载依赖包

apt-get -d install openssh
cd /var/cache/apt/archives
dpkg -i ./*






