postfix带有自己的MDA

sendmail 的MDA是procmail

maildrop 很强大的一个(postfix的默认？？？)

MRA的程序
    cyrus-imap
    dovecot

    mutt(文本界面)

webmail
    openwebmail
    squirrelmail(red hat自带 php)
    extmail(extman,有商业版)
        extmail OS   (emos)


sasl:有v1和v2版本, 认证框架，协议
    saslauthd(cyrus-sasl软件)
    courier-authlib

---

postfix + sasl 

dovecot(可以做认证) + mysql

webmail
    extmail + extman + httpd



service sendmail stop 
chkconfig sendmail off
apt remove --purge sendmail(shendmail有多个组件，看有哪些)


postfix.org 下载源代码

less install

groupadd -g 2525postfix
useradd -g postfix -u2525 -s /sbin/nologin -M postfix


MRA(maildrop???)
group add -g 2526 postdrop
useradd -g postdrop -u 2526 -s /sbin/nologin -M postdrop


make makefiles 'CCARGS=-DHAS_MYSQL -I/usr/include/mysql -DUSE_SASL_AUTH -DUSE_CYRUS_SASL -I/usr/include/sasl -DUSE_TLS '
    'AUXLIBS=-L/usr/lib/mysql -lmysqlclient -lz -lm -L/usr/lib/sasl2 -lsasl2 -lssl -lcrypto'
(smtp smtps
pop3    pop3s   比较使用
imap    imaps   不实用，TLS就是这个imaps
)
make 
make install
    在这个步骤中指定安装位置

确保安装了sasl2

install_root:[/]
tempdir:[/root/postifx-2.9]  /tmp/postfix
config_directory:[/etc/postfix]
daemon_directory:[/usr/libexec/postfix]    daemon程序
data_directory:[/var/lib/postfix]
html_directory:[no]
command_directory:[/usr/sbin]
sendmail_path:[/usr/sbin/sendmail]
    
newaliases_path:[/usr/bin/newaliases]
mail_q_path:[/usr/bin/mailq]
queue_directory:[/var/spool/postfix]
    有多个子目录
mail_owner:[postfix]
setgit_group:[postdrop]
manpage_directory:[/usr/local/man]
readme_directory:[no]

---
邮件别名
a@a.com     b@a.com
发往a@a.com的邮件实际全都发到了b@a.com

/etc/aliases -> has /etc/aliases.db

这个命令是 newaliases

newaliases

---

postfix start

tail /var/log/maillog



master.cf
    /etc/postfix/master.cf

main.cf
    /etc/postfix/main.cf


    postconf 命令
        postconf -d     显示默认的设置
        postconf -n     修改了的配置
        postconf -m     查找表类型（虚拟用户)
        postconf -M     master.cf
        postconf -A     支持的sasl 客户端插件类型
        postconf -e     edit main.cf
            postconf -e name=value
        




helo
    helo localhost
mail from   可以不写或乱写
    mail from: bill@bill.com
    mail from: root
rcpt to     rcpt stands for recipient and is the address where the mail is sent
    rcpt to: liujiao
data        邮件正文
.           表示正文结束
Subject:主题


状态码
    1xx     纯信息
    2xx     正确
    3xx     上一步操作尚未完成
    4xx     暂时性错误
    5xx     永久性错误



postfix 把本机的IP地址所在的网段识别为本地网络，并且为之中继邮件
