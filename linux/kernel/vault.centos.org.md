## 使用 centos-vault 作为停止支持的 CentOS 的 yum 源

https://www.javatang.com/archives/2017/09/04/13261799.html

每隔一段时间，CentOS就会对老版本的系统结束支持，对应的yum源也失效了，CentOS 5.x
在2017年3月31日结束支持，导致使用yum安装和更新程序的时候出现404错误。在CentOS官
方有一个http://vault.centos.org/包含所有发行的CentOS版本，因此需要将yum源修改为
centos-vault的源，这里以CentOS 5.x为例进行讲解。

将 /etc/yum.repos.d/CentOS-Base.repo 文件中所有的源主机地址修改为
http://vault.centos.org ，并且将$releasever替换为当前系统所使用的CentOS版本，可
以使用5.x最后的版本5.11。注意，需要将所有其他备用的主机都删除，


确认在 /etc/yum.repos.d/目录没有除了CentOS-Base.repo之外其他以repo结尾的文件，如
果有的话需要删除，然后执行 yum clean all && yum makecache 更新和启用新的yum源。

因为http://vault.centos.org/的服务器在国外，在国内进行更新的时候非常慢，而且经常
会出现超时的错误，因此需要自己做一个本地的源。如何同步在
http://vault.centos.org/readme.txt中有详细的说明，创建一个需要同步的目录，然后执
行下面的命令即可自动同步：

``` rsync -a -v --exclude=debug --exclude=i386
rsync://archive.kernel.org/centos-vault/5.11/ /data/centos-vault/5.11/

```

上面将i386去除，是因为我用的是64位的系统，具体根据自己的情况进行设置。

默认情况下rsync是在前台运行的，在命令最后加&也无效，可以采用下面的步骤将其转为后
台运行：（1）运行上面的rsync命令；（2）在运行的时候按 Ctrl+Z，这个时候会暂停上面
的命令；（3）输入bg并回车，这个时候就将rsync转移到后台运行了。

可以输入jobs命令查看后台正在运行的任务。可以在命令行后面加--progress参数查看正在
运行的进度，


第一次运行之后的时间非常长，可以通过查看进度来查看其完成的情况，如果第一次完成之
后可以将rsync命令加入到定时任务中，如下表示每天凌晨1点钟自动进行同步更新：

``` 0 1 * * * /usr/bin/rsync -a -v --exclude=debug --exclude=i386
rsync://archive.kernel.org/centos-vault/5.11/ /data/centos-vault/5.11/ || echo
"rsync died with error code $?" >> /var/log/rsync-centos-vault.log

```

后面的echo可以记录当执行出现错误的时候将错误码写入到日志文件里面。


PS：因为镜像会占用大量的硬盘空间，如果在文件中使用软链接的话，需要增加-L -K参数
，前者会在同步的时候考虑到软链接，后者会在同步的时候保持软链接的状态，否则会删除
软链接。
