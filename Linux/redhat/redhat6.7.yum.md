

# redhat 6.7

redhat 6.7 这个版本默认不支持 ntfs,exfat 硬盘格式

烧录到U盘的时候使用 rufus 工具, ultraiso 不行

为什么使用 rufus

``` 
The problem that you are having with Centos (Fedora & RHEL) are that they install from a kickstart (ks.cfg) file and not directly from the image/iso/CD/DVD.

Running a live CD/DVD is a different animal. Many ISO to USB tools are based on using a Live CD image and not a install image. On many Linux distros there is no difference in Live to Install, but the Centos/RHEL, Fedora distros do have different ISO's for a reason (good or not is debatable).

So far I have only found that iso2usb, unetbootin and Xboot handle this task somewhat correctly. The underlying problem is that the kickstart file contents have more information that needs changing to work correctly. There are also differences in Centos/RHEL versions 6.2 to 6.3 that change the kickstart file so that the method that I worked out for 6.2 doesn't work for 6.3.

Basically these distros install almost everything from RPM files and not binaries contained in the ISO. This RPM method works for install, upgrade, modification, updates from CD or Network or local file, but makes installing from USB tough.

Change #1, The USB stick can look like a local drive and not a CD, then that mounting location can change depending on the type/brand of USB stick you have. Some are recognized as hard drives behind a USB Hub, others are seen as a harddrive (no USB) others are not recognized at all by the BIOS and some are recognized by the BIOS and when the install process gets handed off to the Centos installer for completion then that no longer works because the USB stick changes mount point and can not be found (change #2).

I have found that different brands/types/formats of USB sticks change mounting locations during the install process and that causes two kinds of failures.

Your hard drive changes mount point, or
the USB changes mount point. (that is the 6.3 problem)
You can take the easier path and install from a LiveCD or LiveDVD image on a USB stick. Just boot the live image and the perform the install from the desktop or do the init 6 thing. I believe that performing an install using the net install ISO file from a USB stick should work because the point where the installer looks for the RPM files is going to be looking on the NET and not on the USB drive that has moved mount points, but I have not tried that yet.k

链接:
    https://unix.stackexchange.com/questions/29154/how-to-install-centos-6-via-usb-mass-storage-device
```


遇到的错误:

Unable to read package metadata. This may be due to missing repodata directory. Please ensure that your install tree has been correctly generated

```stackoverflow 上说的解决方法
The files under the /repodata folder are missing their file extensions and are not matching their full names in the "TRANS.TBL" file, under this same dir.

Rename all the files to match what is in the "TRANS.TBL" file, then try the install over again.
```

## 更改yum源为 centos 163

1. 检查yum包 rpm -qa |grep yum

2. 删除自带包

    rpm -aq | grep yum | xargs rpm -e --nodeps

3. 再检查一下

    rpm -qa |grep yum

4. 下载更新包

```
mkdir ~/yum163 && cd ~/yum163/

wget http://mirrors.163.com/centos/6/os/x86_64/Packages/python-urlgrabber-3.9.1-11.el6.noarch.rpm
wget http://mirrors.163.com/centos/6/os/x86_64/Packages/yum-plugin-fastestmirror-1.1.30-41.el6.noarch.rpm
wget http://mirrors.163.com/centos/6/os/x86_64/Packages/yum-3.2.29-81.el6.centos.noarch.rpm
wget http://mirrors.163.com/centos/6/os/x86_64/Packages/yum-updateonboot-1.1.30-41.el6.noarch.rpm
wget http://mirrors.163.com/centos/6/os/x86_64/Packages/yum-metadata-parser-1.1.2-16.el6.x86_64.rpm
wget http://mirrors.163.com/centos/6/os/x86_64/Packages/yum-utils-1.1.30-41.el6.noarch.rpm
```

5. 执行安装

```
rpm -ivh yum-*
```

如果出现

error: Failed dependencies:

        python-urlgrabber >= 3.9.1-10 is needed by yum-3.2.29-73.el6.centos.noarch

        不要慌，这个问题很恶心会导致后面安装前功尽弃，使用下面

rpm -Uvh python-urlgrabber-3.9.1-11.el6.noarch.rpm

更新python-urlgrabber版本，不更新肯定安装不过去

然后再执行 

```
rpm -ivh yum-*
```

6.切换源

cd /etc/yum.repos.d/ 

mv redhat.repo redhat.repo.bak

mv rhel-source.repo rhel-source.repo.bak

vi /etc/yum.repos.d/CentOS-Base.repo

```
#CentOS-Base.repo

#

# The mirror system uses the connecting IP address of the client and the

# update status of each mirror to pick mirrors that are updated to and

# geographically close to the client.  You should use this for CentOS updates

# unless you are manually picking other mirrors.

#

# If the mirrorlist= does not work for you, as a fall back you can try the

# remarked out baseurl= line instead.

#

#

[base]

name=CentOS-6 - Base - 163.com

#mirrorlist=http://mirrorlist.centos.org/?release=6&arch=$basearch&repo=os

baseurl=http://mirrors.163.com/centos/6/os/$basearch/

gpgcheck=1

gpgkey=http://mirrors.163.com/centos/RPM-GPG-KEY-CentOS-6



#released updates

[updates]

name=CentOS-6 - Updates - 163.com

#mirrorlist=http://mirrorlist.centos.org/?release=6&arch=$basearch&repo=updates

baseurl=http://mirrors.163.com/centos/6/updates/$basearch/

gpgcheck=1

gpgkey=http://mirrors.163.com/centos/RPM-GPG-KEY-CentOS-6



#additional packages that may be useful

[extras]

name=CentOS-6 - Extras - 163.com

#mirrorlist=http://mirrorlist.centos.org/?release=6&arch=$basearch&repo=extras

baseurl=http://mirrors.163.com/centos/6/extras/$basearch/

gpgcheck=1

gpgkey=http://mirrors.163.com/centos/RPM-GPG-KEY-CentOS-6



#additional packages that extend functionality of existing packages

[centosplus]

name=CentOS-6 - Plus - 163.com

baseurl=http://mirrors.163.com/centos/6/centosplus/$basearch/

gpgcheck=1

enabled=0

gpgkey=http://mirrors.163.com/centos/RPM-GPG-KEY-CentOS-6
```

8.清理缓存

yum clean all

yum makecache



9.验证

yum install telnet





## 配置本地源服务器







repodata是一个目bai录，里面包含了一个以 .xml结尾的文件，du这个文件是yum索引文件，包zhi含了rpm包的一些信dao息，比如依赖关系这些的。通过它用yum安装才能在自动解决依赖关系。一般光盘里面会自带有repodata目录。如果没有就手动生成了。方法：
1. 安装createrepo包，这个你用rpm方式安装。
2. 成功后你执行createrepo -v /mnt/cdrom 来重建索引文件
3. 检查。看下/mnt/cdrom下是否有repodata目录，目录里面是否有以 .xml结尾的文件
4. 清除缓存。这步也很重要，没执行会报错的， 之前的错误的影响

```
yum clean all
```

5. 验证。通过统计rmp包方式验证。一般是三千多个

```
yum list | wc -l
```






### epel 源

把/etc/yum.repos.d/epel.repo，文件第3行注释去掉，把第四行注释掉。具体如下：

打开/etc/yum.repos.d/epel.repo，将

```
[epel]
name=Extra Packages for Enterprise Linux 6 - $basearch
#baseurl=http://download.fedoraproject.org/pub/epel/6/$basearch
mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch
修改为

[epel]
name=Extra Packages for Enterprise Linux 6 - $basearch
baseurl=http://download.fedoraproject.org/pub/epel/6/$basearch
#mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch
再清理源，重新安装

yum clean all
yum install -y 需要的包

```



### 克隆源

reposync -p /mnt/centos/6/




### createrepo 报错问题

```
createrepo -g repodata/repomd.xml /home/OS
Traceback (most recent call last):
    File "/usr/share/createrepo/genpkgmetadata.py", line 28, in <module>
    import createrepo
    File "/usr/lib/python2.6/site-packages/createrepo/__init__.py", line 19, in <module>
    import libxml2
    File "/usr/lib/python2.6/site-packages/libxml2.py", line 1, in <module>
    import libxml2mod
    ImportError: /usr/lib/python2.6/site-packages/libxml2mod.so: wrong ELF class: ELFCLASS32

yum install python*

要在没有配置 repl 源之前，或者禁用 repl 源，否则会安装太多的软件

```



sqlite3 数据库锁定的问题, 添加选项 --no-database 就解决了


```
格式: createrepo -po 源目录 索引元数据的输出位置目录

createrepo -v /mnt/centos/6/epel/ --update --no-database

但是会报: Could not find valid repo at: /mnt/centos/6/epel/

```


