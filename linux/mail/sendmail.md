apt install sendmail

/etc/mail
    sendmail.mc 主配置文件,用命令生成 .fc 文件，先备份 
    sendmail.fc 先备份

    cp sendmail.mc sendmail.mc.back
    cp sendmail.fc sendmail.fc.back

/etc/mail/local-host-names  邮件服务器别名
    echo 'liujiao.cn'>>/etc/mail/local-host-names

修改监听地址, 默认监听 127.0.0.1
    /etc/mail/sendmail.mc
        Addr=127.0.0.1 -> Addr=0.0.0.0



