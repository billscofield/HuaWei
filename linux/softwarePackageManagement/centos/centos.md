# centos 软件管理

套件名称: 包名称-(主版本.次版本 修订号) 操作系统(Release)   cpu平台
                                        .el7                .noarch
autoconf-2.69-11.el7.noarch.rpm  

x86_64  64位¬
noarch  32/64通用

rpmfind.net

Base/Extras/Updates

yum repolist
    base
    extras
    updates

In CentOS 7, the '!' symbol in front of a repository id in the output of the
"yum repolist" command indicates that the repository is disabled. This means
that the repository is not currently being used to install or update packages
on the system.

To enable a disabled repository, you can use the following command:

    yum-config-manager --enable <repo-id>

Replace <repo-id> with the actual repository id that you want to enable. You
can also use the yum-config-manager command to disable a repository by using
the --disable option instead of --enable.

---

epel fedora 的一个项目
EPEL stands for Extra Packages for Enterprise Linux.

yum list 包名               // apt-cache search 
yum list | grep 

yum list
    列出所有的

yum list installed          // 从本地数据库中查询

yum info httpd

yum install  --nogpgcheck
yum install  xxx  --downloadonly

yum group list
yum groupinfo "MATE Desktop"
yum groupinstall    mariadb
yum groupremove     mariadb
yum groupupdate     xxx

**$releasever** and **$asearch** are variables that will be replaced with specific
values during the repository configuration process.

**$releasever** stands for the current version of CentOS being used, which can be
found in the file /etc/centos-release. This variable ensures that the correct
version of the packages are installed.

**$basearch** is the base architecture of the system, such as x86_64, i386, or
aarch64. This variable is determined automatically based on the system's
architecture.

## yum groups

```
yum groupinstall "System Administration Tools"

Loaded plugins: langpacks, product-id, subscription-manager
This system is not registered to Red Hat Subscription Management. You can use subscription-manager to register.
There is no installed groups file.
Maybe run: **yum groups mark convert (see man yum)**
Warning: Group system-admin-tools does not have any packages to install.
Maybe run: yum groups mark install (see man yum)
No packages in any requested group available to install or update
```

### yum groups mark install

The "yum groups mark install" command is used **to mark a package group for
installation**. In Yum, a package group is a collection of related packages that
can be installed together as a single unit. The "yum groups" command is used to
manage package groups in Yum.

The "mark" sub-command is used to mark a package group for installation. This
means that Yum will include the package group in the list of packages to be
installed or updated during the next Yum transaction.

For example, the command "yum groups mark install 'Development Tools'" would
mark the "Development Tools" package group for installation. This package group
includes a collection of development tools that are commonly used for software
development on Linux.

---

Resolution

    The yum has changed in Red Hat Enterprise Linux 7. The package group
    "Office Suite and Productivity" has only the optional packages which by
    default doesn't get installed. So we will need to pass the option to
    install the optional packages too!

    So to install the above package group, please run the following command.

    ```
    yum groupinstall "Office Suite and Productivity" --setopt=group_package_types=mandatory,default,optional
    ```

---

https://fedoraproject.org/wiki/Features/YumGroupsAsObjects

1. Detailed Description

    Currently yum groups work as a simple substitution, so "yum group remove
    foo" works as though you took every package from foo and passed it to "yum
    remove".  This tends to not be what users expect, for example "yum group
    install kde-desktop" and then "yum group remove kde-desktop" will end up
    removing packages (like abrt-desktop). This feature changes that so that
    groups are installed as real objects, meaning that when a user does "yum
    group install foo" yum will mark that the packages from foo are being
    installed (as before) but also that a group called foo is being installed
    and that those packages are installed because of it. Later if the group is
    removed, yum will remove the group and only those packages that were
    installed because of the group install/upgrade commands.

2. Benefit to Fedora

## 

yum search                      // 关注软件包的名称和内容描述

yum reinstall xxx
yum update                  // 系统更新，更新yum源中所有的软件
yum update xxx
    yum update kernel

yum history 
    yum history info 9
    yum history undo 9      // 撤销第九步
    yum history undo 12     // 撤销刚才的撤销

yum provides vim            // 查文件，查命令
yum whatprovides vim
    yum provides /etc/vsftpd/vsftpd.conf
    yum provides */vsftpd.conf

[]
name
baseurl
gpgcheck
enabled

## yum 服务器

yum install vsftpd
systemctl restart vsftpd
systemctl enable vsftpd

1. 开启缓存
    vim /etc/yum.conf
    keepcache = 1

    /var/cache/yum/x86_64/7/base/packages

    yum clean all 会删除本地所有的缓存的包

2. 下载安装所有的 updates

    yum -y update               // 这就就会缓存了

    mkdir /var/ftp/updates
    rsync -av /var/cache/yum/x86_64/7/updates/packages/*.rpm /var/ftp/updates

3. 制作

    yum install createrepo
    createprpo /var/ftp/updates

4. 使用

    touch a.repo
    ```
    [updates]
    name = self updates
    base = ftp://1.1.1.1/updates        // 发布的是/var/ftp,    repodata 目录的路径
    gpgcheck = 0
    enabled = 1
    ```

CD:

```
[c7-media]
name=CentOS-$releasever - Media
baseurl=file:///media/CentOS/
        file:///media/cdrom/
        file:///media/cdrecorder/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

```

yum --disablerepo=\* --enablerepo=c7-media [command]

## 签名检查机制

两种方法:

1. 导入

    rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

2. 指定位置

    gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

## /etc/yum.conf

```
[main]
cachedir=/var/cache/yum/$basearch/$releasever
keepcache=0
debuglevel=2
logfile=/var/log/yum.log
exactarch=1
obsoletes=1
gpgcheck=1
plugins=1
installonly_limit=5
bugtracker_url=http://bugs.centos.org/set_project.php?project_id=23&ref=http://bugs.centos.org/bug_report_page.php?category=yum
distroverpkg=centos-release

```

The [main] section must exist for yum to do anything. It consists of the following options:

    1. cachedir
        Directory where yum should store its cache and db files. The default is `/var/cache/yum'.

    2. keepcache

        Either  `1'  or  `0'. Determines whether or not yum keeps the cache of
        headers and packages after successful installation.  Default is '1'
        (keep files)

    3. debuglevel
        Debug message output level. Practical range is 0-10. Default is `2'.

    4. logfile
        Full directory and file name for where yum should write its log file.

    5. 

    6. gpgcheck

        Either `1' or `0'. This tells yum whether or not it should perform a
        GPG signature  check  on the packages gotten from this repository.

    7. plugins

        Either `0' or `1'. Global switch to enable or disable yum plugins.
        Default  is  `0'  (plugins disabled). See the PLUGINS section of the
        yum(8) man for more information on installing yum plugins.  ` `
    
    8. installonly_limit 
        Number  of  packages  listed in installonlypkgs to keep installed at the same time.

    9. distroverpkg

        The package used by yum to determine the "version" of the distribution,
        this sets $relea‐sever for use in config. files. This can be any
        installed package. Default  is  `system-release(relea‐sever)',
        `redhat-release'.  Yum  will now look at the version provided by the
        provide, and if that is non-empty then will use the full V(-R),
        otherwise it uses the version of the package.  You can see what
        provides this manually by using: "yum whatprovides
        'system-release(releasever)' red‐hat-release" and you can see what
        $releasever is most easily by using: "yum version".  `'`

## rpm

rpmfind.net
pkgs.org

rpm --nosignature
    --force             // yum reinstall
    --nodeps

rpm --help | grep '\--force'
rpm -e ntfs-3g --nodepes
    ntfs-3g-devle 依赖于 ntfs-3g

在yum makecache时，一直停在Determining fastest mirrors 这个界面，也就是说一直在
判断最快镜像，由于已经指定了yum源，所以不需要些插件，可以用动禁用。

解决方法：

    修改/etc/yum/pluginconf.d/fastestmirror.conf里面的enabled=0；

    修改/etc/yum.conf里面的plugins=0
