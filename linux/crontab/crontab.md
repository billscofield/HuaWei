
实例

```
每月每天每小时的第 0 分钟执行一次 /bin/ls
0 * * * * /bin/ls

在 12 月内, 每天的早上 6 点到 12 点，每隔 3 个小时 0 分钟执行一次 /usr/bin/backup
0 6-12/3 * 12 * /usr/bin/backup

周一到周五每天下午 5:00 寄一封信给 alex@domain.name
0 17 * * 1-5 mail -s "hi" alex@domain.name < /tmp/maildata

每月每天的午夜 0 点 20 分, 2 点 20 分, 4 点 20 分....执行 echo "haha"
20 0-23/2 * * * echo "haha"


下面再看看几个具体的例子：

意思是每两个小时重启一次apache 
0 */2 * * * /sbin/service httpd restart


意思是每天7：50开启ssh服务 
50 7 * * * /sbin/service sshd start


意思是每天22：50关闭ssh服务 
50 22 * * * /sbin/service sshd stop


每月1号和15号检查/home 磁盘 
0 0 1,15 * * fsck /home


每小时的第一分执行 /home/bruce/backup这个文件 
1 * * * * /home/bruce/backup  


每周一至周五3点钟，在目录/home中，查找文件名为*.xxx的文件，并删除4天前的文件。
00 03 * * 1-5 find /home "*.xxx" -mtime +4 -exec rm {} \;  


意思是每月的1、11、21、31日是的6：30执行一次ls命令**
**30 6 */10 * * ls
```


当程序在你所指定的时间执行后，系统会寄一封信给你，显示该程序执行的内容，若是你
不希望收到这样的信，请在每一行空一格之后加上 > /dev/null 2>&1 即可



## crontab -e 和 /etc/crontab

1. systemctl status cron.service

1. 修改/etc/crontab这种方法只有root用户能用

1. crontab -e 会进行语法检查，vi 不会

1. crontab -e这种所有用户都可以使用，普通用户也只能为自己设置计划任务。被写到
   /var/spool/cron 目录下，生成一个和用户名一致的文件，文件内容就是我们编辑的定
   时脚本。

1. crontab -e 与 /etc/crontab 修改语法格式不一样，后者多一个 user 指定

    ` 0 12 * * * root -n 19 /usr/bin/ls

    分时日月周   用户(不可省略)   参数设定值   参数设定值   指令段

1.  不管用 crontab -e or 改 /etc/crontab 都不需要重新启动 crond 服务


1. run-parts
    
    其实是一个 bash script, which run-parts: /usr/bin/run-parts

    run scripts or programs in a directory


    ` 01 * * * * root   nice   -n   19     run-parts   /etc/cron.hourly
    
    在#run-parts这一行以后的命令，我们可以发现，5个数字后面接的是root，这代表执
    行的层级为root身份。当然，您也可以root改成其他身份，
    
    run-parts表示后面接的是/etc/cron.hourly是一个目录内（/etc/cron.hourly)的所
    有可执行文件，也就是说每个小时的01分，系统会以root的身份到/etc/cron.hourly
    目录下执行所有可以执行的文件。
    
    系统本来就默认了这4个目录，您可以将每天需要执行的命令直接写到
    /etc/cron.daily中，还不需要用到crontab -e程序，很方便。


1. crontab -r  ：移除所有的 crontab 的工作内容，若仅要移除一项，请用 -e 去编辑

1. crontab的限制

　　/etc/cron.allow：将可以使用 crontab 的帐号写入其中，若不在这个文件内的使用者则不可使用 crontab；

　　/etc/cron.deny：将不可以使用 crontab 的帐号写入其中，若未记录到这个文件当中的使用者，就可以使用 crontab 。




```
*(星号)     
            代表任何时刻都接受的意思！举例来说，范例一内那个日、月、周都是 * ，
            就代表著『不论何月、何日的礼拜几的 12:00 都运行后续命令』的意思！

,(逗号)     代表分隔时段的意思。举例来说，如果要下达的工作是 3:00 与 6:00 时，就会是：
            0 3,6 * * * command
            时间参数还是有五栏，不过第二栏是 3,6 ，代表 3 与 6 都适用！

-(减号)     代表一段时间范围内，举例来说， 8 点到 12 点之间的每小时的 20 分都进行一项工作：
            20 8-12 * * * command
            仔细看到第二栏变成 8-12 喔！代表 8,9,10,11,12 都适用的意思！

/n(斜线)    那个 n 代表数字，亦即是『每隔 n 单位间隔』的意思，例如每五分钟进行一次，则：
            */5 * * * * command
            很简单吧！用 * 与 /5 来搭配，也可以写成 0-59/5 ，相同意思！
```


1. 周与日月不可同时并存

另一个需要注意的地方在於：『你可以分别以周或者是日月为单位作为循环，但你不可使
用「几月几号且为星期几」的模式工作』。 这个意思是说，你不可以这样编写一个工作排
程：

30 12 11 9 5 root echo "just test"   <==这是错误的写法

 本来你以为九月十一号且为星期五才会进行这项工作，无奈的是，系统可能会判定每个星
 期五作一次，或每年的 9 月 11 号分别进行，如此一来与你当初的规划就不一样了
