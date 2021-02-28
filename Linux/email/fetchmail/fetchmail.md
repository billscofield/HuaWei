apt install fetchmail


配置文件 ~/.fetchmail

mod 600 ~/.fetchmailrc


/etc/default/fetchmail

    ```
    #Declare here if we want to start fetchmail. 'yes' or 'no'
    START_DAEMON=yes
    ```

systemctl status fetchmail



https://www-uxsup.csx.cam.ac.uk/pub/doc/redhat/redhat7.3/rhl-rg-en-7.3/s1-email-fetchmail.html

https://calomel.org/fetchmailrc.html

Fetchmail is the program that one uses to "fetch" mail off of a pop3 or pop3s server. Below is an example of a usable .fetchmailrc config file. You can cut and paste this into your .fetchmailrc file without issue.

```
#### .fetchmailrc

set daemon 600
set logfile fetchmail.log

poll the_isp_mail_server proto POP3
user "remote_username" pass "PASSWORD=" is "local_username" preconnect "date >> fetchmail.log"
#ssl
fetchall
no keep
no rewrite
mda "/usr/bin/procmail -f %F -d %T";
```

Looking at the fetchmail options

1. set daemon 600 The fetchmail binary with run in the background in daemon mod and fetch mail from the server every 600 seconds or 10 minutes.

1. set logfile fetchmail.log This will set the directory and file name of the fetchmail user log file. Eveytime fetchmail recieves an email, checks the pop3 server or errors out you will find an entry here.

1. poll the_isp_mail_server proto POP3 This line tells fetchmail what mail server to contact, in theis case "the_isp_mail_server" and to use the "POP3" protocol.

1. user "remote_user_name" pass "PASSWORD" is "local_username" preconnect "date >> fetchmail.log The user directive tells fetchmail what the name of the user on the remote mail server is for example "remote_user_name". The pass directive is simply the password you will use for the remote user on the mail server. The "is" directive is optional. It tells fetchmail to deliver mail to a diferent user name if the user on the remote mail server and the local machine are different. For example, I may be using the name "joe.doe" on the mail server, but my local user name is "jdoe". I would use a line like user "joe.doe" pass "PASSWORD" is "jdoe". The preconnect command simply adds the current time and date to the fetchmail log file every time fetchmail checks for new mail.

1. ssl The "ssl" directive tells fetchmail to use encryption when connecting to the pop3 mail server. Fetchmail will use port 995 instead of port 110 for un-encypted mail communication. In order to use ssl the remote mail server must be able to use ssl. Comment out this directive if you do _not_ use pop3s.

1. fetchall Fetchall just means to fetch all of the mail on the mail server no matter what the "read" flag is. It is possibly to read mail through many different processes. If you use another mail client from another location, for example you could have read you mail and kept it ont he server, but marked it with the "read" flag. At this point if you did _not_ use the "fetchall" flag then only mail marked as new would be downloaded.

1. no keep Once the mail is downloded from the mail server fetchmail is to tell the server to remove it from the server. You may choose to comment this option out if you want to leave all mail on the server.

1. no rewrite Do not rewrite headers. When fetchmail recieves the mail you do not want any of the headers mangled in any way. This directive tells fetchmail to leave the headers alone.

1. mda "/usr/bin/procmail -f %F -d %T"; The mda is your "mail delivery agent. Procmail is the program that fetchmail will hand the mail off to once it is downloaded. The argument "-f %F" logs who the mail if from and "-d %T" turns on explicit delivery mode, delivery will be to the local user recipient.







``` imap 的可以使用但是也有问题
poll imap.yeah.net protocol IMAP
user "zabbix_sender@yeah.net"
password "FULLECVMSVNBSDJH"
folder "INBOX"
keep
ssl

set no bouncemail

# 反垃圾邮件
antispam -1

batchlimit 100

#mimedecode
#mda "/usr/bin/procmail"
```

报错信息:

    fetchmail --user zabbix_sender imap.yeah.net
    Enter password for zabbix_sender@imap.yeah.net:
    fetchmail: mailbox selection failed
    fetchmail: client/server synchronization error while fetching from zabbix_sender@imap.yeah.net

