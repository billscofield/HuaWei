UUCP:   Unix to Unix CoPy
        Unix主机复制文件的协议, 太过简单，所以有了SMTP

MTA
SMTP：  从一个主机传到另一个主机
        具有路由功能

~/mbox


open relay 开放中继




Postfix is a Mail Transfer Agent(MTA)——that is, software that mail servers use to route mail.
    compatible with sendmail
    easy to config
    secure
    realibity(可靠性)

    written by security expert Wietse Venema

SASL:   Security Layer Secure Layer 简单认证安全层
        通过添加组件实现访问 MySQL 数据库

TLS:    Transport Layer Security(TLS, an upgrade of SSL)






unsolicite 来路不明的
spam    垃圾邮件
spam blocking



An MTA generally accepts messages for
its own local users; for other systems it knows how to forward to; or for messages
from users, systems, or networks that are allowed to relay mail to other destinations.

---
The Simple Mail Transport Protocol (SMTP) is used for sending messages, 

describes the conversation that
takes place between two hosts across a network to exchange email messages


---
and either
the Post Office Protocol (POP) or Internet Mail Application Protocol (IMAP) is used
for retrieving messages.

describe how to retrieve messages
from a message store


---
Note that the MUA does not necessarily use the same system for POP/IMAP as it
does for SMTP, which is why email clients have to be configured separately for
POP/IMAP and SMTP


---
SMTP had no means to authenticate users, but exten-
sions to the protocol provide the capability


POP users generally take all their messages from the
server and manage their mail locally. 

IMAP provides features that make it easier to
manage mail on the server itself.

---
Abelard’s Postfix server accepts the message and stores it until
Abelard is ready to pick it up. At this point Postfix’s job is done. When Abelard is
ready to retrieve his messages, 

his email client, using POP or IMAP, picks up
Heloise’s message.

---
A chroot establishes a new root directory for a running application such
as /var/spool/postfix . When that program runs, its view of the filesystem is limited
to the subtree below /var/spool/postfix , and it cannot see anything else above that
point.


---
Read through the RELEASE_NOTES file that comes with the package to
learn what the differences are between the current official and experimental releases.

---
Some Postfix configuration parameters
require UIDs rather than login names when referring to user accounts.


---
A pseudo-account is a normal Unix system account except that it does not permit
logins. These accounts are used to perform administrative functions or to run pro-
grams under specific user privileges.


For Postfix administration, you need
at least one pseudo-account for Postfix processes to run under. You may need addi-
tional ones for other functions, such as mailing-list programs and filters.


---
The two most commonly ref-
erenced RFCs for email are RFC 821 and RFC 822, which deal with how email mes-
sages are transferred between systems, and how email messages should appear.


---
RFC documents are maintained
by the Internet Engineering Task Force


---
MUA Mail User Agent 

Email client software used to [compose, send, and retrieve] email messages.
Sends messages through an MTA. Retrieves messages from a mail store either
directly or through a POP/IMAP server.


MTA Mail Transfer Agent 

Server that [receives and delivers] email. Determines message routing and pos-
sible address rewriting. Locally delivered messages are handed off to an MDA
for final delivery.


MDA Mail Delivery Agent 

Program that handles final delivery of messages for a system’s local recipients.
MDAs can often filter or categorize messages upon delivery. An MDA might
also determine that a message must be forwarded to another email address.

---
An email administrator is commonly referred to as a postmaster


The MTA that accepts a message takes responsibility for the message until it is deliv-
ered or handed off to another MTA. 



the To: address in
email message headers has nothing to do with where a message is actually delivered.

The delivery of a message is determined by the addresses specified
during the SMTP conversation. 


The local part is sometimes referred to as the lefthand side (LHS), and the domain is
sometimes called the righthand side (RHS)


Since RFC 822 was the document that originally described how Internet email mes-
sages should be formatted, messages are commonly referred to as “in the RFC 822
format” or as an “RFC 822 message.”


The header fields are separated from the message body by an empty line. 



/etc/postfix/main.cf
    myhostname = 
    mydomain = 
    myorigin =              //邮箱后缀,跟domain保持一致
    inet_interfaces = all   //监听所有网卡
    inet_protocol = ipv4
    mydestination = 
    mynetworks =               //信任客户端
    relay_domain            //转发邮件域名
    alias_maps              //邮件别名的路径
   



## 邮件报警
https://www.php.cn/code/24987.html
postfix
dovecot


---
LDAP : lightweight Directory Access Protocol
    读快写慢
    管理起来比较复杂
    windows域


虚拟账号
    不能登录系统

sasl:(使用的是v2版本)
    cyrus-sasl
    courier-authlib

MDA
    sendmail    使用 procmail
    maildrop


MRA
    cyrus-imap
    dovecot

MUA
    mutt(文本界面)

webmail
    openwebmail
    squirrelmail(centos 自带)
    Extmail
        商业化软件, 有开源版
        定制的centos 叫做 EMOS






postfix + sasl(courier-authlib) + mysql

dovecot + mysql

extmail + extman + httpd



centos自带的不支持虚拟认证，所以要用源码安装

service sendmail stop
chkconfig sendmail off
apt remove --purge sendmail








