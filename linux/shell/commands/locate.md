
The locate command is the quickest and simplest way to search for files and
directories by their names

locate operates much faster but lacks many features and can search only by the
file name.


yum install mlocate


rpm -ql mlocate

/etc/cron.daily/mlocate
/etc/updatedb.conf                      // 这个文件好像不管用啊，加了路径不行
/usr/bin/locate
/usr/bin/updatedb
...
/var/lib/mlocate
/var/lib/mlocate/mlocate.db



During the installation of the mlocate package, a cron job is created that runs
the updatedb command every 24 hours. This ensures the database is regularly
updated. For more information about the cron job check the
/etc/cron.daily/mlocate file.

```

#!/bin/sh
nodevs=$(awk '$1 == "nodev" && $2 != "rootfs" && $2 != "zfs" { print $2  }' < /proc/filesystems)

renice +19 -p $$ >/dev/null 2>&1
ionice -c2 -n7 -p $$ >/dev/null 2>&1
/usr/bin/updatedb -f "$nodevs"

```


rpm -qi --scripts mlocate

    The 'm' stands for "merging": updatedb reuses the existing database to avoid
    rereading most of the file system, which makes updatedb faster and does not
    trash the system caches as much as traditional locate implementations.
    preinstall scriptlet (using /bin/sh):
    getent group slocate >/dev/null || groupadd -g 21 -r -f slocate
    exit 0
    postinstall scriptlet (using /bin/sh):
    if /bin/grep -q '^[^#]*DAILY_UPDATE' /etc/updatedb.conf; then
        /bin/sed -i.rpmsave -e '/DAILY_UPDATE/s/^/#/' /etc/updatedb.conf
    fi




## 使用

locate .bashrc

The output will include the names all files containing the string .bashrc in their names:

/etc/bash.bashrc
/etc/skel/.bashrc
/home/linuxize/.bashrc
/usr/share/base-files/dot.bashrc
/usr/share/doc/adduser/examples/adduser.local.conf.examples/bash.bashrc
/usr/share/doc/adduser/examples/adduser.local.conf.examples/skel/dot.bashrc


The /root/.bashrc file will not be shown because we ran the command as a normal
user that doesn’t have access permissions to the /root directory.


---


-n option followed by the number of results you want to be displayed. 

    locate -n 1 .bashrc


-d --database DBPATH

    Replace the default database with DBPATH.  DBPATH is a :-separated list of
    database file names.   If  more  than  one --database option is specified,
    the resulting path is a concatenation of the separate paths.


-i --ignore-case


-c 

    To display the count of all matching entries, use the -c (--count) option

    only list the count number.


-e  --existing

    Print only entries that refer to files existing at the time locate is run.

    if a file is removed from the system, then until you update the locate database
    again, the command will keep showing that filename in output. For this specific
    case, however, you can skip updating the database, and still have correct
    results in output using the -e command line option.


-S, --statistics

    Write statistics about each read database to standard output instead of searching for files and exit successfully.

    ```
    locate -S
    Database /var/lib/mlocate/mlocate.db:
    4,974 directories
    34,700 files
    1,668,035 bytes in file names
    771,473 bytes used to store database

    ```



 -r, --regexp REGEXP

    Search for a basic regexp REGEXP.  No PATTERNs are allowed if this option
    is used, but this option can be specified multiple times.

    > locate --regex -i "(\.mp4|\.avi)"


--regex

    Interpret all PATTERNs as extended regexps.




https://linuxize.com/post/locate-command-in-linux/#:~:text=Installing%20locate%20%28locate%20command%20not%20found%29%20%23%20Depending,your%20terminal%2C%20type%20locate%20and%20press%20Enter%20.




## How to search for an exact filename using locate

https://www.howtoforge.com/linux-locate-command/


By default, when you search for a filename using locate, then the name you pass
- say NAME - is implicitly replaced by NAME. For example, if I search for a
filename 'testfile', then all names matching testfile are produced in the
output:

But what if the requirement is to search files with names exactly matching
'testfile'? Well, in this case, you'll have to use regular expressions, which
can be enabled using the -r command-line option. So, here's how you can search
for just 'testfile' using regular expressions:

> locate -r /testfile$



## use the locate command within a specified directory


updatedb -U /path/you/wantto/search/ -o /dbfile/location/dbname

locate -d /dbfile   search-item


root@localhost temp]# locate -d db2.db db
/root/temp/db2.db.3oZoNk                                // 这个文件名db2.db 后面的是什么?
/root/temp/mariadb-devel-5.5.68-1.el7.x86_64.rpm

