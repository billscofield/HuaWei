


## 失败登录

发现服务器存在 ssh 攻击，需要统计攻击者的ip和次数，统计命令如下

centos : /var/log/secure

debian : /var/log/auth.log    // 查看rsyslog的配置文件 /etc/rsyslog.conf

    ```
    cat /var/log/secure | awk '/Failed/{print $(NF-3)}' | sort | uniq -c | awk '{print $2" = "$1;}'

    ```



rsyslogd - reliable and extended syslogd

syslog
    closelog, openlog, syslog, vsyslog - send messages to the system logger


