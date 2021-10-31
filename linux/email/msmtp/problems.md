如何发邮件

1. msmtp 收信人邮件

    输入内容后，ctrl d

1. echo 重定向

    echo -e "Subject: Test Mail\r\n\r\nThis is my first test email." |msmtp --debug --from=default -t vikrantgoutam16@gmail.com

---

command not found: updatedb

apt install mlocate && updatedb

---

msmtp cannot write to /var/log/msmtp/msmtp.log

[solutions]:
I had the same error message, and ultimately changing permissions, creating the log file, etc., didn't work. The problem in my case was caused by AppArmor: in my system, the file /etc/apparmor.d/usr.bin.msmtp only listed /var/log/msmtp as write permission in /var/log, so solution can be:

to use /var/log/msmtp as log in the configuration, instead of /var/log/msmtp.log
modify the rules in the msmtp apparmor profile to allow adding and locking the file we want.

https://askubuntu.com/questions/878288/msmtp-cannot-write-to-var-log-msmtp-msmtp-log

---

Server sent empty reply
If you get a "server sent empty reply" error, this probably means the mail server doesn't support STARTTLS over port 587, but requires TLS over port 465.

To let msmtp use TLS over port 465, add the following line to ~/.msmtprc:

tls_starttls off

---

MAIL FROM command failed: 553 Mail from must equal authorized user
imsmtp: envelope from address zabbix_sender@yeah.com not accepted by the server
msmtp: server message: 553 Mail from must equal authorized user

user zabbix_sender 修改为 user zabbix_sender@yeah.com
https://wordpress.org/support/topic/mail-from-command-failed-553-mail-from-must-equal-authorized-user/


https://stackoverflow.com/questions/55698475/having-authentication-error-while-using-msmtp


修改 ~/.msmtprc 权限为600后


使用 auth plain 的认证方式

pass=$(echo -ne "\0username\0password"|base64)

helo 
auth plain
输入 pass


---


echo -e "Subject: Test Mail\r\n\r\nThis is my first test email." |msmtp --debug --from=default -t zabbix_receiver@yeah.com | tee a.log

日志文件中: **passwordeval = (not set)**

To avoid saving the password in plain text in the configuration file, use passwordeval to launch an external program, or see the #Password management section below. This example using Gnu PG is commonly used to perform decryption of a password:

 echo -e "password\n" | gpg --encrypt -o .msmtp-gmail.gpg # enter id (email...)

 https://wiki.archlinux.org/index.php/Msmtp





