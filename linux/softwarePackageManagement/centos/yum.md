## yum配置文件中 baseurl 和 mirrorlist 的区别

找到yum.repo.d文件夹下的文件，随便打开一个，找到 mirrorlist 的 url，比如：

http://mirrorlist.centos.org/?release=6&arch=$basearch&repo=os

    rpm -qi centos-release

    $basearch是我们的系统硬件架构(CPU指令集),使用命令arch得到

可以在/etc/yum.conf文件中看到如下url：
cachedir=/var/cache/yum/$basearch/$releasever

找到该文件夹下，发现 $basearch 其实就是 x86_64

然后打开http://mirrorlist.centos.org/?release=6&arch=x86_64&repo=os连接

发现就是一堆容器url，所以mirrorlist指向的就是一堆baseurl（Specifies a URL to a
file containing a list of baseurls. ）

而 baseUrl 必须指向 yum 服务器上的 repository 的 repodata 文件夹，因为这个文件夹上保存
着rpm文件安装时需要的依赖信息（Must be a URL to the directory where the yum
repository’s ‘repodata’ directory lives.）

我们在日常使用中，配置的阿里云yum源其实就是centos对应的原厂的软件更新服务，所以
我们一般在baseurl里面进行配置，如：http://mirrors.aliyun.com/centos/6/os/x86_64
该url指向一个repodata目录的容器地址这个容器里面是由原厂替我们维护的一系列软件，
我们可以高效的安装、卸载、更新软件

但是如果我们需要的第三方软件原厂的提供的容器没有替我们维护，就需要我们自己找到
相应的容器地址了，比如docker-engine的容器地址可以如下：

http://mirrors.aliyun.com/docker-engine/yum/repo/main/centos/6

这种就需要我们另外用一个repo文件进行标注，一个单独属于docker-engine的容器。有了
容器地址我们又可以使用yum轻松的进行软件的维护


---

https://serverfault.com/questions/892354/what-is-the-difference-between-base-url-and-mirrorlist-in-yum#:~:text=The%20base%20URL%20is%20just%20the%20standard%20location,a%20Linux%20distro%20such%20as%20Ubuntu%20or%20Fedora.

The base URL is just the standard location of the repository that has all of
the software for the repo whereas the mirrorlist is just other locations that
it will search in case it can't can't connect to the base.

Think of it as the site where you download ISOs for a Linux distro such as
Ubuntu or Fedora. There's the main site and then other mirrors that will have
it case you can't get it from the main site.

The difference is that the mirrorlist is there to increase availability in case
the base can't be reached.



---


软件包的安装
    yum install package1                    安装指定的安装包
    yum groups install group1               安装指定程序组
    yum groups mark install group1          标记指定的程序组
    yum install package1 --nogpgcheck       忽略gpg 检测
    GPG，一种秘钥方式的签名，用来确定rpm包的来源是有效和安全
    gpgcheck=0或1

更新和升级
    yum update package1         更新指定程序包
    yum check-update            检查可更新的程序
    yum upgrade package1        升级指定程序包
    yum groups update group1    升级指定程序组
    yum check-update            检测可用更新信息
    yum update                  升级所有包括 kernel, 系统设置
    yum upgrade                 升级所有包括旧有的软件

查找和显示
    yum info package1           显示指定安装包信息
    yum list                    显示所有已经安装和可以安装的程序包
    yum list package1           显示指定程序包安装情况
    yum deplist packages        显示软件包依赖关系
    yum groups info group1      显示指定程序组信息
    yum search string           根据关键字 string 查找安装包
    yum provides /路径/文件名   查看文件属于哪个软件包
    Yum groups info [软件组名]  查看组软件包列表信息

删除软件包
    yum remove package1         删除指定程序包
    yum groups remove group1    删除程序组group1
    yum clean all               清除所有下载的 rpm 头文件及软件包（这个命令较危险）

查看以前动作及恢复
    yum history                 查看 yum 历史 ( 与 tail /var/log/yum.log 一致 )
    yum history undo N          ( 撤销历史操作 , 恢复原有软件状态 )

软件池的管理

    显示所有本地池的信息
        yum repolist all

    开启指定的软件池
        yum-config-manager --enable 软件池名

    关闭指定的软件池
        yum-config-manager --dsiable 软件池名
