
## 同步清华源

reposync命令在yum-utils工具包中

yum install yum-utils



reposync -r all -p /mnt/centos7repo


1. -r REPOID, --repoid=REPOID 

    Specify repo ids to query, can be specified multiple times (default is all
    enabled).

    获取 repoid
        
        yum repolist
        
        repoid有4个分别为base、epel、extras、updates。
        
        在.repo文件中[serverid]就是repoid, 就是各个 []
        
        serverid解释：用于区别各个不同的repository，必须有一个独一无二的名称。若重复后面的会覆盖前面的。
        
        同步存储库时可以指定一个repoid，也可以指定多个repoid，当然前提是下载目录一致。
        
        > reposync -n --repoid=base --repoid=epel --repoid=extras --repoid=updates -p /data1/centos/$releasever
        
        会自动创建以repoid命令的目录



1. -p DESTDIR, --download_path=DESTDIR

    Path to download packages to: defaults to current directory.


1. -n, --newest-only

    Download only newest packages per-repo.


1. -c CONFIG, --config=CONFIG

    Config file to use (defaults to /etc/yum.conf).


1. --source

    Also download .src.rpm files.
    Config file to use (defaults to /etc/yum.conf).



## createrepo

yum install createrepo

createrepo - Create repomd (xml-rpm-metadata) repository
createrepo is a program that creates a repomd (xml-based rpm metadata) repository from a set of rpms.



createrepo [options] <directory>


1. -p --pretty

    Output xml files in pretty format.

1. -o --outputdir <url>

    Optional output directory (useful for read only media).


1. --basedir

    Basedir for path to directories in the repodata, default is the current working directory.


1. --no-database

    Do not generate sqlite databases in the repository.


## problems

https://superuser.com/questions/1045079/yum-repo-on-cifs-mount

https://stackoverflow.com/questions/7573301/sqlite3-nfs-mount-issue-with-locking-can-i-use-something-like-cifs-nobrl


TypeError: Can not create db_info table: database is locked

实验时用的是 cifs 挂载的 windows 的 ntfs

https://superuser.com/questions/1045079/yum-repo-on-cifs-mount

The common factor, is that our repository directories are mounted on a CIFS share with RW access.

Per this RedHat BugZilla: https://bugzilla.redhat.com/show_bug.cgi?id=429201

What worked for me was modifying my /etc/fstab/ file to include nobrl in my CIFS declaration:

> mount -t cifs nobrl,username=administrator,password=password //192.168.6.1/centos7repo /mnt






```
[root@localhost /]# tree -L 2 mnt
mnt
├── base
│   ├── Packages
│   └── repodata
├── epel
│   └── Packages
├── extras
│   ├── Packages
│   └── repodata
└── updates
    └── Packages



// 只需要在/mnt 下建立repodata即可，不必 /mnt/base, /mnt/epel, ... 
// 使用 --no-database 的原因是因为 cifs 挂载 windows 的 nfs 文件系统的原因, 需要加上 nobrl 参数
// 
//
createrepo --workers 20 --no-database -p /mnt/



[root@localhost mnt]# tree -L 1 ../mnt
../mnt
├── base
├── epel
├── extras
├── repodata
└── updates


base.repo 文件

[local-base]    //repo-id
name=local-base //repo-name
baseurl=file:///mnt/
gpgcheck=0


```
