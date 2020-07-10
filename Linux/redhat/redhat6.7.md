

# redhat 6.7

redhat 6.7 这个版本默认不支持 ntfs,exfat 硬盘格式

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
createrepo -v /mnt/centos/6/epel/ --update --no-database

```


