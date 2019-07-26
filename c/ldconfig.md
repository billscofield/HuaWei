dynamic linker/loader

ldconfig是一个动态链接库管理命令，其目的为了让动态链接库为系统所共享。
    ldconfig是一个动态链接库管理命令，其目的为了让动态链接库为系统所共享。

默认搜寻/lilb和/usr/lib，以及配置文件/etc/ld.so.conf内所列的目录下的库文件。

搜索出可共享的动态链接库，库文件的格式为：`lib***.so.**`，进而创建出动态装入程序(ld.so)所需的连接和缓存文件。

缓存文件默认为/etc/ld.so.cache，该文件保存已排好序的动态链接库名字列表。

ldconfig通常在系统启动时运行，而当用户安装了一个新的动态链接库时，就需要手工运行这个命令。


https://linux.die.net/man/8/ld-linux
https://www.cnblogs.com/MYSQLZOUQI/p/5901765.html
