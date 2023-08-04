
1. 无法挂载 nfs 的问题

    mount -o resvport 10.0.0.1:/nfsdata 本地目录

    The resvport option is a client-side mount option and secure is the
    corresponding server-side export option (see explanation above). It
    restricts communication to a "reserved port". The reserved or "well known"
    ports are reserved for privileged users and processes such as the root
    user. Setting this option causes the client to use a reserved source port
    to communicate with the server.

    [link](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/security_guide/sec-securing_services)

2. smb 可以直接挂载

    mount -t smbfx xx xx
    mount_smbfs xxx xxx


## [自动挂载 nfs](https://zhuanlan.zhihu.com/p/288594630)

1. /etc/auto_master

    /Users/jamesding/nfs    auto_nfs
    挂载到哪个目录          具体要挂在的资源

    编辑 /etc/auto_master 时报错:
        "/private/etc/auto_master"
        "/private/etc/auto_master" E212: Can't open file for writing
        Press ENTER or type command to continue

2. 创建资源映射文件

    /etc/auto_nfs
        dell_server_harddisk_data -rw,bg,soft,rsize=32768,wsize=32768 172.16.47.96:/data

3. 使配置生效

    > $ sudo  automount -vc

4. 其他可选的配置

    可以在/etc/autofs.conf配置文件中更改其他选项。比较常用的选项是挂载超时
    时间。如果该文件系统一段时间内没有任何访问，系统就会将它卸载。在MacOS附
    带的/etc/autofs.conf中默认设置为1小时（3600秒）

    ```
    # The number of seconds after which an automounted file system will
    # be unmounted if it hasn't been referred to within that period of
    # time.  The default is 10 minutes (600 seconds).
    # This is equivalent to the -t option in automount(8).
    AUTOMOUNT_TIMEOUT=3600
    ```

需要注意的是，以这种方式自动加载的文件系统，不会自动显示在Finder的侧栏中。它们
也不会自动以磁盘图标的形式出现在桌面上。

我个人推荐的技巧是，将/Users/jamesding/nfs这个文件夹添加到 个人收藏 里
