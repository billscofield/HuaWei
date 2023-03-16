
# at

apt install -y at

at and batch read commands from standard input or a specified file which are to
be executed at a later time, using /bin/sh.

at      executes commands at a specified time.

atq     lists  the user's pending jobs, unless the user is the superuser; in
that case, everybody's jobs are listed.  The format of the output lines (one
for each job) is: Job number, date, hour, queue, and username.

atrm    deletes jobs, identified by their job number.

batch   executes commands when system load levels permit; in other words, when
the load average drops below 1.5, or the value specified in the invocation of
atd.

-m      Send mail to the user when the job has completed even if there was no
output.

-M      Never send mail to the user.

-f      file Reads the job from file rather than standard input.

-t      time run the job at time, given in the format [[CC]YY]MMDDhhmm[.ss]

-l      Is an alias for atq.

-r      Is an alias for atrm.

-d      Is an alias for atrm.

-b      is an alias for batch.

-v      **Shows the time the job will be executed before reading the job.**

        Times displayed will be in the format "Thu Feb 20 14:50:00 1997".

-c     **cats the jobs listed on the command line to standard output.**

systemctl status atd

---

The result of the command specified by the at command will be printed to
standard output (stdout) and standard error (stderr) streams, which by default
are redirected to the user's email account. If the user does not have an email
account set up, the output will be discarded.

To redirect the output of the command to a file or another destination, you can
use standard shell redirection operators such as >, >>, or 2>&1.



1) 时间规范的确切定义可以在/usr/share/doc/at-3.1.13/timespec中查看；

2）默认情况下计划任务都是存放在/var/spool/at/文件夹中；

3) root用户可以在任何情况下使用at命令，而其他用户使用at命令的权限定义在
    /etc/at.allow（被允许使用计划任务的用户）和/etc/at.deny（被拒绝使用
    计划任务的用户）文件中，默认没有文件需要自己创建允许用户和拒绝用户文件；

4）如果/etc/at.allow文件存在，只有在该文件中的用户名对应的用户才能使用at；

5）如果/etc/at.allow文件不存在，/etc/at.deny存在，所有不在/etc/at.deny文件中的用户可以使用at；

6）at.allow比at.deny优先级高，执行用户是否可以执行at命令，先看at.allow文件中有没有才看at.deny文件；

7）如果/etc/at.allow和/etc/at.deny文件都不存在，则只有root用户能使用at；

8）一个空内容的/etc/at.deny表示任何用户都能使用at命令，这是默认的配置；

9）一般情况下这两个文件存在一个即可。如果只有少数几个用户需要使用计划任务，
    那么就保留at.allow文件，如果大部分用户都要使用计划任务，那么保留at.deny即可。

## 关于时间

[[CC]YY]MMDDhhmm[.ss]

"CYYMMDD" 格式是"CCYYMMDD" 格式演化而来的，为"CCYYMMDD" 格式的简写。

YYYY-MM-DD ： 四位的年份-两位的月份-两位的天

CCYY-MM-DD ： CC为century世纪，YY 两位的年份，MM 和 DD 表示月和天

在一些系统或项目中，会将CC简写为C，这样世纪的位上便缺了一位，这样如何用一位来表达世纪呢？

1900 ~ 1999 时 C = 1

2000 ~ 2099 时 C = 2

2100 ~ 2199 时 C = 3

注：这里一位的C具体哪个数字代表哪个世纪需看系统的定义，无固定的说法

The definition of the time specification can be found in
/usr/share/doc/at/timespec.

### 使用案例

三天后的下午5点
    at 5pm+3 days

明天17点钟
    at 17:00 tomorrow

显示已经设置的任务内容
    atq
    at -c 2

一分钟后执行/tmp/date文件中的内容
    cat /tmp/date                                       #查看/tmp/date文件中内容

    ```
    #!/bin/bash
    date "+%F %T" > /root/date.log
    ```

    [root@vms002 /]# at -f /tmp/date now +1 minutes     #设置1分钟后执行/tmp/date文件中的内容
    job 4 at Tue Jun 11 15:47:00 2019
    [root@vms002 /]# atq                                #查看计划任务是否设置成功

batch
    uptime
    12:57:06 up  5:41,  3 users,  load average: 0.00, 0.01, 0.05  #好吧，现在几乎没有负载

    [root@localhost ~]# batch 
    at> /usr/bin/updatedb
    at> <EOT>
    job 12 at Mon Sep  4 12:51:00 2017

    同样batch同样也可以使用atq和atrm来管理。

## atd

-l      Specifies a limiting load factor, over which batch jobs should not be
run, instead of the compile-time choice of 1.5.  For an SMP system with n CPUs,
you will probably want to set this higher than n-1.

-b      Specify the minimum interval in seconds between the start of two batch
jobs (60 default).

-d      Debug; print error messages to standard error instead of using
syslog(3).  This option also implies -f.

-f      Run atd in the foreground.

-s      Process the at/batch queue only once.  This is primarily of use for
compatibility with old versions of at; atd -s is equivalent to the old atrun
command.

FILES

    /var/spool/cron/atjobs The directory for storing jobs; this should be mode
    700, owner daemon.

    /var/spool/cron/atspool The directory for storing output; this should be
    mode 700, owner daemon.

    /etc/at.allow, /etc/at.deny determine who can use the at system.

