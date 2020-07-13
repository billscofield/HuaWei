
/usr/lib/systemd/system

lrwxrwxrwx 1 root root  15 Apr 28 01:02 runlevel0.target -> poweroff.target
lrwxrwxrwx 1 root root  13 Apr 28 01:02 runlevel1.target -> rescue.target
lrwxrwxrwx 1 root root  17 Apr 28 01:02 runlevel2.target -> multi-user.target
lrwxrwxrwx 1 root root  17 Apr 28 01:02 runlevel3.target -> multi-user.target
lrwxrwxrwx 1 root root  17 Apr 28 01:02 runlevel4.target -> multi-user.target
lrwxrwxrwx 1 root root  16 Apr 28 01:02 runlevel5.target -> graphical.target
lrwxrwxrwx 1 root root  13 Apr 28 01:02 runlevel6.target -> reboot.target

lrwxrwxrwx 1 root root 16 Apr 28 01:02 default.target -> graphical.target

查看默认启动级别

    systemctl get-default

设置默认启动级别

    systemctl set-default


    ```/usr/lib/systemd/system/ssh.service
    [Unit]
    Description=OpenBSD Secure Shell server
    Documentation=man:sshd(8) man:sshd_config(5)
    After=network.target auditd.service
    ConditionPathExists=!/etc/ssh/sshd_not_to_be_run

    [Service]
    EnvironmentFile=-/etc/default/ssh
    ExecStartPre=/usr/sbin/sshd -t
    ExecStart=/usr/sbin/sshd -D $SSHD_OPTS
    ExecReload=/usr/sbin/sshd -t
    ExecReload=/bin/kill -HUP $MAINPID
    KillMode=process
    Restart=on-failure
    RestartPreventExitStatus=255
    Type=notify
    RuntimeDirectory=sshd
    RuntimeDirectoryMode=0755

    [Install]
    WantedBy=multi-user.target
    Alias=sshd.service
    ```
