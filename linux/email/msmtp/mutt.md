links:

    https://blog.csdn.net/weixin_34279579/article/details/88581554

    https://blog.csdn.net/maxwit_john_huang/article/details/9449741


    https://wiki.archlinux.org/index.php/mutt

## Mutt 框架

Mutt本身是一个框架而已。收件、发件、编辑邮件等功能，是要通过搭配不同的程序来做到的。

就像穿衣搭配一样，收件发件过滤邮件转发邮件各种功能都有很多种程序可以用，mutt怎么搭配呢？

常用选项有这些(User/Transport/Delivery)：

    1. MUA 收件：fetchmail或getmail或OfflineIMAP

    1. MTA 发件：sendmail或msmtp或postfix。其中msmtp兼容强，postfix对国内不友好

    1. MDA 分类: procmail或maildrop

    1. 邮件编辑：VIM。


一般搭配是：

老式搭配：mutt + getmail + sendmail + procmail

新式搭配：mutt + fetchmail + msmtp + maildrop

但是maildrop不支持Mac，而procmail比较通用一点。所以这里我们用：

    mutt + fetchmail + msmtp + procmail

    apt-get install mutt fetchmail msmtp procmail -y

Mutt或各个写协作程序在配置前都是不能使用的，学习曲线还是比较陡峭的，所以要做好准备去花好一段去了解和学习各个部件。

大概的配置流程是：

    配置收件：~/.fetchmailrc

    配置过滤：~/.procmailrc

    配置发件：~/.msmtprc

    配置mutt框架本身：~/.muttrc

注意：初学过程中，不要一上来就配置mutt。最好是先从各个部件开始：收件->过滤邮件->阅读邮件->发件->mutt界面，按照这种顺序。



## 处理流程原理

1. 收件：配置Fetchmail

    Fetchmail是一个非常简单的收件程序，而且是前台运行、一次性运行的，意思是：你每次手动执行fetchmail命令，都是在前台一次收取完，程序就自动退出了，不是像一般邮件客户端一直在后台运行。

    注意：fetchmail只负责收件，而不负责存储！所以它是要调用另一个程序如procmail来进行存储的。

    fetchmail的配置文件为~/.fetchmailrc。然后文件权限最少要设置chmod 600 ~/.fetchmailrc

    参考: https://www.linode.com/docs/email/clients/using-fetchmail-to-retrieve-email/

    ```
    比如我们要设置多个邮箱账户同时收取，那么配置如下：

    poll pop.AAA.com protocol POP3 user "me@AAA.com" password "123"
    poll pop.BBB.com protocol POP3 user "me" there with password "123" is falko here fetchall
    poll pop.CCC.com protocol POP3 user "me" there with password "123" is till here keep
    poll pop.DDD.com
        protocol POP3
        user "me"
        password "123"
           
            
    # 全局选项
    mimedecode
    mda "/usr/local/bin/procmail"
    ```

    其中，

    1. 各种参数可以不按顺序，也可以不在一行。 空格隔开每个参数，poll隔开每个账户。
    1. here, there, with, is等等，都不是关键词，随便写不影响参数。
    1. poll后面是邮件服务器的地址，一般是pop.xxx.com
    1. protocol后面是收件协议，一般是pop或pop3
    1. user后面是用户名，可以是username，也可以是邮箱地址
    1. password后面是密码
    1. 以上是必填，其它都不是必要的
    1. 四选一：fetchall, nofetchall, keep, nokeep
    1. mimedecode用来自动解码MIME
    1. mda后面指定本机安装的邮件过滤分类程序。如果不填，则收取的邮件在本地不会保存。可以用$ which procmail查一下路径。

    配置完成后，可以运行fetcmail -v来看看是否有错误信息，如果能够正常显示很多行的收取信息，那么就能正确登录邮箱收取了。

    一般收取的命令如下：

    ```
    # 只收取未读邮件
    $ fetchmai
    
    # 收取所有邮件
    $ fetchmail -a
    
    # （重要）收取新邮件，但不在服务器端删除已经收取的邮件
    $ fetchmail -k
    ```

    但是fetchmail只负责收取，不负责“下载”部分，你找不到邮件存在哪了。

    所以还需要配置MDA分类器，如procmail，才能看到下载后的邮件。

    注意：Fetch其实不是在Mutt“里”使用的，而是脱离mutt之外的！也就是说，Mutt只负责读取本地存储邮件的文件夹更新，而不会自动帮你去执行 fetchmail命令。
    你必须自己手动执行，或者用Crontab定期收取，或者设为Daemon守护进程，还可以在Mutt中设置快捷键执行Shell命令。

    设置Mutt快捷键收取邮件的方法是在~/.muttrc中加入macro：

    macro index,pager I '<shell-escape> fetchmail -vk<enter>'
    这样的话，你就可以在index邮件列表中按I执行外部shell命令收取邮件了。

1. 邮件过滤：配置Procmail

    Procmail是单纯负责邮件的存储、过滤和分类的，一般配合fetchmail收件使用。

    在Pipline中，fetchmail把收到的邮件全部传送到Procmail进行过滤筛选处理，然后Procmail就会把邮件存到本地形成文件，然后给邮件分类为工作、生活、重要、垃圾等。

    当然，分类规则是自己可以指定的。可以根据发信人、主题、长度以及关键字 等对邮件进行排序、分类、整理。

    参考：Procmail
        http://lifegoo.pluskid.org/wiki/Procmail.html

    Procmail 的配置文件是 ~/.procmailrc ，记得改权限：chmod 600 ~/.procmailrc。
    内容也非常简单，前面是邮件位置、日志等默认选项，后面则是一块一块的过滤规则。

    基本配置：

    ```
    MAILDIR=$HOME/Mail   #邮件存储地址
    DEFAULT=$MAILDIR/inbox   #默认：收件箱
    VERBOSE=off
    LOGFILE=/tmp/procmaillog
    
    # 某个垃圾邮件规则
    :0
    * ^From: webmaster@st\.zju\.edu\.cn
    /dev/null    #垃圾文件的存储位置
    
    # 其它所有都存到收件箱中
    :0:
    inbox/
    ```

    其中，$HOME/Mail是设定的邮件存储位置。
    我们需要手动创建mkdir ~/Mail，否则程序会报错。

    配置好后，我们再测试一下，假设邮箱里有一封未读邮件，就会看到：

    $ fetchmail
    1 message for Jason@aliyun.com at pop3.aliyun.com (7833 octets).
    reading message Jason@aliyun.com@pop3.aliyun.com:1 of 1 (7833 octets) flushed


    ```
    $ tree ~/Mail
    /Users/Jason/Mail
    └── inbox
        ├── cur
            ├── new
                │   └── 1549706227.89809_0.Jason-mba.lan
                    └── tmp

    ```

    可以看到，一封新邮件保存到了~/Mail/inbox/new/中，文件为1549706227.89809_0.Jason-mba.lan。但是手动打开以后是一堆代码

    这个实际上就是邮件的真面目：MIME格式(协议)的邮件源码。就像HTML一样，展示给我们的和背后的源码不一样。

    那么怎么把这个类似HTML的MIME格式邮件解析为我们人能读懂的内容呢？
    这个我们就要靠mutt自己了，mutt自身具备基本的MIME邮件解析功能（不包括HTML格式邮件读取）。

    但是这里我们先不讲邮件阅读的问题，把它留在最后。


1. 发件：配置msmtp

    msmtp是作为替代sendmail发邮件程序的更好替代品。

    msmtp的配置文件为~/.msmtprc，记得改权限：chmod 600 ~/.msmtprc

    配置内容比收件还简单，因为发件永远比收件简单。

    基本配置：

    ```
    account default
      auth login
      host smtp.XXX.com
      port 587
      from ME@XXX.com
      user ME
      password passwd
      tls on
      tls_certcheck off
     
      logfile /tmp/msmtp.log
    ```

    其中注意，关于tls，如果是阿里云则不用写，如果是Outlook的话，必须写：

    ```
    tls on
      tls_starttls on
      tls_certcheck off
    ```

1. 主界面：配置Mutt

    Mutt的配置文件为~/.muttrc，记得改权限：chmod 600 ~/.muttrc

    基本配置：

    ```
    # 通用设定
    set use_from=yes
    set envelope_from=yes
    set move=yes    #移动已读邮件
    set include #回复的时候调用原文
    set charset="utf-8"
    auto_view text/html   #自动显示HTML
    
    # 发送者账号
    set realname="Solomon Xie"
    set from="solomonxie@aliyun.com"
    
    # 分类邮箱
    set mbox_type = Maildir             #Mail box type
    set folder = "$HOME/Mail"
    set spoolfile = "$HOME/Mail/inbox"  #INBOX
    set mbox="$HOME/Mail/seen"          #Seen box
    set record="$HOME/Mail/sent"        #Sent box
    set postponed="$HOME/Mail/draft"    #Draft box
    
    # 关联程序（需要自己用which命令确定一下）
    set editor="vim -nw"
    set sendmail="/usr/local/bin/msmtp"
    ```



### msmtp

apt isntall msmtp 

https://www.systutorials.com/docs/linux/man/1-msmtp/


mutt
