
## yum (Yellowdog Updater Modified)

FTP服务     ftp:// HTTP服务    http://本地目录    file:///


https://fedoraproject.org/wiki/EPEL

EPEL (Extra Packages for Enterprise Linux) 

    





##



## CentOS下Yum源配置文件中如CentOS-Base.repo的$releasever和$basearch的取值

https://blog.csdn.net/Michaelwubo/article/details/80624727


$releasever的值,这个表示当前系统的发行版本，可以通过如下命令查看:

``` 
root@vm-xiluhua /etc # rpm -qi centos-release
Name        : centos-release
Version     : 7
Release     : 2.1511.el7.centos.2.10
Architecture: x86_64
Install Date: 2016年01月02日 星期六 15时50分25秒
Group       : System Environment/Base
Size        : 36019
License     : GPLv2
Signature   : RSA/SHA256, 2015年12月09日 星期三 18时01分49秒, Key ID
24c6a8a7f4a80eb5
Source RPM  : centos-release-7-2.1511.el7.centos.2.10.src.rpm
Build Date  : 2015年12月09日 星期三 17时59分15秒
Build Host  : worker1.bsys.centos.org
Relocations : (not relocatable)
Packager    : CentOS BuildSystem <http://bugs.centos.org>
Vendor      : CentOS
Summary     : CentOS Linux release file
Description :
CentOS Linux release files

或

rpm -q --qf %{version} centos-release;echo

rpm -q --qf %{arch} centos-release;echo
```



Redhat 或 CentOS 发行版本号

第一种方法，也是最容易想到的方法是查看 /etc/issue 和 /etc/redhat-release这两个文
件，这两个文件都差不多，都含有发行号， 但这是在文件中，很容易修改，我那个同事觉
得这个不太靠谱。

第二种方法是使用命令，在RHEL 5 或 CentOS 5 中有个命令： lsb-release，通过这个命
令可以查到，不过在RHEL 6就没这么幸运了，在我的最小化系统中找不到这个命令，而我那
个同事偏偏是在CentOS6上获取发行版本号， 看来此路又不通了。

不过有一个线索， 那就是在CentOS自带的Yum源文件中使用了 $releasever , $basearch等
这些变量， 奇怪的是这些变量的值是从哪获取的呢？

Google 一下之后，说明Yum变量的说明可以在这里（5.3.3. Using YumVariables）找到，
说明如下：

``` 5.3.3. Using Yum Variables

You can use and reference the following built-in variables in yum commands and
in all Yum configuration files (that is, /etc/yum.conf and all .repo files in
the /etc/yum.repos.d/ directory):


$releasever

You can use this variable to reference the release version of Fedora. Yum
obtains the value of $releasever from the distroverpkg=value line in the
/etc/yum.conf configuration file. If there is no such line in /etc/yum.conf,
then yum infers the correct value by deriving the version number from the
redhat-release package.


$arch

You can use this variable to refer to the system's CPU architecture as returned
when calling Python's os.uname() function. Valid values for $arch include: i586,
i686 and x86_64.


$basearch

You can use $basearch to reference the base architecture of the system. For
example, i686 and i586 machines both have a base architecture of i386, and AMD64
and Intel64 machines have a base architecture of x86_64.


$YUM0-9

These ten variables are each replaced with the value of any shell environment
variables with the same name. If one of these variables is referenced (in
/etc/yum.conf for example) and a shell environment variable with the same name
does not exist, then the configuration file variable is not replaced.


To define a custom variable or to override the value of an existing one, create
a file with the same name as the variable (without the “$” sign) in the
/etc/yum/vars/ directory, and add the desired value on its first line.  For
example, repository descriptions often include the operating system name. To
define a new variable called $osname, create a new file with “Fedora” on the
first line and save it as /etc/yum/vars/osname:
> # echo "Fedora" > /etc/yum/vars/osname

Instead of “Fedora 21”, you can now use the following in the .repo files:
> name=$osname $releasever
```


文中说到$releasever的定义可以查看 /etc/yum.conf 文件的事distroverpkg=value行，打
开 /etc/yum.conf 看一下，默认文件（我的是CentOS 6）内容如下：

```
distroverpkg=centos-release
distroverpkg=centos-release 代表什么？ 去哪找 centos-release。找到这里我再一次表
示困惑。
```

不过另一篇文章进行了我的视野： yum的$releasever真是太反动了， 关键内容如下：

在 /etc/yum.repos.d/ 目录下的软件库定义文件中，常常会在 baseurl 的路径中提到
$releasever 这个变量，表示当前发行版的大版本号，但大家知道这个变量是在哪设置的吗
？我 grep 了整个 etc目录都没找到，还是看了 yum.conf 才知道的，是在 yum.conf 文件
里 distroverpkg选项定义的。但这个选项就很有问题：

distroverpkg 和 releasever 名字不同，且看不出什么联系

distroverpkg的值，并不是明文，而是“redhat-release”。不知道大家看到这个会有什么想
法，反正我是首先想到了/etc/redhat-release 文件，但我错了。实际上指的是
redhat-release这个RPM包。所谓“distroverpkg=redhat-release”的意思，其实是将
$releasever 设置为redhat-release 这个RPM包的版本号

原来如此。这发行版本号可是藏的够深的。

小结：

yum中的$releasever变量是取redhat-release-serverrpm包的属性值( %{version} )。
[root@ldap01 ~]# rpm -q --qf %{version}redhat-release-server;echo


---

man 5 yum.conf(https://linux.die.net/man/5/yum.conf) 关于yum.conf 的解释

distroverpkg 

The package used by yum to determine the "version" of the
distribution. This can be any installed package. Default is 'redhat-release'.
You can see what provides this manually by using: "yum whatprovides
redhat-release".

